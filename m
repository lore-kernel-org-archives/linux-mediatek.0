Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B583C4829B
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Feb 2024 12:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/EZcrFK+F754JhqoVMch+9KbvIU267SfZBRbJG52mBY=; b=rqJqKpHZ6v5zjLtBrifQr5K4V8
	zqGyknElp6TVT6Iu2shJdXf1Xdc2zSUEwKCovdD4I20h/IAuHnp3BhB3sucxbEEUM9pjFHKFyxeJx
	brdnAbIdAVZpeQjAXLV8CGwSh0OI+fDYFez8QjSgL5E3cU9jSJMc3NiIfdxj6JiB8r1Y2Ch0xfLl6
	zxKNEGxFPeTX92lPKbCZXNYx5BrJPD7JoGKEtu1gs7TooFLsNUnIZc3Pg1oxRX8/+bsVx3oT86Xr4
	3ToTpK3U0PAvMOax0W7oIsMVOHDQaH2qEoD+JMrfPt1A/hUnnj4quXuZCU2XP+OKYzpvOCtK4XTpF
	19C1yZ4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZVeS-00000005J5w-3p1P;
	Mon, 12 Feb 2024 12:43:12 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZVeP-00000005J5K-0iUt;
	Mon, 12 Feb 2024 12:43:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707741787;
	bh=1dir5fid+1BGP0VzNCQXLya74RU+ai/AxGeDGbyKkeI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=5YwFMP4DeWXpV3MmppPdhv2otz0AfjEV7858thCkMLuKqGmypoif0Iz8KJeT+IfZ8
	 QGPobwUqn4zjrPBD5pWzblbaqnNK/l9gyQ6fQTc7RqJANoxKMitTv5YcXh3jy6enJG
	 EleRoF+czMspoV1lK+DQWuDPau1a54bnaSqzTdYB+wmAtU5XszxrGbNkI9w/CjuLAH
	 pDpaK4JXX1aH7gVglI5ZBeikBCVc5jqE3X1okUPernMgQ3T4dZBXWHfE3OXWx6eqSa
	 2gHQW9v1a0K4BOSDFRitrTSKxjyK5HtrIZn2lDqKpoWF4xdiLroqjZjHJbhAa+gtZ8
	 MKfxcgAKeYcNQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 105AC3781FCE;
	Mon, 12 Feb 2024 12:43:07 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: Re: [PATCH] arm64: dts: mediatek: mt7622: add missing "device_type" to memory nodes
Date: Mon, 12 Feb 2024 13:42:50 +0100
Message-ID: <170774176471.19382.17605326667599843858.b4-ty@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122132357.31264-1-zajec5@gmail.com>
References: <20240122132357.31264-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_044309_356998_2E68CFEF 
X-CRM114-Status: UNSURE (   7.55  )
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

On Mon, 22 Jan 2024 14:23:57 +0100, Rafał Miłecki wrote:
> This fixes:
> arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: /: memory@40000000: 'device_type' is a required property
>         from schema $id: http://devicetree.org/schemas/memory.yaml#
> arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: /: memory@40000000: 'device_type' is a required property
>         from schema $id: http://devicetree.org/schemas/memory.yaml#
> 
> 
> [...]

Applied to v6.8-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt7622: add missing "device_type" to memory nodes
      https://git.kernel.org/mediatek/c/99d100e0

Cheers,
Angelo


