Return-Path: <SRS0=VpQz=L2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EFF3C11F69
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jul 2021 09:22:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67438610CA
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jul 2021 09:22:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67438610CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O5KBxfo9ZYwJcPRCOyJZUr8N7y34Zotdab/7uKXdx5E=; b=Z2ACmM7TwAmskM
	pHmyDfCymvAQxwhRxvOZswW2kIH6aeNfydu4thmCQJo+D53K8klFJD2qzfHpTs9IgqguylhIB9WbN
	o3ny/JlHtO/UzGwUoD8J7QRQgwjjQSmvzv3wBlmM1jqkl0GLEFLjz3gC+4BF34iUozgFb8uC32GvH
	Hp4WumcfhkWec2f5hqQ9aeGaS0O1OVGpqaJEPSixdyGT9emD8fPvevXMrN3jgn4XkuZUxIepAiwLc
	/Y9CDk0uAhrGs9+cKHL8n+JE9cn4tdWOp1ELC93YyLsVXzWDO7EUVe4dgofB4pcPFl7gWJHX7KPvF
	4iHsZsQGRT0ps98Mt25Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzFN7-002bhf-1h; Fri, 02 Jul 2021 09:22:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzFMu-002bfe-3v; Fri, 02 Jul 2021 09:21:53 +0000
X-UUID: ca1440ee568d4174a317941fa6582831-20210702
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=IYyNmRrPNeyd0roXCcc3ug77Q20krYCuClxefjY+zjA=; 
 b=OBxH2xcXEmkripda1zuduv7SxCUobWyN+AsPyEXi+WIztrYQ/9nHQP2br4XnAn+8YDTob/E2wPxlgUmTOjXrO6KGb7AlHHY84WnUXxBaWLPsNQdiGBgU9FIQ9CNztxkR/KxFLCyJVLDKUGNUWifjtEFb17eIk+c8nzAJCItw09A=;
X-UUID: ca1440ee568d4174a317941fa6582831-20210702
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <roger.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 664539119; Fri, 02 Jul 2021 02:21:48 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 2 Jul 2021 02:19:08 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 2 Jul 2021 17:19:06 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 2 Jul 2021 17:19:06 +0800
Message-ID: <0911434c39aa76a6312f19baa2a468c65589de3d.camel@mediatek.com>
Subject: Re: [PATCH v19 3/7] soc: mediatek: SVS: introduce MTK SVS engine
From: Roger Lu <roger.lu@mediatek.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger
 <matthias.bgg@gmail.com>, Enric Balletbo Serra <eballetbo@gmail.com>, "Kevin
 Hilman" <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Nicolas
 Boichat" <drinkcat@google.com>, Stephen Boyd <sboyd@kernel.org>
CC: Fan Chen <fan.chen@mediatek.com>, HenryC Chen <HenryC.Chen@mediatek.com>, 
 YT Lee <yt.lee@mediatek.com>, Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
 Charles Yang <Charles.Yang@mediatek.com>, Angus Lin <Angus.Lin@mediatek.com>, 
 Mark Rutland <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Guenter Roeck
 <linux@roeck-us.net>
Date: Fri, 2 Jul 2021 17:19:06 +0800
In-Reply-To: <bf4f26cdca7174ba687e29a581a5276511112fe7.camel@pengutronix.de>
References: <20210702031214.21597-1-roger.lu@mediatek.com>
 <20210702031214.21597-4-roger.lu@mediatek.com>
 <bf4f26cdca7174ba687e29a581a5276511112fe7.camel@pengutronix.de>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_022152_212776_796774FB 
X-CRM114-Status: GOOD (  20.90  )
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

Hi Philipp,

Thanks for the advice.

On Fri, 2021-07-02 at 10:33 +0200, Philipp Zabel wrote:
> Hi Roger,
> 
> On Fri, 2021-07-02 at 11:12 +0800, Roger Lu wrote:
> [...]
> > diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
> > new file mode 100644
> > index 000000000000..c2fcbc204b1d
> > --- /dev/null
> > +++ b/drivers/soc/mediatek/mtk-svs.c
> > @@ -0,0 +1,1724 @@
> 
> [...]
> > +static int svs_suspend(struct device *dev)
> > +{
> > +	struct svs_platform *svsp = dev_get_drvdata(dev);
> > +	struct svs_bank *svsb;
> > +	unsigned long flags;
> > +	int ret;
> > +	u32 idx;
> > +
> > +	for (idx = 0; idx < svsp->bank_num; idx++) {
> > +		svsb = &svsp->banks[idx];
> > +
> > +		/* Wait if svs_isr() is still in process. */
> > +		spin_lock_irqsave(&mtk_svs_lock, flags);
> > +		svsp->pbank = svsb;
> > +		svs_switch_bank(svsp);
> > +		svs_writel(svsp, SVSB_EN_OFF, SVSEN);
> > +		svs_writel(svsp, SVSB_INTSTS_CLEAN, INTSTS);
> > +		spin_unlock_irqrestore(&mtk_svs_lock, flags);
> > +
> > +		svsb->suspended = true;
> > +		if (svsb->phase != SVSB_PHASE_INIT01) {
> > +			svsb->phase = SVSB_PHASE_ERROR;
> > +			svs_adjust_pm_opp_volts(svsb, true);
> > +		}
> > +	}
> > +
> > +	if (svsp->rst) {
> 
> This is not necessary, reset_control_assert() checks for (rstc == NULL)
> itself.
Okay. We'll remove "if (svsp->rst) {" in the next patch. Thanks.

> 
> > +		ret = reset_control_assert(svsp->rst);
> > +		if (ret) {
> > +			dev_err(svsp->dev, "cannot assert reset %d\n", ret);
> > +			return ret;
> > +		}
> > +	}
> > +
> > +	clk_disable_unprepare(svsp->main_clk);
> > +
> > +	return 0;
> > +}
> > +
> > +static int svs_resume(struct device *dev)
> > +{
> > +	struct svs_platform *svsp = dev_get_drvdata(dev);
> > +	struct svs_bank *svsb;
> > +	int ret;
> > +	u32 idx;
> > +
> > +	ret = clk_prepare_enable(svsp->main_clk);
> > +	if (ret) {
> > +		dev_err(svsp->dev, "cannot enable main_clk, disable svs\n");
> > +		return ret;
> > +	}
> > +
> > +	if (svsp->rst) {
> 
> Same as above, reset_control_deassert(NULL) will just return 0.
Okay. We'll remove "if (svsp->rst) {" in the next patch. Thanks.
> 
> > +		ret = reset_control_deassert(svsp->rst);
> > +		if (ret) {
> > +			dev_err(svsp->dev, "cannot deassert reset %d\n", ret);
> > +			return ret;
> > +		}
> > +	}
> > +
> > +	for (idx = 0; idx < svsp->bank_num; idx++) {
> > +		svsb = &svsp->banks[idx];
> > +		svsb->suspended = false;
> > +	}
> > +
> > +	ret = svs_init02(svsp);
> > +	if (ret)
> > +		return ret;
> > +
> > +	svs_mon_mode(svsp);
> > +
> > +	return 0;
> > +}
> 
> regards
> Philipp
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
