Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 785B7E6FE2F
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Sep 2024 16:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YCzNIuC06O9GFpBj+rz7i/FoJaoTyZM/ftekjkxFq5M=; b=xN8dZyHI2l+HNPeFZ+KUKGjKIR
	T2iob2NgglCjvm8KhrZ35aZZbLYRT0ZhlEn9hZHirW3WWkD8LpJ3+ZMFFZWmXsaqmKTz6i/kIrWNM
	BUgKK7BhuIU1ydSlQKbAy7U4ZJeQi2v4ogs0UGnQskYprNoWMLjz4ZQUcAlkU24Ghz4/Rv2j0s+PB
	kDGCLqyYSY4m9by+0kQVhTqktR7THjfIlBL+Fu6BgI8dvpRdimZ1TJYdfDrYuM1cq/9oa7Wmf6Pp3
	YQl/ArNnljaEHP5bX7KuxcmY5PPPEDmGa6EkhE+/oQ1dHtlDEi/O1K01unvzIEigYuj464iDb16OO
	KRUgLVVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smbdK-0000000CvPa-0PGx;
	Fri, 06 Sep 2024 16:16:26 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smaUu-0000000Cetu-3Ax8;
	Fri, 06 Sep 2024 15:03:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 00735FF809;
	Fri,  6 Sep 2024 15:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725635018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YCzNIuC06O9GFpBj+rz7i/FoJaoTyZM/ftekjkxFq5M=;
	b=HqC7m+EFgPCjd836JQLxJJmHm80prF1dgL8sxE6fAr42qroDhMQBXdwtpFosb6wpPNsQCR
	IfuvCZbXn3iKIvMijAwzafQkCGIz95baZwVtzeVkxDmqKMkYnZZ69eCU/39m1O9bgIzKap
	wDRHyPJAHhTmStNvOG6/WaLdwrXVYJLMzWPAta5Z+W6WrWFBQj6xzLckz3E2eI440WRGgY
	GqN/Dv1Bf4id3WzmxlDDKi4Fnv2+12VO3veuLpXJ3KmrGKTv8Rnwo1vLW+8BiFzWGaDbPP
	sX1US0i2uG+MLavxLw0sAtEdk8BWGX2OrxhYlIZjVC7pXIfFBJPqKM2cRwdf2Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>,
	miquel.raynal@bootlin.com,
	michal.simek@amd.com,
	richard@nod.at,
	vigneshr@ti.com,
	liang.yang@amlogic.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	heiko@sntech.de,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	kees@kernel.org,
	gustavoars@kernel.org,
	linux@treblig.org,
	robh@kernel.org,
	u.kleine-koenig@pengutronix.de,
	erick.archer@gmx.com,
	christophe.jaillet@wanadoo.fr,
	val@packett.cool,
	christophe.kerello@foss.st.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	krzk@kernel.org,
	jic23@kernel.org
Subject: Re: [PATCH -next RESEND 08/10] mtd: rawnand: renesas: Use for_each_child_of_node_scoped()
Date: Fri,  6 Sep 2024 17:03:34 +0200
Message-ID: <20240906150334.734568-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826094328.2991664-9-ruanjinjie@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'f3b3c47ca41f696623e71596416d34fe1671d229'
Content-Transfer-Encoding: 8bit
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_080340_964354_08093616 
X-CRM114-Status: UNSURE (   4.79  )
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

On Mon, 2024-08-26 at 09:43:26 UTC, Jinjie Ruan wrote:
> Avoids the need for manual cleanup of_node_put() in early exits
> from the loop.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

