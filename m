Return-Path: <SRS0=A+tK=A7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 287B2C433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2020 08:21:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C24E421775
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2020 08:21:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uhV1tn+Z";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="dN0cDvbA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C24E421775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FdL8rN5WF4o028z+VRz6WYtLhpjIXnw8x9a6cB5XuaE=; b=uhV1tn+ZWhvnHjTeZQm1Vans1
	d5Ug1XRUDTRBIk4R0rZeyrwWXESQ8w1UcNEfLdbPsWPcvLlfwbwRxmOaNObQn5wnQKLU1iGKspcOG
	UNlNK0X7ngWG55HyBgsWHAlhMfRWE5fYJPP7x1QL67YArBvAKUC7daHtUVgLL8osrnyV4lnlkHpe8
	qe1yO6Ly5+ck+2f/fLNp84ZAXG9e3h1IOJOBGwReRKL33T9qeMY1/DJIZ+DIOafA+sN5YL+GI1rfw
	GEhc5OaOrvZrlvgA9UC11xjG/8n3aGJcYo2o/INlAcb4t/iGrOgmP1Vcr1KRzr6Upsq84XtX+ozYO
	hiXk7eWzg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxR3B-00040w-4y; Mon, 20 Jul 2020 08:21:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxR36-00040F-Jy; Mon, 20 Jul 2020 08:21:26 +0000
X-UUID: 8ed3dec831fe4a8fb57c9fb98e0a974f-20200720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=dwE60hVITmiNcb1qjM+zqce6uW6xpkvHroAQBaYHFeU=; 
 b=dN0cDvbARkWYmp8TjvzkLUkAVgUGxWtIxHzCPvq3+jkAgCjY6h4BZL3khsaI0cvVyJ/ySS5CSzt+s9puKACGoyWAeGkcFKc2X52qn5Zd2lmfskFlAvCndWMmvZ0r9KBOfZVrZv5RV4UWkPai7z9pq493bKJKoZ3ejP3Q8eQ8GkQ=;
X-UUID: 8ed3dec831fe4a8fb57c9fb98e0a974f-20200720
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chun-hung.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 824225309; Mon, 20 Jul 2020 00:21:52 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 20 Jul 2020 01:21:16 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 20 Jul 2020 16:21:14 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 20 Jul 2020 16:21:13 +0800
Message-ID: <1595233274.9207.3.camel@mtkswgap22>
Subject: Re: [PATCH v6 3/4] mmc: mediatek: command queue support
From: Chun-Hung Wu <chun-hung.wu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Mon, 20 Jul 2020 16:21:14 +0800
In-Reply-To: <41a6af77-cd90-5a1a-7405-cec003e7abb6@gmail.com>
References: <1591665502-6573-1-git-send-email-chun-hung.wu@mediatek.com>
 <1591665502-6573-4-git-send-email-chun-hung.wu@mediatek.com>
 <41a6af77-cd90-5a1a-7405-cec003e7abb6@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: E00E31567D9307577DF3C1D057B3DF278A6A07CC0C064BC50F8FD27F1CBA28172000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_042124_973545_1B8037CC 
