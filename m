Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5631606A33F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2026 15:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3x+N+yb3;
	dkim=pass (2048-bit key, unprotected) header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=bbN3l48F
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ogEItddFGy1dfxgZ8OsDI8k93istC1hjwjvkHUUW+Zc=; b=3x+N+yb3Whlm1e
	wk8w6ovnLQUx5dqKhmvexqwxABtYuajkD9vkgYOZdvn3B1HVHHKw4cpWhNX01sHy8LZooYhmPaHXj
	ruOVlqYmohYj9fnGvno8hFGVDt1c7ZIhxvN6Q0RGPN3FlIRuajY6EiexfBvaKVE3pWTDZzp+aTJVo
	urD//t3ywxVa0PO5RKddxEgFTYPwuOtEAa+B0fP3oWt/SyjK9PPdU5g1dpHNpCWUfvpi33MddZFX9
	t2Gw9HBDTRFUp7Uvvys/sBdnsEC6oEFyz/bL/yJs190R8cFhg6Vmu5dT1h3GCdNvafZfjD6iPyuau
	5Yf5pHu8DmRVPkwjV4EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGSf-00000002yJM-2a5l;
	Tue, 03 Nov 2026 15:30:09 +0000
Received: from out-184.mta1.migadu.com ([95.215.58.184] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGSa-00000002yI2-2qtl
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Nov 2026 15:30:06 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=En0uQiOngjLZ1HAaEA3BeDftVVy9jafInzYJ6k+h4uQ=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793719802; v=1; x=1794324602;
 b=bbN3l48FgduD3jch1SlWYQFE1KrzrMmZCVScgQVcTA5/2Vbi4BlfeQHIUUfRPh7MV0w59fxe
 e151FLhixxAZzdHz1mu/XVE1+isE4YQZE1OldTcSRjh1VHrfbLmniMO8rHsqp5I0+damhKJDkHr
 Tx9EDGMqcJtaJSkz6sY3xcnDsaSyim27fb+0qKKixbTedx8WK9EQM4Vu9vLzXcF2RbUabG8h/m0
 JGwioMnXETy1d8XkLBQfOvoQqnR6YVsFaQc0W7ElK5cI1huBds2YVgS3DGa0Cj4RGglZampVmjE
 t2X7QxrxRFF+EVj/JYnBqOKV11ydgC8J0ahFnJan3XOYA==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 71056d8b7d6406ef;
	Tue, 03 Nov 2026 15:30:01 +0000
X-Mizu-Trace-ID: 71056d8b7d6406ef
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Aaron Beckendorf <albecken@mtu.edu>
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] wifi: mt76: connac: honour injected HT/VHT rate and bandwidth
Date: Tue,  3 Nov 2026 08:29:54 -0700
Message-ID: <20261103152954.8781-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261101202727.392683-1-albecken@mtu.edu>
References: <20261101202727.392683-1-albecken@mtu.edu>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_073005_099258_F86713A0 
X-CRM114-Status: UNSURE (   7.42  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
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

On Sun, Nov 01, 2026 at 03:27:27PM -0500, Aaron Beckendorf wrote:
> This makes 20/40/80 MHz HT/VHT injection work on mt7921u/mt7925u.

mt7925 builds its own TX descriptor, so this never runs there. An
MT7925U injects at 6 Mbit/s with or without the patch.

> +				mcs = tr->idx & 0x7;
> +				nss = tr->idx >> 3;

The rate field wants the whole HT MCS index here, which is what mt7615
passes, so the mask loses the second stream. With the whole index each
HT and VHT rate below goes out as asked. MT7921AU injecting, MT7922
capturing, 100 frames per case:

  requested                 as posted       without the mask
  HT MCS 0 (20), 7 (20/40)  as requested    as requested
  HT MCS 8 (20)             HT MCS 0        HT MCS 8
  HT MCS 15 (20/40)         HT MCS 7        HT MCS 15
  VHT MCS 0 (80), 9 (40/80) as requested    as requested
  VHT MCS 7 x 2 (80)        as requested    as requested

Thanks for this. Without it every injected frame goes out at 6 Mbit/s
on these cards. I'll run v2 through the same test.

Devin

