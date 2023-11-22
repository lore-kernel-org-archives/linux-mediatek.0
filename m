Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA847C61D97
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Nov 2023 18:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G82jl5R85KrKlIvXF944oRqyBdLM61l/27VAJKW7ibk=; b=qlURi1yoIcJUOgampHFL2lnUr8
	G3HxcfKdE23NRggmVpLjnPpNZQ80xH1fS/tnwxqDCwYmQ78GhLBGR/ozW5XNEDx309O0/VvdoUcVm
	AL9SQVMcDo+BqqAvZdbx3sG3laLLBn3tnkyIOsH/CgzFjFZ2oq3LyVqhOH7oHxov8BHKwmFFX93kU
	ibYDulKwTHiGckWoUIhET10lSjFsOAMqKk9zvtQTGO8yI6pNEwb11j+4TQ8QcTNCHs3CMs34MwDtn
	tedot/QKTE2MzxoxoGnrxxe9pSSyUjNps03+MZwcp2svyops3K4DvWqL0gX5uiIRR7oYzwm2EapQf
	XV/WK3ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5s1h-002pbu-1l;
	Wed, 22 Nov 2023 18:32:41 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5s1d-002pZE-2G;
	Wed, 22 Nov 2023 18:32:39 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4084de32db5so425005e9.0;
        Wed, 22 Nov 2023 10:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700677946; x=1701282746; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=G82jl5R85KrKlIvXF944oRqyBdLM61l/27VAJKW7ibk=;
        b=VDWsz25UA535Ujxg6zRv7QQDTwWphAyY9K53la6obvGSSvt5NhQtA5mA2m1OAM1wGF
         6ViWPlg7XlBIXeeM5WXTA/qgQv+w8UeRc7eapzAFTDXb3gCtb+NeIJtdZly15RkZVPYe
         4BWiUF4td2F2UESKZysrL0afySwnD/StX0M1UqeeGAZibxoRG5YXCSc5t4bn3m25IwAY
         Hc2JpZrIVsdHa56mvGpChr5uwcVhIwYCFvvv/bxIRBMAkisv/xncdM+wMv64cjSaWOtW
         KtnoQ9pMqI1tqSNlr7m/qKRl/S259M3aT1zq2eU+Jg2R45bric77UYRDCNGkisIqSSKJ
         Xc+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700677946; x=1701282746;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G82jl5R85KrKlIvXF944oRqyBdLM61l/27VAJKW7ibk=;
        b=c5HdZkXZBMuBsiITvh6mCVHSAsmt5f4enkaebyzvzMwK5QUtvydqjXyO+6aEAlsmJS
         +xm89WOf6Gcw/ufAkSVH82IFGB4R2ZBUqM8Lx1Y0/NjJIpgPNjyRKCGiC2BR0/teVvNo
         ikOTmZLYZavd1vJZU02rRGMcyIf9MuzRm3yUvxEGmOJDkOudiefPa4l9hau2YNeZyRSC
         jqOR2nhbtxS0iCwjTB3sPPk1N99UEa6Oy4MRw+yA7nGpM5MBVCEwIve7VNsctonnbb0x
         BSgorXPcFc8fJTXZzb9UtseyYh6zyTseZGp9y8LJhLov7zQNCA95zLpWpEmNYe9YrCjU
         t+mw==
X-Gm-Message-State: AOJu0Yy3wi0TcWzLGPKLgv0sFsHgmILfUDLzI8b4+Whb2dcQdq0u2F7C
	Kuawr0Ua+JyHywxIhnoNBKE=
X-Google-Smtp-Source: AGHT+IHBQ4JaBRS5h/zdVUY4AjeC4ynRiLMVSh0VKCAq2uaozmjgxsKD4sDol97YRrGQU4AgThlqjA==
X-Received: by 2002:a5d:6985:0:b0:32d:9a20:c9e0 with SMTP id g5-20020a5d6985000000b0032d9a20c9e0mr2241676wru.61.1700677945993;
        Wed, 22 Nov 2023 10:32:25 -0800 (PST)
Received: from Ansuel-xps. (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.gmail.com with ESMTPSA id b17-20020a5d4b91000000b003316b3d69b3sm63435wrt.46.2023.11.22.10.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 10:32:25 -0800 (PST)
Message-ID: <655e4939.5d0a0220.d9a9e.0491@mx.google.com>
X-Google-Original-Message-ID: <ZV5JNmi5T7WKMq4t@Ansuel-xps.>
Date: Wed, 22 Nov 2023 19:32:22 +0100
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a85d6d0a-1fc9-4c8e-9f91-5054ca902cd1@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_103238_107189_6D837CC7 
X-CRM114-Status: GOOD (  26.05  )
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

On Tue, Nov 21, 2023 at 03:45:42PM +0100, Andrew Lunn wrote:
> > > I do think we need somewhere to put package properties. But i don't
> > > think phy-mode is such a property. At the moment, i don't have a good
> > > example of a package property.
> > 
> > What about power supplies and reset/enable lines?
> 
> Yes, good point. I can imagine some packages sharing regulators. Reset
> might also be shared, but it makes things messy to handle.
>

Sooooo.... Sorry if I insist but I would really love to have something
""stable"" to move this further. (the changes are easy enough so it's
really a matter of finding a good DT structure)

Maybe a good idea would be summarize the concern and see what solution
was proposed:

Concern list:
1. ethernet-phy-package MUST be placed in mdio node (not in ethernet,
   the example was wrong anyway) and MUST have an addr

   Current example doesn't have an addr. I would prefer this way but
   no problem in changing this.

   Solution:
     - Add reg to the ethernet-phy-package node with the base address of
       the PHY package (base address = the first PHY address of the
       package)

       We will have a PHY node with the same address of the PHY package
       node. Each PHY node in the PHY package node will have reg set to
       the REAL address in the mdio bus.

2. global-phys are redundant and can be dropped.

   They are used to facilitate and make it less obscure how the PHY
   package is described. Can totally be handled internally by the PHY
   driver. Still I would prefer to keep them as is.

   Solution:
     - Drop the thing and leave the PHY driver handle it with hardcoded
       values.
       Due to point 1, the shared struct will have the base address of
       the PHY package and will be handle to reference the global PHY at
       an offset from the base address.

3. phy-mode is problematic.

   It's an optional value to enforce a specific mode for each PHY in the
   package. For complex configuration the mode won't be defined.

   Solution:
    - Rename it to package-phy-mode to make it less confusing.

    - Add an additional function that PHY package can use to make custom
      validation on the mode for every PHY attached (in the PHY package).

      Would make it less clear but more flexible for complex
      configuration. Maybe both solution can be implemented and the
      special function is used if the mode is not defined?

4. Not finding a correct place to put PHY package info.

   I'm still convinced the mdio node is the correct place.
   - PHY package are PHY in bundle so they are actual PHY
   - We already have in the mdio node special handling (every DSA switch
     use custom compatible and PHY ID is not used to probe them
     normally)
   - Node this way won't be treated as PHY as they won't match the PHY
     node name pattern and also won't have the compatible pattern for
     PHY.

   Solution:
    - ethernet-phy-package node is OK given a reg is defined.

These are the 4 concern we have currently, hoping I didn't miss any, I
hope we can sort those so I can send a v2 and make some progress on
this.

-- 
	Ansuel

