Return-Path: <SRS0=Q1uE=BE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20F71C433E1
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Jul 2020 14:24:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E09CE206C1
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Jul 2020 14:24:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MkkO7okA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="fdAxckov"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E09CE206C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CnKQL5bZDlwK8hfSQRDBTc+ZeULUj+/OjVOp15VpRLQ=; b=MkkO7okADHyQjcJvJp5z5kRi+
	oXzsPjjAqCkBSMGpSgOZecZEc6cO8MNvliG72GHVAXyrT4lOvendbodP0ytfraEDi5loCJBYOUXUB
	fU5z8+859YyLUfFNvnhCURoqVXRfa2xoIEYwbpkuTtfNajKFS5wJg7jjsUcoy2IOqSbOVOZPjK+7X
	D0dEbFaxpDMCHfGPi8LDXsE7j+603PXwUqAMMwMCEkVM1rfj0rhxMKs20OQTNRRhRN39MJvZ+YQel
	9bdK8NMpPI2IiewM9lrD9FqiYhwJPCbBfT0NMP9I4d37pkd8C34nvHY25E8arbCUaqk6v6zxEpxoZ
	YE9TA8JnA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzL5s-0006T6-02; Sat, 25 Jul 2020 14:24:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzL5c-0006Q0-Iv; Sat, 25 Jul 2020 14:23:53 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E3BC62070E;
 Sat, 25 Jul 2020 14:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595687032;
 bh=BAz1TW4/bVZUS2IHFjl3Yw+2naG6uIjsWVeWFxtMKUA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fdAxckovDYl++IXQ+ImgWscI/ZX1zozAjt0Ut7vpMiEqp2GmXLrvSyI3ODI0UOCfz
 bCtN67WyIWhDJ6onbMFc4cLzojDDf/Yq7h8UG/Ms4tujP+gS1GZ66vEXmiiAc/nYV9
 jh/86A0RQ5FW3rwdW7gkxMWCu1WwvtzahHK/cMy0=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=wait-a-minute.lan) by disco-boy.misterjones.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1jzL5a-00Er45-Ed; Sat, 25 Jul 2020 15:23:50 +0100
From: Marc Zyngier <maz@kernel.org>
To: Jason Cooper <jason@lakedaemon.net>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andy Gross <agross@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v3 0/4] irqchip: Add IRQCHIP_PLATFORM_DRIVER helper macros
Date: Sat, 25 Jul 2020 15:23:34 +0100
Message-Id: <159568680935.564881.11936174169505990646.b4-ty@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200718000637.3632841-1-saravanak@google.com>
References: <20200718000637.3632841-1-saravanak@google.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: jason@lakedaemon.net, alexandre.torgue@st.com,
 tglx@linutronix.de, bjorn.andersson@linaro.org, agross@kernel.org,
 saravanak@google.com, matthias.bgg@gmail.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, marex@denx.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, loda.chou@mediatek.com, kernel-team@android.com,
 linux-mediatek@lists.infradead.org, cc.hwang@mediatek.com,
 hanks.chen@mediatek.com, john.stultz@linaro.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200725_102352_745209_9FEE145E 
X-CRM114-Status: GOOD (  11.00  )
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
Cc: marex@denx.de, CC Hwang <cc.hwang@mediatek.com>,
 linux-arm-msm@vger.kernel.org, Hanks Chen <hanks.chen@mediatek.com>,
 Loda Chou <loda.chou@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 John Stultz <john.stultz@linaro.org>, kernel-team@android.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 17 Jul 2020 17:06:33 -0700, Saravana Kannan wrote:
> Made a series out of the previous v2 patch + some example uses of the
> macros.
> 
> Not sure if the MTK changes work (just compile tested), but saw that
> Hanks was trying to make those drivers into tristate. So I assume
> they'll work as platform drivers. Please wait for MTK Ack before picking
> up patches 3 and 4.
> 
> [...]

Applied to irq/irqchip-5.9, thanks!

[1/4] irqchip: Add IRQCHIP_PLATFORM_DRIVER_BEGIN/END and IRQCHIP_MATCH helper macros
      commit: f3b5e608ed6d17bdf04dacbf2374f10d51fe9b09
[2/4] irqchip/qcom-pdc: Switch to using IRQCHIP_PLATFORM_DRIVER helper macros
      commit: 04741740254cd83fb4f2b7747aeb35202104f8fe
[3/4] irqchip/mtk-sysirq: Convert to a platform driver
      commit: 3ae3022690e6787839dafa8ea3496450248b53e1
[4/4] irqchip/mtk-cirq: Convert to a platform driver
      commit: 538b63351607960ff2249460089daa31337ddeba

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
