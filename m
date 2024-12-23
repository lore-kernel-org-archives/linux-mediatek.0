Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10699E7718B
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Dec 2024 20:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zUbroIZlTkGvv6BO0D4QjxXSmYlXysxTAWeeN4sPhms=; b=inXxDHIdYgb8Ir+yfMLvJBDudT
	W46YVOGSOzY8lIdtgdAiIG4LSwkQ4l5DUF6VEJZ68U5KYzPC4yuV6/6GKzxugxJ7k3JZhrJFZfZIo
	1G3ma2+xbV/7I6HF0rVuPM45NgV01Ez6nJU5PPR5kVv0u+x1zlI3JQ9qopexgOnEqXHHo81uKIBNB
	Eg+/RfLbVQNFYr7A52OSwx7cSnwPdo2ZfqQVy2kWMddWPt093oiU2DyuVq6HElo0CYZdXmkG6Qvx7
	KZfyj60/vwizRTn2BvbfwppCCtIGcTE6VuzKoL9oWFRRfXv5OgEhXYu/ZorAdgAz5lv5GHSEX9hQK
	oHUtCTLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPpV5-0000000AkGr-0poj;
	Mon, 23 Dec 2024 20:58:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPpRt-0000000Ajqm-3vGC;
	Mon, 23 Dec 2024 20:54:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8F0AE5C53C8;
	Mon, 23 Dec 2024 20:54:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0589DC4CED3;
	Mon, 23 Dec 2024 20:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734987285;
	bh=gqAN4owr6xSOyZ1XD4+SBBKn2IKtRuM2E1V4f6/L2pU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=IhGV613M9OvJ/Ac77vgz2FBe3pcr/9Z+ckG5voL5qXi1qPsReE2eHRyoLBDIAlAGc
	 KS9E5f5CX1+7hQX8mQjYZznjYWZ1eaL9ykQM4ITgbsZl9+RB0u3alhpu37yYpC/Jyq
	 Rnk5lA8LxHlnKVNwzEoDXT3jh8/SCb1Y2XW/GaXlYeGSQLnZc7yKI5f+BHvSZfrg5T
	 G5ZKKRqmrutfaBqgjbCXnJArn5bvhpIzjWS6NhaMdgJFIPT11hYUJnMXP+Z0TzZPLD
	 snR5do+Rfmx0T3qxuvF54rz29sq2Z0nQyVPN2OHaiMyLdAIq7HZzJzXb3fpBE+cnl2
	 uCXu5LRmKR4NA==
Message-ID: <00f7b2107977797288538249703ea80e.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241217-clk_bulk_ena_fix-v5-3-aafbbb245155@collabora.com>
References: <20241217-clk_bulk_ena_fix-v5-0-aafbbb245155@collabora.com> <20241217-clk_bulk_ena_fix-v5-3-aafbbb245155@collabora.com>
Subject: Re: [PATCH v5 3/3] clk: Drop obsolete devm_clk_bulk_get_all_enable() helper
From: Stephen Boyd <sboyd@kernel.org>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bjorn Helgaas <bhelgaas@google.com>, Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Jingoo Han <jingoohan1@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Krzysztof =?utf-8?q?Wilczy=C5=84ski?= <kw@linux.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>
Date: Mon, 23 Dec 2024 12:54:43 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_125446_020861_DE4238E3 
X-CRM114-Status: UNSURE (   9.45  )
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

Quoting Cristian Ciocaltea (2024-12-17 13:41:53)
> Commit 265b07df758a ("clk: Provide managed helper to get and enable bulk
> clocks") added devm_clk_bulk_get_all_enable() function, but missed to
> return the number of clocks stored in the clk_bulk_data table referenced
> by the clks argument.  Without knowing the number, it's not possible to
> iterate these clocks when needed, hence the argument is useless and
> could have been simply removed.
>=20
> A new helper devm_clk_bulk_get_all_enabled() has been introduced, which
> is consistent with devm_clk_bulk_get_all() in terms of the returned
> value.
>=20
> Drop the obsolete function since all users switched to the new helper.
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---

Applied to clk-next

