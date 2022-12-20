Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CADFC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Dec 2022 09:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zvnXxve2nUscwzlnbyof3K5L1inKPzyXccTvur+lYF8=; b=DAdVNmLG6cqycQpLbXjjnTGWs5
	aHRAKTUCbilMYNxn5tbv8jxvnp//Jj+Wbr7dGLrqk4GXYTz0gcPhA0e3tePzLSCndueVdlAi7l3zG
	iVtylrVxUWS1qvPDypk7X5f6KxmC9KSeAHb+norbYWBMr1b6fOFELPP6Xs9sWm3ZNinC0MVC0S3Hl
	8r8eQfK8UFn4UhE0vkwRa8T+LrWy8loxuqMvUKBEboO3C189q77YJIkbKOFU6AGX8QPGOkzish3U8
	+6pLcuYPHsWO2HYFMr8eqV4IaASceV8I4CLFxGr5RG2tcGcVV2XJfXTobBLfNbgjIFPxscdSeVKIX
	B2hP21fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7ZBt-00D0h3-7e; Tue, 20 Dec 2022 09:45:41 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7Yzk-00Ctue-2P; Tue, 20 Dec 2022 09:33:11 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D49096602CAA;
	Tue, 20 Dec 2022 09:33:05 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1671528786;
	bh=SvDbPz+RrEEtlgfXS0P2/phM+noTxSmikcCVRsTsc2c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=chu94V1SVD3MLNJbUfSOJVWIjTH7nT13M8ayXEtEEKTwDzhOtsFbU8xHn8eTVy7OX
	 CZ4/iRuY4DGEwx3ugh6cLw/XiS/k5k9akd2R0RsoueUTy7WzIZ0/7OGd8GMg/GTxn+
	 E4HEOgVYhFOrx+oDyToLndB2b3xku7YKxp4wZDUhJ0PvtoaDFChjxSKLM5CtBGAaKA
	 KlrE7QoXCnRshQDFL2uv/wJ9v6uafN4y9xghTkyJSEVaDmZsMTQI/dgkTfY29SeIuL
	 sUY0AqWIvb3+8YiHWeKrx8MeMt2fO1VNxRSaI0/PlhPRau2X8xgLCHIGr2Clo2oY15
	 P27TfXquIl1EA==
Message-ID: <a985b725-6a46-57ae-129c-d395961e797d@collabora.com>
Date: Tue, 20 Dec 2022 10:33:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2,2/7] media: mediatek: vcodec: using each instance
 lat_buf count replace core ready list
Content-Language: en-US
To: Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai
 <wenst@chromium.org>, Nicolas Dufresne <nicolas@ndufresne.ca>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Hsin-Yi Wang
 <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221219064332.2124-1-yunfei.dong@mediatek.com>
 <20221219064332.2124-3-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221219064332.2124-3-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_013308_309968_C52B1E5D 
X-CRM114-Status: UNSURE (   8.13  )
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

Il 19/12/22 07:43, Yunfei Dong ha scritto:
> Core Hardware decoder depends on each instance lat_buf count,
> calling queue_work decode again when the lat_buf count of each instance
> isn't zero.
> 
> Fixes: 365e4ba01df4 ("media: mtk-vcodec: Add work queue for core hardware decode")
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



