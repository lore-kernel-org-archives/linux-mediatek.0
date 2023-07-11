Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20028EB64DC
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jul 2023 07:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ap4ZBNc1JcyrfJuwzziwFEw3FcVn4mNxWLq5XgG+4LE=; b=mjutBR+PSA9CcPwNgBxJwcCVj4
	V8yrxmypOCh8FrEqBmsD5rXssEQOPC7uZZcUiJ4rWo8SzorAZn+mMQZR/D07kZ/45WyPeiep1vP7h
	HtrnEQ4cuSZb66j1n01kTah3jOZwubXI+1HUyYgdtzbmECkdhp88Dfuf/u7wM8foFTGO6e127Kc2g
	od2KT059qb5PRjZHeoWEpUAMSWuny1BubVny8PZRqBN66hART88YS6n8Vd4/qhUmF97+uKtvOi/3e
	e32bry3uFAVR9HTTIBGMBY2IxV4HDK49csbi4Lz4QrQss1JtZogsvGA0/gTLMKyZYUAjEhHzIS3Mn
	/92fF8Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ7vm-00Dzxh-1x;
	Tue, 11 Jul 2023 07:37:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ7vj-00Dzvs-0e;
	Tue, 11 Jul 2023 07:37:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 81F9F61356;
	Tue, 11 Jul 2023 07:37:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A4AFC433CB;
	Tue, 11 Jul 2023 07:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689061021;
	bh=sEqwyC3FyD2dOA4vxfiDWqxyPw9GpNWDE8xdL9GWS8k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=lzWAGfwJ3WXJRoJqVVRC2LoK90eGLluOqf9+gyAmFoLR3DayjC5FLLMNlkmHja7uM
	 9ZWJOelSTbJ0ZKnwYTdNkmbkTLLjhX0dI5jitBr+OSxLtXmSaP2K/qmbBqpa3y2wOL
	 E9mhSfXV5f6KBMr7h2H84hxLwTh1DiQ/WGJnMy4W+tmUGedpwSegYHWT40zNVlEuat
	 j80R0N3i6MZHoe4xxgFAy/MOh0PWwg8D1ayd3F78ksjtKXKRgdWromIW+gsro99ms3
	 aMcCDOGhjwRaCRcZnQorRHcgMDjYsvBm+tqOYy3phQUoHjTl2H9TmWUNP5d4TNcnzi
	 xsA5R313fOuZQ==
From: Vinod Koul <vkoul@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Guillaume Ranquet <granquet@baylibre.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20230529-hdmi_phy_fix-v1-1-bf65f53af533@baylibre.com>
References: <20230529-hdmi_phy_fix-v1-1-bf65f53af533@baylibre.com>
Subject: Re: [PATCH] phy: mediatek: hdmi: mt8195: fix prediv bad upper
 limit test
Message-Id: <168906101764.188690.7974991611736783323.b4-ty@kernel.org>
Date: Tue, 11 Jul 2023 13:06:57 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_003703_281658_C4D2F4D7 
X-CRM114-Status: UNSURE (   6.57  )
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


On Tue, 30 May 2023 10:43:07 +0200, Guillaume Ranquet wrote:
> The pll prediv calculus searchs for the smallest prediv that gets
> the ns_hdmipll_ck in the range of 5 GHz to 12 GHz.
> 
> A typo in the upper bound test was testing for 5Ghz to 1Ghz
> 
> 

Applied, thanks!

[1/1] phy: mediatek: hdmi: mt8195: fix prediv bad upper limit test
      commit: 059c78ebf1e94a825e27cc3ef8a9d77cef06827e

Best regards,
-- 
~Vinod



