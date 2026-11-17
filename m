Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CEE606A33B
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 10:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BswF9zFK;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=lWzhVbeX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=43e2SNcVBWzb1UbgyRe/OhyamtAg+Km+Wi6/wDg0QSQ=; b=BswF9zFKpZZQsr
	Gq4JCVFoic43WeIY+O+Spxpj8jPe5+Et3pHsAiQcD3RtzMnFUaH77bqRaRooEFobxVKb04Qfe033Q
	UEQ2YjeGU7MkiGVAMeN4/m8NqGBK2gcjQmCfJu4/Z7kS41GtsIVQt2zmuuOYa9RphQiEBnKQB1iG5
	IY88DMZySmTAE3IQ244A2qy8zWdEv2cKkGFBrMFn7MsNwWch3a2nfFiT/ns9n2Mp5vNErDBYiPQJl
	BZEbf+ECdGPI4cbASbCiKL6COSJFwPe2UJT9WXHBQISz4yIL3223m3nlKRqfFyqvccz+ePCMjb042
	40W9N9j9aU353fJ34pRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTGZh-00000005IQ0-0R9P;
	Tue, 17 Nov 2026 10:38:05 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTGZP-00000005ICL-3fwh;
	Tue, 17 Nov 2026 10:37:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794911866;
	bh=BPi/q9qq8U5jbtOV/H4x+dghN6V5mYBj2nUNtLxFRAg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lWzhVbeXhrHpZSfg1vhi0IYmf/uKR95T7TPw6Zak3JApn5n99ftHqDojn+nDc2B9B
	 z208WnI1LuuPqfcF+xLklrPJppJvQdgKBzs++nvv7ncNEuo+7ckHp55uUtTbIaj8EL
	 pFhuDgRkcDNFtKV2tD34/k5ZmLSm0orzrIV1//2hUQXdjRyqr9Ft2FFpw4xb9L4Id6
	 5m2Ou3eXGLXj35SZD9krDppHxm8O5WhsAsL0x0sA6OhU6k5JcWa3JcpVN5GlGpLYrO
	 yxB/Cn549c5Vz12LO91+twaA9J3MQ1+FYxo2onOt1LbkP89qxinRSafmslzcidzGXR
	 vNezYw/UTo1SA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5680A17E0EF0;
	Tue, 17 Nov 2026 11:37:45 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	zoan37 <agentzoan@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Ryan Brue <ryanbrue.dev@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Irving-CH Lin <irving-ch.lin@mediatek.com>,
	kernel@collabora.com,
	linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Brian Masney <bmasney@redhat.com>
Subject: Re: [PATCH v2] clk: mediatek: mt8173-mfgtop: do not use the clk API from power_on
Date: Tue, 17 Nov 2026 11:37:33 +0100
Message-ID: <179491184093.148303.15758957296593434573.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913-mfgtop-no-clk-api-power-on-v2-1-b84771a3d5bd@gmail.com>
References: <20260913-mfgtop-no-clk-api-power-on-v2-1-b84771a3d5bd@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_023748_068517_94193055 
X-CRM114-Status: UNSURE (   8.51  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, 13 Sep 2026 16:47:53 -0500, Ryan Brue wrote:
> clk_mt8173_mfgtop_power_on() calls clk_prepare_enable() on the mfg_26m gate
> that this same driver provides. That is a layering inversion which cannot
> work: clk_core_prepare() calls clk_pm_runtime_get() on the clock provider
> -- this driver's own device -- and genpd power transitions run at _noirq
> time, where runtime PM is disabled and pm_runtime_resume_and_get() returns
> -EACCES.
> 
> [...]

Applied to v7.4-next/clk, thanks!

[1/1] clk: mediatek: mt8173-mfgtop: do not use the clk API from power_on
      commit: 8f1cb3fc8cae44baffef31d73c772dc77e4a9061

Cheers,
Angelo


