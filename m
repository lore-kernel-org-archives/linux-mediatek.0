Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EEC5C5DF94
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2026 08:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GRxYvEqjyMtNEHGGOwwpL7FG4/jjm1W32/akLYtRNnE=; b=v21Jl2h9utavC30cSnqM5JOaHA
	XEolMMPE8ruxWx1rYGxPU2/B4CHUM0cOFMeluRD1q4sL7nXo0X16cYM6QwCa9ZchTv4xvn1I56bW0
	8SV18oB3N5E5CZwJWcnltFVkbB1Jfkbv1UbOIaZmUHaHduefUTjzqmtTSQpKkCI8N0YhIjPPBliUz
	ha2HBVFXSS6ESutAyWHCXGNGuA3CrxnzbNHP2RBaYWFAgcyYqpWKuA7Q8qHvL9ujEXK/FLZ3PrsCs
	NdJ4PpzAObtGlgecCv1a7U+DJRn7bAMX54h5w/T6gGbyvGXls3RMfyjxiJWms5gh6HpJ1mdlESFY3
	bS0jIJ9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPtd-0000000GBxn-3TeY;
	Mon, 24 Aug 2026 08:19:09 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPtZ-0000000GBx3-3SQp
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Aug 2026 08:19:07 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 8763E240103
	for <linux-mediatek@lists.infradead.org>; Mon, 24 Aug 2026 10:18:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de;
	s=1984.8680eb; t=1787559539;
	bh=GRxYvEqjyMtNEHGGOwwpL7FG4/jjm1W32/akLYtRNnE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:Content-Type:
	 Content-Transfer-Encoding:From;
	b=Ve9RRsfMyI+t5Ee/IwwrAgf8RX5bNtTjBAABKbgZRhASpgXU10DR91PdsIF6RaCT5
	 f+R2lrZwhlBuHBmWrYr49S410WqZrDg7HQc8bpOs/5hKRNGjEYo6X+bbUC+t2hjoik
	 Z1XZz8s163pqtx0KW74Wq37p9/h8BlM1DNm1aZoOqKKdLqXW/WERoO0e/iALUIBC4B
	 5dEQ2cUU/4QnAknfj8vkxU7uqc0301EKHiGow8jYlcf6mNZKvjOjIwgYX2ks9UIAnS
	 eDtPPAumvOKbBltsTPWdBkyxVTZmevdeqC971cdFuscle2LCkqoeTqrPD2/EdlAbbX
	 18rWaQTSSg+XQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hT3hy2Bm8z6v0P;
	Mon, 24 Aug 2026 10:18:58 +0200 (CEST)
Message-ID: <c9f984c4-e3c4-4e41-a502-99db97ce724b@posteo.de>
Date: Mon, 24 Aug 2026 08:18:59 +0000
MIME-Version: 1.0
Subject: Re: [REGRESSION] mt7925: MLO connectivity silently stalls with 6GHz
 link active
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Sean Wang <sean.wang@mediatek.com>
Cc: regressions@lists.linux.dev, linux-wireless@vger.kernel.org,
 Devin Wittmayer <lucid_duck@justthetip.ca>, Felix Fietkau <nbd@nbd.name>,
 lorenzo.bianconi83@gmail.com, linux-mediatek@lists.infradead.org
References: <503eb10e-80cf-493e-95fd-04fc0f94ce01@posteo.de>
 <e4bc5ce3-9a6f-4365-9d36-f6440ded0865@posteo.de>
 <c64f5fa6-4c61-45b6-a513-b971e59d7723@posteo.de>
 <476e7721-580e-4a6b-86e5-5ed782a2c7ec@leemhuis.info>
Content-Language: en-US, de-DE
From: Jonas Hort <jonas.hort@posteo.de>
In-Reply-To: <476e7721-580e-4a6b-86e5-5ed782a2c7ec@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_011906_165913_275D2550 
X-CRM114-Status: GOOD (  26.64  )
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

Thanks Devin, and thanks for pulling Sean in.

