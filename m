Return-Path: <SRS0=2fNz=AI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DC27C433E0
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Jun 2020 11:08:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C03F21556
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Jun 2020 11:08:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BUa8n1Am";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="tMod9uFR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C03F21556
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZCv3Kphx6ka40eBq8L5Zy0cbEtSlKQXBfmMrh5JomU0=; b=BUa8n1AmptmUIb5HkwapfspcH
	j90irdCItiF+t8VVNgkbSvB+1DpVIiK2jJ4iamxYJ9N9lYQsxuzBdNgAgvr02qTHjJsJAdYNQqlgx
	9i6x6+ZGHuVf1sBGHxOa9GAeYZ2j8uoP6WsHYXQngc+W5SSp11TY7cmBSAq+c6Eale+JECp1ZmwyU
	rxa2K/A9v/R6oXUvflxa2/KTP54xjf9Rnj+NJumjdL/HiDN17SH+eQKH2/uY1DhS1drPA1/c75RWg
	U3ijvcXpjtV6RevS+gurGgyr1MWOwmzRubFp3SwnOABgKdaRa9zftKKELlKzXe+/T/gCzbUFgHkgw
	fXb9IBcbQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jp8hJ-0004XB-Be; Sat, 27 Jun 2020 11:08:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jp8h5-0004T1-0U; Sat, 27 Jun 2020 11:08:23 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 489A1214D8;
 Sat, 27 Jun 2020 11:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593256102;
 bh=TjTMGf71hRc8OW24VbETXWEqOz6ytX6pTBkxNEYJXSQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tMod9uFRT5S5G394Uk/gQtwKaJBrMvgPD8/h2wUf6diETm8vcdWgw14jYTyk18SAG
 oghpm2a1hJ1Di9KQdah2OKLR11J7iY1i8nTHzUOLBdQ0YOCYthv2QZQEkAaPZpl1zZ
 OpMrO9IwOBmiB1EgQycRtL1MrU07V3PXAOxC2VeM=
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=wait-a-minute.lan) by disco-boy.misterjones.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1jp8h2-006s0z-MO; Sat, 27 Jun 2020 12:08:20 +0100
From: Marc Zyngier <maz@kernel.org>
To: Jason Cooper <jason@lakedaemon.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>,
 Claudiu Beznea <claudiu.beznea@microchip.com>, nicolas.ferre@microchip.com,
 robh+dt@kernel.org, a.zummo@towertech.it, alexandre.belloni@bootlin.com,
 ludovic.desroches@microchip.com
Subject: Re: [PATCH v2 0/3] add RTT support for SAM9X60
Date: Sat, 27 Jun 2020 12:08:02 +0100
Message-Id: <159325548742.93134.14743817102464415551.b4-ty@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <1591779936-18577-1-git-send-email-claudiu.beznea@microchip.com>
References: <1591779936-18577-1-git-send-email-claudiu.beznea@microchip.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: jason@lakedaemon.net, matthias.bgg@gmail.com, brgl@bgdev.pl,
 tglx@linutronix.de, claudiu.beznea@microchip.com, nicolas.ferre@microchip.com,
 robh+dt@kernel.org, a.zummo@towertech.it, alexandre.belloni@bootlin.com,
 ludovic.desroches@microchip.com, andrew.perepech@mediatek.com,
 linux-mediatek@lists.infradead.org, stephane.leprovost@mediatek.com,
 linux-arm-kernel@lists.infradead.org, pedro.tsai@mediatek.com,
 bgolaszewski@baylibre.com, fparent@baylibre.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-rtc@vger.kernel.org
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 Stephane Le Provost <stephane.leprovost@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Pedro Tsai <pedro.tsai@mediatek.com>,
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-mediatek@lists.infradead.org,
 Andrew Perepech <andrew.perepech@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 10 Jun 2020 12:05:33 +0300, Claudiu Beznea wrote:
> This series adds RTT support for SAM9X60.
> 
> Changes in v2:
> - use "atmel,at91sam9260-rtt" as fallback for compatible
> - in patch 1 keep only the addition of sam9x60_aic_irq_fixup
> - get rid of patches 2/5 from v1
> - squash patches 4/5, 5/5 from v1
> - change commit title for patch "rtc: at91sam9: add microchip,sam9x60-rtt"
>   from v1 into "dt-bindings: rtc: add microchip,sam9x60-rtt" and
>   place it before device tree patch
> 
> [...]

Applied to irq/irqchip-5.9:

[1/3] irqchip/atmel-aic5: Add support for sam9x60 rtt fixup
      commit: 293953d60e214aa44b3261f5350b83f285a95eb4

Thanks,

	M.
-- 
Without deviation from the norm, progress is not possible.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
