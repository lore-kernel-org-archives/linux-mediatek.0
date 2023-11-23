Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24704C61D85
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Nov 2023 10:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3tUVyHGP1WjRDJGX9CdkL5LLVHa/NoNDy1qrQLyl8FI=; b=UeQlhqP46z9UWYsZl2brfHSFxH
	Rpv3Hva2iya9BHUvBtepbZIIHqEHpTedbdTxds/SXNxIIV25SYPZsN+YBMQ98u1dY+bEkGzeggmoU
	f7hikXnJpsTr/svqhERVhMxtbA00TVaoyU46nb4bKZmw7ukdVPMRXd8/4H5M1A0dGVozZdQccJlxL
	+zM/ky4O5KizO0xj1c0zU3/JMSUHGC+3wFHEsdly3U1BXsv91CcE5KQ8NvvnnEO/4a1778hT7gSDB
	t8mPlZHCQKfdoY+Ojj9Ui7rQQUgDZP42dsQlZuqnJtHayGZmcQoVoIJ3NeI5Go7cxqhnxSnV4Y7Oz
	a3yJxj4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r676Y-004P1a-2b;
	Thu, 23 Nov 2023 10:38:42 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r676V-004P0G-07;
	Thu, 23 Nov 2023 10:38:40 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-332e3664665so247062f8f.0;
        Thu, 23 Nov 2023 02:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700735914; x=1701340714; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3tUVyHGP1WjRDJGX9CdkL5LLVHa/NoNDy1qrQLyl8FI=;
        b=lWDpDlO8xNdhrZm9xFDJGKcXOeM6jA7B73I8MjTZmAouzDsTc8VzC4xB1WHg64dUQ5
         imXO7H2QGloAo/aII4Q15QfRRjlcDCMt0tThFaZdpD1Bujp9AYN7Rqx38rFd/fAgDiPv
         S39i5r5Fna9Y48J5QJarmdruTeEdql3zPsgKE5zrwnaQLisGFdin7MKdBALHIlMscEyN
         KslyKH3zK5fWGDvC/4Ej6V6PgQXmZFDirPJpWEfFmjXrWITfbiWr39x8HNjxNeOnO16X
         PmmC6NU93ogyK2OKM35LOt5VMVl3EkK/wWEFXDZqk5hW1x5KdNhevCsbJ5wNWogvJeoq
         K74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700735914; x=1701340714;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3tUVyHGP1WjRDJGX9CdkL5LLVHa/NoNDy1qrQLyl8FI=;
        b=UbBs9Ndz/lnELDlqQ5eytyoKeLPE7P2MWa+IifK29lntdS0ZLcvG1ht3fTzGB8wZCW
         vERh6xR0u+r+QbfQ1NzUzDzsvE2sDMLZDHI/xGCPeRUIfqpVDsYBfyPjG3hrARpkeyO1
         +h+LFp9I69tutobzKFwgM6NnB4vN3qZ9Uz+yhMcezGiALmPhTWJU/qQpaIVnApPAbUc5
         oVNluMz4kr7bb5LxYSEHUqFagxORrNxOVRhDQsP+K+l04KnuS0X9ZrEkTSBiMTHAAsgf
         OnfpWakk7gcr20ucZProcdqMLpO19Koi1gUmd9kDAMXBLAsM9H2GMa8wlZMKKcm6GC5n
         AXsQ==
X-Gm-Message-State: AOJu0Yy3a2l4OH0NRVH3RmyIOiearqZn28tFf8bEDg/C+yGsWa3uQ8oE
	RLSrLoOCiFA4vDfzvAVxy7k=
X-Google-Smtp-Source: AGHT+IGUjvYu+WeYQkp7U08ioiooONMJDQgJFQxfglLmlgoXQt1BuDElx7HSiWi0TffENVRQPMMpjQ==
X-Received: by 2002:adf:e992:0:b0:332:dfeb:76ab with SMTP id h18-20020adfe992000000b00332dfeb76abmr1048229wrm.60.1700735914167;
        Thu, 23 Nov 2023 02:38:34 -0800 (PST)