git biscet log:
# bad: [8cd9520d35a6c38db6567e97dd93b1f11f185dc6] Linux 7.1
# good: [028ef9c96e96197026887c0f092424679298aae8] Linux 7.0
git bisect start 'v7.1' 'v7.0' '--' 
'drivers/net/wireless/mediatek/mt76/mt7925/'
# good: [ea757740dd87c0b00c4844dd3282dff4d83fa3c7] wifi: mt76: mt7925: 
pass WCID indices to bss_basic_tlv()
git bisect good ea757740dd87c0b00c4844dd3282dff4d83fa3c7
# bad: [cf9db836b1e069a3d6a80c72b9bdc12df78b0dd1] wifi: mt76: mt7925: 
pass mlink to set_link_key()
git bisect bad cf9db836b1e069a3d6a80c72b9bdc12df78b0dd1
# bad: [9e4d518a4707175e1154876b760d4f2b39967e9d] wifi: mt76: mt7925: 
pass mlink to mac_link_sta_remove()
git bisect bad 9e4d518a4707175e1154876b760d4f2b39967e9d
# bad: [dc019e3294c7e3c6e997bb11732d46ce0d9211e9] wifi: mt76: mt7925: 
pass mlink to mcu_sta_update()
git bisect bad dc019e3294c7e3c6e997bb11732d46ce0d9211e9
# bad: [ff643b81bc38eaff6c0ab783a62e4ba9e10d2476] wifi: mt76: mt7925: 
pass mlink and mconf to sta_mld_tlv()
git bisect bad ff643b81bc38eaff6c0ab783a62e4ba9e10d2476
# first 'bad' commit: [ff643b81bc38eaff6c0ab783a62e4ba9e10d2476] wifi: 
mt76: mt7925: pass mlink and mconf to sta_mld_tlv()

On the warning: no hits. I grepped all incident logs for MLD_TLV_LINK
and for anything mentioning primary/mconf, and also checked the
current boot directly. The only mt7925 lines present are the usual
init ones:

   mt7925e 0000:09:00.0: ASIC revision: 79250000
   mt7925e 0000:09:00.0: HW/SW Version: 0x8a108a10, Build Time: 
20260605184651a
   mt7925e 0000:09:00.0: WM Firmware Version: ____000000, Build Time: 
20260605184805

Each incident log captures journalctl -k for the 5 minutes leading up
to the freeze plus the last 400 dmesg lines, so if it had fired around
the stall it should have been in there. Still on the ff643b81bc38
kernel here, so happy to re-check with a different search term if I
grepped for the wrong thing.

Setup is still up and I can build and test whatever is useful.

