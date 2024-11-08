Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C230D5E14C
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Nov 2024 09:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w1UGDLfzBd48caEF/4T14qGMWvTrOfwILUW8bbDPzfo=; b=102+DnKVnlZk6/XAZR8C1hu4BZ
	qd4mRigQAyoP5A+qFXT2rthly/3WuTz5bNRY33NMu55y2FKrl4lKDY1bmqGkJztXgxqTi2zLafnCV
	dskcxNHSwZL359Dao3VClc/RRdQ7czisV5dUgQ7+s9kycyv8vY5xIYosBrVkqKNfGWZD8EtY7hg6H
	n+q2aH0knI/CCKMsmwbBaAWus6Aw4DJcS+PQY/1zOmQbOehsyLvvMdoCZsnWD9kwiMWkw4KgPIzO8
	m2uiQmBHOYCsd3WUHTMeOXuycrK3FbfGJl+8pnTKH65yOOaewoLaapP+9iM5rh/SVwJ86sg8dgvmt
	fL+khUqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Lgw-0000000A1Pj-42pp;
	Fri, 08 Nov 2024 09:54:10 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Lgt-0000000A1OY-3BYA
	for linux-mediatek@lists.infradead.org;
	Fri, 08 Nov 2024 09:54:09 +0000
Received: from [192.168.0.2] (unknown [95.90.242.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id DCDD5600AA6A1;
	Fri, 08 Nov 2024 10:53:47 +0100 (CET)
Message-ID: <c81aa403-499b-4639-88a0-887575731d39@molgen.mpg.de>
Date: Fri, 8 Nov 2024 10:53:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] linux-firmware: update firmware for mediatek bluetooth
 chip (MT7920)
To: =?UTF-8?B?Q2hyaXMgTHUgKOmZuOeomuazkyk=?= <Chris.Lu@mediatek.com>
Cc: marcel@holtmann.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 =?UTF-8?B?QWxsYW4gV2FuZyAo546L5a625YGJKQ==?= <Allan.Wang@mediatek.com>,
 linux-bluetooth@vger.kernel.org, ben@decadent.org.uk,
 linux-firmware@kernel.org, Johan Hedberg <johan.hedberg@gmail.com>,
 =?UTF-8?B?U3RldmUgTGVlICjmnY7oppboqqAp?= <steve.lee@mediatek.com>,
 Sean Wang <Sean.Wang@mediatek.com>, =?UTF-8?B?QWFyb24gSG91ICjkvq/kv4rku7Ap?=
 <Aaron.Hou@mediatek.com>, jwboyer@kernel.org, dwmw2@infradead.org
References: <20241108082515.19817-1-chris.lu@mediatek.com>
 <46444b60-2d1a-45c2-9a96-8352d1879516@molgen.mpg.de>
 <024285d0deb37c1444b1aaa4cba64542fe4ac844.camel@mediatek.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <024285d0deb37c1444b1aaa4cba64542fe4ac844.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_015407_947491_5F5C8359 
X-CRM114-Status: GOOD (  13.42  )
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

Dear Chris,


Thank you for your quick reply

Am 08.11.24 um 10:25 schrieb Chris Lu (陸稚泓):

> I'll send a v2 to update commit message based on your suggestions.

You are quick, and I got it already.

> On Fri, 2024-11-08 at 09:37 +0100, Paul Menzel wrote:

[…]

>> It’d be great if you added a change-log.
>>
> We'll updates the firmware with Wi-Fi module at the same time if either
> of modules has any fix need to be upstream.
> 
> It's a routine update to MT7920 Bluetooth side.

So, this time, there are no Bluetooth fixes, only for Wi-Fi?

>>> Signed-off-by: Chris Lu <chris.lu@mediatek.com>
>>> ---
>>>    WHENCE                                   |   2 +-
>>>    mediatek/BT_RAM_CODE_MT7961_1a_2_hdr.bin | Bin 493809 -> 493809 bytes
>>>    2 files changed, 1 insertion(+), 1 deletion(-)

Kind regards,

Paul

