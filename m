Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 576F9E7717F
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Dec 2024 20:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yixcSNWS2aBo36Xmnl/o1huimUZFWZVKA3OcNsvF0Cs=; b=gtirfiIRgTD15vtJ4B2XoHI44/
	jCXg/rXLlMJzh2wUwkp1SdvIsz85U/9wD4CI1LKxddHi70lnuAxMLm3SaET3qYyuKotk5ROtXLbux
	zKSWm2zZI6RnB55aYNeYAiMn9iGd+7827HQAJ/62b2d2+YVs5ywQTj3TQnvEFk9ZmwIqHuYZvE+CY
	XKbyKTtbKEe48LvJK8PGGhWym1o5m5kNPla/+4S2gBtfq/tVuf5LeVSD67p41XRM2r+uYcNnjsC1n
	uA11fMrvXW3ivMbLst6qsdMe5/Myp7pgnrMtS0nStxys+xI53qqdF60pH09M6omFXPYLb1XPUuAph
	Xe2xd8gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNe3U-0000000EjJC-2EZU;
	Tue, 17 Dec 2024 20:20:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNdzt-0000000Eids-3NlI;
	Tue, 17 Dec 2024 20:16:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 303A95C2312;
	Tue, 17 Dec 2024 20:16:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7E1FC4CED3;
	Tue, 17 Dec 2024 20:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734466609;
	bh=yixcSNWS2aBo36Xmnl/o1huimUZFWZVKA3OcNsvF0Cs=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=WAMdd9LQsfnz9/vyEja4yJloAFGc52bQ/F69m1gk1MPhD//5uhhNSCb7guTyBLKBx
	 jn5bF9ciDbf6XDNwAskJmAPDrt/WqRELGrv8hj9RLmE3pM1mY1OdDWxq8DmUSfEhup
	 IPsb1ha8YP6IR97oL6/xSNlb84OvXaJoClafsO+6IMOHQabhsFS49jZCL6GGbw7HQA
	 Jx8ebFfgvVynhOMFym/IM64Vs/Ir/53xme43Gex/Ils144NKo25pg5HkVBGn3oxejA
	 0TJoK9FbDmD8mcohw+NLno0BwFCu0TFtqj9uvxojFSpfPBDOSe3SK2Urxa9IWHCHhB
	 82b6ivbv1rsnA==
Message-ID: <0c57146b35f7f15510220ca25ebf565c.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <9de23440fcba1ffef9e77d58c9f505105e57a250.1734300668.git.daniel@makrotopia.org>
References: <b126a5577f3667ef19b1b5feea5e70174084fb03.1734300668.git.daniel@makrotopia.org> <9de23440fcba1ffef9e77d58c9f505105e57a250.1734300668.git.daniel@makrotopia.org>
Subject: Re: [PATCH 4/5] clk: mediatek: mt2701-mm: add missing dummy clk
From: Stephen Boyd <sboyd@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, Daniel Golle <daniel@makrotopia.org>, Frank Wunderlich <frank-w@public-files.de>, Geert Uytterhoeven <geert+renesas@glider.be>, John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Miles Chen <miles.chen@mediatek.com>, Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Date: Tue, 17 Dec 2024 12:16:46 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_121649_883688_D6FEC107 
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

Quoting Daniel Golle (2024-12-15 14:14:34)
> Add dummy clk which was missed during the conversion to
> mtk_clk_pdev_probe() and is required for the existing DT bindings to
> keep working.
>=20
> Fixes: 65c10c50c9c7 ("clk: mediatek: Migrate to mtk_clk_pdev_probe() for =
multimedia clocks")
> Cc: stable@vger.kernel.org
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---

Applied to clk-next

