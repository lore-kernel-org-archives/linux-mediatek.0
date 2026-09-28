Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B81C98328
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Sep 2026 05:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T990KGr2rKx5jCUSvUS8jX/LmqLCPwnfvjmSkriKfxo=; b=XBtMORHABeqRku8IEf4zzfLN7X
	GvcGtw9Gmqs4dLREN6lAtj1GX6llMgX6AZD5Hh14C+BiyE5QGfwwXErC9cDJIXksqVhuhRGnMluBa
	Sr+QtzJilOFgBHr1y6oP56/KGd3zdQEKHYJcXQE9I/QTlXxXNMKyeg4tP3mwMMdhUTvPy1pr0LXM4
	hqCpYcIq8AF1rIHP8MJo4OwYpOV5mGJyy9x4p1M8W5iN0WEwoj55qbI9Q/VBPVYxPMLRM9rp0PHwN
	z2wQNBXj73mnkulE/pBKF7RmK7RNqDfEasSG4tP05bP6MFCbzpiUYSKRheT78qQ9PzRpFutJIaC+Y
	P8kXUhAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB3zp-0000000HMwK-2hfY;
	Mon, 28 Sep 2026 05:33:49 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB3zl-0000000HMvj-1uqn;
	Mon, 28 Sep 2026 05:33:47 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 483444E4102B;
	Mon, 28 Sep 2026 05:33:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 077BD604FF;
	Mon, 28 Sep 2026 05:33:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F3E97102F1E29;
	Mon, 28 Sep 2026 07:33:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790573617; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=T990KGr2rKx5jCUSvUS8jX/LmqLCPwnfvjmSkriKfxo=;
	b=HO6Z00u1RVNoE3+bxHzAY3LLITxQ86B/wuzjZUI5xqkdPFrhuYViyBh8lGV0EjqHjegsV3
	TN0u6iV6oowQLlQKkpRjZ0wrQ5OY2H9p5DP2av7N7GcEHSKxzqQaNQ/+Z+GsVyR8r6tmPs
	wztaux9g6NdGtKfV80D8Roi9zEgvUY5kaNtLSQAMe+RUWF1xIscA7WAyJHgJv++jjHEOtC
	Ny4+0qfImeaJXmWy11Z9GIX0ESUy0j90n41guE4Jchi0u+5PEBcXTorucZmmRQ3b5vJCe1
	+sSmYPBYlXUI+7fUx01JwzQnus0NMrPlmB4Oi5zEgx1QVExVsKchfBwxD2Umcg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Chen-Yu Tsai <wens@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Liu Ying <victor.liu@nxp.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco@dolcini.it>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Adrien Grassein <adrien.grassein@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Simha BN <simhavcs@gmail.com>, 
 CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>, 
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>, 
 Abel Vesa <abelvesa@kernel.org>, Chris Morgan <macromorgan@hotmail.com>, 
 Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260913123331.100293-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260913123331.100293-3-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH 1/2] dt-bindings: display: Use consistent
 indentation in the example
Message-Id: <179057359762.92994.13773102514654073802.b4-ty@b4>
Date: Mon, 28 Sep 2026 07:33:17 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_223345_667015_201A67A6 
X-CRM114-Status: UNSURE (   6.43  )
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


On Sun, 13 Sep 2026 14:33:32 +0200, Krzysztof Kozlowski wrote:
> Correct indentation in the examples to consistent 2- or 4-spaces
> indentation to fix dt-check-style warnings ("example 0
> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
> re-indenting entire example just for that is too much churn.

Applied, thanks!

[1/2] dt-bindings: display: Use consistent indentation in the example
      commit: 370c5d9004f8b754351981d59fc26851bf943e93

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



