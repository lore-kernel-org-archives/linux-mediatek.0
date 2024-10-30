Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F78D5CC9C
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Oct 2024 11:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0sJmDHzF3+9NwA0bdKyhFbpw9KxO7Gt5iyWJOMeiOw4=; b=XY8YS5ZHno+f7gPtDA9aaVhk2J
	TVEVW21p5fZF1uCea1ElSI6z6a7zbQnIzlFlX6yOPYK+oVE/AgP5r+BIT1xh5zkx6vOeuHjzyWyro
	8kcs4tUrhAUMxGtcSnWcZY0zEHkQW2JK/sFaEfu3AzyE2Lvu6AgIFRPvh2V4psXYUktMS1fDJuBON
	GXkbgLqdPqAT0Hd2Nxb6NU9g/d9SYD/hs3EI/4e09FybsDBpfZkpDGxIstfKhjgWTVC6u69S6ub0z
	wtePVMX0e0lC/AP57L+CepV6VOmjdIhSg/KPs2iYWo4esuu7TnZXFDSl9jremnS0PAdCt//JdrE7e
	dTIJBbyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t67A7-00000000CWf-0qPC;
	Wed, 30 Oct 2024 11:46:55 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t66tE-000000008Tb-2Tai
	for linux-mediatek@lists.infradead.org;
	Wed, 30 Oct 2024 11:29:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=0sJmDHzF3+9NwA0bdKyhFbpw9KxO7Gt5iyWJOMeiOw4=; t=1730287768;
	x=1730719768; b=SZqwSmJGp38TLkXhnsoRRkhiz+kVwZzTtwact4UzKVJUs8qvvRgcI2+7S7b23
	AIuiaRCBesjc89fDowCL+UHEScvMd+/7O6tWJjfkvpITPRJWaAP5BxZHx7pX6oUslid3aav3E18Lb
	StZeziQ7KvEvYzwGqLu1Tuu/TN1eJuHs2gM0zsC6mplG3D9SI/mFOA5YOj5sY9zYjIwXCvlWLEYlb
	3xkKg5RWfIPvibfv1HwHENu7YIcU8fDOLIDoVNl0z14MoCPiuH/YHepPvDgnnzi6SMLwUYyVybnMV
	0E4U0M40UZR/cj5q0rh1LiMcUC4EtIfwwrqwegKA7lMTPXNYhQ==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1t66t9-0002YK-Sz; Wed, 30 Oct 2024 12:29:24 +0100
Message-ID: <0a988691-8c18-4dca-ac78-94e36a9b8b37@leemhuis.info>
Date: Wed, 30 Oct 2024 12:29:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Bluetooth: btmtk: Remove resetting mt7921 before
 downloading the fw
To: =?UTF-8?B?Q2hyaXMgTHUgKOmZuOeomuazkyk=?= <Chris.Lu@mediatek.com>,
 "luiz.dentz@gmail.com" <luiz.dentz@gmail.com>,
 =?UTF-8?B?SGFvIFFpbiAo56em5rWpKQ==?= <Hao.Qin@mediatek.com>
Cc: "marcel@holtmann.org" <marcel@holtmann.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
 =?UTF-8?B?RGVyZW4gV3UgKOatpuW+t+S7gSk=?= <Deren.Wu@mediatek.com>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "johan.hedberg@gmail.com" <johan.hedberg@gmail.com>,
 =?UTF-8?B?U3RldmUgTGVlICjmnY7oppboqqAp?= <steve.lee@mediatek.com>,
 "marc.payne@mdpsys.co.uk" <marc.payne@mdpsys.co.uk>,
 "tiwai@suse.de" <tiwai@suse.de>, Sean Wang <Sean.Wang@mediatek.com>,
 =?UTF-8?B?QWFyb24gSG91ICjkvq/kv4rku7Ap?= <Aaron.Hou@mediatek.com>