Received: from Ansuel-xps. (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.gmail.com with ESMTPSA id w3-20020a5d5443000000b003140f47224csm1287597wrv.15.2023.11.23.02.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 02:38:33 -0800 (PST)
Message-ID: <655f2ba9.5d0a0220.294f3.38d8@mx.google.com>
X-Google-Original-Message-ID: <ZV8qxCbjilsVIoDS@Ansuel-xps.>
Date: Thu, 23 Nov 2023 11:38:31 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	David Epping <david.epping@missinglinkelectronics.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Harini Katakam <harini.katakam@amd.com>,
	Simon Horman <horms@kernel.org>,
	Robert Marko <robert.marko@sartura.hr>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [net-next RFC PATCH 03/14] dt-bindings: net: document ethernet
 PHY package nodes
References: <20231120135041.15259-1-ansuelsmth@gmail.com>
 <20231120135041.15259-4-ansuelsmth@gmail.com>
 <c21ff90d-6e05-4afc-b39c-2c71d8976826@lunn.ch>
 <20231121144244.GA1682395-robh@kernel.org>
 <a85d6d0a-1fc9-4c8e-9f91-5054ca902cd1@lunn.ch>
 <655e4939.5d0a0220.d9a9e.0491@mx.google.com>
 <6a030399-b8ed-4e2c-899f-d82eb437aafa@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a030399-b8ed-4e2c-899f-d82eb437aafa@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_023839_078907_2704A699 
X-CRM114-Status: GOOD (  58.69  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Nov 23, 2023 at 04:30:48AM +0100, Andrew Lunn wrote:
> On Wed, Nov 22, 2023 at 07:32:22PM +0100, Christian Marangi wrote:
> > On Tue, Nov 21, 2023 at 03:45:42PM +0100, Andrew Lunn wrote:
> > > > > I do think we need somewhere to put package properties. But i don't
> > > > > think phy-mode is such a property. At the moment, i don't have a good
> > > > > example of a package property.
> > > > 
> > > > What about power supplies and reset/enable lines?
> > > 
> > > Yes, good point. I can imagine some packages sharing regulators. Reset
> > > might also be shared, but it makes things messy to handle.
> > >
> > 
> > Sooooo.... Sorry if I insist but I would really love to have something
> > ""stable"" to move this further. (the changes are easy enough so it's
> > really a matter of finding a good DT structure)
> > 
> > Maybe a good idea would be summarize the concern and see what solution
> > was proposed:
> > 
> > Concern list:
> > 1. ethernet-phy-package MUST be placed in mdio node (not in ethernet,
> >    the example was wrong anyway) and MUST have an addr
> > 
> >    Current example doesn't have an addr. I would prefer this way but
> >    no problem in changing this.
> > 
> >    Solution:
> >      - Add reg to the ethernet-phy-package node with the base address of
> >        the PHY package (base address = the first PHY address of the
> >        package)
> 
> Yes.
>

Thanks.

> >        We will have a PHY node with the same address of the PHY package
> >        node. Each PHY node in the PHY package node will have reg set to
> >        the REAL address in the mdio bus.
> 
> Basically Yes. I actually think the first sentence is not 100%
> correct. It could be all the package configuration registers are in
> the base address, without an actual PHY. The PHYs then follow at
> addresses above it. I can also imagine a case where the first PHY in
> the package is not used, so its not listed at all. So i think it
> should be "We often have a PHY node with the same address of the PHY
> package node."
> 

Just to add details, also the opposite can happen. Where the last PHY in
the bundle is used for global configuration but is not defined. This is
another reason I wanted the global-phy proprerty, having to reference
them even if they are not used better describe the actual PHY address
used in the mdio bus. If the PHY is handled internally and omitted in DT
then people might think that address is not used.

> > 3. phy-mode is problematic.
> > 
> >    It's an optional value to enforce a specific mode for each PHY in the
> >    package. For complex configuration the mode won't be defined.
> > 
> >    Solution:
> >     - Rename it to package-phy-mode to make it less confusing.
> > 
> >     - Add an additional function that PHY package can use to make custom
> >       validation on the mode for every PHY attached (in the PHY package).
> > 
> >       Would make it less clear but more flexible for complex
> >       configuration. Maybe both solution can be implemented and the
> >       special function is used if the mode is not defined?
> 
> The description you give is that there are two SERDES, and both could
> be connected to a MAC. What does package-phy-mode represent then? 
> 
> Luo Jie patch for the qca8084 seems to have the same issue. It has two
> SERDES/PMA, and both could be connected to the MACs. So it seems like
> QCA devices don't actually fit this model. If we want to describe the
> package link mode, we probably need to list each PMA, and have a
> property in the PMA node indicating what link mode the PMA is
> operating at.
> 
> At least for the moment, its not clear we actually need this at
> all. It seems like the phy-mode is all we need. The PHY driver should
> know what values are valid per port, and so can validate the value.
> 

Just to be more precise qca807x can operate in 3 different mode:
(this is controlled by the MODE_CFG bits)
- QSGMII: 5 copper port
- PSGMII: 5 copper port
- PSGMII: 4 copper port + 1 combo (that can be both fiber or copper)

When mode is set to QSGMII each PHY needs to have the matching mode or
we have no traffic. It makes it difficult driver side to understand what
mode should be enforced with all kind of parsing or magic in private
struct.

Maybe for this specific case would be ok to introduce a simple specific
proprerty? Like qca,qsgmii_mode ?

> > 4. Not finding a correct place to put PHY package info.
> > 
> >    I'm still convinced the mdio node is the correct place.
> >    - PHY package are PHY in bundle so they are actual PHY
> >    - We already have in the mdio node special handling (every DSA switch
> >      use custom compatible and PHY ID is not used to probe them
> >      normally)
> >    - Node this way won't be treated as PHY as they won't match the PHY
> >      node name pattern and also won't have the compatible pattern for
> >      PHY.
> 
> We do need a compatible for the package. The kernel is unlikely to use
> it, but the validation tools will. Each package can have its own DT
> properties, so we need a .yaml to describe those properties. So i
> would expect to have a "qca807x-package" compatible, which then lists
> the tx driver strength etc. The PHYs within the package don't need
> compatible, they are just linux PHYs, probed using the same code as
> PHYs outside of a package.
>

Since the idea is add OF support for the PHY we also need a generic
compatible for it.

Is it ok to have something like

compatible = "ethernet-phy-package", "qca807x-phy-package";

With "ethernet-phy-package" a must and "qca807x-phy-package" used only
if additional property are used.

My current idea was to use select and base everything on the possible
PHY compatible (and it does work, tested by adding bloat in the DT
example and seeing if the schema was rejected). Had this idea since the
compatible would never be used.

-- 
	Ansuel

