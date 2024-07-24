Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78DF5C3DA61
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jul 2024 09:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hjn9u+OdaMy0APR3lesVd6VwainbD/Tq9CR8YxQHmzo=; b=qShZqFZCSuMml5
	CKvGqvKoTzA8zlc8GL56r7ppTWZZ24jm6k5fji/V3jCg31R0tNBUSHqFs/CSbUaphptCeja3FUQ7E
	vXeuFeVcI/hjUOHs34AbAUJhzgpqWlh/0QUdEUySjoR0EOXhzSmlhFFnjKbuL51e2Wxw5ylGYrGY5
	pmV/xVDF4rQam2hy+E8UZ8wtaPfaCl8/ZSdAdQyaz63hHtwnx0Ndk5EZ7AGu6lgIEDuH00RWAPfLK
	M2H0Xu6otIIeUcvD0HjIaf0ot1CZXXOgI+DjEiPOpNS1hKT1/7jTcWQuZ6BfDyB7Oh/uLubN0S0PW
	IrSjALbM5rojtsr9aDZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWYQS-0000000ExSv-24pm;
	Wed, 24 Jul 2024 09:36:48 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWYQO-0000000ExSH-3BsG
	for linux-mediatek@lists.infradead.org;
	Wed, 24 Jul 2024 09:36:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:Reply-To:MIME-Version:Date:
	Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=hjn9u+OdaMy0APR3lesVd6VwainbD/Tq9CR8YxQHmzo=;
	t=1721813804; x=1722245804; b=WiQjVEd4/k/KYx09LBRUBn6Vh3dVfDJl8WyYhDzy5MiG8dJ
	qOKCKxAmAJ7C5ltMAI75hP4Ga61P01L7ni1UZdjM9ufc9VbLLQ9UPqIBYz9Irfr9vn/H5pSX+Vluc
	2oDqssXQweT03YO7BfgUVQd+Do1NdbwXNvytGljMRjD7V7MA9IGSgy2pai5Oul4NOP6MWnnq0hdnc
	ZltduwlRpZrFyZbzZm9ZEAyBvLTLtS7FH+J3WUzgJK+feTbCtkiRnl+rwgQvG7ifNNOLPeOLp4SFB
	sIBfLIwSUBs79+LjsLe4IZpk92mcoz5cBmxN5gbXip+bn/57wLdCIWj25exTA5jQ==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sWYQB-0006Zs-8l; Wed, 24 Jul 2024 11:36:31 +0200
Message-ID: <0124ff39-7d63-49f8-bacd-3a40ce37ec4d@leemhuis.info>
Date: Wed, 24 Jul 2024 11:36:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: mt76: mt7921: fix null pointer access in
 mt792x_mac_link_bss_remove
To: sean.wang@kernel.org, nbd@nbd.name, lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com, deren.wu@mediatek.com,
 mingyen.hsieh@mediatek.com, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Bert Karwatzki <spasswolf@web.de>,
 Mike Lothian <mike@fireburn.co.uk>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <20240718234633.12737-1-sean.wang@kernel.org>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <20240718234633.12737-1-sean.wang@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1721813804;17ef7219;
X-HE-SMSGID: 1sWYQB-0006Zs-8l
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240724_023645_004478_18D7FC3D 
X-CRM114-Status: UNSURE (   8.06  )
X-CRM114-Notice: Please train this message.
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



On 19.07.24 01:46, sean.wang@kernel.org wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> Fix null pointer access in mt792x_mac_link_bss_remove.
> 
> To prevent null pointer access, we should assign the vif to bss_conf in
> mt7921_add_interface. This ensures that subsequent operations on the BSS
> can properly reference the correct vif.
>
> [...]
>> Fixes: 1541d63c5fe2 ("wifi: mt76: mt7925: add
mt7925_mac_link_bss_remove to remove per-link BSS")
> Reported-by: Bert Karwatzki <spasswolf@web.de>
> Closes: https://lore.kernel.org/linux-wireless/2fee61f8c903d02a900ca3188c3742c7effd102e.camel@web.de/#b
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>

TWIMC, Mike (now CCed) ran into the problem and on bugzilla confirmed
that this fixes the problem:

https://bugzilla.kernel.org/show_bug.cgi?id=219084
https://lore.kernel.org/all/CAHbf0-HOS-jdRGvJOBmEgaaox3PDbDSTgnnZkZF9pz37Bmh2iw@mail.gmail.com/

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

