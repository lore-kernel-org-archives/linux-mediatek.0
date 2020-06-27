Return-Path: <SRS0=2fNz=AI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 092AAC433E0
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Jun 2020 11:09:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CABFA214F1
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Jun 2020 11:09:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jy0GeLSn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="aXZtyK61"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CABFA214F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=B5JLDPIwMPuRes3JX5jFE2U/GBfyjVPe9rMqerx1Uh0=; b=jy0GeLSnzy5qzBQrrX3asg81Q
	FypvMXFEG/m0Om6HH5QZ52O13yWKTlaSd9EN9pPltNcSxQpK/Yp/aDgXRrN+9LdZjWn/cMfL13dXk
	Ldppwkyv3qhrGQXBInWEeV28pVuJY3qbtJeHsQoNSl4xCGd48yzzCJyKZqR0+PPTqnlZ5A48WGsmN
	rywfVVbTy8nliFKBDSKGbb5bFS5rH5GLNtczp5DlI72P+YSwYvMWrqqS1YL+YNKvAYKyX6g+NXD/w
	zMs6ArXFTTnFmOW/ALUTZfp5rACD+47kJzgtiLhC62xmqcjrUdXhDh6VJ2uo+JBD5p4ElcvqejOpl
	yWosY+LUg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jp8hg-0004gA-Eo; Sat, 27 Jun 2020 11:09:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jp8h6-0004TY-N0; Sat, 27 Jun 2020 11:08:26 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EE6B721527;
 Sat, 27 Jun 2020 11:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593256104;
 bh=3PFr6kqNhAL9gthVmY3YY05Bhk6vYRM7Jm7OnV0DMmw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aXZtyK61U7cju4rOd9T9Qdqm8TBx8Y+c3/IlfwcPGGbGdbtGBj3ZJ5i0+HBWNaicj
 7Ny9giwZGGQTrEKzdXMGEPtdHNESxBER96tqudGEZj0mVR/JWcXWFWkAXeg+jUOuHB
 Ug17ksTT6bTtM5SCS7wxq4uqM5hgs92DlTVjtHUI=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=wait-a-minute.lan) by disco-boy.misterjones.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1jp8h4-006s0z-ED; Sat, 27 Jun 2020 12:08:22 +0100
From: Marc Zyngier <maz@kernel.org>
To: Jason Cooper <jason@lakedaemon.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] irqchip: vic: Drop cascaded intialization call
Date: Sat, 27 Jun 2020 12:08:04 +0100
Message-Id: <159325548742.93134.737037488044346140.b4-ty@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200607215124.48638-1-linus.walleij@linaro.org>
References: <20200607215124.48638-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: jason@lakedaemon.net, matthias.bgg@gmail.com, brgl@bgdev.pl,
 tglx@linutronix.de, linus.walleij@linaro.org, andrew.perepech@mediatek.com,
 linux-mediatek@lists.infradead.org, stephane.leprovost@mediatek.com,
 linux-arm-kernel@lists.infradead.org, pedro.tsai@mediatek.com,
 bgolaszewski@baylibre.com, fparent@baylibre.com, linux-kernel@vger.kernel.org
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
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-mediatek@lists.infradead.org,
 Andrew Perepech <andrew.perepech@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, 7 Jun 2020 23:51:23 +0200, Linus Walleij wrote:
> We got rid of the last user of the cascaded intialization
> from board files so drop this API.

Applied to irq/irqchip-5.9:

[1/2] irqchip/vic: Drop cascaded intialization call
      commit: adf4f9d49c74a812757c5c67879ece0e54b75417
[2/2] irqchip/vic: Cut down the external API
      commit: b0b92ab6a86e59779c2b17c5f611b04120fdfbb6

Thanks,

	M.
-- 
Without deviation from the norm, progress is not possible.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
