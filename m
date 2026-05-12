Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98AB6CD4F24
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 May 2026 12:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jsPtOQasW8k+9b3C0qUS9XIReI7uglrW9r9rMSCGlSI=; b=NOAcoVDOIStwTMZiRCKHyrxOHn
	KqxwRib6jbjN92EKsgQo7sRwG8w5/0c7Lsv3V+Lh8y+Wq9cGSH1zJ6szeNi5rtOOQrM85VhkqVoDl
	hmdiqx8+u+0eTnvwzJjM06UJ6EYmomV+F7/KzbPQVavK7QmYmVer1n/lbWv+DtyNmLPX6hUXtR6Ww
	//Bs0QSjnpii3fniNOuQneBD360hKRF9ojQxpAI7AzRwOFe8DtJonLKN9dhqzmmszPgBILOm8Cjru
	HVJXXncTI9yNW8iWSGf2GQ7Yr0aDRCLM9+k6a/peqUbs5YdIgEvTCEn8EtaHAUNyceiLgnIXFz3a5
	p3DqofrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMmU9-0000000Ghub-2Bsg;
	Tue, 12 May 2026 12:45:17 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMmU7-0000000Ght2-0MGN;
	Tue, 12 May 2026 12:45:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=jsPtOQasW8k+9b3C0qUS9XIReI7uglrW9r9rMSCGlSI=; b=EkZYEnIACoO8PCR1nfN/0mrknS
	d4yEdrGvi3V5zEiGicUtSSl1ErgX8NMVqUxzjjEH+hSAz4IuC6jHzrcFgoPk0uF86THCHvRrzphhc
	Ksw/vyi1uYxjfCGkED9Wwrx94Ac8shUmNWmQfQkrZ5yA+Vq5GmX+8AAaH4zUaE2HWB2U=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wMmTw-002Xth-CC; Tue, 12 May 2026 14:45:04 +0200
Date: Tue, 12 May 2026 14:45:04 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>, kevin-kw.huang@airoha.com,
	macpaul.lin@mediatek.com, matthias.bgg@gmail.com,
	kernel@collabora.com, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v3 3/6] net: phy: air_phy_lib: Factorize
 BuckPBus register accessors
Message-ID: <25aea102-5621-4274-bd0e-f938b68a6da1@lunn.ch>
References: <20260512-add-airoha-an8801-support-v3-0-1edb34e363ae@collabora.com>
 <20260512-add-airoha-an8801-support-v3-3-1edb34e363ae@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512-add-airoha-an8801-support-v3-3-1edb34e363ae@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_054515_129735_FE3AABFA 
X-CRM114-Status: UNSURE (   8.81  )
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

On Tue, May 12, 2026 at 06:33:20AM +0200, Louis-Alexis Eyraud wrote:
> In preparation of Airoha AN8801R PHY support, move the BuckPBus
> register accessors and definitions, present in air_en8811h driver,
> into the Airoha PHY shared code (air_phy_lib), so they will be usable
> by the new driver without duplicating them.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

