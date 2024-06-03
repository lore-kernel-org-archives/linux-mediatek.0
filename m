Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91692C27C4F
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jun 2024 07:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xSHLT1riMQKLYlVbimJJW2KCvNugNUohHp75ae2hhLY=; b=ZgYD7SRAYHy9Jx+vl3X8lfnSHc
	DsOkSeH+/kCM5mNykVyqJWkCP01lMjTFWebK2tIu855+2rgYClPwtpKixm1c3WA/JXkhIzDgVAJds
	fsbWT71bTMMN4RV1B4eFyJ3mr0CwfS8H/eVvgI5TrjV/PMyyZeRmMRo5Fp32HxV30QZDb0NKmSahL
	wdnNpiIkekf1aXZfKSu5piAN/mPJtxTMuK7deBOcW3aHDbaW7TMTws503UjSoU3PhcO9ra+eYhtvQ
	QPqo1hrsSa9N3EPeecp8HnVIjvY0JLCRtKj9DvzI3CJH3V964dJr4tfMyL+BjJKm5RaLsF6Qx4j2v
	g+wjwhHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE2H0-0000000FvJg-0ibh;
	Mon, 03 Jun 2024 07:38:30 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE2Gv-0000000FvFv-0b95;
	Mon, 03 Jun 2024 07:38:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717400304;
	bh=F8wABEIFm4ftCXJGlbs2LKNX3obLSMHPBw/6ZJRDGYQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=sHt52mVBhqnmSbRl0b3A7BLBdIVMVfBxxNFjCraP16MKFwgjQcHJcXJJSODGZYVYb
	 0+a4TWy3h6Vi38dlDRsi9h4pvkGwIBmsPQwZaxs20q8ijKO6GEKK1gbiXT8myq4ekH
	 W85FjXl/SgaaNaewHpF2/Kk/RWeaCRRlUDfs1rI49nEIuYwNLq9YMBoZI43OecQ6a8
	 SyImWQu8yCADoV4/Nc8htepyupSyO1QCAcC7dYJIiYQEr2wMYprTHK9u6mMufKGRif
	 Pumzi7tYGiTNR9pfS24VtV9Y1uDHB4wlQq6ZBye2nJbSXKTOsQqqnDjJQUl8obm3YH
	 hctWpbKEkB5/w==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2C8973782190;
	Mon,  3 Jun 2024 07:38:23 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Lala Lin <lala.lin@mediatek.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
In-Reply-To: <20240514015154.11206-1-zajec5@gmail.com>
References: <20240514015154.11206-1-zajec5@gmail.com>
Subject: Re: (subset) [PATCH V2 1/2] dt-bindings: nvmem: mediatek: efuse:
 add support for MT7981
Message-Id: <171740030309.40780.15093772902291434880.b4-ty@collabora.com>
Date: Mon, 03 Jun 2024 09:38:23 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_003825_446450_89AABC30 
X-CRM114-Status: UNSURE (   5.43  )
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

On Tue, 14 May 2024 03:51:53 +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Add compatible for MT7981 SoC.
> 
> 

Applied to v6.10-next/dts64, thanks!

[2/2] arm64: dts: mediatek: mt7981: add efuse block
      commit: 299e71800214a7bae36733fb3bde5d37eb5e13f3

Cheers,
Angelo



