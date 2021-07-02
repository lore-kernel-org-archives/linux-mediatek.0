Return-Path: <SRS0=VpQz=L2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5142CC11F68
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jul 2021 08:33:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1571A61411
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jul 2021 08:33:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1571A61411
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZDK84JISHtUjLbgdlfI5ZD9vZruzp2le+7pZwwGIHzA=; b=hyZ/i52+9oI57i
	iZqwHXOcDWqo8Ra9Ztw1T0k54uZRTidFGrMMcrCiPRO08eWsrIqFHmSA5zWV3M8Du8YDLFz7y5+kJ
	STgyvTLmn/Fg33KfXURySq49gp6Ds9c1CSRsCXpw9U686Bc29UWyz5QcFJgbqMidM5HEU49+Q7ErH
	4BrNZmGTHRGa/k39TS9X2GhGlpN2jmG1JLsknAkUlZ3f/JfO91Vde4K3t65oV+NIYifzH54xRoxN5
	nz0nJQ2lJFAlNTxVCaONS7nrqZGLp/ZX/mnIHOw801ePDOvbEjXKFP6P75ku6sAUPw9xvfDAOiqfp
	HHgAfSiKhjV2HqtmbQxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzEcC-002Tex-Fi; Fri, 02 Jul 2021 08:33:36 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzEc9-002TdR-03
 for linux-mediatek@lists.infradead.org; Fri, 02 Jul 2021 08:33:34 +0000
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1lzEbx-0002MD-KP; Fri, 02 Jul 2021 10:33:21 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1lzEbt-0002gx-GA; Fri, 02 Jul 2021 10:33:17 +0200
Message-ID: <bf4f26cdca7174ba687e29a581a5276511112fe7.camel@pengutronix.de>
Subject: Re: [PATCH v19 3/7] soc: mediatek: SVS: introduce MTK SVS engine
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Roger Lu <roger.lu@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,  Enric Balletbo Serra <eballetbo@gmail.com>,
 Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Nicolas Boichat <drinkcat@google.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Fan Chen <fan.chen@mediatek.com>, HenryC Chen
 <HenryC.Chen@mediatek.com>,  YT Lee <yt.lee@mediatek.com>, Xiaoqing Liu
 <Xiaoqing.Liu@mediatek.com>, Charles Yang <Charles.Yang@mediatek.com>,
 Angus Lin <Angus.Lin@mediatek.com>, Mark Rutland <mark.rutland@arm.com>,
 Nishanth Menon <nm@ti.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, Guenter Roeck
 <linux@roeck-us.net>
Date: Fri, 02 Jul 2021 10:33:17 +0200
In-Reply-To: <20210702031214.21597-4-roger.lu@mediatek.com>
References: <20210702031214.21597-1-roger.lu@mediatek.com>
 <20210702031214.21597-4-roger.lu@mediatek.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_013333_083208_E3CAC2D4 
X-CRM114-Status: GOOD (  15.59  )
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

Hi Roger,

On Fri, 2021-07-02 at 11:12 +0800, Roger Lu wrote:
[...]
> diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
> new file mode 100644
> index 000000000000..c2fcbc204b1d
> --- /dev/null
> +++ b/drivers/soc/mediatek/mtk-svs.c
> @@ -0,0 +1,1724 @@
[...]
> +static int svs_suspend(struct device *dev)
> +{
> +	struct svs_platform *svsp = dev_get_drvdata(dev);
> +	struct svs_bank *svsb;
> +	unsigned long flags;
> +	int ret;
> +	u32 idx;
> +
> +	for (idx = 0; idx < svsp->bank_num; idx++) {
> +		svsb = &svsp->banks[idx];
> +
> +		/* Wait if svs_isr() is still in process. */
> +		spin_lock_irqsave(&mtk_svs_lock, flags);
> +		svsp->pbank = svsb;
> +		svs_switch_bank(svsp);
> +		svs_writel(svsp, SVSB_EN_OFF, SVSEN);
> +		svs_writel(svsp, SVSB_INTSTS_CLEAN, INTSTS);
> +		spin_unlock_irqrestore(&mtk_svs_lock, flags);
> +
> +		svsb->suspended = true;
> +		if (svsb->phase != SVSB_PHASE_INIT01) {
> +			svsb->phase = SVSB_PHASE_ERROR;
> +			svs_adjust_pm_opp_volts(svsb, true);
> +		}
> +	}
> +
> +	if (svsp->rst) {

This is not necessary, reset_control_assert() checks for (rstc == NULL)
itself.

> +		ret = reset_control_assert(svsp->rst);
> +		if (ret) {
> +			dev_err(svsp->dev, "cannot assert reset %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	clk_disable_unprepare(svsp->main_clk);
> +
> +	return 0;
> +}
> +
> +static int svs_resume(struct device *dev)
> +{
> +	struct svs_platform *svsp = dev_get_drvdata(dev);
> +	struct svs_bank *svsb;
> +	int ret;
> +	u32 idx;
> +
> +	ret = clk_prepare_enable(svsp->main_clk);
> +	if (ret) {
> +		dev_err(svsp->dev, "cannot enable main_clk, disable svs\n");
> +		return ret;
> +	}
> +
> +	if (svsp->rst) {

Same as above, reset_control_deassert(NULL) will just return 0.

> +		ret = reset_control_deassert(svsp->rst);
> +		if (ret) {
> +			dev_err(svsp->dev, "cannot deassert reset %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	for (idx = 0; idx < svsp->bank_num; idx++) {
> +		svsb = &svsp->banks[idx];
> +		svsb->suspended = false;
> +	}
> +
> +	ret = svs_init02(svsp);
> +	if (ret)
> +		return ret;
> +
> +	svs_mon_mode(svsp);
> +
> +	return 0;
> +}

regards
Philipp

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
