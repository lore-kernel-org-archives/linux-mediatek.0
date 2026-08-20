Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD79C5DF85
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2026 17:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FLRTZnEDviijJzsjwddfvnyaqLbr2r1IukiSisfKzmc=; b=Z2d8tjZeFubaxU+o+T3q9NR7mR
	1VPnRFSb34M+d1JduCyD8XbET+iJliCbDMjroakk62AjcJrJqayGEuW5GmLZRazcsmEWAfM99QUcp
	/5dtCpQILDaLp0AGwqbjt6nSeZf3qza6LJVSoTzflk97lwg36w3Ba7qh2IVWbSMai/jDjaN//UZfS
	xwx1MROlT0hihEDLydpj4fjWYu5H4s7+Oh0L1x5CMwtMBOV1pnWfkDVHJwewrIqRMZ8tm4By3Rton
	qnIhH5K4p6PpYOIgVxTqeG1HPj88Qg+pCB9SK41RO0zQ463E88TPTsTVjWW1GCdK+CTEJqgI67gdN
	q7LNiO7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx6Pn-0000000Bx8u-18XY;
	Thu, 20 Aug 2026 17:18:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx6Pl-0000000Bx8L-3qgf;
	Thu, 20 Aug 2026 17:18:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E8A460A73;
	Thu, 20 Aug 2026 17:18:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89BC51F00A3F;
	Thu, 20 Aug 2026 17:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787246332;
	bh=FLRTZnEDviijJzsjwddfvnyaqLbr2r1IukiSisfKzmc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=eXpT+79Qr29I+auqIZyO6vPcyQMnyFicpz48SJ+z3e7S62QUWBZWfa+LNNUa2rmA2
	 Xyg0hWrYhs69ufEsGeCVW9YqyhoiwnfMf78sorTgRlDBULOrVBzgTZiMfumT4c1CJ7
	 c6Hu+go7sDDSNJv/b5w9sRXhvKTirixYauikD5ERsOGP3i2G0/arzYhiNH/7KROA2h
	 v5LrTOZy/S4Dzmnoq6HQ+tWC7nta/eNNVI1Gn7vr9u9NDUduh0oZac7UW0OaT96EDs
	 DnO3Onw2mYB2MwISBLiY3VCSbjr/PwhsYbAkSob8F71uS9Aw5Y+6PpiwPl2YHsJZvE
	 WVqk2MEMYpTag==
Date: Thu, 20 Aug 2026 10:18:51 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Daniel Pawlik <pawlik.dan@gmail.com>
Cc: netdev@vger.kernel.org, lorenzo@kernel.org, win847@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v8] net: airoha: npu: use cacheline-sized buffers for
 mailbox DMA
Message-ID: <20260820101851.0b4c284a@kernel.org>
In-Reply-To: <CALC2ApiCSY8DkVpd7puTssbJZMWBHGVtFCnG66fiK0PX7-u3Hw@mail.gmail.com>
References: <20260817090601.1256389-1-pawlik.dan@gmail.com>
	<20260817161756.5fd2185a@kernel.org>
	<CALC2Apj7rQv=6uUqaqBjfJ9yO+VCddQqHB=yDhXH7+QUCh2JyA@mail.gmail.com>
	<20260818082933.28b5c9d1@kernel.org>
	<CALC2Apj-KLB5CVbSvoZWvA4Oan7dmAerK=VP7W86jmErWW8OdQ@mail.gmail.com>
	<CALC2ApiCSY8DkVpd7puTssbJZMWBHGVtFCnG66fiK0PX7-u3Hw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 20 Aug 2026 10:20:08 +0200 Daniel Pawlik wrote:
> size=24 < cache_line=64 fails this regardless of address alignment.
> The swiotlb sync code itself is fine, but the NPU cannot DMA-write to
> the bounce buffer address range (it reads commands fine, never writes
> responses back). This is probably an EN7581 platform limitation.

Sure, that's pretty much what GPT told us some revisions ago.
The question is why.

