Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB0BBC48BC3
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Feb 2024 17:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V4h1fux6xfjrxOkdhpb48pXabVzlawmwc0RlDhxYiGk=; b=A1DakQRakBde1gwRLPKw900qoW
	zcjJGoA/oDASxW9Mke2gFFddBc0D0z8b5vRCUl7/o0hRWQT/R7LN7gtI6YsPXEfaKhXlMEA9bGlOR
	5skKhfsLaH2afO8MDj15zmm2hvxyb7jf64vXTMl1dvfy1ZvU5yL7y1RNsYw6vgzy1pF5Hn6kvXr7z
	/5uePlTykKkl9+Md3uMqPGJAFfsPIGgado9r8EbW9eYkFJ5Be5aLvh2rBWkVJBDuWytGqUQQYAFB3
	iLCJI46sDISXxkbfxrPTOfDmc4o8OpmKL80eNTfvlq0E2qxOELimyV5X3ikFkzAk9xp5yHUh5en2m
	oCJ+piNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raJWO-0000000DpUE-2jjL;
	Wed, 14 Feb 2024 17:58:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raJWJ-0000000DpQx-3YV3;
	Wed, 14 Feb 2024 17:58:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1F320618BC;
	Wed, 14 Feb 2024 17:58:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8B0BC43142;
	Wed, 14 Feb 2024 17:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707933486;
	bh=O6pRZuRL+P52lLJRfk2VJAJRJdaaIOt/DzPXTAga/fo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C1odWszCRzcHQNPJoWdBZCz4vsARycHIxJSZYbMEzn/dQVOlrZDiihzitCWjht4I6
	 RltR25Y4se3uxyDWa8TQyPv/15diajOSK3DJk9YvgisQZ0tgJ8bAVi3kdDDNKhzfOp
	 wKnHjfx2GQLzFm3QUEdVaxvauJgJbijuwtDW2GvC+DNlKT0UqSS2by/RJksOtBLB7K
	 uZALUjCDMGmyQ0TTeb2X92j1A9whF/QakfZan/K1jUn8AT+C9MZZYPm1LSLTbDBCWE
	 dFd3vHCrZ5ThbPpKQdqU+RpIZcmaLY3cE88p7wGVbukAgO3W1Qp73F1RtUQcMNNFmt
	 VgtYR9rd2Dkqw==
From: Bjorn Andersson <andersson@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>,
	Mark Hasemeyer <markhas@chromium.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Raul Rangel <rrangel@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	AKASHI Takahiro <takahiro.akashi@linaro.org>,
	Alexandre TORGUE <alexandre.torgue@st.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Baoquan He <bhe@redhat.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Benson Leung <bleung@chromium.org>,
	Bhanu Prakash Maiya <bhanumaiya@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
	David Gow <davidgow@google.com>,
	Frank Rowand <frowand.list@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Len Brown <lenb@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Nick Hawkins <nick.hawkins@hpe.com>,
	Paul Barker <paul.barker@sancloud.com>,
	Prashant Malani <pmalani@chromium.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Barnes <robbarnes@google.com>,
	Rob Herring <robh+dt@kernel.org>,
	Romain Perier <romain.perier@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Takashi Iwai <tiwai@suse.de>,
	Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Wei Xu <xuwei5@hisilicon.com>,
	Wolfram Sang <wsa@kernel.org>,
	chrome-platform@lists.linux.dev,
	cros-qcom-dts-watchers@chromium.org,
	devicetree@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: (subset) [PATCH v4 00/24] Improve IRQ wake capability reporting and update the cros_ec driver to use it
Date: Wed, 14 Feb 2024 11:57:34 -0600
Message-ID: <170793345819.27225.11284824552535043524.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240102210820.2604667-1-markhas@chromium.org>
References: <20240102210820.2604667-1-markhas@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_095808_032864_84EB4C01 
X-CRM114-Status: GOOD (  14.92  )
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


On Tue, 02 Jan 2024 14:07:24 -0700, Mark Hasemeyer wrote:
> Currently the cros_ec driver assumes that its associated interrupt is
> wake capable. This is an incorrect assumption as some Chromebooks use a
> separate wake pin, while others overload the interrupt for wake and IO.
> This patch train updates the driver to query the underlying ACPI/DT data
> to determine whether or not the IRQ should be enabled for wake.
> 
> Both the device tree and ACPI systems have methods for reporting IRQ
> wake capability. In device tree based systems, a node can advertise
> itself as a 'wakeup-source'. In ACPI based systems, GpioInt and
> Interrupt resource descriptors can use the 'SharedAndWake' or
> 'ExclusiveAndWake' share types.
> 
> [...]

Applied, thanks!

[14/24] arm64: dts: qcom: sc7180: Enable cros-ec-spi as wake source
        commit: f172a341ec1f66bac2866720931594e81f02ad4d
[15/24] arm64: dts: qcom: sc7280: Enable cros-ec-spi as wake source
        commit: a4b28b9ecc99673da875e214b1a06f1e0f0a24fa
[16/24] arm64: dts: qcom: sdm845: Enable cros-ec-spi as wake source
        commit: a7baa25bfbfdcd4e76414f29ab43317ded8d3e6e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

