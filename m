Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA5DEC35274
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Dec 2023 01:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8iVeJGpY5RtEtx+Wh9ObkHYcijgrfrIL5uqLrHHzCik=; b=KoUJ5B/YerREsNEHwDbTL5VfcB
	dViW8dj+P5Idpq0t9kCvz/pMnIq2wGmmjfuYuMbVzTC84JMHvQX15mrmC/e6OsImXeZdbVuKBoss+
	qKlzme7ArgCxGdwYyPBwIk9iQk7QPLEjuYibXm2irr5oPwuVIqNgJuwYLItgUAu+PhjOsEyRs/cVa
	wMMvvrFsxa2mPtk7TPu+HbwvOdCBWHOY1HZm2kabFj9PzfZIQMb+EtZylLymkAUgfE/+n+R0xJXhF
	+rBYmQyXAHwjZ7zu8QVyZYHDc2p0WIXWV5kM5IEiZvOUFKABqLhmCsAxfXr+5N5ERQSBhSIahqFxy
	BoisBB4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEJIq-0054oy-1N;
	Sat, 16 Dec 2023 01:17:16 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEJIn-0054nh-16;
	Sat, 16 Dec 2023 01:17:14 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1rEJIU-0001k3-0O;
	Sat, 16 Dec 2023 01:16:55 +0000
Date: Sat, 16 Dec 2023 01:16:51 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Conor Dooley <conor@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Alexander Couzens <lynxis@fe80.eu>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [RFC PATCH net-next v3 1/8] dt-bindings: phy:
 mediatek,xfi-pextp: add new bindings
Message-ID: <ZXz6g0Su-kNPA3rX@makrotopia.org>
References: <cover.1702352117.git.daniel@makrotopia.org>
 <b875f693f6d4367a610a12ef324584f3bf3a1c1c.1702352117.git.daniel@makrotopia.org>
 <20231212-renderer-strobe-2b46652cd6e7@spud>
 <ZXiNhSYDbowUiNvy@makrotopia.org>
 <c9605d38-e4b8-477d-84d8-de7b4dedd1f1@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c9605d38-e4b8-477d-84d8-de7b4dedd1f1@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_171713_375766_55B98416 
X-CRM114-Status: UNSURE (   9.97  )
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

On Wed, Dec 13, 2023 at 02:20:45PM +0100, Andrew Lunn wrote:
> > Because it is only present in one of the two SerDes channels.
> > Channel 0 needs the work-around, Channel 1 doesn't.
> 
> Does the channel know its own number?

As far as I know we can't infer the channel number by any of the
registers default values.

We could infer it from the base address, and that would kinda defy the
purpose of having Device Tree to begin with in my feeling at least,
but it would be possible, of course.

