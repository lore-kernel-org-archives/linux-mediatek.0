Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 286F4C001E0
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Aug 2023 19:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eAwbHbILPSNT/2mlrQnn5cannBZhfjKxo5aPZMBdKAE=; b=qsdlAYvNsClXRbDGQ2Jcq9Argd
	l7fznndOfGKlb4bWaJjhJB6C0hrXQ+tug6tAvolg6EkedoqXffkGDcZRz90Gh19lyKkWxqoH5bt39
	e6flisRZo6MOyGsecCblSAZwPndh/DkgMO5bt3vXwv4sZ7U/1ZjtrfQsvMHGnJlO9iJhLrakkrFWT
	VSfFH9vmEeVczFeOpy7vl3q7x9MnlNKjit6iI6XlrpVMsnkdIhXIaK029gxMkeuMV1ttkCV5/9Y3U
	gVzaf+onW34xCFEtLPv9d1ofmN0Ok9n0QFU6rILrfBocg+L5SZQM4szFxNjFMI542QfGehi5YzlwW
	D+e4yXPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVGLp-00Fafi-0K;
	Sun, 13 Aug 2023 19:02:09 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVGLl-00Fae9-2g;
	Sun, 13 Aug 2023 19:02:07 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4fe98583a6fso3218740e87.3;
        Sun, 13 Aug 2023 12:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691953321; x=1692558121;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eAwbHbILPSNT/2mlrQnn5cannBZhfjKxo5aPZMBdKAE=;
        b=jAZJr/3NoDQONt2xvNzsU6qPcVuX5l/p9UTVsLZpGk093yd/wbf5zOOaVM5QD6XUfs
         aY1KUH/fl983RT6507UIuZ1tEMgJfmtUaYWji0SQh8QO4QAy/Be6brwzJTy+PcgOUGlA
         7dR6B50qri4QLRuqR1z5zhHv1kcFTiW5Wvh3MspSbPQlgP5W7P86TIZTd6dfFlgzTlaI
         TZVrLkYTeQVwCn1ZQvnu+viTAWqGFoo4tp0xrLqVfjOIh3ldjjAzjqN6PlQtvhiwM54p
         TIQHYCWJqzuKjAZzDr+j8eaoSZNRCh84iDkTA04UEqkw32SsgbaVaQCdwbJ7k0PqzOkQ
         O3FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691953321; x=1692558121;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eAwbHbILPSNT/2mlrQnn5cannBZhfjKxo5aPZMBdKAE=;
        b=CUpSWe+GpT6uV9rZB/B8+n2yVKD6P4673uBY/vE3VkF4dm39b6yXuL7ZnCY2Glb0/R
         jJOO8L0NlD0vx3A1GiLC96QIz3Lk5/PZr+OGdPfdmKg3UXI8cTXrP51tcrrmnpoKN/eu
         Y1s2gnO3/I2v5Zza+/OiNgp/3tc2Q5m/eEDqZnHnPPnyQSf3HaVuOSdsA292jGfcJzoz
         vFfsHDeLTi/4VCR/4Hm3LMC1qT6v7BHILAT58f8J561B4KwircpBCe5xG4pZoujjqmnw
         u/vMHjzM4xS7C3YjO4toQpGSeCwme/V/kE/0EIuwxWxUGpK7TvTuVlU8aFw1F0LbKQm5
         y+Cw==
X-Gm-Message-State: AOJu0YwjEHADuD8l1/73Ylr+RNv5z4IcaU139q5aIsh73lZklWw4QT/W
	1Bp6olzrd6zo+/pixzex2eM=
X-Google-Smtp-Source: AGHT+IH0tZP2NKa8iempFVNWwuPn/Zj0V4Lwwpztwz+DiHEX09WEj5U+n3GtijIqy7/Xt4oAo7n+4g==
X-Received: by 2002:a19:2d41:0:b0:4fd:f7e7:24fd with SMTP id t1-20020a192d41000000b004fdf7e724fdmr4028807lft.64.1691953321027;
        Sun, 13 Aug 2023 12:02:01 -0700 (PDT)
Received: from skbuf ([188.27.184.148])
        by smtp.gmail.com with ESMTPSA id p19-20020aa7cc93000000b005230f52195esm4724858edt.44.2023.08.13.12.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 12:02:00 -0700 (PDT)
Date: Sun, 13 Aug 2023 22:01:57 +0300
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
Message-ID: <20230813190157.4y3zoro53qsz43pe@skbuf>
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
X-CRM114-CacheID: sfid-20230813_120205_953596_27DDC21E 
X-CRM114-Status: GOOD (  15.26  )
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
> > sja1105 does not support an "mdio" child property. I haven't checked the
> > others. Don't add properties that aren't supported.
> 
> Adding the mdio property to the dsa.yaml schema will allow it on all of the
> schemas that refer to dsa.yaml such as this one. This addition here is only
> to disallow additional properties under the mdio property for this specific
> schema.
> 
> That said, my understanding is that the internal MDIO bus exists on all of
> the switches controlled by DSA.

How come?

> Whether each individual DSA subdriver supports registering it does not
> matter in terms of documenting the internal MDIO bus for all DSA
> switches.
> 
> SJA1110 uses the mdios property instead because it's got two internal mdio
> buses, which is why I invalidate the mdio property for it. If SJA1105 has
> also got two internal mdio buses, let me know.

SJA1105 has zero internal MDIO buses and zero internal PHYs.

