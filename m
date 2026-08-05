Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E81BCC55174
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Aug 2026 17:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BsTD/RLAzXhaEpkyZ9hFQJmsGqAIFu/1rRW/UG0mD3g=; b=It+s6L7e+0SSC6hHGdyM22Ylad
	ddTnPdU0EVSu2FwOwcXbl7w+Xl2ig2G9vKya6xNJGZDp2B5N+sbtVRunrvDxqcAfK3UPrdnJ2ntXW
	rz6OG7SSlCTMdFy7L1DM2FMzg87rGHtCzUmuv0O+BUWDQHedfFDV55pU9RdpboB5H5M5yEtAb10dP
	ioFPcite7QcwMLd8/6WePRnKTbm8YSZfuZ7Ag81PKcy0q7g65yUgt1zphzjBKhTpVdttJc3E28rdS
	xwFWaeqlND4oM4nNzChQ7hJrhIxBSGxSiuFtXHslQhVehWiHU86xGOEgJp3GSGuNJYLAJpdVwsmNz
	E82EK3mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrfhB-00000004LtZ-0M96;
	Wed, 05 Aug 2026 17:46:25 +0000
Received: from mta1.migadu.com ([37.59.57.117] helo=out-173.mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrfh7-00000004LtG-2ujE
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Aug 2026 17:46:23 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=justthetip.ca;
	s=key1; t=1785951974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BsTD/RLAzXhaEpkyZ9hFQJmsGqAIFu/1rRW/UG0mD3g=;
	b=o7zfSZUC++OqfF0ZQvWHS0ZKTBo8rHKoVQ/ctYZROH4rm5G9Vv9ciPpMtXqD9GnzQRQ6qI
	P8dQqwtk8RMD9eesh1dj+vErU82N1NUIpmPYGTFX7jE45mCOdmfFt9eJCkaZVhpBeajvL4
	M6MSGFSGIkmTl5F4LJDwTrpD0u4M1XneV1odwssuZrYbEIHu4EUVuxNkCdts5wSTkb1+/k
	Ir5wBBNqgDL/NNZfa9Zv4kLm+AKMqAYczzqpxlAJGLCc/+om2x8PoyMSaVrkkXplj0jdOI
	ecnMJRS83Me0RE84xduWUKgIOgKx5fmpLcfMCrqOh83GI6fZFSZATsvkuUwE2g==
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Eason Lai <eason.lai@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Kun Wu <kun.wu@mediatek.com>,
	Deren Wu <deren.wu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Quan Zhou <quan.zhou@mediatek.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Leon Yen <leon.yen@mediatek.com>,
	Litien Chang <litien.chang@mediatek.com>,
	JB Tsai <jb.tsai@mediatek.com>
Subject: Re: [PATCH v1] wifi: mt76: mt7925: Fix MCU command timeouts during module unload
Date: Wed,  5 Aug 2026 10:46:00 -0700
Message-ID: <20260805174600.28064-1-lucid_duck@justthetip.ca>
In-Reply-To: <20260805072846.1428148-1-eason.lai@mediatek.com>
References: <20260805072846.1428148-1-eason.lai@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_104622_088927_DEE41766 
X-CRM114-Status: UNSURE (   5.75  )
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

Tested this on an MT7927 here, against a reproduction I built on
2026-08-02 when I hit the same teardown. It fixes it.

mt7925e on 7.1.5, morrownr/mt76 at 217ee83d, which carries the
unregister-deadlock change your Fixes tag names (openwrt 98c13eb564e5).
Each cycle associates WPA2 at 2412 MHz, runs a 1400-byte ICMP flood, and
rmmods with that traffic in flight, RX sampled off statistics/rx_packets
immediately before the unload at 375 to 807 pps across both arms. Both
arms built in the same directory, so only mt7925e and mt792x_lib differ
between them.

  condition              stock                      patched
  associated, 10 cycles  59-60 s, 19 timeouts each  0-1 s, none
  idle, 3 cycles         9-10 s, 3 timeouts each    0 s, none

No warnings or call traces in any window on either arm.

The idle row is worth a line in the commit message: with nothing
associated it still costs 9 to 10 seconds, so a bare rmmod does reach
this, just small enough there to read as normal teardown.

Tested-by: Devin Wittmayer <lucid_duck@justthetip.ca>

