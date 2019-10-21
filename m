Return-Path: <SRS0=JbG7=YO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80AE7CA9EA0
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2019 00:40:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5077121A4A
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2019 00:40:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oSKzRKDN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zroUUUrf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5077121A4A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eL1/xMAlvEkAMDIILZbjsnSvk3Iop8OeR9pH2kFAIZs=; b=oSKzRKDNfHYdxy
	dOnFK+3X4uB40oCtrFdwqQR382n13lhxUZ1ypsJ4bgGYzsuSAsekrqe34K2twATUKeytEiDpZkFFR
	s3BjhtAtUmCwPlmBTbDi9m0apgCdXleRU3Ja8dUxgXsWpbDfMbD/6JOEUJe6+rTPDJqP1drlywV50
	dSLr0U9yIkmpA2oDrnkX0Tiq36/S95cQio4ogTNh9HtUdS6rkxZZkMa/chaQDClW9QalRhbbCjwr8
	YTJ8OsSAquUala7s1bS2f+TqhPQkZPi59f97LMltkUJIIM3Bm2Jr+hwwW8k3wiqColYSP/wXO8bUF
	nv9x437t6/He3RksmMWw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMLkZ-0002uP-Oe; Mon, 21 Oct 2019 00:40:43 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMLkX-0002tX-LQ
 for linux-mediatek@lists.infradead.org; Mon, 21 Oct 2019 00:40:42 +0000
Received: by mail-lj1-x244.google.com with SMTP id n14so11368852ljj.10
 for <linux-mediatek@lists.infradead.org>; Sun, 20 Oct 2019 17:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m6Xo9B6o9SIZMKltywI4CiX1SZ99OwUFgC+m3ay2Ymo=;
 b=zroUUUrfgfHLCjgOyR2uQ2lLhWyKSM7uEj1yfxnkSSToT1Elup+0aFqlDLFwh9G/n2
 KmTyKhUQBndxk5V92CCxunqRlxvT1jz39Hi0bjTlcO8/JBejG5joPR6goquCAbY1q8r5
 c4pKHfEl0bulWgTXTtr+82ImDmgMw2jNre53NjUrfx2uQJugQo9wuJWUaquqK5XdTNWa
 wWxphcewpaq4w17KtJTsfDZ/G/9tO6b1j3OEyi+2KchtoK+DEqJnQ+3c6IUkzZHm7KCf
 s5m8n4Dl+/ZQ+m8Jd5Kh/kDLz/KDGqnFn1t5nhMws+ktDfHLGN+r3tgJ4NqeOx0DdF9m
 GLwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m6Xo9B6o9SIZMKltywI4CiX1SZ99OwUFgC+m3ay2Ymo=;
 b=XFA/Qj4r4gZ3gdxkosm8i8x7gE5tDCUKFEz/X1IVe5nuZ4VCDkPUQ0EBVMBhyOu5As
 le8Pe6KTMV8Wn2nyr4HE63nUdbqOf8RFpwbZxK4HP/V7iaOkuO/xihWT16Lex+WCAUA1
 g/8AgHcJb4ssw2UNdS9PnjAKmK8YLmYuXcsPAcckkxNnC1lTnclrvxWd8hZ2ZRDH9Qog
 uEIP6BtyUohV/3iKb4rNzNbqkzT9xCa6aeDds6UEM5+UkKWyywqMdwHHunNs8YQs8rRc
 +9inzLuwJdG32ECgNNdRh/Eq+lp9NuGpnflY8m3reU2xGlma8uD3fNDmRNNPRta5a5gg
 uJzw==
X-Gm-Message-State: APjAAAW05QLm/NlWVZCu17pbawQ6FuOLwqkekuHWW1mpM5sp3gmX6fH9
 8hImicTQwPF9BuqS8jt6jKLVdp9W/2oGM20h/W+keg==
X-Google-Smtp-Source: APXvYqzrokn9M/Ubcg0CEqbAzJJBvsXnB3LI0TFr0LTW5W/Xiku2p7auDuAK7OWy/bhF9IEAr+uI2BTb4+ImUhUhYhk=
X-Received: by 2002:a2e:a0c9:: with SMTP id f9mr13031793ljm.77.1571618440273; 
 Sun, 20 Oct 2019 17:40:40 -0700 (PDT)
MIME-Version: 1.0
References: <20191016200647.32050-1-robh@kernel.org>
 <20191016200647.32050-18-robh@kernel.org>
In-Reply-To: <20191016200647.32050-18-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 21 Oct 2019 02:40:27 +0200
Message-ID: <CACRpkdbhPPRDixrR4rWSopFEd-5AKpjHF1-Su-ViAGMDLQiKkw@mail.gmail.com>
Subject: Re: [PATCH v2 17/25] PCI: versatile: Remove usage of PHYS_OFFSET
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191020_174041_733468_B7EFBF16 
X-CRM114-Status: GOOD (  12.58  )
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
Cc: Heiko Stuebner <heiko@sntech.de>,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
 linux-pci <linux-pci@vger.kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Toan Le <toan@os.amperecomputing.com>, Will Deacon <will@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Michal Simek <michal.simek@xilinx.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
 Ryder Lee <ryder.lee@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Andrew Murray <andrew.murray@arm.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Scott Branden <sbranden@broadcom.com>, Jingoo Han <jingoohan1@gmail.com>,
 rfi@lists.rocketboards.org, Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Tom Joseph <tjoseph@cadence.com>, Simon Horman <horms@verge.net.au>,
 Srinath Mannam <srinath.mannam@broadcom.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Ley Foon Tan <lftan@altera.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Oct 16, 2019 at 10:07 PM Rob Herring <robh@kernel.org> wrote:

> PHYS_OFFSET is not universally defined on all arches and using it prevents
> enabling COMPILE_TEST. PAGE_OFFSET and __pa() are always available, so use
> them to get the physical start of memory address.
>
> This should have probably used 'dma-ranges' to get the address, but we
> don't want to force a DT update to do that. At least in QEMU, the SMAP
> registers have no effect (or perhaps the only value that is handled is 0).
>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Cc: Andrew Murray <andrew.murray@arm.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> v2:
> - New patch to fix build failure on some arches.

Always wondered how to do this right, now I can fix other stuff!
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
