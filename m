Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE5EC282EC
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Mar 2025 16:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3y+W9IcRV8gPlJPEOAekqQIgL6cCtE6gmVA1gvv4+n0=; b=ADJwc1Ag9kVe5dxiNgNrXE9JlZ
	fjuYHSWeeg76BAhGXws2wXBwyIR/1blqNrIEJZBaudFZ/TLtq7IRhDXe7r0Aq/udJ0vptlGBVuFNW
	ySr3A7RvSHN+ScmWLvcSJgqpSpOC/OFF8ITZvxexOOxRIpS+e70t51ALTgrgM0LCusblCGo+YWed/
	GYHz/mjF5lB7Pu23n0ilyOErxWnRDSZnwt5sIfLaOHQQQrXno5dEFNO0I3DOGwFnTkTC//+Mg4oUI
	cmQdUngGao9ub0Zywgf39O51LcfY+Wxe1Z0TLCwKgKiBVQbZjewY3ETEwk/qDMgxVlg2QtdM6Yh5Y
	c3PPxlrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDGU-00000003JlI-1lRI;
	Mon, 17 Mar 2025 16:24:34 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDEF-00000003JHg-2ETT;
	Mon, 17 Mar 2025 16:22:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 31775A4553F;
	Mon, 17 Mar 2025 16:16:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FAEAC4CEE3;
	Mon, 17 Mar 2025 16:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742228534;
	bh=0svckh3B/Ur9jjk3KUvtAqq/TolLLfjt21X84e1pv9s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PjrsNFvunrz0r+S3+meOeT86EC7RKhSfjAKDmdu2f3n00L9SeMslYa8gr1Xz2fwPS
	 yJ86j18koS0mdtT4wb2nBG9ZBVgztxzJjED4/pph3JNhM6MKgDIvfe3arTzo8tH2QO
	 huuQ+2TQxmo0GSEbaCYTekhX1LehfX54LuwUIYY2UXn3rTNbjVz1m8Ue4ihk8nVYaI
	 yn+R3egkK+0Yaj/TkKaKuAwjyOizlwbBJfdScICKg2q4IlyrjJwcsQsN03fzKGyl8M
	 WpylqTSuGDOFHd35Yx8Z3gtQ6PlALpuAEC6HmhUA8h8oR0DjJpeR01+p/WC5V/kqZN
	 BMSZTKxyZZYgw==
Date: Mon, 17 Mar 2025 11:22:13 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@google.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	"David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>, upstream@airoha.com,
	Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>, Lee Jones <lee@kernel.org>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org
Subject: Re: [net-next PATCH v13 04/14] dt-bindings: net: Document support
 for AN8855 Switch Internal PHY
Message-ID: <174222853284.168151.15677522554772356388.robh@kernel.org>
References: <20250315154407.26304-1-ansuelsmth@gmail.com>
 <20250315154407.26304-5-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250315154407.26304-5-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_092215_643642_3A044EED 
X-CRM114-Status: GOOD (  11.82  )
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


On Sat, 15 Mar 2025 16:43:44 +0100, Christian Marangi wrote:
> Document support for AN8855 Switch Internal PHY.
> 
> Airoha AN8855 is a 5-port Gigabit Switch that expose the Internal
> PHYs on the MDIO bus.
> 
> Each PHY might need to be calibrated to correctly work with the
> use of the eFUSE provided by the Switch SoC. This can be enabled by
> defining in the PHY node the NVMEM cell properties.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/net/airoha,an8855-phy.yaml       | 83 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 84 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


