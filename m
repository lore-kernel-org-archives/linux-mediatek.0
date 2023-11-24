Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C82E4C61DF4
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Nov 2023 18:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nZE0Duv0jXkYD1Uf9wlPJY0p/L8iUSaCA0xiviM7UDY=; b=iRAJcdtd58ADmGyJPXmqExw0Ym
	2N8Kd2SpoAALpQjkFfm8CUE0SqptDhzUUHbYv9IlUjZcZG5j9o5we4C6MAFsifpsv9riexH8izvnu
	5ACT4Q9UsD3Mn/QpQC0UnLd9SC0qomCpJeW0zC9rSCse0fNUtt1HM7VJGIgsQlph0ukTplA5xhe4N
	twJpzbvEHsyR6un28l8vOgXtrSCBftnH7gAdny4CBJj9RYrCJYL/kleiaP5MqOfHDq7yvN1maHiGz
	M+7Kw/4ySjtsTw9TR9mkhyZ2btpOgvs+6Fdowqa0OaisgOYJO5JBWRY4cHu3QexzX2Eb0UbraxRpn
	34uUO3Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6ath-007sKM-2Z;
	Fri, 24 Nov 2023 18:27:25 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6atd-007sJi-2l;
	Fri, 24 Nov 2023 18:27:23 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a00a9c6f1e9so324598866b.3;
        Fri, 24 Nov 2023 10:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700850439; x=1701455239; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nZE0Duv0jXkYD1Uf9wlPJY0p/L8iUSaCA0xiviM7UDY=;
        b=TJ3IElbP4M8lFkX3OCJcC1CKuvwD4LnhhjAJje5hMQOOIou4AQMsC6soaQ05YQwf90
         u3Pw4JoeH0bFKnvh65NPWiPHDnNc9DEfo5AQqud0nwCotV55C/gxhdYOvKjiTehfYrtI
         q5j8FZHwAXrJ99cBRn6/zej+WcuMmMDHHGqjlvRYDU8jvExd6z6mA1bml6MX1NfSTn/0
         WnBUd9JgxO4YnRWCf5tG1s2QTVVsAQX312SyP2YSu8069ffNM5y5nE4JQa1lZgk7zkQZ
         5ZqtQ3xoHUOctYlf0+ArZWHDFKB3fKPAwtxi4xO29l0Yf8nV1IbprmF+GsXqUwhAaWr6
         5qWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700850439; x=1701455239;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nZE0Duv0jXkYD1Uf9wlPJY0p/L8iUSaCA0xiviM7UDY=;
        b=k5Ux/Gxv+ZQEvoZY0vOoOyuLJCqw4NeD4eu45HA/B7dK2fDg2diCQ6OFhfWPfXvSDz
         jinR+tnfoYE6WmtpnS1XkIkJFro601iChl5ueYzFbS8r+8PzSIMhA7x+IJRviIME5dB6
         an899EYxZND+fm6U95Pwb00kN1L61PZzDVoreJre/5sHwAFGOmq13WvKcDBXFgMvLNIT
         nM+PDO9eTR0XNLNKiurqEbjQEYbHESeC+VmVdHNfGG7xDKI7rsSlxhpHoslHFF7fGmZN
         tq92J1YeLGd8JSS3MvIjBaqo0q0YOlNGVh59y+tZz6vJ/CDQfvxgVAspbBwFBjpAHzMm
         mvhA==
X-Gm-Message-State: AOJu0YzM65wLpu2vhOZzhHVA8njrraQ7oCU85Ca8Yq3e2DeG/2YXQ4N1
	mAwxkzR7+nyhBAbpdz6xv2o=
X-Google-Smtp-Source: AGHT+IFuywZgZqeVIukwbFqD8q5mrgqH2bkh0mMo/lbicvHhoDUxK4WwGP+s8nvCyvyHtUVJhgXK6g==
X-Received: by 2002:a17:906:3fd0:b0:9b2:c583:cd71 with SMTP id k16-20020a1709063fd000b009b2c583cd71mr2509480ejj.50.1700850439417;
        Fri, 24 Nov 2023 10:27:19 -0800 (PST)
