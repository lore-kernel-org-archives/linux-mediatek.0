Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B53EB64DD
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Aug 2023 10:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aBAVpXS8NM/S563eJtaui9WR2vwiGDxIvWqt84h+Oyw=; b=nAcP+cGjS3+BWQ1WRERC9rCCd7
	kflsFo5E/u8Od8ymzEIYfM4veiW7I15DsJ7lNC4k+U278U5+3Jgm4UtKfMYQFR1VueV/NfbXfEum3
	8nnmVnwt9kSut9g3nn8XJe1xrXWZ3CJxVkK0JEJ2+/laewkB0sWxeabT0Acezchz83Om8MNGNqpmb
	ESBqCFWdyd4Bzbm3HhAtXwkrukPzgNdXV5Ac2F48yDcxpuC0JJwbHcaZcFPXtDOfpS8XVrnMbOvEf
	CK++kD90/1lLgV+dQEWcO2yEjz1RgR2jYaaa0L28W5csjVklvjWmULuy0nkBErhsLelxW66BKhgd2
	FOPK3xiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVUzS-00GrkZ-19;
	Mon, 14 Aug 2023 10:40:02 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVUzP-00Grjo-0n;
	Mon, 14 Aug 2023 10:40:00 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-99d90ffed68so376572666b.0;
        Mon, 14 Aug 2023 03:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692009595; x=1692614395;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aBAVpXS8NM/S563eJtaui9WR2vwiGDxIvWqt84h+Oyw=;
        b=V70f5VYcQVBIRnMn6jR03+6JOI14+oCqXEWxRdHaanV/itzXjH9HeO9NNoZV7KFT9j
         nYaWU4HQ6T6n3IV5dPW7x9uINA6vgEvjmG0DE3jMr2iFoHsEty9DIWE/MdLgCbpm/BJg
         nnAXEbLjMJtg9Wlm3s9H9HmJBQ6at1Jj3kpH4+req6Fyj/yHbK08CPwZHLZfUNamu9U+
         APEy+XpTZzT1EwQD/sNFi8r3lzivs55sBQIvAjPMS7pfp+p4ueqyPl9bk0ilH+zuWTKU
         tJkkYVwN/Qa+zF6n1GnoNUJ6ypDlepd+/oT7wD3Tg7wZ3QjeDCeaq10emFC6At5osy5m
         24ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692009595; x=1692614395;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aBAVpXS8NM/S563eJtaui9WR2vwiGDxIvWqt84h+Oyw=;
        b=a2E3rkYqdJPsFRLzU+0HID6uy59oWzQUuHEC+1hGXnGU8R3zcOk+KMOvmqokOrf50i
         u6lxN6hZ3CdiVxjsuyKJQOmd7a4xmGciEWQecCbaT0+WMLtVnbFITyGo6UPgzmTtp0Q+
         uQekyk5H3x+LWifceBxksB5q2h5CoTu/B5W7j1902mL3ED37DDgwpHnrPeR/4vFnLnAc
         8Cm8VxzL6vrZG00fFUS6moSF7fUY1DG4jHqrdCf6wz1XhbMwW0GpQagmwr2N2a6aNu00
         KXNPgFYpMZRi35Sv5oSAk7pKnnhUHX8c7HCqHAimy4vG661eYpZc5d7YyyaukkDM886Y
         8pxQ==
X-Gm-Message-State: AOJu0YzJRtAYDTdsNxKoH/IjcHt2da6rjRjj4eIGpTI01lMipvO4+52i
	He6MeBRKkaBeb1TnWvO2Hz8=
X-Google-Smtp-Source: AGHT+IGWQdWdFfldoc+s7RKd4/99QgX6XSZumLq8F7bFXSVWECP7EKR6y4ID5N1QKyWzkJA/s+6bjw==
X-Received: by 2002:a17:907:2d94:b0:978:8979:c66c with SMTP id gt20-20020a1709072d9400b009788979c66cmr13860963ejc.18.1692009595070;
        Mon, 14 Aug 2023 03:39:55 -0700 (PDT)
Received: from skbuf ([188.26.184.136])
        by smtp.gmail.com with ESMTPSA id o8-20020a170906288800b0099cc15f09a0sm5495409ejd.55.2023.08.14.03.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 03:39:54 -0700 (PDT)
Date: Mon, 14 Aug 2023 13:39:51 +0300
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
Message-ID: <20230814103951.epdk3bzhkn2h7oul@skbuf>
References: <20230812091708.34665-1-arinc.unal@arinc9.com>
 <20230812091708.34665-3-arinc.unal@arinc9.com>
 <abc44324-454c-4524-b05e-fe989755ea47@arinc9.com>
 <47b61929-5c2d-4906-b153-2046a94858c8@arinc9.com>
 <47b61929-5c2d-4906-b153-2046a94858c8@arinc9.com>
 <20230813112026.ohsx6srbt2staxma@skbuf>
 <8a8e14f1-0493-4298-a2cc-6e7ae7929334@arinc9.com>
 <891c0b67-abe1-416c-aa94-675f7f3d8044@arinc9.com>
 <20230813190227.6k2qyxfewbkmatn6@skbuf>
 <af044838-36ef-4ed3-af0a-a58181b6345a@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <af044838-36ef-4ed3-af0a-a58181b6345a@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_033959_310722_5813683B 
X-CRM114-Status: GOOD (  14.29  )
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

On Mon, Aug 14, 2023 at 01:06:19PM +0300, Arınç ÜNAL wrote:
> On 13.08.2023 22:02, Vladimir Oltean wrote:
> > On Sun, Aug 13, 2023 at 05:58:57PM +0300, Arınç ÜNAL wrote:
> > > On top of this, I'd argue to document the internal MDIO bus on the
> > > ethernet-switch.yaml schema instead.
> > 
> > Why?
> 
> Because a generic switch can have an internal MDIO bus, it's not specific
> to a DSA controlled switch.
> 
> Arınç

I'm not sure it's that simple. Check out arch/mips/boot/dts/mscc/ocelot.dtsi.
Its switch IP ("mscc,vsc7514-switch") is on the same hierarchical level
with the "mscc,ocelot-miim" nodes (so, not a child), because the MDIO controller
isn't part of the address space of the switching IP. Actually that could equally
be considered true for DSA. Placing the "mdio" node as a child of the switch is
one of the possible options, but it has its limitations and is certainly
not the only one.

