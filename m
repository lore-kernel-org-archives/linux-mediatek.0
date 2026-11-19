Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD6760A2607
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2026 16:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Axy87q09;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.a=rsa-sha256 header.s=dkim header.b=WpWseaga
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=KV6ADa/11UllCU84spZSd59cv4gMkwsky/9v11X78Qg=; b=Axy87q0952I0Lp4KxFFhipxUXh
	ogzDEyQ6C75IvF6ECTpiuLMCMJyf25lsAQ78pSz/PME7ajtE9LQlbx2qdsrgMcsLboLTBmHzHjoBF
	ock3sRHmF98FSHKb+1f9dkp5dmfFBN7idG87y4AKk1KmDNf8oLPgJCyjO87WkbYQAX683KLuBYwkG
	w/BTlu05QsPNMzSWHAuHkxgSRdD8G3ixF2IH66mIvo/mCoCHnnio88nGlAaye9LmwmtNTb75XJl3x
	YoggxRXotzVWcUvjLpobVw+xVH7q4XEN8tM/sfUIdi9qcOoHWnIilp+3Rj4RyKG9fZade9dq/d5I5
	ZsrdiYmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5C0-0000000CgLa-0A91;
	Thu, 19 Nov 2026 16:41:00 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5Bx-0000000CgKC-2Jhb;
	Thu, 19 Nov 2026 16:40:58 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CB788576656;
	Thu, 19 Nov 2026 17:40:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1795106452; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=KV6ADa/11UllCU84spZSd59cv4gMkwsky/9v11X78Qg=;
	b=WpWseagaYETOJ4V8cnXs8YD8T9xEC7a1LWlYcScOyJkvkbt/0GtvkOib8bwL4t9yszLfoM
	Ai/UBO4AdoOTYGXoq+oHPyeyXJSn9BBKqqzhq2/aEAnNfPZIc/vXHs3QPmMqjR26PUoNST
	vN2Zaacr1r5B1z1j6G8ZLN7WGyV6/LRb1QyfByfWd6FPI4YmeRFROlhxFb49nd2W0HtETY
	ecmVIVchyCm2n/+xb1RdKgTxb24xggJX+aNv0j8TaJK5f9+DV88bd9c5Kh95ulbdxBR5/3
	6E5P0n6amHTPA8X/NRWoqsVikKHcZfEYwX/ZMCeNnqZ+Z7k5DLycR7NbM8OLRw==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-i2c@vger.kernel.org
Cc: sr@denx.de,
	andi.shyti@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH 0/2] i2c: mt7621: enable for EcoNet devices
Date: Thu, 19 Nov 2026 16:40:38 +0000
Message-Id: <20261119164040.2400580-1-cjd@cjdns.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_084057_774902_9B07BD85 
X-CRM114-Status: UNSURE (   5.81  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Small patchset to fix an endianness bug in i2c-mt7621 and then enable
building it when building EcoNet devices.

Caleb James DeLisle (2):
  i2c: mt7621: support big endian processors
  i2c: mt7621: enable for EcoNet devices

 drivers/i2c/busses/Kconfig      |  2 +-
 drivers/i2c/busses/i2c-mt7621.c | 21 ++++++++++++++-------
 2 files changed, 15 insertions(+), 8 deletions(-)


base-commit: e8017d29067fd1310a65c3494ce1a1b492adbac6
-- 
2.39.5


