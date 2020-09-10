Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2616DC433E2
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 20:25:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF6AB2076D
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 20:25:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eYyhTT2j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF6AB2076D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ucw.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kKOx8meoeHDDnH8pDN7x4rFBeLn60h+z9RCuTEy2aMM=; b=eYyhTT2jf0iguTXZ9PS4JCkl0
	WLZZ61zZzfncBklpQVXda+eyivF5h4SORK6tKY3r0vG2c6lemSByI8WSVdlvuuQHiCm+Euvd327f4
	1WbjUYpreEtBukN1J/A9UFV7mQO8X94zTm+5eSr3TNSugazfQ+fujatMQ9hYWqaOdVdeXDiJjiIn+
	diF1g3Gu4LGeKZsxVzAz/RFagTW0Sfcd5xkOdjp50rbOPOHArPwDHwUci+n0kU1TFYYxWzz2kZ6tP
	P1D95fQcgR+1SDSuFPCjuUSIPrlr7LKmOHmAPgBXroQAW1dR3tC4ocrwrSD+De8dli2b7+QF04qJM
	TSbHcpOxg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGT8E-00037o-57; Thu, 10 Sep 2020 20:25:22 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGT88-00036Z-R2; Thu, 10 Sep 2020 20:25:18 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 62CDA1C0B76; Thu, 10 Sep 2020 22:25:10 +0200 (CEST)
Date: Thu, 10 Sep 2020 22:25:10 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH v3 1/2] leds: mt6360: Add LED driver for MT6360
Message-ID: <20200910202510.GB18431@ucw.cz>
References: <1599474459-20853-1-git-send-email-gene.chen.richtek@gmail.com>
 <1599474459-20853-2-git-send-email-gene.chen.richtek@gmail.com>
 <20200908222544.GF1005@bug>
 <CAE+NS34h9qbdHkYDYDnHGgk+9mFNTRpKEMKNEFZ+Secf6JyoZg@mail.gmail.com>
 <20200910122958.GF7907@duo.ucw.cz>
 <489fc92f-f6f5-839e-e417-7761d404e6ae@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <489fc92f-f6f5-839e-e417-7761d404e6ae@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_162517_259587_00908A65 
X-CRM114-Status: GOOD (  13.28  )
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 cy_huang@richtek.com, linux-kernel@vger.kernel.org,
 Gene Chen <gene_chen@richtek.com>, benjamin.chao@mediatek.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 Dan Murphy <dmurphy@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Gene Chen <gene.chen.richtek@gmail.com>, Wilma.Wu@mediatek.com,
 linux-leds@vger.kernel.org, shufan_lee@richtek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi!

> > > 1. set FLED1 brightness
> > > # echo 1 > /sys/class/leds/white:flash1/flash_brightness
> > > 2. enable FLED1 strobe
> > > # echo 1 > /sys/class/leds/white:flash1/flash_strobe
> > > 3 . turn off FLED1 strobe (just used to gaurantee the strobe mode
> > > flash leds must be turned off)
> > > # echo 0 > /sys/class/leds/white:flash1/flash_strobe
> > 
> > I believe I'd preffer only exposing torch functionality in
> > /sys/class/leds. .. strobe can be supported using v4l2 APIs.
> 
> Actually having LED flash class without strobe is pointless.
> If you looked at led_classdev_flash_register_ext() you would see that
> it fails with uninitialized strobe_set op. And V4L2 API for strobing
> flash calls strobe_set from LED flash class beneath.
> 
> That was the idea behind LED and V4L2 flash API unification - there
> is one hardware driver needed, the V4L2 Flash layer just takes over
> control over it when needed.

I agree that one driver is enough.

But we should not need flash_strobe file in sysfs. Simply use V4L2 for
that.

Best regards,
								Pavel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
