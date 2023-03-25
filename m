Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6FB8C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Mar 2023 13:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Subject:Cc:To:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=btFA1Zgf36Mb0XkWjrkK930z/U/G6kXXNVeUFujFjBg=; b=noytUNAkxHAvYl
	E81uYznImDuyKTeqOj29dnjxOdhQyq09IitKCbyQI3rE7kAOe6JhCg7QSP3KRPkcjvBNXdgbp3O24
	o3tuYw5mKKq9sSv/XejRTdtjpL3JAR6JD56pSu37Y8i7Z2mAYbJDeNYVlj/rhYd4q5Im3fKLMltm8
	gPvbp64rQ9SAJw456w9eqQqUuxu7KblGGnsuu8cEEJZK9hsC/TF7sbg8GHph5b7r2NKu1cT1rL+Vi
	jfpHhUQ0PmFDNslI4qtkGPEYyTDabpzxh03+T2+FTh8f8DhjP24zreMjYMecZzoN91/lLEWfDl9HU
	IUpDsn6JB8RgcryS6tcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pg3rp-006kFl-16;
	Sat, 25 Mar 2023 13:23:33 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pg3rm-006kEW-1P
	for linux-mediatek@lists.infradead.org;
	Sat, 25 Mar 2023 13:23:32 +0000
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pg3rZ-0001gO-FN; Sat, 25 Mar 2023 14:23:17 +0100
Message-ID: <dbb0d402-ac95-6355-03aa-42c2671727d7@leemhuis.info>
Date: Sat, 25 Mar 2023 14:23:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US, de-DE
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>
Cc: Kalle Valo <kvalo@kernel.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 netdev <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Bug 217245 - mt7921e tries to load unnecessary firmware
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1679750610;02941b70;
X-HE-SMSGID: 1pg3rZ-0001gO-FN
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230325_062330_621074_23826FB2 
X-CRM114-Status: GOOD (  17.59  )
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

Hi, Thorsten here, the Linux kernel's regression tracker.

I noticed a regression report in bugzilla.kernel.org. As many (most?)
kernel developers don't keep an eye on it, I decided to forward it by
mail. Note, the reporter can be reached though bugzilla, as I sadly can
not CCed them to mails like this[1].

Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=217245 :

> kitestramuort@autistici.org 2023-03-24 21:53:01 UTC
> 
> I compile mt7921e statically into the kernel, along with the firmware
> binaries needed for my MT7922 chip:
> WIFI_MT7922_patch_mcu_1_1_hdr.bin, WIFI_MT7922_patch_mcu_1_1_hdr.bin
> and BT_RAM_CODE_MT7922_1_1_hdr.bin
> 
> Since 6.2, mt7921e also tries to load WIFI_RAM_CODE_MT7961_1.bin and
> fails with
> 
> mt7921e 0000:02:00.0: Direct firmware load for
> mediatek/WIFI_RAM_CODE_MT7961_1.bin failed with error -2
> 
> The card seems to work normally without that binary, so I guess it is
> not needed and it shouldn't be requested. The error doesn't happen
> with the 6.1 kernel

See the ticket for more details.


[TLDR for the rest of this mail: I'm adding this report to the list of
tracked Linux kernel regressions; the text you find below is based on a
few templates paragraphs you might have encountered already in similar
form.]

BTW, let me use this mail to also add the report to the list of tracked
regressions to ensure it's doesn't fall through the cracks:

#regzbot introduced: v6.1..v6.2
https://bugzilla.kernel.org/show_bug.cgi?id=217245
#regzbot title: net: wireless: mt7921e when build in now requires a new
firmware file
#regzbot ignore-activity

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply and tell me -- ideally
while also telling regzbot about it, as explained by the page listed in
the footer of this mail.

Developers: When fixing the issue, remember to add 'Link:' tags pointing
to the report (e.g. the buzgzilla ticket and maybe this mail as well, if
this thread sees some discussion). See page linked in footer for details.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

[1] because bugzilla.kernel.org tells users upon registration their
"email address will never be displayed to logged out users"

