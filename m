Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29612C636CB
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Nov 2023 19:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DKrRg2snxExqJdFGigUYh7T7Fc6aEzueP8JRF0HCrTo=; b=bx3mfFUi/4mcIXbmmM20r6Gq8r
	YgzRyCENcR+49siDgX535pc2UQLkOUUcIOzbT9ZaEquRm+yXjQB9c4zJUWqHqG/ckkp8s9Gh/0DAR
	aNxgQcAHyUFi+YBy0jrs9axCztTdgQfmx3ACfPA2SZHK69qqVPT06DGUsUIb6G7hqVk0MeA4onnyY
	/Ng14e4snv9tuFGs5dCiU7sj73dL7EbFBMEyO8r4AoOrsnbP+OdDPvI5mvY3ZrUKaUsCC9wFitdZS
	DpRnn6sPAm4rgVIRUlrZbvc8dw/+q9ewXwsb//Tifi3mQSklTreEz4A1LBpY5XAeqdYiDPbyZFAK0
	oB6FIrxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6c2O-007xhL-2o;
	Fri, 24 Nov 2023 19:40:28 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6c2L-007xfY-0V;
	Fri, 24 Nov 2023 19:40:26 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-54a945861c6so3210963a12.3;
        Fri, 24 Nov 2023 11:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700854820; x=1701459620; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DKrRg2snxExqJdFGigUYh7T7Fc6aEzueP8JRF0HCrTo=;
        b=Fq48iP4c8eNk/hi1hqQl2UxiRVe29jjaaDLkiUWxixxYWc2Td9zlNxxszYk0M1XULu
         h2oATkTjNjBXx+is3jB27Uev4A6ltMmZTecuwniwbTOrgaV6Gs3BxIgwMhhYwIhxAqrS
         jGPJhbkkZEawyqHjiKeqfDqTMfMyiIghdp3XktDx2uRGI/BJZI4209uB8xBJ73cQWmCh
         sJBxi7hCINvMoBiLbyDDYS/WdxzkFqpyA6u3IxphSWUCV4WmO0IPYFxFgypPGNvaEI9T
         CiIcnW6XRMogXrtICl3fXVIyIquQ3W8+yUaZkRwZIr221F0vYX9NERTdg96rEwVhn4qA
         2ghA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700854820; x=1701459620;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DKrRg2snxExqJdFGigUYh7T7Fc6aEzueP8JRF0HCrTo=;
        b=Tix9Ds1Puh/XRY/b3WDixxqU/Z7bmKzO1RU/xLc2wuuZMOxdOyIUD1DmxLqagfSCU6
         TZB86vgEvBMSokdB/WBrAD79sltoTFE9QR5wbqZamNoX7BCGT2GFS5FDXkZ7pwBGl5il
         UxRLMP5G6Iw0wFq314pKOeZw3bSPYJ2ibvYCb9nNRn8VyOTJzgpWpT9WGHaFbmLpoYJb
         mmu/Id87NWdLDTIjqXqgdGqaGUeJvYZ5kVK7fZ+gwQVm0Funojqo180vucXj867R55FF
         1zAOcWGIk2RvCf2E8SupBN3k0dpWgKhNj+rGXJwA9D2p9KCizRV2kJ3EZsKnuBhlb+UL
         GpaA==
X-Gm-Message-State: AOJu0YzX7cxqJ7r4Tf8NXoCINf+11QXryoBY2bsKjR3+rfe3+EK6bqQD
	KyDFXuMT7qoPX3VZrE3xkN0=
X-Google-Smtp-Source: AGHT+IGItN29AlffdfAFP+pdBb+pUmXR0qRXvVcejscZr6unZPC/VQI53oWhDMvt4V3MPYz/KIrdxQ==
X-Received: by 2002:a17:906:f1d4:b0:9fb:f99c:3ea with SMTP id gx20-20020a170906f1d400b009fbf99c03eamr2802823ejb.52.1700854819659;
        Fri, 24 Nov 2023 11:40:19 -0800 (PST)
Received: from skbuf ([188.26.185.12])
        by smtp.gmail.com with ESMTPSA id h25-20020a170906111900b00a0435148ed7sm2464856eja.17.2023.11.24.11.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 11:40:19 -0800 (PST)
Date: Fri, 24 Nov 2023 21:40:16 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Christian Marangi <ansuelsmth@gmail.com>, Rob Herring <robh@kernel.org>,
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
Message-ID: <20231124194016.tcmu4w2r7jrnv6mo@skbuf>
References: <20231120135041.15259-1-ansuelsmth@gmail.com>
 <20231120135041.15259-4-ansuelsmth@gmail.com>
 <c21ff90d-6e05-4afc-b39c-2c71d8976826@lunn.ch>
 <20231121144244.GA1682395-robh@kernel.org>
 <a85d6d0a-1fc9-4c8e-9f91-5054ca902cd1@lunn.ch>
 <655e4939.5d0a0220.d9a9e.0491@mx.google.com>
 <20231124165923.p2iozsrnwlogjzua@skbuf>
 <b8981dc4-5db0-4418-b47d-3e763e20beac@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8981dc4-5db0-4418-b47d-3e763e20beac@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_114025_197795_CC8AD08C 
X-CRM114-Status: GOOD (  29.15  )
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

On Fri, Nov 24, 2023 at 07:35:35PM +0100, Andrew Lunn wrote:
> > I think you are hitting some of the same points I have hit with DSA.
> > The PHY package could be considered an SoC with lots of peripherals on
> > it, for which you'd want separate drivers.
> 
> At least at the moment, this is not true. The package does just
> contain PHYs. But it also has some properties which are shared across
> those PHYs, e.g. reset. 
> 
> What you describe might become true in the future. e.g. The LED/GPIO
> controller is currently part of the PHY, and each PHY has its own. I
> could however imagine that becomes a block of its own, outside of the
> PHY address space, and maybe it might want its own class LED
> driver. Some PHYs have temperature sensors, which could be a package
> sensor, so could in theory be an individual hwmon driver. However,
> i've not yet seen such a package.
> 
> Do we consider this now? At the moment i don't see an MFD style system
> is required. We could crystal ball gaze and come up with some
> requirements, but i would prefer to have some real devices and
> datasheets. Without them, we will get the requirements wrong.
> 
> I also think we are not that far away from it, in terms of DT, if you
> consider the later comments. I suggested we need a phy package
> specific compatible. At the moment, it will be ignored by the kernel,
> the kernel does not need it, it probes the PHYs in the current way,
> using the ID registers. But it could in future be used to probe a real
> driver, which could be an MFD style driver. We need to see updated DT
> binding examples, but i don't see why we cannot slot it in at a later
> date.

I'm not suggesting to go for MFD right away. Just with a structure that
is extensible to possibly cover that. For now, a package node with a
Qualcomm compatible, with the most minimal driver that forwards MDIO
access to PHY children.

I can't speak for the future of PHY drivers, since I don't know enough
about PHYs. I'm just coming from the DSA background where I really wish
we had this sort of infrastructure earlier. Now I have the SJA1110 which
still lacks support for the interrupt controller for its integrated
PHYs, and a bunch of other IP blocks in the package, because it's so
incredibly hard to make the driver support the old-style and the
new-style device trees.

