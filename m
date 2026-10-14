Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAFDBCC6B1D
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2026 15:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N5peGRE7JeLBURqgzGuy+k2qGL/GVit3+SF1nIv/4lc=; b=fIpIgEL1UuFZPANgxCfHbdrq1n
	BdUhlPEi3Ox2qkEUUm+W7/275iIcfk0wYCtfdcNOZjmjiM9k2A6W6Xw1f+VzOYcoiX/5gxfERKQaj
	AHBOp3P9l8X5bBSmPYQ9ZGI938GY2V2Ta+n5AFJHLsIEHEqOgcKehdd3PcVIXsUYvU7bvuwasLjWY
	puHPW+NpfDiSppCdjI+hl8jBcUPwvjKGSmmTRFPM1R4u5zlSIod5bQ2jo5u3TASfdiFRhGySFYaYI
	s4w1fxOH2dvFLvza6o9eABEKXgc7ItW9i0EWbCnrmGOsatsIEfG6z9eVM21ANb/jenmY9tq7K+ZoK
	F2aQUp+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH0hk-0000000Fp3e-2diX;
	Wed, 14 Oct 2026 15:15:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH0ha-0000000Fp2a-3E6r;
	Wed, 14 Oct 2026 15:15:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E2BC3600DA;
	Wed, 14 Oct 2026 15:15:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA1C71F000C4;
	Wed, 14 Oct 2026 15:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791990933;
	bh=N5peGRE7JeLBURqgzGuy+k2qGL/GVit3+SF1nIv/4lc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=T60oS71/Ht1wcXsUw1LVY99TOkoYx847NJ87c4mHCcRFlwnqaAEffehrwK5EOuX9B
	 X9ImlNi1g414Oesf8LzSRtqdoTj1GMp0kc/x6/CL9eBjhtBilHpyvCE2WsDWuyycXw
	 GYglHtSwJerJJnusriLEj54SUSG3few8rwRcogxo9v5K7NEf0HhUxmi05Abdqhu3yV
	 QABEqxOVMSoh9MGxEc8R/mHbuYedZBaE09v+sI9H/Ku3Pqfg6VVC6TB32LIqpSpGHy
	 +aLTirQYPiIa/Pv5j8JnsFH4CeEF4J/etU6rPtkpxF3EMqbXmr//jiOexq8jROnEsg
	 ETRBGF1o+H52Q==
From: Lee Jones <lee@kernel.org>
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20260921232649.3132592-1-robh@kernel.org>
References: <20260921232649.3132592-1-robh@kernel.org>
Subject: Re: (subset) [PATCH] dt-bindings: mfd: Add MT6397 sound DAI cells
Message-Id: <179199093070.1189352.17803579225122726032.b4-ty@b4>
Date: Wed, 14 Oct 2026 16:15:30 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
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

On Mon, 21 Sep 2026 18:26:48 -0500, Rob Herring (Arm) wrote:
> Document the one sound DAI cell provided by MT6397 PMIC nodes.

Applied, thanks!

[1/1] dt-bindings: mfd: Add MT6397 sound DAI cells
      commit: 198f3bfc6658c2f1a75cf0e9b03231242cc711cf

--
Lee Jones [李琼斯]


