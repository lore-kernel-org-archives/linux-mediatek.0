Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D81BAC83F2C
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Sep 2023 11:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5WLoQn7be1D72ekzhEmbPr89HcwylHXzc0OOTYnEBNg=; b=Af7Z31cE02JU6LmirLgqqClCaz
	zegwC0HjbhKQTks1RLf33zXKk+rP2hjDvLOSrpoWWPgGKWJ6VdS1tw0sG4Xpet+ccwwj10WtC/Xo7
	+4/EdEufTeNaDJwJ7sXWDf5ugcpV9A6ckYqzc5Y4gWZpwwKko7dxKGPO5f+3ut+tDwWx7IhbgX+My
	D0SB+ajYYA+H8FkeXTkoN3o+zqhRrYS5lD5i1XoH3PDRcNPnNRRVBAo4Hi9E7PfWzj37WNbtFQlnf
	1h0JUsgBkP4uNfXBDHgDi/Zr2ndF5JbYSut3MekFVth2jPc1l4CWvdB2AfWq9yVF3xxU6CSPwslk6
	v753EhIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdTy6-005swS-2d;
	Tue, 05 Sep 2023 11:11:38 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdTy3-005svc-0B;
	Tue, 05 Sep 2023 11:11:36 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5008d16cc36so3950184e87.2;
        Tue, 05 Sep 2023 04:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693912291; x=1694517091; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5WLoQn7be1D72ekzhEmbPr89HcwylHXzc0OOTYnEBNg=;
        b=Hw7BgK1I4NKL8zgVFCQ0jYF8VmiJZ6IlyRyogooG8AcvK/cpQfOPKULRziSuWUybtV
         NvaucY/HUVcWXFl2ibXYv0mB/v4E4UpO7AXyOP5b3mmn20qrJl0NbmNtyRCbU4txnW8r
         Cq2EZLVSTiXmwLaRmjDbz/SNUM2pCTptk5EKodGu6EvziFJnvyxbOEHTcXO3R2ysdJdA
         NSVjdMaZHCJokzqV9XO5VgCa4iwVHLy1cTmTI4WJhnGtGj0plKeeIrdzMqfCizmg5eDn
         RJZKm2lbfE7WlcLPuSe6JTxm2BIWXgy7znnnEfUss1+ownqBwTBfUpBU320zBKFOrTif
         2BZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693912291; x=1694517091;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5WLoQn7be1D72ekzhEmbPr89HcwylHXzc0OOTYnEBNg=;
        b=g/NvPxDFVdnOaz3UlR/JCLsImXPFnJsnjH4au7qGdXetycC6+68BW3qoZgb+3MhVwe
         MdxSp1qifnvDlftCcKtgnp53jZ+zQp9bzCUC76OYZJuQwlWkNZZSGMnQNTzgqkJpCNGH
         QPKM/gQgxbN3hV5YervyZUCml0nUpOxBEEN8qpgXP1/0EJpHKiiuq6OKF35l4gWGEN4v
         W086GS6OINh6ZvlqdeXzRyEvDT04UvXnHbV90n23t3PpOQZqabR5j0fITSH3KBPJo4Md
         XODiYCJVmNHCAdMeNXiNM/rC6yo1I+kCekdw2dUu7f6mxFDvZi7tNgwFalVO1ro4Kiy+
         yngA==
X-Gm-Message-State: AOJu0YxU/tFHBfW8TioWVkhSsU5yZl86FanFogeENzU0J5ncx/t+j2oR
	KWgqH4H13RedWS+36yaV1M4=
X-Google-Smtp-Source: AGHT+IFZm+YJ8szZjnCXx4iZ0+YwTJu1WFmNIfkcFqME64Z4ABDlhajbiXLHXOiOLFRXmKQmrQl7dA==
X-Received: by 2002:a05:6512:3990:b0:500:9734:b415 with SMTP id j16-20020a056512399000b005009734b415mr9696436lfu.30.1693912290677;
        Tue, 05 Sep 2023 04:11:30 -0700 (PDT)
Received: from skbuf ([188.26.57.165])
        by smtp.gmail.com with ESMTPSA id l26-20020a056402125a00b00525c01f91b0sm6961365edw.42.2023.09.05.04.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 04:11:30 -0700 (PDT)
Date: Tue, 5 Sep 2023 14:11:27 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Cc: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
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
Message-ID: <20230905111127.hql3pjlrtqc7gybv@skbuf>
References: <47b61929-5c2d-4906-b153-2046a94858c8@arinc9.com>
 <20230813112026.ohsx6srbt2staxma@skbuf>
 <8a8e14f1-0493-4298-a2cc-6e7ae7929334@arinc9.com>
 <20230813190157.4y3zoro53qsz43pe@skbuf>
 <f5f468c1-b5a2-4336-b1d9-fd82da95b21d@arinc9.com>
 <20230814143601.mnpxtcm2zybnbvoh@skbuf>
 <0cee0928-74c9-4048-8cd8-70bfbfafd9b2@arinc9.com>
 <20230827121235.zog4c3ehu2cyd3jy@skbuf>
 <676d1a2b-6ffa-4aff-8bed-a749c373f5b3@arinc9.com>
 <CAJq09z6eghuHY+b2y-kGmjKnLiEEOABXGKhjnB-PxJ=-GtYD4w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJq09z6eghuHY+b2y-kGmjKnLiEEOABXGKhjnB-PxJ=-GtYD4w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_041135_117174_EE530090 
X-CRM114-Status: GOOD (  19.23  )
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

On Mon, Sep 04, 2023 at 11:42:19PM -0300, Luiz Angelo Daros de Luca wrote:
> > > [1] ...this. The SMI-controlled and MDIO-controlled Realtek switches are
> > > otherwise the same, right? So why would they have different dt-bindings?
> >
> > Honestly, I'm wondering the answer to this as well. For some reason, when
> > probing the SMI controlled Realtek switches, instead of just letting
> > dsa_switch_setup() populate ds->slave_mii_bus, on realtek_smi_setup_mdio()
> > on realtek-smi.c:
> >
> > - priv->slave_mii_bus is allocated.
> > - mdio_np = of_get_compatible_child(priv->dev->of_node, "realtek,smi-mdio");
> > - priv->slave_mii_bus->dev.of_node = mdio_np;
> > - ds->slave_mii_bus = priv->slave_mii_bus;
> 
> I might be able to help here. The Realtek SMI version created a custom
> slave_mii driver because it was the only way to associate it with an
> MDIO DT node. And that DT node was required to specify the interrupts
> for each phy0.
> It would work without that mdio node, letting DSA setup handle the
> slave bus, but it would rely only on polling for port status.

It is possible to set up PHY IRQs even if the MDIO bus is not OF-based.
I think that mv88e6xxx_g2_irq_mdio_setup() does that (sets bus->irq[]).

