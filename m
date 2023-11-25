Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B90B1C4167B
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Nov 2023 17:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VcPaglTJNXboIOVIfziLcej/MavQwgea6uWybKAiriA=; b=NcWamNMvWN1L6e8H08Y30G0wR3
	8F8de5oNqQ8MD9Suz/SrZBO5toA5CO7eMyhzt3/VfH4xNPtYrau/b44YwF4Ut6ZklvSaj6F10PcU8
	pl3xlJGeTwn6OR3cItvDX9gQ1oRWgKtZ321B2HUCyYSNulmCdL2zir9hIRPEZpSRNwg74rpcQSGg3
	6aCpV7c6Zjze/3pXaCr123vZ/Uo5E9j2Dxt53fbfGBmx3+iwgMyxyLjb0wOSpJU7mmp+TTiFVnIn0
	IN9Kntsifn3nlcgrPp/AD8nMme9kxI/MGAEcBk93sapuK5eIMY/Q2lXvlG2ixGcPSWUmB0f8AX+HU
	xukKGGTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6wSJ-009YWW-2N;
	Sat, 25 Nov 2023 17:28:35 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6wSG-009YUp-1j;
	Sat, 25 Nov 2023 17:28:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=VcPaglTJNXboIOVIfziLcej/MavQwgea6uWybKAiriA=; b=kp+5QG1EFMcBC/4ZwcOAIs+Cn/
	XHgPWllgKTp6orzQQEc3ucYuK7UEMRAwv5iNKKTvWilG/oCKXjVL1KBp7/aTx13dDz0r4Df3SmJgO
	4xqh4pdJvVD2kKqjnSWYgAzubijgqz/neja5zSTt1iwUGk/f/Z1tt9bz+uePf5kIxeqg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r6wRq-001CWJ-5v; Sat, 25 Nov 2023 18:28:06 +0100
Date: Sat, 25 Nov 2023 18:28:06 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	David Epping <david.epping@missinglinkelectronics.com>,
	Harini Katakam <harini.katakam@amd.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Robert Marko <robert.marko@sartura.hr>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [net-next RFC PATCH v2 00/11] net: phy: Support DT PHY package
Message-ID: <bf26ba4b-ea21-450d-b2ce-0f68f2d2796a@lunn.ch>
References: <20231125001127.5674-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231125001127.5674-1-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231125_092832_571538_902ABB65 
X-CRM114-Status: GOOD (  11.11  )
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

> One example is this:
> 
>         ethernet-phy-package@0 {
>             #address-cells = <1>;
>             #size-cells = <0>;

Please extend this example with a compatible, and include a property
which is global.

> (For Andrew, we are looking intro making this in at803x PHY driver and see
> what functions can be reused, idea is to move the driver to a dedicated
> directory and create something like at803x-common.c as the at803x PHY
> driver is too bloated and splitting it it's a better approach)

This sounds good.

     Andrew
     

