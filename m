Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E074BC5AC67
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Aug 2026 13:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=phhTzL60K0GYV8Ub4xF5Zw997M9eAMmsDvtg1hwuGlk=; b=NWDuhlJgnQOwifwOIlCv1v6enb
	6UWO9n6SUYIxMEPXBTjo3fG0QFAlGc3LmUNS98umJIFG6kKWKeBtzRbKum2+kCfrJqVqg4Lx03pJs
	wUGlOSnI63+64YE94sWnN6MYI9P18ugRGHX96Ahy6G4aCDf7l0vGHtXHhBKO5KPgAiQwqmLnGUJ6p
	Z4VujmEWJ2vVS829x5NrwZYafl082INvZlKZg1wjv/iV1w6X2KDambQlV/kRz1cn7z1JnlNeWfE5m
	Ub+RWJKFdL+W2mIwCwY+jqNKEa86MYW69rIsm6EVd7oVWkwabiWUwuQFmmHS3xpAKx4wYA6x0ixfu
	lpjE1rDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtmti-0000000E8Md-3Xo1;
	Tue, 11 Aug 2026 13:52:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtmth-0000000E8M8-38Fx;
	Tue, 11 Aug 2026 13:52:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 55B24406E6;
	Tue, 11 Aug 2026 13:52:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1210C1F00A3D;
	Tue, 11 Aug 2026 13:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786456325;
	bh=phhTzL60K0GYV8Ub4xF5Zw997M9eAMmsDvtg1hwuGlk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VSEuZbNramUZ/vh5AcIst7DMicGcUY4lthiLgHZboYkBEfgwDdMmJzfhg/Dfb88sr
	 zJJc8DmKlrjaH94MJV5KZ7DqkTPIbnzCTZFsFN8ayYTbBNrrb+SapZj4RHOKVyYSUw
	 M9iNrmsQX/MEf/EGviZJYyxLea0bqMdYr+D4dYTsitc12lb6ZgyvBvlFKgG62S8Kf9
	 yBWQfN+gQ8CDKlRn+3yf+lPXYAHomfE+89f1G2DNOi9PBwLunNcQArzMrt9g5PGDAs
	 b3rj03EMSO//IsP8JwC9GD/fiueaSGbiVEe2bo5/7qoDdpIK3zMXRU6DIywdEyDO8d
	 DLshxKWX/FFjw==
Date: Tue, 11 Aug 2026 08:52:04 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>,
	linux-mediatek@lists.infradead.org,
	Brian Masney <bmasney@redhat.com>, Stephen Boyd <sboyd@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: clock: Correct white-space style
Message-ID: <178645632389.2072234.6959201411927643233.robh@kernel.org>
References: <20260801195540.235298-2-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801195540.235298-2-krzysztof.kozlowski@oss.qualcomm.com>
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


On Sat, 01 Aug 2026 21:55:41 +0200, Krzysztof Kozlowski wrote:
> Correct a few white-space issues, like double space after '=' or before
> bracket '{' characters, which will be flagged by dt-check-style.  No
> functional changes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../bindings/clock/mediatek,pericfg.yaml      |   2 +-
>  .../bindings/clock/st,stm32mp21-rcc.yaml      | 140 +++++++--------
>  .../bindings/clock/st,stm32mp25-rcc.yaml      | 160 +++++++++---------
>  .../bindings/clock/xlnx,clocking-wizard.yaml  |   2 +-
>  4 files changed, 152 insertions(+), 152 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


