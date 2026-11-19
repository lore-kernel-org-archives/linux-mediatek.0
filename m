Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7277A606E4F0
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2026 20:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wZsmIJco;
	dkim=pass (2048-bit key, unprotected) header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=EAMgXLdj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mgVpFkBiyzs2DPlioXUTpvfQdmQUI4RfrR5rU4gK4FQ=; b=wZsmIJconBIuaR
	Jxjnz05fsnuKLYXtmcS9aZAkhIAa/1Aw4WAWLdSBuj0eVk3/leZpbDcq4SKzc0CqiSyntcDo67uVh
	xUNlOKLB6Sw0+zPOHgyZ+fHAO6dhptalbKAl2MLB0yA5g4XJoPowalWw9F+yMZDwqd9YVs4jD5aqD
	HAXNAMn1gryKUJOLLiLW9FnUBTTQ8F4Cu/S8OzNLZyT63dmeQTVp/BZNs1HY+UcKzJTFm3JcKtbra
	s9+2Kcgttkc7KxaBi4bqR33wcQ0QWEq/7uqFCSoUbK282/9bthTp31Xs59g6YYkcvglkoxaG0L1QW
	AsQUcP/i9b7+7m8lUG1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU8ej-0000000DLcY-00ue;
	Thu, 19 Nov 2026 20:22:53 +0000
Received: from out-31.mta0.migadu.com ([2001:41d0:1004:224b::1f] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU8ea-0000000DLSy-2UZ4
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Nov 2026 20:22:47 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=q96NL1S2dvdtT4JxbppSch+QLobZqj7yWTN8oU6f9xM=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795119762; v=1; x=1795724562;
 b=EAMgXLdjv8XLc/w9HINIl4KOdCUW3oowuctYznZYirkxYzkgSO1RmQZdO9BXVpOVK/y8DGt7
 EAWM2GmYFp67uBTpuGa7P+2/ueYrwp5S7EKdrwSqP4qQ81c9q5Mtn3nQSJpFqKFBBv7vkgRt0PD
 LWrYcVY7l5Uofj0T9TQiBrqTc1xUs6befcr0Ki55ywNXHLgOciQV/zGOSjatd7KRhr2DPxXGG2i
 2gOE2z6ghVXe89kCqko2/cuwJtlqJcHChTdOOFVghJSAufwfODMrEtv6fDWZvIyi8qqX9VWdWaq
 P6q+3hmnobYIr2+XFm3+IIU6L2VxzEmYXLpOlAwMB7anw==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id d0be6c136bf3c826;
	Thu, 19 Nov 2026 20:22:42 +0000
X-Mizu-Trace-ID: d0be6c136bf3c826
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: JB Tsai <jb.tsai@mediatek.com>
Cc: jwboyer@kernel.org,
	dwmw2@infradead.org,
	ben@decadent.org.uk,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-firmware@kernel.org,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sean Wang <sean.wang@mediatek.com>,
	Chris Lu <chris.lu@mediatek.com>,
	Quan Zhou <quan.zhou@mediatek.com>,
	litien.chang@mediatek.com
Subject: Re: [PATCH] linux-firmware: update firmware for MT7925 WiFi device
Date: Thu, 19 Nov 2026 13:22:29 -0700
Message-ID: <20261119202229.150946-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261020013839.523295-1-jb.tsai@mediatek.com>
References: <20261020013839.523295-1-jb.tsai@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_122245_197998_3E24D302 
X-CRM114-Status: UNSURE (   8.12  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 20 Oct 2026 09:38:38 +0800, JB Tsai wrote:
> File: mediatek/mt7925/WIFI_RAM_CODE_MT7925_1_1.bin
> Version: 20261016233029

With this version, a NETGEAR A9000 (MT7925, USB 3.0) sometimes stops
sending partway through an upload. Within about a minute the driver
resets the chip and the connection drops.

    one-minute uploads at USB 3.0    stalled
    20261016                         6 of 21
    20260813                         0 of 26

That is on two machines, an AMD mini PC and a Raspberry Pi 5. Only the
firmware file changed between the two rows. On 20260813 we have seen
the transmit queue stop like this only when an AP switched off one link
of an MLO connection, never in a plain upload.

When the driver gives up, it logs:

    mt7925u_git 6-1:1.0: Message 00020016 (seq 5) timeout
    mt7925u_git 6-1:1.0: timed out waiting for pending tx

Devin

