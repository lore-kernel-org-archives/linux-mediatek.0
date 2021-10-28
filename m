Return-Path: <SRS0=IDfX=PQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2191C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Oct 2021 14:18:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6786461073
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Oct 2021 14:18:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6786461073
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bqNbiR69SeLpz2pPynGwxpRF4W/RCL/H2WsbLxfNCdI=; b=LQ2RJK12fp0m9p
	6tVpKLUhlCXV7GXgLS2zR2ShF+6GngxpNrxbZjBx4dCErQ8V9pfbH6D0uR6ZV+4sodB/UBi4t6dPG
	fGahzeFm4Icl6NhfZzasxQbkUgdOdCe6JKPiwcbEz0Y0jwjeO7dFQVeCfbt3JdO6b87tTJlGWjmvq
	FZuzN2pbaf4TmqhVs52O+nMEYKo7LtkSGChrLAJ1uLKkCcW+UHqQ8JaFGBCnLTV3zgsnyISjW2j0X
	QnUu+HiW6jfI1kz1SBDGRAZTBy2pdewZXjs/UR+tzUvwxNTZFJbzDf4xZH+++Z630rw9BD0VJA9Y+
	aAwo/pRgdPbR2C4ecPEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg6ER-00861Y-Os; Thu, 28 Oct 2021 14:18:15 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg6EO-00860j-Uz
 for linux-mediatek@lists.infradead.org; Thu, 28 Oct 2021 14:18:14 +0000
Received: by mail-qv1-xf34.google.com with SMTP id v10so4096936qvb.10
 for <linux-mediatek@lists.infradead.org>; Thu, 28 Oct 2021 07:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=nMYUF74sjEpWHuRRud5MO5ghjCJajD1UAWLtkFjebQ8=;
 b=AcFOcYEDEke9Cr2Fcbyz6T2cnXP+xdgvJ8vghHGrZbzEU3F07oJ/V14ct6GmQNYz3s
 6cyUL7cLYDNHnbdk6roOf1RTDn3xyb7P8OS91ur27mmleQQYQptZ+s5WCpDAgH/g0FJ9
 AYqCyCy9d13ljbw1IxaRE/3E86w9sCVNSvtC9o/wsXM5HDbSqPWiD7tPMx3Yyq8NwpNy
 Kvm+b7a/94i519ok4wznMccqQOiwdEwi06gJEU84vJRNHbV6k9EOy3H/jscwydkkuJqC
 qmkhJitRJck0Ztji1DbeBKGPEeu1d6Sr7J9jX2gx5krNOBfdiPtsisZa6AbWjnBA8Lue
 H6Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=nMYUF74sjEpWHuRRud5MO5ghjCJajD1UAWLtkFjebQ8=;
 b=XgXHY5PUx1UOxgEktdHlBh3AU0cr9VhU1V4H8aeodZdGFUo3lfK+KnF7Sv0UtBCZyV
 TtrRx7yD+5IpRnW3QoigP9SlD75296s+cTu4WQDdGkFdQJcx3py0EmXy/uOyeWprCCxB
 4tOAev6LehduXHBd9go82T8rkOJxf/P1y4lge63HoI5p1AS2lPCQblEQchXDuX+jhRgX
 RBG7EKkxNIe2EnA0iU7ogcYrsv1mMg4UzhnoutlEP5Qbm3ZxZQgdCn+0Eq1prkYN/0qp
 3vGEUPF4kivHFH9depPR0b5ORBOvTDy3Zt79M63IVLxT5T6NmVG1Mfii5ICCXGb84vwW
 //Gw==
X-Gm-Message-State: AOAM533OX4mDuHkvjP8FLlf+Lzmp0X+TOjk29JS+zpy/u6yxvD+yI+hw
 kQf9tyDqCsGGV9BZGZRG8CM9JA==
X-Google-Smtp-Source: ABdhPJx6zHTHcttN+FeVTgYVhZ3L9lDybi5HnFGUMp6gMgU8UhioTK5yvPn19Ra2Kzh8chqzs12gXA==
X-Received: by 2002:a0c:b412:: with SMTP id u18mr4729682qve.14.1635430690565; 
 Thu, 28 Oct 2021 07:18:10 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net.
 [173.246.12.168])
 by smtp.gmail.com with ESMTPSA id v15sm1406288qtx.54.2021.10.28.07.18.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 07:18:10 -0700 (PDT)
Message-ID: <34a3f0e40c5248472d072d2a06cc4370e08ea9ff.camel@ndufresne.ca>
Subject: Re: [PATCH 1/3] media: mtk-vcodec: enc: add vp8 profile ctrl
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, 
 linux-media@vger.kernel.org
Cc: kernel@collabora.com, acourbot@chromium.org,
 andrew-ct.chen@mediatek.com,  courbot@chromium.org, dafna3@gmail.com,
 eizan@chromium.org,  houlong.wei@mediatek.com, hsinyi@chromium.org,
 hverkuil@xs4all.nl,  irui.wang@mediatek.com, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, maoguang.meng@mediatek.com, 
 matthias.bgg@gmail.com, mchehab@kernel.org, minghsiu.tsai@mediatek.com, 
 tfiga@chromium.org, tiffany.lin@mediatek.com
Date: Thu, 28 Oct 2021 10:18:08 -0400
In-Reply-To: <20211022150410.29335-2-dafna.hirschfeld@collabora.com>
References: <20211022150410.29335-1-dafna.hirschfeld@collabora.com>
 <20211022150410.29335-2-dafna.hirschfeld@collabora.com>
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_071813_007541_9077CE11 
X-CRM114-Status: GOOD (  15.68  )
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

