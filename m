Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA0E8ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 15:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tW80ioERjs8HL0K2G02PeQt4G+hoDIT7HdwegIsyDlg=; b=3/gpy6kABDpQayUSdSKEHvC0Fw
	q5mLiU+vWohQDCEkrkOfHZfC+oWSPAwUBY7feedL00uHcvHVpfdSZgiD5ErVEPRXFpet3rHB8lq7S
	XCxoMErJMw2KowZq1NCZFJzTUX5zHJPR2gX1rYvvi7Gw7DOhr6CbN7WbVA5O1NM5SBuzLTr1jGxTy
	8zrvFGAr0W2Pz1fY960Fw9nr2Cbjb5RuzHCzoOSIWcHLF4oCfL6DFmJfYDwWutzq52XXyVZOKiz2B
	cIk5iKwIuvipblxGQXwOH8zkpOMHMLeb4VxGsK/fKOMPhVfadMY7x97ua4VcyHmxxw8qcWp+6spP8
	KcUnd3Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYTzC-003I9m-9A; Wed, 14 Sep 2022 15:07:34 +0000
Received: from mail-oa1-f48.google.com ([209.85.160.48])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYTyt-003HVD-M7; Wed, 14 Sep 2022 15:07:16 +0000
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-12b542cb1d3so32001371fac.13;
        Wed, 14 Sep 2022 08:07:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=tW80ioERjs8HL0K2G02PeQt4G+hoDIT7HdwegIsyDlg=;
        b=gwOjIzGJ6iO7m3kwNj2c5z4Gt4C7GAPY5EknMzUrjOsNVE6tLPQXeNzxDdsi59ZnLp
         ZoG3YK3QmSifqVcgwfhk/PJwyKLutMSSOkDtsWaeS3VRDz5VdL9fJEJRc5o/JmO1sMir
         tE1nY3avJ5kxxVC9izVFjTygYJY4gYdCopEsEe5HBdzPFS7MO66bXj2YW5GsblPvEn/8
         4tdOsbBwOrztd0Cj+FHH6JIl0sNXDIi8jWKCgVtc/7JARBm5Px3L085dujcifrXPSdE+
         SQS8CnjFUHJ9QJk43ZPpilC0WH+LADJnAJSPTQBKJHEQzbpgzp+dAtCFdJ3v/sq0me9h
         ly7Q==
X-Gm-Message-State: ACgBeo1Ub04G6lZDrUnCJssv6dTIkU2lXrwf1KYWnTm5r+xfycQXPdjh
	xUVbErcw6unzdC5xnmVf0w==
X-Google-Smtp-Source: AA6agR6nHjlVpJ4ODROLhE1cOSEVGf/++cY8d55HrUHcYhHLiNPEEebU50Ldgv8bEVLNMWBj0bV6cA==
X-Received: by 2002:a05:6808:120f:b0:349:f62:5c04 with SMTP id a15-20020a056808120f00b003490f625c04mr2143683oil.100.1663168034307;
        Wed, 14 Sep 2022 08:07:14 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id u22-20020a056871009600b0012b342d1125sm7789250oaa.13.2022.09.14.08.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 08:07:13 -0700 (PDT)
Received: (nullmailer pid 2227891 invoked by uid 1000);
	Wed, 14 Sep 2022 15:07:12 -0000
Date: Wed, 14 Sep 2022 10:07:12 -0500
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: "David S . Miller" <davem@davemloft.net>, Sungbo Eo <mans0n@gorani.run>, Eric Dumazet <edumazet@google.com>, Vladimir Oltean <olteanv@gmail.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, netdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, DENG Qingfang <dqfext@gmail.com>, Vivien Didelot <vivien.didelot@gmail.com>, Paolo Abeni <pabeni@redhat.com>, erkin.bozoglu@xeront.com, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, linux-arm-kernel@lists.infradead.org, Florian Fainelli <f.fainelli@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jakub Kicinski <kuba@kernel.org>, Sean Wang <sean.wang@mediatek.com>, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 02/10] dt-bindings: net: dsa: mediatek,mt7530: change
 mt7530 switch address
Message-ID: <20220914150712.GA2227774-robh@kernel.org>
References: <20220914085451.11723-1-arinc.unal@arinc9.com>
 <20220914085451.11723-3-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220914085451.11723-3-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_080715_765557_D9746233 
X-CRM114-Status: GOOD (  12.12  )
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

On Wed, 14 Sep 2022 11:54:43 +0300, Arınç ÜNAL wrote:
> In the case of muxing phy0 of the MT7530 switch, the switch and the phy
> will have the same address on the mdio bus, 0. This causes the ethernet
> driver to fail since devices on the mdio bus cannot share an address.
> 
> Any address can be used for the switch, therefore, change the switch
> address to 0x1f.
> 
> Suggested-by: Sungbo Eo <mans0n@gorani.run>
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  .../bindings/net/dsa/mediatek,mt7530.yaml     | 24 +++++++++----------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

