Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D00FC07D59
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Nov 2023 13:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oIBS/PG9aoGaFxIGzNKEBntCJzHi0WIbi3RERMHnwrY=; b=YtxfeT8ZLPT+Vexm8hsrjBdxvy
	9HY0y/GZAnAfU1CsMzAD8AWP8yNtD/2kLPVvuKUKmjnWJTQSlJ1xPVhsUSnk2VSI2lXXLLT9we7s4
	KGQVGaCIE7Gk1QFu+c7yG5fwXpoFqIhVECJn3dsZbgyP2mgsL7FE3gLheXlPGJrnZjTq/QRW++yd6
	jraVY40bj8PgfPk+N2CiCHwv+bKyml0xPaFCld6sna50BB8J+Ll6MzvlMMJ5V3PCCG2wNRNQ9tp4/
	f6PSmn6jn32dC37hMjfKq3m7J9DCz+xQCCtU/ht6nODTWIwEf1cwKbhnvSVYQWbVDmp2JnlmLfM1q
	TiyVV7LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7ba1-002Yp2-0R;
	Mon, 27 Nov 2023 13:23:17 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7bZs-002Ykr-0o;
	Mon, 27 Nov 2023 13:23:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D1FE6CE11E7;
	Mon, 27 Nov 2023 13:22:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21A3AC433CA;
	Mon, 27 Nov 2023 13:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701091372;
	bh=GAarMoewnkwJp9XLJQmcej2YbN3Q4NV+hfVw+jdVqdE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=po8G/Jd1b5AVxwfM7ACP6l3yi12wgDzzx5ru7waF6zgVpdZN39rWzCrIOAWLsSdGm
	 N9rZ1yj6R1P8kCHvJxyS5qGtRQb6iJ2l0GWZZJX1NrpZ5vIIlaCiRyPOf2N7MPcGbD
	 JU9imQ+VOMoYL2lj8HVUDSL3qTSApsBVQo45xWuJuaHk9+GyNhQiXfC2+RzX1ZNe5v
	 AwlPtiHDdiwSonfwUeMkwxVLD9Wkvylt21nBNInPfQXgLORhP09ns4ptcDk7zF9wCV
	 2DTCdcNfSFdjw0xMEDAkbNPZpDgSo0NLtK7v+0PkxrbhKZ/uZdNyNOu3a2ij+Eq9yA
	 LWjaZ/qRhA8OQ==
From: Vinod Koul <vkoul@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>, 
 Michael Walle <mwalle@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
In-Reply-To: <20231123133749.2030661-1-mwalle@kernel.org>
References: <20231123133749.2030661-1-mwalle@kernel.org>
Subject: Re: (subset) [PATCH 0/4] drm/mediatek: support DSI output on
 MT8195
Message-Id: <170109136570.42627.4378174652499590897.b4-ty@kernel.org>
Date: Mon, 27 Nov 2023 18:52:45 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_052308_646021_FEF0F29F 
X-CRM114-Status: UNSURE (   9.30  )
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


On Thu, 23 Nov 2023 14:37:45 +0100, Michael Walle wrote:
> Add support for a DSI output on VDOSYS0. Luckily, there is a new
> feature to support dynamic selections of the output (connector).
> Use it to add support for a DSI output.
> 
> Apart from that, this is pretty straghtforward by just adding new
> compatibles and add the correct DSI nodes to the SoC dtsi.
> 
> [...]

Applied, thanks!

[2/4] dt-bindings: phy: add compatible for Mediatek MT8195
      commit: fa50920b4f82993941e0aac349eb8081ce11e38f

Best regards,
-- 
~Vinod



