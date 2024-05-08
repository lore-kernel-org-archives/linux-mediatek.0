Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA15BC19F4F
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 May 2024 08:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VYf2x8KePoKCnsFPyEO9iLMDoM/FQ8kORSg9BUE2DME=; b=liz188Uj7zf5p4
	Et1oRyRVspJy+nhkSEf9ilASTTuSTw3vgrqX3N7J/yJkgXQQ9LsOE+jKL8jMTWZpvJEQWtzQrD/r3
	EIxqXmN0vJ4lC8UTmPUh8GzS+E2DbLWKxR6RJ4KV5Xv//6hoZGfzLVNygtZpwzgMyqAPDSa10cpYo
	/rmXymradEJTCvhxILZomnzIIwUXmNuBYAFpmopaV42Zu6YCk2I3og0nSXAMCLlpcxwsBYsWAU7DJ
	6RMPHOXQgV4m5sGTvctqBMh/kys9Ods0tdphXBp8yIGSIniEasqJXwxDSDIsu/R0MRwo9GHMRwLKa
	CNmJWSGwiYQrVTE5XNtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4ckg-0000000Ed66-3QEw;
	Wed, 08 May 2024 08:34:14 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4ckc-0000000Ed4r-0dg7
	for linux-mediatek@lists.infradead.org;
	Wed, 08 May 2024 08:34:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:Reply-To:MIME-Version:Date:
	Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=VYf2x8KePoKCnsFPyEO9iLMDoM/FQ8kORSg9BUE2DME=;
	t=1715157250; x=1715589250; b=JFzqka1vmuU63YtmAW7e22GvO3sU587kVpoLAMa/M6XXluM
	Bk1mwKh/XT7CBs9MB9mQd9+RsUdWdGzLOo32O83sBKbRWU2uenXaDRGsFMZeZmltNiF8Wqp8b4f/4
	gZxDoi+Ac2Ayv7i5bXCjAZZ7v3P7lzYra2EaHJhVxw4OMgMTNVB7YFoIA5Vp1ndntQ1AwKONgoJPA
	taQRNglfH8Zjd0l4UJe4SA3jO28zxRp/4pSLOhjmGtVpEIt8FDyNGr0uqYz8EtFyXUQpU7wbCVV8z
	KKftpaGQCEN2COjF8V/Zjh7LSn8Zyk3OOKLkVhFYxoYm7B8lXop6Q34D0O8xMuFw==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1s4ckO-0007C1-9k; Wed, 08 May 2024 10:33:56 +0200
Message-ID: <0d59ae68-7552-454a-8d01-72c359496901@leemhuis.info>
Date: Wed, 8 May 2024 10:33:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Bluetooth: btusb: Fix the patch for MT7920 the affected
 to MT7921
To: luiz.dentz@gmail.com
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, sean.wang@mediatek.com,
 deren.Wu@mediatek.com, chris.lu@mediatek.com, aaron.hou@mediatek.com,
 steve.lee@mediatek.com, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 patchwork-bot+bluetooth@kernel.org, Peter Tsao <peter.tsao@mediatek.com>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <20240415141922.25055-1-peter.tsao@mediatek.com>
 <171328023414.16225.12939333659144302573.git-patchwork-notify@kernel.org>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <171328023414.16225.12939333659144302573.git-patchwork-notify@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1715157250;f2796227;
X-HE-SMSGID: 1s4ckO-0007C1-9k
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_013410_578766_2F3DA221 
X-CRM114-Status: GOOD (  10.65  )
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

On 16.04.24 17:10, patchwork-bot+bluetooth@kernel.org wrote:
> 
> This patch was applied to bluetooth/bluetooth-next.git (master)
> by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:
> 
> On Mon, 15 Apr 2024 22:19:22 +0800 you wrote:
>> Because both MT7920 and MT7921 use the same chip ID.
>> We use the 8th bit of fw_flavor to distingush MT7920.
>> The original patch made a mistake to check whole fw_flavor,
>> that makes the condition both true (dev_id == 0x7961 && fw_flavor),
>> and makes MT7921 flow wrong.
>>
>> In this patch, we correct the flow to get the 8th bit value for MT7920.
>> And the patch is verified pass with both MT7920 and MT7921.
>>
>> [...]
> 
> Here is the summary with links:
>   - Bluetooth: btusb: Fix the patch for MT7920 the affected to MT7921
>     https://git.kernel.org/bluetooth/bluetooth-next/c/263296438807

Hi! 6.9 is only days close and this is fixing a 6.9 regression, so allow
me to quickly ask: do you still plan to submit this for mainline merge
soon? Or did you already and I just missed it? Ciao, Thorsten

