Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E5BC43458
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2026 13:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1zpxir8kPjpVYUNzqhODBD4/GTqr/OadsQZ2UHLHZvw=; b=iuezt3eDj4aol33j8bQIgQdbdk
	k1DOSX+vEI0RzcVcxXN1rtciWzsimA02ss74pWoBn2cGjVdMnOc2Tn+gkH9596f79EP/mGEZdVxlR
	Epu4FDKxDg52biK6smK0TQrRR/wK54Nvesj0m8qPcSJ5zacRKX/QORDQiSNzuL4EapaOa/MVp3vmm
	ZVH5Hex7kvDbzEcggcP4tr6TyGzJ9rmQbMqy0JXnWTZslSkKezJ/PG5hPkBb2Iyw0TDa3S4viYmjV
	Zbvqmpk+dJyYtdBiPJblaXR114C2ytnCZGDWcVRJtHojtqcOIn5v8Ot+Cj0zrMvqbFIubx/BqGFAg
	y0x3jQOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiBOK-000000051Us-0CUC;
	Fri, 10 Jul 2026 13:35:44 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiBOH-000000051Tt-1AFk;
	Fri, 10 Jul 2026 13:35:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=1zpxir8kPjpVYUNzqhODBD4/GTqr/OadsQZ2UHLHZvw=; b=QG
	36ZvFHiIJjY4iZpgzBPn4sD/3LNBfbSrTlVSxZguEOBGvjVpJsLEoDeLwaWS0FFf7i06H6y/X+s9M
	vTI4ayoY6WKZOW57/dqwlNzmLGoFWmomn+GR7HvTqCLovAZM/F29KvDcyNW/ixt19o+tCWH4KW2+G
	AQlQYrdWrrTFmV0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wiBO4-00BeAD-W4; Fri, 10 Jul 2026 15:35:28 +0200
Date: Fri, 10 Jul 2026 15:35:28 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Biao Huang <biao.huang@mediatek.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	maxime.chevallier@bootlin.com, rmk+kernel@armlinux.org.uk,
	kernel@collabora.com, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net-next 1/6] dt-bindings: net: mediatek-dwmac: add
 support for MT8189 SoC
Message-ID: <b7dc2135-e6c8-4b1d-a03b-c5258cbd7dc8@lunn.ch>
References: <20260707-dwmac-mediatek-mt8189-v1-0-17f345eaaca3@collabora.com>
 <20260707-dwmac-mediatek-mt8189-v1-1-17f345eaaca3@collabora.com>
 <b810b9cd-8f5e-4c9d-8496-908aae55dac1@lunn.ch>
 <8304b0a704c8db697767584b8c34388f07ba401d.camel@collabora.com>
 <6ea11726-8d50-411e-afab-da346e09ab9b@lunn.ch>
 <f85e08cf5e119e30ab4513e78ffa833fbe0832b7.camel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f85e08cf5e119e30ab4513e78ffa833fbe0832b7.camel@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_063541_316864_67666DD0 
X-CRM114-Status: UNSURE (   9.05  )
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

> I don't. 
> All the MTK Genio boards (510, 520, 720, 1200 EVK) I have are using
> RGMII only.
> 
> > Ideally, for a new device, we should not repeat past errors.
> 
> So, do you want I remove this clock from mt8189 clocks list for v2?

Yes, lets remove it, until somebody actually has an RMII device, and
we can figure out the correct way to do it.

   Andrew

