Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF8BC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Feb 2022 13:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3wKKg2df6HLM9S3vsd2gSN8vcyPVa6dGecMboiyTGM0=; b=S1sjuUY+Pn614NSnbmJgXm9O+N
	R7oM44PPloa0GrFlvKmk1SK1KxHJqurtfkMO2kEvbmuFa3LmHx96k9AqX24hr48A2RPB30RizKIna
	zGu1f3EoZIuVO8Pl/HbRExdcJC1EmQg2pmBPeHK7J0E3Hhfu1uD4NXI1URfLdfjpzVyMz21n4dlUB
	I37L0Pz1eiO88sFjVAYKNPgwmX/LQdkDlxdIOU3e5kmCiSmntw9agX4T3bh48JMiCYp9eIjoQ9q2c
	jlP0QTUyy61jqTbBya/VsVw8WV9Qw2Utmcp0E/S55+fKoYPortBsRzUJiY1FdP2uc4SI9HXTq3pOp
	mQv2ABtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHnEF-000CIy-9J; Wed, 09 Feb 2022 13:41:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHnCj-000BwG-9c; Wed, 09 Feb 2022 13:40:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 82A7361A38;
 Wed,  9 Feb 2022 13:40:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1144C340E7;
 Wed,  9 Feb 2022 13:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644414015;
 bh=+8aJBPSULxP5Zax04rq5roBRVH/mUwGTvhQVeya08Aw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Zyx1Un9dpCjcJBBA9WTpIjqyj+P3afDSBYWrucqMYJdMpL+Op9P6lDfxs/IjQ2OXq
 g2bkeD1/F4Ajy7Sdb5KDvRx9A0/dIA0lZiIjI1uy+umxSZyCEfCvBqYoRaCid69Bnx
 8sPjqvn83M5qO9esVwBrate6RVoJBvKqpyYR1Oq7NaHwceS4MpfXK9flTllVh+OZ98
 DOcrXvV9iFowho2pd4JLqN64zb5vGakCxZNVSZkfSPplWGU7n+poOFQHN6b0jFR5F5
 QwqYpoHPWzpcD3CTFwR79T0g0sBg1XYbjmu0xh5Fd/LCqKRLVFWNIr9O9LVgw1Zmx7
 uItQCnP8CHBAg==
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <maz@kernel.org>)
 id 1nHnCf-006dDe-M2; Wed, 09 Feb 2022 13:40:13 +0000
MIME-Version: 1.0
Date: Wed, 09 Feb 2022 13:40:13 +0000
From: Marc Zyngier <maz@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:TI
 ETHERNET SWITCH DRIVER (CPSW)" <linux-omap@vger.kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Matthias
 Brugger <matthias.bgg@gmail.com>, Grygorii Strashko
 <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Kevin
 Hilman <khilman@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Avi Fishman
 <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, Tali Perry
 <tali.perry1@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>
Subject: Re: [PATCH 03/12] irqchip/renesas-intc-gpio: Move PM device over to
 irq domain
In-Reply-To: <CAMuHMdXbM8kvmv0XKP8=rYj-8k5cFt50VP69LeDNX5oHx2e9dw@mail.gmail.com>
References: <20220201120310.878267-1-maz@kernel.org>
 <20220201120310.878267-4-maz@kernel.org>
 <CAMuHMdXbM8kvmv0XKP8=rYj-8k5cFt50VP69LeDNX5oHx2e9dw@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <83f67bec65e4f3cf661e0b6a6bbe9641@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: geert@linux-m68k.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linus.walleij@linaro.org, brgl@bgdev.pl, matthias.bgg@gmail.com,
 grygorii.strashko@ti.com, ssantosh@kernel.org, khilman@kernel.org,
 tglx@linutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
 avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 kernel@esmil.dk
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_054017_447935_A7584349 
X-CRM114-Status: GOOD (  14.72  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2022-02-02 14:27, Geert Uytterhoeven wrote:
> Hi Marc,
> 
> On Tue, Feb 1, 2022 at 1:12 PM Marc Zyngier <maz@kernel.org> wrote:
>> Move the reference to the device over to the irq domain.
>> 
>> Signed-off-by: Marc Zyngier <maz@kernel.org>
> 
> Thanks for your patch!
> 
> s/gpio/irqpin/ in the one-line summary?

Indeed, now fixed.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
