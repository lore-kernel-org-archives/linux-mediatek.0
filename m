Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1553C48297
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Feb 2024 12:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aq/q38O6lb9A1HISvXmhloWi+8h8rWtiHalgP/ljaso=; b=h2fw8sx3rvOjJ7VW2RipmJmvEH
	zOeMuqLRkMlIc/+B323XLkIPLYOaN1fwyKYt1MW/QtgUVSSa1DChrYf6VqC6BkN2ucX2ewYIr0uxx
	wN5t5VfxzQDnyaOnssTwIr7RbIwfp3GESOZkRD1kaf84wUYj+6s44/RughahEG7EmweHWA4hbSJ9M
	iFP+fWFBprNrjRzxjKsmcIoIGgqBTdLzejBZHeS+4zZ9aHciuqb/a/yE+2HONidnthr2sHdwSvG1O
	1bKsP1cAm15f9OpIloLbzcAfcbQMH93XqxH612GWXPJcnHpJmYcvzQBYzioCt9XHdBIfaeKkqsW9U
	pEREj6lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZVa7-00000005Iji-0Qtg;
	Mon, 12 Feb 2024 12:38:43 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZVa3-00000005IhY-0Go7;
	Mon, 12 Feb 2024 12:38:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707741517;
	bh=IvUTVsbo56lV3dtecdoGbuErbMZ4t5DkqNFX6mOYD/E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qFYXtEtCaKyiVr66/KlNRmFlhC7Qp980tPZF73BGBt7wckcOuxnqGy45as+NtmSRS
	 8FhDhOQEDsohYyLNYwX+wLWGkBKnzwOQ7UYd0mB4NjmqQlErDj0m9bVkcc2jHLb7Dy
	 AspW1UtLcIH2SfdREBvFaGogSeU7A8qYqn/phzMBmILPyu9RI3ZcqC++oztnpD8+x/
	 khev1kS4FHnqqSwp7bv764P6+1t3NIQTXasd7k6icMu7yWIUWYJ1DGPpmhTdF8BjcU
	 QtS6NG7yN/nD//Bnru3wewS/QX1CqPygfQ1eJivArN0hdJdHOABjT+e4qi36Ldil3W
	 aFv0BO/ZXh+LQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3A24C3781FCE;
	Mon, 12 Feb 2024 12:38:36 +0000 (UTC)
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
Subject: Re: [PATCH REBASED 1/2] arm64: dts: mediatek: mt7986: reorder properties
Date: Mon, 12 Feb 2024 13:38:28 +0100
Message-ID: <170774149167.16640.16616243802900743288.b4-ty@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240212121620.15035-1-zajec5@gmail.com>
References: <20240212121620.15035-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_043839_422860_0EB92C6F 
X-CRM114-Status: UNSURE (   6.99  )
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

On Mon, 12 Feb 2024 13:16:19 +0100, Rafał Miłecki wrote:
> Use order described as preferred in DTS Coding Style. Mostly just move
> "compatible", "reg" and "ranges" properties. In two nodes also move
> vendor-prefixed props down.
> 
> 

Applied to v6.8-next/dts64, thanks!

[1/2] arm64: dts: mediatek: mt7986: reorder properties
      https://git.kernel.org/mediatek/c/7eb133c9
[2/2] arm64: dts: mediatek: mt7986: reorder nodes
      https://git.kernel.org/mediatek/c/3f79e8f3

Cheers,
Angelo


