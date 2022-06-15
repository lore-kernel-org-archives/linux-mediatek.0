Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC1BC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jun 2022 08:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=20HxK34+uIt1wSFhIYcQiYk3kUN9i+68VOsnikuzCO8=; b=UFj3fqinbKTr5n
	Rc7aiVLV0psxDhMJwXhs9VbVO6OUOzl2b3S/NsAQLfJkwKXYIr50sPb/6gSxb0bkHawY3krW1EMzC
	cIWtnPWQurhV/UZ0fi7+y9ew/kv9u3a+JGGatgkz7gt3BeRNRAlioU7Givs7nrGpre9K9L8jQ0gs0
	Kc6vp83bP3+cn2YykworZozEXeaqFhoEO3wTrZMUMol1A4nMNVJY5mex6fAgPBZZvr1dS9c/jq3Iz
	FykhbQZqRwW/piVu/8Z3m/+XyPwAqUWLCl+iOhDdgFng3o4uVttHMubsR/HSCzP4WjVtl628vHeAZ
	uuPUq95867BSdnsC/zgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1NzP-00D9Gt-IL; Wed, 15 Jun 2022 08:02:59 +0000
Received: from mail.olerise.pl ([46.183.184.59])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1NzN-00D9GB-MH
	for linux-mediatek@lists.infradead.org; Wed, 15 Jun 2022 08:02:58 +0000
Received: by mail.olerise.pl (Postfix, from userid 1001)
	id B7DE924EC2; Wed, 15 Jun 2022 10:00:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=olerise.pl; s=mail;
	t=1655280058; bh=FDuFY3XQoq0gMX1b2gxgT7Py2p4Sxl0PJZYZ4NVaPho=;
	h=Date:From:To:Subject:From;
	b=jbtJaFfj30tYOsD9atYkr+GrLiirj1EELDZ6oHw+MPyzIX4GVa0v7vZLOayqCgKHp
	 RiuAbUNBS2nykzZJ1C4Bkv6i/Lo4jjdsQ8xWyZyEEbV8Aowb4Im2rbdLOTCeHTNFc7
	 ibcO8emL5uUHWuK5aGwpAguF4rg5ZCTihCsXrjyIPycewyqS8zkndsqSmsaztqb6c+
	 OYYGfyo/2CbdooDqN1LhOKi0jrAXWrVWn5jLWn39ZDiCgT13qH8b0GE6JCVbBQkX+2
	 WY6ryCCGWtdC9fr3VaWkiCvHi5vB5s++Gd+jQGrx67smJsI5yKIEGbfj6expMf83vB
	 ktMhm1z0JFwkA==
Received: by mail.olerise.pl for <linux-mediatek@lists.infradead.org>; Wed, 15 Jun 2022 08:00:27 GMT
Message-ID: <20220615084500-0.1.f.8385.0.1tczkylub7@olerise.pl>
Date: Wed, 15 Jun 2022 08:00:27 GMT
From: =?UTF-8?Q?"Przemys=C5=82aw_Wr=C3=B3blewski"?= <przemyslaw.wroblewski@olerise.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: Wycena paneli fotowoltaicznych
X-Mailer: mail.olerise.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_010257_913307_137B6574 
X-CRM114-Status: UNSURE (   0.67  )
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
ZmlrYWNqxIUgd3N0xJlwbnljaCBwcm9wb3p5Y2ppPwoKClBvemRyYXdpYW0sClByemVteXPFgmF3
IFdyw7NibGV3c2tpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW1lZGlhdGVrCg==
