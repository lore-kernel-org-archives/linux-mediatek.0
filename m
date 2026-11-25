Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06763606A326
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2026 11:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OMfUQLlZ;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=fdJjCzdn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lH9pAEfOzu1+G8D5WBcJiupE42glrYQ4vyzgeROIaKg=; b=OMfUQLlZy4b/Rh
	YW3zH9dHp6t3VcFukWgVo8AWgGLbFdWFn9kHMgdukfYQEVsscGeIBbsiSkLqCMS9iwCV704cUsmfB
	y7lmfDVvUy1uRvkCMw0s4/eSPSJFXUi0e27ODDB8iiHqvxeBRS3pWbHfxE4vkEs7A/PB/qSBI9N7G
	KKT4M1my0v2aa5guPxdOQ5RpC2xKHYEOto4X5MHsqY5ZCqdMq5pgJqy2aqE78nmAxn/0H9wqFzRe0
	zsc6IAQY0QDidoNdz1k1EwCFJHU9Xhm9OfYmZkOesvfnDCaZbubVWjGPBncaRaXfZuURSpwRq5vy8
	pp2V56n3UE7H93Fgh2nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWAni-00000009XYC-2OvP;
	Wed, 25 Nov 2026 11:04:34 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWAng-00000009XVu-0nnJ
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Nov 2026 11:04:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lH9pAEfOzu1+G8D5WBcJiupE42glrYQ4vyzgeROIaKg=; b=fdJjCzdn+Bro1cJSsKPn3eGo4e
	XK7NGxMicLrHuWCbH8XVIgiHha6dIOu+8eDUI/hnsk4py7HNl9Uii0QvuibmR4yDqsKRP7BoQT7UK
	G2Dt47ty4RERRXXYg9mNmZSJILEk14AuNP8wx/qjUiLa9oV/MLzddtW2mV65h0nKXMyw=;
Received: from p54a43741.dip0.t-ipconnect.de ([84.164.55.65] helo=nf.local)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xWAnQ-008A3F-1L;
	Wed, 25 Nov 2026 12:04:16 +0100
Message-ID: <f069fceb-a57a-467a-8ebf-5c947c34a03c@nbd.name>
Date: Wed, 25 Nov 2026 12:04:15 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/28] wifi: mt76: mt7925: add MLO hybrid and EMLSR
 support
To: Emery Hsin <emery.hsin@mediatek.com>, lorenzo@kernel.org
Cc: Sean.Wang@mediatek.com, jb.tsai@mediatek.com, Quan.Zhou@mediatek.com,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20261110031244.369014-1-emery.hsin@mediatek.com>
Content-Language: en-US
From: Felix Fietkau <nbd@nbd.name>
Autocrypt: addr=nbd@nbd.name; keydata=
 xsDiBEah5CcRBADIY7pu4LIv3jBlyQ/2u87iIZGe6f0f8pyB4UjzfJNXhJb8JylYYRzIOSxh
 ExKsdLCnJqsG1PY1mqTtoG8sONpwsHr2oJ4itjcGHfn5NJSUGTbtbbxLro13tHkGFCoCr4Z5
 Pv+XRgiANSpYlIigiMbOkide6wbggQK32tC20QxUIwCg4k6dtV/4kwEeiOUfErq00TVqIiEE
 AKcUi4taOuh/PQWx/Ujjl/P1LfJXqLKRPa8PwD4j2yjoc9l+7LptSxJThL9KSu6gtXQjcoR2
 vCK0OeYJhgO4kYMI78h1TSaxmtImEAnjFPYJYVsxrhay92jisYc7z5R/76AaELfF6RCjjGeP
 wdalulG+erWju710Bif7E1yjYVWeA/9Wd1lsOmx6uwwYgNqoFtcAunDaMKi9xVQW18FsUusM
 TdRvTZLBpoUAy+MajAL+R73TwLq3LnKpIcCwftyQXK5pEDKq57OhxJVv1Q8XkA9Dn1SBOjNB
 l25vJDFAT9ntp9THeDD2fv15yk4EKpWhu4H00/YX8KkhFsrtUs69+vZQwc0cRmVsaXggRmll
 dGthdSA8bmJkQG5iZC5uYW1lPsJgBBMRAgAgBQJGoeQnAhsjBgsJCAcDAgQVAggDBBYCAwEC
 HgECF4AACgkQ130UHQKnbvXsvgCgjsAIIOsY7xZ8VcSm7NABpi91yTMAniMMmH7FRenEAYMa
 VrwYTIThkTlQzsFNBEah5FQQCACMIep/hTzgPZ9HbCTKm9xN4bZX0JjrqjFem1Nxf3MBM5vN
 CYGBn8F4sGIzPmLhl4xFeq3k5irVg/YvxSDbQN6NJv8o+tP6zsMeWX2JjtV0P4aDIN1pK2/w
 VxcicArw0VYdv2ZCarccFBgH2a6GjswqlCqVM3gNIMI8ikzenKcso8YErGGiKYeMEZLwHaxE
 Y7mTPuOTrWL8uWWRL5mVjhZEVvDez6em/OYvzBwbkhImrryF29e3Po2cfY2n7EKjjr3/141K
 DHBBdgXlPNfDwROnA5ugjjEBjwkwBQqPpDA7AYPvpHh5vLbZnVGu5CwG7NAsrb2isRmjYoqk
 wu++3117AAMFB/9S0Sj7qFFQcD4laADVsabTpNNpaV4wAgVTRHKV/kC9luItzwDnUcsZUPdQ
 f3MueRJ3jIHU0UmRBG3uQftqbZJj3ikhnfvyLmkCNe+/hXhPu9sGvXyi2D4vszICvc1KL4RD
 aLSrOsROx22eZ26KqcW4ny7+va2FnvjsZgI8h4sDmaLzKczVRIiLITiMpLFEU/VoSv0m1F4B
 FtRgoiyjFzigWG0MsTdAN6FJzGh4mWWGIlE7o5JraNhnTd+yTUIPtw3ym6l8P+gbvfoZida0
 TspgwBWLnXQvP5EDvlZnNaKa/3oBes6z0QdaSOwZCRA3QSLHBwtgUsrT6RxRSweLrcabwkkE
 GBECAAkFAkah5FQCGwwACgkQ130UHQKnbvW2GgCeMncXpbbWNT2AtoAYICrKyX5R3iMAoMhw
 cL98efvrjdstUfTCP2pfetyN
