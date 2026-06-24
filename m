Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76CC2CDB479
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jun 2026 03:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JpOS3+PhzRpY+cjPpPjbMHL1H+dnvUhY5o3zciKGtgA=; b=3WpI7o7sqwfmtEyZO49fV7kC+X
	DLmhlp50VcYkjLAuRczc09PmYgzZtzW4dPTdiX9+KEuYkHqqbEgilQskpWzKTfgjSun0n+QsOy3Ul
	K0UQtHWOHm7V+SvhvCZdz8BsxT2rHmzHe/G5fytOgNUe5+8aCjpWUBZgV9q+v84r3F1gZo//1HcM8
	C5y5QU32hlqMgXc1KMLIWGTVCgz43+bog1zJPoBiPg7CaSk410AB+1j/zOa1OvQNOvMQp/OO8D/hW
	Djne5OGF5vjQZve8O1QwFdXIWQmZ8Ak0SDj/Wv1aI8i5+8ps6qLvFWtRorWz7t3XHYdENJL1BXp9n
	OXvhr1NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcELE-000000075hm-0gaJ;
	Wed, 24 Jun 2026 03:31:56 +0000
Received: from out-179.mta1.migadu.com ([95.215.58.179])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcELA-000000075hL-44Ek
	for linux-mediatek@lists.infradead.org;
	Wed, 24 Jun 2026 03:31:55 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=justthetip.ca;
	s=key1; t=1782271906;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JpOS3+PhzRpY+cjPpPjbMHL1H+dnvUhY5o3zciKGtgA=;
	b=O5FSVNP5b4dlvDdDqUfisGctV6dkiQR39yNAnqkoEKVXM+dqW7wMwyMg+KTNkyJ6tGxIf2
	s7Ng6mQTC7mZlA7MDYd+leFlJ8mk2/N3BE6KWWJ733DT/Qpiqtn/IKAxnX1myGML2/ay8D
	mTSqjzdrVjPYu7mFPvW2RZqf88Yr+OiyjaeEtUMrcjT5KncXIQWmHp1fFoiBoxEFC8aSNE
	QY2YZ0OA2/8PgOJg6uBtISl/74J2c7LVSnLDHgfKhTnkbG9mBidQ/CmKojkYDfGXDQGXUS
	xRfLyPMnJH+HHkA6tJtvDBxuSUJqs8+VO2kzl8To3R5jQUZVd+YYoJAsXbfWKg==
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Sean Wang <sean.wang@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>,
	Devin Wittmayer <lucid_duck@justthetip.ca>
Subject: Re: [PATCH 1/2] wifi: mt76: mt7927: set band index for sniffer mode
Date: Tue, 23 Jun 2026 20:31:35 -0700
Message-ID: <20260624033135.121054-1-lucid_duck@justthetip.ca>
In-Reply-To: <20260613225144.2414283-1-sean.wang@kernel.org>
References: <20260613225144.2414283-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_203153_426744_A8E42ED5 
X-CRM114-Status: UNSURE (   4.76  )
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

Tested on a real MT7927 (Filogic 380, PCIe). Two monitors on different
bands capture at the same time with the series, and drop back onto one
band without it.

I tried each patch on its own too. [1/2] by itself still collapses both
monitors onto one channel. With [2/2] they stay apart, but then one of
them stops capturing, so it looks like both are needed.

Single-band monitor and a normal station connection were both fine.

Tested-by: Devin Wittmayer <lucid_duck@justthetip.ca>

