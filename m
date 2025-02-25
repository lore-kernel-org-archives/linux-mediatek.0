Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B384C021B8
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Feb 2025 09:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fg92aa/kHtkMczIbnbIzrAAnHS0WLVBR88K7lPcFosI=; b=Gw/5btkqWjGHtM1aWnRB4Mv8Rd
	KvDezNDk20PG+6gGh73T0+rkDNVWVPnnKmTPjqFJdISCBzjYYFULQ9gMraepmSD7b85iN99j3DpDN
	bD8sA+mibQ+iFqq8xGi5pBFm0hnVpIXmzUiGwjdtpTlVv//2puZzw7gMSF76wStOllAHEYvRBJ8kX
	bX3Wp3fNahYqQNf7AUdO+dN2783RnLsXRJCbNGbwfs3aC/aAqoPB9jLJ+qfgr8FX6JszEKueuRWEC
	Ucy/1wuSG4WxSvi4yPaFaq0MEUHZ7OoXuxeRZgD2+n/YNpi73iV/4dXo52AcNHtrX5cu7TcXKZyzH
	0MBisq7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrG2-0000000GamW-1VAI;
	Tue, 25 Feb 2025 09:29:42 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmqpo-0000000GUwY-1R2B;
	Tue, 25 Feb 2025 09:02:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740474154;
	bh=JZ65kyyb42EYs7pE3JmcICyKoed4JwUuRQyyeLuWluo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=I9iwetpJ/xmLEUngxZav8VV48HxmV3ZZI/mpK6muc09p+Y1KOfUmNWAcmcddE7MNk
	 UBw95YeRj19GLoZRZXQatGHCQ04Aq3YQ0QMemn3IP3ajiQY9kZLl8dzfr2TkhkkxFG
	 Uxg4WV5OlM4LZ/r/NjeSZ4mGTULvyKgZpXArZBU8aV+HeLuoiQRBql+DgMCrdt3xGU
	 iXjlZoQsFHldHP9ITwaEsKr8V4hpHS3JL+A82BzY4pp0s6wTaFWfYqUsL0E6xmUEnA
	 it69Q2aT8dVEuPrfN4SAofTtXBrvug/Qw6VcTcViEz2kgqB/1ulQcyCWls6sOye09q
	 ACrj7LQyRtz3g==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 74C9417E0DD7;
	Tue, 25 Feb 2025 10:02:33 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: ChiYuan Huang <cy_huang@richtek.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>, 
 Macpaul Lin <macpaul@gmail.com>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 linux-usb@vger.kernel.org, Chris-qj chen <chris-qj.chen@mediatek.com>, 
 Fabien Parent <fparent@baylibre.com>, 
 Yow-Shin Liou <yow-shin.liou@mediatek.com>, 
 Simon Sun <simon.sun@yunjingtech.com>
In-Reply-To: <20250224114934.3583191-1-macpaul.lin@mediatek.com>
References: <20250224114934.3583191-1-macpaul.lin@mediatek.com>
Subject: Re: [PATCH v6] arm64: dts: mediatek: mt8395-genio-1200-evk: add
 support for TCPC port
Message-Id: <174047415339.19243.12568175700223517936.b4-ty@collabora.com>
Date: Tue, 25 Feb 2025 10:02:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_010236_525640_61129203 
X-CRM114-Status: UNSURE (   6.54  )
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

On Mon, 24 Feb 2025 19:49:34 +0800, Macpaul Lin wrote:
> Enable USB Type-C support on MediaTek MT8395 Genio 1200 EVK by adding
> configuration for TCPC Port, USB-C connector, MUX IT5205 and related
> settings.
> 
> Configure dual role switch capability, set up PD (Power Delivery) profiles,
> and establish endpoints for SS (SuperSpeed) and HS (HighSpeed) USB.
> 
> [...]

Applied to v6.14-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8395-genio-1200-evk: add support for TCPC port
      commit: b232a43b5c60a0c994cb486792d4f4c80199052f

Cheers,
Angelo



