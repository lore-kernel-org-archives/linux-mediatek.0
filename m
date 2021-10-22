Return-Path: <SRS0=WF8g=PK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23415C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Oct 2021 08:59:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA28D610EA
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Oct 2021 08:58:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EA28D610EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dDTbVmyNAsk9COngQHEnhq8F+f8LTpr/rjmuOon5b7s=; b=01l0LEruRr4yS21kOgWMeNl+cp
	DJPeV/Y6YcB23NHSQwFehuYDSCn6j7G7Xl+jgNPgsCeiYfic5SdifMctX6GyBeqsOCF0OKScpTUAd
	FMmgwWsSPq7WO9jgNffbktXxrcGqllVpoDwOGXr9b+ympFbeB2IyagAL6nRnb46Dq210GJ1DOKbSP
	6la1BsyMWNiPLSvzSMXrqkeNYHVgAMBxysx6dODJjHFTwJ4rEs0TuyGlRgZnFf+FnnL4f2dQZACmY
	ota6/zvRWQDRMxGo/Vtr+2RdYLf/2qiwE89u43cB8O+7wwDC1vhZLJJO0X3yfuyqgitTSu3xYx7jB
	3PtG+GeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdqO0-00AHP6-Km; Fri, 22 Oct 2021 08:58:48 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdqNa-00AHFx-2G; Fri, 22 Oct 2021 08:58:23 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 11BF31F44F74
Subject: Re: [PATCH v3 8/9] media: platform: mtk-mdp3: support mt8195
To: "roy-cw.yeh" <roy-cw.yeh@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Fabien Parent <fparent@baylibre.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 daoyuan huang <daoyuan.huang@mediatek.com>,
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 "river . cheng" <river.cheng@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20211022022146.3577-1-roy-cw.yeh@mediatek.com>
 <20211022022146.3577-9-roy-cw.yeh@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <59d184c6-87ee-918c-b3cb-abb923c39912@collabora.com>
Date: Fri, 22 Oct 2021 10:58:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211022022146.3577-9-roy-cw.yeh@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_015822_311006_96BE1262 
X-CRM114-Status: GOOD (  11.39  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> From: "Roy-CW.Yeh" <roy-cw.yeh@mediatek.com>
> 
> Add mt8195 driver
> 
> Signed-off-by: Roy-CW.Yeh <roy-cw.yeh@mediatek.com>


Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



> ---
>   drivers/media/platform/mtk-mdp3/mdp_reg_aal.h |   24 +
>   .../media/platform/mtk-mdp3/mdp_reg_color.h   |   29 +
>   drivers/media/platform/mtk-mdp3/mdp_reg_fg.h  |   23 +
>   drivers/media/platform/mtk-mdp3/mdp_reg_hdr.h |   31 +
>   .../media/platform/mtk-mdp3/mdp_reg_merge.h   |   23 +
>   drivers/media/platform/mtk-mdp3/mdp_reg_ovl.h |   24 +
>   drivers/media/platform/mtk-mdp3/mdp_reg_pad.h |   20 +
>   .../media/platform/mtk-mdp3/mdp_reg_rdma.h    |   31 +
>   drivers/media/platform/mtk-mdp3/mdp_reg_rsz.h |    6 +
>   .../media/platform/mtk-mdp3/mdp_reg_tdshp.h   |  114 ++
>   .../media/platform/mtk-mdp3/mdp_reg_wrot.h    |   18 +
>   drivers/media/platform/mtk-mdp3/mtk-img-ipi.h |  215 ++-
>   .../media/platform/mtk-mdp3/mtk-mdp3-cmdq.c   |  496 ++++++-
>   .../media/platform/mtk-mdp3/mtk-mdp3-comp.c   | 1196 ++++++++++++++++-
>   .../media/platform/mtk-mdp3/mtk-mdp3-comp.h   |   83 +-
>   .../media/platform/mtk-mdp3/mtk-mdp3-core.c   |  703 +++++++++-
>   .../media/platform/mtk-mdp3/mtk-mdp3-core.h   |   31 +-
>   .../media/platform/mtk-mdp3/mtk-mdp3-m2m.c    |    4 +
>   .../media/platform/mtk-mdp3/mtk-mdp3-regs.c   |  143 +-
>   .../media/platform/mtk-mdp3/mtk-mdp3-regs.h   |    2 +
>   20 files changed, 3020 insertions(+), 196 deletions(-)
>   create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_aal.h
>   create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_color.h
>   create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_fg.h
>   create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_hdr.h
>   create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_merge.h
>   create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_ovl.h
>   create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_pad.h
>   create mode 100644 drivers/media/platform/mtk-mdp3/mdp_reg_tdshp.h
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
