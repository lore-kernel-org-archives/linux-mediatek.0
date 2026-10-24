Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860BD606A334
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Oct 2026 06:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nlLW6OJs;
	dkim=pass (2048-bit key, unprotected) header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=Na3gC1q6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LyrLp7MtnHDCZQrIuhGxBdHMfkxuSL1N2R4p1hgpS5w=; b=nlLW6OJsriHVUX
	3K/XLNxe6AMA4g+AIzNlYIjFvICr8eyyC/VVjKp4CScUX6mPyP9O40icddoYNZ6o3kQGGIqMclXm5
	z0OXKx8hUJZa6U0jVaqsyfaUwmgQeteR5fm6VvtagSGq7zwwcMjHVM/CsgjSuJaPqAoV57O6pocrA
	q5CusqFgT0/PMKz/I8Kcnp9HKSTdm518C3haKBpuy3A7Kr+9GuapMQIw74mi2lJRKIDTnW6dsdi7u
	z+tH9ntHs6lnacWYY+chXjaxODyz0RlLJBavXUzXkut/rhfPHaVs3GLfg5c1wjOB0sUthUcDTxxhN
	W9I2NWiD9GCx/YTL5NcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKUt7-0000000HUES-0J7F;
	Sat, 24 Oct 2026 06:05:53 +0000
Received: from out-129.mta1.migadu.com ([95.215.58.129] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKUt3-0000000HUE3-3po4
	for linux-mediatek@lists.infradead.org;
	Sat, 24 Oct 2026 06:05:51 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=CNfYvZVz1LcysgHlM339INEK/Wv9LylLtDOS5Oht0h0=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792821945; v=1; x=1793426745;
 b=Na3gC1q6TylKXoTQ4hhVl4427lJ3dydm3QPiqsE3hW857yJ8aAZfaodx9+Psdh7JnNWjZ5d1
 aIglVvNZeIMZnepdOygtGv27C6AVYM64t+8fcPh3jDDPWsAQBHTPXgs/LtHg6eFoQnBhm6eGYgy
 /Z5E0oAOlxOndO4Bgt1HOtSaH2vnpIpqFIBdYs9UZ3HcxA9D8ALDcM8AmwqpT4puNnLptLVGusG
 JWkvb8qZOBgr38I2ed2f6GE+hwGu0uF0NqmvMMhXPiooa+Y1KkYlwKIga6gZsgGCpd1WEwvZ6/s
 5wrKVKINZGfz+/o1OmP6oBX6nysj9t1SNwh/dKdQ3XVzA==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 1f07bef94bd888e6;
	Sat, 24 Oct 2026 06:05:45 +0000
X-Mizu-Trace-ID: 1f07bef94bd888e6
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Ilya Shidlovskiy <shidlovskiyilya@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>,
	Johannes Berg <johannes@sipsolutions.net>,
	lorenzo@kernel.org,
	ck.chang@mediatek.com,
	eason.lai@mediatek.com,
	emery.hsin@mediatek.com,
	sean.wang@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	regressions@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [REGRESSION] 7.3: mt7925e hangs on hibernation restore; fix c182bfe944eb only queued for 7.4
Date: Fri, 23 Oct 2026 23:05:42 -0700
Message-ID: <20261024060542.52883-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <CAGjg407dj0uZ0rCrL4G=PDkQv4-QC_og9Eeg7ewWzxqBvU4b2w@mail.gmail.com>
References: <CAGjg407dj0uZ0rCrL4G=PDkQv4-QC_og9Eeg7ewWzxqBvU4b2w@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_230550_445945_07798A0C 
X-CRM114-Status: UNSURE (   6.36  )
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
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Ilya wrote:
> Could it go to Linus through the wireless tree for v7.3? If
> that is too late, please make sure it is picked up for 7.3.y stable.

v7.3 shipped without it, and the 7.3 stable queue does not have it
yet, so adding stable@.

Stable team, please apply to 7.3.y:

  c182bfe944eb ("wifi: mt76: mt7925: fix reset panic caused by the WM2 rx irq mask")

It fixes c4edf9e3e0e5, first in 7.3. No older stable tree has it, and
it applies cleanly to 7.3.

Hibernation is one way in. Every chip reset on an MT7925 over PCIe
hits it, and the driver resets the chip whenever a firmware command
times out. Forced resets on 7.3.0:

  MT7925, stock          NULL pointer oops in napi_disable
  MT7925, with the fix   recovers, traffic and a reset while
                         associated both fine
  MT7927, both           recovers

Thanks to Ilya for the report, and to ck.chang and Eason for the fix.

Devin