References: <20240822052310.25220-1-hao.qin@mediatek.com>
 <ZuB3omUkdUHLggYu@mdpsys.co.uk>
 <790e542aa9d08c7efeee6ef298fce2a87d8035e4.camel@mediatek.com>
 <ZuneSM4SvyUFX86j@mdpsys.co.uk>
 <9bfbbf24ac2480d94d3455f7e33e4b5502b38ced.camel@mediatek.com>
 <CABBYNZKYsL9jcF2n9TsA1BjU-CjXOdXu7MDLP9Sz_Ly8hBAf1w@mail.gmail.com>
 <c01e6dfa730dd10a7d4dba60fe31e82b9c296b37.camel@mediatek.com>
 <Zuyk1c6Gkxx3G0PB@mdpsys.co.uk>
 <f9e8688ebe559e10c019d0cbab4e8b1f5a7d2339.camel@mediatek.com>
 <ff502f63-2d87-4dee-a893-cce53353df8b@leemhuis.info>
 <87iktk4d9l.wl-tiwai@suse.de>
 <75f671b6-ce2a-4404-b662-2c9c7d28a598@leemhuis.info>
 <d0f70e662f5e9329cff43f92a5c191601cc599f1.camel@mediatek.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <d0f70e662f5e9329cff43f92a5c191601cc599f1.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1730287768;0f8db426;
X-HE-SMSGID: 1t66t9-0002YK-Sz
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_042928_805204_24869089 
X-CRM114-Status: GOOD (  43.47  )
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

On 30.10.24 12:03, Chris Lu (陸稚泓) wrote:
> 
> Let me recap and update the status of this problem.

Many thx!

> Marc feedback that he has some problem with MT7921AUN usb module.
> Originally, we thought it was caused by the change "Fixes:
> ccfc8948d7e4d9 ("Bluetooth: btusb: mediatek: reset the controller before downloading the fw")". The change is mainly for MT7922, we found some problem with MT7921 on specific platform internally. As a result, Hao sent another patch to remove MT7921 from that rule(Bluetooth: btmtk: Remove resetting mt7921 before downloading the fw).
> 
> However, Marc also mentioned that BT is able to work if changing back
> to an old firmware bin. Based on the clue, we found it was caused by a
> firmware change that specific MT7921 model will not able to setup
> successfully. (In fact, we didn't expect that MT7921AUN can be get by
> normal user.)
> 
> Since we can't predict which model user use and Luiz also suggests
> MediaTek to fix it if that model can work before, we have prepared a
> solution. I've verified the solution locally that MT7921AUN model can
> work normally on Ubuntu PC. It will be a firmware modification. We plan
> to submit new firmware with this modification in 2024 Nov.

Great, but due to the kernel's "no regressions" rule this is mostly
irrelevant, as the regression must be fixed in a way that does not
require users to change their firmware.

So is any such solution in sight? Or should we just revert
ccfc8948d7e4d9 and any related follow up patches for now? Or would that
just cause regressions for other users?

Ciao, Thorsten

