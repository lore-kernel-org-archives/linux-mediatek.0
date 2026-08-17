Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C76C5DF66
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2026 16:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+KG+iiGRdylcb+xJMSMtImIGNJiqrfPHBleDHvNir4w=; b=t+fluwNPpVbSzBW9rV/mdGPNtw
	V4yFgucU2d2nLEIv1eXsfFk82AkO2m43WgKzkL8/PalgAghbSZjl1W1QOKjEFf58JIWC4DrsL9TlE
	vSPjrqEvLpyTx1p8iKXAuc/czE/RpCAWozV0Lowq6JiDHjgXkjMmafF8KeR9N+7t7LQRD9zrJly4Y
	GYDy2IsM9zTji3UIhN4uYVnxUbwGh77M2ZLZ6D+zukHyVsRWpAfKorBflauGI7AU8Om65OR31PpF8
	S3A3R4o1TB22k7lcZrLLoGQbl8wpH3VRxg2QNM6fM2n45FtGG6U3xU1rlnfsBYGR5hyjOpq0RLw6F
	oaUTvKyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww0Sc-00000006Xfr-3CgW;
	Mon, 17 Aug 2026 16:45:18 +0000
Received: from out-6.mta0.migadu.com ([2001:41d0:1004:224b::6] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww0Sa-00000006XfJ-1diX
	for linux-mediatek@lists.infradead.org;
	Mon, 17 Aug 2026 16:45:18 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=+KG+iiGRdylcb+xJMSMtImIGNJiqrfPHBleDHvNir4w=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786985114; v=1; x=1787589914;
 b=Ww0eb0RzZ5OCtWRMwMwz31TU8bJix7tgf1mF2zT3Q37aUNX9esju+5wAgaFxrmICrlClL5z0
 ikQConsdheGgrs2QBhkzJYMXj74iPngAu58VSgIiXa8NywX3vg9/ycJR6Q44mVJWzx9aNrwokwM
 RbifK2ivxwJ4aUqbZ041bBW9XY+nTNFFDeIiSIENooLn/pL2VFhP4B/WDiARaXTqng/n0n+OR1V
 NPDxbKM2aaH3+171+m4LWEyMgUE0uNjeITMenWhTINybzvORHkfh6U01mKGXsZJ16tpehJ1WorU
 u8Z0FIqxqUJnPA57gYPZ7scMJVIBeqKVnhz4dPgaI34kA==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: from fedora.lan (2001:569:be59:c500:b340:3f2c:4486:21c1)
	by smtp.migadu.com with ESMTPS id 366244d03d620435;
	Mon, 17 Aug 2026 16:45:14 +0000
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Eason Lai <eason.lai@mediatek.com>,
	nbd@nbd.name,
	lorenzo@kernel.org
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	kun.wu@mediatek.com,
	deren.wu@mediatek.com,
	sean.wang@mediatek.com,
	quan.zhou@mediatek.com,
	ryder.lee@mediatek.com,
	leon.yen@mediatek.com,
	litien.chang@mediatek.com,
	jb.tsai@mediatek.com
Subject: Re: [PATCH v2] wifi: mt76: mt792x: fix memory leak in USB TX path
Date: Mon, 17 Aug 2026 09:45:06 -0700
Message-ID: <20260817164506.13333-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260817090157.168089-1-eason.lai@mediatek.com>
References: <20260817090157.168089-1-eason.lai@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_094516_838182_11423E55 
X-CRM114-Status: UNSURE (   8.46  )
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

On Mon, 2026-08-17 at 09:23 +0000, Eason Lai wrote:
> If you have time, please help test the v2 on mt7921u.

Done, on an MT7921AU. Unpatched, the socket fills after 111 zero-length
frames and is still blocked 20 s later. With both patches it runs 3000 with
no block, and the driver still rejects all 3000, so only the cleanup changed.

Tested-by: Devin Wittmayer <lucid_duck@justthetip.ca>

That is the tx_prepare_skb exit. The other two never fired in any arm, and
the buffer-setup one cannot fire here at all, since mac80211 caps the
fragment count below the table size. Those two hunks are untested.

One correction from the 16th: mt76s_tx_queue_skb's prepare exit already
frees, from your July patch. Only its queue-full exit still misses it.

Before this lands. The two patches are not marked as a series, and this one
does not say it needs the skb_pad change first. I tried it alone and it
still passes, because the frame returns before the padding runs, so passing
alone proves nothing. Worth sending both as one series.

The skb_pad patch also needs my sign-off under the Co-developed-by, or
checkpatch objects:

Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>

And it is worth Cc: stable. The Fixes goes back to 2018, and on mt7921 and
mt7925 USB this silently kills wpa_supplicant with the link still up, so
nothing notices until a group rekey. The reporter there hit it on different
hardware and ran the equivalent change:

Closes: https://github.com/morrownr/mt76/issues/83

Devin

