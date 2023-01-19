Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D10C00A5A
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 16:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QiBbT2ghGLY4HBE1uLspsb/Jbn8ApvjN6obsBtxg3xk=; b=pk50GNVHuGziYXAE8KRJI6jig3
	eaX8XwBpWiv1JSYys0sb/pxMHroboxym35zRs/4XgdiUF5dVgM/7weiS2ro+1741EwfPax7uyyf/I
	mC4kQLMf1cWjrFqoMe5Dpc7hAGBvXd0aul7uAg1W8L+dhVYV0vnKa+SkL9qIsIDgqNN/KLzYuQnRe
	1BWX1rowHKxtANaUer/ChMEM7MM21zeuaQDmJV+cLqagQ4eqhlOYhdINOtZM13NXbZXUgPh+bu5a5
	FX4E/PEKLbcQFDoKdF/7PyDwBNzq/zYUtdw2+VnweTFFSNlPTuUBJBCtBT5pAh/RUTK5OVIULYG9T
	ub4/oeAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXjP-005xVY-I2; Thu, 19 Jan 2023 16:25:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXhz-005wn8-PO; Thu, 19 Jan 2023 16:24:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5121461C7A;
	Thu, 19 Jan 2023 16:24:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F5BDC433F1;
	Thu, 19 Jan 2023 16:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674145450;
	bh=NFTHn/7vSxjzDGwGqFQCBJWVrTJ8XQAglJR613dQjEY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MKzgIOCTg3d6qedJUWFgL4KWQ03dALduzZCSqvSiW85t/TK3CiCbIOAaLjO+sWW/t
	 WRGcqG7JcfjP15EOy6TCWFWEOZxwZ/qBdJbIQS8SfjkkipjKRLrRCkZqNsMLrJdcY6
	 uWoKnkmgK0qkYw5WCYKUkxfpELNhv4B8p8AIGAK5VtqCOSsnmHgBQyhIVvKBmOozWA
	 Di2Im6ZMZlNWbOHF2a5LZMvs10ny24cBZ4MAZSl1u5aDDRVhj2fS51Nv0RWDPj1XrR
	 VajHmdobA7iGplscGnOyNFpC4exF3GWKjFa0GdxMnlDJDJXU98X0Xy8Z3dnit2Bnli
	 TaFo5S8QsMstA==
Date: Thu, 19 Jan 2023 16:24:02 +0000
From: Lee Jones <lee@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Gene Chen <gene_chen@richtek.com>, linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Kurt Kanzenbach <kurt@linutronix.de>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH v4 10/11] leds: syscon: Get rid of custom
 led_init_default_state_get()
Message-ID: <Y8luolbdQoOZtPrn@google.com>
References: <20230103131256.33894-1-andriy.shevchenko@linux.intel.com>
 <20230103131256.33894-11-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230103131256.33894-11-andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_082411_933523_2ABBD228 
X-CRM114-Status: GOOD (  11.69  )
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

On Tue, 03 Jan 2023, Andy Shevchenko wrote:

> LED core provides a helper to parse default state from firmware node.
> Use it instead of custom implementation.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/leds/leds-syscon.c | 49 ++++++++++++++++++--------------------
>  1 file changed, 23 insertions(+), 26 deletions(-)

Applied, thanks

-- 
Lee Jones [李琼斯]

