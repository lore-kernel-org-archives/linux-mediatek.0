Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 580B5C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Nov 2023 13:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fVoXranZuhbJagmViZ0Bh2J7LLpRAZVBS/w9Sa8ohYo=; b=N5pC8xBML4Kx1OXDRA6HouEs+f
	sAgfhPnpxSUUbophD86N9euDaRx2zN8wKQzr2q9omyR6ek8Nm6iDxJKIx5WDq0byl0h8r7oG86IGm
	nLSNEw/CQtLGe4g3Wz5IDZaSY3I8Bmc+/zSBEAzXMZhz7jvTehIZtCs/My7PwvPYcThna1Tsgfhwj
	FNc8EYy161iVUbrNRAp3yx/iB/JNkEQ92iO2uxdP8tXqm4vXT5/TbEQFU5nWJSTIragSoMV/gSVWv
	M9hdloa8qZFwAz/9bUVFIITywxr3MqabFumEleRY2e57BCE6Un5bnSAqAB8itVYxJ3CQfQyPSR1h1
	gGjnM+5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2tiV-00G4ny-0T;
	Tue, 14 Nov 2023 13:44:35 +0000
Received: from mail-oi1-f173.google.com ([209.85.167.173])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2tiR-00G4ma-1v;
	Tue, 14 Nov 2023 13:44:33 +0000
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3b2f2b9a176so3671768b6e.0;
        Tue, 14 Nov 2023 05:44:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699969469; x=1700574269;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fVoXranZuhbJagmViZ0Bh2J7LLpRAZVBS/w9Sa8ohYo=;
        b=v8/PY3sGt2X9Nv2Bjpid55177DtOO7C/dZtqZb4PXJOnvxQcfpUEWjDO3XSbFTVshV
         vksoQIBQEm/UQIt+gMCHIEchRgK2nC8pEwd1zNY/dAIjtFt3s15KZwi5MKEyXaFQVBgJ
         7pO5FKzpXAOzd2LQY0NrWWAvehMzSa3BFuGSD4hqbCld7BegswsD52gR1B/ip1/z+KsP
         kWrpGqZYWfdZmH8YVQEaw6/VjXHq/V71fMLZPUZOZd9ubLc7BfshvrdV7Ctp6qbQP44M
         fVmIjpImExqFK7PR55mG6/hTfbpPUMvaZIHn0txWBzGwbccnfr7b0It8eqykNJN47+VM
         rh5w==
X-Gm-Message-State: AOJu0Yz8MyC+tTaRGJNMQmO2MORYWL4X/2C6J1m4PN3fFL8Ty2JREDYE
	N3HwOdFWvStlG8uUibosgQ==
X-Google-Smtp-Source: AGHT+IEa2yiGK/vrgIGrYDQftkP/r/QgCl5oWffc3V6kN1weHVqSkoufro4lODlc4XqFTDIWhqoefQ==
X-Received: by 2002:aca:f07:0:b0:3b6:cc01:aba2 with SMTP id 7-20020aca0f07000000b003b6cc01aba2mr10713866oip.55.1699969469146;
        Tue, 14 Nov 2023 05:44:29 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id k13-20020a54440d000000b003ac9e775706sm1115062oiw.1.2023.11.14.05.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 05:44:28 -0800 (PST)
Received: (nullmailer pid 1651909 invoked by uid 1000);
	Tue, 14 Nov 2023 13:44:27 -0000
Date: Tue, 14 Nov 2023 07:44:27 -0600
From: Rob Herring <robh@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>, 
	Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Alexander Couzens <lynxis@fe80.eu>, Philipp Zabel <p.zabel@pengutronix.de>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-phy@lists.infradead.org
Subject: Re: [RFC PATCH 1/8] dt-bindings: phy: mediatek,xfi-pextp: add new
 bindings
Message-ID: <20231114134427.GB1645963-robh@kernel.org>
References: <cover.1699565880.git.daniel@makrotopia.org>
 <924c2c6316e6d51a17423eded3a2c5c5bbf349d2.1699565880.git.daniel@makrotopia.org>
 <797ea94b-9c26-43a2-85d7-633990ed8c57@lunn.ch>
 <ZU1nBgdspMtsI5aS@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZU1nBgdspMtsI5aS@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_054431_632368_E4F9D64E 
X-CRM114-Status: GOOD (  20.96  )
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

On Thu, Nov 09, 2023 at 11:11:02PM +0000, Daniel Golle wrote:
> Hi Andrew,
> 
> On Thu, Nov 09, 2023 at 10:55:55PM +0100, Andrew Lunn wrote:
> > > +  mediatek,usxgmii-performance-errata:
> > > +    $ref: /schemas/types.yaml#/definitions/flag
> > > +    description:
> > > +      USXGMII0 on MT7988 suffers from a performance problem in 10GBase-R
> > > +      mode which needs a work-around in the driver. The work-around is
> > > +      enabled using this flag.
> > 
> > Is there more details about this? I'm just wondering if this should be
> > based on the compatible, rather than a bool property.
> 
> The vendor sources where this is coming from are here:
> 
> https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/+/a500d94cd47e279015ce22947e1ce396a7516598%5E%21/#F0
> 
> And I'm afraid this is as much detail as it gets. And yes, we could
> also base this on the compatible and just have two different ones for
> the two PEXTP instances found in MT7988.
> Let me know your conclusion in that regard.

I'd go with a property in this case unless you think there may be other 
per instance differences.

Rob