Thanks,
Jonas
Am 24.08.26 um 06:52 schrieb Thorsten Leemhuis:
> On 8/23/26 22:54, Jonas Hort wrote:
>> Bisect is done. First bad commit:
>>
>> ff643b81bc38eaff6c0ab783a62e4ba9e10d2476
>> wifi: mt76: mt7925: pass mlink and mconf to sta_mld_tlv()
>> Sean Wang, 2026-03-06
>> https://patch.msgid.link/20260306232238.2039675-4-sean.wang@kernel.org
> Then let's add Sean to the list of recipients. :-D
>
> Sean, FWIW, this thread starts here:
>
> https://lore.kernel.org/all/066b30cc-a9e6-4aeb-964d-71551e8ea3ef@posteo.de/t/#u
>
> To quote the summary: "WiFi 7 MLO (5GHz+6GHz) on MT7925 silently stops
> passing traffic after a few minutes, while the driver continues to
> report a fully healthy link. Root cause appears to be a stalled WFDMA0
> TX hardware queue."
>
> Ciao, Thorsten
>> Bisected on vanilla, path-restricted to
>> drivers/net/wireless/mediatek/mt76/mt7925/, using v7.0 as good and
>> v7.1 as bad. Each step was booted and tested with MLO active
>> (5GHz+6GHz, FritzBox 5690 Pro), and every "bad" verdict was confirmed
>> by the WFDMA0 signature (tail frozen while head keeps advancing),
>> not just by the connection dropping.
>>
>>    ea757740dd87  pass WCID indices to bss_basic_tlv()      good (45 min
>> clean)
>>    ff643b81bc38  pass mlink and mconf to sta_mld_tlv()     bad (freeze
>> after ~4 min)
>>    dc019e3294c7  pass mlink to mcu_sta_update()            bad (freeze
>> after ~3 min)
>>    9e4d518a4707  pass mlink to mac_link_sta_remove()       bad (freeze
>> after ~4 min)
>>    cf9db836b1e0  pass mlink to set_link_key()              bad (freeze
>> after ~4 min)
>>
>> git bisect log and the incident logs for each step are available if
>> useful - happy to attach them to the bugzilla ticket or send them
>> here.
>>
>> Let me know if you want anything else tested.
>>
>> Thanks,
>> Jonas
>>
>> Am 22.08.26 um 22:18 schrieb Jonas Hort:
>>> Quick update: v7.0 vanilla has been running clean for over 2 hours now
>>> with MLO active (5GHz+6GHz, same FritzBox 5690 Pro), no freeze at all.
>>>
>>> Am 19.08.26 um 11:03 schrieb Jonas Hort:
>>>> Thanks for the detailed breakdown.
>>>>
>>>> I'll build v7.0 vanilla and test it, as suggested. Fair warning
>>>> though: I'm on vacation this week, so I'll pick this up next week.
>>>> I've also never compiled a kernel before, so it'll likely take me a
>>>> bit of trial and error the first time around - please bear with me
>>>> if it takes a little longer than expected.
>>>>
>>>> Will report back once I have results.
>>>>
>>>> Thanks again,
>>>> Jonas
>>>>
>>>> 19.08.2026 03:18:34 Devin Wittmayer <lucid_duck@justthetip.ca>:
>>>>
>>>>> Thank you very much, that answers both things.
>>>>>
>>>>> The ROC tracing is the more useful of the two even though it came back
>>>>> negative. Two of the three freezes have no ROC activity in them at
>>>>> all, so a
>>>>> link switch that never finished cannot be what starts this. The
>>>>> middle one
>>>>> does have rocabort, mloroc and rocwork in it, but one out of three
>>>>> makes
>>>>> that look like the exception rather than the pattern. So the area I
>>>>> sent you
>>>>> looking at is out, and that is worth knowing before you spend nights on
>>>>> builds.
>>>>>
>>>>> One other thing worth saying first. There is a five patch mt76
>>>>> series on the
>>>>> list at the moment and two of the patches look like they were
>>>>> written for
>>>>> exactly this bug. I do not think they were, and it is your own
>>>>> numbers that
>>>>> show it. The failure 4/5 fixes stops mt76_txq_schedule_list from
>>>>> servicing
>>>>> the queue, and the one 5/5 fixes stops mt76_txq_send_burst once the
>>>>> non-AQL
>>>>> count reaches its cap. Both of those keep frames from ever reaching the
>>>>> hardware, so if either were your problem head would be sitting still
>>>>> alongside tail. Yours does the opposite. Head climbs 390 to 408
>>>>> while tail
>>>>> stays at 260, so the frames are getting into the ring and nothing is
>>>>> finishing them, which is the far end of the same path. 2/5 is a use
>>>>> after
>>>>> free when an interface goes away, so it does not fit either. I would
>>>>> not
>>>>> expect that series to change what you see.
>>>>>
>>>>> On the bisect I would build v7.0 next. There are 32 mt7925 commits
>>>>> between
>>>>> 7.0 and 7.1 and 19 of them are one run of work from Sean Wang,
>>>>> reworking how
>>>>> the driver tracks the per link mlink and WCID for an MLO station.
>>>>> That is
>>>>> the kind of change that fits a bug only showing up with two links
>>>>> up. If
>>>>> v7.0 comes back clean, that series is where I would look. If v7.0 is
>>>>> already
>>>>> broken then it is off the hook and 6.19 becomes the next split. The
>>>>> mt76
>>>>> core and mac80211 both moved in the same window, so mt7925 is where
>>>>> I would
>>>>> look first rather than the only place worth looking.
>>>>>
>>>>> Devin
>>>>>
>>>>> Am 17.08.26 um 23:34 schrieb Jonas Hort:
>>>>>
>>>>>> Quick follow-up: managed to confirm 6.18 as a clean baseline on my
>>>>>> own hardware now (not just secondhand from others in the forum
>>>>>> thread) - running Linux 6.18.42-1-cachyos-lts with MLO active
>>>>>> (5GHz+6GHz, same FritzBox 5690 Pro) for 3 hours straight, no freeze
>>>>>> at all.
>>>>> Am 17.08.26 um 16:25 schrieb Jonas Hort:
>>>>>
>>>>>> One correction to how I described this earlier: the connection does
>>>>>> NOT reliably self-heal on its own. I have manually intervened every
>>>>>> single time to restore connectivity [...]
>>>>>>
>>>>>> Update on the ROC tracing: three real freezes captured now with the
>>>>>> kprobes active (all confirmed via the WFDMA0 tail-frozen signature).
>>>>>>
>>>>>> - Freeze #1 (15:37): no ROC activity in the trace.
>>>>>> - Freeze #2 (15:43): [...] The trace shows several ROC events
>>>>>>     (rocabort, mloroc, rocwork) clustered together.
>>>>>> - Freeze #3 (16:15): no ROC activity again.
>>>>>>
>>>>>> Uploaded all three logs to the bugzilla ticket if useful:
>>>>>> https://bugzilla.kernel.org/show_bug.cgi?id=221884

