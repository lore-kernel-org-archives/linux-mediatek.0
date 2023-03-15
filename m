Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A37C7618B
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Mar 2023 23:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NsMHlgq+D3LzriTJzi4GOtvflWz8rAyV3kh/BT1wOPA=; b=it5p+spaBbju8G9NyQtaeYHYU8
	+RIqljHl23sRrKlY1TFwosVXAlg6NXRS5v8kN7VTTg7pdiu21qSApG0T0YhvC12S7uf2XMuXkjNUe
	yLuNtpNhGaEsjsryEaNXQBAitmqSq2HOcD6ZYCba0E3HtTYx+B+mNgZLrzxaRDtZastO8gUakqCQK
	owL37t5WsyCbnC7DZJRREVX+B8a333+tO5WsKic/pe0J4NwChIGC2zWLcE2xWLnvs9MNvXsCzm3fR
	KfIzzZXo2HFocRWeJ4UbuQjjJc2FqmncSvgxgDaUj3LzQPdz6XRiinBhdzhy2HvsOTSRE0Biod+hQ
	xY0HpMpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcacH-00Eijz-1h;
	Wed, 15 Mar 2023 23:33:09 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcacC-00Eihj-1F;
	Wed, 15 Mar 2023 23:33:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0A96DB81FA9;
	Wed, 15 Mar 2023 23:33:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD3EEC433D2;
	Wed, 15 Mar 2023 23:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678923181;
	bh=ZW0cW6j0eZ3LRxXMTCWZrrkIV3axsHJnqHcZZpwnlco=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DQEoGlYRaWYHi/3uI8nc0LhUk+/xLW7zzvBumLCc+upwsanoVQoyggJaMNzHIBAah
	 dUqX7NTdlqtNqmVH/DkhNlmdhG2TDo8lVKgqn9b4iqOz8VxYmzIKSA6ocnC0RE5iVF
	 gCDXLOCIQ9m3MCqH92jKnf66VpJfg28tUC4YFJRgv4WmV+H6ZpiS4GYhkT0Ulh7v6k
	 0P0eiOIcdIton2WyhrGiY3/0QMrCKisubp+rlcPe4QhNIGfYkwOLPEua2qEBOr2RK8
	 0lW00iPAGST7rIrGR+59BXC9kt6+CZ3pQcxZeLVFPF7TYXG9jP8MadTZ9rbSwtx0/w
	 ga0o2PgaBXBEA==
From: Bjorn Andersson <andersson@kernel.org>
To: Tero Kristo <kristo@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Michal Simek <michal.simek@xilinx.com>,
	Nishanth Menon <nm@ti.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Andy Gross <agross@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-tegra@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-omap@vger.kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: (subset) [PATCH 00/30] clk: Convert to platform remove callback returning void
Date: Wed, 15 Mar 2023 16:35:30 -0700
Message-Id: <167892332563.4030021.12717582908504193989.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230312161512.2715500-1-u.kleine-koenig@pengutronix.de>
References: <20230312161512.2715500-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_163304_571161_92A67EFE 
X-CRM114-Status: GOOD (  11.73  )
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

On Sun, 12 Mar 2023 17:14:42 +0100, Uwe Kleine-König wrote:
> this patch series adapts the platform drivers below drivers/clk
> to use the .remove_new() callback. Compared to the traditional .remove()
> callback .remove_new() returns no value. This is a good thing because
> the driver core doesn't (and cannot) cope for errors during remove. The
> only effect of a non-zero return value in .remove() is that the driver
> core emits a warning. The device is removed anyhow and an early return
> from .remove() usually yields a resource leak.
> 
> [...]

Applied, thanks!

[22/30] clk: qcom: Convert to platform remove callback returning void
        commit: c4dc24da5286742f8cc728379f6115c9e886a8a4

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

