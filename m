Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D62C4321E
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 13:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MeXyPUUzTIRve+Apxk51d0uKTDjfF8rBKnA1i9wCv/8=; b=WlrNznSv3i2sED5G9ZchyNEVoK
	+wqIJJ8nNoPYU5gJBr8T7FSQrtuAXZMenWdNxpdPcmlD3yEgBPzc6umQQbhzlVMmgqGKsa5HlYaTU
	Y74BV3RT5bkecyXJOan1iJ6WPtMCec8lcYGPnrCvoAOXXLMNkqF2JsoBBJx8edJ8AZr++z1IkFu1e
	KEtwjT7EwRKMWFtFym7g6fhogSCsL8uMGALhawrGI+KxeyC/hWX97YDblcgDR5/1JxBQ+IHW+BeIv
	FrlQu5/ZvI4VjQ5oElak0VdvaDC8eRU+CvcsNUJHiGXwndkr9ZWSx5B2UMCIkhobnSPvw0hlQiwfe
	CKnyklTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0jHk-007aC3-E5; Thu, 01 Dec 2022 13:07:28 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0jCC-007SFm-NZ; Thu, 01 Dec 2022 13:01:47 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 759A26602B93;
	Thu,  1 Dec 2022 13:01:38 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669899699;
	bh=mKssGEdRVxdgNBcaWn5E3+Wr/jY93+xbVPtKJORxOHo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=E/KgNEGySjqQPh736Eu5ZL5R3DQnyiK6wL3L57Obg3C2I+tbpXPWLw49VErHbP5CY
	 nzpHzX3yHZwCFjwQM3q6slz4yZeDArt6XoZTvl6wqVevz66XvGm5XAahY8ECdDRBcO
	 YcMHIKvZJBGg7LC7DsjG8WhfcLZPLasnejSgcrtdaYc6xuHKyosG1IhwScasC+9MCn
	 bh2b1oHI5VLs0v+XtP/Y2MWEjL+2PBThJRy+a2NU/RXMDLTSE0JoskGcHbzBHpasha
	 CDPo6X6gRdUy81rJrfMBIbnSZm0YDutNPZe+EGsw8tteOcK7t+sxwxTWPYGI8WldNs
	 CNNaMBliAmMlw==
Message-ID: <e8ab56e4-0148-cb1c-78c8-c6700aa9720c@collabora.com>
Date: Thu, 1 Dec 2022 14:01:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3,2/3] media: dt-bindings: media: mediatek: vcodec:
 Change the max reg value to 2
Content-Language: en-US
To: Yunfei Dong <yunfei.dong@mediatek.com>, Rob Herring <robh@kernel.org>,
 Chen-Yu Tsai <wenst@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Hsin-Yi Wang
 <hsinyi@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221201121525.30777-1-yunfei.dong@mediatek.com>
 <20221201121525.30777-2-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221201121525.30777-2-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_050144_996796_54613C1C 
X-CRM114-Status: UNSURE (   9.29  )
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

Il 01/12/22 13:15, Yunfei Dong ha scritto:
> From: Yunfei Dong <yunfei.dong@mediatek.corp-partner.google.com>
> 
> Need to add racing control register base in device node for mt8195 support
> inner racing mode. Changing the max reg value from 1 to 2.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

You forgot to mention in the commit message that you're also adding a description
for the VDEC_MISC register space.

Please add that, after which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