In-Reply-To: <20261110031244.369014-1-emery.hsin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_030432_305916_120DB06B 
X-CRM114-Status: GOOD (  16.48  )
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
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Emery,

On 10.11.26 04:12, Emery Hsin wrote:
> This series adds station-mode multi-link operation to the mt7925 driver:
> three-link hybrid MLO (one link per band) and EMLSR for APs on a vendor
> OUI allowlist. Hybrid MLO and EMLSR are gated by the chip capabilities
> the firmware reports.
> 
> Patches 1-8 fix the basic rate sent in the STA phy TLV and a sub-link
> memory leak on disconnect, both with Fixes tags, then prepare the series
> with no functional change: named constants for chip_cap, the DBDC band
> and the HT secondary channel offset, a link STA wcid unwind helper, and
> a gated mt792x_mcu_set_dev_active() also used by mt7921.
> 
> Patches 9-10 deactivate the DEV and BSS on disconnect and reactivate the
> DEV before a reconnect, scan or off-channel operation. This covers the
> MLO to legacy switch fixed by commit 8f9e5807671e ("wifi: mt76: mt7925:
> restore the legacy BSS after MLO teardown") and replaces its BSS re-add.
> 
> Patches 11-19 add the firmware interfaces the link setup needs (the
> third-link band limit, the EMLSR OUI allowlist and a multi-link
> remain-on-channel) and keep the MLD consistent as links are added.
> Patch 14 replaces the pending link parameter of commit dd3f17ef69ed
> ("wifi: mt76: mt7925: keep MLD membership consistent during link add").
> 
> Patches 20-28 bring up all links at authorization with one MLO ROC,
> install the existing keys on the added links, apply the link state the
> firmware reports, remap hybrid MLO TX to the primary link OMAC, and add
> a hm_alg_ctrl debugfs file to override the firmware link plan.
> 
> The series is based on mt76 commit 8739e5b44b23 ("wifi: mt76: connac:
> bound the scan IEs in mt76_connac_mcu_hw_scan()").
There are a few issues in the series that needs to be resolved:

1. There are bisection issues in the series:
- 9 and 10: patch 9 deactivates the DEV on disconnect, and only patch 10 
reactivates it. With patch 9 alone, a reconnect, scan or off-channel 
operation fails.
- 14 to 19: adding a second link sends the firmware an incomplete MLD 
record. Patch 19 is the first to publish all links before any STA_REC.
- 18 to 23: links added through mac80211 never get the associated-state 
raise in firmware. Patch 18 also says the raise moves to the add-links 
caller, which is not true at that commit.
- 22: adds a static function that nothing calls until patch 23.

2. Other bugs:
- 1: NULL dereference when a NAN peer is added, because a NAN vif has no 
channel. The Fixes: tag also names the wrong commit.
- 2: besides the leak fix, it skips the BSS removal for station 
sub-links. That leaves dev->mt76.wcid[] pointing at freed memory.
- 9: sets the band to AUTO on mt7927 too, which keeps a fixed band 
elsewhere.
- 10: misses the WoWLAN net-detect path, which scans without 
reactivating the DEV.
- 13: a remain-on-channel takeover tells mac80211 that a ROC ended even 
for join and GO requests, which mac80211 never started.
- 14: the record's secondary link can be the primary link itself, 
whenever the primary has the higher BSS index.
- 15: the firmware link index from hweight16(old_links) can collide with 
the index of a link that stays.
- 19: on the error path of the primary re-add at authorization, the WTBL 
index is freed twice.
- 22: the key re-install skips the keyidx > 5 filter, so the BIGTK takes 
the single IGTK slot.
- 23:
     - A TDLS peer's authorization reaches the link setup and crashes 
(NULL link_sta).
     - A second authorization allocates every link again: leak, and a 
second teardown of the primary.
     - If the AP removes a link that mac80211 had inactive, mac80211 
never tells the driver. The result is a leak, then a NULL dereference at 
the next disconnect.

Thanks,

- Felix

