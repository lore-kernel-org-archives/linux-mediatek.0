Return-Path: <SRS0=cvih=CU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53E31C433E2
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 06:11:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0697421D7E
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 06:11:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="opcAVi27";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="GHEpjzBi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0697421D7E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KMIiGA4nWE4eO6fUkU/rV/8kVm+DUdzqIlYZEHektBk=; b=opcAVi27ZLAz01gGUtrapVDKj
	eWp0wc5iHL157bZ7iFwNk5fJ+SfWHsSYCG80LZiVyC+kBHcBcqKdZkaI2q1QN2z1H2v9MruBDzpH1
	2qVHiCJHmP2e8Hlx0qDo7rbdENo9F4ok7pKilsqinK1nP4DqsJduTFMMqaCfzY2f6T58SixBGgTf1
	YF5tYrW2XYPayhEM1FElUWW5QMX5Z7ZYoiMD4cNMXlOs1VeFcfuycwbflJ9KPvbMiesPf+kt0SpmR
	QUYWGq5zMU0dxp3w26k4t9N+/h9LR80559oXTBfBr0sKRtEN2sF6BaWo5A9/mMUWGs7K4g1kSc3Mi
	ZMVYqutlw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGcH9-0003vM-Hx; Fri, 11 Sep 2020 06:11:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGcH5-0003u7-RR; Fri, 11 Sep 2020 06:11:08 +0000
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D87F3221EC;
 Fri, 11 Sep 2020 06:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599804667;
 bh=R+WQCRWfq/LEeLL9EuGAFD+jyfSl/fjliRW9gC2u17M=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=GHEpjzBiGvtJ1QhOXg4nIsgN5ThSgM00QRJX4Cghvz7A274L7p71V6OwfaBrG1X7J
 uVyd/7XdH7fhiQhYyOM4eLfnabBhEQ8cFOqAAgpYBXbjJTV7NJ8+LYLGYdNvk7hHE1
 8odlxiTb6JWeOThhbKMIc1HFWyofHRtn3Q8u/1v8=
Received: by mail-ej1-f46.google.com with SMTP id i22so12202965eja.5;
 Thu, 10 Sep 2020 23:11:06 -0700 (PDT)
X-Gm-Message-State: AOAM530pZHo6xWz+bZZOw+/JyyR4d0hfWxrYaUsxx3dF0vmTXPynwMcS
 ulu8VebJ7374azEeCXRTHV3or7LhbxGXnLEP5ig=
X-Google-Smtp-Source: ABdhPJysqYkgvsUB5GiEswkRNNKILHjjgWCeXRVo+QHtk0WCjK+abRX2rEGDEoOCLg/z/tM8wvqyn+iTq0H6F2DGVuc=
X-Received: by 2002:a17:906:af53:: with SMTP id
 ly19mr495830ejb.503.1599804665477; 
 Thu, 10 Sep 2020 23:11:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200910175733.11046-1-krzk@kernel.org>
 <20200910175733.11046-13-krzk@kernel.org>
 <CACPK8XfmDySpkCw8nkmns-euGQE6JTqZLVO6JhvFJiRqNosRuQ@mail.gmail.com>
In-Reply-To: <CACPK8XfmDySpkCw8nkmns-euGQE6JTqZLVO6JhvFJiRqNosRuQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 11 Sep 2020 08:10:53 +0200
X-Gmail-Original-Message-ID: <CAJKOXPca3R=LYVws9rYj-iuOx7Z1GMkM2ow2pCQ3CGnv0vSS7Q@mail.gmail.com>
Message-ID: <CAJKOXPca3R=LYVws9rYj-iuOx7Z1GMkM2ow2pCQ3CGnv0vSS7Q@mail.gmail.com>
Subject: Re: [PATCH v2 12/15] ARM: dts: aspeed: align GPIO hog names with
 dtschema
To: Joel Stanley <joel@jms.id.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_021107_947327_66BF7D29 
X-CRM114-Status: GOOD (  16.37  )
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
Cc: Nishanth Menon <nm@ti.com>, Andrew Lunn <andrew@lunn.ch>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Tony Lindgren <tony@atomide.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Michal Simek <michal.simek@xilinx.com>, linux-renesas-soc@vger.kernel.org,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 NXP Linux Team <linux-imx@nxp.com>, Guenter Roeck <linux@roeck-us.net>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 devicetree <devicetree@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 linux-omap@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tero Kristo <t-kristo@ti.com>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 11 Sep 2020 at 02:58, Joel Stanley <joel@jms.id.au> wrote:
>
> On Thu, 10 Sep 2020 at 17:59, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > dtschema for pca95xx expects GPIO hogs to end with 'hog' prefix.
>
> This is a bit ugly. Do we have to go down this path?

No, but please comment on schema (1/15 in this series).

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
