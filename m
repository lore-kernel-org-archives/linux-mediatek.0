Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517E4606A332
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2026 09:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tAcD0VIz;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=punC0ztm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SMplvVxf8/p47BNvDn5gjAEY3Oc+fBAYFb6Yz3/eTuY=; b=tAcD0VIzKvXYHkuhjwKDfIW+y7
	5vDvPdN9qVHhDN2BfEBSWSbivnHsKN6aHPRGKwLVnottScVtGenI9TveUT1RN5gH4kKuU5uniMo2d
	H1rUz95ooaEeu7rzABhrVe1j0l6v1ia2rXy3brhdVnPycwWOzojL20FbugxiQ2XXbp5eXiUPGNDR5
	+NLr+0c5+KyPtKyZtooouP7kOhvikleI4OWT5Yeid7R1fA7GghdbgWov+BlM2nOv8/rs7yfTsUsId
	NCSm+By5z83s9e0Y5PdcEoBaTN4Hb/IrydHI1p8SQlwqh5AgRbBRpgo7dg5gtIfN92SbTG8IvXMlY
	zAReZQLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAq7-00000001kwQ-480E;
	Tue, 03 Nov 2026 09:29:59 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAq4-00000001kum-31tS
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Nov 2026 09:29:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=SMplvVxf8/p47BNvDn5gjAEY3Oc+fBAYFb6Yz3/eTuY=;
	t=1793698196; x=1794907796; b=punC0ztm9ZTgYsoIZsDtuLQ79tROMz1Rq8tYtAaboCOdTjB
	ycYeLFJ4t9KF0t6aQAn/gvUgwey6QNC8rFu8BGLK2hwCPKHo7DgAD3MDwOypmhzAvojgTs4aCFSLF
	n6dRzD+eqJpQLchZ0v+fMF6VFYcchB8YSGIygBlRiHX+ATmmBRH57vFTFXjbOeU4Ha7etzmGozrmo
	6gy/DwzV23WaqTEbnFXvfiVkPUztczlRbFbc+o43qbbRyhzkGi7snuYNdNk5UHtWkDHr2YkRZiPIb
	5C67/Kzv8Vb7/lew6tPG3XDizUA9f7r0po6GJI9MOgqsyjfg3rD3iE/lWiCwQSFg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xOApw-00000003DfD-2Blo;
	Tue, 03 Nov 2026 10:29:48 +0100
Message-ID: <3fee063254e28e421bade900080b8c2877f3fa30.camel@sipsolutions.net>
Subject: Re: [PATCH] wifi: mac80211: drain TXQ wake tasklet before freeing
 hardware
From: Johannes Berg <johannes@sipsolutions.net>
To: JB Tsai <jb.tsai@mediatek.com>
Cc: nbd@nbd.name, lorenzo@kernel.org, linux-wireless@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, Sean.Wang@mediatek.com, 
	Evan-ym.Li@mediatek.com
Date: Tue, 03 Nov 2026 10:29:47 +0100
In-Reply-To: <20261103090953.1148722-1-jb.tsai@mediatek.com>
References: <20261103090953.1148722-1-jb.tsai@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_012957_055983_B2554A49 
X-CRM114-Status: UNSURE (   7.85  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 2026-11-03 at 17:09 +0800, JB Tsai wrote:
> From: Yin-Ming Li <evan-ym.li@mediatek.com>
>=20
> Driver queue wakeups schedule wake_txqs_tasklet asynchronously. Stopping
> the driver work that issued a wakeup does not wait for this tasklet, and
> ieee80211_unregister_hw() does not drain it.
>=20
> Drain the tasklet in ieee80211_free_hw(), before destroying the local
> mutex and releasing the hardware allocation. Drivers must stop their
> asynchronous producers before calling ieee80211_free_hw(); this drain
> waits for a tasklet those producers have already scheduled. Using the
> final free boundary also covers deferred wakeups scheduled while the
> driver finishes bus teardown after ieee80211_unregister_hw() returns.

This isn't really making sense, how would the *driver* possibly schedule
something on this tasklet after unregister_hw() and get past
tasklet_kill() too??

johannes

