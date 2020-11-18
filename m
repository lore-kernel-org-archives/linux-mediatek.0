Return-Path: <SRS0=HQvY=EY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF7AAC5519F
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2020 11:41:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B1642225B
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2020 11:41:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YxWKvtp5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="uDAXjzxs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B1642225B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dX9Q+jecBVrgygYf8FPAP8qus1yHKJlxGXz1wnlwL2s=; b=YxWKvtp5/WtiegCdGUoB3Tf9X
	V02tDP1WeG1R7LMMHEgqz8wz2oohjhCqaUjs7nMcy0uLQXbi1OxyJtNvma0A/2/qbNQRz72+ojY1j
	3Ztk3lkuBktOIC7k00iOpqNs2yeJBYmCt/bALh3IVQX6OihyXD87YUS1S/nXZgOB72VIbpjf66v1S
	XVMt0HmWlITlwrHwIojG7JTZw/ahGMBVIAGyaYkC3mtAaQlxVNEkauR+K5L5pzE4U+xKjtuVj36ft
	6XYE9wicZl8xJQqmEful+EMYXhDBtEiJAD1Gwfe8kNu8hQVP+OutbGfUuF84kxp8XIAm6HpDEu+oa
	LndRO/m3g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfLpq-0003Ez-EY; Wed, 18 Nov 2020 11:41:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfLpl-0003Db-5j; Wed, 18 Nov 2020 11:41:12 +0000
X-UUID: 9b9ae80fa2f944a59ce72aec71f9d995-20201118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=8hI5pE/fW5YE4WRcx9jY+XE+a4953PtVWG78c5fIJaU=; 
 b=uDAXjzxsI+dQ8rCJMwCIq4GcBB/6VJnL3N/5c2nEoIc7Dq7rn3b7jcqNV8RksCoCJ4ynfDAnaaiwFA57Z4Uhy5eqR0MWaBvATZXyBp1yrR9gYYX67X+DrKL3JVDJbpipmJqtp+CYhgh1lfsUIdSNAlf+BJ9r3s4dP1kp6iWR8jE=;
X-UUID: 9b9ae80fa2f944a59ce72aec71f9d995-20201118
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 641577561; Wed, 18 Nov 2020 03:40:50 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Nov 2020 03:40:59 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Nov 2020 19:40:58 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 18 Nov 2020 19:40:57 +0800
Message-ID: <1605699658.24420.3.camel@mtksdaap41>
Subject: Re: [PATCH v3 2/4] soc: mediatek: pwrap: add arbiter capability
From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Wed, 18 Nov 2020 19:40:58 +0800
In-Reply-To: <46c0e204-b5e2-4ee3-678b-e09844442aad@gmail.com>
References: <1600686235-27979-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1600686235-27979-3-git-send-email-hsin-hsiung.wang@mediatek.com>
 <46c0e204-b5e2-4ee3-678b-e09844442aad@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_064109_435323_AB9B8AF9 
X-CRM114-Status: GOOD (  28.68  )
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
Cc: devicetree@vger.kernel.org, drinkcat@chromium.org,
 srv_heupstream@mediatek.com, Argus Lin <argus.lin@mediatek.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, hsin-hsiung.wang@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On Mon, 2020-09-21 at 18:48 +0200, Matthias Brugger wrote:
> 
> On 21/09/2020 13:03, Hsin-Hsiung Wang wrote:
> > Add arbiter capability for pwrap driver.
> 
> Can you provide a bit more verbose commit message, please.
> 
Thanks for reviewing. I will update it in next patch.

