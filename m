Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38769C2BB3F
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Nov 2023 15:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qLMeAASwEvkwM5ARSBtAZOQghxCaeyY75R6X+if1WqE=; b=KRtslEcJ24YNqRtZdaQ9iZBb4L
	ACGfzZxKMq2+6rWjG7LdOSxGmsehJpjvlLheUrZF3yWTajtfPYvl9la5UORP32xp4imR5ohYTxInx
	joLKqQBl1EoVBFQw1KJzaqHNtN933PKzeyDjR6mybaAK5EkO/8mt376tl+KBiy0o3/tVyy9JP1045
	HjubXBm7rBeEkrI/aNFyjCRLIitRCjq3pkl61YK1Xe+C7hmH8rhevGauIW0TweuirmlP0JEtQqrHr
	O05+7ugNPC3vdoCnePRRm2YV+Ifv+hGb0dBSl+NLYDA/7zh4JoVqudr9URSFcpDtWFYziDHPCDPfW
	zjL1u6uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r55wB-00CW4L-1u;
	Mon, 20 Nov 2023 15:11:47 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r55w7-00CVyz-0g;
	Mon, 20 Nov 2023 15:11:44 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4387B240006;
	Mon, 20 Nov 2023 15:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700493095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qLMeAASwEvkwM5ARSBtAZOQghxCaeyY75R6X+if1WqE=;
	b=EkKetB+wXFOXzu45jcP6q9hgdQzKT9+5OHVLW2zOFn8URL/SigTzG9AWgS6nrEwMtiMpTB
	N4sd+uhNHabIe0/3iC+laVyBUqaIE2g5dudV+3yB1oP9FOH6xB3cdfYzUDmyOMiKPGkql8
	JOnw1xXDKKEz3QHHJGF4GUkh3u7bga5BE9uqa42/K+gUFPksiReAhVzevONDW1avOjEoO+
	m1RCQ/xyE/oNKA7muxsQJrYshLOSuGRg6unBLQtIQ2wdAHhbMang6/sgXsr98HK4BDtFDr
	DxhTb4EIUQ+fHfsX24X5YUaz6UO9tSLX8gDf98/TuXBwzTCQPF0snXrZBhMWcg==
Date: Mon, 20 Nov 2023 16:11:31 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Daniel Golle
 <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>, SkyLake Huang
 <SkyLake.Huang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, David
 Epping <david.epping@missinglinkelectronics.com>, Vladimir Oltean
 <olteanv@gmail.com>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Harini Katakam <harini.katakam@amd.com>, Simon Horman <horms@kernel.org>,
 Robert Marko <robert.marko@sartura.hr>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [net-next RFC PATCH 00/14] net: phy: Support DT PHY package
Message-ID: <20231120161131.2c0e2892@device.home>
In-Reply-To: <20231120135041.15259-1-ansuelsmth@gmail.com>
References: <20231120135041.15259-1-ansuelsmth@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_071143_432040_2581F221 
X-CRM114-Status: GOOD (  10.31  )
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

Hello Christian,

On Mon, 20 Nov 2023 14:50:27 +0100
Christian Marangi <ansuelsmth@gmail.com> wrote:

> Idea of this big series is to introduce the concept of PHY package in DT
> and generalize the support of it by PHY driver.

I don't have much to say on the series itself, I looked at it and
didn't find anything obviously wrong, however know that this work can
also be helpful for some other use-cases. I have in mind the Marvell
Alaska 88e1543 PHY, which is a 4-port package that can either be used
as a classic Quad-PHY, or a Dual-PHY, each PHY having 2 ports. Having a
DT description of the package is a good step towards being able to
auto-detect which configuration to use for that package.

Thanks for this work,

Maxime


