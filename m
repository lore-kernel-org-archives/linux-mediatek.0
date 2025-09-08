Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90366CAC582
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Sep 2025 20:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GM5YS0VBx8Kphkepw+zbMrc9QOjuaXqI+BI+rLpHDcI=; b=vr8G9/nONByibfxq9XpvdwQaXF
	bMPKhiznSR4IkNBVDrASflCkL56tm8fMuU0Z5a+RTEvFwxZc6608IYH6V8k9VSi7XtXcVbRaG4eno
	KfcR6Y0GBG+0atDiw29+h3LKMj920Bcl53mK9hPkVayaqN/34zKkBV3220OKzGHOegkdDPmLRDhay
	lvl4tCgBJgNhuUs1ewcYgwn4YNgIYGiJMNedv2Ac6hr7cm5Ntb5IMsawDm3uOrfYXc8o9H4v3dvZD
	RzXcLrNZtGrCbxAgJLR6ffubyuui6Z/1oM6S8RJgKjqudtGeYYO+Hj4acQzy4/AFaBs6g00SjYVjG
	bHd3OPKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvibY-00000002EBT-178N;
	Mon, 08 Sep 2025 20:36:48 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvf8J-00000000wNc-2L03;
	Mon, 08 Sep 2025 16:54:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=GM5YS0VBx8Kphkepw+zbMrc9QOjuaXqI+BI+rLpHDcI=; b=TcR16sDN44Y2x3ALwDirJzBpup
	LUZUCoTu0QcSQuqWsfB/hRKVEVNeXTi+rG3xMFDHMR6plx0dmlZFbhBYhu9QMIQ+Zu3V9BP1xFVFC
	FBmY5sSZzBTN5nVyDTLXrFizPdwJAdy/RchrrnT7+spz7QKJhgv1n7wZeCE5EPQwlFso=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uvf8B-007gtm-Ma; Mon, 08 Sep 2025 18:54:15 +0200
Date: Mon, 8 Sep 2025 18:54:15 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] pinctrl: airoha: fix wrong MDIO function bitmaks
Message-ID: <583981f9-b2ed-45fe-a327-4fd8218dc23e@lunn.ch>
References: <20250908113723.31559-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908113723.31559-1-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_095423_591740_97E83460 
X-CRM114-Status: GOOD (  11.26  )
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

On Mon, Sep 08, 2025 at 01:37:19PM +0200, Christian Marangi wrote:
> With further testing with an attached Aeonsemi it was discovered that
> the pinctrl MDIO function applied the wrong bitmask. The error was
> probably caused by the confusing documentation related to these bits.
> 
> Inspecting what the bootloader actually configure, the SGMII_MDIO_MODE
> is never actually set but instead it's set force enable to the 2 GPIO
> (gpio 1-2) for MDC and MDIO pin.

Is the MDIO bus implemented using the GPIO bitbanging driver?

	Andrew

