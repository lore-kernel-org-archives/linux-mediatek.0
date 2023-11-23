Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E992CC5AD4C
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Nov 2023 19:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QW6tI0VHpBIjgHCH5Ff0+qLlXVxkpAX7d83oOLeIsRI=; b=IssaIWHPC7HjrYOaUBNJksdAyI
	09RD6rCS1iib/p/Uy4JJNM2ovcqrtZkORLdL39J0bWCr52iBCHU6DRyAwlLeCB9UjxyK3Agzf/XnA
	vi5SO6wyHMkQfWH99MvV8oI1VBRU7bLk5ikxIG6XfkPeJO/fjeLUOhrPop8Vbkkg7OegN+YZvd5t5
	slaYS9Vc61tY5fJFmEXW2qFTVF7uoDg4N7FO608Hl7xTHURBhrnVNZSBbE92tW3Vd36sKW+17ygE9
	evrw3BNns23oRbBHY+ijbfTVMldAdSOX90dXrU51AbwDr+yuH48XeLbtDqQeUvnwJiIWh4aDXPLL6
	GszKjX7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6FUg-005d8s-2i;
	Thu, 23 Nov 2023 19:36:10 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6FUc-005d5O-0p;
	Thu, 23 Nov 2023 19:36:07 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-332ca7f95e1so800067f8f.0;
        Thu, 23 Nov 2023 11:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700768164; x=1701372964; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QW6tI0VHpBIjgHCH5Ff0+qLlXVxkpAX7d83oOLeIsRI=;
        b=Q73nnS6PL3mc4V1Glg++mQcgsv0+WtDvJiMy/53Ih49R4T0vFnDmwx242bv2Kc8rf/
         L7LLuqWLe7sWwbIYDYnO3D/hGekb+6iQYDHofEcSdNtzhvm+2wMjYK5flyKqneJWCBXB
         Ve82gauewvOsUyV6RV3i4jA3PB7l4HyeSX4lqLg21YfIIV18gC8mubZyZQWk2u31jkif
         NdNY5rKawE3hRBhlS4fEtQ3PROX5LEpJrBC16m+N73vUa34TMue/eVOrORww8pMLkIxk
         IL7wJ/o4Rz3Indzr9KyF1m0yW70vgEtGNVSoFcdXLySsuQ5d5CAwjlVW72Ih0X7ZpUOp
         68vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700768164; x=1701372964;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QW6tI0VHpBIjgHCH5Ff0+qLlXVxkpAX7d83oOLeIsRI=;
        b=FPk+8qwUvGwUOpO6xxdSBjZmBab9wRB7l3qkNaJB3AqgU68wpNidQ7qRkm0jPVtyLz
         vHF65wkBIVVP0uoFL+Pr/63PMZ/rPmriGhcU9JCEhhyDJrzGXoIFYsFvYRlZ8xxeFojF
         qkXMpWAggKjKNfHQ1L/9EO7njuVRZXcUmq1ME6pLHO7yneFj7NTYogNRDyO9JGQYGuj/
         HnodpzGfjmThQN0catQkUvUoUNRcth04yQIUaw5xatFUssqvnAeauOpllOSlAjqolnLJ
         touE4Wjerw2/RAEtagl0b+mGZnZU49OgY/DbqYciZ7s97qROmXT4H7xoH3rHXoNAqRkg
         0gjw==
X-Gm-Message-State: AOJu0Yw7S4AhTxUbrWwSmf6RkefhRCEPS633jjYJSvluM9HYJD9NbxLe
	RkXW826EUBG9qyIoG0x/xYk=
X-Google-Smtp-Source: AGHT+IGTnewfVDDU26YNpIgEsAKe25Oi3ZbRjAwSfLwOCZVIekJqTG1IwEOPirisjxnLfXVeZzk89Q==
X-Received: by 2002:a5d:5384:0:b0:332:cc7b:8484 with SMTP id d4-20020a5d5384000000b00332cc7b8484mr377488wrv.48.1700768164315;
        Thu, 23 Nov 2023 11:36:04 -0800 (PST)
Received: from Ansuel-xps. (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.gmail.com with ESMTPSA id e2-20020a5d4e82000000b00323293bd023sm2465891wru.6.2023.11.23.11.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 11:36:04 -0800 (PST)
Message-ID: <655fa9a4.5d0a0220.b01e8.7f5b@mx.google.com>
X-Google-Original-Message-ID: <ZV+poTDVxDA0g9LE@Ansuel-xps.>
Date: Thu, 23 Nov 2023 20:36:01 +0100
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
 <655f2ba9.5d0a0220.294f3.38d8@mx.google.com>
 <6eb2e061-5fcb-434a-ad43-370788075597@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6eb2e061-5fcb-434a-ad43-370788075597@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_113606_311892_712F02E2 
X-CRM114-Status: GOOD (  19.09  )
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

On Thu, Nov 23, 2023 at 04:07:14PM +0100, Andrew Lunn wrote:
> > compatible = "ethernet-phy-package", "qca807x-phy-package";
> > 
> > With "ethernet-phy-package" a must and "qca807x-phy-package" used only
> > if additional property are used.
> > 
> > My current idea was to use select and base everything on the possible
> > PHY compatible (and it does work, tested by adding bloat in the DT
> > example and seeing if the schema was rejected). Had this idea since the
> > compatible would never be used.
> 
> The DT people are unhappy with PHYs don't use compatibles, so
> validation does not work. It probably too late to add compatibles to
> very PHY driver. But this is new development work, we don't have any
> history. So we can add a compatible per package to make the validation
> tools work.
> 
> So for parsing the tree in the kernel we look for
> 'ethernet-phy-package'. For validating the tree using the yaml tools
> we use the 'qca807x-phy-package'.
>

Ok clear, what about the generic ethernet-phy-package.yaml?

Idea was to describe common properties there and then specific PHY
package would add every common property with $ref and add their special
ones on top of that. Would that be ok? (similar to the current
implementation with ethernet-phy-package and qcom,qca807x with the only
difference that qcom,qca807x.yaml would also have the compatible set
(currently missing from this RFC)

-- 
	Ansuel

