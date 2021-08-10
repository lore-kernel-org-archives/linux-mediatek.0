Return-Path: <SRS0=C/QR=NB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECC2DC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 01:59:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAACF6105A
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 01:59:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AAACF6105A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XSLg2QFg1cNqQogkc1Ocx5D+sOEH2ndQhK7jC6AIXUQ=; b=CSNW8TFipTYvvp
	hrqakU/y9X4kQPGh6efDtQKwu+bNzwxZDpShvqvUmffK8Dj/MBQyXv23BpncKslb6nl/RC9pOoeEA
	fMaQ38JZUQByFGdMVYhrqFIpI3/ESq7Bk0mu63oCozRv9dXGk0tBgF3lwJb3EmtfnSUoJja8rYpIO
	sz7o1mtD0YPggumAk09Oi8D1lDwxeuT8eA/dWn//UVw3iXTN19tOSAB1UmPaPeYdkK67W1Zlp6h68
	0GZWeDU3gbSS5Vky9Qm2atC1QCT+L+wgYSarx4tuygpf//XqnIrBfSal1Di+8E3mBclXu7FgkWE72
	pgC3ydMcfzV8yRTuRMqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDH2a-002F2T-I8; Tue, 10 Aug 2021 01:58:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDH2V-002F1o-9d; Tue, 10 Aug 2021 01:58:51 +0000
X-UUID: 6073aa968e4a481a83522beb3ab7a48c-20210809
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=diU0Hsu91WZVMmaynXFuDuQLOfFchc5sqJSovsTuW/g=; 
 b=KEsA+8gSz5LYMZA1JWF+DOmJR4ngiqVHg4Ei6Pu8IztRy2fLZnFsqOvq+f58RjLNjNMpY5Csh5ketf0Y1/o2CEmuWsCy335/217JWmnkEs5k8gmmve6KmC732bkIH05v/PqFAJ+/b/vOP/r05WQDsPioWjlKrM0/5e7ukDuzWWQ=;
X-UUID: 6073aa968e4a481a83522beb3ab7a48c-20210809
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1149835331; Mon, 09 Aug 2021 18:58:43 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 Aug 2021 18:58:41 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 Aug 2021 09:58:40 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 10 Aug 2021 09:58:40 +0800
Message-ID: <1628560720.15645.4.camel@mtksdaap41>
Subject: Re: [PATCH v1] drm/mediatek: Add component_del in OVL remove function
From: CK Hu <ck.hu@mediatek.com>
To: jason-jh.lin <jason-jh.lin@mediatek.com>
CC: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <fshao@google.com>,
 <nancy.lin@mediatek.com>, <singo.chang@mediatek.com>
Date: Tue, 10 Aug 2021 09:58:40 +0800
In-Reply-To: <20210709034308.21713-1-jason-jh.lin@mediatek.com>
References: <20210709034308.21713-1-jason-jh.lin@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210809_185847_382783_784770F4 
X-CRM114-Status: GOOD (  17.54  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Jason:

On Fri, 2021-07-09 at 11:43 +0800, jason-jh.lin wrote:
> Add component_del in OVL remove function to make it symmetrical
> to component_add in probe function.
> 
> Fixes: ff1395609e20 ("drm/mediatek: Move mtk_ddp_comp_init() from sub driver to DRM driver")
> 

In patch [1], both OVL and COLOR has the same problem. I would like you
to fix both bug. It could be in one patch.


[1]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v5.14-rc5&id=ff1395609e20c1cd98b3ec65d16dc18f0471dca3


Regards,
CK

> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> index 961f87f8d4d1..081c96aa7f72 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -158,7 +158,6 @@ void mtk_ovl_stop(struct device *dev)
>  		reg = reg & ~OVL_LAYER_SMI_ID_EN;
>  		writel_relaxed(reg, ovl->regs + DISP_REG_OVL_DATAPATH_CON);
>  	}
> -
>  }
>  
>  void mtk_ovl_config(struct device *dev, unsigned int w,
> @@ -424,6 +423,8 @@ static int mtk_disp_ovl_probe(struct platform_device *pdev)
>  
>  static int mtk_disp_ovl_remove(struct platform_device *pdev)
>  {
> +	component_del(&pdev->dev, &mtk_disp_ovl_component_ops);
> +
>  	return 0;
>  }
>  

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
