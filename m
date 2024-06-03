Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F0FC25B75
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jun 2024 07:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7q6BzrIrzo+qMjrhZsDeoFIhBfWql1vbDwAg8w6Su9k=; b=UJ4BPvXyB023g0P+sDYjLcilwS
	6kBOVM7SnJYBXWKHgxmMLfgUt2xssYfPWhyvoFmFG6LyBfvJdaQN6t8kLorCkl9T1cuqeaiAjGkio
	4kFwIPjBanR3ocECPHN4J1sHeAZhsNERGUAKs1wDv60JyPrxyxRchCrFFMaFQ8N9+IAEyyysRlIYS
	rz/w6W7zvyqTAvE1XD8GrKgJUOeUJ0HkZ/Bdc8PC0H4YEXLqahB2fzmdNxcWhz1VaMMq+BH3jthMd
	tzVEUVf4Ex6DFXpgs5QmkXSdWZQKtOZfaEeohExy1ej1TREo2ZxpRfLs8fp9bj4a3uM/1psOivqTw
	evysfs3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE2Gy-0000000FvIb-26op;
	Mon, 03 Jun 2024 07:38:28 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE2Gu-0000000FvEs-0pBs;
	Mon, 03 Jun 2024 07:38:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717400303;
	bh=MO/bg2lUysHDnzNR2PasarKRJ1k3eMDsfB4gIHLqeU0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OHfCVhR1MDLQeVGUMvEwKtcbPbte26pJT4mSbfqrp2JjfFf4i0JAY16G8DBVbaSzt
	 KZup/Xr/CJX/d6zND+2HE80bOwtML+RApq3Olg68cKeHis4w2gCiwSvoZsHptwKFUE
	 wP0pFRTFFOvpvRLjOHu8pP0Nw8OPv6tlH9Lj1yjiQNhZJCfWzEMECoaPLhjdXKwnD3
	 LCXP1M7tEYUhFiZVUbc7rL1AOWvMya2QYc2dmarXPknL+FCV3RF3+Kmc8j5slvWSxb
	 KHmnNUzpSNXKlCGGu9W5qrlwqFCi7WKs6JSNM/+og8CPbJlOOJRL9EyUA1wZvkcX5+
	 0duIqufejkB8A==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4702537813CA;
	Mon,  3 Jun 2024 07:38:22 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
In-Reply-To: <20240405105030.24559-1-zajec5@gmail.com>
References: <20240405105030.24559-1-zajec5@gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt7981: fix code alignment for
 PWM clocks
Message-Id: <171740030220.40780.11151270257229150635.b4-ty@collabora.com>
Date: Mon, 03 Jun 2024 09:38:22 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_003824_391887_17E12C13 
X-CRM114-Status: UNSURE (   6.34  )
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

On Fri, 05 Apr 2024 12:50:30 +0200, Rafał Miłecki wrote:
> Align "clocks" array entries to start at the same column.
> 
> 

Applied to v6.10-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt7981: fix code alignment for PWM clocks
      commit: 8e062a6ccab30ee3775efe5c291d61ed7786b761

Cheers,
Angelo



