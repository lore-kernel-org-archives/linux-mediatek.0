Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C181C624D6
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2026 03:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sm4kHrNe/yjdETK817y9Ij2OrxOv+3jcTfn0MYRkQ0A=; b=2exmCC1QTb6IRvk95aVODenpOj
	U8O7KA97ZMBHNX8gEb4DWmKEGjk5hQXDj0M+SRs/QfZzMhxdhYRWQd6z8s3kMc/ci7Z2V5cH3NpYC
	LuG5vlyFYxS7l/rmxZsU80BMVhmXvst8ipxD3UweuvK8uWF2EX/PDuR2V/xghJHloM4MQmK16/d5y
	AR1kv5DZdkTxLDzBPy0Cgq17QSeOqnq1lCz2MKEtDCsbibb8wAKm91pbl39jTkKNoBvFl0X9OAbZK
	q/+oQNISMVFhEs0GrE+/Q1lo0UpmiN7KlPCr2Pfc/VbtEfMm6CKlfGQhDDHLQrUdhII8TRJwdbGTx
	CWCos4Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2KRe-00000000v76-1l2P;
	Fri, 04 Sep 2026 03:18:26 +0000
Received: from out-132.mta1.migadu.com ([95.215.58.132] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2KRb-00000000v6m-2EE5
	for linux-mediatek@lists.infradead.org;
	Fri, 04 Sep 2026 03:18:24 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=BL3B4T82/efkjC6zGEvMDESDZ5EgHGgoG1FS7HzSxEs=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788491901; v=1; x=1789096701;
 b=COureHemhRTKgc5sSr+6lN2D+Bijx467D6ZfAK3qUiOZ1FDwLwOD3LgtU9+qA90azzQCJ5xT
 rp/Ki/uQKEj8ccSsUqUcuWIjS9kcBRBedmhTd3zI3WVk3JnOOAZwswLwaJVsvjmD/BE7jZwUpgY
 goyCTkiuLHm9+RwSGopLayHBnSSwfezLH1bw/4u69VbCyQwTtYVsnVjS8ezLYqcozcDI73ka+SP
 O5SCd6dhk3YWGhaxS1SIX4o7PT7lW+SxzMWfSeOn7nF5F35+ttEcLfPdZlqZzJba97z3mobP3cd
 +UST/EaIw37E8IOdlR45G1YjbdWTEUzlpz0okUEYuMOuQ==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id c0f2672226896a05;
	Fri, 04 Sep 2026 03:18:11 +0000
X-Mizu-Trace-ID: c0f2672226896a05
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Deren Wu <deren.wu@mediatek.com>,
	Sagun Kayastha <sgn.kayastha@gmail.com>
Subject: Re: [PATCH wireless] wifi: mt76: mt792x: validate ACPI SAR table length before parsing
Date: Thu,  3 Sep 2026 20:18:04 -0700
Message-ID: <20260904031804.45272-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260811232839.515463-1-lucid_duck@justthetip.ca>
References: <20260811232839.515463-1-lucid_duck@justthetip.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_201823_945599_DE471CED 
X-CRM114-Status: UNSURE (   6.49  )
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

I've been back through the GA503RM's bytes since sending this, and
calling those tables malformed isn't right. Both are version 2, and MTCL
is what declares version 1 for all three, so they get read as v1 and
every field shifts a byte:

  MTGS  28 bytes   as v1: (28-6) % 5 = 2, nr_tbl 0, count 4
                   as v2: (28-7) % 7 = 0, nr_tbl 3, count 3
  MTDS  19 bytes   as v1: (19-6) % 6 = 1, nr_tbl 0, count 2
                   as v2: (19-7) % 12 = 0, nr_tbl 1, count 1

Read as version 2 they're an ordinary SAR table:

  MTGS, FCC   2.4 GHz 14 dBm    5 GHz 14.5 dBm    6 GHz 8.5 dBm
  MTDS        8 to 14.5 dBm across the range

So this patch rejects two good tables and leaves the machine with no SAR
limit at all. The reporter measured 23 dBm afterwards, on a laptop whose
own tables ask for 14.5.

The layouts are 6 + 5n and 7 + 7n bytes with the count declared inside,
so they never collide at any accepted size and the right one falls out
of the shape. I have that written: it applies 14.5 dBm where this patch
applies nothing.

I think parsing them is the better answer, since it gives the machine
what it asks for. Rejecting is safer if you'd sooner not have the driver
guess at a layout.

Devin

