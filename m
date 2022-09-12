Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7867ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Sep 2022 03:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kUjZF8zoBPBlzPI8fg689aeZ8/UV7t+gu/v4TkhZGuw=; b=SGftlpNxvxAmy8w11clVWOvOUk
	GAO8iLOTsiAKtEOZscfrgVmRlvEDAvFJ2sUAbqgwSdaRuYLSO/7I6M8QjW2NlvCInCYiVuhWBLTS7
	q6DCm1vdaF46gmn9gGIuS3t8X7MyQw8WT70q/SKF0NBnUUvA38SdxKDXYZAxcdVIZfR0bGt7TS8u+
	Z5I1uRAkRDUPbJ/z3j8+CYosyCN0R3u8cBALsPyr4LT/ZJ++XGbBzIeSZwrVQRWlJsgicx4ynbvjA
	/IPvhX35BJJBx1zVprizh8zMR8gBMF5kNxnkRdPu7R/6TRAF1dC3kLPfu2lCYzzHsQQvE7SsJc5RY
	ITSdxuXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXaGZ-006dy5-QX; Mon, 12 Sep 2022 03:37:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXaG3-006dQf-KM; Mon, 12 Sep 2022 03:37:20 +0000
X-UUID: 454ffbee99e04e6b8be1476b4ba3ee9a-20220911
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=kUjZF8zoBPBlzPI8fg689aeZ8/UV7t+gu/v4TkhZGuw=;
	b=pHgmFeHN7EgeyesKlxNx3+9BFyRLsA5I3tuKTG+/UPV9DHgocpYEEvsiSxwFK7mZnhXaT9f8cJyW2nqOX5p/Im6W/+sdQzCCqycIENKjCHVB5ALzd9XvKDFCBS0SwO9OUhgn9c36UsUZfQ77mlfZO9kZUxtCWM5yH6la2vOEJ9U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:0f7b9915-8fc9-44f6-a251-58b739ab1f2c,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:fe700af6-6e85-48d9-afd8-0504bbfe04cb,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 454ffbee99e04e6b8be1476b4ba3ee9a-20220911
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1345906051; Sun, 11 Sep 2022 20:27:08 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 12 Sep 2022 10:26:31 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 12 Sep 2022 10:26:31 +0800
Message-ID: <ecdb209437e78b3273374ef963fd2c5c64ba88fd.camel@mediatek.com>
Subject: Re: [PATCH RESEND v3 8/9] drm/mediatek: Add clear RELAY_MODE bit to
 set gamma
From: CK Hu <ck.hu@mediatek.com>
To: Jason-JH.Lin <jason-jh.lin@mediatek.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Rex-BC Chen <rex-bc.chen@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 12 Sep 2022 10:26:31 +0800
In-Reply-To: <20220912013006.27541-9-jason-jh.lin@mediatek.com>
References: <20220912013006.27541-1-jason-jh.lin@mediatek.com>
	 <20220912013006.27541-9-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220911_203716_953052_0EDE91B3 
X-CRM114-Status: GOOD (  17.81  )
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

Hi, Jason:

On Mon, 2022-09-12 at 09:30 +0800, Jason-JH.Lin wrote:
> Since the bootlaoder may set the RELAY_MODE to gamma be for the
> kerenl,
> we have to clear the RELAY_MODE bit to make sure that the gamma is
> enabled correctly.
> 
> Fixes: b10023b03082 ("FROMGIT: drm/mediatek: Separate gamma module")

Fixes: 69a4237ab1d1 ("drm/mediatek: Separate gamma module")

and move this patch to the first patch of this series so this patch
could be picked to early stable branch.

Regards,
CK

> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> index d706f76fd30e..15fe2a4f98de 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
> @@ -18,6 +18,7 @@
>  #define DISP_GAMMA_EN				0x0000
>  #define GAMMA_EN					BIT(0)
>  #define DISP_GAMMA_CFG				0x0020
> +#define RELAY_MODE					BIT(0)
>  #define GAMMA_LUT_EN					BIT(1)
>  #define GAMMA_DITHERING					BIT(2)
>  #define DISP_GAMMA_SIZE				0x0030
> @@ -99,6 +100,7 @@ void mtk_gamma_set_common(struct device *dev, void
> __iomem *regs, struct drm_crt
>  
>  	if (state->gamma_lut) {
>  		reg = readl(regs + DISP_GAMMA_CFG);
> +		reg = reg & ~RELAY_MODE;
>  		reg = reg | GAMMA_LUT_EN;
>  		writel(reg, regs + DISP_GAMMA_CFG);
>  		lut_base = regs + DISP_GAMMA_LUT;


