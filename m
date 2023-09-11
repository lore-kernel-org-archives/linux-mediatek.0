Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35684CA0EC6
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 22:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XWTcwow2et7upqcwf54DyK1wVNFfm6M3zpWLMMZDCl4=; b=Wx7iHdg9szz6pouMgDRcz4/c5R
	JLRc78qRZ7iyysqHV1D04z0h3TfTRDbCvWig93Jte0Tbvm4skYb1P6zJeI0RRQo/BJVPCL9qp94ae
	Cufazumkq211fMdrRXtoSzZ3Usy0LF1WRdQkSloDv9xJw06MtrljJ8tY1xe80Zyi1QbkjbCQpUqYu
	oIxPGwehsBPUskzvMhINrTbF2WH5KqeLB/tGSsbbAheZn/+zD2Vf0WJ+Uc/QPFyxsxi4oMW2cBJvX
	2Dhsx5NWWuPRh+NqSvRY5vo4u4ktHgNXiUqn3cookUefBOjhh5Rl4/adf/S7yvCZxE8hMHJtOI/tj
	02ykPDFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfpku-001Xfa-0y;
	Mon, 11 Sep 2023 22:51:44 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfpkp-001Xef-2U;
	Mon, 11 Sep 2023 22:51:42 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-9ad810be221so29173966b.2;
        Mon, 11 Sep 2023 15:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694472690; x=1695077490; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XWTcwow2et7upqcwf54DyK1wVNFfm6M3zpWLMMZDCl4=;
        b=fNzvrWeCMOIxKkM9xpJZWTlIvlcJ5GK3wsTEAf1PoWU00rXo4YazSKfDtJLU4qeZV/
         oPgli62+KslXNxa++CAqHtYhkktl8hwTUXhETxFKUlat0liEo6hoKVgrSf/x0Fg+VHCG
         Xeha5VwH8SzB+odj0PzbktWJ/R1DlXyc14lrAVi76ru5Xv/yil98mSpue9el9A0I/aad
         izKGIsA5a88DnnW0hNCqXfT2479er18Gnh5SBHnY6nDUdIkdkY1sZDBTifONgAq1GLCZ
         josSIxko6Fg8gX/FSnuhrfiPiVfDow88w2bIbRgobTaKyMWtGW5QGN2jH7wfubHZGnTq
         Gi5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694472690; x=1695077490;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XWTcwow2et7upqcwf54DyK1wVNFfm6M3zpWLMMZDCl4=;
        b=APeADctDTb9DAxsTbvntI1A9zx60XbEhktiUaBwBY7RywzPa8ccJfHRx8YATKrkIOF
         uRrwRRD0yOWJTuCLUtmGBdk5Wq4kHoFhoo/kdsC54+MmKOKn0Ki7g721zDstHxy/NcGe
         B8TsN8IIQZdpIPiG7k/q70dld5UKJ6F2uHbIVSksVsWLNlbCxohrct8ZmCfxuOKxUMzq
         E3jcRmGIZNYwEE48k8tb9L7gnjybZd+0HDWP6xKPuLfWWSECILyrgUxkbbk3Ula9pCuG
         Ez1FmPrq5RYRTFVMSqw4PUQew4hPI5kzmIPhei1w7Dq4WHz0Xl64nk6EjRQNd2SKgcJ1
         KVDQ==
X-Gm-Message-State: AOJu0YzF0hJJG4tNUMsZD403OkkKTC0xtwIgvQjP9yVOLAOi58vBxTKt
	MYr97l3DMIYsg/HB0NVu5gs=
X-Google-Smtp-Source: AGHT+IG4neBUt+ie4pzDoZiQeWUSKTNp1+XgRuVaZj4s2RJQC3CdsSSnlnDEU6xXFuAqvt2am5jxOw==
X-Received: by 2002:a17:906:30da:b0:99d:fc31:242f with SMTP id b26-20020a17090630da00b0099dfc31242fmr9012606ejb.66.1694472689910;
        Mon, 11 Sep 2023 15:51:29 -0700 (PDT)
Received: from skbuf ([188.26.56.202])
        by smtp.gmail.com with ESMTPSA id dx22-20020a170906a85600b0099d959f9536sm6023945ejb.12.2023.09.11.15.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 15:51:29 -0700 (PDT)
