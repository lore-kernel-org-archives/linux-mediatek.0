Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 837FCC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Dec 2021 08:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EipkIzmcLY7RdRb26ek3pSYwO9OAqCEbN2lRjLM/mnI=; b=A7DIoktVLZ3lJD
	SC8qGkk4koj51y2Ld9bJo11eOYVPhbtpOnq+IHUKkmRDK8KcW7Nb9gdK7AR8weTyG1FFbNSpWzknj
	ojWvY0WA4z0SrShV3SgaelWy0ZXDMoE2pXljrMs1KKJJvg580Io/HdtuwoIArJVobnVGxZ7rfM4s/
	y7uliO52ytSpImheiMJ39K5wUTduars6/0JLrZXGuWaUNexB9MrJPqhlYTxKV/VywWoLJdpSar4V0
	EKG5bMOPBF6gsnnidbdMC1JWMQQ/lfPI02e48xjpIA9DhADAd6oesUkFYgfPfpS6/tRhBbgauKuPn
	6LRISfLZ5q6+uuT1qCNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2Ubj-002UZE-Gg; Wed, 29 Dec 2021 08:46:51 +0000
Received: from mail.portyid.pl ([192.36.61.58])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2Ubg-002UYP-Kv
 for linux-mediatek@lists.infradead.org; Wed, 29 Dec 2021 08:46:50 +0000
Received: by mail.portyid.pl (Postfix, from userid 1001)
 id 39C61411B7; Wed, 29 Dec 2021 09:45:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=portyid.pl; s=mail;
 t=1640767581; bh=RZjfFpT9KGSFHXuIOzTjcb+Gwkun4EXriv7y2I0PG0A=;
 h=Date:From:To:Subject:From;
 b=0YyyqUCvq08yLmh6mLNumsD1S3GvcHE9BE6/k43RacOIVt01/ndUJJM/NyoVFYbyh
 L/2ekVUCpHQ1laAy4FYP4vg0jenYffS5ubAnBy0q7HwZQ2d7J7hV+bDE8xQ5s4EGej
 GMUFcyL3a0jpLmE0cVGnK8QRJgRjEFHoMidnoAlXRO9vbnPvtkODX2ptHwfmuYDzkx
 WEPkDcNmY87NkWiNA2SL4WwBgfFW4tWZPzovG0SdluXpDFSxU16nmrdXGF2UYNF7iF
 E6tLjFxpbYlzp0GOHkVg5GpCSd/MPgCG1TUTb3bdz2EpI2vDoKI6QBeArSgnCk/vyI
 5k1jKLwcexibg==
Received: by mail.portyid.pl for <linux-mediatek@lists.infradead.org>;
 Wed, 29 Dec 2021 08:45:43 GMT
Message-ID: <20211229084500-0.1.w.2u26.0.s3kea8luwz@portyid.pl>
Date: Wed, 29 Dec 2021 08:45:43 GMT
From: =?UTF-8?Q?"Pawe=C5=82_Jasi=C5=84ski"?= <pawel.jasinski@portyid.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: Wycena paneli fotowoltaicznych
X-Mailer: mail.portyid.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211229_004648_942426_FE3344CE 
X-CRM114-Status: UNSURE (   1.95  )
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

RHppZcWEIGRvYnJ5LAoKZG9zdHJ6ZWdhbSBtb8W8bGl3b8WbxIcgd3Nww7PFgnByYWN5IHogUGHF
hHN0d2EgZmlybcSFLgoKxZp3aWFkY3p5bXkga29tcGxla3Nvd8SFIG9ic8WCdWfEmSBpbndlc3R5
Y2ppIHcgZm90b3dvbHRhaWvEmSwga3TDs3JhIG9ibmnFvGEga29zenR5IGVuZXJnaWkgZWxla3Ry
eWN6bmVqIG5hd2V0IG8gOTAlLgoKQ3p5IHPEhSBQYcWEc3R3byB6YWludGVyZXNvd2FuaSB3ZXJ5
ZmlrYWNqxIUgd3N0xJlwbnljaCBwcm9wb3p5Y2ppPwoKClBvemRyYXdpYW0KUGF3ZcWCIEphc2nF
hHNraQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRp
YXRlawo=
