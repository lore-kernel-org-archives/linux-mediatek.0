Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 038F7C5B549
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Jun 2025 16:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aX7D/nHqjvADGjMie4fjxlziA0J8uk/7y2iQte4HpdQ=; b=sKzrx61Cg7FjT0eg2/vPHc1e0J
	6OtJy1etXi4MPqOcDl3RatnFIc6W1pwIlg8k0Eq6Ey7NHoHFKWZaclDHaMcwEmy7Y6A58aDTaLuyR
	AY7v8/OwV2MsqNuIXIUd8WIrI/j2CH284U4ISpVibK9FK+xgGO1zLg9fpCglervmVQJxXznOeCuIf
	mt5RF6xUzks1G95GQHU5uj2a3xf5zMzeWd+8o9Mm4yPNLD8eQWSaUhcIgLmKZY8Kjiz+NGzG+F/wz
	mqy5kip4eigg+FXhtY4VUCjck3wi+MZKHT+NcQ4aSoUMlMJm8qAC/NEFzwTh+kQ6SZaMRlZSYabYn
	sEW+mUSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMqdt-0000000DlMy-0UFh;
	Wed, 04 Jun 2025 16:07:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMqbY-0000000Dl9q-164v;
	Wed, 04 Jun 2025 16:04:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=aX7D/nHqjvADGjMie4fjxlziA0J8uk/7y2iQte4HpdQ=; b=GopEpRFjfbxlPA8FYTjL6s1Ryg
	vqJb82tDPgzwnXXrowEJMAl9XN0wQdRD0hrQTBXe9gPfIHQ6QlKxU6j1bILR6F4l56YaYFARpT+TC
	8VV5v3fwMlRCM4Y5Kq9J1jL2jGClWVYzu6ViG+mtL3ThEsJkpA1Daq3XyWSBf9ENE1lCziTF8fpf3
	85NC0CEBBdT1PEouMkKGSEKgLkvTIx25Z16vWVxdeg4wvZwlAPah4wcOHoaia7yEptcjqoOh9hV9M
	H0NhLQ6eYGE7UfTM3aEo/WTIMHp0oLiu3P8d5VsXLqquejPspLhswv1M+GW+XBPA7LcRU9t7lHXNh
	B0I5itqg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMqbV-00000000ulB-1MGc;
	Wed, 04 Jun 2025 16:04:37 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id A756330057C; Wed,  4 Jun 2025 18:04:36 +0200 (CEST)
Date: Wed, 4 Jun 2025 18:04:36 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Kuyo Chang <kuyo.chang@mediatek.com>
Cc: Ingo Molnar <mingo@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/1] stop_machine: Fix migrate_swap() vs. balance_push()
 racing
Message-ID: <20250604160436.GL39944@noisy.programming.kicks-ass.net>
References: <20250529084614.885184-1-kuyo.chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529084614.885184-1-kuyo.chang@mediatek.com>
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



This and your other patch about migrate_swap() are two distinct
problems, right?

