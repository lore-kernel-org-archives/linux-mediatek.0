Return-Path: <SRS0=vzOr=ZO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29841C43215
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Nov 2019 10:57:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E51D720865
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Nov 2019 10:57:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VzYb2G5S";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="pgrxaHK2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E51D720865
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Aa9mnD1va3uMDaRAwTLsW0ogo7/FITRVzD66meS1Wxg=; b=VzYb2G5SrqR2fj
	7oWeA1cLj83XwtjHo/KEUCe51svHE3Gta8ANIZhjcmgc3EdBhxl2xZFE+MJXXgNmaxFXV28WBB53A
	i1SRadRjFIZiGjxVOYGfAuRt39uGxTcDjMsv2UDGHLwvoUAMrjVpAiXHnvsgNy0YDYqtwkWAjaedG
	mGvWjhvPOtySYhBOI84Y82dT7NNg6nLBJJZqb7vlhpzoNu1dkHvFWaBeXqf3D4pe7j8FT5xGIUCPO
	2YoOlPjW6u+gP7a4oUkV59RojjqHKxlDXy9LiP3aFCKivA0p4l4mCJH+3FmXVnLUt+TbsfBnLimQH
	LfBG9kcpFOe9U0SZn2Fw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iY6dS-0004el-6O; Fri, 22 Nov 2019 10:57:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iY6c6-000382-8h; Fri, 22 Nov 2019 10:56:37 +0000
X-UUID: a2bc0c9a0ab1445fafc18118b058d470-20191122
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=69YJApwLF61UWoNAQ4TNL4OFVFdqcck/UgndPq2R7rk=; 
 b=pgrxaHK2x53n1r0IHmPrcNiHVcbqPLyNT6+ZVrxA0BbltjTU6auzBwWA8r19IcubOChelqYTQNOL1vtQuVgec/7mAVJfzfxvdT2uUvoxrCimh8fv3xwaMYBvG9XbrsoNDl7+E6c5NKp9iX/IB4jfVFVselTgm6MeTlbCYL+yLko=;
X-UUID: a2bc0c9a0ab1445fafc18118b058d470-20191122
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 460912777; Fri, 22 Nov 2019 02:56:22 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 22 Nov 2019 02:56:27 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs08n1.mediatek.inc
 (172.21.101.55) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Fri, 22 Nov 2019 18:55:51 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 22 Nov 2019 18:55:37 +0800
Message-ID: <1574420151.19130.196.camel@mhfsdcap03>
Subject: Re: [PATCH v1 2/2] memory: mtk-smi: Add bandwidth initial golden
 setting for MT6779
From: Yong Wu <yong.wu@mediatek.com>
To: Ming-Fan Chen <ming-fan.chen@mediatek.com>
Date: Fri, 22 Nov 2019 18:55:51 +0800
In-Reply-To: <1573616362-2557-3-git-send-email-ming-fan.chen@mediatek.com>
References: <1573616362-2557-1-git-send-email-ming-fan.chen@mediatek.com>
 <1573616362-2557-3-git-send-email-ming-fan.chen@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191122_025634_344619_D969D136 
X-CRM114-Status: GOOD (  23.47  )
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

On Wed, 2019-11-13 at 11:39 +0800, Ming-Fan Chen wrote:
> SMI bandwidth initial golden setting for MT6779 make sure
> better performance of memory control for multimedia modules.

I think this patch should be splitted to two, one adds the basic mt6779
support and config_port which should be a part of IOMMU. the other adds
the bandwidth control support.

> 
> Signed-off-by: Ming-Fan Chen <ming-fan.chen@mediatek.com>
> ---
>  drivers/memory/mtk-smi.c |  141 +++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 139 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> index 439d7d8..f3618d0 100644
> --- a/drivers/memory/mtk-smi.c
> +++ b/drivers/memory/mtk-smi.c
> @@ -41,21 +41,50 @@
>  #define SMI_LARB_NONSEC_CON(id)	(0x380 + ((id) * 4))
>  #define F_MMU_EN		BIT(0)
>  
> +#define SMI_LARB_CMD_THRT_CON	 0x24
> +#define SMI_LARB_SW_FLAG	 0x40
> +#define SMI_LARB_WRR_PORT	 0x100
> +#define SMI_LARB_WRR_PORTx(id)	 (SMI_LARB_WRR_PORT + (((id) & 0x1f) << 2))

