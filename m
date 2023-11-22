Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1796C61D97
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Nov 2023 10:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yR95/c3w/szrDscTRCWgMPJylCJl942MhjeAefJHcnE=; b=z97zuWOQVda7ow5XdebHCdp+pF
	EixCpUzW/kEDc2mddd/JS+46x4KG5ey21C9ZPQAu14zkISKVgAnRRX5LG1p+7DtSjQ5zKqnrzRLK5
	jk8xMsk+x5HuWw/uwL4qXKPvSLuhdnl3yy22BIEJmDDQFMplrw2OYFerXxSx9lVsBeGg+Di9ET6qK
	ETA7WV2g4Cp719ICB/WdqQO+Pe7pmx38g9LVPKNslC4nKwMsXGwianJcURSS3Mn5C0Buz5vj3WTni
	7SYLHeDI2kZ4uNxPDTg98R4FWR1YfkxSpPlJpLdYOwG+OY3tbFwybtvHK/gTO97/+IpsO4gtZGRyY
	SbJKhXQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5kg1-001S0l-2d;
	Wed, 22 Nov 2023 10:41:49 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5kfy-001RzT-04;
	Wed, 22 Nov 2023 10:41:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0D674CE1F03;
	Wed, 22 Nov 2023 10:41:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AC6FC433C9;
	Wed, 22 Nov 2023 10:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700649703;
	bh=s/dlsgjmV9/Gjv6PkVsXWK7wZO4UsNtqC33jkUQSkdU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pllgEhGfESNKJ4y1QCO3/xtPQtzDsfLDrTZwVJb7dcjgSp04X70lfQTsdvCyTBqq2
	 rYZsJYXe3umDXe2CtsvCRCJ6nQXEZVx99lQ7tSu0Z4+ZZblCV7uVGdQJHLNNodeS17
	 cTS6UfNn/VytfQbekcqYu3wC+qsHYkWeWlY5Ydj8xyAT6v7hN7pIzAviS6jy7cyeWb
	 aYCuvcW7rfhQxCcK3AR2rbLVLbDyQdftt2Km+Kr9XkC4NFheaSpUDSxtqAhIFNnMkn
	 ZMR6kHVKaeGic5UxLn807ZRZheNfV1AJvB6cYoZbazYVtg1zEKxr4xMixJGHWurBwT
	 dOFXA/tf/3Ddg==
Date: Wed, 22 Nov 2023 10:41:34 +0000
From: Simon Horman <horms@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	David Epping <david.epping@missinglinkelectronics.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Harini Katakam <harini.katakam@amd.com>,
	Robert Marko <robert.marko@sartura.hr>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [net-next RFC PATCH 04/14] net: phy: add initial support for PHY
 package in DT
Message-ID: <20231122104134.GA28959@kernel.org>
References: <20231120135041.15259-1-ansuelsmth@gmail.com>
 <20231120135041.15259-5-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231120135041.15259-5-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_024146_456379_9214E17C 
X-CRM114-Status: GOOD (  25.65  )
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

On Mon, Nov 20, 2023 at 02:50:31PM +0100, Christian Marangi wrote:
> Add initial support for PHY package in DT.
> 
> Make it easier to define PHY package and describe the global PHY
> directly in DT by refereincing them by phandles instead of custom
> functions in each PHY driver.
> 
> Each PHY in a package needs to be defined in a dedicated node in the
> mdio node. This dedicated node needs to have the compatible set to
> "ethernet-phy-package" and define "global-phys" and "#global-phy-cells"
> respectively to a list of phandle to the global phy to define for the
> PHY package and 0 for cells as the phandle won't take any args.
> 
> With this defined, the generic PHY probe will join each PHY in this
> dedicated node to the package.
> 
> PHY driver MUST set the required global PHY count in
> .phy_package_global_phy_num to correctly verify that DT define the
> correct number of phandle to the required global PHY.
> 
> mdio_bus.c and of_mdio.c is updated to now support and parse also
> PHY package subnote that have the compatible "phy-package".
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

...

> diff --git a/include/linux/phy.h b/include/linux/phy.h
> index c2bb3f0b9dda..5bf90c49e5bd 100644
> --- a/include/linux/phy.h
> +++ b/include/linux/phy.h
> @@ -339,6 +339,8 @@ struct mdio_bus_stats {
>   * phy_package_leave().
>   */
>  struct phy_package_shared {
> +	/* With PHY package defined in DT this points to the PHY package node */
> +	struct device_node *np;
>  	/* addrs list pointer */
>  	/* note that this pointer is shared between different phydevs.
>  	 * It is allocated and freed automatically by phy_package_join() and

Hi Christian,

a minor nit from my side: please add np to the kernel doc for
struct phy_package_shared.

> @@ -888,6 +890,8 @@ struct phy_led {
>   * @flags: A bitfield defining certain other features this PHY
>   *   supports (like interrupts)
>   * @driver_data: Static driver data
> + * @phy_package_global_phy_num: Num of the required global phy
> + *   for PHY package global configuration.
>   *
>   * All functions are optional. If config_aneg or read_status
>   * are not implemented, the phy core uses the genphy versions.

...

