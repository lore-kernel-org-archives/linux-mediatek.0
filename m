Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24DCFC7EE2A
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Jun 2025 17:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SuJveAC2vB2S8WmBVDeBuIY2xXf46zvkMnrwsVP1Fok=; b=pwAJaTbTkps2sv
	Bhs499O5Bt1DgkMi4gnT3szc+8Jdiwzoh0YxPHGStzflRkUCyMD+z+PEac26h2QriVxpaW9F8nBQp
	sb9uSWto2IIcm0c5m+wbJVaOVON3LIYUmMbhFuNKOWzf+TqIU/y98fWxGWAt5HQ3uHWCR4OW60rZJ
	IjQ5AS/McwcKIUtY5dnRBl/J54sgia2XQzkhSH3waFCXYkRYNz55FE7Cg4h9/3TCDuB4iwJkBH9pv
	rSXLklk1dMYz4T79GUxx8eMm/4trHvL/s0ECQtVPrLe7m3XWVUaGHRx4lA6iWF1G6gdt5sNUqYRFE
	dtohbrM8vROhyqI4Nxkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUU7a-00000009VUi-0vZu;
	Wed, 25 Jun 2025 17:41:18 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUQeh-00000008spn-1WnN;
	Wed, 25 Jun 2025 13:59:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750859953;
	bh=z6KwqZF+sEV50fj8SbrBHrXmDWlvuqDf00T6QA4XK3A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=REm88+4+zz3+IyPKjLA0OJL6d8PS+BNPUGGHAhKYRDmp1waQFubcjN8ieSfLcGiW4
	 ErR0V2g+nDUxOyyOQ/uvZDgR5GkAgnI7V7TL7yDIhUgi15zuQOHeolcAKs3R/o9Dk6
	 +63M2CXDKny0mbzuZ9Yn0a/7i+2cr1FhnNaLh/Adk9rBv1NPpw4zjY1/oYt1OJZmQD
	 TKAssXn0AQNv/jISsP3zXqdM1lG1qF5wZf1mrF8PDnUlL1pMIv08MBE5pJyoxqDrDV
	 dTfk+Lf0rv+sY8lHhFBHDSD2TnhzUKDEcM43gzAMHee896E82TiEqzWFbcxPqrro/q
	 k1HdKQnp0hR9g==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8EF6E17E090E;
	Wed, 25 Jun 2025 15:59:12 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Jason-JH Lin <jason-jh.lin@mediatek.com>
In-Reply-To: <20250624103928.408194-1-jason-jh.lin@mediatek.com>
References: <20250624103928.408194-1-jason-jh.lin@mediatek.com>
Subject: Re: [PATCH v2] soc: mediatek: mtk-mutex: Fix confusing usage of
 MUTEX_MOD2
Message-Id: <175085995249.270142.13954093211913290780.b4-ty@collabora.com>
Date: Wed, 25 Jun 2025 15:59:12 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_065915_578397_83F91646 
X-CRM114-Status: UNSURE (   9.60  )
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
Cc: Xiandong Wang <xiandong.wang@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Zhenxing Qin <zhenxing.qin@mediatek.com>, linux-kernel@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com, Paul-PL Chen <paul-pl.chen@mediatek.com>, Xavier Chang <xavier.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Yongqiang Niu <yongqiang.niu@mediatek.com>, Sirius Wang <sirius.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Jarried Lin <jarried.lin@mediatek.com>, Chen-yu Tsai <wenst@chromium.org>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 24 Jun 2025 18:39:03 +0800, Jason-JH Lin wrote:
> The usage of MUTEX_MOD1 and MUTEX_MOD2 for calculating mod settings
> over 32 has been confusing. To improve consistency and clarity, these
> defines need to fit into the same MUTEX_MOD define as possible.
> 
> However, MUTEX_MOD1 cannot be directly used for all SoCs because,
> for example, the mod1 register (0x34) of MT2712 is not adjacent to
> its mod0 register (0x2c). To address this, a `mutex_mod1_reg` field
> is introduced in the mutex driver data structure. This allows all
> SoCs to use a unified MUTEX_MOD to determine their register offsets.
> 
> [...]

Applied to v6.16-next/soc, thanks!

[1/1] soc: mediatek: mtk-mutex: Fix confusing usage of MUTEX_MOD2
      commit: 331db44e70dacfb6bf1e17d92fae7b1c9517ca6c

Cheers,
Angelo