X-CRM114-Status: GOOD (  32.22  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Kate
 Stewart <kstewart@linuxfoundation.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 wsd_upstream <wsd_upstream@mediatek.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, Linus
 Walleij <linus.walleij@linaro.org>, Al Cooper <alcooperx@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Andy Gross <agross@kernel.org>, "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>,
 Chaotian Jing =?UTF-8?Q?=28=E4=BA=95=E6=9C=9D=E5=A4=A9=29?=
 <Chaotian.Jing@mediatek.com>,
 "kernel-team@android.com" <kernel-team@android.com>,
 Pan Bian <bianpan2016@163.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "mirq-linux@rere.qmqm.pl" <mirq-linux@rere.qmqm.pl>, Rob
 Herring <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Thomas
 Gleixner <tglx@linutronix.de>,
 Stanley Chu =?UTF-8?Q?=28=E6=9C=B1=E5=8E=9F=E9=99=9E=29?=
 <stanley.chu@mediatek.com>, Allison Randal <allison@lohutok.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Mathieu Malaterre <malat@debian.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kuohong Wang =?UTF-8?Q?=28=E7=8E=8B=E5=9C=8B=E9=B4=BB=29?=
 <kuohong.wang@mediatek.com>, Adrian Hunter <adrian.hunter@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-06-09 at 19:28 +0800, Matthias Brugger wrote:
> 
> On 09/06/2020 03:18, Chun-Hung Wu wrote:
> > Support command queue for mt6779 platform.
> > a. Add msdc_set_busy_timeout() to calculate emmc write timeout.
> > b. Connect mtk msdc driver to cqhci driver through
> >    host->cq_host->ops = &msdc_cmdq_ops;
> > c. msdc_cmdq_irq() will link up with cqchi_irq(). Besides, it provides
> >    more irq error messages like RSPCRCERR/CMDTO/DATACRCERR/DATTMO.
> > d. Use the options below to separate support for CQHCI or not, because
> >    some of our platform does not support CQHCI hence no kernel option:
> >    CONFIG_MMC_CQHCI.
> >    #if IS_ENABLED(CONFIG_MMC_CQHCI)
> >    XXX //Support CQHCI
> >    #else
> >    XXX //Not support CQHCI
> >    #endif
> > 
> 
> I think that we don't need the #if IS_ENABLED() because we add a boolean in the
> msdc_host.
Select MMC_CQHCI for MMC_MTK in patch v7, "#if IS_ENABLED()" has been
removed.
> 
> > Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> > ---
> >  drivers/mmc/host/mtk-sd.c | 119 ++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 119 insertions(+)
> > 
> > diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> > index 84a7bd44..9d69269 100644
> > --- a/drivers/mmc/host/mtk-sd.c
> > +++ b/drivers/mmc/host/mtk-sd.c
> > @@ -31,6 +31,8 @@
> >  #include <linux/mmc/sdio.h>
> >  #include <linux/mmc/slot-gpio.h>
> >  
> > +#include "cqhci.h"
> > +
> >  #define MAX_BD_NUM          1024
> >  
> >  /*--------------------------------------------------------------------------*/
> > @@ -152,6 +154,7 @@
> >  #define MSDC_INT_DMA_BDCSERR    (0x1 << 17)	/* W1C */
> >  #define MSDC_INT_DMA_GPDCSERR   (0x1 << 18)	/* W1C */
> >  #define MSDC_INT_DMA_PROTECT    (0x1 << 19)	/* W1C */
> > +#define MSDC_INT_CMDQ           (0x1 << 28)	/* W1C */
> >  
> >  /* MSDC_INTEN mask */
> >  #define MSDC_INTEN_MMCIRQ       (0x1 << 0)	/* RW */
> > @@ -182,6 +185,7 @@
> >  /* SDC_CFG mask */
> >  #define SDC_CFG_SDIOINTWKUP     (0x1 << 0)	/* RW */
> >  #define SDC_CFG_INSWKUP         (0x1 << 1)	/* RW */
> > +#define SDC_CFG_WRDTOC          (0x1fff  << 2)  /* RW */
> >  #define SDC_CFG_BUSWIDTH        (0x3 << 16)	/* RW */
> >  #define SDC_CFG_SDIO            (0x1 << 19)	/* RW */
> >  #define SDC_CFG_SDIOIDE         (0x1 << 20)	/* RW */
> > @@ -230,6 +234,7 @@
> >  #define MSDC_PATCH_BIT_DECRCTMO   (0x1 << 30)	/* RW */
> >  
> >  #define MSDC_PATCH_BIT1_CMDTA     (0x7 << 3)    /* RW */
> > +#define MSDC_PB1_BUSY_CHECK_SEL   (0x1 << 7)    /* RW */
> >  #define MSDC_PATCH_BIT1_STOP_DLY  (0xf << 8)    /* RW */
> >  
> >  #define MSDC_PATCH_BIT2_CFGRESP   (0x1 << 15)   /* RW */
> > @@ -431,9 +436,11 @@ struct msdc_host {
> >  				 /* cmd response sample selection for HS400 */
> >  	bool hs400_mode;	/* current eMMC will run at hs400 mode */
> >  	bool internal_cd;	/* Use internal card-detect logic */
> > +	bool cqhci;		/* support eMMC hw cmdq */
> >  	struct msdc_save_para save_para; /* used when gate HCLK */
> >  	struct msdc_tune_para def_tune_para; /* default tune setting */
> >  	struct msdc_tune_para saved_tune_para; /* tune result of CMD21/CMD19 */
> > +	struct cqhci_host *cq_host;
> >  };
> >  
> >  static const struct mtk_mmc_compatible mt8135_compat = {
> > @@ -764,6 +771,15 @@ static void msdc_set_timeout(struct msdc_host *host, u64 ns, u64 clks)
> >  		      (u32)(timeout > 255 ? 255 : timeout));
> >  }
> >  
> > +static void msdc_set_busy_timeout(struct msdc_host *host, u64 ns, u64 clks)
> > +{
> > +	u64 timeout;
> > +
> > +	timeout = msdc_timeout_cal(host, ns, clks);
> > +	sdr_set_field(host->base + SDC_CFG, SDC_CFG_WRDTOC,
> > +		      (u32)(timeout > 8191 ? 8191 : timeout));
> > +}
> > +
> >  static void msdc_gate_clock(struct msdc_host *host)
> >  {
> >  	clk_disable_unprepare(host->src_clk_cg);
> > @@ -1480,6 +1496,36 @@ static void msdc_enable_sdio_irq(struct mmc_host *mmc, int enb)
> >  		pm_runtime_put_noidle(host->dev);
> >  }
> >  
> > +#if IS_ENABLED(CONFIG_MMC_CQHCI)
> > +static irqreturn_t msdc_cmdq_irq(struct msdc_host *host, u32 intsts)
> > +{
> > +	int cmd_err = 0, dat_err = 0;
> > +
> > +	if (intsts & MSDC_INT_RSPCRCERR) {
> > +		cmd_err = -EILSEQ;
> > +		dev_err(host->dev, "%s: CMD CRC ERR", __func__);
> > +	} else if (intsts & MSDC_INT_CMDTMO) {
> > +		cmd_err = -ETIMEDOUT;
> > +		dev_err(host->dev, "%s: CMD TIMEOUT ERR", __func__);
> > +	}
> > +
> > +	if (intsts & MSDC_INT_DATCRCERR) {
> > +		dat_err = -EILSEQ;
> > +		dev_err(host->dev, "%s: DATA CRC ERR", __func__);
> > +	} else if (intsts & MSDC_INT_DATTMO) {
> > +		dat_err = -ETIMEDOUT;
> > +		dev_err(host->dev, "%s: DATA TIMEOUT ERR", __func__);
> > +	}
> > +
> > +	if (cmd_err || dat_err) {
> > +		dev_err(host->dev, "cmd_err = %d, dat_err =%d, intsts = 0x%x",
> > +			cmd_err, dat_err, intsts);
> > +	}
> > +
> > +	return cqhci_irq(host->mmc, 0, cmd_err, dat_err);
> > +}
> > +#endif
> > +
> >  static irqreturn_t msdc_irq(int irq, void *dev_id)
> >  {
> >  	struct msdc_host *host = (struct msdc_host *) dev_id;
> > @@ -1516,6 +1562,16 @@ static irqreturn_t msdc_irq(int irq, void *dev_id)
> >  		if (!(events & (event_mask & ~MSDC_INT_SDIOIRQ)))
> >  			break;
> >  
> > +#if IS_ENABLED(CONFIG_MMC_CQHCI)
> > +		if ((host->mmc->caps2 & MMC_CAP2_CQE) &&
> > +		    (events & MSDC_INT_CMDQ)) {
> > +			msdc_cmdq_irq(host, events);
> > +			/* clear interrupts */
> > +			writel(events, host->base + MSDC_INT);
> > +			return IRQ_HANDLED;
> > +		}
> > +#endif
> > +
> >  		if (!mrq) {
> >  			dev_err(host->dev,
> >  				"%s: MRQ=NULL; events=%08X; event_mask=%08X\n",
> > @@ -2200,6 +2256,36 @@ static int msdc_get_cd(struct mmc_host *mmc)
> >  		return !val;
> >  }
> >  
> > +static void msdc_cqe_enable(struct mmc_host *mmc)
> > +{
> > +	struct msdc_host *host = mmc_priv(mmc);
> > +
> > +	/* enable cmdq irq */
> > +	writel(MSDC_INT_CMDQ, host->base + MSDC_INTEN);
> > +	/* enable busy check */
> > +	sdr_set_bits(host->base + MSDC_PATCH_BIT1, MSDC_PB1_BUSY_CHECK_SEL);
> > +	/* default write data / busy timeout 20s */
> > +	msdc_set_busy_timeout(host, 20 * 1000000000ULL, 0);
> > +	/* default read data timeout 1s */
> > +	msdc_set_timeout(host, 1000000000ULL, 0);
> > +}
> > +
> > +void msdc_cqe_disable(struct mmc_host *mmc, bool recovery)
> > +{
> > +	struct msdc_host *host = mmc_priv(mmc);
> > +
> > +	/* disable cmdq irq */
> > +	sdr_clr_bits(host->base + MSDC_INTEN, MSDC_INT_CMDQ);
> > +	/* disable busy check */
> > +	sdr_clr_bits(host->base + MSDC_PATCH_BIT1, MSDC_PB1_BUSY_CHECK_SEL);
> > +
> > +	if (recovery) {
> > +		sdr_set_field(host->base + MSDC_DMA_CTRL,
> > +			      MSDC_DMA_CTRL_STOP, 1);
> > +		msdc_reset_hw(host);
> > +	}
> > +}
> > +
> >  static const struct mmc_host_ops mt_msdc_ops = {
> >  	.post_req = msdc_post_req,
> >  	.pre_req = msdc_pre_req,
> > @@ -2216,6 +2302,11 @@ static int msdc_get_cd(struct mmc_host *mmc)
> >  	.hw_reset = msdc_hw_reset,
> >  };
> >  
> > +static const struct cqhci_host_ops msdc_cmdq_ops = {
> > +	.enable         = msdc_cqe_enable,
> > +	.disable        = msdc_cqe_disable,
> > +};
> > +
> >  static void msdc_of_property_parse(struct platform_device *pdev,
> >  				   struct msdc_host *host)
> >  {
> > @@ -2236,6 +2327,12 @@ static void msdc_of_property_parse(struct platform_device *pdev,
> >  		host->hs400_cmd_resp_sel_rising = true;
> >  	else
> >  		host->hs400_cmd_resp_sel_rising = false;
> > +
> > +	if (of_property_read_bool(pdev->dev.of_node,
> > +				  "mediatek,cqhci"))
> > +		host->cqhci = true;
> > +	else
> > +		host->cqhci = false;
> 
> Does this mean that there are mt6779 contoller which do not support cqhci?
> Otherwise could add the boolean in struct mtk_mmc_compatible and get rid of the
> device tree requirement.
Will use native dt-bindings 'supports-cqe' to decide support cqhci or
no-cqhci.
> 
> Regards,
> Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
