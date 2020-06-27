Return-Path: <SRS0=2fNz=AI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D961C433DF
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Jun 2020 11:09:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC0F8217A0
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Jun 2020 11:08:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BOhNwRVP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="F933a6xB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC0F8217A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6QLBTrXPTgge5o2s3ZNHC/qL9Ap8XgbQzRykRY9OBO0=; b=BOhNwRVPayOV67IJsirRyp3Bh
	NhMDiugXfn7vpFmoSyomR3hTOokJpKmn9lapq+e+32OZxsHdsQ0zyhtGB/RcPrv9hrNoDChm6l18T
	cH8qzIG3IKIWbzqohbH6oh9ef+LjSaltv55io5wfuJhONVclcKBdDxMDhnGVOfWaeHDjVjTD29rzG
	R6FlmzsyFGtRmJgiqSDzJGP5jq9VqsIn4jkbRKoC6KlpZS7Aavdu238sjEhs/sIg0ShctarRjlfeU
	feX5jC+hTFWgAum7MwGVeWAznpI3rmwgZVmIJ98hhFRmVnRnHOyjZvRo2kkwTG2f3ZvkURicsZzIC
	y1NH9C2dg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jp8hX-0004c7-U8; Sat, 27 Jun 2020 11:08:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jp8h6-0004TI-1O; Sat, 27 Jun 2020 11:08:25 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4C856214DB;
 Sat, 27 Jun 2020 11:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593256103;
 bh=m0W7oiPf3mtQDUxHdtC2NEBgyqu5tT0E4gLi1FF491Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=F933a6xBx+MthAGOPPe1BMRq20jB+4MTvy0leXETzLaqAZd8tZ7a37lglNpUS1T8I
 UWH8ztF/J8PXOsahP3EcbQwvm27OIztJbh/Z6sDgmoe4WkO+apaA38mNDY8Ob9k23R
 yXf38qrKB5Nesjd3cyoyvn6UaCWX9k0EEtbxj0ak=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=wait-a-minute.lan) by disco-boy.misterjones.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1jp8h3-006s0z-PK; Sat, 27 Jun 2020 12:08:21 +0100
From: Marc Zyngier <maz@kernel.org>
To: Jason Cooper <jason@lakedaemon.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH][next] irqchip: Use struct_size() helper in devm_kzalloc()
Date: Sat, 27 Jun 2020 12:08:03 +0100
Message-Id: <159325548742.93134.5441402271189391184.b4-ty@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200616230923.GA24937@embeddedor>
References: <20200616230923.GA24937@embeddedor>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: jason@lakedaemon.net, matthias.bgg@gmail.com, brgl@bgdev.pl,
 tglx@linutronix.de, festevam@gmail.com, s.hauer@pengutronix.de,
 kernel@pengutronix.de, gustavoars@kernel.org, linux-imx@nxp.com,
 shawnguo@kernel.org, andrew.perepech@mediatek.com,
 linux-mediatek@lists.infradead.org, stephane.leprovost@mediatek.com,
 linux-arm-kernel@lists.infradead.org, pedro.tsai@mediatek.com,
 bgolaszewski@baylibre.com, fparent@baylibre.com, linux-kernel@vger.kernel.org,
 gustavo@embeddedor.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
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
Cc: Stephane Le Provost <stephane.leprovost@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Pedro Tsai <pedro.tsai@mediatek.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-mediatek@lists.infradead.org,
 Andrew Perepech <andrew.perepech@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 16 Jun 2020 18:09:23 -0500, Gustavo A. R. Silva wrote:
> Make use of the struct_size() helper instead of an open-coded version
> in order to avoid any potential type mistakes.
> 
> This code was detected with the help of Coccinelle and, audited and
> fixed manually.

Applied to irq/irqchip-5.9:

[1/1] irqchip/imx-intmux: Use struct_size() helper in devm_kzalloc()
      commit: 2f7a9bda42f74e1169fcd9ef55c8ade989ef8bba

Thanks,

	M.
-- 
Without deviation from the norm, progress is not possible.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