> On Wed, 2024-10-30 at 10:21 +0100, Thorsten Leemhuis wrote:
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>> 
>> 
>> Hi, Thorsten here, the Linux kernel's regression tracker. Top-posting
>> for once, to make this easily accessible to everyone.
>> 
>> I'm a bit lost here, but maybe I'm missing something.
>> 
>> Luiz, can you help out here? Is there a reason why this patch is not
>> making any process?
>> 
>> Chris Lu and/or Hao Qin: Can you maybe help out as well as well and
>> help
>> with resolving some open questions that might or might not be
>> relevant
>> (see below).
>> 
>> From Takashi reply, the bugzilla ticket he linked to, and the mail
>> from
>> the MediaTek folks
>> (
>> https://lore.kernel.org/lkml/12a344e25b31ec00fe8b57814d43fcb166e71be5.camel@mediatek.com/
>> ) it from the outside looks like this patch should really be merged
>> rather sooner that later as it fixes regressions for some people.
>> Afaics it should get a "Fixes: ccfc8948d7e4d9 ("Bluetooth: btusb:
>> mediatek: reset the controller before downloading the fw")" tag, as
>> it's
>> afaics that commit that causes the regression that is known since
>> more
>> than three months now
>> (https://lore.kernel.org/all/ZsTh7Jyug7MbZsLE@mdpsys.co.uk/ ).
>> 
>> But note, it seems it does not fix the regression completely
>> according
>> to Marc's testing.
>> https://lore.kernel.org/all/ZuCB98DSdtKCgxaL@mdpsys.co.uk/
>> 
>> Marc: Is that still how things are with current mainline?
>> 
>> Ciao, Thorsten
>> 
>> 
>> On 22.10.24 12:56, Takashi Iwai wrote:
>> > On Mon, 14 Oct 2024 11:29:40 +0200,
>> > Linux regression tracking (Thorsten Leemhuis) wrote:
>> > > 
>> > > On 20.09.24 08:27, Chris Lu (陸稚泓) wrote:
>> > > > On Thu, 2024-09-19 at 23:25 +0100, marc.payne@mdpsys.co.uk
>> > > > wrote:
>> > > > > 
>> > > > > External email : Please do not click links or open
>> > > > > attachments until
>> > > > > you have verified the sender or the content.
>> > > > >  Hi Chris and Luiz,
>> > > > > 
>> > > > > What were your thoughts on the findings in my email dated
>> > > > > 18th
>> > > > > September?
>> > > > 
>> > > > Thanks for your suggestion.
>> > > > 
>> > > > I've prepared the same environment (Kernel v6.11 + MT7921AUN
>> > > > dongle) to
>> > > > reproduce the issue, collected necessary logs locally and also
>> > > > initiated an internal discussion to clarify the root cause of
>> > > > this
>> > > > symptom. We'll review the changes between two firmware
>> > > > (20230526/20231109) if it's a bug or not.
>> > > > 
>> > > > It may take some time to investigate. I'll let you know if
>> > > > there is any
>> > > > progress.
>> > > 
>> > > Just wondering: Chris Lu, and Marc, what's the status here? From
>> > > here it
>> > > looks like there was no progress to fix this regression for a
>> > > while, but
>> > > it's easy to miss something, that's why I ask.
>> > > 
>> > > Ciao, Thorsten
>> > 
>> > FWIW, the similar bug was reported for the recent 6.11.x kernel on
>> > openSUSE Tumbleweed, and this patch was confirmed to work around
>> > the
>> > crash at boot:
>> >   
>> > https://urldefense.com/v3/__https://bugzilla.suse.com/show_bug.cgi?id=1231599__;!!CTRNKA9wMg0ARbw!jYyH2oubBEtIKXmKl9cI2rrmK-7kSdaiIJQ8xH4NZa5i5YCTQDHaoOxCBhMgdAAY6ROIPAoPwbOV-LNeMRJBlR6u-As$
>> > 
>> > It'd be great if you can go ahead and merge the proper fix to the
>> > upstream.
>> > 
>> > Let me know if you have another patch to test.  Then I can create a
>> > test kernel package and ask the bug reporter for testing.
>> > 
>> > 
>> > thanks,
>> > 
>> > Takashi
>> > 
>> 
>> 
> 
> ************* MEDIATEK Confidentiality Notice ********************
> The information contained in this e-mail message (including any 
> attachments) may be confidential, proprietary, privileged, or otherwise
> exempt from disclosure under applicable laws. It is intended to be 
> conveyed only to the designated recipient(s). Any use, dissemination, 
> distribution, printing, retaining or copying of this e-mail (including its 
> attachments) by unintended recipient(s) is strictly prohibited and may 
> be unlawful. If you are not an intended recipient of this e-mail, or believe 
> that you have received this e-mail in error, please notify the sender 
> immediately (by replying to this e-mail), delete any and all copies of 
> this e-mail (including any attachments) from your system, and do not
> disclose the content of this e-mail to any other person. Thank you!
> 


