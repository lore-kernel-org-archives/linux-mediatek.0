Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D191EE77184
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Dec 2024 20:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fODY4GbeslrRf8S2Td9p5PvayYul9ddz8tUOiCrByLA=; b=PJIZEWZWag060larUAt5YzP5k8
	PrcBrDkJYVDJs4lhBOPpD3WEpzDdYvbiS/NcHqeySx521OSQu4DPxZIyChMNbNzX62BSSrVfsZa0c
	A6QtiuVCR8QeQ9ZGrxej5PPfKTC1nQK24jAZNvXW3Yyn8yky/pBIsHh1/s+4saEmaTUelTTO5Veyg
	RcqrE8PtnZ9xVa9uEVrTUv5nh+JMkC3FBsFgk8tSB5f/XQ99mw5x/9lAwKuFrRBJa3DCR8jjz2YQ3
	ctvPE319j8enaqmdsQwBO9WOIkdB6uQ2tMdzgmSNmeIp23vDMySoPUvGF0mzvomlTTmmamvmyYLNQ
	dKYx6KuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNe0I-0000000Eiho-3BNa;
	Tue, 17 Dec 2024 20:17:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNdzD-0000000EiXH-1RbV;
	Tue, 17 Dec 2024 20:16:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9AFC75C4808;
	Tue, 17 Dec 2024 20:15:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A32CC4CED3;
	Tue, 17 Dec 2024 20:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734466566;
	bh=fODY4GbeslrRf8S2Td9p5PvayYul9ddz8tUOiCrByLA=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=aP8a9f910Ja4dw8BV2TTr0n9+MpP8HTdRvXGsc7A/YPIeS3e57iQ9UC+LXr7/FR/x
	 2I1ky3YkWMCAp4ASZzdPPs+vkTFO13wa0TWX/DXwNa1Ul8H/87ThecrDWno2HTwPja
	 hzpjiem/JVHBwXXs1IsF07EZu9x1NwVXiER7/MP8g69qMxpZZeGhHTTLynb+ARgvG5
	 VCfl8DP//km1DhC0kJmMJWAXGgL1MXP43qHpP8Y0S1/xNT9yM5GH5PZxcUPUOMKaQI
	 2PmfFi6J3aquuG949y/AloQJXy9Ce/Fsx+z9qjqTxv8ISoYc+msfAVQYG8cDRvz674
	 xzmjTukVmg51Q==
Message-ID: <fab3fb3ad72809ef2ab94098b18eae73.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <b126a5577f3667ef19b1b5feea5e70174084fb03.1734300668.git.daniel@makrotopia.org>
References: <b126a5577f3667ef19b1b5feea5e70174084fb03.1734300668.git.daniel@makrotopia.org>
Subject: Re: [PATCH 1/5] clk: mediatek: mt2701-vdec: fix conversion to mtk_clk_simple_probe
From: Stephen Boyd <sboyd@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, Daniel Golle <daniel@makrotopia.org>, Frank Wunderlich <frank-w@public-files.de>, Geert Uytterhoeven <geert+renesas@glider.be>, John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Miles Chen <miles.chen@mediatek.com>, Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Date: Tue, 17 Dec 2024 12:16:04 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_121607_433556_16D3C795 
X-CRM114-Status: UNSURE (   8.82  )
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

Quoting Daniel Golle (2024-12-15 14:13:49)
> Commit 973d1607d936 ("clk: mediatek: mt2701: use mtk_clk_simple_probe to
> simplify driver") broke DT bindings as the highest index was reduced by
> 1 because the id count starts from 1 and not from 0.
>=20
> Fix this, like for other drivers which had the same issue, by adding a
> dummy clk at index 0.
>=20
> Fixes: 973d1607d936 ("clk: mediatek: mt2701: use mtk_clk_simple_probe to =
simplify driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---

Applied to clk-next

