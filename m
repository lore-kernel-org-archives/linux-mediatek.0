Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 621B4C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Feb 2022 10:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iZinkzZLY/r/cCAbQOLtgIJVqHj5AMeXteglkeN2YdE=; b=iQOM2/MpQ2+SMg
	JBEEB74a4327ko3QTyjWvJi37XIQa0jU9EF6N3sx+8lY1/HGtHDAR/Hh7PwldWLErOLDDG4Pxdy14
	Tb2+7eT/Qz1qM0fbstgmnNZ3tl8mwWqZwTdLtp0Y+RO9KiUP33vS1NcAQcbGzqaQwQdOMQ3oZmRO+
	WGxBIfrTCIb/XEIxaEvgskGMMJIeQ6PGzfp4QW7NOG/cMFSX9ODtH03uO6Eig5xmOjY0rXWV2arj3
	TNj3d6WeFE0t/83pyFmnDgmj/zfBiOPpnaOuTcyCs0piZHwCy/2qbnOCDB+nhPAET1innptk+dWFN
	wmS9j3Ic8V4fFL7fdZEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNB1Z-000EXf-Re; Thu, 24 Feb 2022 10:07:01 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNB1M-000ESW-80; Thu, 24 Feb 2022 10:06:49 +0000
Received: from [185.156.123.69] (helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nNB17-0008WC-GT; Thu, 24 Feb 2022 11:06:33 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Lee Jones <lee.jones@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Rob Herring <robh+dt@kernel.org>, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>, Thierry Reding <thierry.reding@gmail.com>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org,
 chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: pwm: google,
 cros-ec: include generic pwm schema
Date: Thu, 24 Feb 2022 11:06:30 +0100
Message-ID: <1817486.VeUe9BSz9F@phil>
In-Reply-To: <YhdXyBvAbdHzc4gH@google.com>
References: <20220214081916.162014-1-krzysztof.kozlowski@canonical.com>
 <3248917.W5uN0jUHDo@phil> <YhdXyBvAbdHzc4gH@google.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_020648_321938_1A591FE8 
X-CRM114-Status: GOOD (  24.26  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Am Donnerstag, 24. Februar 2022, 11:02:48 CET schrieb Lee Jones:
> On Wed, 23 Feb 2022, Heiko Stuebner wrote:
> 
> > Hi Lee,
> > 
> > Am Mittwoch, 23. Februar 2022, 10:16:01 CET schrieb Lee Jones:
> > > On Mon, 14 Feb 2022, Krzysztof Kozlowski wrote:
> > > 
> > > > Include generic pwm.yaml schema, which enforces PWM node naming.  Keep
> > > > the old name in bindings as deprecated.
> > > > 
> > > > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> > > > ---
> > > >  Documentation/devicetree/bindings/mfd/google,cros-ec.yaml    | 4 ++++
> > > 
> > > Acked-by: Lee Jones <lee.jones@linaro.org>
> > 
> > what is your expectation regarding this patch?
> > 
> > Are you planning to merge it or are you expecting this to go through
> > some other tree?
> > 
> > The binding-change here is backward-comaptible in that the old
> > node-name is still in it, only marked as deprecated, so in theory
> > this patch should be able to be applied on its own without
> > causing defects.
> 
> In an ideal world, it would be broken up and I would take the MFD
> part.   Is that possible or are there dependencies?

That is also what Krzysztof had in mind - see his reply to patch4.
Binding going through the MFD tree and soc maintainers applying
the individual dts patches.

As written the binding change is backward compatible, so no harm.

I was just confused by the "Acked-by" and wanted to clarify how you
see it ;-)


Heiko






_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
