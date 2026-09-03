Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C911C61DD3
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2026 07:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T0qgcX1mrYnXfG3k8AFOU9fpURS3oirgnGGR+xFMZXM=; b=ST3L87isTu0KWCgEIH230icAHu
	U6r3LuBRCrOUg6HJTven3hCoV5QXeNQ+y+APxrX+zNvPEzgV+TPhTq6u2x7/B+99M9w60ok3M6ph2
	JQQkn915G6dKG+XbkZP2ayBB6K1+gYxadpy3jKVwnxJKDJPOmeAb/rvjhRvbIe/s+Qn0FxPN5KWgW
	csTGPtwy2AAD1uYeYr+/7Wi0duFqZ50duSbGVtg+g/7n0rs67llXPiQiFMrS7D5CUHuZMcAIcHSQG
	MQo2OcQplnnH84xnXSV/UhKuNgQtssLrWSS0nhvAa59dVxXIG0yvJ2eHJrKOXtwc51m1xh453bRSG
	KVGYv00g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x226R-0000000GfF4-48Zj;
	Thu, 03 Sep 2026 07:43:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x226Q-0000000GfDu-2YjA
	for linux-mediatek@bombadil.infradead.org;
	Thu, 03 Sep 2026 07:43:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=T0qgcX1mrYnXfG3k8AFOU9fpURS3oirgnGGR+xFMZXM=; b=DEWcAN1OZ0jF7akALMj2ISyjxh
	1WLaDK//z/oYvAFAyGTIMg0bbexkC8t+nul0j0LZBeovfPhkMWyH0k3JwdajFkLg9leyYFsokBB1h
	4jECpMk6L0JtT8C5I8EEuBFU83dYrkulfpacj2NWR+okQy3j1yEKV/yTtkGM2B7VxHXvEs15sL00M
	tvIHMeRPEyLDAyazzvJHB8gbTuy/HWlknQQTVstiJGpPtbihsbB9rN5f7Xi5xW4vNRw5PCMCXJJyt
	dpiQzymILaDTGY/FMdzmxMFCAI8pKBm0in0PjhXFX1Sikk5xtGRJaOABVGZRzkpV0Ls7OY0jU3p+5
	tOCdNjVA==;
Received: from out-228.mta1.migadu.com ([95.215.58.228] helo=mta1.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x226N-0000000Co3h-3KhY
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Sep 2026 07:43:17 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=PsY1iHq2BeSQCINa9gbajP738oZxwRZg3JA5676l0po=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788421392; v=1; x=1789026192;
 b=OXyk9C1GRMNffJlYf0X1xAAmmUgx+IuZ0wJv5g8GoWn9kh0oiUZA5lvorrgh9qzPNMdZulkb
 4YZ076NUY8leFk4tVaiy1mUZsoGVJi7IO9Dbf5JMNtmu3+7EAMM+EwQWk9cYQOrLinVjYRCxTgS
 QuuwIbSXvyw32RqTRIOFS11UUUvELS0g1b0E8naMGIR997FJM03n4hHG6gADeH4tRV/+ECHrBGX
 FGP4fSepmQNKQio8V0R2GLXhVwSKnB+kVKHfd7/5elJ+NRFKtnDjBsKQPTNGAKy3HvbJfokP+bk
 sqMeM07useOvPLtCUYGO1RshePgAC6RRsuM/jV4o+D2OQ==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 2a69e8a19ec4a853;
	Thu, 03 Sep 2026 07:43:01 +0000
X-Mizu-Trace-ID: 2a69e8a19ec4a853
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Thomas Hilber <thomas.hilber@enxio.de>
Cc: linux-wireless@vger.kernel.org, ath9k-devel@qca.qualcomm.com,
 linux-mediatek@lists.infradead.org
Subject: Re: AP drops STA data frames for ~130-170ms after 4-way handshake
 completes (ath9k_htc, mt76; not brcmfmac)
Date: Thu, 03 Sep 2026 00:42:59 -0700
Message-ID: <178842137902.19372.6968639520035628037@justthetip.ca>
In-Reply-To: <20260831054740.1543875@enxio.de>
References: <20260827074442.826644@enxio.de>
 <20260829232532.29622-1-lucid_duck@justthetip.ca>
 <20260830104236.521389@enxio.de>
 <20260830190028.20209-1-lucid_duck@justthetip.ca>
 <20260831054740.1543875@enxio.de>
X-Mailer: git-send-email 2.55.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_084316_073891_E14A907E 
X-CRM114-Status: GOOD (  13.56  )
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

On Mon, 2026-08-31 at 07:47 +0200, Thomas Hilber wrote:
> Done, and it does not hold here. The window is filled correctly and my
> stall happens anyway.

Welp, that kills it, and TID 0 on its own is enough. I read too much into
one capture.

Your question first, and the answer is half unhelpful. I can't check
whether my slow cycles survive a session where the SSN does arrive,
because I can't reproduce the slow cycles any more. Cleaning up the
harness took the effect with it. My traffic had been going over loopback,
and my timing metric merged the stall into the reassociation gap. Thirty
five associations on the MT7922 across both bands since, nothing in your
range at all. So treat my 27-in-95 from the 30th as unreliable until I can
produce it again.

What I can do is make your window happen deliberately.

I built stock mt76 with a module parameter that sleeps inside set_key, so
a key install takes as long as I like. Same binary both arms, the only
difference is a number I echo into sysfs. The station is on a different
driver, so the delay only hits the AP.

  keydelay_ms=0     key install   1.1 ms
  keydelay_ms=150   key install 155.3 ms

With the delay, all nine associations took 103 to 184 ms before traffic
passed again. Without it, seven of nine were back inside 78 ms.

The reason it works is that mac80211 calls the driver before the key is
reachable. In ieee80211_key_replace, enable_hw_accel runs first and the
rcu_assign_pointer that publishes the key to the RX path runs after it. So
while set_key is blocked, the AP has no key in hardware and none in
software either. It is deaf, not slow.

And yes, the MT7922 does give me a monitor interface on its own phy with
hostapd running, same as yours. So I captured air and the AP's netdev
together through an induced window. Across four windows the station put
21, 26, 25 and 25 data frames on air and the netdev saw 7, 24, 13 and 24.
In a quiet 200 ms a second later, nothing is lost at all.

Which says your 22.2 ms isn't evidence against a deaf window. Frames in
the window are dropped, not delayed, so anything timed at the netdev can
only be timing the survivors. Yours would look fast for the same reason
mine does.

So the measurement worth making is your key install.

  echo 1 > /sys/kernel/tracing/events/mac80211/drv_set_key/enable
  echo 1 > /sys/kernel/tracing/events/mac80211/drv_return_int/enable

Pair each set_key with the next return on the same pid. Near 134 ms and
it's ath9k_htc's key path. A few ms like mine and it isn't, and your
two-mechanisms reading is probably right.

Assuming CCMP, two things you can skip. The key writes take the else
branch in ath_hw_set_keycache_entry and batch into one WMI multi-write,
not six round trips. And the buffer enable and flush around them are a
paired inc/dec, so nothing sits unflushed. TKIP takes a different branch.

Thanks for the monitor-on-the-same-phy trick. That'll save people a run.

Devin


