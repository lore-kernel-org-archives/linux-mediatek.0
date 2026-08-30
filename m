Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA32C61DB9
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Aug 2026 10:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xDcnSWqAljHjLDyGS8PAQOnLfSyynIxo4V8cm12n4UE=; b=nolJEs5iZ//FXFyTlvjgPaSPwm
	scWRZtNB/IRV3ysz22RmM2sV+yBqliW8TCkpSJRZUlbuv28iu+fj9ibRRVCRXDPJUJ3hCn4elMUvM
	MclIYZda4SQS/m8pIK5gSZIKTnlSrg72wYfHBn5mw+FA3+l2VpYxKSLnBsnY3K8Zv8YJM4UQwCW3s
	p5VFRLck0QhiQo/uJ/QNQGNPqjMsd+Wx9tUYgEPx5lMsMsW64dfYK/oIrBufrgMJ0miz2zzTst2IX
	eXCWpnPytOKfI+rDUUFy36mV1aUXHKZYTvRS2ZdF0F3oiIqCX+Zto6DNh7xsMa9LHS18r3QZq9XGe
	pm2ih/ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0d0D-00000007fQg-2oMa;
	Sun, 30 Aug 2026 10:43:05 +0000
Received: from enxio.de ([91.210.227.97])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0d0A-00000007fQL-42GN
	for linux-mediatek@lists.infradead.org;
	Sun, 30 Aug 2026 10:43:04 +0000
Received: from [95.157.48.181] (helo=roja.toh.cx)
	by enxio.de with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <anthrop@enxio.de>)
	id 1x0d06-0000000854c-18iz;
	Sun, 30 Aug 2026 12:42:58 +0200
Received: from localhost ([127.0.0.1])
	by roja.toh.cx with esmtp (Exim 4.94.2)
	(envelope-from <anthrop@enxio.de>)
	id 1x0d05-002BfQ-M0; Sun, 30 Aug 2026 12:42:57 +0200
From: Thomas Hilber <anthrop@enxio.de>
To: Devin Wittmayer <lucid_duck@justthetip.ca>
Cc: linux-wireless@vger.kernel.org,
	ath9k-devel@qca.qualcomm.com,
	linux-mediatek@lists.infradead.org
Subject: Re: AP drops STA data frames for ~130-170ms after 4-way handshake
 completes (ath9k_htc, mt76; not brcmfmac)
Date: Sun, 30 Aug 2026 12:42:36 +0200
Message-ID: <20260830104236.521389@enxio.de>
In-Reply-To: <20260829232532.29622-1-lucid_duck@justthetip.ca>
References: <20260827074442.826644@enxio.de>
	<20260829232532.29622-1-lucid_duck@justthetip.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_034303_026483_1BC3BC18 
X-CRM114-Status: GOOD (  13.06  )
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

On Sat, 2026-08-29 at 16:25 -0700, Devin Wittmayer wrote:
> Your Atheros access point will skip hardware encryption if you ask it
> to, with the nohwcrypt parameter.
>
> If the gap goes with it, that is your answer for the price of a reload.

It goes with it, and it takes the whole effect with it.

AP4 from my table (AR9271, ath9k_htc, kernel 6.18.39). Same station, same
hostapd, same channel, same bridge, no other station associated; the two
arms were alternated and differ only in the module parameter:

  ath9k_htc         n     connect attempts   >1 attempt   TCP connect
  --------------   ---    ----------------   ----------   -----------
  nohwcrypt=0      216          5.20            97%         134.9 ms
  nohwcrypt=1      302          1.06             3%           4.1 ms

For reference, the AP4 row of my original mail was 105 cycles at 5.04
attempts and 134 ms, taken 11 days earlier. The hardware-crypto arm above
reproduces it to within noise, which is the best evidence I have that
nothing else about the bench moved in between.

Attempt distribution, since the shape matters more than the mean:

  nohwcrypt=0    1:6   2:27  3:24  4:17  5:71  6:29  7:13  8:7  ... 16:1
  nohwcrypt=1    1:292 2:6   3:1   4:2   5:1

Under software crypto 292 of 302 associations placed their first frame
successfully. Under hardware crypto 6 of 216 did.

Two caveats, both of which cut against the result rather than for it.
Cycles where the station never got a reply at all are excluded above: 33 of
249 hardware-crypto cycles and 22 of 324 software-crypto cycles. Dropping
the hardware side's worst cycles understates the gap. And a late arm in the
session degraded for unrelated local reasons and was discarded whole rather
than pooled.

One corroboration measured at the AP, which does not depend on the station's
TCP target at all - completed four-way handshakes in fixed 120s windows,
with the station associating and deep-sleeping in a loop throughout:

  nohwcrypt=0     64, 65 associations per 120s
  nohwcrypt=1     87, 86 associations per 120s

About a third more cycles in the same wall time, which is what you would
expect if every cycle stops losing ~130ms to the dead window.

So the split in my table is not SoftMAC vs FullMAC. It is where the key
lives, exactly as you said - the same driver, on the same silicon, in the
same box, lands in either column depending on one module parameter.
Espressif and brcmfmac looked clean because the key is already in the device
by the time the port opens; ath9k_htc and mt76 look bad because the port
opens first and the key is still on its way to the chip.

That also fits your reorder-buffer point: with hardware crypto the frames
are ACKed, so they have been through the reorder window before they are
discarded, and no hole ever opens.

I have not instrumented the key-install path itself, so I still cannot say
whether the right fix is to defer authorization until the key is confirmed
installed, or to buffer rather than drop in that window. Happy to test
patches, or to run whatever tracing would distinguish those.

Thanks - that was a good call, and a cheap one.

Thomas

