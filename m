Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E365C8303F
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Aug 2025 06:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hJBHlWeBTaNe39m3yF8HBzLL2yXDc5rG9ba+2xOGN/0=; b=ddolieM4pAgDVK4RnTVlYHaZL2
	2z89fiIav6aJk6al/Mqf1LlLPBtqWINT9wZgdU4qF5qwiImVauIZGFCr3S+y64WtQReVT2PXwVKWu
	k7ATSw4L/wRL0qIdY5A8XmPAyu7eyauvLFN14lqgIRu3poCmZTsR0bc7u5lmh5m0pbNPVBppjc4Xt
	j2LR2tL6WIwf908JVsS1io+RREdaDDrr8GUInUJwFmyyfp0AD7lbITT/ejXoWKzfpJQiRluLsMAP+
	Z4DKNJQG1eOINxM5pVLbDbisOn6hFvkeE4LqJHD87d+X6rhMEk4kZkqbBjlp9j51k6VbXyuk7r2Wn
	W17ztE2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urt06-00000004gon-3gbs;
	Fri, 29 Aug 2025 06:54:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ursv6-00000004gH7-2ASH;
	Fri, 29 Aug 2025 06:49:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B0CCA60054;
	Fri, 29 Aug 2025 06:49:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C218FC4CEF0;
	Fri, 29 Aug 2025 06:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756450147;
	bh=6bcq9zt/NpRi6mq0YCfI9xt2nKhZqME42o36Ib3lF88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OXIUtayTen7s+65e3ZLlV7vTinbyBakYn6QvCkaqfAeDXk0k/IWDP9Uh0GNjICUft
	 hZa0x+AVGTHCO5eqCNyoZLUr5LBsKcYK6smjyga8RrVd4+a5mhtih5gkavL1YPx64Z
	 QO4nBYgDI7f13f+RIJBh4JaOhj9W+FMgw/t9fgbHYdEeMSt4jmf7Ke75wozmNh8Sti
	 lWan1m7trIAx855hlbdP+LFdZl6ht58VQL5XieW0yXVsBxYY+3rFAIIokwPEC/cMMl
	 BN33hu09n1FFHpsRpz6opSZopeW0PfroWFzpiZZppgg3espuV+aGFV5W+wdXCRUbSL
	 NAsvSIxKld4pA==
Date: Fri, 29 Aug 2025 08:49:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Paul Chen <paul-pl.chen@mediatek.com>
Subject: Re: [PATCH v4 05/19] dt-bindings: display: mediatek: add OUTPROC
 yaml for MT8196
Message-ID: <20250829-little-independent-slug-2465c8@kuoka>
References: <20250828080855.3502514-1-paul-pl.chen@mediatek.com>
 <20250828080855.3502514-6-paul-pl.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250828080855.3502514-6-paul-pl.chen@mediatek.com>
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
Cc: robh@kernel.org, conor+dt@kernel.org, xiandong.wang@mediatek.com, chunkuang.hu@kernel.org, jason-jh.lin@mediatek.com, singo.chang@mediatek.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Project_Global_Chrome_Upstream_Group@mediatek.com, treapking@chromium.org, devicetree@vger.kernel.org, nancy.lin@mediatek.com, linux-mediatek@lists.infradead.org, sunny.shen@mediatek.com, p.zabel@pengutronix.de, sirius.wang@mediatek.com, matthias.bgg@gmail.com, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Aug 28, 2025 at 04:07:00PM +0800, Paul Chen wrote:
> From: Paul-pl Chen <paul-pl.chen@mediatek.com>
> 
> Add mediate,outproc.yaml to support OUTPROC for MT8196.
> MediaTek display overlap output processor, namely OVL_OUTPROC
> or OUTPROC,handles the post-stage of pixel processing in the
> overlapping procedure.
> 
> Signed-off-by: Paul-pl Chen <paul-pl.chen@mediatek.com>

NAK,

Never tested.

Best regards,
Krzysztof


