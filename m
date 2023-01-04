Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0AB7C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Jan 2023 17:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=51JWEtL51uZkMSKZQzz8aCVC5Ar8jlQKIe9WJDNgho8=; b=mCuA1SYUa8/8rYyf5/Z2zaFjdq
	KBJ63i3YX8Qu5s3Ap1gsIikXyiBpu+LhwqzzcjGzaMUceOnEdC1ihpOtIREjmA9vfPEZvJzkG5syc
	DJV08WoJGjMdyB1Um97IOErwArenyhVXuOwUNQfrpFQKFrwYaeWN2PmWqD3KoTtsmM6wvLpGkxtHD
	m+8oG8YeOT62g7e6qA3qCuXH4VpZGHNPIh9h/ByR0PhQ2vFUkN55xKJBWhzjvBikR7h4BeHNE7cEI
	fJWf6tA8zcMkkXvnFbYJ0XOyZjCci2x5/vwXhrR1zB2xow6Dd7r1DQ4KpVVEPv7EwbSTzd+GLwcUs
	1K+0EPLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD7r9-00Aje1-DU; Wed, 04 Jan 2023 17:47:15 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD7qx-00AjUn-Cg; Wed, 04 Jan 2023 17:47:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=51JWEtL51uZkMSKZQzz8aCVC5Ar8jlQKIe9WJDNgho8=; b=CgGxXt6mHQSHAN6pa7dXYhJ6Yu
	dfEbs0hUu1zaAfKTn1BrjyqRcVHzJ4OKPDb/yrQ0ElEOhyW7GRQrOp0yf4oRsUrt5d39dpWXRFmOQ
	ll8VNEqKsf8rCJaYhJHJ/TNvM9yxXuwEuXB9ulFK2vyfjyyacem8QRch/KR/LoQGeWV8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1pD7ql-0019Yg-Gc; Wed, 04 Jan 2023 18:46:51 +0100
Date: Wed, 4 Jan 2023 18:46:51 +0100
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
Subject: Re: [PATCH v7 2/2] arm64: dts: mt8195: Add Ethernet controller
Message-ID: <Y7W7iyzW75rjzt3U@lunn.ch>
References: <20230104085857.2410-1-biao.huang@mediatek.com>
 <20230104085857.2410-3-biao.huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230104085857.2410-3-biao.huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_094703_465681_038BBDBE 
X-CRM114-Status: UNSURE (   7.89  )
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

On Wed, Jan 04, 2023 at 04:58:57PM +0800, Biao Huang wrote:
> Add Ethernet controller node for mt8195.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

