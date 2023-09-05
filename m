Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE026C83F2C
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Sep 2023 02:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nt6ay0ilUmrNIrakmOthvuLnYKcSlh/71zqVmBj/MNI=; b=VbB4VfjWbvCLocPoMukFTuVzg1
	JtwcTr2PIYbxpDL3OCDKr6mwECJLdn8mfmhQ7wAgNJng27aP7fZKQwz9BnPvIw7Pnb7r0OKkCGVqb
	sTtakw7E8+GqevW9CsdCndxVusX5Jc1Z2ApAO3/j2sZvhC1rxXfc+2OfZV/SQTIxI3feUq3y7qmRc
	X3dVaKL+mDlKFBroLkngCR0O+BsiyDo5qufFzm9CyqWOKRZ86H6kVzCUV2Zm7qDJQDgNWHVp3hj3X
	0+zSRzaV6pZnBKAp0mr7l/dTCe/gL48OcXGDBTMgtKOfMloOvcgpKo4/8jtUi/Jtqgn3UAYT6YPxm
	djtEESFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdM1Y-0056tn-1j;
	Tue, 05 Sep 2023 02:42:40 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdM1T-0056sV-39;
	Tue, 05 Sep 2023 02:42:37 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2bcd7a207f7so29922321fa.3;
        Mon, 04 Sep 2023 19:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693881751; x=1694486551; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Nt6ay0ilUmrNIrakmOthvuLnYKcSlh/71zqVmBj/MNI=;
        b=MQZZn4ugJgNJEpkub8d52NSaT1k3b16hqt0for0abLkaBcKnLKV2YIoO7OmwxNWbff
         fkbu/NTe5nlxXdk95ndRx1EUBYCw0CgXmY3+8X0OM1x75R2fkE7GnjGp7o/MpjjrOt8R
         Hgz6xjlVrJJT4az7EnYFzkWuJfyOPNSnrCJ5f1nrAEujI9jv8hsMkwQSPxHrlWhXjdhA
         TdHlxRg0tTne08cT2KGKb6zdUHdWH6htNbZheNc2Mtwh1wS3nlwv9oJTyxi/wDiYBNMp
         /CtNFPfjDfxHIqTeXqL8vNjG2BkGBmgkPaKp0oFxoGZ+tpaPjJNVoGy+DqNrSDsn/6bG
         izwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693881751; x=1694486551;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nt6ay0ilUmrNIrakmOthvuLnYKcSlh/71zqVmBj/MNI=;
        b=ZmAFpBiWjHwxkQG2jRvil47LiyJ4PFRNzMV1tTi093eTLvUcZYgqiWKq0ZVu2urXPo
         a/aIAyVLEHmGSuhCuAyaN1wP8dHHjCsB2LiZlr0wKx7aH2WCcEXngHQnMWrE3HygAXAa
         LzFIUB5sKOL9qc+Mp/BBiVZdlJ8lEt1jxgV6yZlxRHLieOU6qqdLAOYyr3FaodkZJcbO
         6IFLS+/XpqvLImggBz69C0KA0moC0o0HCI31iOAZMp5CC0+4uzSK9Xhf3bMK7JCocCc0
         AIOQqU9FW+wBGq3OKeD1bup9fTwFp/GN3C7g6A1EyDDJ5VLGy8lq4qSPTR5ZeOaxZGi9
         bgjQ==
X-Gm-Message-State: AOJu0Ywa9/JpGK72B1QYHqsMLPjV22WMRed54EBy/nq8dDaBFXEwfmsP
	W0juo44nd0CRXqkxYYTlawniBRt96lVQclMAo5Y=
