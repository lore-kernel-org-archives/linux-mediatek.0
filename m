Return-Path: <SRS0=F/ID=6V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8A1AC38A2A
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 May 2020 10:50:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F50B20870
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 May 2020 10:50:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K84M5omc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="1lm1uYG4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F50B20870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=by9q8RlFvKzAGrr2eL3LAbOqciXAnMWPtBaiOd/o2KQ=; b=K84M5omc5yB3MD
	0VzVNs13uXb4qX40H4Q3AdlE7Q6IYAs8jcn/9/MlggYaDmwN3CKRm5shES9pe2RhHJkPqs7GsxlWA
	iX3/dCvqv13jJ6/WJjOA54hfNhyidt5Hb1QfCnAfUCxERzG829oi4dP2l1hDNTmvyUDIatwiVgfoo
	NOpzPUv/2J4dpx8Mypax2hJyUzEwnGo/nI5wvkD9qTz0tSuu+NkQAN1NwzDSlE1JAJLe84dqfKbmr
	v0GA668Fv7saUiCcpwPRG0jS8LRN+qQX7QVMWdLe0gOvJ0a8D0G9IzSk/T3eU42WG23bESWevfBDL
	BCGNXetD+YfVuooqGxmQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWe6n-0003dg-LO; Thu, 07 May 2020 10:50:29 +0000
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWe6l-0003cy-HM
 for linux-mediatek@lists.infradead.org; Thu, 07 May 2020 10:50:29 +0000
Received: by mail-qk1-x743.google.com with SMTP id i14so5422241qka.10
 for <linux-mediatek@lists.infradead.org>; Thu, 07 May 2020 03:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1TQDLXk4eka+0Oxp2Bn8b1wcydmS2119xNQQ8v9Of3A=;
 b=1lm1uYG4FqWg47V6Y+gYDIshBO9zX4KSYru04NwBJPv6kFFVFfM5JuAxDs6tZvphbJ
 oTJilxGIAeSQOYU0i6u9kVh9LY2c67xWbyrpnSBiPqECpZSiW2moygN7fZbQTfav8QK2
 PVhyXc4CtEJIGCrd0bzJhiTefp0mzyZ+EbOyJMUDZqyQufbiHgLItmYN1hQD9wMB44pb
 +U7sR5l34T2+ELpQdAtOqjowgdxN4GWWNkcVU6+j6hZhi4t6FdtitjmBcfH4EYiq0eXp
 4P1xej1eG3C2yyeUwdIE9QTRIDhAZrZ/5hXNsRThBODI7DVg3bGoIKHJESig7V88bGr5
 VM8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1TQDLXk4eka+0Oxp2Bn8b1wcydmS2119xNQQ8v9Of3A=;
 b=A8bzU8se7XyadYtCmmiJPA2JWr+hglNTFkp4nAtFtGtaIgfiJJojC2EAVnVyLCsGs9
 sYgaohZARwgLnxwvU3v3bZZcJ64QGK0tL7G+gJ/TV0dy9IpVrkgUVEaiookOgNNOogQ5
 1ivdm9Hwe9PyFFVQFYHRT3owIZMcIxdh6Zx7lXnQ5LV1b9vB1PtlUsybI8z4fd2A2Up0
 SG+BE56Fm/P+E3I1u16vgVME5XnB9oDxzzSRPj1wZ7M+WNlYZ6HfW9lohIRDvopbr1s3
 qXH7sSskyvWWChv2M2Amz/cHgWD5SsWJ/a7oZ1uC4zHlaJ5WQxI7vqA39Y5oBezgnwfk
 BhOg==
X-Gm-Message-State: AGi0PuZ8H6zZwPNj6WF3aN4coH6D3h92bYaiQ+jvP9y/nNOEbQhc4/Zx
 T28lggu1/fkrqr+fOr47wq+1A7sanj0x3N2KYeo8F79m
X-Google-Smtp-Source: APiQypJYXCCd2c3pYbt+kfphPDDGvjl+YT7aIrmnou1JUBqsathcHJRlRjCQ8fMwJjvYV4gCZxU1KJCPXjpaGZcnQi0=
X-Received: by 2002:a05:620a:1f1:: with SMTP id
 x17mr13989074qkn.330.1588848626441; 
 Thu, 07 May 2020 03:50:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200505140231.16600-1-brgl@bgdev.pl>
 <20200505140231.16600-7-brgl@bgdev.pl>
 <1588844771.5921.27.camel@mtksdccf07>
In-Reply-To: <1588844771.5921.27.camel@mtksdccf07>
From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Thu, 7 May 2020 12:50:15 +0200
Message-ID: <CAMpxmJW4qZ_Wnp_oRa=j=YnvTzVa3HZ13Hgwy71jS6L3Bd3oMQ@mail.gmail.com>
Subject: Re: [PATCH 06/11] net: ethernet: mtk-eth-mac: new driver
To: "Mark-MC.Lee" <Mark-MC.Lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_035027_619217_A81292AE 
X-CRM114-Status: UNSURE (   7.63  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-devicetree <devicetree@vger.kernel.org>,
 Felix Fietkau <nbd@openwrt.org>, Arnd Bergmann <arnd@arndb.de>,
 netdev <netdev@vger.kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Sean Wang <sean.wang@mediatek.com>, LKML <linux-kernel@vger.kernel.org>,
 Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S . Miller" <davem@davemloft.net>,
 arm-soc <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Y3p3LiwgNyBtYWogMjAyMCBvIDExOjQ2IE1hcmstTUMuTGVlIDxNYXJrLU1DLkxlZUBtZWRpYXRl
ay5jb20+IG5hcGlzYcWCKGEpOgo+Cj4gSGkgQmFydG9zejoKPiAgSSB0aGluayB0aGUgbmFtaW5n
IG9mIHRoaXMgZHJpdmVyIGFuZCBpdHMgS2NvbmZpZyBvcHRpb24gaXMgdG9vIGdlbmVyaWMKPiB0
aGF0IHdpbGwgY29uZnVzZSB3aXRoIGN1cnJlbnQgbWVkaWF0ZWsgU29DcyBldGggZHJpdmVyIGFy
Y2hpdGVjdHVyZShmb3IKPiBhbGwgbXQ3eHh4IFNvQ3MpLgo+ICAgU2luY2UgbXRrX2V0aF9tYWMu
YyBpcyBub3QgYSBjb21tb24gTUFDIHBhcnQgZm9yIGFsbCBtZWRpYXRlayBTb0MgYnV0Cj4gb25s
eSBhIHNwZWNpZmljIGV0aCBkcml2ZXIgZm9yIG10ODV4eCwgaXQgd2lsbCBiZSBtb3JlIHJlYXNv
bmFibGUgdG8KPiBuYW1lIGl0IGFzIG10ODV4eF9ldGguYyBhbmQgY2hhbmdlIE5FVF9NRURJQVRF
S19NQUMgdG8KPiBORVRfTUVESUFURUtfTVQ4NVhYLiBIb3cgZG8geW91IHRoaW5rPwo+CgpIaSBN
YXJrLAoKSSBhY3R1YWxseSBjb25zdWx0ZWQgdGhpcyB3aXRoIE1lZGlhVGVrIGFuZCB0aGUgbmFt
ZSBpcyB0aGVpciBpZGVhLgpNYW55IGRyaXZlcnMgaW4gZHJpdmVycy9uZXQvZXRoZXJuZXQgaGF2
ZSB2ZXJ5IHZhZ3VlIG5hbWVzLiBJIGd1ZXNzCnRoaXMgaXNuJ3QgYSBwcm9ibGVtLgoKQmFydAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVk
aWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
