Return-Path: <SRS0=F/ID=6V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02906C38A2A
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 May 2020 17:45:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA06C21835
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 May 2020 17:45:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GTB1O8oE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA06C21835
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ucw.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HMmRuPVV8rkwp9085A0R96C7ONz/WiCZZwsXDawNaLY=; b=GTB1O8oE9wiVPv
	iIpLimBLk0mqolt9KflGYxun/Kg1Qd8rQ04ZU/75+xMw2v3PMD7cUx9jMhDzlZv66xrr8lt3ICMRp
	awzt98kauyJXNh1scG0zRfogHxtQeaBeoGyyrVl4/S7LK4hu3Ia0x16+JKOgVvRauak7/F1JPSfDz
	Vc9BY+W3rXue+WwUsIkYgWuwBDJBlL8puVDsjBtt4YGPX0lZlzsr4WL1kGHmNL7Ng3odBtPyrs/9f
	KOQqkzNtxv3xZWT297f+bozgTsBW+KMXcXnNr1vEPgVbKGNbHDOoLS+Qz333FT37qnzoJ30DfC5Sc
	WdCiJW8Btaxj8FEFkqFQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWkab-0007U6-26; Thu, 07 May 2020 17:45:41 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWkaH-00079s-Pw; Thu, 07 May 2020 17:45:26 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 13D1A1C0257; Thu,  7 May 2020 19:45:20 +0200 (CEST)
Date: Thu, 7 May 2020 19:45:19 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Xing Zhang <Xing.Zhang@mediatek.com>
Subject: Re: [PATCH v1] Add support for MediaTek regulator vibrator driver
Message-ID: <20200507174519.GD1216@bug>
References: <20200429081759.26964-1-Xing.Zhang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200429081759.26964-1-Xing.Zhang@mediatek.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_104522_239888_1AF1C806 
X-CRM114-Status: UNSURE (   8.71  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi!

> This patchset add regulator vibrator driver for MTK Soc. The driver 
> controls vibrator through regulator's enable and disable.

We'd prefer not to have vibrators in led subsystem.

> 
> Xing Zhang (3):
>   dt-bindings: add regulator vibrator documentation
>   arm64: mediatek: Add regulator vibrator support
>   Vibrator: Add regulator vibrator driver
> 
>  .../bindings/leds/regulator-vibrator.txt      |  39 ++
>  arch/arm64/configs/defconfig                  |   1 +
>  drivers/leds/Kconfig                          |  10 +
>  drivers/leds/Makefile                         |   1 +
>  drivers/leds/regulator-vibrator.c             | 450 ++++++++++++++++++

OTOH, connecting LED to regulator might make some sense. I can take the driver with
vibrator functionality stripped, provided it is named the usual way...

Best regards,
										Pavel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
