Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C4CC369B2
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Apr 2025 10:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wsp1puB0zNy71zdVoQZjhun+Ti7usGR6dz7/1r/9yCM=; b=YJKP7fCJlQP/TZeHAc6p7feqAH
	U6Th6H5gdMQr0RPvJBd2KDBF63nXm26bEiAZG4gJFcDuugY7lNsbALrh7MjMj8OuWImteUSpAElVM
	NBGz1k+Kn6LaUF9X87FGQU5oTDvwDe+TJXUbnvFDdfMoOqVJtMMkMWDUR5F/VTWEoUNnO5Dsy4Zub
	JyRYqLjVs/70+46Ms5Kia3j1gZKnsbde7UEFT0PJpMxSdH0Rf1Za2sdIbWJGzwCWi54grlRFJEIPk
	Xi+jKxpHLAHqyT48Iekin+z34qz8ckQBR3KtfnbSIog2IsT0eZSYdmnsOhFPRaQoxT5zZldqLV4FH
	4mA0xXuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Ge3-00000001O8s-2kdq;
	Mon, 14 Apr 2025 10:02:27 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4GV7-00000001M8F-1EQR;
	Mon, 14 Apr 2025 09:53:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744624391;
	bh=bKZzCz1CP3LH33ZWeRUb98lubrqCg8Gf2ftBfHQfUf8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=J0Hi9utXN+SQeCL6FtSw1u0vQ/IJ7bHX3zsvMrbSevV8Bx17zvJIPGpvG4PgOkOxT
	 VUl1Or7hLJxk6YeWxufmDSM4NAO8HI7mGLfqR2nsGaiZguW6cf8ou+uqe83WuvnVmJ
	 eZYINYeNP2FaZs9tO9P5j2wAGWj1fSGb0RtmnQyjRJ0pX7hhDusGfcA9yejD67NOkv
	 lp7uIn7bK0W4FmikU/blQCjisp3cCebP/8/gagdsTllvZJ8hUjET5e5nM3LYj2YZ57
	 TYBM/wzQyKC/KwAkMGVNw/PbXsRaAnoO9clceCsl4FXbBS9MTFgCSnDvym20Iw4WHs
	 KilYVQZID3QOA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 63DAA17E1134;
	Mon, 14 Apr 2025 11:53:11 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 =?utf-8?q?=C5=81ukasz_Majczak?= <lmajczak@google.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20250328121300.2612942-1-lmajczak@google.com>
References: <20250328121300.2612942-1-lmajczak@google.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8186: starmie: Fix external
 display
Message-Id: <174462439133.45420.7264628017920404731.b4-ty@collabora.com>
Date: Mon, 14 Apr 2025 11:53:11 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_025313_474678_882F825F 
X-CRM114-Status: UNSURE (   9.29  )
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

On Fri, 28 Mar 2025 12:13:00 +0000, Łukasz Majczak wrote:
> The dpi-default-pins overwrittes the same called node, defined in
> mt8186-corsola.dtsi with the wrong set of pins, so remove
> it from mt8186-corsola-starmie.dtsi as the first one is correct and
> sufficient.
> In addition, remove dpi-func-pins node from mt8186-corsola-starmie.dtsi,
> as it is not used anywhere and also defines the same set of pins as
> dpi-default-pins node already present in mt8186-corsola.dtsi.
> 
> [...]

Applied to v6.15-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8186: starmie: Fix external display
      commit: 7d346bf124282d0326dd4f1b104b2d07d902ef23

Cheers,
Angelo



