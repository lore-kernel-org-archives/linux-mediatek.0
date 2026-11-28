Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4560B606A321
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Nov 2026 17:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Re0OJwb2;
	dkim=pass (2048-bit key, unprotected) header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=Cs68EPJy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=oqDemX6ZwjJ1i6EL+hJchHNeErURI1NTJiCawPmRbL4=; b=Re0OJwb2ciH5xL
	E/om7fhSF7Y/635LfaGl1EWu6IZALpGS93wVotJeqDSMqBE8TG+BbjvebPWs31H8LvMWXetAg0Ewo
	htVunKCGvw9eAOmyUdes/+dx6p1Q5WIB8cATKnGwPpoZNLYNry7A+gbVqWY6gebmxxP/TH1YpEos0
	ytwXXpxBisrDqqLyZoBIMa5dnaXH1on1l95uLz6XSCuUYoZGE8wABfuhPvkSc9pkZhOr6voGOC1m9
	DJUNml5S3lA3m2QBawRyJrJ1yNV1N5bm2KgBvWLnYWopgLNTnNzuxv/a44CzTRR0SGJdEWE+NCfkw
	X2WHR7c3goTn+VFjg7KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXM1h-000000010Ww-04Vd;
	Sat, 28 Nov 2026 17:15:53 +0000
Received: from out-230.mta1.migadu.com ([2001:41d0:203:375::e6] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXM1d-000000010WB-2ay5
	for linux-mediatek@lists.infradead.org;
	Sat, 28 Nov 2026 17:15:51 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=oqDemX6ZwjJ1i6EL+hJchHNeErURI1NTJiCawPmRbL4=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795886145; v=1; x=1796490945;
 b=Cs68EPJyuIZX9t3Dpp60ahWgHJL/k1hg6kT16PVxXMoRPYlbHYMWNXthlV0xukuicE+5VIp9
 P3myz1ZdA2FEkyefQammwGg8ku7utM7ABqLC9B8EeL7AWRkix6ldY4m54IgcdkwpJcAPW3aCoyw
 CWl/05tZBwFnFumv+AstjeegUpuCtXfn7Rg+ug2AoRETwtinNnvOZ5VvWevsONpqobovX0wpxnG
 hnep951DAviroMEmH/sPzxUB+EyYe9mOArVz1IbDCfQa0vx/F3+3xeOatQlqChHL/mzxyod6lYm
 897QQrEcwkfQMbhW5qkpZgkjq2SfmkoM/rCCwk42Emk7A==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id a2901eb0e4d21435;
	Sat, 28 Nov 2026 17:15:45 +0000
X-Mizu-Trace-ID: a2901eb0e4d21435
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: martin@rfdeck.de
Cc: Aaron Beckendorf <albecken@mtu.edu>,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] wifi: mt76: connac: honour injected HT/VHT rate and bandwidth
Date: Sat, 28 Nov 2026 10:15:34 -0700
Message-ID: <20261128171534.98125-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261128113158.Horde.SfK8gVRYJBkGjFr0f3N_Xrz@mail.your-server.de>
References: <20261104142737.186484-1-albecken@mtu.edu> <20261128113158.Horde.SfK8gVRYJBkGjFr0f3N_Xrz@mail.your-server.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_091550_085655_CAA35148 
X-CRM114-Status: UNSURE (   5.70  )
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

On Sat, 28 Nov 2026 11:31:58 +0100, martin@rfdeck.de wrote:
> Maybe set the fixed rate for all injected frames
> (IEEE80211_TX_CTL_INJECTED), not only for mgmt and multicast, and take
> the GI from IEEE80211_TX_RC_SHORT_GI?

I have patches on top of v2 that do both, and they also cover legacy
rates and LDPC/STBC. With them, injected unicast data goes out at the
requested rate on 5 GHz too. Without them I see the same as you, on an
MT7921AU and an MT7922.

I've been working on this for a while. I'm doing the last tests now and
will post the series with the results soon.

Thanks for testing,
Devin

