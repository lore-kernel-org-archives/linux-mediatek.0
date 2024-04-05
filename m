Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCCE1C67861
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Apr 2024 08:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OdnAnoHn2mdru85EnkttQNnnov/eeBtXenkg60KONyw=; b=sEPHcfLcB5BiFz
	pntRNJmqNKCS3lpfg4ztbMn4xx7T0JmJmqUqXqG8NI6TmU1Lee2tSJ5lpqqm867TUmgVcnFwC+XB1
	qMU1J2oQboRvFyIJ/pCcC2x6YK4iu6C0UaoAdCZSFIfwK1P1TRPXJ4DIDRjtoc/SVOwhmPW1IVE/R
	GjLM7aXmLSyXVEu+tRQC8rVI5PwMVm8YoBq6Xq/lKb9qlDI6l7gxCRN0aPVwNxtrnQP58h7bo+qdP
	c85WlMdGNR0cKmff5n1g2oNCpV3RjxzfhondMfMzWVW+/JAdS+9ZLh6ZDy5MuZAGTpNOAXJdFQtIA
	+F1dKpgzHEe+dtZLuynQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rseWw-00000005qRs-3Jvp;
	Fri, 05 Apr 2024 08:02:34 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rseWk-00000005qIU-46kE;
	Fri, 05 Apr 2024 08:02:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712304139;
	bh=dk1AV/tMxCdJseJTFKfjUVE3T4iRp/NXN+zjwy+TBgQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=zhwSRWkzU3FhoLtWDElf7x0PqLoXTjmnR1qtcW3aj6qc6j6CLT+oazulwMoSmX2yF
	 LX2pektrxwZUfbjrsvwBg13udgwqrZXPT94gKy6HMt7YvTagjuCGS1HrsJx3a0Posm
	 f3hoJ1K9P61pyXWkEvk2nCrDb2P/tkCtT3JIlXFtNoBGN4NZNSYu3BvKwgWaUlnz5s
	 Pro2DwMoZSiaRmAjYLBUmvWXHcRQZ/Me0YuOyK2HDJ2r4W+aayXUuLN7fZsYtNj/GP
	 x5jRgavtgtLOXsnEM+chsdannp+IeGActJikaHLv7dDALcr27kE0ipxVNt5iWRT+Js
	 bWkfNFcP69LBA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 30A74378212D;
	Fri,  5 Apr 2024 08:02:18 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt7986: prefix BPI-R3 cooling maps with "map-"
Date: Fri,  5 Apr 2024 10:02:11 +0200
Message-ID: <171230386964.52006.161397169645189062.b4-ty@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240213061459.17917-1-zajec5@gmail.com>
References: <20240213061459.17917-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_010223_508254_C1F1141F 
X-CRM114-Status: UNSURE (   7.46  )
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
Cc: devicetree@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>, Lorenzo Bianconi <lorenzo@kernel.org>, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 13 Feb 2024 07:14:59 +0100, Rafał Miłecki wrote:
> This fixes:
> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: thermal-zones: cpu-thermal:cooling-maps: 'cpu-active-high', 'cpu-active-low', 'cpu-active-med' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', 'pinctrl-[0-9]+'
>         from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
> 
> 

Applied to v6.9-fixes/dts64, thanks!

[1/1] arm64: dts: mediatek: mt7986: prefix BPI-R3 cooling maps with "map-"
      commit: f8c65a5e4560781f2ea175d8f26cd75ac98e8d78

Cheers,
Angelo


