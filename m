Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1FB6C54EAA
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Jan 2023 23:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UyaO3WR5aL8yEkRqNVSm+n33GhHMoZg7aozy4Wia9d4=; b=Oie9cOTgr8NfIYiBxqT3jQ7akz
	REJMFw2BRk8lmx0MwQ/8cVf4JRWUVrvxQ+fXt2w9vvNbzVq6XXdRBKOgCLzPovLfXKFzOJx7tPdw3
	6iel/OXw/5zTQTZN0BHek0L/lw24MCVK3VVji1W2Sn3VF0hGhSGtjC9TwyPdMPcnxo0rUY7pHWWGd
	WNuYGWe5hy0PzavDgcBY+6t7A2XMgSZpTHRe4N5DhD5yvrZ4pRUISZx1l1tCyWn6wEUAZVqfOEwst
	bPMnFtCzMkY1QFOdjqpAtbkM8vUc04bmC+mX8Kvn6LNtdXbJlZ1OtBa1EuBagBWa/hOa3uTNIkedL
	Ouj92J9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLY1e-00GpUb-Ip; Fri, 27 Jan 2023 23:20:54 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLY1K-00GpL0-7u; Fri, 27 Jan 2023 23:20:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 89139B82147;
	Fri, 27 Jan 2023 23:20:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 361A9C4339B;
	Fri, 27 Jan 2023 23:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674861631;
	bh=UyaO3WR5aL8yEkRqNVSm+n33GhHMoZg7aozy4Wia9d4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=R0iXXNKZTQq+HOgAa+/shUbeB1WBWpsW8L9+USEom4RNG2pjozXcEnmgYY6Wt7N23
	 o7GNy095skW/Vm/0pZR/LZ//INSeeZin3QJOTWeDD6C3nWnZoK/xiz17D91KENnQDa
	 fdLOVf+oZ4RPtWQkQ2mFGPaAGrMTbHf0yPpcU/PO4zEE/rV7nDNBUbS4UIZYs4wLTF
	 9xNfqq5WOJjXe3b6IvLxGtsmTo05m4C6r9kjJtsK7GByEY/sKUAQqOcdQ0sMKKSKfL
	 05k81wKBZB7Tp/fp3nxhrJpihKvCTOOcy/0Esk/qDAiFpnQJF6Si5ky0L5Bp7af+km
	 /054vMYwSPYEg==
Message-ID: <cb7ecbcfd5cebc81172003b77f2d2f3c.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230118031509.29834-2-moudy.ho@mediatek.com>
References: <20230118031509.29834-1-moudy.ho@mediatek.com> <20230118031509.29834-2-moudy.ho@mediatek.com>
Subject: Re: [PATCH v6 1/4] dt-bindings: arm: mediatek: migrate MT8195 vppsys0/1 to mtk-mmsys driver
From: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com, Moudy Ho <moudy.ho@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Moudy Ho <moudy.ho@mediatek.com>, Rob Herring <robh+dt@kernel.org>
Date: Fri, 27 Jan 2023 15:20:28 -0800
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_152034_536628_3E653B59 
X-CRM114-Status: UNSURE (   8.92  )
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

Quoting Moudy Ho (2023-01-17 19:15:06)
> MT8195 VPPSYS 0/1 should be probed from mtk-mmsys driver to
> populate device by platform_device_register_data then start
> its own clock driver.
>=20
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---

Applied to clk-next

