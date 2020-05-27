Return-Path: <SRS0=IT6v=7J=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24598C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 May 2020 13:38:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E67E0207D8
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 May 2020 13:38:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ehYgfR8N";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="D9iYOTuJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E67E0207D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RN3wnlY1eKS3RlLUJpil7Yniu2ME+qgVVJtsJrx2Uls=; b=ehYgfR8NyjPDXz
	h+PtVD5n44pmXHRcMofBnhYhSPWwZdDW9jeOZMoyNQTuVvfCKxjXBZnY/4LBx/9gpcSUSND5lYGWU
	pKQCyAI+NS0IEqjRowHcL1RhY6Md/KSTmc9nhBXvlw6eoQl9+5ONDSHPO6i3IRCc3B3alNEvk7og0
	a3j1wY05Rzhs4KqBGzNj/fpWzZFD0bBHlQauRz4lHYi/KTyZhAUmN5ozRtMKp9ZrDD+BJ/xrGNYwJ
	PUeO0b6YqGrKRap3yA98DvSYLqMa14rwG53gs1IrsWXUWJ9OPBsqWOMJnfzBck+S6Cb8z5FF7Vu2r
	mXwc6RtqBBtKJdf/37qQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdwG3-0001eX-Kj; Wed, 27 May 2020 13:38:11 +0000
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdwFl-0001QW-JN
 for linux-mediatek@lists.infradead.org; Wed, 27 May 2020 13:37:56 +0000
Received: by mail-qt1-x842.google.com with SMTP id x29so5924434qtv.4
 for <linux-mediatek@lists.infradead.org>; Wed, 27 May 2020 06:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=K5fHO02+PN/2Q6ZCPK4dYN19pxbY+Th3EZc6EUW67vk=;
 b=D9iYOTuJuftIfysOzhwmQ0vn4d/vsEei6RY106AsYqM+lY2JkboSBXkTeZABIrmuxA
 767ViAm38EWF6tO26zBKiyf6W+hmOrYxdHQBw4nEUtjSeqYWHHXf/kXKzamdnyqE+B0/
 NcN6NfN9X+hx601WT5qZpx844inwztmEtCS5m3mE2eThHgNWjuM7Cjlr61cosLwzjU84
 bfVc91qe0YOmWi/Oeb+6nLrWWrGErBHH26EzrhxqM7p0pCb8MaMuVOxX7aEgBjhO4l/p
 rQrt4YogqHaPQJSlS86Uiw3CtXzfIQnRG8unL3g8T/mG4LMJUi/6R7d2NEiR8Kn45trT
 YiJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=K5fHO02+PN/2Q6ZCPK4dYN19pxbY+Th3EZc6EUW67vk=;
 b=iRhB3qt85qnbgHaXWHzuvOVU0uRkwiF0IYUJmexB9vp8GKidqpQyNsyknNRNxJLs+x
 xBXFFim05+aoZYtvFCwH9PnegrKjhybYLFeX94OPY/d/dcsXVsWt8crZxeE57RSYJWgj
 AMsODAGwlk3UTWGp95iiBDIg7tZo61rdqKK03fsrYdu81FaoBpBkocZylEnVdCOiTJI/
 wipsfTiW+Itbx01C0kK9T7QJKmtDMSlKl6oml/3CkLPVA5S8gRr44UFqEdC/0Sat1GEZ
 BQcQmCxQLx/RxueHgdH8tJskl1Iq1s2HoYEnCzoiKUYroMPMK4b8fe0XJ9PfDgG8ZM6U
 CE9g==
X-Gm-Message-State: AOAM532CS3dePoVujlZ9Akbx1kdjhah+Ls64OPxHtLSKO4TfsvIVAdgz
 tbU5XACUhv4fD1t3bwmV2U4g46rAklmHFF+rLYYyxA==
X-Google-Smtp-Source: ABdhPJyF4EYb3EdIRy+uh7qF8OG1s7b7hlCQ5K73FZQQ2Hmzwq6yKclZidEBmqETHn2raBDlYd3qdYAOxeSVU4PKrjE=
X-Received: by 2002:ac8:2242:: with SMTP id p2mr4052242qtp.27.1590586671749;
 Wed, 27 May 2020 06:37:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200527133513.579367-1-arnd@arndb.de>
In-Reply-To: <20200527133513.579367-1-arnd@arndb.de>
From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Wed, 27 May 2020 15:37:41 +0200
Message-ID: <CAMpxmJU63A2O_JE6G42FwVBN8hj6YQjKuQDFhmJLOMkDqtX=tA@mail.gmail.com>
Subject: Re: [PATCH] [net-next] mtk-star-emac: mark PM functions as
 __maybe_unused
