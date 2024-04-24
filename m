Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03CB6C4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Apr 2024 06:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:Cc:From:References:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BjWj3bvgshQkX0ic9F8zq8at9TWgUDpFINVtQ3l7b5c=; b=tF+nqLXpCF95e8
	mJMX5HM4dMEBBwO2NzoMc3o4EYTXotkbpHWUASVY8SBrVv7Vkm8/91qLcYi4RShF3bUt8WQuHf+KX
	nCCF640ig1es9h2Ad0KoTBd4Vat6j/LHg8rMoHXFJRULbspZbWETZxGRjtjRJJLOQzyc7hfR/Cas4
	vQgaTwPxJEG7llogTjlL/I7/+GYpN0EWsTBypSGFIPbNi5Or+xzhA1c6yrFUK7TzuZXNQKA2bXM0o
	nM6pfBLdWeDmHJKDe0+lCOl3h1sa/GRn75LwLNifRFQXD28azU7G6DYGy0X5haj97mUbRZoCGt0X8
	oLhvj5/QkG11wtXO3YbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzVmG-00000002nL0-3tWg;
	Wed, 24 Apr 2024 06:06:44 +0000
Received: from wp530.webpack.hosteurope.de ([80.237.130.52])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzVmD-00000002nKA-1PNf
	for linux-mediatek@lists.infradead.org;
	Wed, 24 Apr 2024 06:06:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Cc:From:References:To:Subject:Reply-To:MIME-Version:Date:
	Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=BjWj3bvgshQkX0ic9F8zq8at9TWgUDpFINVtQ3l7b5c=;
	t=1713938801; x=1714370801; b=HhvZNXB2HzsXScnNr6hntwnsZwBzJ8/cAgKC2qVTzbO//5L
	yCjTOh4IhvHnjaDlY9LzpqNDIIoo8c9E8FxrOILVKli4TdGn5P2dNhAZ+5z/ObXGIdumscHN9UUCy
	N8vH1HNJhOAa0UswIGgso0DSqaHySbD6ahD53BR+kMyF2NytNm9ADD+cB0L9OIll/YUzZ3aJHwSci
	v7xygaDjdQvzkPih85u2U4OtnTzW8OK9QTkEDgzE5Gj1FMO8LBLEtUvyKI/fLAaI9GOF/sj23mOpm
	H6zdyU40ARMlzf+SkrBEtiH4BQ7U01tVeuaoYOLNIw8j4wcHnpcGbLVtAFfoj9KQ==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rzVm7-0006ig-5J; Wed, 24 Apr 2024 08:06:35 +0200
Message-ID: <3b983390-110e-4c68-a825-6e811de78919@leemhuis.info>
Date: Wed, 24 Apr 2024 08:06:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: BT_RAM_CODE_MT7961_1a_2_hdr.bin is missing in the firmware tree
To: "Artem S. Tashkinov" <aros@gmx.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 chris.lu@mediatek.com, deren.wu@mediatek.com,
 Peter Tsao <peter.tsao@mediatek.com>
References: <6574fc0f-8a24-4aff-8a1b-dbf960b6375d@gmx.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
Cc: linux-bluetooth <linux-bluetooth@vger.kernel.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 linux-mediatek <linux-mediatek@lists.infradead.org>
In-Reply-To: <6574fc0f-8a24-4aff-8a1b-dbf960b6375d@gmx.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1713938801;241da116;
X-HE-SMSGID: 1rzVm7-0006ig-5J
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_230641_566820_0233ED7F 
X-CRM114-Status: UNSURE (   7.96  )
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

On 23.04.24 12:23, Artem S. Tashkinov wrote:
> 
> Could you please push this firmware ASAP?
> 
> It's been reported to be missing:
> https://bugzilla.kernel.org/show_bug.cgi?id=218757

FWIW, that can't be the only solution for that problem, as
Documentation/driver-api/firmware/firmware-usage-guidelines.rst clearly
states:

"""
Users switching to a newer kernel should *not* have to install newer
firmware files to keep their hardware working.
"""

Could anyone from mediatek please confirm that this rule is adhered?

Side note: I wonder if Peter's patch
https://lore.kernel.org/all/20240415141922.25055-1-peter.tsao@mediatek.com/
("Bluetooth: btusb: Fix the patch for MT7920 the affected to MT7921") is
relevant for this.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

