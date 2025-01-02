Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB4BFE77188
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jan 2025 12:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qjU0DAyE2xkwdVinG3HfuKaiYEcjidIj+KHqSmD6EfY=; b=CyuxTaXmGsXY6K
	Bi7qbetDdbctkbHBf+ng89sVLMOwv630e7X6Ua6+OkGAcXBqW6tAluhC9fO4TWvu+lJm+81XFYu3K
	tvGewp+WZoYUi/PJxl8UwIidPL7bE29JUPBZWAMfPtjC9p0r0SYlcR8sA6sEK6o3XVlWnQGaQbCGG
	eGgJGvwVVekHWm0d97RztRXYU1BGgHggGlsiT4AEXjFrmCBhZC7ouyhLH8ZsAwuPQy53KSvKLFyvn
	f3IdlN4xZzN5vfUBttLyeC8pJ4yekyNYKg7JbGl0FPqAlcCY2UbGLyE44aRVVQNsfS0Seec4k+5um
	YsGCBaUiKk91Bc3OXB/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTKdb-0000000AOIk-07XM;
	Thu, 02 Jan 2025 12:49:19 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTKar-0000000ANcW-2NfA;
	Thu, 02 Jan 2025 12:46:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1735821988;
	bh=72FUVBWrQQnCtomgcxE42zRclUbcFxTmpog/5Q4KCl4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ldXWV4U3cIGQRbqjksatBKslAddDmHFOtczY35yI4KJyRl0CI9ALKFnzdbfb+WYZw
	 0de7V1DGbUtrQlGD/QeHe4Cfb8m0W+kkCHUnWnVWIYgQSv3dHh4ugtqdo35CL+w/gJ
	 RCRVHyhcPN3rwZ/BAqy9WczJiScMm+A/WvT89TdNU+rb7rbO//1fGfu5fdpXu+kywF
	 fRKrWf4hZzuKdVAWwKUg7UyodAYHvfO8mvreAoP04Ccxoeep+JkuYF9WqV4Mmo6+KJ
	 9B27YckRjZx3knoe0WIXsfq0hEJt3ntG8Yh4zE81hev1aH9/kwRe/n2gAWe8Dubq5O
	 GYy8SpERfZbEw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A4DE217E156F;
	Thu,  2 Jan 2025 13:46:27 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Frank Wunderlich <linux@fw-web.de>
In-Reply-To: <20241217091238.16032-1-linux@fw-web.de>
References: <20241217091238.16032-1-linux@fw-web.de>
Subject: Re: [PATCH v3 00/22] continue mt7988 devicetree work
Message-Id: <173582198760.163596.9230247633462116946.b4-ty@collabora.com>
Date: Thu, 02 Jan 2025 13:46:27 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_044629_819829_6251FDAC 
X-CRM114-Status: UNSURE (   8.66  )
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
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 17 Dec 2024 10:12:14 +0100, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> This series adds some missing labels and new nodes to mt7988 DTS.
> 
> based on pinctrl-series
> https://patchwork.kernel.org/project/linux-mediatek/list/?series=918572
> 
> [...]

Applied to v6.13-next/dts64, thanks!

[01/22] arm64: dts: mediatek: mt7988: Add reserved memory
        commit: d789c6aaefe9b23edcddaa736cd167b113171e48
[02/22] arm64: dts: mediatek: mt7988: Add mmc support
        commit: df6cfc7ce2c88943c9593a7034a18c2e16cf7b85
[03/22] arm64: dts: mediatek: mt7988: Add lvts node
        commit: c8368a5d7b990180a2f93a7f17695da23e317da7
[04/22] arm64: dts: mediatek: mt7988: Add thermal-zone
        commit: 38414fa65e38bffe64ed425fe2face87107e18f6
[05/22] arm64: dts: mediatek: mt7988: Add missing clock-div property for i2c
        commit: 4b306c10c902c61a6fedb5b36b6acd7dc7d94c3a
[06/22] arm64: dts: mediatek: mt7988: Add mcu-sys node for cpu
        commit: 6e8485a022deea5d18417af5d37354adeebb14df
[07/22] arm64: dts: mediatek: mt7988: Add CPU OPP table for clock scaling
        commit: bb90f43b8d3bc4214829573dcd001bd8a66aab9b
[08/22] arm64: dts: mediatek: mt7988: Disable usb controllers by default
        commit: 55c8d22c5b117e43be97ddde9b256301e598e6bf
[09/22] arm64: dts: mediatek: mt7988: Add t-phy for ssusb1
        commit: b5443e5080c57b07459873fa4a5287f4b2b2c464
[10/22] arm64: dts: mediatek: mt7988: Add pcie nodes
        commit: 8fa4fc0bb0e6cedec8c1c8e353323f7178b891de
[11/22] arm64: dts: mediatek: mt7988a-bpi-r4: Enable watchdog
        commit: 4242aa5ab0ad83d4379c4f189560a1766251db4b
[12/22] arm64: dts: mediatek: mt7988a-bpi-r4: Add fixed regulators for 1v8 and 3v3
        commit: 82af3f6028e6dbe3437539882b39c643c3c91d7e
[13/22] arm64: dts: mediatek: mt7988a-bpi-r4: Add dt overlays for sd + emmc
        commit: cf9b2081edcd8af513cfd11ccbb4c55b8cb10da5
[14/22] arm64: dts: mediatek: mt7988a-bpi-r4: Add thermal configuration
        commit: e945e2a9a1c507aa8b15e7282ae209c6507cc3ff
[15/22] arm64: dts: mediatek: mt7988a-bpi-r4: Enable serial0 debug uart
        commit: 070c7da3601987fcd9b301e9686d29bb00c80e3c
[16/22] arm64: dts: mediatek: mt7988a-bpi-r4: Add default UART stdout
        commit: c4329c5f5fccb7915db6ba2f38462262a361ee6f
[17/22] arm64: dts: mediatek: mt7988a-bpi-r4: Enable I2C controllers
        commit: 4ad665e1d614b48a5823cf8cd73c13ce1d958d8d
[18/22] arm64: dts: mediatek: mt7988a-bpi-r4: Add PCA9545 I2C Mux
        commit: 78397a31e333e1606d1e2a4720946c76ad8414a6
[19/22] arm64: dts: mediatek: mt7988a-bpi-r4: Enable t-phy for ssusb1
        commit: edfbe5e9809adc3c44869b4462ebb5dab08bf36f
[20/22] arm64: dts: mediatek: mt7988a-bpi-r4: Enable ssusb1 on bpi-r4
        commit: 80acfee3dc29bd5e3ca9a4d7cb645edd6441dee9
[21/22] arm64: dts: mediatek: mt7988a-bpi-r4: Enable pwm
        commit: ef3869173b931d4d400e3793764de99e953e87a3
[22/22] arm64: dts: mediatek: mt7988a-bpi-r4: Enable pcie
        commit: 16a2c22259d80579e1e495ee264d8797fda5b76c

Cheers,
Angelo



