Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC99C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 07:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5DwW7hIPp6hT4vqvzwHceKtwmCSWHYW840Sw5s7O9Y4=; b=hRKEn6UgogcvtKp2TZZJ5qoC3T
	gXpRYL24Xo613jNMTm/bu3G9rgkNcTtbc9NrmtCfIJapXCEpoMLIV5pRx7XbHZ7BgY+PeMAxM+P2E
	yQ/mdVz+F8AfTjes5RU1jldB9/u61jVCbYlPgcxCsbv8VP9/zQESJtdZMsKbztXjH0D8iAa2QBx2m
	/2AXckuQvuPxTnunbmzqc3C3A+4XQ8ywav9sGk5WK90lz1OTVAv2vaxGvAlraS0+98CHXdB4MJO9w
	wLD1FuxsvbAEACshx3fUK4Aqn4MmSui6Y6WL8GkbwpHcbjpUioq4kzia3niwb6REh2RFs2GpKTfDp
	sYvZC7Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwHE4-00000007R58-0aO0;
	Mon, 15 Apr 2024 07:58:04 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwHE0-00000007R4F-2ZSP;
	Mon, 15 Apr 2024 07:58:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713167879;
	bh=TEDgWbwQZqOQttEd0OWcFZctvDILGW9k/SYHyU9Cehc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hvoI+VRgFbZuXc2T/ZhHDdc70sxIF7YtnlMy1rNr+wai9T8lCFPwYHBmkE7twNcwU
	 JushNLe7oa9GSwigNnxQOMs6OYGXU08j0ehxCHk09Ss2SRb9LyZ2iL0jSq+/4Oyc+8
	 B2fbhfJvzCwlxdvQNDYp3pR8ZBHTTPaY8wH1pZSqPoKji72M1nskg5xiWe6XheGHUC
	 QjvGDvpgbXc/cbKmnIR0D26C4TxUIkqRjaJr0m0ET12aCMjYvl7fKjBcMxN6sPVOdY
	 Knl7kPR6pxK0S9pNpeZK9ChBFHA9tIuv1YgZM0gtKjT2jyAuab90fYW7EOS5L6HVsp
	 rM+XFSn7iEglw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 35FC83780894;
	Mon, 15 Apr 2024 07:57:58 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jason-ch Chen <jason-ch.chen@mediatek.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Jason-ch Chen <Jason-ch.Chen@mediatek.com>
Subject: Re: [PATCH] soc: mediatek: mtk-socinfo: Correct the marketing name for MT8188GV
Date: Mon, 15 Apr 2024 09:57:54 +0200
Message-ID: <171316786262.49812.9619771465130968963.b4-ty@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240409035355.27659-1-jason-ch.chen@mediatek.com>
References: <20240409035355.27659-1-jason-ch.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_005800_801502_82BCBDD8 
X-CRM114-Status: UNSURE (   5.31  )
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

On Tue, 09 Apr 2024 11:53:55 +0800, Jason-ch Chen wrote:
> Change 'Kompanio 830' to 'Kompanio 838'.
> 
> 

Applied to v6.9-next/soc, thanks!

[1/1] soc: mediatek: mtk-socinfo: Correct the marketing name for MT8188GV
      commit: 8328a3d126f54ef5998ea3b0e444701a02d62274

Cheers,
Angelo


