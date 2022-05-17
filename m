Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A8AC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 06:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vinl5/bHdkJBxtljgSylMyvYiHZjOavynNLZzvI34qg=; b=ekmaR45falBPQD
	3qrN0UaBtX/BQYntDBfinZfk8LAehr46St72CUJ5f91yfyf4MVIz5dfthPLNEWBE5sYNBAxD6qYZG
	ac1O3eH9juP3CKpaAbmozi1IPv6N9ROHSo6EjY9lVKciuZmGAMTF+lP+TFpNv1VeAjM+OwKVr8m1K
	GPeM5tDf9jkKlH0f/mMp+AfWl0yA/IturdW2ua8kn6lMY/V4jFid0MS6HLVq43P46o3gFrHWXcAZQ
	QjMHpJNI0o9kddKurvhXSG4aXIcephyKBvBjBixP4fXvRw3xFA4dxg8Owf31NvBMWSdB8oYcvsyew
	9rzgDCUVBqB99u4zJfTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqqtL-00BqKS-UM; Tue, 17 May 2022 06:41:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqqtI-00BqIV-AY; Tue, 17 May 2022 06:41:10 +0000
X-UUID: 55070ea78dd7434fba5c50d6a7d2598d-20220516
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=uZLywv0eLUIAaHbRIpVziZl9Lb2zsR9vV5zJezUXmIA=; 
 b=IQCA9oDoHcVuM8hdPyYpr1Vw5qfB+vKdyeu1/MB+8TdOXUxxqfygUSbKBCdLy30Omjw+7ARtj/cFURXFgQZpxaH9N5AaFgvuobwyf5WkPFiOdXDj7C7xAt3e/JZcnZyj1p7qBqgbb9ruCQYcTRlliGEe+rx/liXMQw/F8dEXc68=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:ff048a3b-2605-4a3f-bc33-9c5f152350ef, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:2d7273e2-edbf-4bd4-8a34-dfc5f7bb086d,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: 55070ea78dd7434fba5c50d6a7d2598d-20220516
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1548494640; Mon, 16 May 2022 23:41:02 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 16 May 2022 23:37:39 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Tue, 17 May 2022 14:37:37 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 17 May 2022 14:37:36 +0800
Message-ID: <cf2442b9c7124ebf1ce62ae5df597f003fa447d7.camel@mediatek.com>
Subject: Re: [PATCH v2 2/2] memory: mtk-smi: Add support for MT6795 Helio X10
From: Yong Wu <yong.wu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
CC: <krzysztof.kozlowski@linaro.org>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>, <linux-mediatek@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <konrad.dybcio@somainline.org>,
 <marijn.suijten@somainline.org>, <martin.botka@somainline.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <paul.bouchara@somainline.org>, <kernel@collabora.com>,
 <yi.kuo@mediatek.com>, <anthony.huang@mediatek.com>,
 <wendy-st.lin@mediatek.com>
Date: Tue, 17 May 2022 14:37:36 +0800
In-Reply-To: <20220513150633.387200-3-angelogioacchino.delregno@collabora.com>
References: <20220513150633.387200-1-angelogioacchino.delregno@collabora.com>
 <20220513150633.387200-3-angelogioacchino.delregno@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_234109_219872_BB608DD9 
X-CRM114-Status: GOOD (  21.39  )
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

On Fri, 2022-05-13 at 17:06 +0200, AngeloGioacchino Del Regno wrote:
> The MediaTek Helio X10 (MT6795) SoC has 5 LARBs and one common SMI
> instance without any sub-common and without GALS.
> 
> While the smi-common configuration is specific to this SoC, on the
> LARB side, this is similar to MT8173, in the sense that it doesn't
> need the port in LARB, and the register layout is also compatible
> with that one, which makes us able to fully reuse the smi-larb
> platform data struct that was introduced for MT8173.
> 
> Signed-off-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
>  drivers/memory/mtk-smi.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> index 86a3d34f418e..7e7c3ede19e4 100644
> --- a/drivers/memory/mtk-smi.c
> +++ b/drivers/memory/mtk-smi.c
> @@ -21,11 +21,13 @@
>  /* SMI COMMON */
>  #define SMI_L1LEN			0x100
>  
> +#define SMI_L1_ARB			0x200
>  #define SMI_BUS_SEL			0x220
>  #define SMI_BUS_LARB_SHIFT(larbid)	((larbid) << 1)
>  /* All are MMU0 defaultly. Only specialize mmu1 here. */
>  #define F_MMU1_LARB(larbid)		(0x1 <<
> SMI_BUS_LARB_SHIFT(larbid))
>  
> +#define SMI_FIFO_TH0			0x230

