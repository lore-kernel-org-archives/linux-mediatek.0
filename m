Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F285C61DDE
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Aug 2026 23:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Spi6ql7+pWm9by5YwyGx21jV2yBJAja8Rbze3rpbS/E=; b=TyOUvl8FdcMiHm33yQfSq5jO0c
	rFxYmYfDym4EEzCpI/IWZrLM0wNejJ2uZAuYO8aoMSb/fX1nCuK829txuktZjF9RKo+7/fOHExTJ0
	XDIv15BgbvcxH418K2kizTJlhQrAlTFT4H8k6kG2NBj6tw4JHQWLF8e7pBFBclRxZgtnzzhkDEPuf
	8r+oVB5qAYmlZqs+CTqbhFu9RqWbnqhL6AvJHPvMm+RKQ8w3Om/MZGl3ZewXuEXtF6uc2Ks1Tap8U
	FtILR0obXb4/1Fd5LRrGkD68JN8eWqZ5sVCPDqsOos5FGbdgYhm+Bs49+GNXyCWYGezldCP/Xf1uq
	1pmr+z0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0SQt-00000007Nbx-1G1q;
	Sat, 29 Aug 2026 23:25:55 +0000
Received: from out-218.mta0.migadu.com ([2001:41d0:1004:224b::da] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0SQp-00000007NbX-45GT
	for linux-mediatek@lists.infradead.org;
	Sat, 29 Aug 2026 23:25:53 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=vYgvfqVKL+gvqjlecyfRg1/rneQasRvsOFWbVIPsXsQ=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788045949; v=1; x=1788650749;
 b=w0g6S0C//IYLSKgQI6EWkxvY1SbAV1HYKQe9OceKQgs1UMvopIyiRrdbOqfvZRtN9f0B+0GJ
 wt3aEL6NroRsNJqfJ7wTOTp3lCoBOSaEq4fTiyIktS+UnC6GMvqjiIcjaduX+Wm2pqkG1ncJkJ4
 OCZPvSacF7C29Rfjnsq6f1M/89YVRxxTFKW32V4OA1gI2jKZAwLvmVt9QminE1BnHwibwgOB5i5
 LXGYaHjuslZNxoOE9nlz9BXh3h/RHXxNUcmXNsbgKu+iUuCKCQUIH0ctSMNzbNX6gjqeMzKJWc5
 zxfvPmj28GmVLY8dTNl6BO7SS2pko3/OO4mdflQVmFNwg==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 22618b5f24637d71;
	Sat, 29 Aug 2026 23:25:39 +0000
X-Mizu-Trace-ID: 22618b5f24637d71
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Thomas Hilber <anthrop@enxio.de>
Cc: linux-wireless@vger.kernel.org,
	ath9k-devel@qca.qualcomm.com,
	linux-mediatek@lists.infradead.org
Subject: Re: AP drops STA data frames for ~130-170ms after 4-way handshake
Date: Sat, 29 Aug 2026 16:25:32 -0700
Message-ID: <20260829232532.29622-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827074442.826644@enxio.de>
References: <20260827074442.826644@enxio.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_162552_443075_F8780773 
X-CRM114-Status: GOOD (  11.32  )
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

On Thu, 2026-08-27 at 07:44 +0200, Thomas Hilber wrote:
> That suggests the pairwise key becomes usable for RX some time after
> hostapd authorizes the controlled port, rather than atomically with it.

I think that's right, and I don't think SoftMAC is where it splits.
I ran your test on two more access points.

The first had no radio at all, just software. Median 2.8 ms over 91
associations, not one above 100. That is your FullMAC column, produced
by a SoftMAC access point.

The second was real silicon: a newer MediaTek part on its own driver,
but the same family you already reported, so corroboration rather than
a fresh witness.

  35 of 40 associations   5 to 16 ms
   5 of 40                116, 128, 138, 162, 181 ms

Your range, just not every time. About one in eight, where you were
seeing nearly all of them.

What separates the fast case from the slow ones isn't SoftMAC, it's
where decryption happens. In software the key works the instant it is
set. Everywhere else it has to be shipped out to a chip first.

The port opens on schedule. It's the key that is still in transit.

Your Atheros access point will skip hardware encryption if you ask it
to, with the nohwcrypt parameter.

If the gap goes with it, that is your answer for the price of a reload.
The MediaTek one has no such switch.

The reorder buffer is out as well. Anything dropped later, at
decryption or at the port check, has already been through it and moved
the window along, so no hole opens and the timer never starts.

Mine differs from yours in three ways: a MediaTek client instead of
your ESP32, 5 GHz wide instead of 2.4 narrow, and my clock starts at
the client's end of the handshake rather than the access point's.

Thanks for the pair that were the same box, same kernel, same hostapd,
differing only in radio and driver. That is what made this worth
chasing.

Devin

