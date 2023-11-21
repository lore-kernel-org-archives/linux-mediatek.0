Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE51C61D94
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Nov 2023 14:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g3A7KpgHMK4Z79+I2bLwtyrRdlzJKFRe2k6m6RGdmok=; b=lXt/M6dwEPrByOtQK3cFpwdwfB
	cLs/SXT2ij8GV7eiZA6pF0KiRQ8oCgZCD6bC/7AGdIe67oIgUtzkwLk7lcxEr57rK2noEb6IlRX92
	pIn9+PEfqkXLeLSW60Np8/flJtHIDp3dMqGcocN/Rwnslphda6I1YWcNnnR2jHLkTkeiEFbpfgS39
	WwngyTaC/OwkdtyrilDP3Or7xDJjah6K3HvE/irjYdHXhKd6NiDAlxZr9SdccVBXsSkROI0tWQmns
	EjeLoGXezjS4hxWHYU/77aULR9i61qGvnD+gHRV1f4qtelN9/f5zDcttbHQJoSiMEUK/eJEgtEGvU
	SYwh4tVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5Rxm-00H3ZZ-14;
	Tue, 21 Nov 2023 14:42:54 +0000
Received: from mail-il1-f178.google.com ([209.85.166.178])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5Rxi-00H3XN-29;
	Tue, 21 Nov 2023 14:42:51 +0000
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-359d796abd6so16877395ab.0;
        Tue, 21 Nov 2023 06:42:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700577768; x=1701182568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g3A7KpgHMK4Z79+I2bLwtyrRdlzJKFRe2k6m6RGdmok=;
        b=qWJf2ZwPw2f8kFDDklsubll8m8uXzkYqEhDMy9u/x5mrqBO91OQPBSesr0ShEup5Pk
         7kVGGk2PPbAZ//F418nS3lqRzTR+jv1EVNuODcpz4cCNMDo8955Dtto73iaIf+w+/B8n
         vzePa4jyWtcW5ENjxOD4lWKyGaA+uNBsoA3CgMdCsRBQ8eyhYaxxPEYQyGozsWF7TLWl
         5eHdGSsfiQOiAj67xxx3KQril0LwvLjlH6GbxJqAN6j+FuNKDWh252OwfHapDhF2X/wT
         5F4Mi65wii1lhJbbliheR5b5k0CwwjFGgYDLdm3ooTCD3IPWQQOymYrAgFivYzO7PGXz
         7OlA==
X-Gm-Message-State: AOJu0YzoqnK4EVWg8MKvZHrFLEUOFbkoqn1n5mIoN6p9d3OUwB3dz63U
	SPDB5jsQAkY+bEaLnprOFQ==
X-Google-Smtp-Source: AGHT+IFErelSnQ13ze33zj2Pn9ZJ8mT036wv+Q+uVkt2NH4z4GKcQqP9beqPCMRCJybBK/5ldhsxlw==
X-Received: by 2002:a05:6e02:ef4:b0:35a:e585:4275 with SMTP id j20-20020a056e020ef400b0035ae5854275mr2441886ilk.7.1700577768236;
        Tue, 21 Nov 2023 06:42:48 -0800 (PST)
Received: from herring.priv ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id s5-20020a056e0210c500b0035129b9c61bsm3232374ilj.45.2023.11.21.06.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 06:42:47 -0800 (PST)
Received: (nullmailer pid 1689994 invoked by uid 1000);
	Tue, 21 Nov 2023 14:42:44 -0000
Date: Tue, 21 Nov 2023 07:42:44 -0700
From: Rob Herring <robh@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Christian Marangi <ansuelsmth@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>, 
	SkyLake Huang <SkyLake.Huang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	David Epping <david.epping@missinglinkelectronics.com>, 
	Vladimir Oltean <olteanv@gmail.com>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Harini Katakam <harini.katakam@amd.com>, Simon Horman <horms@kernel.org>, 
	Robert Marko <robert.marko@sartura.hr>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [net-next RFC PATCH 03/14] dt-bindings: net: document ethernet
 PHY package nodes
Message-ID: <20231121144244.GA1682395-robh@kernel.org>
References: <20231120135041.15259-1-ansuelsmth@gmail.com>
 <20231120135041.15259-4-ansuelsmth@gmail.com>
 <c21ff90d-6e05-4afc-b39c-2c71d8976826@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c21ff90d-6e05-4afc-b39c-2c71d8976826@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_064250_703216_50372967 
X-CRM114-Status: GOOD (  27.63  )
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

On Mon, Nov 20, 2023 at 09:44:58PM +0100, Andrew Lunn wrote:
> On Mon, Nov 20, 2023 at 02:50:30PM +0100, Christian Marangi wrote:
> > Document ethernet PHY package nodes used to describe PHY shipped in
> > bundle of 4-5 PHY. These particular PHY require specific PHY in the
> > package for global onfiguration of the PHY package.
> > 
> > Example are PHY package that have some regs only in one PHY of the
> > package and will affect every other PHY in the package, for example
> > related to PHY interface mode calibration or global PHY mode selection.
> 
> I think you are being overly narrow here. The 'global' registers could
> be spread over multiple addresses. Particularly for a C22 PHY. I
> suppose they could even be in a N+1 address space, where there is no
> PHY at all.
> 
> Where the global registers are is specific to a PHY package
> vendor/model.

For this reason in particular, the package needs a specific compatible.

> The PHY driver should know this. All the PHY driver
> needs to know is some sort of base offset. PHY0 in this package is
> using address X. It can then use relative addressing from this base to
> access the global registers for this package.
>  
> > It's also possible to specify the property phy-mode to specify that the
> > PHY package sets a global PHY interface mode and every PHY of the
> > package requires to have the same PHY interface mode.
> 
> I don't think it is what simple. See the QCA8084 for example. 3 of the
> 4 PHYs must use QXGMII. The fourth PHY can also use QXGMII but it can
> be multiplexed to a different PMA and use 1000BaseX, SGMII or
> 2500BaseX.
> 
> I do think we need somewhere to put package properties. But i don't
> think phy-mode is such a property. At the moment, i don't have a good
> example of a package property.

What about power supplies and reset/enable lines?

Rob

