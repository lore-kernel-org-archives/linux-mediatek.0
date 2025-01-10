Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64CA4E7719C
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jan 2025 16:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K/XoRhGWdzQJK5f3HloKg8T4VrmHhx9Vve+PrvKJ//4=; b=bo9cuYzg90I6M6U92aUKJvgADM
	vAH9eOPHFNFxcknTfWaJBTnsi2yTgXF0xKruZMY38i8po1HNn+0ya9trI/EBghrIzVQz9V9KO8jU7
	QXlWvfJOd6LdBYlxlxrJUJgTzXg95S46xuso3D3mcTMGC0RVPW6WuJ2q0Ou+h/gZauiET8W2/e79a
	ckkCgF2SV4e8iItDEF081TrAM+1sRMB/SwAKfGXKIjN91ATM56WLRfE3S/6YsQQW+uYPfTWu67c7O
	K0iaepJdYqijGmOVssOZ3OoxI5OpNpfc9fy2BROuIBB9RLOrFtzCUeVobyS8tATPSpfGCjehCnmHM
	3LZiDm8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHYu-0000000G9wL-176X;
	Fri, 10 Jan 2025 16:08:40 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHAo-0000000G38A-43q1;
	Fri, 10 Jan 2025 15:43:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5D9D7A4256D;
	Fri, 10 Jan 2025 15:41:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44BC1C4CED6;
	Fri, 10 Jan 2025 15:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736523825;
	bh=TV8hH/0bAnpkstoi+VL/fkUNsub1wZaqlJIrE9SAU0w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lic+hpVt20oa1Er3C2FAYUyESVm4xI1R5bOB51Lwq0HcLGCnKiblgXYVwUJx+/x3a
	 cUE5/C15iWRWcxYhQ7FuprRryHpctO62F6THJqi2kKfvk+Cas5eVF9GJond+7Czs0d
	 Sq9ly8reE9HqyyBdXXjI0k88f1kqJDIhQFJiodC0JNkBeXYmpGF7K8ilc84gnppjoF
	 SObGl+J0WXIvuLoL9DwLURXjeeO8Y9vQ6JFj9FQST227QrX0RRiLxlawuiBkm+o9PR
	 EjrKls13caeEu3LbAmQPkHNAfWXJM9HbtT18cmZWIhTYGjs5UGCWbp1gXqVGH8hy5u
	 3+HsR8OYmgQAw==
Date: Fri, 10 Jan 2025 09:43:44 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Lucas Stach <l.stach@pengutronix.de>, linux-arm-msm@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jonas Karlman <jonas@kwiboo.se>, Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-amlogic@lists.infradead.org,
	Mahadevan <quic_mahap@quicinc.com>, Rob Clark <robdclark@gmail.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>,
	Robert Foss <rfoss@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, imx@lists.linux.dev,
	freedreno@lists.freedesktop.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Inki Dae <inki.dae@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Jonathan Marek <jonathan@marek.ca>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	David Airlie <airlied@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH] dt-bindings: display: Correct indentation and style in
 DTS example
Message-ID: <173652382248.2923092.2349362703621090098.robh@kernel.org>
References: <20250107125854.227233-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107125854.227233-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_074347_132604_EC45E440 
X-CRM114-Status: GOOD (  11.96  )
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


On Tue, 07 Jan 2025 13:58:51 +0100, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../display/amlogic,meson-dw-hdmi.yaml        |  8 +-
>  .../display/bridge/fsl,imx8mp-hdmi-tx.yaml    | 28 +++---
>  .../display/bridge/samsung,mipi-dsim.yaml     | 66 ++++++-------
>  .../display/mediatek/mediatek,aal.yaml        | 46 ++++-----
>  .../display/msm/dsi-controller-main.yaml      | 98 +++++++++----------
>  .../bindings/display/msm/dsi-phy-10nm.yaml    | 40 ++++----
>  .../bindings/display/msm/dsi-phy-14nm.yaml    | 34 +++----
>  .../bindings/display/msm/dsi-phy-20nm.yaml    | 36 +++----
>  .../bindings/display/msm/dsi-phy-28nm.yaml    | 34 +++----
>  .../bindings/display/msm/dsi-phy-7nm.yaml     | 34 +++----
>  .../display/msm/qcom,sa8775p-mdss.yaml        |  7 +-
>  .../bindings/display/renesas,cmm.yaml         | 12 +--
>  12 files changed, 221 insertions(+), 222 deletions(-)
> 

Applied, thanks!


