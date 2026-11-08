Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05696606A32A
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Nov 2026 19:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ivprhxN6;
	dkim=pass (2048-bit key, unprotected) header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=gR+IAZru
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MMJC+UT8sGZ/SEbe6GXLi4vINWtNqNdvv9JEfWOOst8=; b=ivprhxN66APYOV
	1ZqKyh1Z+EbwAPXaaPqn+xregb8hSMXGjoNEYxynoKgcHDycfn5jviiGJqWC6F2kOqvpdN8pk0P7f
	78mpgDxvabp5UplmvCPkoVTNS/BRQDWVOAVy8Kh5gS9Ya4DdSNQa+6hqFKEJNCa0Sa2blabBuN7R/
	5x3oukcyexI7w7vxPIDTm4/DRtizCSePVnedsBP1FqJ6Jr9PyruoH8UhUpDMlxkI7imInzSlpGZtG
	hvEU8NFlv3jrIhtCUPMbtQV/kAiPL4fdHd6cCKE+e+mV1zI7MMCoIMmS5KUqkLZdhUKIBrP2gRAxY
	kjTJTmiRuig/ri5mvANw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ8Am-0000000GVaX-30Ik;
	Sun, 08 Nov 2026 19:03:24 +0000
Received: from out-203.mta1.migadu.com ([95.215.58.203] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ8Ak-0000000GVZn-228Q
	for linux-mediatek@lists.infradead.org;
	Sun, 08 Nov 2026 19:03:24 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=dBs2msg8YEIickwk5+jlQJhTIp1QkhB2iQlPBWT0rRA=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794164597; v=1; x=1794769397;
 b=gR+IAZruwssR0B/2yjMGgquxo4vZS9IUgZ52MglUzwp1sfK6xJ2CTg0IaAchqir1+8HEkbRc
 Ln1Qmq6iK1r4+MNVU9gGx2iIdK5vDJLd+SPcZJF3TEoHQIkb3OFhNG+aKGFv4dBMi2VUmoDkxYy
 5MM4UX/7zVvIUKdhiAEe/pt+kTBTla8RQHmni3L7U4+uMSkKL1J3h+Zjau+ix5oAvKgYjB0BkvN
 9tPwvkgtp8MOmTm84AwJhl8vCtCdsMvYe7aIREy8zNqEhLhuwylA65kETNUOa8XFqhNPERdvN45
 4IlLdrmx4baP9AxVtY1Wy8urkBWMXRNe2ab1mnggT6Zdw==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 889c5ad5da6531b2;
	Sun, 08 Nov 2026 19:03:17 +0000
X-Mizu-Trace-ID: 889c5ad5da6531b2
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Josef Schlehofer <pepe.schlehofer@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	JB Tsai <jb.tsai@mediatek.com>,
	Allan Wang <allan.wang@mediatek.com>,
	Quan Zhou <quan.zhou@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH wireless-next 0/2] wifi: mt76: mt7925: LED support for USB adapters
Date: Sun,  8 Nov 2026 12:03:13 -0700
Message-ID: <20261108190313.11505-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103133528.53197-1-pepe.schlehofer@gmail.com>
References: <20261103133528.53197-1-pepe.schlehofer@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_110322_920761_A7207049 
X-CRM114-Status: GOOD (  10.02  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 03, 2026 at 02:35:26PM +0100, Josef Schlehofer wrote:
> Tested on a Turris Omnia with an A9000 and firmware 20231227 over
> several days. The LED follows the throughput trigger and manual
> brightness changes, and turns off when the radio goes down.

I tried it on an A9000 too and watched the LED on each of these:

  wireless-next b8e5b0ae8, x86, the series as posted
  6.18.34, Raspberry Pi 5, arm64, the same changes
  6.18 LTS, x86, the same changes

It switched off and on as asked and blinked with traffic, on firmware
20260813 and 20261016, and the LED was registered again after a USB
reauthorize. No warnings in the kernel log, and on wireless-next an
MT7921AU and an MT7922 join and pass traffic with the series loaded.

> Sean, JB, is it fine to drive these GPIO registers from the host, or
> does the firmware rely on GPIO 8 staying in its default function?

With the pin switched to a GPIO output, the A9000 joined and passed
traffic on all three.

Tested-by: Devin Wittmayer <lucid_duck@justthetip.ca> # NETGEAR A9000

