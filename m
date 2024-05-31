Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA85C25B75
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 May 2024 13:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hRtBMB904f0yNjxEq/77JZlDFBXNkfQAFArNl1XY0gw=; b=i1u29G/G2RVLwzDGUnQ5ah4F92
	P7FGEstl2SA3dICP8YfWd/3aJDAM3IbMOcc/L+sMeoTMGGJsiz+h638grMNF1j8y2fYE+9sf7x7eF
	JreEl6dwR/G+EWFDVoRblvvQBUIBiEKaC9w9wDuNU7Evc6sr0jfFbhFCepT4Na8iv8rNvu/C42YD1
	0d4/iC0fAiylOWX3CaU4+AQe0uFpzoPbdoZgopeJmQgc/8ATzgi9npXcywYNpaos4eN6rV+45XAIL
	B8/U8hj0Hov+Nnu0bZihrYr0mEoD5Tw8x9ROi3Cdhy6d85XSH5K5TYS+VbxcenI8lfVVUiqfZJtGt
	+kNCY8ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD2fu-0000000APJX-1nCz;
	Fri, 31 May 2024 13:52:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD2fm-0000000APId-32lQ;
	Fri, 31 May 2024 13:52:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0AC4060C13;
	Fri, 31 May 2024 13:51:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BAC6C116B1;
	Fri, 31 May 2024 13:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717163517;
	bh=ZLFkgp0st89FLzWtvHCzJtpMDWqn9ddfK5U7FlGjMYk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TwEGLc+XlwUMXPYNsDsN6Ig+TdBfRDLS2l2cpDTAPxLfB7HfSvD/nJVkOds9Ryebt
	 gyFP0C3E9IXLijews69ycBXVATbbW2e9088KOLeDLB3nQdvlrBsxtlnfmdAoki6nfJ
	 r5KTONlV5h+k/E5PPaWH41J0A6cVYbOy9BA9JPawXz+Wn6fG5ojCH1tsXhdsvos5YD
	 jrssIPJG9mA56h9Vb3FYB+PksD89PahVtj352Rlfj6k/muKmbdE1hZvdXcnNzojuZZ
	 LkxoD6EA/eJSXuuGvR8Iq2bZ/Vzqm36ECAdVyC3zzJguGdh4XYDKLn2wFe/XaksUtW
	 h7ai04owVO5sg==
From: Lee Jones <lee@kernel.org>
To: linux-mediatek@lists.infradead.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, matthias.bgg@gmail.com, mandyjh.liu@mediatek.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
 jpanis@baylibre.com
In-Reply-To: <20240527093908.97574-2-angelogioacchino.delregno@collabora.com>
References: <20240527093908.97574-1-angelogioacchino.delregno@collabora.com>
 <20240527093908.97574-2-angelogioacchino.delregno@collabora.com>
Subject: Re: (subset) [PATCH 1/5] dt-bindings: mfd: mediatek,mt8195-scpsys:
 Add support for MT8188
Message-Id: <171716351496.1109202.13130330673737183145.b4-ty@kernel.org>
Date: Fri, 31 May 2024 14:51:54 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240531_065201_535310_DBF769AA 
X-CRM114-Status: UNSURE (   6.36  )
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

On Mon, 27 May 2024 11:39:04 +0200, AngeloGioacchino Del Regno wrote:
> Add a compatible string for the scpsys block found in the MediaTek
> MT8188 SoC.
> 
> 

Applied, thanks!

[1/5] dt-bindings: mfd: mediatek,mt8195-scpsys: Add support for MT8188
      commit: 5b8d73b7e1ceb2578f74d0a119a4b4a4be690d2e

--
Lee Jones [李琼斯]


