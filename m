Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20948E7717F
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Dec 2024 13:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=94wdfYrbjkarf+RqQpsl88LMXMnnZrJh9gzr4BX2sQ0=; b=SV/j0JS/DzojpE5laBxKboIet3
	6nLjkWiBNCyAWWW7lcwp+otVi6Hsd9wTGMMH9vdKV+aXzkaHm8Q5hGr8TCTIFuvi+BskQPVT0cCiL
	Bwd1dmy71KwSTdZYO+8/roMTOAYzcXDOjZwMIrbgDVCQFAVmfc3v030N7EQX6jX58HHBqyI92XUYj
	aqbYhrOMz6Vyuf03f/RaGPAzoh4/kpDiJuDEhg5aDtM5StND0LJxWWa1oeRcDooRMbC3d3xWVLeZ2
	YgoNoG+hEaxcbH2hpfVwuACxUpudbBrXS/p1wpcZUGPjaYOcrTGiR5qyR7iaxGKlQ5NGCJ2HrxQKv
	g7qGxTjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNXe3-0000000DaNO-1CaR;
	Tue, 17 Dec 2024 13:29:51 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNXcp-0000000Da3g-122h;
	Tue, 17 Dec 2024 13:28:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 97971A40A1D;
	Tue, 17 Dec 2024 13:26:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E987C4CED4;
	Tue, 17 Dec 2024 13:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734442114;
	bh=soBEwUKp/TZ/473ZrdtHyQgtSVUCeX0FYO1MpzpREcE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eyi0Dl5bg4YLGUgPvCnQwA1Obu/Zx5FvkT/OvNER7yr+lDynNdVytwWprQF8YWUVT
	 t+f+OANp2f1mOniOhEmLvLeT9Z7PDmeSkdZutOTayk6wIM6HNTsCHi3LV/EUDsNsfM
	 O6dbG/TONO/l5cdwcqVufr/GWPQWxQScnNX8sJubsWGjq41fhswFbtk0wt0XEme5eL
	 2KFNZFgG17iq4ywH+hDfy9Cx1zVgFnnpV8YoXTjMAVdeEu4T/ICfvWIa08QMROajiK
	 0vFVWkdINm8BkJO+DaVWgk5tD5RfyLBIuNOp1V+NsMhtc057qd0wwcjVfsw7xEYL4g
	 acjfey0V6nz9w==
Date: Tue, 17 Dec 2024 07:28:32 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Lee Jones <lee@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, netdev@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>, upstream@airoha.com,
	devicetree@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	linux-mediatek@lists.infradead.org,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, linux-kernel@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [net-next PATCH v11 2/9] dt-bindings: net: Document support for
 Airoha AN8855 Switch Virtual MDIO
Message-ID: <173444211136.1418557.12469782801691992405.robh@kernel.org>
References: <20241209134459.27110-1-ansuelsmth@gmail.com>
 <20241209134459.27110-3-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209134459.27110-3-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_052835_342666_D9B4B0E3 
X-CRM114-Status: GOOD (  11.98  )
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


On Mon, 09 Dec 2024 14:44:19 +0100, Christian Marangi wrote:
> Document support for Airoha AN8855 Virtual MDIO Passtrough. This is needed
> as AN8855 require special handling as the same address on the MDIO bus is
> shared for both Switch and PHY and special handling for the page
> configuration is needed to switch accessing to Switch address space
> or PHY.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/net/airoha,an8855-mdio.yaml      | 56 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


