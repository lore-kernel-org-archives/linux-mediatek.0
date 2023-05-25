Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6556DC7EE2E
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 May 2023 08:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N/ifTiJpCJUUIHeZ0UgMO46fNp22gqLE0Eoes8csjpw=; b=rZL22Ll+sCfnSlSnhZS7VB0QRv
	qbQoszMiaurxLnyySgVMMv6QajNU59/DjBLRnyqmDmT8qHJvUD/zsuXzN0EL6s6Fzx+WZYFSncOFR
	NEYKPtvUsPIpI6pidYpOEDoPlL3LOFvCONa/45xLB+2tOauOC+fbYjdNyUCBmH0DAPm4hX5LyngB0
	CY5Y3WF2mWRtykrH7eNbD6gnmXtcBPSSB1IZj7sS+V9pbSlogacOUPgS1zLLhH98UqF8UdSvmHQrG
	bJwwy66or+jlSjqOKsIVz3g0FBkwub4LWmn19y+4kU1WU6ZpOtzUSjCBH+5dnYrT8Yp0UF0PxMOE0
	R2fKxXJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q265a-00Fw2x-2r;
	Thu, 25 May 2023 08:12:50 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q265X-00Fw0o-0H;
	Thu, 25 May 2023 08:12:48 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 067D76605835;
	Thu, 25 May 2023 09:12:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685002365;
	bh=TcK2/fChHQbciGa6WppN3XkreiKbw8YDT890PFyTALo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JuHzM1OYaoL5FfWPmjozV9vKwhGTr28mcWL1gkElk87Lylsc453P261U7dxp8tLlI
	 xLw3kNh2XUi6TyCRUEpHsehymwuDvRqls2vlwori0e/rjQqAH0PwNEatdjH6NGn+PA
	 6v2Q3zgs09y+UyYz6r5UPc3sp3ZPFaZHLPi6yTgZA6l9NXK2PP1o83fIz5q2R7sF+U
	 e35mHYNYhU7nyQ7jFxido5NNacLqOUr18QJt+gpS0sJwQ85WtWdDTlghCzguxxtCeP
	 O8eogRNJNNefde99VSKnaYpo9FDgKdTDLoLBv8Cvo7GDGWYwK48abo549b1GC09Vb2
	 jjopLKEHD0XMg==
Message-ID: <d370cc1a-9593-bf27-bafb-4deb8a91d308@collabora.com>
Date: Thu, 25 May 2023 10:12:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v4,4/4] media: mediatek: vcodec: using empty lat buffer as
 the last one
Content-Language: en-US
To: Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai
 <wenst@chromium.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230525014009.23345-1-yunfei.dong@mediatek.com>
 <20230525014009.23345-5-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230525014009.23345-5-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_011247_252995_BC2AD4EF 
X-CRM114-Status: UNSURE (   8.59  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 25/05/23 03:40, Yunfei Dong ha scritto:
> Adding one empty lat buffer with parameter 'is_empty_flag = true'
> used to flush core work queue decode.
> 
> Queue the empty lat buffer to core list when driver need to flush decode.
> It's mean core already decode all existed lat buffer when get empty lat
> buffer, then wake up core decode done event, the driver will exit when getting
> core dec done event.
> 
> Fixes: d227af847ac2 ("media: mediatek: vcodec: add core decode done event")
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



