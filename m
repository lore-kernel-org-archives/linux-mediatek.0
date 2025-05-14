Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3383C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 May 2025 16:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sr7asB0ccZaz5S0P65JgVRXr504e+Wb6poeCHlmiVlw=; b=gdhdN6S+VQuwZG1na7zeOwqcP0
	Nknx+N1aVtrMMqiVHTQ8RAC15ynjj2xN6Y1JF/N5bgueXdl2UIOrnwnfZJv5/6CePpLHZXgJM0D2g
	UX/fjeWvtTKeqMpcWgQeDlGStI0ZORGi5IsN68m1lZ6iMtuZp3Gj5PjbEnu5iOOm8YRoC05LUzR4w
	YYe3H5Z7JH+4/7OE2fT/mcDDc3LMbUVZhHh4TnJ4KAtOwUZXJh+lXtW3ozEtvgdMVKD8P6ed7KM2X
	WIGCJNxgkqqpPfS/NYWNXUok8qt+NBbxK8WSirvLlE5cXfx1jbMs3xfve05wZdx3D3wHJR3paNoRe
	ELnGdOuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFEpA-0000000Fis3-2RJk;
	Wed, 14 May 2025 16:19:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDd3-0000000FV2F-3TqZ;
	Wed, 14 May 2025 15:02:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 012D461126;
	Wed, 14 May 2025 15:02:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A9DCC4CEE3;
	Wed, 14 May 2025 15:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747234960;
	bh=D5QrjYtZqdxl9aDAD4Mt0N5C+A1l4Okat5ZD8j05CX8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=iYkEz35ghEPY/E/ZEsQiPGJVJ70ATHHNVAVhBU4YQd4KlA0o7ljoi31EUooIirf4l
	 L5QMIjyZqYu4M7IdQcxyO0LFT8tEGScl/+NdqWCVLF5DWwm9//jGp8YgTqhD2iul0L
	 rZ2X+hio3TR93rTlo0V5tMxEYQlqyv++E01kyLMz1EVBeMahtJHttcauIEUIjlJ7Ok
	 hT7leKp/L1ehnLcOJjlwBwkK2bR6fglZuh4Om/zoppilPOeL5qWNS6nN1hEiKZEVv+
	 IXLZZN7TLUfIaKswbtSJq6vVxiA+vQubPX5Fbamt9YnoYbzcwjvlZSpzzNdo5yQ+Cy
	 1yBGTaWr73+4g==
From: Vinod Koul <vkoul@kernel.org>
To: sean.wang@mediatek.com, matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, 
 Qiu-ji Chen <chenqiuji666@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 baijiaju1990@gmail.com, stable@vger.kernel.org
In-Reply-To: <20250508073634.3719-1-chenqiuji666@gmail.com>
References: <20250508073634.3719-1-chenqiuji666@gmail.com>
Subject: Re: [PATCH v2] dmaengine: mediatek: Fix a possible deadlock error
 in mtk_cqdma_tx_status()
Message-Id: <174723495814.115648.10076437402947235700.b4-ty@kernel.org>
Date: Wed, 14 May 2025 16:02:38 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
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


On Thu, 08 May 2025 15:36:33 +0800, Qiu-ji Chen wrote:
> Fix a potential deadlock bug. Observe that in the mtk-cqdma.c
> file, functions like mtk_cqdma_issue_pending() and
> mtk_cqdma_free_active_desc() properly acquire the pc lock before the vc
> lock when handling pc and vc fields. However, mtk_cqdma_tx_status()
> violates this order by first acquiring the vc lock before invoking
> mtk_cqdma_find_active_desc(), which subsequently takes the pc lock. This
> reversed locking sequence (vc → pc) contradicts the established
> pc → vc order and creates deadlock risks.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: mediatek: Fix a possible deadlock error in mtk_cqdma_tx_status()
      commit: 157ae5ffd76a2857ccb4b7ce40bc5a344ca00395

Best regards,
-- 
~Vinod



