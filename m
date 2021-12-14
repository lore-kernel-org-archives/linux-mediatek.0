Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41265C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Dec 2021 08:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZJMqiS0la79LGA1tGTIjjE09TRD4IvTyE3m9BrjI7yQ=; b=KmP5LPvrsm7JNm
	tb7Y6rT91rqTivmZ5h/ZfKRU5n7P0GMI/V7NJr58qRmJECV68OZ/hjuivv4ciXKzDtsu7CYSIHVt4
	sj1sWDFvHYxyJSuUwyD339Si94HcEmCkoAudCCI0KLMDReCV/BZw1wRX3775SB8OqisKYN+bee3ZP
	fitG+kdXWHIT7rk4oMCKviovG4jvRyFltAJcnguf+IdtT0f1MTLQCRHcZE6pN5JrbW9+9uFe/hr5i
	XshNAmm5G6UGV2R6CO1wsm1T7PvCZ0t3IDP8Rw/0S1Q7c7cENU34rNPE1UZqHmavAAL8WVi0lJ+uw
	7BxFmp5snsWTIKNxoNCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mx3Gg-00D2xn-DD; Tue, 14 Dec 2021 08:34:38 +0000
Received: from mail.thebizzie.pl ([192.236.147.111])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mx3GZ-00D2uB-E0
 for linux-mediatek@lists.infradead.org; Tue, 14 Dec 2021 08:34:32 +0000
Received: by mail.thebizzie.pl (Postfix, from userid 1002)
 id 45597181642; Tue, 14 Dec 2021 08:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=thebizzie.pl; s=mail;
 t=1639470870; bh=kU+//Lu71IqgcFfjayWXuIc0mZtoyrYJc2YuqyU8eS8=;
 h=Date:From:To:Subject:From;
 b=jD4RR6wEqi6hFCKzQFVIX9Ei5x+aYzI2H1pRAFbEnXQpEFufuwvUpkKfTTL531PMQ
 aLTs1aKKxMp+IqJoPWv+9ZTwoM1j11vVr48VERCMzqqVSlb4J8JcMvCLEfKPpWvVLX
 JCovpYm7uBcOoliFBub1XS9bGkLh32pOtOyI3abl3iHiTxhGkcAmYlhZcAeSt2jhi7
 bCverKfFmYg+EzafVunq9wrzhSonhdAwT4iTNczrRd0YOvtRGn5LrePvUCPRZX8H1b
 DdkhtcE4lX28g6/7DQPh9akuqoY9a685u00YHv0QVxIYNO50vCIDhzAKhd+yNiKxQB
 A+bpvS6y0jh5Q==
Received: by mail.thebizzie.pl for <linux-mediatek@lists.infradead.org>;
 Tue, 14 Dec 2021 08:32:04 GMT
Message-ID: <20211214074500-0.1.7.2zl.0.m7t2mnimzz@thebizzie.pl>
Date: Tue, 14 Dec 2021 08:32:04 GMT
From: "Mateusz Adamczyk" <mateusz.adamczyk@thebizzie.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: Wycena paneli fotowoltaicznych
X-Mailer: mail.thebizzie.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_003431_622228_7B1F8138 
X-CRM114-Status: UNSURE (   1.34  )
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
ZmlrYWNqxIUgd3N0xJlwbnljaCBwcm9wb3p5Y2ppPwoKClBvemRyYXdpYW0sCk1hdGV1c3ogQWRh
bWN6eWsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVk
aWF0ZWsK
