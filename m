Return-Path: <SRS0=DTTl=YY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3E9ECA9EC7
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Oct 2019 01:27:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65E2E20862
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Oct 2019 01:27:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="umA099u/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hG/i0zjP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65E2E20862
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Jx3eSB9V/ngKl0FyrUxQuohwncgpeNyEdwzJugbi6M=; b=umA099u/yo+UPo
	R5b8sN2nKAkqFTIbUJYxd+WrHnUgBKjEbpRiRL02z7HaM2SGsFLQwSO88SUqVvBnxx6eKdL4uTG4z
	gh6f7vjXutcxL6C6kMjCGc/ykNz/lakMwQxQ6P3tNXNw+1L0AQNu6Zmo5BigXdEW2UjwqL/FB2Yla
	4QrNic6Q39/hsTdl8jtcM1yyQdNQKyVoABrLUysHugA9fWb6vepUbKYpY28opOUl4+GrQYZOdRhdm
	tWSzdMoQ6mIFPSrWeX3cfP+GnRTDM4nP2X/ONZuPBHgDSvkIlnVDELoDpZxel2/jE+MBqR3uEdemC
	K2Y5Vv7aKiMmfr5LnpPw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iPzF5-00011E-Fz; Thu, 31 Oct 2019 01:27:15 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPzEw-0000uQ-KV; Thu, 31 Oct 2019 01:27:07 +0000
Received: by mail-pg1-x544.google.com with SMTP id k10so1495943pgm.5;
 Wed, 30 Oct 2019 18:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=/xbLLTWwwR0cd5qQbRpTD2PP+wmSB7aXKTDZeJyUHcY=;
 b=hG/i0zjP4PIYhFBy9cjOQ+6FA5yvDVZTVwsRMIajyd3MWIPZ3T0uOJLuPyupkeskOu
 p4O7CK/20sK5+q9CvApRlPjlmDJPHRoeeJRRqBvIKsFlsCrn50Lu7mW0xapyTrgg7BtH
 LXafi0hTusVYmMZSxsrLU6nBtWCvO8pZmrcysBuy3SGK4glcRMGAPFSIYniDWCzl7Sik
 MOPhn7yFhwcd7jtrp7Fs0nCmXttm95KAlIIqTS6ossP+ZqZO5BOTXBdG80Uobdi4uShM
 0T4iRKxpc8Ed+ULYJ/X1Dg53tt6BQTcoO4bE4FrHOwUTmYF9QGdEpBR0wF24ZJeL0L27
 qufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/xbLLTWwwR0cd5qQbRpTD2PP+wmSB7aXKTDZeJyUHcY=;
 b=qXNgZFmhkP3LdcgNa/mxTc/FubcLPlyN1wAWOgk6ZAY2NStz2L5fO/1fCIhyPrZJaY
 CwlJD6mvpIH/e6KEUkMX/LB+l3mk0OKT9VBX78etwfWLPG68JN+ONWuoe5u091pW1idA
 SO/2OHYcEaMgQNmIVFfnqlYAFa8xzcByGDiKCa/SZcAepkeyC2dlj18XkDGZRWRQ175L
 gWo43F80MjpLB4EcxDZVFUd8gpyqHQKeIvF3b00Ox7lQkjy7ipxgdUtYiSF5BsyXFoUX
 7HFntPPKSlzIehW6+efUuTUEd+vcU7oQHZ0jKXv+gH/AfTOaWs4CkuFXSZ23+yESz/4r
 qD0w==
X-Gm-Message-State: APjAAAV+UDui9WNagTOJaXt1IS+12PW55WP99tFlGi09KtRulGSNnjVB
 89C4DAPuhMx1uqb8iYEN8M8=
X-Google-Smtp-Source: APXvYqxPeZ8N9bZyMSYjCKY94CTqtNjhdT7egzR2ZWKkCv1KRQ2Mfmvy5+dmaQz587G4EdWPOF72qA==
X-Received: by 2002:a63:200e:: with SMTP id g14mr2889289pgg.91.1572485225237; 
 Wed, 30 Oct 2019 18:27:05 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91 ([2620:10d:c090:200::1:e375])
 by smtp.gmail.com with ESMTPSA id n23sm1116451pff.137.2019.10.30.18.27.03
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 30 Oct 2019 18:27:04 -0700 (PDT)
Date: Wed, 30 Oct 2019 18:26:56 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] ARM: ASPEED: update default ARCH_NR_GPIO for ARCH_ASPEED
Message-ID: <20191031012655.GA5841@taoren-ubuntu-R90MNF91>
References: <20191028224909.1069-1-rentao.bupt@gmail.com>
 <CACRpkdbOPq4AYt9CLoganV_Ck9bYS9+_U3bggGKAukaQ=FHXkA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdbOPq4AYt9CLoganV_Ck9bYS9+_U3bggGKAukaQ=FHXkA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191030_182706_678135_77A63A27 
X-CRM114-Status: GOOD (  14.12  )
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
Cc: Arnd Bergmann <arnd@arndb.de>, Paul Burton <paulburton@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Joel Stanley <joel@jms.id.au>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>, Tao Ren <taoren@fb.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Doug Anderson <armlinux@m.disordat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Oct 31, 2019 at 01:49:43AM +0100, Linus Walleij wrote:
> On Mon, Oct 28, 2019 at 11:49 PM <rentao.bupt@gmail.com> wrote:
> 
> > From: Tao Ren <rentao.bupt@gmail.com>
> >
> > Increase the max number of GPIOs from default 512 to 1024 for ASPEED
> > platforms, because Facebook Yamp (AST2500) BMC platform has total 594
> > GPIO pins (232 provided by ASPEED SoC, and 362 by I/O Expanders).
> >
> > Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Please send this patch to the ARM SoC and SoC maintainers:
> arm@kernel.org
> soc@kernel.org

Thanks Linus for the review. I will add ARM SoC and SoC maintaniers in
patch v2.

Somehow get_maintainer.pl doesn't list the 2 addresses in my tree; do I
need to send a patch to update MAINTAINERS accordingly?
 
> Yours,
> Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
