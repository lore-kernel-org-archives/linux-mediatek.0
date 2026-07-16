Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA1CDC44512
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jul 2026 15:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XmkTh4nBmywdMj4d+gE3vGiM5cD808vx/icZxJquXbQ=; b=DuaCwFJrAL0ZwqvRUck9YaOrN9
	6SWWJTSH0M23bGt/ZSJr3EVXe+xXAVjNzNiDmHmWyPdsvbOjsNm5XwVd8bW9VRfLPYFlpupFUon2J
	HWxnvSV6STXv1eioleA1ipnFsxExrstT6j3eT7bWumBQYZ6zInsNiRxtJpnfncu+GTBiPndmFl4XA
	5NYz710De/hzI1Q8BWmCHRMQcgC0MnViaZSWwYHqqAQBniRJjuNTT7iq9+gNsmA4oIiWRPSVoIpQH
	UjjrbRUP/SsakhYZJbX4qfNytl1L6WOd6gF4Zyq9lqZzagKjoOr4Wn53/msqC5Fs50FeEKIb8tWUE
	axjTOVLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkORF-000000005uM-20XQ;
	Thu, 16 Jul 2026 15:55:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkORE-000000005tt-1rTg;
	Thu, 16 Jul 2026 15:55:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EA3EA43370;
	Thu, 16 Jul 2026 15:55:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC00F1F000E9;
	Thu, 16 Jul 2026 15:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784217351;
	bh=XmkTh4nBmywdMj4d+gE3vGiM5cD808vx/icZxJquXbQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZbJzWwhOKOayzVY7tzhzQQPJYEyygebk0aTEk99PP+vWsbOzTefHWNjLtbuyeY4bR
	 x4NRKtoUS9LREkHYM6KV9+GBQw3o7z5nZV8twpSWGR8DXZTrVPZueEaykP6esZKGi1
	 AvntLNZu67J5sw+N27AcHwBr9t6ZILZfBaVrUK+4rwqjjGPSVJpGZacxtWiYbtW455
	 YO7MbJWZTICm3YeaHI/jWYDXA1QnY88MkeBlpLcP9z61uBwdi7bR3tkM57itruOApx
	 rFo7wmnoeAYc2ACC+lRPZO4W8GdOpeF0C2zOYyBMB/7j6vvDmuiLYPWQfyh7l9T/iz
	 agJhbnEElJ9Lg==
Date: Thu, 16 Jul 2026 16:55:44 +0100
From: Lee Jones <lee@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Val Packett <val@packett.cool>,
	Julien Massot <julien.massot@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v9 0/9] Add support for MT6392 PMIC
Message-ID: <20260716155544.GD1424265@google.com>
References: <20260621081634.467858-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260621081634.467858-1-l.scorcia@gmail.com>
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

On Sun, 21 Jun 2026, Luca Leonardo Scorcia wrote:

> The MediaTek MT6392 PMIC is usually found on devices powered by
> the MT8516/MT8167 SoC and is yet another MT6323/MT6397 variant.
> 
> This series is mostly based around patches submitted a couple
> years ago by Fabien Parent and not merged and from Val Packett's
> submission from Jan 2025 that included extra cleanups, fixes, and a
> new dtsi file similar to ones that exist for other PMICs. Some
> comments weren't addressed and the series was ultimately not merged.

The MFD pieces look fine.

Let me know when you have the rest of the Acks and I'll merge the set.

-- 
Lee Jones

