Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27BF2C79FAB
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2026 07:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GGafLjWZaxlFTTUL0ImDdGT6FHzvJIkporCTsCPLc5U=; b=n+xOKJFpVQ8vrQHGYk5zQfqOkA
	GQNdUciMMjqzUqH+KiuuoZJfh09srbb1Cl2hS0kTi+xsSsFGWH3bw9s3G37NlbgzOD0GyQ1GDqig3
	+gYoSQgXaiwLHVi/u944nFyTZQfxqeg0zVl270Zx82Hh7y6CCgm+mLSJ1aArzY/M/XV7kBEtYd0WP
	ZlZ8PjWDoVUE3ATcI7Jz/04+RghG2FXZauZFz+g2xiBX5IPUSDlQzhl6Jb3K+/AezdzpyoZL8Hcm6
	+/WSnR8HyRhT5El22JtCdiA7v+hAPgLQvbjh0obrAPJ8AcbaNQUO5dT3VAokNymTvOB5kgN+32r/h
	lRWX8e4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3q0c-00000008FIY-28KW;
	Tue, 08 Sep 2026 07:12:46 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3q0Z-00000008FGo-12qc;
	Tue, 08 Sep 2026 07:12:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788851560;
	bh=n4wzmFF7SsDyV4NZMeMh+gM4T/C/4j3ky2hmtVdkGGw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mf305onfTJPNvvfgOwdHkvoBvghccA7/ySxiUmYp91abroTUjTcBkaKszbnMm1E8U
	 BvALBlj4MacvtIc0X6hiwc/e3W8ZKQyxorH8XVQu4SNSYAQKq7QwZHSj6hPKghthQ+
	 J4cmqRDZbcHsmhpyAexZ9dKLUYR8/bqAj4v/R4zi2xWhFSmhWT52PARexug+fsS+bD
	 igJzYrMfZOnkqR94Io70X0ZCmjNRVI03Kj2cwI7PMDScDksTANCo3tb7oiCPvxFt3g
	 gCn2ZYWpHvulRVWpqODLZgKmD5dx1m+WkD5hn6Qh//VMbRCKAQKcqI3+ER0LYqsSGI
	 97Hd9MoRNPD7A==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9B9ED17E0945;
	Tue, 08 Sep 2026 09:12:39 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Brian Norris <briannorris@chromium.org>
Cc: Doug Anderson <dianders@chromium.org>, 
 linux-mediatek@lists.infradead.org, Rob Herring <robh@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Julius Werner <jwerner@chromium.org>, Conor Dooley <conor+dt@kernel.org>, 
 devicetree@vger.kernel.org, Chen-Yu Tsai <wenst@chromium.org>, 
 chrome-platform@lists.linux.dev, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
In-Reply-To: <20260904163143.v3.1.I33d1d66d4724587a981f706243cdc2f264670a40@changeid>
References: <20260904163143.v3.1.I33d1d66d4724587a981f706243cdc2f264670a40@changeid>
Subject: Re: [PATCH v3] arm64: dts: mediatek: Add #{address,size}-cells to
 Chromium-based /firmware
Message-Id: <178885155954.9724.3253834048320145225.b4-ty@b4>
Date: Tue, 08 Sep 2026 09:12:39 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_001243_454206_E7D70B94 
X-CRM114-Status: UNSURE (   7.85  )
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

On Fri, 04 Sep 2026 16:31:44 -0700, Brian Norris wrote:
> Chromium/Depthcharge bootloaders may dynamically add a few device nodes
> to a system's DTB under a /firmware node. A typical DT looks something
> like the following:
> 
> / {
>         firmware {
>                 ranges;
> 
> [...]

Applied to v7.3-next/dts64, thanks!

[1/1] arm64: dts: mediatek: Add #{address,size}-cells to Chromium-based /firmware
      commit: 69c1a4fd5272df1d745d6bcc3c613843ebecec61

Cheers,
Angelo



