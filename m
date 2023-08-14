Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 596AFC001B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Aug 2023 14:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i86f9/Rs574ma35nEC5H2b5rAALRZ5mUOOKcLiJGdDY=; b=V7cJ0lKFc4A5yLx9gJeYMuR25Z
	kVF6sRgyE42ar0gixNVC9hKTy6oXmE3MntoODTjG+tL1M3Qys3+Ewu4VVIzHRrwxLIHKh0hDmdRDg
	V7s4WRevQqaS6q4Ljw5txUBNM6s2Kbboyyd1KVGpZiZvCnImnzqB/kfp/rHJgfo2bB2sDVzpYsmya
	E/RAh/a2+8ExtYRDrdGm/vcwr6XGEnZG5xwjGWXBMuKvkrLgMKqznTHykj9noU2qHEdtTiVYf0y4R
	/VhksMmfcA16jV6bdsWb7pfDbykNB30+Cz6rkmnzh5ZjnLD4cY5mJuQRwoOz6t745LG5P8PEPGVve
	vWBCUSHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVZ0Z-00HOat-0Y;
	Mon, 14 Aug 2023 14:57:27 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVZ0V-00HOYx-0z;
	Mon, 14 Aug 2023 14:57:24 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-99357737980so588667966b.2;
        Mon, 14 Aug 2023 07:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692025042; x=1692629842;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i86f9/Rs574ma35nEC5H2b5rAALRZ5mUOOKcLiJGdDY=;
        b=s1P4uJPHazogidjjEMW8c6pKvEL27pkGy7BCZS1Y+3A+AD7Jmlk0P3VFL95GYJptWd
         TzMUAOCBKgvqNJZfuxH5XZvrZrNoupzka0zhJVIK/6Ap6laPkWapKs0Re2gZ+T940kNB
         IR0rjGWE6Btkx4VEhZby66fQCO/OW99IT2jExsBnO0BLrtjEKVyPfAGlWpoIUJa31rlA
         PRK5sqIiG+OEcx3zFMz0WcXz8KDOIQqhdEeXVhcZjOcV2eyTI66WHM0svUw5ItDbTPiM
         0REtYwjFaLPFk46kd6oqI0tnhi4/MDK2k8ikYT+tl1HgCdag/5skKY3DPbcavIjr3SBL
         S4RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692025042; x=1692629842;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i86f9/Rs574ma35nEC5H2b5rAALRZ5mUOOKcLiJGdDY=;
        b=SNqUGrYQJ3Um1iyQGhEfU7ns8J1PRqTZXMZMPgzhI8yMQBt5Q6FXMZSY1wOP6Pi1WQ
         vXVM8ydC4YCU9Ax3rN7uCBUF14o9c5kJKr+rySsIUTODjqmgBMwvvrk5BNFnpdZA8FKM
         6U5/zzoqUxhHcOVg8xiMdh6V0J31ZNz3fnI3H9efiAj5LRLsRbvGqd4UctjUL/qEGQx0
         /gBMCUM2n0AaX7L+4tWilihtDOx2pTnmQuc3jEHwrBg/RMrEiww01FciuTDCeBOlId0I
         JoPNarkHRFWVqfVmwKgv1OpxBwMi1t/Y1sZwnyoSkmOL/blIR/tU58e4ZEttKsO2s4Jd
         ftIg==
X-Gm-Message-State: AOJu0YygrNF/eb5zhtbtZY4+lPlYCDPfZODEl3vIu33DvA7e8d0JkVXw
	MucnWr99ZkMVgScOmUgxeIM=
X-Google-Smtp-Source: AGHT+IHkDM9PnOsqb5Z+CFy9tRGS3ujo9y9pEj54EY4plE5vgvopuOZgUdWUUpCNzrem/BAGreLqaQ==
X-Received: by 2002:a17:906:2189:b0:99b:e6c3:f6b0 with SMTP id 9-20020a170906218900b0099be6c3f6b0mr6825473eju.62.1692025041796;
        Mon, 14 Aug 2023 07:57:21 -0700 (PDT)
Received: from skbuf ([188.26.184.136])
        by smtp.gmail.com with ESMTPSA id y21-20020a17090668d500b0099cf44adf2csm5701636ejr.46.2023.08.14.07.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 07:57:21 -0700 (PDT)
Date: Mon, 14 Aug 2023 17:57:18 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Woojung Huh <woojung.huh@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/4] dt-bindings: net: dsa: document internal MDIO bus
Message-ID: <20230814145718.g5gpekxus4n3ycah@skbuf>
References: <20230812091708.34665-1-arinc.unal@arinc9.com>
 <20230812091708.34665-3-arinc.unal@arinc9.com>
 <abc44324-454c-4524-b05e-fe989755ea47@arinc9.com>
 <20230812091708.34665-1-arinc.unal@arinc9.com>
 <20230812091708.34665-3-arinc.unal@arinc9.com>
 <abc44324-454c-4524-b05e-fe989755ea47@arinc9.com>
 <47b61929-5c2d-4906-b153-2046a94858c8@arinc9.com>
 <47b61929-5c2d-4906-b153-2046a94858c8@arinc9.com>
 <20230813112026.ohsx6srbt2staxma@skbuf>
 <8a8e14f1-0493-4298-a2cc-6e7ae7929334@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8a8e14f1-0493-4298-a2cc-6e7ae7929334@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_075723_341641_704E874D 
X-CRM114-Status: GOOD (  10.57  )
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

On Sun, Aug 13, 2023 at 03:59:11PM +0300, Arınç ÜNAL wrote:
> Adding the mdio property to the dsa.yaml schema will allow it on all of the
> schemas that refer to dsa.yaml such as this one. This addition here is only
> to disallow additional properties under the mdio property for this specific
> schema.

So, how about not adding it to dsa.yaml, but to individual switch schemas,
along with their specific handling of phylink bindings on user ports?