> > This patch is preparing for adding mt6873/8192 pwrap support.
> > 
> > Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> > ---
> >   drivers/soc/mediatek/mtk-pmic-wrap.c | 57 ++++++++++++++++++++++++++++++------
> >   1 file changed, 48 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
> > index c897205..149bf02 100644
> > --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
> > +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
> > @@ -25,10 +25,12 @@
> >   
> >   /* macro for wrapper status */
> >   #define PWRAP_GET_WACS_RDATA(x)		(((x) >> 0) & 0x0000ffff)
> > +#define PWRAP_GET_WACS_ARB_FSM(x)	(((x) >> 1) & 0x00000007)
> >   #define PWRAP_GET_WACS_FSM(x)		(((x) >> 16) & 0x00000007)
> >   #define PWRAP_GET_WACS_REQ(x)		(((x) >> 19) & 0x00000001)
> >   #define PWRAP_STATE_SYNC_IDLE0		BIT(20)
> >   #define PWRAP_STATE_INIT_DONE0		BIT(21)
> > +#define PWRAP_STATE_INIT_DONE1		BIT(15)
> >   
> >   /* macro for WACS FSM */
> >   #define PWRAP_WACS_FSM_IDLE		0x00
> > @@ -74,6 +76,7 @@
> >   #define PWRAP_CAP_DCM		BIT(2)
> >   #define PWRAP_CAP_INT1_EN	BIT(3)
> >   #define PWRAP_CAP_WDT_SRC1	BIT(4)
> > +#define PWRAP_CAP_ARB		BIT(5)
> >   
> >   /* defines for slave device wrapper registers */
> >   enum dew_regs {
> > @@ -340,6 +343,8 @@ enum pwrap_regs {
> >   	PWRAP_DCM_DBC_PRD,
> >   	PWRAP_EINT_STA0_ADR,
> >   	PWRAP_EINT_STA1_ADR,
> > +	PWRAP_SWINF_2_WDATA_31_0,
> > +	PWRAP_SWINF_2_RDATA_31_0,
> >   
> >   	/* MT2701 only regs */
> >   	PWRAP_ADC_CMD_ADDR,
> > @@ -1108,14 +1113,22 @@ static void pwrap_writel(struct pmic_wrapper *wrp, u32 val, enum pwrap_regs reg)
> >   
> >   static bool pwrap_is_fsm_idle(struct pmic_wrapper *wrp)
> >   {
> > -	u32 val = pwrap_readl(wrp, PWRAP_WACS2_RDATA);
> > +	u32 val;
> > +
> > +	val = pwrap_readl(wrp, PWRAP_WACS2_RDATA);
> > +	if (HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB))
> > +		return PWRAP_GET_WACS_ARB_FSM(val) == PWRAP_WACS_FSM_IDLE;
> >   
> >   	return PWRAP_GET_WACS_FSM(val) == PWRAP_WACS_FSM_IDLE;
> >   }
> >   
> >   static bool pwrap_is_fsm_vldclr(struct pmic_wrapper *wrp)
> >   {
> > -	u32 val = pwrap_readl(wrp, PWRAP_WACS2_RDATA);
> > +	u32 val;
> > +
> > +	val = pwrap_readl(wrp, PWRAP_WACS2_RDATA);
> > +	if (HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB))
> > +		return PWRAP_GET_WACS_ARB_FSM(val) == PWRAP_WACS_FSM_WFVLDCLR;
> >   
> >   	return PWRAP_GET_WACS_FSM(val) == PWRAP_WACS_FSM_WFVLDCLR;
> >   }
> > @@ -1165,6 +1178,7 @@ static int pwrap_wait_for_state(struct pmic_wrapper *wrp,
> >   static int pwrap_read16(struct pmic_wrapper *wrp, u32 adr, u32 *rdata)
> >   {
> >   	int ret;
> > +	u32 val;
> >   
> >   	ret = pwrap_wait_for_state(wrp, pwrap_is_fsm_idle);
> >   	if (ret) {
> > @@ -1172,13 +1186,21 @@ static int pwrap_read16(struct pmic_wrapper *wrp, u32 adr, u32 *rdata)
> >   		return ret;
> >   	}
> >   
> > -	pwrap_writel(wrp, (adr >> 1) << 16, PWRAP_WACS2_CMD);
> > +	if (HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB))
> > +		val = adr;
> > +	else
> > +		val = (adr >> 1) << 16;
> > +	pwrap_writel(wrp, val, PWRAP_WACS2_CMD);
> >   
> >   	ret = pwrap_wait_for_state(wrp, pwrap_is_fsm_vldclr);
> >   	if (ret)
> >   		return ret;
> >   
> > -	*rdata = PWRAP_GET_WACS_RDATA(pwrap_readl(wrp, PWRAP_WACS2_RDATA));
> > +	if (HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB))
> > +		val = pwrap_readl(wrp, PWRAP_SWINF_2_RDATA_31_0);
> > +	else
> > +		val = pwrap_readl(wrp, PWRAP_WACS2_RDATA);
> > +	*rdata = PWRAP_GET_WACS_RDATA(val);
> >   
> >   	pwrap_writel(wrp, 1, PWRAP_WACS2_VLDCLR);
> >   
> > @@ -1228,8 +1250,13 @@ static int pwrap_write16(struct pmic_wrapper *wrp, u32 adr, u32 wdata)
> >   		return ret;
> >   	}
> >   
> > -	pwrap_writel(wrp, (1 << 31) | ((adr >> 1) << 16) | wdata,
> > -		     PWRAP_WACS2_CMD);
> > +	if (!HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB)) {
> 
> Please switch if's so that we take the else branch on the arbiter not present 
> case. Or the other way round, just make it uniform, where possible, of course.
> 

Thanks, I will update it in next patch.

> > +		pwrap_writel(wrp, BIT(31) | ((adr >> 1) << 16) | wdata,
> > +			     PWRAP_WACS2_CMD);
> > +	} else {
> > +		pwrap_writel(wrp, wdata, PWRAP_SWINF_2_WDATA_31_0);
> > +		pwrap_writel(wrp, BIT(29) | adr, PWRAP_WACS2_CMD);
> > +	}
> >   
> >   	return 0;
> >   }
> > @@ -2022,6 +2049,7 @@ MODULE_DEVICE_TABLE(of, of_pwrap_match_tbl);
> >   static int pwrap_probe(struct platform_device *pdev)
> >   {
> >   	int ret, irq;
> > +	u32 mask_done;
> >   	struct pmic_wrapper *wrp;
> >   	struct device_node *np = pdev->dev.of_node;
> >   	const struct of_device_id *of_slave_id = NULL;
> > @@ -2116,14 +2144,21 @@ static int pwrap_probe(struct platform_device *pdev)
> >   		}
> >   	}
> >   
> > -	if (!(pwrap_readl(wrp, PWRAP_WACS2_RDATA) & PWRAP_STATE_INIT_DONE0)) {
> > +	if (HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB))
> > +		mask_done = PWRAP_STATE_INIT_DONE1;
> > +	else
> > +		mask_done = PWRAP_STATE_INIT_DONE0;
> > +
> > +	if (!(pwrap_readl(wrp, PWRAP_WACS2_RDATA) & mask_done)) {
> >   		dev_dbg(wrp->dev, "initialization isn't finished\n");
> >   		ret = -ENODEV;
> >   		goto err_out2;
> >   	}
> >   
> >   	/* Initialize watchdog, may not be done by the bootloader */
> > -	pwrap_writel(wrp, 0xf, PWRAP_WDT_UNIT);
> > +	if (!HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB))
> > +		pwrap_writel(wrp, 0xf, PWRAP_WDT_UNIT);
> > +
> 
> Whats the connection between an arbiter being present and the watchdog?
> 

Thanks for reviewing.
The arbiter capability uses new design of pwrap.
This design cannot change the watch dog timer, So I add it here.
Is it better to use another capability to define it?

> Regards,
> Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
