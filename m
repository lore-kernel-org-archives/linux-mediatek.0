Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD7A7C3F6B0
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jul 2022 09:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JjN4NcNXU/1QGqeaaubi7fktUpgnWFpHD9O7eS3OTiw=; b=E57gERG9Vp4kLWDChp3reggt2R
	/2as4FBldZJepKwmlvx8ujkFijrJaMsFALIobtMLYp//JsXECqkPNB96PWbeawsIOSjjBjM5kybtl
	v1jJ5H91rA2NPQ+OR3cGLxFdftsoT79t3BIAwxC75ewONBEImvW204xx3cBkuHdFwQrrvU60B1l4p
	nUTFg/nGVxZ2Jso1bz4nk5MIbuwnw6iJdmeCsSqPtGlK5dMNqGgDdoUl/Y264a2NdqHyDEv48r9n3
	P+1eZdgQWvDKswQGS7/RThQ0plC78GDbKphlt6Bx6S1CYN5H+9eAn2Aj1oWLnKaF1uSzJxkqrOOt7
	gc6JozaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGcuw-00BUDw-2X; Wed, 27 Jul 2022 09:01:22 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGcuh-00BU39-3m; Wed, 27 Jul 2022 09:01:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B6862B81FE4;
	Wed, 27 Jul 2022 09:01:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80BD1C433D7;
	Wed, 27 Jul 2022 09:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658912462;
	bh=JjN4NcNXU/1QGqeaaubi7fktUpgnWFpHD9O7eS3OTiw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=L7RzlMQlmFfM2URJsUBhVoH776jJabR2hMmSitMBPuiyJGc5+rMKdLNVgBQDp2bfP
	 znKzuLCUbQX+qVSmmwicOpgFhUdi9M33VvPti5uxe+Gp7DnmONZg2ARefV3gnzxDET
	 ces1hoGPw+bXq+t5Ws31kHTb28Hh5a/t/jX7lKHRS0tXJnV7LmQbFDPnoYQ4qUomxY
	 yjzEwb9Vm5hIi89Tli+xLb+GDXgOoW7pRzDxKoGbhGMxwi3Ufv4wLgyZy9ceIzYBwV
	 BnWZAh4hwGb8CurEYkZBBliH0G9acoTTjk1xW+P1UxNvxHmfPyv0EKsKkLlurt0+SD
	 Y4oDI2FVvm5Ow==
Date: Wed, 27 Jul 2022 11:00:51 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, Andrew Lunn
 <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Alvin =?UTF-8?B?xaBpcHJhZ2E=?=
 <alsi@bang-olufsen.dk>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Claudiu Manoil
 <claudiu.manoil@nxp.com>, Daniel Scally <djrscally@gmail.com>, "David S.
 Miller" <davem@davemloft.net>, DENG Qingfang <dqfext@gmail.com>, Eric
 Dumazet <edumazet@google.com>, Florian Fainelli <f.fainelli@gmail.com>,
 George McCollister <george.mccollister@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Hauke Mehrtens <hauke@hauke-m.de>, Heikki
 Krogerus <heikki.krogerus@linux.intel.com>, Jakub Kicinski
 <kuba@kernel.org>, Kurt Kanzenbach <kurt@linutronix.de>, Landen Chao
 <Landen.Chao@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger
 <matthias.bgg@gmail.com>, netdev@vger.kernel.org, Paolo Abeni
 <pabeni@redhat.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Sean Wang <sean.wang@mediatek.com>,
 UNGLinuxDriver@microchip.com, Vivien Didelot <vivien.didelot@gmail.com>,
 Woojung Huh <woojung.huh@microchip.com>
Subject: Re: [PATCH net-next 0/6] net: dsa: always use phylink
Message-ID: <20220727110051.2df82bf6@dellmb>
In-Reply-To: <YtGPO5SkMZfN8b/s@shell.armlinux.org.uk>
References: <YtGPO5SkMZfN8b/s@shell.armlinux.org.uk>
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_020107_447356_ABC0D4C5 
X-CRM114-Status: GOOD (  11.04  )
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

Dear Vladimir,

am I understanding correctly that your main objection to this series is
that it may break other drivers? Do you think it would be okay if I
changed it so that only mv88e6xxx driver would ask for phylink for
CPU/DSA ports?

I would really like to have phylink's PCS code taking care of mv88e6xxx
CPU and DSA ports.

Marek