Does the name come from the coda you got?
It is called SMI_READ_FIFO_TH in my coda.

>  #define SMI_M4U_TH			0x234
>  #define SMI_FIFO_TH1			0x238
>  #define SMI_FIFO_TH2			0x23c
> @@ -360,6 +362,7 @@ static const struct of_device_id
> mtk_smi_larb_of_ids[] = {
>  	{.compatible = "mediatek,mt2701-smi-larb", .data =
> &mtk_smi_larb_mt2701},
>  	{.compatible = "mediatek,mt2712-smi-larb", .data =
> &mtk_smi_larb_mt2712},
>  	{.compatible = "mediatek,mt6779-smi-larb", .data =
> &mtk_smi_larb_mt6779},
> +	{.compatible = "mediatek,mt6795-smi-larb", .data =
> &mtk_smi_larb_mt8173},
>  	{.compatible = "mediatek,mt8167-smi-larb", .data =
> &mtk_smi_larb_mt8167},
>  	{.compatible = "mediatek,mt8173-smi-larb", .data =
> &mtk_smi_larb_mt8173},
>  	{.compatible = "mediatek,mt8183-smi-larb", .data =
> &mtk_smi_larb_mt8183},
> @@ -541,6 +544,13 @@ static struct platform_driver
> mtk_smi_larb_driver = {
>  	}
>  };
>  
> +static const struct mtk_smi_reg_pair
> mtk_smi_common_mt6795_init[SMI_COMMON_INIT_REGS_NR] = {
> +	{SMI_L1_ARB, 0x1b},
> +	{SMI_M4U_TH, 0xce810c85},
> +	{SMI_FIFO_TH1, 0x43214c8},
> +	{SMI_FIFO_TH0, 0x191f},
> +};
> +
>  static const struct mtk_smi_reg_pair
> mtk_smi_common_mt8195_init[SMI_COMMON_INIT_REGS_NR] = {
>  	{SMI_L1LEN, 0xb},
>  	{SMI_M4U_TH, 0xe100e10},
> @@ -565,6 +575,12 @@ static const struct mtk_smi_common_plat
> mtk_smi_common_mt6779 = {
>  		    F_MMU1_LARB(5) | F_MMU1_LARB(6) | F_MMU1_LARB(7),
>  };
>  
> +static const struct mtk_smi_common_plat mtk_smi_common_mt6795 = {
> +	.type	  = MTK_SMI_GEN2,
> +	.bus_sel  = BIT(0),

Like the other larbs, use F_MMU1_LARB(0) here?


After the two changes,

Reviewed-by: Yong Wu <yong.wu@mediatek.com>

Thanks.

> +	.init     = mtk_smi_common_mt6795_init,
> +};
> +
>  static const struct mtk_smi_common_plat mtk_smi_common_mt8183 = {
>  	.type     = MTK_SMI_GEN2,
>  	.has_gals = true,
> @@ -609,6 +625,7 @@ static const struct of_device_id
> mtk_smi_common_of_ids[] = {
>  	{.compatible = "mediatek,mt2701-smi-common", .data =
> &mtk_smi_common_gen1},
>  	{.compatible = "mediatek,mt2712-smi-common", .data =
> &mtk_smi_common_gen2},
>  	{.compatible = "mediatek,mt6779-smi-common", .data =
> &mtk_smi_common_mt6779},
> +	{.compatible = "mediatek,mt6795-smi-common", .data =
> &mtk_smi_common_mt6795},
>  	{.compatible = "mediatek,mt8167-smi-common", .data =
> &mtk_smi_common_gen2},
>  	{.compatible = "mediatek,mt8173-smi-common", .data =
> &mtk_smi_common_gen2},
>  	{.compatible = "mediatek,mt8183-smi-common", .data =
> &mtk_smi_common_mt8183},
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