Received: from skbuf ([188.26.185.12])
        by smtp.gmail.com with ESMTPSA id k18-20020a170906579200b009ffe3e82bbasm2356276ejq.136.2023.11.24.10.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 10:27:19 -0800 (PST)
Date: Fri, 24 Nov 2023 20:27:15 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
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
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Harini Katakam <harini.katakam@amd.com>,
	Simon Horman <horms@kernel.org>,
	Robert Marko <robert.marko@sartura.hr>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [net-next RFC PATCH 03/14] dt-bindings: net: document ethernet
 PHY package nodes
Message-ID: <20231124182715.azmi3fwrdg3gfdkj@skbuf>
References: <20231120135041.15259-1-ansuelsmth@gmail.com>
 <20231120135041.15259-4-ansuelsmth@gmail.com>
 <c21ff90d-6e05-4afc-b39c-2c71d8976826@lunn.ch>
 <20231121144244.GA1682395-robh@kernel.org>
 <a85d6d0a-1fc9-4c8e-9f91-5054ca902cd1@lunn.ch>
 <655e4939.5d0a0220.d9a9e.0491@mx.google.com>
 <20231124165923.p2iozsrnwlogjzua@skbuf>
 <6560dc65.050a0220.182b5.650c@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6560dc65.050a0220.182b5.650c@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_102721_913055_DDC4BA44 
X-CRM114-Status: GOOD (  27.57  )
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

On Fri, Nov 24, 2023 at 05:25:16PM +0100, Christian Marangi wrote:
> The main reason is the fact that PHY package are already a thing and API
> are already there (phy_package_join/leave...) so we just lack any way to
> support this in DT without using specialized code in the PHY driver.
> 
> This is really completing the feature.

Hmm, I see struct phy_package_shared as a mechanism to tell phylib that
multiple device structures are actually related with each other, because
the device core, and their parent bus, has no idea. If you're under
control of the parent bus code and you can probe PHY devices in any
order you want and do whatever you want before probing them, I don't see
why you would need struct phy_package_shared any longer? I don't see why
this feature needs to be completed, if that involves changes to the
device tree structure. PHY packages assumed no changes to the device
tree (they rely on a hacky interpretation of the MDIO address AFAIU).
If we change that basic premise, all implementation options are on the
table, I think.

> The only reason for the generic "ethernet-phy-package" compatible is to
> have a solid detection of the node in PHY core. (I assume parsing the
> node name might be problematic? Or maybe not now that we require adding
> a reg to it)

Our opinions seem to differ, but I don't think that the package needs a
solid detection of the node in the PHY core :) I think phy_devices and
mdio_devices already cover everything that's necessary to build a
solution.

> Also I don't expect tons of special properties for PHY package, with the
> current probe/config implementation, a PHY driver have lots of
> flexibility in all kind of validation.
> 
> Consider that the additional global-phys and global-phy-names are
> already expected to be dropped.
> (we know the PHY package base address and we can calculate the offset of
> the global phy from there in the PHY package probe)
> 
> And even the phy-mode has been scrapped for more specific solution...
> (some assumption can be done on probe by checking the PHY mode and set
> stuff accordingly or even do parsing in the PHY package node as we pass
> the OF node of the phy package)
> 
> The PHY package node would be reduced to a simple compatible (and even
> this can be dropped) and a reg.

So why does it need to be described in DT, at this stage? :)

> I feel there is a big chance here to generalize it and prevent any kind
> of mess with all kind of similar/equal code that just do the same thing.
> (and we already have an example with the PHY package API usage with
> every PHY having the same exact pattern for probe/config and nothing
> describing that the PHY are actually a package in DT)
> 
> Hope it all makes sense to you.

