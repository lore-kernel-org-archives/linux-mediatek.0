Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85FCAC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Jan 2023 17:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kgv5xJTMYBes8sfoQjemKe9ruol1NM3cm77eq+o8GtA=; b=XdfKo9kamQ7ySgslaE+ITYGwmG
	AFqmfDzZhqWVpU5w44kB/gSmeu3M4HPiRgzSPITGYAK5fzCUzxmkB0Zaq6vjSdyKLlTUfXRDw0S2M
	I4Qbj46Itk2PZaY6KpnSC3mtQ1kIumCg973JRbmOlSZt0hAyikN3Ke8rsZR6UfKvvhnSc0CSi5QYf
	Ro8XVZhNXQuL3W9Lpac6nU1+yTO46RqMiGPBgntj39hHKVtGsk0F3qnLkJhHaqOjJutYxnGIAbrG0
	Hdeoci0s4ClLk/Y+/s8OoS/ONGt2jgMqjbC5dPLFOaLRf1Nakl9PPpkbvf/R2gQw21RzgRovqkXm5
	Kgit4few==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD7qG-00Aj0d-W6; Wed, 04 Jan 2023 17:46:21 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD7py-00Aioj-RG; Wed, 04 Jan 2023 17:46:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=kgv5xJTMYBes8sfoQjemKe9ruol1NM3cm77eq+o8GtA=; b=3MrjuwYl4M3hggJ3oeSipYUhcP
	JcFKuOrUOVWCOV0p2XQvxxySQ1xLU6ZCOWt/jW645tyn+dA/O/dsIHbi1YYt/V0SVbwS101jTcpqB
	yPXdIWDzzMtDYH/AZ0eU0sSWrVyI8cBDYqGNBp0ks6T+24H7I6BoW3Al0LgmbtSeZw5U=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1pD7pf-0019XD-5t; Wed, 04 Jan 2023 18:45:43 +0100
Date: Wed, 4 Jan 2023 18:45:43 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Biao Huang <biao.huang@mediatek.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	macpaul.lin@mediatek.com, netdev@vger.kernel.org
Subject: Re: [PATCH v7 1/2] stmmac: dwmac-mediatek: remove the
 dwmac_fix_mac_speed
Message-ID: <Y7W7R3J07ufApGbw@lunn.ch>
References: <20230104085857.2410-1-biao.huang@mediatek.com>
 <20230104085857.2410-2-biao.huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230104085857.2410-2-biao.huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_094602_907595_8ED4DCF6 
X-CRM114-Status: GOOD (  10.37  )
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

On Wed, Jan 04, 2023 at 04:58:56PM +0800, Biao Huang wrote:
> In current driver, MAC will always enable 2ns delay in RGMII mode,
> but that's not the correct usage.
> 
> Remove the dwmac_fix_mac_speed() in driver, and recommend "rgmii-id"
> for phy-mode in device tree.
> 
> Fixes: f2d356a6ab71 ("stmmac: dwmac-mediatek: add support for mt8195")
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

