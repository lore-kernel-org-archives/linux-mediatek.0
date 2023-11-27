Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59036C07D59
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Nov 2023 13:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fB6ke4pyt4vBeN9OdE79H9FF7sHZLATeI2LkrvvBG0M=; b=dJlkUlbWRGMKZ6RSAlVpxPaCCu
	qA1Qjx1J4mU0WzSgZtRtLsMZYKAu3j/2v0D6YPOfVyzF39Qf2Vpue/tpHKd4tqQSsKg67UYzgYBoA
	DdrmbbTQwGP2CnQfKZERXXmkUlOuIX6VgtSF9ujlAT0WqmxcL7dC+xtu9cdLF3OftIAa7zB72nreF
	6LdJo7dqddrsb8jLw64CkHlrqxdtdCaOl6b8qzXHguF8cymjIQIuaSH7i8rSOB82KssCGxTa7FZkF
	0YV/mqzcSlM14OcS3ajzVRKtmXDglaK9wvuM7bR7qjWac5UFUptcK6W+bsGUfe0xd39+e/ckuLd9W
	dqbPVZaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7bYx-002YJ7-2y;
	Mon, 27 Nov 2023 13:22:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7bYt-002YHJ-2a;
	Mon, 27 Nov 2023 13:22:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 424E160FC5;
	Mon, 27 Nov 2023 13:22:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E204C433C8;
	Mon, 27 Nov 2023 13:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701091326;
	bh=Vwhxnt4f22Jqm2f+no8vVvfxwUzvv6b9URiNaYVC1Z4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RpTMTTF6H5EZOoQo5s387IJVl+0oeBUdDVeSUuFoNbGG2A0Cc6+NH6nOaBJSfZZYt
	 GAZE9fh3lBe8TC1kOSdIcInp7kY6VNXTbxXscaP+EJdlTc0TUMSs5rLQTqYz4cT2hf
	 JisWVOaGzuDff8PWoXHjRbFkmanTQAihWGKe22Sre8Uxa4T8luPRRD4lGv1n0mSsAo
	 0gkhDeg4QQHDagB+mCkZBjTycS+ya9qCNKa80SS4GeWTEZ2ZzRYKACdS6wdWmwnsVq
	 oWOvW/utbVfXf1yBQqIJcB86J4CahpI5/+YXDutlZv92VQRvE1jyL8xuvWnS4UudsS
	 gzu/ujqknBwbA==
From: Vinod Koul <vkoul@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 CK Hu <ck.hu@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>, 
 Michael Walle <mwalle@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20231123110202.2025585-1-mwalle@kernel.org>
References: <20231123110202.2025585-1-mwalle@kernel.org>
Subject: Re: [PATCH] phy: mediatek: mipi: mt8183: fix minimal supported
 frequency
Message-Id: <170109132204.42536.9999917712237405775.b4-ty@kernel.org>
Date: Mon, 27 Nov 2023 18:52:02 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_052207_944443_36A9803E 
X-CRM114-Status: UNSURE (   4.86  )
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


On Thu, 23 Nov 2023 12:02:02 +0100, Michael Walle wrote:
> The lowest supported clock frequency of the PHY is 125MHz (see also
> mtk_mipi_tx_pll_enable()), but the clamping in .round_rate() has the
> wrong minimal value, which will make the .enable() op return -EINVAL on
> low frequencies. Fix the minimal clamping value.
> 
> 

Applied, thanks!

[1/1] phy: mediatek: mipi: mt8183: fix minimal supported frequency
      commit: 06f76e464ac81c6915430b7155769ea4ef16efe4

Best regards,
-- 
~Vinod



