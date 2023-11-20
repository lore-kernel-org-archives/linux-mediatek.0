Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9ABAC2BB3F
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Nov 2023 21:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kWNfORC9WXph6KKDiI7YmzeaXM5cXoqqihKDnt/tg2s=; b=iIRyqOTeQsI/+Sre3PF4iCjY/d
	j//+b1ac1CwJ1ccI3QlryViDgdbixb2dw5wHKSGNiBdeozhkIrrXRgj/EizD8BcqpQw/L2FgeZYil
	sjcGvnNlXk2mHqV61H5xfqycPOYdxUuAK6wZQtN3EOjuhA5AfnyWhi1KSbtFXh6rdbeX6/I5r1TG0
	/s3vNy8ECFBLLw3GsLgIVXT3+Rp38/OV+nk2hkvQ+2TSZiiS4ulbqkD51aq6mZ1UAAy7PxiGaVoo2
	0+qj8+7pEhV4bfN9dQEBbwh4GvxKlLfO22h2o5zw/9vJ1vupbgLOyI0uyjvr8C4HSbG7XdhiHDqMG
	ygLO+maQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5Btc-00EtDS-1i;
	Mon, 20 Nov 2023 21:33:32 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5BtU-00EtBh-1E;
	Mon, 20 Nov 2023 21:33:26 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-332c7d4a6a7so845286f8f.2;
        Mon, 20 Nov 2023 13:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700516001; x=1701120801; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kWNfORC9WXph6KKDiI7YmzeaXM5cXoqqihKDnt/tg2s=;
        b=ik84wypvmCdm0rZbIs0e3iLILa3Bou118dyH19gIQ4ALkcB69a6RSSdedluVPFOipn
         0oACnTsJl/K6vM7UUP1MrMSFNukDU/sSVuRwhZUYqWUcKvcQ4Uq93DVglFfVh9j6darL
         oLAA2283Xz1m62Lv6Cpi4QEeXAPQ1EAWF9LCRdLEzbFZfduiV4N58TAhQO1ePWXoqsYh
         2cQsiK+760bBBfylxb6kiPb613+FrdtxYlXnZXQNiwuKB77P54t5zd8yVSuUSrWU4Azn
         GkjQj8RGKRBnUGDFf5ntph+vMnjskosaB2hzaCOc9xywSyUxj6TuTyTQ44j/rdTu8y7H
         yDZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700516001; x=1701120801;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kWNfORC9WXph6KKDiI7YmzeaXM5cXoqqihKDnt/tg2s=;
        b=pW3pTwH+rZ0fPemPgHbR4Jls9ze4hagsBdGt2SE+/4uRayLxAEww4oZDyD2GDb1adk
         swO5kE1GmFA0Q7nOq2l55j0wTxB6hExek5qXQVPTkumxuErbfmSGzSbzu0WJ7fUny7dI
         BoSjr9OtxrzlNmNFZziIO+Z2rjWLTZ1mjax7XFqUf/9txuLvw+cgZ9T69O8y5OSmelUi
         mteW8eWHeDpOLu/HJEJzmDzR3rIa+Gf9j8/9RLRfv3aOn7uWy+rA8PhH+LyfpOztvjku
         G4AcJ8pQgwrw7rx47/Vi3MzcbtJcNGPC2e6Q+aglr12ADB8Pt6Ajb8/eqz/vIIE7ge92
         RTsQ==
X-Gm-Message-State: AOJu0YwulbYAvPwqfqdB23sD9B+VJpeztnwJhB8mu0Ps7JIJeufNZCK2
	nrkgd5+u0ApQK0DzSc5Gwu8=
X-Google-Smtp-Source: AGHT+IGWWKqhNx6gXBkuFHcXHhfK1w8N/HKv9y2WoU75JVgzVFjqqAOeK/jHkG5ym9ne0q6hzaMShg==
X-Received: by 2002:adf:9b89:0:b0:332:c4b0:6a19 with SMTP id d9-20020adf9b89000000b00332c4b06a19mr4949954wrc.59.1700516000813;
        Mon, 20 Nov 2023 13:33:20 -0800 (PST)
Received: from Ansuel-xps. (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.gmail.com with ESMTPSA id c15-20020adfe70f000000b0032da8fb0d05sm12257843wrm.110.2023.11.20.13.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 13:33:20 -0800 (PST)
Message-ID: <655bd0a0.df0a0220.568c3.92d9@mx.google.com>
X-Google-Original-Message-ID: <ZVupN1rFPGIPryuG@Ansuel-xps.>
Date: Mon, 20 Nov 2023 19:45:11 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
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
 <655bc8d6.050a0220.d22f2.315f@mx.google.com>
 <45784368-93e0-4d57-bb0c-5730f53f5a08@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45784368-93e0-4d57-bb0c-5730f53f5a08@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_133324_821629_479BE48C 
X-CRM114-Status: GOOD (  16.59  )
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

On Mon, Nov 20, 2023 at 10:25:10PM +0100, Andrew Lunn wrote:
> > A real DT that use this is (ipq807x):
> > 
> > &mdio {
> > 	status = "okay";
> > 	pinctrl-0 = <&mdio_pins>;
> > 	pinctrl-names = "default";
> > 	reset-gpios = <&tlmm 37 GPIO_ACTIVE_LOW>;
> > 
> > 	ethernet-phy-package {
> > 		compatible = "ethernet-phy-package";
> > 		phy-mode = "psgmii";
> > 
> > 		global-phys = <&qca8075_4>, <&qca8075_psgmii>;
> > 		global-phy-names = "combo", "analog_psgmii";
> > 
> > 		qca8075_0: ethernet-phy@0 {
> > 			compatible = "ethernet-phy-ieee802.3-c22";
> > 			reg = <0>;
> > 		};
> 
> ...
> 
> > 	};
> > 
> > 	qca8081: ethernet-phy@28 {
> > 		compatible = "ethernet-phy-id004d.d101";
> > 		reg = <28>;
> > 		reset-gpios = <&tlmm 31 GPIO_ACTIVE_LOW>;
> > 	};
> 
> I've no idea if DT allows this. The issue is that reg is the same for
> both nodes within the ethernet-phy-package container, and
> ethernet-phy@28. They are all addresses on the same MDIO bus.  We are
> parsing this bus structure ourselves in __of_mdiobus_register(), so we
> could make it work, but i don't know if we should make it work.
>

And that is why I have some reserve on the idea of defining a reg for
ethernet-phy-package. Adding a reg would create some duplicate. Is it
really a problem to have a node with no reg in the mdio node?

(patch 04 of this series already updates the parsing function to check
one level deeper in the presence of the ethernet-phy-compatible treating
any node found as it was defined in the upper mdio node)

-- 
	Ansuel

