Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D51C3DA49
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jul 2024 14:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1dWa5Cytqk7fCufD0uA2V4znvp8FPsjCwDQ3MrZmtn8=; b=NhBKRxbMcbgOFgO5g8glOyJF7f
	veJ/3YIq91HgoNKb1bfIdFUtAKEfL+jrwb/T2TJ2iC7nLP5+iqQ0o/0s28UtYIKbsBqS4WVoWe7MJ
	opYqyhL91CFl30wqzLaug6P9sQLE8vciCMEBAwQiaY/0NLr8bTUjWhpXCoI98T/I3fO3xjF/y+Sm/
	ykpLoKis8fLm8TEuPweHACiDx1b0sK+53y9jWMY1/lWh4g/Y8uvE/41JbD8m+kES3bIrhSpx9RCdu
	QnIFLig2ELvKwGtdUy+FThViPswuY9YPpRQp8vKw+oMbLtSL0qgpQnDLDcZlAa0MmzZSpXGttU4r4
	25dkyqHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYnz0-0000000FTxp-0n1M;
	Tue, 30 Jul 2024 14:37:46 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYnyX-0000000FTqO-05wU;
	Tue, 30 Jul 2024 14:37:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722350235;
	bh=Plzyk1Dywd7+rQj/2Gc3nMT3tnqW4USmHzptYCMZn88=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oSSybwPzTP7cjwwrw8p/b/yO/+l/aAXl4poombyE4M7wubfRY4cM2fsnieUL8UKIz
	 0hmi5Zvcwuy75qdKbqwOrOe+5RR4//Gt5djQP8Rd0Dh92M3O+eNmVveS5TZc8nbQkQ
	 wng0JjFNjTGFuqjqtPWqlAD49sREALW6s+Q6k8AZXyh40bil1icTQSG419b7QyQhsc
	 o9vHjDyHDRJ0qLdFYn+2Js0NZtQAImKguIvwH7xUaWyB6Mrbwny9hxYYfak7YD/lkC
	 +eK9ngdeSQIn57XLs8GEO7kcjeR/9LfdPt7jKYsyYabFPUkoVEUCccDmwl+XeHPS/h
	 w/DHreYBqzHYA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9232037809B0;
	Tue, 30 Jul 2024 14:37:14 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Moudy Ho <moudy.ho@mediatek.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20240606-mt8195-dma-scp-node-err-v2-1-e14702e9d3f2@collabora.com>
References: <20240606-mt8195-dma-scp-node-err-v2-1-e14702e9d3f2@collabora.com>
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt8195: Add SCP phandle to
 MDP3 DMA controller
Message-Id: <172235023450.223861.8133527009930724710.b4-ty@collabora.com>
Date: Tue, 30 Jul 2024 16:37:14 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_073717_218819_8F3D293F 
X-CRM114-Status: UNSURE (   8.14  )
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

On Thu, 06 Jun 2024 17:12:04 -0400, Nícolas F. R. A. Prado wrote:
> While the MDP3 DMA controller can look for the SCP node based on
> compatible, it's best practice to supply the MDP3 node with a phandle to
> the SCP since that allows supporting dual core SCP as well. Besides,
> relying on the compatible search causes an error to be printed, since
> the phandle is tried first:
> 
>   mtk-mdp3 14001000.dma-controller: can't get SCP node
> 
> [...]

Applied to v6.11-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8195: Add SCP phandle to MDP3 DMA controller
      commit: 587c945c933364f24d132918d7703997fd1e2cd6

Cheers,
Angelo



