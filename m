Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80BD8C0015E
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jul 2023 04:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jeOGYnCzh3/QdxYYg6W9NvOoMsLabvLqVOJO86ZVrUM=; b=0YBSFfC+eJDA7mYwIR7YUBcS94
	RnK54LRx7YeawLlbnz+4d+yXHoHN0iarHR/jHZcNfgeECrNT9XdMv5FX02TUud/HTYmh8YbFItFLF
	/YvRoK5SMdaFNauVDUTLemFSwVULQ1N5eBF0RwAXb7pkvxNYecgY8tr5AunYbZnJCJQaOI4C3P3Y6
	Uc6Eg6K+grlb6oz50oiX7XiEhy2rUO0jZI3NhdY9zMG0RXlZ+K7qEycbx7LSClRAGdI8aOQQI4lf9
	cB2Ma+RLE7TnrDx0nUAohku/4yRqLmzepiknu2TZmo8NPBfMcSer3JAO2e6kjYZIE66umbGa90wGF
	0IaO4PFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPEjf-001Y9n-1u;
	Fri, 28 Jul 2023 04:05:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPEjc-001Y95-39;
	Fri, 28 Jul 2023 04:05:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B9CFE61683;
	Fri, 28 Jul 2023 04:05:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 910D6C433C7;
	Fri, 28 Jul 2023 04:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690517147;
	bh=2IkY25YAfB9fyvU9p02L4SvtbdbBgqTgi4g+lcXTQbY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iueYcCS8E8vePhJayUOPdgR1Md/OQ7L2LVyLS4zKXI4p8c0fCE3Em+d2KDcj8UEPP
	 YiatY3D2gUxoY0bCsZHnRPBuhsfVUkO7WixC7qqq/EjWlxdUvTtBkEAUKDG33pbID+
	 dcCVgrPJpGXmu1ppcd9lCkHD2SbQX9wQ0TRbuJZVaxJUyeZdLoJYWT6y+eLAokFkOi
	 mcBVbHHY8SO26FO6pCbG5gM+CfCiXwWKktKdkuffF//o9a7MLlGSvpgX7uQ+AyGpsn
	 oNZme42d6ZeyFnnFXwnMt/DtIDb/Hw3nozS0TFa50/e1jD83VS8cNOazmhAUQhpxAG
	 2t8D4lxTLAC0w==
From: Bjorn Andersson <andersson@kernel.org>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	=?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
	Tony Lindgren <tony@atomide.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: (subset) [PATCH v4 0/6] extcon-usb-gpio YAML conversion
Date: Thu, 27 Jul 2023 21:08:51 -0700
Message-ID: <169051733320.1270972.17486978837874639727.b4-ty@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230724103914.1779027-1-alexander.stein@ew.tq-group.com>
References: <20230724103914.1779027-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_210549_063593_E7E2B140 
X-CRM114-Status: GOOD (  12.07  )
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


On Mon, 24 Jul 2023 12:39:07 +0200, Alexander Stein wrote:
> after some misunderstanding on my side, sorry for that and the noise, v4
> series now includes now all the changes for the bindings and DT in
> individual patches.
> I've transferred the R-b and A-b tags to the individual patches in the
> arch/arm64 patches. Only to specific patches, e.g. mediatek, if sent with
> #mediatek inidicator, to all patches otherwise. arch/arm has still yet to
> receive feedback.
> 
> [...]

Applied, thanks!

[6/6] arm64: dts: qcom: Replace deprecated extcon-usb-gpio id-gpio/vbus-gpio properties
      commit: f648504139a6f91224276ab77be684ba3da649d2

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