X-Google-Smtp-Source: AGHT+IGDYEM/D+VjDs53lbJVDTyoT0Bkv7iXApFmItzvgobWbxVZW0eXbIPiwJUhubc08jbCg8gVCb4oxy8r4PLOtqU=
X-Received: by 2002:a2e:980a:0:b0:2bd:1ea9:f0fc with SMTP id
 a10-20020a2e980a000000b002bd1ea9f0fcmr8939737ljj.21.1693881751359; Mon, 04
 Sep 2023 19:42:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230812091708.34665-3-arinc.unal@arinc9.com> <abc44324-454c-4524-b05e-fe989755ea47@arinc9.com>
 <47b61929-5c2d-4906-b153-2046a94858c8@arinc9.com> <20230813112026.ohsx6srbt2staxma@skbuf>
 <8a8e14f1-0493-4298-a2cc-6e7ae7929334@arinc9.com> <20230813190157.4y3zoro53qsz43pe@skbuf>
 <f5f468c1-b5a2-4336-b1d9-fd82da95b21d@arinc9.com> <20230814143601.mnpxtcm2zybnbvoh@skbuf>
 <0cee0928-74c9-4048-8cd8-70bfbfafd9b2@arinc9.com> <20230827121235.zog4c3ehu2cyd3jy@skbuf>
 <676d1a2b-6ffa-4aff-8bed-a749c373f5b3@arinc9.com>
In-Reply-To: <676d1a2b-6ffa-4aff-8bed-a749c373f5b3@arinc9.com>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Mon, 4 Sep 2023 23:42:19 -0300
Message-ID: <CAJq09z6eghuHY+b2y-kGmjKnLiEEOABXGKhjnB-PxJ=-GtYD4w@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: net: dsa: document internal MDIO bus
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Vladimir Oltean <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com, 
	Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>, 
	Daniel Golle <daniel@makrotopia.org>, Landen Chao <Landen.Chao@mediatek.com>, 
	DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, mithat.guner@xeront.com, 
	erkin.bozoglu@xeront.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_194236_018338_50DED64C 
X-CRM114-Status: GOOD (  18.25  )
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

> > [1] ...this. The SMI-controlled and MDIO-controlled Realtek switches are
> > otherwise the same, right? So why would they have different dt-bindings?
>
> Honestly, I'm wondering the answer to this as well. For some reason, when
> probing the SMI controlled Realtek switches, instead of just letting
> dsa_switch_setup() populate ds->slave_mii_bus, on realtek_smi_setup_mdio()
> on realtek-smi.c:
>
> - priv->slave_mii_bus is allocated.
> - mdio_np = of_get_compatible_child(priv->dev->of_node, "realtek,smi-mdio");
> - priv->slave_mii_bus->dev.of_node = mdio_np;
> - ds->slave_mii_bus = priv->slave_mii_bus;

I might be able to help here. The Realtek SMI version created a custom
slave_mii driver because it was the only way to associate it with an
MDIO DT node. And that DT node was required to specify the interrupts
for each phy0.
It would work without that mdio node, letting DSA setup handle the
slave bus, but it would rely only on polling for port status.

As we only have a single internal MDIO, the compatible string
"realtek,smi-mdio" would not be necessary if the driver checks for a
"mdio"-named child node. Maybe the code was just inspired by another
DSA driver that uses more MDIO buses or external ones. The "mdio" name
is suggested by docs since it was committed
(https://www.kernel.org/doc/Documentation/devicetree/bindings/net/dsa/realtek-smi.txt).
That name was also kept in the YAML translation
(https://www.kernel.org/doc/Documentation/devicetree/bindings/net/dsa/realtek.yaml).

The Realtek MDIO driver was merged at the same release that included
the change that allows dsa_switch_setup() to reference the "mdio"
OF-node if present. That way, it could avoid creating a custom
slave_mii_bus driver.

I submitted a small series of patches to unify that behavior between
those two drivers:

https://lore.kernel.org/netdev/CAJq09z44SNGFkCi_BCpQ+3DuXhKfGVsMubRYE7AezJsGGOboVA@mail.gmail.com/
(This is my answer to the series opening message to include the first
paragraph ate by the editor)

There was some discussion but not NAC, ACK or RFC. It would have
dropped some lines of code. I can revive it if there is interest.

Regards,

Luiz

