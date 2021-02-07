Return-Path: <SRS0=0SFh=HJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78820C433E0
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Feb 2021 02:27:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E72B764E30
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Feb 2021 02:27:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E72B764E30
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dGrE02xrGWjssRgu0iB3XT0pDx83yD4qLNunWI/RksQ=; b=qMzie/Jk/6n1OqygZTUHkWsAq
	Xp42A5MV1iCgoIIGxwJE4gbQJyUZJyf5lcJw4cWzrcgM+P+Ks4xQ8MARmGPBDmunNptHS0nAW0gu/
	dizpG1Acu8mS45BCLZ3VmgVI/bqKTO3zI5ffVHJLVZt6hlTeRw7lTTGZ1Jd1grNyf/kz9dVHmm+9N
	z4f/6Ps9WxDvPendvLUM8jbjKxHnnS5deg42nbL1uMd2AgCVsohp2fiXoRdtEYbLDJXvo2Y2RNdqW
	/9zGd6vwxZz8ryL5MB/Oa9EBAz6iW9Nxn9QPQUPcSvY87U6zO/+M2rESJlMfb1emwQLMj1r7KQIuT
	3d4f93UWA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8ZnT-0006ng-04; Sun, 07 Feb 2021 02:27:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8ZnQ-0006n1-9P; Sun, 07 Feb 2021 02:27:33 +0000
X-UUID: 89f2abbf11614e1ead74bfa1e879ca27-20210206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=VLQS2kgvcrI9d6jQ5mQub6mDEUycbvfHKHDUC9bWkD4=; 
 b=ZBcJVlW8Ug6o0RvuM6UBbpNtvRd/KcfaU2J/kbzSFXnXXqIbHXZgtzyAjUKCrM6demTCC4WSgxjsuTmmbBnaKTVU+6JqtNeMVi3I5wqTmycsV88mm95LaKj20enjw0SfP4b1ZWXOM0mU+zP6NfPRFAZiR6MZjyrm5iuAfWVlX34=;
X-UUID: 89f2abbf11614e1ead74bfa1e879ca27-20210206
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 71108271; Sat, 06 Feb 2021 18:27:26 -0800
Received: from MTKMBS32N2.mediatek.inc (172.27.4.72) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 6 Feb 2021 18:27:19 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS32N2.mediatek.inc
 (172.27.4.72) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sun, 7 Feb 2021 10:27:14 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 7 Feb 2021 10:27:13 +0800
Message-ID: <1612664833.5147.30.camel@mhfsdcap03>
Subject: Re: [RFC PATCH v2 2/3] usb: xhci-mtk: modify the SOF/ITP interval
 for mt8195
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mathias Nyman <mathias.nyman@intel.com>
Date: Sun, 7 Feb 2021 10:27:13 +0800
In-Reply-To: <20210203102642.7353-2-chunfeng.yun@mediatek.com>
References: <20210203102642.7353-1-chunfeng.yun@mediatek.com>
 <20210203102642.7353-2-chunfeng.yun@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1B014D2086C1D7CBBFCF7F12F97C71D0892D48B7553418545A58616630F2A3202000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210206_212732_565776_60B2A829 
X-CRM114-Status: GOOD (  23.92  )
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
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 Mathias Nyman <mathias.nyman@intel.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Ikjoon Jang <ikjn@chromium.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Mathias,

On Wed, 2021-02-03 at 18:26 +0800, Chunfeng Yun wrote:
> There are 4 USB controllers on MT8195, the controllers (IP1~IP3,
> exclude IP0) have a wrong default SOF/ITP interval which is
> calculated from the frame counter clock 24Mhz by default, but
> in fact, the frame counter clock is 48Mhz, so we should set
> the accurate interval according to 48Mhz for those controllers.
> Note: the first controller no need set it.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2: fix typo of comaptible
> ---
>  drivers/usb/host/xhci-mtk.c | 63 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
> 
> diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
> index 8f321f39ab96..0a68c4ac8b48 100644
> --- a/drivers/usb/host/xhci-mtk.c
> +++ b/drivers/usb/host/xhci-mtk.c
> @@ -68,11 +68,71 @@
>  #define SSC_IP_SLEEP_EN	BIT(4)
>  #define SSC_SPM_INT_EN		BIT(1)
>  
Can I Read/Write the following xHCI controller's registers  in
xhci-mtk.c?

