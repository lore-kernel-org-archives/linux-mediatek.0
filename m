Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66621C54E58
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Mar 2024 15:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rn2KWOIdwOHMbjL4TwkWOjHaCndUlMVo8VMVBOjAj1I=; b=l9WuiMt1Eqgwf+tNgexmWw/5TZ
	XidmfmOWELlDzHzyPbS5PXT7csgfJ+Bc8ZOwwq/JgbCVuPxZDsmAMYRXz66uRBHT/c7P1zLl/Cjo1
	kkw9xGB25RYfBnOAok+vN1R0sw9pjY/9j/blIfKBKxYcwVfss/h71nY2bmFW0A/dr5usLc4UJALyv
	+b59fve1c9MYsOCXQvLromAkgn2K5l0q6Mcut5/4v9sfq45XX/SajI9sDei1kuFMCAMXXiP04mEcM
	5FU4WwS4q4LWZywBHi9I/rIisWN9CpFYt9KNk5UdAbgC1dRIn0CejM0G2cjSX1mcJYaevJY0/wKjZ
	ZU7BwOVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl9pg-00000000ij0-2swF;
	Fri, 15 Mar 2024 15:50:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl9pV-00000000idV-3eLW;
	Fri, 15 Mar 2024 15:50:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E756A6171C;
	Fri, 15 Mar 2024 15:50:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F289C433F1;
	Fri, 15 Mar 2024 15:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710517844;
	bh=xfj7j+GQ7Sti6p2hkBc1aWmo4ct/8hye3RvIl4hZFm0=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=BhJj+8Mz9M5llBMgScSn5YkUAL9cdLRZZK4M7g3TMwhydFXsljRartldKhqIH4oXS
	 +Pb5xHX8QFdYnIfRcMrJAI268RIA4Iwh4PzMsreetLxFuxQaZj4dS7AGFWY2OTmB6Z
	 1ZlXEuJG9dZgAoawaaeadIC+oylkntnHdZBvkV//cKmfKjlJ4DE6Ufr5CxNG+L27Sr
	 KwlSpMZ8gJkaNPMg6Tj0QJ08kOmUa1I7QF+sPDtuZJiW3E115soMJ2YOhJoo1kPXsn
	 hFKG+M6lURjtzItHub+LV18gUPUWQKo2svYXiixPg+2d6tmVeQe/cS5i62B9tSyr8W
	 Wwg4xRusTj5IQ==
Date: Fri, 15 Mar 2024 09:50:43 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-mediatek@lists.infradead.org, 
 mithat.guner@xeront.com, Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 erkin.bozoglu@xeront.com, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20240314-for-mediatek-mt7531-phy-address-v1-0-52f58db01acd@arinc9.com>
References: <20240314-for-mediatek-mt7531-phy-address-v1-0-52f58db01acd@arinc9.com>
Message-Id: <171051664188.1380050.5483720270155658124.robh@kernel.org>
Subject: Re: [PATCH 0/2] Set PHY address of MT7531 switch to 0x1f on
 MediaTek arm64 boards
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_085046_025091_311E40F1 
X-CRM114-Status: GOOD (  13.38  )
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


On Thu, 14 Mar 2024 15:20:03 +0300, Arınç ÜNAL wrote:
> Hello.
> 
> This is a small patch series setting the PHY address of MT7531 to 0x1f on
> all boards that have the switch.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
> Arınç ÜNAL (2):
>       arm64: dts: mediatek: mt7622: set PHY address of MT7531 switch to 0x1f
>       arm64: dts: mediatek: mt7986: set PHY address of MT7531 switch to 0x1f
> 
>  arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts | 4 ++--
>  arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts             | 4 ++--
>  arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts | 4 ++--
>  arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts             | 4 ++--
>  arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts             | 4 ++--
>  5 files changed, 10 insertions(+), 10 deletions(-)
> ---
> base-commit: ba90af39ba57b3fe3ecfdba0c87a80d20c7b788d
> change-id: 20240314-for-mediatek-mt7531-phy-address-9d0b4cfeca21
> 
> Best regards,
> --
> Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y mediatek/mt7622-bananapi-bpi-r64.dtb mediatek/mt7622-rfb1.dtb mediatek/mt7986a-bananapi-bpi-r3.dtb mediatek/mt7986a-rfb.dtb mediatek/mt7986b-rfb.dtb' for 20240314-for-mediatek-mt7531-phy-address-v1-0-52f58db01acd@arinc9.com:

arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: switch@1f: 'interrupts' is a dependency of 'interrupt-controller'
	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml#
arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: switch@1f: 'interrupts' is a dependency of 'interrupt-controller'
	from schema $id: http://devicetree.org/schemas/net/dsa/mediatek,mt7530.yaml#






