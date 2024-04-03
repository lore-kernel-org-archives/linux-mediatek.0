Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A043BCD1288
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Apr 2024 10:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZFtlOkOmocvZrUc8qbddN6AXzwJ4i5a+T7tXDclyUEs=; b=L8AX15M+ZP2U+wdvVZ4MXca263
	dKiDXyDoAemnZJk9buaamKJ5Br6Rc6C+WFSQwyWVzp4dRwJXmqDnEe5h7wQvQLkvjJTXmxwMb5WyA
	1Ubvx8FLrakH9F5FQfSurzJyRHJhKgnYTzfe6Ds1MwIXrzg14byF0NnXmQLI7NMphwYilHG4ubgDx
	Egl75dRI2s5zSNQnpwEgC5NINcjVG+TxFBmMnHPgYWtH2wS9VBlALvjmj37lg1BuQ/ieK2jelD5UF
	UpXCCmqJqLcRhFaQfV8iu+AX8D66rLxE7r3nsyuQnqmiiyH4i7h+w7Goa3b1DLHUMnoVd28tbjK9q
	+Ddwd6Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrxu6-0000000FWo3-129g;
	Wed, 03 Apr 2024 10:31:38 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrxts-0000000FWcw-0B8E;
	Wed, 03 Apr 2024 10:31:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712140282;
	bh=Hk5lU1iRK1GgpT71qfZlp1fjEZfdR8ivceCWc2U1aU4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ww0vKXnZ4Fdy+6hX82DmeP34CR6MxyDteRTbdGGufT1Lr4UjrfUR4psPPuGgHI7oV
	 lbxhgjYtIHz49u4d/2wwgcXNWOKg74aYgPfi9zNagh5HbzjRSvB9m4GtR+Dt5RltIS
	 89U3mC1IQfTdLNxAZWN+g//VTfyAranewDfroAF13DH3Bgu2oZ5wV9MUCChh3fEBno
	 pb0yuoLn97UrzJCfQP2DL3Z4vRfdDGYgEzVw6HwGZLzl1cxvcJgBu/Byq9txeEkeQH
	 Bwa6Of5XmoKgeBaZmgJLnC6p/x+uG01poMnAN5QO42PRJFlqR0Ut2ov22RdMs4pjQs
	 5EnS8PcO+Guzw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8B9F137820F8;
	Wed,  3 Apr 2024 10:31:21 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	"Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
	"Nancy.Lin" <nancy.lin@mediatek.com>,
	kernel@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>,
	Felix Fietkau <nbd@nbd.name>,
	"David S . Miller" <davem@davemloft.net>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: Re: [PATCH V2 0/4] arm64: dts: mediatek: mt7622: fix some validation errors
Date: Wed,  3 Apr 2024 12:30:58 +0200
Message-ID: <171213179799.60933.1750718061760478051.b4-ty@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240317221050.18595-1-zajec5@gmail.com>
References: <20240317221050.18595-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_033124_282628_8ED6DB01 
X-CRM114-Status: UNSURE (   6.40  )
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

On Sun, 17 Mar 2024 23:10:46 +0100, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> One more step in cleaning up DTS for "make dtbs_check".
> 
> V2: Add "Fixes" tags
> 
> Rafał Miłecki (4):
>   arm64: dts: mediatek: mt7622: fix clock controllers
>   arm64: dts: mediatek: mt7622: fix IR nodename
>   arm64: dts: mediatek: mt7622: fix ethernet controller "compatible"
>   arm64: dts: mediatek: mt7622: drop "reset-names" from thermal block
> 
> [...]

Applied to v6.9-fixes/dts64, thanks!

[1/4] arm64: dts: mediatek: mt7622: fix clock controllers
      commit: 3ba5a61594347ab46e7c2cff6cd63ea0f1282efb
[2/4] arm64: dts: mediatek: mt7622: fix IR nodename
      commit: 800dc93c3941e372c94278bf4059e6e82f60bd66
[3/4] arm64: dts: mediatek: mt7622: fix ethernet controller "compatible"
      commit: 208add29ce5b7291f6c466e4dfd9cbf61c72888e
[4/4] arm64: dts: mediatek: mt7622: drop "reset-names" from thermal block
      commit: ecb5b0034f5bcc35003b4b965cf50c6e98316e79

Cheers,
Angelo


