Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3324C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Feb 2022 10:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fs8L8jiq0buvtL/amXmknupJ19t4MA4md4g1Khtj4UM=; b=APTHeBOvhwxI1n
	ZaL2K4vzzPZJkqhwPzDkqU1oTa6TiatNKn1r1BRHtI403PXSmNjXtlaK3EI3asCzo/Mmri6bd5l1J
	NitYwsfo84K483WMrZvLNid1fORxU5W4rMfswYbcWdptrRHE0efqOYyiWQ66NLSt41CpzeX5E+tgz
	khadSEijcE+1FMDyTqCG4IImoWZPTPJdBWn/L9aXltHaMsDX4yMsj1woSHQsMz4HyjXiYO8x86g75
	HL6Frq8z+V6CFC+5mraY2BxsUEU/0oHkMqLNN5pK0tBmjw8zhiAFtL9OEZCFVV7BdX7BTGrJmpkAO
	Io5exKVsXJFVUxXM9NIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFD0z-00EvSd-66; Wed, 02 Feb 2022 10:37:29 +0000
Received: from mail.profitfirm24.com.pl ([212.237.10.110])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFD0q-00EvQz-3j
 for linux-mediatek@lists.infradead.org; Wed, 02 Feb 2022 10:37:21 +0000
Received: by mail.profitfirm24.com.pl (Postfix, from userid 1001)
 id DA209AAB79; Tue,  1 Feb 2022 09:17:48 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=profitfirm24.com.pl;
 s=mail; t=1643708019;
 bh=M1ZVeu3q6Upppe+FUx/3rgI7MKJXh389NZDbgCK1SX4=;
 h=Date:From:To:Subject:From;
 b=o6vNYPwtIVR48N18rSj7onwCuPCcSEG+zEYGrU1o0LCBQsixg6HB5noe8L0XjoKGe
 rzqGr6qNax8ZLku2nQNUxv8240x2dibddRuD5i1SKNF//fZUc+nF2vh5XbA6Lxu2d7
 syqesPkThiF/79OPUzs/Y6J8kXwRWdYjJsv9gP9KJZq5MIO/3wPII+QhTj3FdI5Lr3
 TcwGO+tl2CNYWXjZMmiJLp9aIKuBEU5paoWLm5rSLoAMFGk/JTSyUph4HFmhBjfcRL
 nSTbvHQKT9po83LeK0pg7lzToihWXzbND3SqHEHtD8ESH/7RjZrvBLLgaWEOdx+sB8
 tfmsB5RAPW0LA==
Received: by profitfirm24.com.pl for <linux-mediatek@lists.infradead.org>;
 Tue,  1 Feb 2022 09:17:20 GMT
Message-ID: <20220201074652-0.1.b.2zko.0.ne0elovbjm@profitfirm24.com.pl>
Date: Tue,  1 Feb 2022 09:17:20 GMT
From: =?UTF-8?Q?"Arkadiusz_Soko=C5=82owski"?=
 <arkadiusz.sokolowski@profitfirm24.com.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: Koszty instalacji fotowoltaicznej
X-Mailer: mail.profitfirm24.com.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_023720_317030_EFA50661 
X-CRM114-Status: UNSURE (   1.28  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

RHppZcWEIGRvYnJ5LAoKc3R3b3J6eWxpxZtteSBzcGVjamFsbsSFIG9mZXJ0xJkgZGxhIGZpcm0s
IG5hIGtvbXBsZWtzb3fEhSBvYnPFgnVnxJkgaW53ZXN0eWNqaSB3IGZvdG93b2x0YWlrxJkuICAK
ClNwZWNqYWxpenVqZW15IHNpxJkgdyB6YWtyZXNpZSBkb2JvcnUsIG1vbnRhxbx1IGkgc2Vyd2lz
aWUgaW5zdGFsYWNqaSBmb3Rvd29sdGFpY3pueWNoLCBkeXNwb251amVteSBuYWpub3dvY3plxZtu
aWVqc3p5bWkgcm96d2nEhXphbmlhLCBrdMOzcmUgemFwZXduacSFIFBhxYRzdHd1IG9jemVraXdh
bmUgcmV6dWx0YXR5LgoKTW/FvGVteSBwcnp5Z290b3dhxIcgZGxhIFBhxYRzdHdhIHdzdMSZcG7E
hSBrYWxrdWxhY2rEmSBpIHByemVhbmFsaXpvd2HEhyBlZmVrdHkgbW/FvGxpd2UgZG8gb3NpxIVn
bmnEmWNpYS4KCkN6eSBzxIUgUGHFhHN0d28gb3R3YXJjaSBuYSB3c3TEmXBuxIUgcm96bW93xJkg
dyB0eW0gdGVtYWNpZT8KCgpQb3pkcmF3aWFtCkFya2FkaXVzeiBTb2tvxYJvd3NraQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsg
bWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
