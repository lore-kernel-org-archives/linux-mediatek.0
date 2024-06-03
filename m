Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D42FC25B75
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jun 2024 07:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IxSDcXlcd/16iqzKYrUmjrK9gtVduFsrntGDnOXqEpE=; b=lhPen2IYKZX/Po
	ybqgVV5WuWttSdblYN1JavbmIad90gCKreTYwtjrecCJ2GHFuR5InaAZMyf3fC8OgVj2uYsJJINwk
	e3KmGhc3KjmifVXy3prp16Y4lI04EpOeIMrGES8D6wa3bQNMd8bdDo3G42cMZvliN3REa8YYUGDXq
	+tSjVUt+383PRuoIRIOo0HrlqjdQGBXZJzT94aeZrN0RUntJ70ohKRzKZHov/zM2bJi0/bvGdQ7Ps
	OzR0ySVRCJy0IvZTDTlttwM0AkqBAggfijhZq0zdQ16U7mUOZwVd7jYVhAWyHkbYnvU330dIQJvV1
	mCBiAnhQ2dU0+I4oMn9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE2U3-0000000FxZc-2cab;
	Mon, 03 Jun 2024 07:51:59 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE2U0-0000000FxYU-3LIR;
	Mon, 03 Jun 2024 07:51:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717401112;
	bh=UNGmFlIjG+IUgjY9/2P+gSGtwZOytRdfZTK8275Gdt0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=5LVGfTIv30xTmxae/jtC/qEtIh1xKmHlQBqe+vE/2u5F+lO+oiMSnk9o7iZwexD9n
	 x7I5TgBu5DEdJsje+vsAW4KERyBP+ko81aLax8XC/1VXYf7wdNRcBu1mDm9GZDStV7
	 IM3+VuHGhNC1i/bX7Ldz7FfDG65LBOQ/Y13cy9Du6Uu3vDdRwVLIejTL0LWhBFJtxa
	 TSzDZ0zwkTm6R3X+mN1MqVxXiGB/U7J5iuBnuZ5gN5S3CvZM+8rmD1C80GP9ffuEkK
	 +Uwk6c0PSCtuDmlNaVc6FNgwkfR2N5dPAaSX8Qk65vgSjBvxluJh5yp8lR0rPk62eZ
	 HpDkTqC0yXMTQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0FE7537813CA;
	Mon,  3 Jun 2024 07:51:51 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Pavel Machek <pavel@ucw.cz>, 
 Lee Jones <lee@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Frank Wunderlich <linux@fw-web.de>
In-Reply-To: <20240510095707.6895-1-linux@fw-web.de>
References: <20240510095707.6895-1-linux@fw-web.de>
Subject: Re: [PATCH v3 0/2] Add Bananapi R3 Mini
Message-Id: <171740111097.46559.14241820863717418080.b4-ty@collabora.com>
Date: Mon, 03 Jun 2024 09:51:50 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_005157_025268_7C6CCFEE 
X-CRM114-Status: UNSURE (   8.22  )
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
Cc: devicetree@vger.kernel.org, Tianling Shen <cnsztl@immortalwrt.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Eric Woudstra <ericwouds@gmail.com>, linux-clk@vger.kernel.org, linux-leds@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 10 May 2024 11:57:05 +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add mt7986 based BananaPi R3 Mini SBC.
> 
> changes in v3:
> - fixed unicde parenthesis in commit description of dts patch
> - dropped "dts:" from title of binding patch
> - added AB to binding and RB to dts patch
> 
> [...]

Applied to v6.10-next/dts64, thanks!

[1/2] dt-bindings: arm64: mediatek: add BananaPi R3 Mini
      commit: ca33f36216abe52eef8e660c638d8200e72251e9
[2/2] arm64: dts: mediatek: Add mt7986 based Bananapi R3 Mini
      commit: 07d7e57ea9d9491075820d447f140de9b6c3bd40

Cheers,
Angelo



