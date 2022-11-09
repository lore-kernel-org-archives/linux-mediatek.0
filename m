Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00DE6C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Nov 2022 19:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:To:References:Cc:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1tsPyOm2uY3wYds6fXOzQZNOz5rNM8oUE76Ckb9lm/Q=; b=qdu5b1RnA96+Jtw9eirxWXcL7J
	inLk0LmxLHKSyNnJo1mI2GUM2oIFJVXTQLP/+OjG94wcSvaalcHa0xnVVgeCkp1mxo1XAz62SzEmE
	lVKSqF8zj9pWm4al3ppOg+3C2EUfiDt76kzxNNNvalSiBg7jxqp0gTS1rQhOVmZv3XR+wySkbDCfB
	N6mNp8N3V8oaj0CRvjgMaJqdMxOFzSMGBtA6nFedCq+q+cyvUZ4QCI622BgCOq/ZZX/9wZhGMZ6CC
	GwiKZZhS4DEvQE4F/sKOR250cFuz1nbnLm7NRM7ErtPC3Zv5bQQ0lJVMQtdv+KrVpsJM8t2kKg+UR
	ymC27CJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osqwd-00GgI1-EE; Wed, 09 Nov 2022 19:41:07 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osqwR-00Gg3Q-98; Wed, 09 Nov 2022 19:40:57 +0000
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1osqwL-0006uB-TC; Wed, 09 Nov 2022 20:40:49 +0100
Message-ID: <cadbced5-be58-8cca-8659-37da39aecc21@leemhuis.info>
Date: Wed, 9 Nov 2022 20:40:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: Kernel Kernel bug caused by (cpufreq: mediatek: Refine
 mtk_cpufreq_voltage_tracking()) on Banana Pi R64 (MT7622) #forregzbot
Content-Language: en-US, de-DE
Cc: linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <930778a1-5e8b-6df6-3276-42dcdadaf682@systemli.org>
To: linux-arm-kernel@lists.infradead.org,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <930778a1-5e8b-6df6-3276-42dcdadaf682@systemli.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1668022855;271ddfff;
X-HE-SMSGID: 1osqwL-0006uB-TC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_114055_496369_7452DF66 
X-CRM114-Status: GOOD (  15.07  )
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

[Note: this mail is primarily send for documentation purposes and/or for
regzbot, my Linux kernel regression tracking bot. That's why I removed
most or all folks from the list of recipients, but left any that looked
like a mailing lists. These mails usually contain '#forregzbot' in the
subject, to make them easy to spot and filter out.]

[TLDR: I'm adding this regression report to the list of tracked
regressions; all text from me you find below is based on a few templates
paragraphs you might have encountered already already in similar form.]

Hi, this is your Linux kernel regression tracker.

On 09.11.22 14:35, Nick wrote:
> Hi,
> while trying to bump OpenWrt Kernel to 6.1rc2 I noticed that the kernel
> is crashing while booting on a Banana Pi R64 (MT7622):
> 
>> [    1.055565] ------------[ cut here ]------------
>> [    1.060204] Kernel BUG at regulator_check_voltage+0xb0/0xf0
>> [verbose debug info unavailable]

[...]

> Reverting commit "cpufreq: mediatek: Refine
> mtk_cpufreq_voltage_tracking()" fixes the kernel bug:
> https://github.com/torvalds/linux/commit/6a17b3876bc8303612d7ad59ecf7cbc0db418bcd

Thanks for the report. To be sure below issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, my Linux kernel regression
tracking bot:

#regzbot ^introduced 6a17b3876bc
#regzbot title cpufreq: mediatek: Kernel BUG at regulator_check_voltage
#regzbot ignore-activity

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply -- ideally with also
telling regzbot about it, as explained here:
https://linux-regtracking.leemhuis.info/tracked-regression/

Reminder for developers: When fixing the issue, add 'Link:' tags
pointing to the report (the mail this one replies to), as explained for
in the Linux kernel's documentation; above webpage explains why this is
important for tracked regressions.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.