Ideally, xhci-mtk.c should not access them, because xhci-mtk is only a
glue driver used to initialize clocks/power and IPPC registers which
don't belong to xHCI controller.

Thanks

> +/* xHCI csr */
> +#define LS_EOF			0x930
> +#define LS_EOF_OFFSET		0x89
> +
> +#define FS_EOF			0x934
> +#define FS_EOF_OFFSET		0x2e
> +
> +#define SS_GEN1_EOF		0x93c
> +#define SS_GEN1_EOF_OFFSET	0x78
> +
> +#define HFCNTR_CFG		0x944
> +#define ITP_DELTA_CLK		(0xa << 1)
> +#define ITP_DELTA_CLK_MASK	GENMASK(5, 1)
> +#define FRMCNT_LEV1_RANG	(0x12b << 8)
> +#define FRMCNT_LEV1_RANG_MASK	GENMASK(19, 8)
> +
> +#define SS_GEN2_EOF		0x990
> +#define SS_GEN2_EOF_OFFSET	0x3c
> +#define EOF_OFFSET_MASK		GENMASK(11, 0)
> +
>  enum ssusb_uwk_vers {
>  	SSUSB_UWK_V1 = 1,
>  	SSUSB_UWK_V2,
>  };
>  
> +/*
> + * MT8195 has 4 controllers, the controller1~3's default SOF/ITP interval
> + * is calculated from the frame counter clock 24M, but in fact, the clock
> + * is 48M, so need change the interval.
> + */
> +static void xhci_mtk_set_frame_interval(struct xhci_hcd_mtk *mtk)
> +{
> +	struct device *dev = mtk->dev;
> +	struct usb_hcd *hcd = mtk->hcd;
> +	u32 value;
> +
> +	if (!of_device_is_compatible(dev->of_node, "mediatek,mt8195-xhci"))
> +		return;
> +
> +	value = readl(hcd->regs + HFCNTR_CFG);
> +	value &= ~(ITP_DELTA_CLK_MASK | FRMCNT_LEV1_RANG_MASK);
> +	value |= (ITP_DELTA_CLK | FRMCNT_LEV1_RANG);
> +	writel(value, hcd->regs + HFCNTR_CFG);
> +
> +	value = readl(hcd->regs + LS_EOF);
> +	value &= ~EOF_OFFSET_MASK;
> +	value |= LS_EOF_OFFSET;
> +	writel(value, hcd->regs + LS_EOF);
> +
> +	value = readl(hcd->regs + FS_EOF);
> +	value &= ~EOF_OFFSET_MASK;
> +	value |= FS_EOF_OFFSET;
> +	writel(value, hcd->regs + FS_EOF);
> +
> +	value = readl(hcd->regs + SS_GEN1_EOF);
> +	value &= ~EOF_OFFSET_MASK;
> +	value |= SS_GEN1_EOF_OFFSET;
> +	writel(value, hcd->regs + SS_GEN1_EOF);
> +
> +	value = readl(hcd->regs + SS_GEN2_EOF);
> +	value &= ~EOF_OFFSET_MASK;
> +	value |= SS_GEN2_EOF_OFFSET;
> +	writel(value, hcd->regs + SS_GEN2_EOF);
> +}
> +
>  static int xhci_mtk_host_enable(struct xhci_hcd_mtk *mtk)
>  {
>  	struct mu3c_ippc_regs __iomem *ippc = mtk->ippc_regs;
> @@ -407,6 +467,8 @@ static int xhci_mtk_setup(struct usb_hcd *hcd)
>  		ret = xhci_mtk_ssusb_config(mtk);
>  		if (ret)
>  			return ret;
> +
> +		xhci_mtk_set_frame_interval(mtk);
>  	}
>  
>  	ret = xhci_gen_setup(hcd, xhci_mtk_quirks);
> @@ -655,6 +717,7 @@ static const struct dev_pm_ops xhci_mtk_pm_ops = {
>  #ifdef CONFIG_OF
>  static const struct of_device_id mtk_xhci_of_match[] = {
>  	{ .compatible = "mediatek,mt8173-xhci"},
> +	{ .compatible = "mediatek,mt8195-xhci"},
>  	{ .compatible = "mediatek,mtk-xhci"},
>  	{ },
>  };

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