To: Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200527_063753_641595_345D89DB 
X-CRM114-Status: GOOD (  11.79  )
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
Cc: Felix Fietkau <nbd@openwrt.org>, netdev <netdev@vger.kernel.org>,
 Sean Wang <sean.wang@mediatek.com>, LKML <linux-kernel@vger.kernel.org>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, linux-mediatek@lists.infradead.org,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 arm-soc <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

xZtyLiwgMjcgbWFqIDIwMjAgbyAxNTozNSBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPiBu
YXBpc2HFgihhKToKPgo+IFdpdGhvdXQgQ09ORklHX1BNLCB0aGUgY29tcGlsZXIgd2FybnMgYWJv
dXQgdHdvIHVudXNlZCBmdW5jdGlvbnM6Cj4KPiBkcml2ZXJzL25ldC9ldGhlcm5ldC9tZWRpYXRl
ay9tdGtfc3Rhcl9lbWFjLmM6MTQ3MjoxMjogZXJyb3I6IHVudXNlZCBmdW5jdGlvbiAnbXRrX3N0
YXJfc3VzcGVuZCcgWy1XZXJyb3IsLVd1bnVzZWQtZnVuY3Rpb25dCj4gZHJpdmVycy9uZXQvZXRo
ZXJuZXQvbWVkaWF0ZWsvbXRrX3N0YXJfZW1hYy5jOjE0ODg6MTI6IGVycm9yOiB1bnVzZWQgZnVu
Y3Rpb24gJ210a19zdGFyX3Jlc3VtZScgWy1XZXJyb3IsLVd1bnVzZWQtZnVuY3Rpb25dCj4KPiBN
YXJrIHRoZXNlIGFzIF9fbWF5YmVfdW51c2VkLgo+Cj4gRml4ZXM6IDhjN2JkNWE0NTRmZiAoIm5l
dDogZXRoZXJuZXQ6IG10ay1zdGFyLWVtYWM6IG5ldyBkcml2ZXIiKQo+IFNpZ25lZC1vZmYtYnk6
IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gLS0tCj4gIGRyaXZlcnMvbmV0L2V0aGVy
bmV0L21lZGlhdGVrL210a19zdGFyX2VtYWMuYyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bmV0L2V0aGVybmV0L21lZGlhdGVrL210a19zdGFyX2VtYWMuYyBiL2RyaXZlcnMvbmV0L2V0aGVy
bmV0L21lZGlhdGVrL210a19zdGFyX2VtYWMuYwo+IGluZGV4IGIxOGNlNDdjNGYyZS4uMzIyMzU2
N2ZlMWNiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L21lZGlhdGVrL210a19z
dGFyX2VtYWMuYwo+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L21lZGlhdGVrL210a19zdGFy
X2VtYWMuYwo+IEBAIC0xNDY5LDcgKzE0NjksNyBAQCBzdGF0aWMgaW50IG10a19zdGFyX21kaW9f
aW5pdChzdHJ1Y3QgbmV0X2RldmljZSAqbmRldikKPiAgICAgICAgIHJldHVybiByZXQ7Cj4gIH0K
Pgo+IC1zdGF0aWMgaW50IG10a19zdGFyX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQo+ICtz
dGF0aWMgX19tYXliZV91bnVzZWQgaW50IG10a19zdGFyX3N1c3BlbmQoc3RydWN0IGRldmljZSAq
ZGV2KQo+ICB7Cj4gICAgICAgICBzdHJ1Y3QgbXRrX3N0YXJfcHJpdiAqcHJpdjsKPiAgICAgICAg
IHN0cnVjdCBuZXRfZGV2aWNlICpuZGV2Owo+IEBAIC0xNDg1LDcgKzE0ODUsNyBAQCBzdGF0aWMg
aW50IG10a19zdGFyX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQo+ICAgICAgICAgcmV0dXJu
IDA7Cj4gIH0KPgo+IC1zdGF0aWMgaW50IG10a19zdGFyX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpk
ZXYpCj4gK3N0YXRpYyBfX21heWJlX3VudXNlZCBpbnQgbXRrX3N0YXJfcmVzdW1lKHN0cnVjdCBk
ZXZpY2UgKmRldikKPiAgewo+ICAgICAgICAgc3RydWN0IG10a19zdGFyX3ByaXYgKnByaXY7Cj4g
ICAgICAgICBzdHJ1Y3QgbmV0X2RldmljZSAqbmRldjsKPiAtLQo+IDIuMjYuMgo+CgpBY2tlZC1i
eTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVr
IG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
