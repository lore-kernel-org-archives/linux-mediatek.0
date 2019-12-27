Return-Path: <SRS0=MHhQ=2R=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 330FEC2D0C6
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Dec 2019 07:22:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F32D920882
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Dec 2019 07:22:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HbJWet23";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="PndAyuXT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F32D920882
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JkkrYwI+KEcf+Gqe+qffBkV8pfCW0VIlG9WLWXfqbfo=; b=HbJWet23LTcp8o
	/YSZvvgSDTnCqmeMOFWETvmM/pE5kNdVYxmMSppEt04VrCoDdzpb3Tabszyr+IiGd1ymFXPMI7Q6H
	Sho6RlQ8yrczT9ELGi1IKOLnzkudFouvDBtEtWY655yDvIs/FFsLFPbqRo8CsJyrgUmwjDDzTu6cd
	t7GIhB5wSRnOXAblu/zoM2FPiiktJ0e47iiKqgoIopqm7aqsRsi4NU29WOEl+ihI5rfWn61jqMB7w
	OAE1lzwi4xA9EIzSSPUv4tybSaEnFU1iLpmnB3hBS04Paevc0yuMrbP2wF/6a+1x7OwRP8sRTn/8R
	6pxfQehp7v/37YnvZzCw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ikjwt-0007WF-M8; Fri, 27 Dec 2019 07:22:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ikjwq-0007VC-Du; Fri, 27 Dec 2019 07:22:14 +0000
X-UUID: 0fa0d763534d4ee9bf40fbcc1733fc79-20191226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=u+U1TrW0IsDnGyB1I5ofisWe5Qd+waMvShubc2tOoEc=; 
 b=PndAyuXTfZ6vLRP/aMAx1Dy32IAo3CXLG5zJvBTUvzrbW+vWZRE+N5XJ5V3CNSpcml5WN8IG8a6lHOSwc5ARv9N6v7HvvleWHwemRBlgzYuoCg4xZnNBQiLmmsEycAAqXRrwQLeYKGh4jGK0RmpKEs5rw1ufpmmsRziDaZiMsD8=;
X-UUID: 0fa0d763534d4ee9bf40fbcc1733fc79-20191226
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 464656777; Thu, 26 Dec 2019 23:22:09 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 26 Dec 2019 23:22:17 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs07n1.mediatek.inc
 (172.21.101.16) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Fri, 27 Dec 2019 15:21:45 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 27 Dec 2019 15:22:36 +0800
Message-ID: <1577431271.32039.12.camel@mhfsdcap03>
Subject: Re: [PATCH v2 2/2] memory: mtk-smi: Add bandwidth initial golden
 setting for MT6779
From: Yong Wu <yong.wu@mediatek.com>
To: Ming-Fan Chen <ming-fan.chen@mediatek.com>
Date: Fri, 27 Dec 2019 15:21:11 +0800
In-Reply-To: <1575872371-671-4-git-send-email-ming-fan.chen@mediatek.com>
References: <1575872371-671-1-git-send-email-ming-fan.chen@mediatek.com>
 <1575872371-671-4-git-send-email-ming-fan.chen@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191226_232212_479354_787A1EA8 