Date: Tue, 12 Sep 2023 01:51:26 +0300
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
Message-ID: <20230911225126.rk23g3u3bzo3agby@skbuf>
References: <47b61929-5c2d-4906-b153-2046a94858c8@arinc9.com>
 <20230813112026.ohsx6srbt2staxma@skbuf>
 <8a8e14f1-0493-4298-a2cc-6e7ae7929334@arinc9.com>
 <20230813190157.4y3zoro53qsz43pe@skbuf>
 <f5f468c1-b5a2-4336-b1d9-fd82da95b21d@arinc9.com>
 <20230814143601.mnpxtcm2zybnbvoh@skbuf>
 <0cee0928-74c9-4048-8cd8-70bfbfafd9b2@arinc9.com>
 <20230827121235.zog4c3ehu2cyd3jy@skbuf>
 <676d1a2b-6ffa-4aff-8bed-a749c373f5b3@arinc9.com>
 <87325ce9-595a-4dda-a6a1-b5927d25719b@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87325ce9-595a-4dda-a6a1-b5927d25719b@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_155139_837585_58B5EDA1 
X-CRM114-Status: GOOD (  15.22  )
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

On Sat, Sep 09, 2023 at 11:53:50AM +0300, Arınç ÜNAL wrote:
> What to do:
> - For mscc,vsc7514-switch, enforce phylink bindings for ports.
> - For mscc,vsc7512-switch, enforce phylink bindings for user ports.

you can also look at dsa_switches_apply_workarounds[], and if the switch
isn't there, then you can replace "user ports" with "ports" here and
everywhere.

> - renesas,rzn1-a5psw.yaml
>   - renesas,r9a06g032-a5psw, renesas,rzn1-a5psw
> 
> What to do:
> - Document "mdio".

Not clear here and for all the schemas quoted below.. is "mdio" not documented already?

> - realtek.yaml
>   - realtek,rtl8365mb
>   - realtek,rtl8366rb
> 
> drivers/net/dsa/realtek/realtek-mdio.c:
> - The DSA subdriver lets the DSA driver register the bus.
> 
> What to do:
> - Document "mdio".
>   - Require "mdio". (Can't do because it's not required for MDIO controlled
>     switches that share the compatible string with SMI controlled switches.
>     This is why I would like Luiz to unify the bus registeration process.)
> - Document compatible string "realtek,smi-mdio" on "mdio" child node.
>   - Require compatible. (Can't do because the same as above.)
> - Enforce phylink bindings for user ports. (Can't do because the same as
>   above.)
>   - Enforce phylink bindings for user ports if "mdio" is defined.
> 
> ---
> 
> - qca8k.yaml
>   - qca,qca8327
>   - qca,qca8328
>   - qca,qca8334
>   - qca,qca8337
> 
> drivers/net/dsa/qca/qca8k-8xxx.c:
> - The DSA subdriver won't let the DSA driver register the bus.
>   - No ds->ops->phy_read() or ds->ops->phy_write().
> - Registers the bus non-OF-based or OF-based. Registers OF-based if "mdio"
>   child node is defined.
>   - mdio = of_get_child_by_name(priv->dev->of_node, "mdio");
> 
> What to do:
> - Document "mdio".
> - Enforce phylink bindings for user ports if "mdio" is defined.
> 
> ---
> 
> - nxp,sja1105.yaml
>   - nxp,sja1105e
>   - nxp,sja1105t
>   - nxp,sja1105p
>   - nxp,sja1105q
>   - nxp,sja1105r
>   - nxp,sja1105s
>   - nxp,sja1110a
>   - nxp,sja1110b
>   - nxp,sja1110c
>   - nxp,sja1110d
> 
> What to do:
> - Document "mdios".
>   - Document child node pattern property under "mdios".
>     - Document "nxp,sja1110-base-tx-mdio" and "nxp,sja1110-base-t1-mdio"
>       compatible strings.
> ---
> 
> - microchip,lan937x.yaml
>   - microchip,lan9370
>   - microchip,lan9371
>   - microchip,lan9372
>   - microchip,lan9373
>   - microchip,lan9374
> - microchip,ksz.yaml
>   - microchip,ksz8765
>   - microchip,ksz8794
>   - microchip,ksz8795
>   - microchip,ksz8863
>   - microchip,ksz8873
>   - microchip,ksz9477
>   - microchip,ksz9897
>   - microchip,ksz9896
>   - microchip,ksz9567
>   - microchip,ksz8565
>   - microchip,ksz9893
>   - microchip,ksz9563
>   - microchip,ksz8563
> 
> What to do:
> - Document "mdio".

