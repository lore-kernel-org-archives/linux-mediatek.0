Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F4CCC83F2C
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Sep 2023 12:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CPf+YfFnjEQJOQ/RYkXxlg/l/+zr7prHRX9DUuuREfs=; b=KQmnJw9Ff33ViKi+F2HfWOOAg1
	8y+vvKDA+8c2gu4T6YZOlKMEmKP7OtzIY9QWOTUHw2Kc9Hhae1e8iamilDa0CxyXVI1uFjJ7XUQuF
	wS2XHMxysbAC20/u7NkrfSDwdvCyOQhxE/zQ2DKi1bS0xAihvSgOTekrJHpa7yUPuIFo+gs3KVvhS
	q6PZRh5m5SP9tKpA1Rxqu/9xIruaVmwUExIe5ApF5v8uX8czrM824OdBFU+kqB/zeTItKWw1B7G0A
	bS9vqfb9SyiDb+yPvZdXvz//s9LIKb8awgqLhZGy6HTkCb6koI8bSOyyAc5o1A7O5Wx5hzQ91PSr5
	oeJtjbiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdUwp-005zBu-1T;
	Tue, 05 Sep 2023 12:14:23 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdUwl-005zAE-2R;
	Tue, 05 Sep 2023 12:14:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=CPf+YfFnjEQJOQ/RYkXxlg/l/+zr7prHRX9DUuuREfs=; b=RS8cG2jN8GlohFNVCaY4hqmwhN
	iTtoH5cUEJDvqOm2yZ/zia4LU+wRduzI/1v78NoAJfTq2XeqGTS08+Yaa2w21nhVKeviXlqNenwN6
	pIPgAPAP/g7YmveFDAJGei5cHgKxSg0sE0C72y/p/D2iSHMZxv/neKmH/GgKRK/Ab34k=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qdUwA-005nv7-E6; Tue, 05 Sep 2023 14:13:42 +0200
Date: Tue, 5 Sep 2023 14:13:42 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Luiz Angelo Daros de Luca <luizluca@gmail.com>,
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
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
Message-ID: <033d3a71-783d-40b6-a972-2021ae17813a@lunn.ch>
References: <20230813112026.ohsx6srbt2staxma@skbuf>
 <8a8e14f1-0493-4298-a2cc-6e7ae7929334@arinc9.com>
 <20230813190157.4y3zoro53qsz43pe@skbuf>
 <f5f468c1-b5a2-4336-b1d9-fd82da95b21d@arinc9.com>
 <20230814143601.mnpxtcm2zybnbvoh@skbuf>
 <0cee0928-74c9-4048-8cd8-70bfbfafd9b2@arinc9.com>
 <20230827121235.zog4c3ehu2cyd3jy@skbuf>
 <676d1a2b-6ffa-4aff-8bed-a749c373f5b3@arinc9.com>
 <CAJq09z6eghuHY+b2y-kGmjKnLiEEOABXGKhjnB-PxJ=-GtYD4w@mail.gmail.com>
 <20230905111127.hql3pjlrtqc7gybv@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230905111127.hql3pjlrtqc7gybv@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_051419_810896_A4E06B5B 
X-CRM114-Status: UNSURE (   9.83  )
X-CRM114-Notice: Please train this message.
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

> It is possible to set up PHY IRQs even if the MDIO bus is not OF-based.
> I think that mv88e6xxx_g2_irq_mdio_setup() does that (sets bus->irq[]).

Yes. It took me a while to realise you could do this, so there is
probably some complexity in mv88e6xxx i might of been able to avoid if
i had discovered this earlier.

	Andrew