The two WRR are not used. Remove.

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
> +#define SMI_COMMON_LARB_NR_MAX		8
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
> +	u16                     *bwl;
> +	struct mtk_smi_reg_pair *misc;
>  };
>  
>  struct mtk_smi_larb_gen {
> @@ -63,6 +92,8 @@ struct mtk_smi_larb_gen {
>  	void (*config_port)(struct device *);
>  	unsigned int			larb_direct_to_common_mask;
>  	bool				has_gals;
> +	u8				*bwl;

Below you assign mtk_smi_larb_mt6779_bwl to this, it is:
static u8 mtk_smi_larb_mt6779_bwl[MTK_LARB_NR_MAX][SMI_LARB_PORT_NR_MAX]

then, is "u8 **" better?

> +	struct mtk_smi_reg_pair		*misc;

ditto, use **?

>  };
>  
>  struct mtk_smi {
> @@ -160,7 +191,7 @@ static void mtk_smi_larb_config_port_gen2_general(struct device *dev)
>  {
>  	struct mtk_smi_larb *larb = dev_get_drvdata(dev);
>  	u32 reg;
> -	int i;
> +	int i, id;
>  
>  	if (BIT(larb->larbid) & larb->larb_gen->larb_direct_to_common_mask)
>  		return;
> @@ -170,6 +201,20 @@ static void mtk_smi_larb_config_port_gen2_general(struct device *dev)
>  		reg |= F_MMU_EN;
>  		writel(reg, larb->base + SMI_LARB_NONSEC_CON(i));
>  	}
> +
> +	if (larb->larb_gen->bwl)
> +		for (i = 0; i < larb->larb_gen->port_in_larb[larb->larbid]; i++)
> +			writel_relaxed(larb->larb_gen->bwl[larb->larbid *
> +				       SMI_LARB_PORT_NR_MAX + i],
> +				       larb->base + SMI_LARB_OSTDL_PORTx(i));

From this register name, I guess the name "bwl"(bandwidth limiter?) is
not so good. Maybe it should be called by "osdl". At least, you should
add a comment for this. like : u8  *bwl; /* for OSDL */

As below comment, If we don't have port_in_larb, always use 32 here, is
it OK? (writing 0 for the non-exist port).

> +
> +	if (larb->larb_gen->misc)
> +		for (i = 0, id = larb->larbid * SMI_LARB_MISC_NR;
> +			i < SMI_LARB_MISC_NR; i++, id++)
> +			writel_relaxed(larb->larb_gen->misc[id].value,
> +				       larb->base +
> +				       larb->larb_gen->misc[id].offset);

There are 3 intention, It's not easy to read. A not-strong suggestion:
we could add a new variable like has_bwc for mt6779 which have this
bandwidth initial setting. And use "u8 **" for bwl. then the code will
be like below:

struct mtk_smi_reg_pair *misc;
u8 *bwl;

if (!larb->larb_gen->has_bwc)
	return;

for (i = 0, bwl = larb->larb_gen->bwl[larb->larbid];
     i < larb->larb_gen->port_in_larb[larb->larbid]; i++)
	writel_relaxed(bwl[i], larb->base + SMI_LARB_OSTDL_PORTx(i));

for (i = 0,misc =larb->larb_gen->misc[larb->larbid];
     i < SMI_LARB_MISC_NR; i++)
	writel_relaxed(misc[i].value, larb->base + misc[i].offset);

the writel_relaxed can be finished in one line.


> +	wmb(); /* make sure settings are written */
>  }
>  
>  static void mtk_smi_larb_config_port_mt8173(struct device *dev)
> @@ -246,6 +291,55 @@ static void mtk_smi_larb_config_port_gen1(struct device *dev)
>  				      /* IPU0 | IPU1 | CCU */
>  };
>  
> +static u8 mtk_smi_larb_mt6779_bwl[MTK_LARB_NR_MAX][SMI_LARB_PORT_NR_MAX] = {

Add const.

Here the larb number in this SoC isn't MTK_LARB_NR_MAX(16). May be you
could use:
static const u8 mtk_smi_larb_mt6779_bwl[][SMI_LARB_PORT_NR_MAX]

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
> +static struct mtk_smi_reg_pair

const

> +	mtk_smi_larb_mt6779_misc[MTK_LARB_NR_MAX][SMI_LARB_MISC_NR] = {
> +	{{SMI_LARB_CMD_THRT_CON, 0x370256}, {SMI_LARB_SW_FLAG, 0x1},},
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

Move the mt6779 definition before mt8183.

> +	.port_in_larb = {9, 14, 12, 19, 0, 26, 3, 4, 10, 24, 31, 5,},

In mt2701, port_in_larb[n] is port_offset[n-1] + port_number[n-1].
It is not same with yours.

Maybe your definition is better, But If you change it, please also
change the mt2701. Make sure the meaning of port_in_larb are the same.

> +	.config_port  = mtk_smi_larb_config_port_gen2_general,
> +	.larb_direct_to_common_mask =
> +		BIT(4) | BIT(6) | BIT(11) | BIT(12) | BIT(13),
> +		/* DUMMY | IPU0 | IPU1 | CCU | MDLA */
> +	.bwl  = (u8 *)mtk_smi_larb_mt6779_bwl,

As above, here should be (u8 **).

> +	.misc = (struct mtk_smi_reg_pair *)mtk_smi_larb_mt6779_misc,
> +};
> +
>  static const struct of_device_id mtk_smi_larb_of_ids[] = {
>  	{
>  		.compatible = "mediatek,mt8173-smi-larb",
> @@ -260,6 +354,10 @@ static void mtk_smi_larb_config_port_gen1(struct device *dev)
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
> @@ -393,6 +491,29 @@ static int __maybe_unused mtk_smi_larb_suspend(struct device *dev)
>  		    F_MMU1_LARB(7),
>  };
>  
> +static u16 mtk_smi_common_mt6779_bwl[SMI_COMMON_LARB_NR_MAX] = {

const.

This bwl smi-common setting always have 8 register? Will it be changed?

How about below?:

static u16 mtk_smi_common_mt6779_bwl[] = {

Add a new variable in struct mtk_smi_common_plat.

larb_nr = ARRAY_SIZE(mtk_smi_common_mt6779_bwl)

> +	0x1000, 0x1000, 0x1000, 0x1000, 0x1000, 0x1000, 0x1000, 0x1000,
> +};
> +
> +static struct mtk_smi_reg_pair

const
> +	mtk_smi_common_mt6779_misc[SMI_COMMON_MISC_NR] = {

The tab in this line is unnecessary.

> +	{SMI_L1LEN, 0xb},
> +	{SMI_M4U_TH, 0xe100e10},
> +	{SMI_FIFO_TH1, 0x506090a},
> +	{SMI_FIFO_TH2, 0x506090a},
> +	{SMI_DCM, 0x4f1},
> +	{SMI_DUMMY, 0x1},


Do all the settings above(including smi-larb) may be changed dynamically
in different scenario? or all the setting only be set once?

> +};
> +
> +static const struct mtk_smi_common_plat mtk_smi_common_mt6779 = {

ditto. Move the mt6779 definition before mt8183.

> +	.gen      = MTK_SMI_GEN2,
> +	.has_gals = true,

If you also have has_gals, Please update the binding.

> +	.bus_sel  = F_MMU1_LARB(1) | F_MMU1_LARB(2) | F_MMU1_LARB(4) |
> +		    F_MMU1_LARB(5) | F_MMU1_LARB(6) | F_MMU1_LARB(7),
> +	.bwl      = mtk_smi_common_mt6779_bwl,
> +	.misc     = mtk_smi_common_mt6779_misc,
> +};
> +
>  static const struct of_device_id mtk_smi_common_of_ids[] = {
>  	{
>  		.compatible = "mediatek,mt8173-smi-common",
> @@ -407,6 +528,10 @@ static int __maybe_unused mtk_smi_larb_suspend(struct device *dev)
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
> @@ -484,7 +609,7 @@ static int __maybe_unused mtk_smi_common_resume(struct device *dev)
>  {
>  	struct mtk_smi *common = dev_get_drvdata(dev);
>  	u32 bus_sel = common->plat->bus_sel;
> -	int ret;
> +	int i, ret;
>  
>  	ret = mtk_smi_clk_enable(common);
>  	if (ret) {
> @@ -494,6 +619,18 @@ static int __maybe_unused mtk_smi_common_resume(struct device *dev)
>  
>  	if (common->plat->gen == MTK_SMI_GEN2 && bus_sel)
>  		writel(bus_sel, common->base + SMI_BUS_SEL);

SMI_BUS_SEL looks can be a register in your common->plat->misc.
This should be done in another patch.

> +
> +	if (common->plat->bwl)
> +		for (i = 0; i < SMI_COMMON_LARB_NR_MAX; i++)
> +			writel_relaxed(common->plat->bwl[i],
> +				       common->base + SMI_L1ARB(i));

From the register name, the "bwl" also is not so good. add a comment or
rename it like "l1arb"?

> +
> +	if (common->plat->misc)
> +		for (i = 0; i < SMI_COMMON_MISC_NR; i++)
> +			writel_relaxed(common->plat->misc[i].value,
> +				       common->base +
> +				       common->plat->misc[i].offset);
> +	wmb(); /* make sure settings are written */
>  	return 0;
>  }
>  

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
