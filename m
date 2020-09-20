Return-Path: <SRS0=UMOv=C5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D0E1C43465
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Sep 2020 19:39:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7AE220866
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Sep 2020 19:39:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Li80BbRl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7AE220866
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vbVvtkNPGoka8LmcIR5aRl+Wepo94dWDE5o/L7RdaKI=; b=Li80BbRlsuu2Uctiis9lwkCib
	3NKMJV5CTzrwGJpByfdF6PshPn9c+EIXtm+q9SSTeOWCFqXh63DmJWMR4+c5K5Zpd395F0s0607UB
	dPlyC6VoF+h0cO08NrU/IN1VOYQmBgYfXb45QmETKrh2QGmQRfCIrpZFT0+1w0Y4wjEVasS9N2/eY
	afgjZAgf4Rz6MNc9DZASWPuUAvw9F1dXYxjWyGYSdbojCctNxeM8ie0pnpSYTiEG73mM4RICch9P0
	ZQcKd93OnN49utHLH6Biilgf2Rb8A0OtHqY9fwcvRP0aZLtwMpPVjeN0kR68I/6GXgkvg03bYt2kS
	HR9BMhSKA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kK5BJ-0004L9-0k; Sun, 20 Sep 2020 19:39:29 +0000
Received: from mail-ed1-f68.google.com ([209.85.208.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kK5BC-0004JU-GN; Sun, 20 Sep 2020 19:39:23 +0000
Received: by mail-ed1-f68.google.com with SMTP id n22so10856400edt.4;
 Sun, 20 Sep 2020 12:39:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=EjOn6uRQVdPuymFl16y3sShxeseL+O0M4hlLdZpwFpM=;
 b=rpm3DyCrPyzRvwpSmklVjUKTBPXfHk8SawMEFWDDNQjbV1QAE75ijI2VC7EabassIU
 kzPGw/gwVV0QChvXFIKgiRQoFOYVSVZd0UMnajFtiMGx4ZfDHmBmtG0zQSQmO/UxKVD/
 EvZKx72S7Qg9lhNfAk6wahDbyqcouIFPEGkZtaeZbTsN4mafb4yhto75PqgqTXjVDhss
 4VXSgxByRu6B5Eq/8lDvzw6tnUtbmCy5tVGuQoaHpDWSboVFQdyz12CfdPBKnb9F0Gv7
 QNp8opZoxgOX/2FWuHCNlyzTj/KNZwKacg6RFZdPOgKDs92UpB+4LO4X/Mo7hTMZxSv9
 m8Pw==
X-Gm-Message-State: AOAM530dkoEre4Sq+nkuiqHu6FhIvlwYzWjUcGqR1JosmTPx75YweZEz
 Z4DhYAgJZuxCGR/HEpgzMTk=
X-Google-Smtp-Source: ABdhPJxm64DrxO2BCAhB/Z2FKAFGkrjja3e7GI7Mop9Y1YiJS/Mzx02Jc3rgIeVCd0fm8AibxTyTyA==
X-Received: by 2002:a05:6402:326:: with SMTP id
 q6mr48977643edw.216.1600630759279; 
 Sun, 20 Sep 2020 12:39:19 -0700 (PDT)
Received: from kozik-lap ([194.230.155.191])
 by smtp.googlemail.com with ESMTPSA id bf25sm6956900edb.95.2020.09.20.12.39.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 20 Sep 2020 12:39:18 -0700 (PDT)
Date: Sun, 20 Sep 2020 21:39:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 01/13] dt-bindings: gpio: add common schema for GPIO
 controllers
Message-ID: <20200920193915.GA31074@kozik-lap>
References: <20200917165301.23100-1-krzk@kernel.org>
 <20200917165301.23100-2-krzk@kernel.org>
 <CAL_JsqJCLgf6syqV=jNPHPyu02ygwWCDDV+U9VCm0qRpLkirSQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_JsqJCLgf6syqV=jNPHPyu02ygwWCDDV+U9VCm0qRpLkirSQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200920_153922_539018_9781CB70 
X-CRM114-Status: GOOD (  15.97  )
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Fabio Estevam <festevam@gmail.com>, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>, NXP Linux Team <linux-imx@nxp.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 devicetree@vger.kernel.org, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-unisoc@lists.infradead.org,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Scott Branden <sbranden@broadcom.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:MEDIA DRIVERS FOR RENESAS - FCP"
 <linux-renesas-soc@vger.kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Sep 18, 2020 at 08:30:02AM -0600, Rob Herring wrote:
> On Thu, Sep 17, 2020 at 10:53 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > Convert parts of gpio.txt bindings into common dtschema file for GPIO
> > controllers.  The schema enforces proper naming of GPIO controller nodes
> > and GPIO hogs.
> 
> Did you not see my previous reply about a common schema? We already
> have a common GPIO and hog schema in dtschema. Please add to it
> whatever is missing.

Indeed, I'll enhance the dt-schema.

The trouble is that each in-kernel YAML file still has to mention
possible gpio-hogs nodes. Is the proper solution to put them in common
YAML inside kernel sources?

> 
> My goal is all common schema end up in dtschema, but I haven't pushed
> folks to do that yet. Ones I've done are there though. One issue is
> what's in dtschema should be GPL/BSD and the existing text bindings
> are default GPL, so there's a relicensing exercise. In some cases, the
> schema is there but I haven't copied over the descriptions.

Right, I'll skip the descriptions when posting to dt-schema.

Best regards,
Krzysztof


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
