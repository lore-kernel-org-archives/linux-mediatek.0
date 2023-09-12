Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB78CA0ECA
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 12:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M1DE8WKZDqNqHZGuru+m4C1qfry7h9cWio2c7A2bzNM=; b=dsgojGDVRcHpo+
	YmG5BN1+ij01jTonOAO4dqTry/S8xl9SarwrzLrR+IXCsqTUA/LGpZlbukKdS0byCgayFrj8+wSzx
	RJRt7a9Dvvpqc3uSOcxUoF51U+/tObRGGsfTM6srMJzvTJ75F+dbNN+PvDH4Whchv5kLRYnotHwVH
	BRioZff7BlLfRRPHnru/iIxJx0yn55kZrPL/aQ41e57aKUuJZM9dBq9RBDy/Pepuk/gxjD8omteys
	PwPDTy690Ol12nIKHDPom8kWjMDsyc5/Bekx5NKTZpIBR5byKAK/985jq+yxArMSIZc0C5nwv9LsB
	PKfXYa0yaBbYa9ZH1NtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg2QH-003K1s-1C;
	Tue, 12 Sep 2023 12:23:17 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg2QD-003K14-2D
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Sep 2023 12:23:15 +0000
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qg2Q7-0002Bg-GF; Tue, 12 Sep 2023 14:23:07 +0200
Message-ID: <e264149e-c053-4346-a645-e694ed791569@leemhuis.info>
Date: Tue, 12 Sep 2023 14:23:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: regression with 33140e668b10 thermal/drivers/mediatek: Control
 buffer enablement tweaks
Content-Language: en-US, de-DE
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Frank Wunderlich <frank-w@public-files.de>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Linux Regressions <regressions@lists.linux.dev>
References: <trinity-6713557b-fe0a-4dae-84aa-1aa86f7619fa-1693473911557@3c-app-gmx-bs12>
 <ZPBjGWPjSfl-HmDJ@debian.me>
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <ZPBjGWPjSfl-HmDJ@debian.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1694521393;be26dd80;
X-HE-SMSGID: 1qg2Q7-0002Bg-GF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_052313_887687_81DEF6D4 
X-CRM114-Status: GOOD (  11.17  )
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

[TLDR: This mail in primarily relevant for Linux regression tracking. A
change or fix related to the regression discussed in this thread was
posted or applied, but it did not use a Closes: tag to point to the
report, as Linus and the documentation call for. Things happen, no
worries -- but now the regression tracking bot needs to be told manually
about the fix. See link in footer if these mails annoy you.]

On 31.08.23 11:53, Bagas Sanjaya wrote:
> On Thu, Aug 31, 2023 at 11:25:11AM +0200, Frank Wunderlich wrote:
>>
>> The commit 33140e668b10 "thermal/drivers/mediatek: Control buffer enablement tweaks" is merged between 6.3 and 6.4 and causes a regression where temperature cannot be read correctly at least for mt7986/Bpi-R3.
>>
>> bpi-r3 ~ # cat /sys/class/thermal/thermal_zone0/temp
>> -274000
>>
>> after reverting the commit and fixing some build-errors in 6.5-rc7 because new members used in mt8365_thermal_data too, we can read temperature on mt7986 again.
>>
> 
> Thanks for the regression report. I'm adding it to regzbot:
> 
> #regzbot ^introduced: 33140e668b1020
> #regzbot title: incorrect temperature on MT7986 due to tweaking buffer


#regzbot monitor:
https://lore.kernel.org/all/20230907112018.52811-1-linux@fw-web.de/
#regzbot fix: thermal/drivers/mediatek: Fix control buffer enablement on
MT7896
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.



