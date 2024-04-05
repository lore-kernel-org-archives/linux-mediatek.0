Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C1B8CD11C2
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Apr 2024 08:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5+eXF4HBartFvCzMNHY+Vj/1a7YBVUWvhSVbWuOHtWg=; b=PkoFlZgrB73V5V
	RHBe7jWg2CImhPn0OHYLkfSKMtwU4UDoMRkD/XxZlHMOiUBpVuuxIuLf0X6Zi9NQ2H7AiGGCnyo5g
	IAj8vJfdtP/8X165Vs62PaeDOWvBCrG1uG/BWETh4AHBfmNgq5rAhUpZEWYPVhp4hMiJorM7GYYes
	1urPP1yrCnsLdcdop+xp0JDmlEVnMIMTvvSCoj7Reu+FQRsdWF5IcT9Q3hBI/cJuhUKQb5xyRo/1v
	ozKH/iWeEDf2rFCsnkfP9qCI71t6wRGrGJgJoy7UlV82WAFLVcKtFbxwCQ09OyDgGKzK32xgNmUOc
	tQfxMVmQp1Ah+AJED9cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rseWv-00000005qR7-1nIo;
	Fri, 05 Apr 2024 08:02:33 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rseWk-00000005qHX-41j5;
	Fri, 05 Apr 2024 08:02:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712304136;
	bh=CjtjJtjRiqvhZdhjYHsoFltjRD2g3Zr+JWz9NxI7jIA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=0xc75gkMn8sFUlL7654mLLQOxyLz463AurAjag5uB+6FtKBMRaEG0QW5uK4C1xOWK
	 RkWBz4KmFkxujxbID+gs3Kf1M59ayEVw5cMkmJeDPyFmQpdUTlp3hEBjDQrozfan27
	 KHa/3eXacdMCzoa+sMgt36gaOrmBP/QNdDkqaC3hidmNmclhlj5INVsKs4gRZ/BEEh
	 U4lGDjTV1Rc3gEGi8w1w7FcMXwjRjT3QYlUPWpISnbCDuSxeuSVAymdesMEeqeS2s3
	 Fc+98rEXIQgJHvFsTBriO7mKmZ4ayV3oMOBWrnmXYmXGZWRvvgNTuSV74zatwb1ggE
	 71CLxQubw4o+A==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A1E17378212E;
	Fri,  5 Apr 2024 08:02:15 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: mediatek: mt7986: drop invalid properties from ethsys
Date: Fri,  5 Apr 2024 10:02:09 +0200
Message-ID: <171230386964.52006.14938631024589400868.b4-ty@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240213053739.14387-1-zajec5@gmail.com>
References: <20240213053739.14387-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_010223_613062_5DEA5B7F 
X-CRM114-Status: UNSURE (   8.37  )
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

On Tue, 13 Feb 2024 06:37:37 +0100, Rafał Miłecki wrote:
> Mediatek ethsys controller / syscon binding doesn't allow any subnodes
> so "#address-cells" and "#size-cells" are redundant (actually:
> disallowed).
> 
> This fixes:
> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: syscon@15000000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
>         from schema $id: http://devicetree.org/schemas/clock/mediatek,ethsys.yaml#
> 
> [...]

Applied to v6.9-fixes/dts64, thanks!

[1/3] arm64: dts: mediatek: mt7986: drop invalid properties from ethsys
      commit: 3b449bfd2ff6c5d3ceecfcb18528ff8e1b4ac2fd
[2/3] arm64: dts: mediatek: mt7986: drop "#reset-cells" from Ethernet controller
      commit: 9bd88afc94c3570289a0f1c696578b3e1f4e3169
[3/3] arm64: dts: mediatek: mt7986: drop invalid thermal block clock
      commit: 970f8b01bd7719a22e577ba6c78e27f9ccf22783

Cheers,
Angelo