TGUgdmVuZHJlZGkgMjIgb2N0b2JyZSAyMDIxIMOgIDE3OjA0ICswMjAwLCBEYWZuYSBIaXJzY2hm
ZWxkIGEgw6ljcml0wqA6Cj4gSW4gb3JkZXIgZm9yIHRoZSBlbmNvZGVyIHRvIHdvcmsgd2l0aCBn
c3RyZWFtZXIKPiBpdCBuZWVkcyB0byBoYXZlIHRoZSBWNEwyX0NJRF9NUEVHX1ZJREVPX1ZQOF9Q
Uk9GSUxFCj4gY3RybC4gVGhpcyBwYXRjaCBhZGRzIHRoYXQgY3RybCB3aXRoIG9ubHkgcHJvZmls
ZSAwCj4gc3VwcG9ydGVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IERhZm5hIEhpcnNjaGZlbGQgPGRh
Zm5hLmhpcnNjaGZlbGRAY29sbGFib3JhLmNvbT4KCkkgY29uZmlybSBzdGFydGluZyBmcm9tIEdT
dHJlYW1lciAxLjE4IHByb2ZpbGUgKGFuZCBsZXZlbCBmb3Igb3RoZXIgY29kZWNzKSBhcmUKbmVl
ZGVkLiBUaGlzIGlzIHRvIGFsbG93IHByb3BlciBmYWxsYmFjayB0byBvdGhlciBkZWNvZGVycyAo
aW5jbHVkaW5nIHNvZnR3YXJlKQp3aGVuIHRoZSBIVyBpcyBub3QgY2FwYWJsZS4KCkFja2VkLWJ5
OiBOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1ZnJlc25lQGNvbGxhYm9yYS5jb20+Cgo+IC0t
LQo+ICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvbXRrX3Zjb2RlY19lbmMuYyB8
IDEwICsrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKPiAKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdmNvZGVjL210a192Y29kZWNf
ZW5jLmMgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvbXRrX3Zjb2RlY19lbmMu
Ywo+IGluZGV4IDg5OTgyNDRlYTY3MS4uODdhNTExNGJmNjgwIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2VuYy5jCj4gKysrIGIvZHJp
dmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdmNvZGVjL210a192Y29kZWNfZW5jLmMKPiBAQCAtMTAz
LDYgKzEwMywxMyBAQCBzdGF0aWMgaW50IHZpZGlvY192ZW5jX3NfY3RybChzdHJ1Y3QgdjRsMl9j
dHJsICpjdHJsKQo+ICAJCXAtPmdvcF9zaXplID0gY3RybC0+dmFsOwo+ICAJCWN0eC0+cGFyYW1f
Y2hhbmdlIHw9IE1US19FTkNPREVfUEFSQU1fR09QX1NJWkU7Cj4gIAkJYnJlYWs7Cj4gKwljYXNl
IFY0TDJfQ0lEX01QRUdfVklERU9fVlA4X1BST0ZJTEU6Cj4gKwkJLyoKPiArCQkgKiBGSVhNRSAt
IHdoYXQgdnA4IHByb2ZpbGVzIGFyZSBhY3R1YWxseSBzdXBwb3J0ZWQ/Cj4gKwkJICogVGhlIGN0
cmwgaXMgYWRkZWQgKHdpdGggb25seSBwcm9maWxlIDAgc3VwcG9ydGVkKSBmb3Igbm93Lgo+ICsJ
CSAqLwo+ICsJCW10a192NGwyX2RlYnVnKDIsICJWNEwyX0NJRF9NUEVHX1ZJREVPX1ZQOF9QUk9G
SUxFIHZhbCA9ICVkIiwgY3RybC0+dmFsKTsKPiArCQlicmVhazsKPiAgCWNhc2UgVjRMMl9DSURf
TVBFR19WSURFT19GT1JDRV9LRVlfRlJBTUU6Cj4gIAkJbXRrX3Y0bDJfZGVidWcoMiwgIlY0TDJf
Q0lEX01QRUdfVklERU9fRk9SQ0VfS0VZX0ZSQU1FIik7Cj4gIAkJcC0+Zm9yY2VfaW50cmEgPSAx
Owo+IEBAIC0xMzk0LDYgKzE0MDEsOSBAQCBpbnQgbXRrX3Zjb2RlY19lbmNfY3RybHNfc2V0dXAo
c3RydWN0IG10a192Y29kZWNfY3R4ICpjdHgpCj4gIAl2NGwyX2N0cmxfbmV3X3N0ZF9tZW51KGhh
bmRsZXIsIG9wcywgVjRMMl9DSURfTVBFR19WSURFT19IMjY0X0xFVkVMLAo+ICAJCQkgICAgICAg
aDI2NF9tYXhfbGV2ZWwsCj4gIAkJCSAgICAgICAwLCBWNEwyX01QRUdfVklERU9fSDI2NF9MRVZF
TF80XzApOwo+ICsJdjRsMl9jdHJsX25ld19zdGRfbWVudShoYW5kbGVyLCBvcHMsIFY0TDJfQ0lE
X01QRUdfVklERU9fVlA4X1BST0ZJTEUsCj4gKwkJCSAgICAgICBWNEwyX01QRUdfVklERU9fVlA4
X1BST0ZJTEVfMCwgMCwgVjRMMl9NUEVHX1ZJREVPX1ZQOF9QUk9GSUxFXzApOwo+ICsKPiAgCj4g
IAlpZiAoaGFuZGxlci0+ZXJyb3IpIHsKPiAgCQltdGtfdjRsMl9lcnIoIkluaXQgY29udHJvbCBo
YW5kbGVyIGZhaWwgJWQiLAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW1lZGlhdGVrCg==