X-CRM114-Status: GOOD (  19.45  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Joerg Roedel <jroedel@suse.de>,
 wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2019-12-09 at 14:19 +0800, Ming-Fan Chen wrote:
> SMI bandwidth initial golden setting for MT6779 make sure
> better performance of memory control for multimedia modules.
> 
> Signed-off-by: Ming-Fan Chen <ming-fan.chen@mediatek.com>
> ---
>  drivers/memory/mtk-smi.c |  143 +++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 142 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> index 439d7d8..6b18b71 100644
> --- a/drivers/memory/mtk-smi.c
> +++ b/drivers/memory/mtk-smi.c
> @@ -41,21 +41,49 @@
>  #define SMI_LARB_NONSEC_CON(id)	(0x380 + ((id) * 4))
>  #define F_MMU_EN		BIT(0)
>  
> +#define SMI_LARB_CMD_THRT_CON	 0x24
> +#define SMI_LARB_SW_FLAG	 0x40
> +#define SMI_LARB_OSTDL_PORT	 0x200
> +#define SMI_LARB_OSTDL_PORTx(id) (SMI_LARB_OSTDL_PORT + (((id) & 0x1f) << 2))
> +
>  /* SMI COMMON */
> +#define SMI_L1LEN			0x100
> +#define SMI_L1ARB0			0x104
> +#define SMI_L1ARB(id)			(SMI_L1ARB0 + (((id) & 0x7) << 2))
> +
>  #define SMI_BUS_SEL			0x220
>  #define SMI_BUS_LARB_SHIFT(larbid)	((larbid) << 1)
>  /* All are MMU0 defaultly. Only specialize mmu1 here. */
>  #define F_MMU1_LARB(larbid)		(0x1 << SMI_BUS_LARB_SHIFT(larbid))
>  
> +#define SMI_M4U_TH			0x234
> +#define SMI_FIFO_TH1			0x238
> +#define SMI_FIFO_TH2			0x23c
> +#define SMI_DCM				0x300
> +#define SMI_DUMMY			0x444
> +
> +#define SMI_LARB_PORT_NR_MAX		32
> +#define SMI_LARB_MISC_NR		2
> +#define SMI_COMMON_MISC_NR		6
> +
>  enum mtk_smi_gen {
>  	MTK_SMI_GEN1,
>  	MTK_SMI_GEN2
>  };
>  
> +struct mtk_smi_reg_pair {
> +	u16	offset;
> +	u32	value;
> +};
> +
>  struct mtk_smi_common_plat {
>  	enum mtk_smi_gen gen;
>  	bool             has_gals;
>  	u32              bus_sel; /* Balance some larbs to enter mmu0 or mmu1 */
> +	bool                          has_bwc;
> +	u8                            larb_nr;
> +	const u16                     *l1arb;
> +	const struct mtk_smi_reg_pair *misc;
>  };
>  
>  struct mtk_smi_larb_gen {
> @@ -63,6 +91,9 @@ struct mtk_smi_larb_gen {
>  	void (*config_port)(struct device *);
>  	unsigned int			larb_direct_to_common_mask;
>  	bool				has_gals;
> +	bool				has_bwc;
> +	const u8			(*ostdl)[SMI_LARB_PORT_NR_MAX];
> +	const struct mtk_smi_reg_pair	(*misc)[SMI_LARB_MISC_NR];
>  };
>  
>  struct mtk_smi {
> @@ -161,6 +192,8 @@ static void mtk_smi_larb_config_port_gen2_general(struct device *dev)
>  	struct mtk_smi_larb *larb = dev_get_drvdata(dev);
>  	u32 reg;
>  	int i;
> +	const u8 *ostdl;
> +	const struct mtk_smi_reg_pair *misc;

Normally define the local variables from long to short.

That means:
+	const struct mtk_smi_reg_pair *misc;
+	const u8 *ostdl;
        u32 reg;
        int i;

>  
>  	if (BIT(larb->larbid) & larb->larb_gen->larb_direct_to_common_mask)
>  		return;
> @@ -170,6 +203,20 @@ static void mtk_smi_larb_config_port_gen2_general(struct device *dev)
>  		reg |= F_MMU_EN;
>  		writel(reg, larb->base + SMI_LARB_NONSEC_CON(i));
>  	}
> +
> +	if (!larb->larb_gen->has_bwc)
> +		return;
> +
> +	for (i = 0, ostdl = larb->larb_gen->ostdl[larb->larbid];
> +		i < SMI_LARB_PORT_NR_MAX; i++)
> +		writel_relaxed(ostdl[i],
> +			       larb->base + SMI_LARB_OSTDL_PORTx(i));

the writel_relaxed can be done in one line, it isn't over 80.


ostdl = larb->larb_gen->ostdl[larb->larbid];
for (i = 0; i < SMI_LARB_PORT_NR_MAX; i++)
	writel_relaxed(ostdl[i], larb->base + SMI_LARB_OSTDL_PORTx(i));

> +
> +	for (i = 0, misc = larb->larb_gen->misc[larb->larbid];
> +		i < SMI_LARB_MISC_NR; i++)
> +		writel_relaxed(misc[i].value,
> +			       larb->base + misc[i].offset);

ditto. it also don't over 80 chars.

misc = larb->larb_gen->misc[larb->larbid];
for (i = 0; i < SMI_LARB_MISC_NR; i++)
	writel_relaxed(misc[i].value, larb->base + misc[i].offset);

> +	wmb(); /* make sure settings are written */
>  }
>  
>  static void mtk_smi_larb_config_port_mt8173(struct device *dev)
> @@ -239,6 +286,55 @@ static void mtk_smi_larb_config_port_gen1(struct device *dev)
>  	.larb_direct_to_common_mask = BIT(8) | BIT(9),      /* bdpsys */
>  };
>  
> +static const u8 mtk_smi_larb_mt6779_ostdl[][SMI_LARB_PORT_NR_MAX] = {
> +	{0x28, 0x28, 0x01, 0x28, 0x01, 0x01, 0x0a, 0x0a, 0x28,},
> +	{0x28, 0x01, 0x28, 0x28, 0x0a, 0x01, 0x01, 0x0d, 0x0d, 0x07,
> +	 0x01, 0x07, 0x01, 0x28,},
> +	{0x18, 0x01, 0x08, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x02,
> +	 0x01, 0x01},
> +	{0x01, 0x03, 0x02, 0x01, 0x01, 0x01, 0x01, 0x04, 0x02, 0x01,
> +	 0x04, 0x01, 0x01, 0x01, 0x01, 0x04, 0x0b, 0x13, 0x14,},
> +	{},
> +	{0x13, 0x0f, 0x0d, 0x07, 0x07, 0x04, 0x03, 0x01, 0x03, 0x01,
> +	 0x05, 0x0c, 0x01, 0x01, 0x08, 0x06, 0x02, 0x01, 0x08, 0x08,
> +	 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,},
> +	{0x01, 0x01, 0x01,},
> +	{0x01, 0x01, 0x01, 0x01,},
> +	{0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,},
> +	{0x1f, 0x1a, 0x02, 0x04, 0x1f, 0x02, 0x14, 0x01, 0x1f, 0x04,
> +	 0x04, 0x01, 0x01, 0x01, 0x02, 0x02, 0x04, 0x02, 0x01, 0x02,
> +	 0x04, 0x02, 0x02, 0x01,},
> +	{0x1f, 0x1a, 0x02, 0x04, 0x1f, 0x02, 0x14, 0x01, 0x1f, 0x1a,
> +	 0x02, 0x04, 0x1f, 0x02, 0x14, 0x01, 0x01, 0x02, 0x02, 0x04,
> +	 0x02, 0x0a, 0x02, 0x02, 0x04, 0x02, 0x0a, 0x02, 0x04, 0x02, 0x04,},
> +	{0x01, 0x01, 0x01, 0x01, 0x01,},
> +};
> +
> +static const struct mtk_smi_reg_pair
> +mtk_smi_larb_mt6779_misc[][SMI_LARB_MISC_NR] = {
> +	{{SMI_LARB_CMD_THRT_CON, 0x370256}, {SMI_LARB_SW_FLAG, 0x1},},

I am confused why we need SMI_LARB_SW_FLAG. Does it only indicate that
the setting is not the default one?. I guess we also get it from the
other regsiter, like SMI_LARB_CMD_THRT_CON.

> +	{{SMI_LARB_CMD_THRT_CON, 0x300256}, {SMI_LARB_SW_FLAG, 0x1},},
> +	{{SMI_LARB_CMD_THRT_CON, 0x370256}, {SMI_LARB_SW_FLAG, 0x1},},
> +	{},
> +	{{SMI_LARB_CMD_THRT_CON, 0x300256}, {SMI_LARB_SW_FLAG, 0x1},},
> +	{{SMI_LARB_CMD_THRT_CON, 0x300256}, {SMI_LARB_SW_FLAG, 0x1},},
> +	{{SMI_LARB_CMD_THRT_CON, 0x300256}, {SMI_LARB_SW_FLAG, 0x1},},
> +	{{SMI_LARB_CMD_THRT_CON, 0x300256}, {SMI_LARB_SW_FLAG, 0x1},},
> +	{{SMI_LARB_CMD_THRT_CON, 0x370256}, {SMI_LARB_SW_FLAG, 0x1},},
> +	{{SMI_LARB_CMD_THRT_CON, 0x370256}, {SMI_LARB_SW_FLAG, 0x1},},
> +	{{SMI_LARB_CMD_THRT_CON, 0x370256}, {SMI_LARB_SW_FLAG, 0x1},},
> +};
> +
> +static const struct mtk_smi_larb_gen mtk_smi_larb_mt6779 = {
> +	.config_port  = mtk_smi_larb_config_port_gen2_general,
> +	.larb_direct_to_common_mask =
> +		BIT(4) | BIT(6) | BIT(11) | BIT(12) | BIT(13),
> +		/* DUMMY | IPU0 | IPU1 | CCU | MDLA */
> +	.has_bwc = true,

Does the larb also have has_gals?

> +	.ostdl   = mtk_smi_larb_mt6779_ostdl,
> +	.misc    = mtk_smi_larb_mt6779_misc,
> +};
> +
>  static const struct mtk_smi_larb_gen mtk_smi_larb_mt8183 = {
>  	.has_gals                   = true,
>  	.config_port                = mtk_smi_larb_config_port_gen2_general,
> @@ -260,6 +356,10 @@ static void mtk_smi_larb_config_port_gen1(struct device *dev)
>  		.data = &mtk_smi_larb_mt2712
>  	},
>  	{
> +		.compatible = "mediatek,mt6779-smi-larb",
> +		.data = &mtk_smi_larb_mt6779
> +	},
> +	{
>  		.compatible = "mediatek,mt8183-smi-larb",
>  		.data = &mtk_smi_larb_mt8183
>  	},
> @@ -386,6 +486,31 @@ static int __maybe_unused mtk_smi_larb_suspend(struct device *dev)
>  	.gen = MTK_SMI_GEN2,
>  };
>  
> +static const u16 mtk_smi_common_mt6779_l1arb[] = {
> +	0x1000, 0x1000, 0x1000, 0x1000, 0x1000, 0x1000, 0x1000, 0x1000,
> +};
> +
> +static const struct
> +mtk_smi_reg_pair mtk_smi_common_mt6779_misc[SMI_COMMON_MISC_NR] = {
> +	{SMI_L1LEN, 0xb},
> +	{SMI_M4U_TH, 0xe100e10},
> +	{SMI_FIFO_TH1, 0x506090a},
> +	{SMI_FIFO_TH2, 0x506090a},
> +	{SMI_DCM, 0x4f1},
> +	{SMI_DUMMY, 0x1},
> +};
> +
> +static const struct mtk_smi_common_plat mtk_smi_common_mt6779 = {
> +	.gen		= MTK_SMI_GEN2,
> +	.has_gals	= true,
> +	.bus_sel	= F_MMU1_LARB(1) | F_MMU1_LARB(2) | F_MMU1_LARB(4) |
> +			  F_MMU1_LARB(5) | F_MMU1_LARB(6) | F_MMU1_LARB(7),
> +	.has_bwc	= true,
> +	.larb_nr	= ARRAY_SIZE(mtk_smi_common_mt6779_l1arb),
> +	.l1arb		= mtk_smi_common_mt6779_l1arb,
> +	.misc		= mtk_smi_common_mt6779_misc,

How about add a new one?:
misc_nr = ARRAY_SIZE(mtk_smi_common_mt6779_misc);

Because we should move the "bus_sel" into this misc structure later,
right?

> +};
> +
>  static const struct mtk_smi_common_plat mtk_smi_common_mt8183 = {
>  	.gen      = MTK_SMI_GEN2,
>  	.has_gals = true,
> @@ -407,6 +532,10 @@ static int __maybe_unused mtk_smi_larb_suspend(struct device *dev)
>  		.data = &mtk_smi_common_gen2,
>  	},
>  	{
> +		.compatible = "mediatek,mt6779-smi-common",
> +		.data = &mtk_smi_common_mt6779,
> +	},
> +	{
>  		.compatible = "mediatek,mt8183-smi-common",
>  		.data = &mtk_smi_common_mt8183,
>  	},
> @@ -484,7 +613,7 @@ static int __maybe_unused mtk_smi_common_resume(struct device *dev)
>  {
>  	struct mtk_smi *common = dev_get_drvdata(dev);
>  	u32 bus_sel = common->plat->bus_sel;
> -	int ret;
> +	int i, ret;
>  
>  	ret = mtk_smi_clk_enable(common);
>  	if (ret) {
> @@ -494,6 +623,18 @@ static int __maybe_unused mtk_smi_common_resume(struct device *dev)
>  
>  	if (common->plat->gen == MTK_SMI_GEN2 && bus_sel)
>  		writel(bus_sel, common->base + SMI_BUS_SEL);
> +
> +	if (!common->plat->has_bwc)
> +		return 0;
> +
> +	for (i = 0; i < common->plat->larb_nr; i++)
> +		writel_relaxed(common->plat->l1arb[i],
> +			       common->base + SMI_L1ARB(i));
> +
> +	for (i = 0; i < SMI_COMMON_MISC_NR; i++)
> +		writel_relaxed(common->plat->misc[i].value,
> +			       common->base + common->plat->misc[i].value);
> +	wmb(); /* make sure settings are written */
>  	return 0;
>  }

In the end, As the comment in v1, this patch should split:

a. add basic mt6779 smi-larb support(only add nodes and config_port like
the previous SoC.)

b. add bandwidth initial settting for mt6779.

c. Move the bus_sel into the smi-common misc setting.

>  

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
