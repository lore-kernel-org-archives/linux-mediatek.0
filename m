Return-Path: <SRS0=MkRU=6K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79B67C55186
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Apr 2020 03:11:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DEC42070A
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Apr 2020 03:11:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T0eL3FUh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="AoOgEJ/P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DEC42070A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UaivH+v6Owv4eCdJtF6YU4lgbPoPjRuHCMri1uYGHQ8=; b=T0eL3FUho2BG+p
	mZTDcqR2e1s0ycag7/Tn387jemcGz+md0Uq+eCmnFKv9m7lpw/ZXkC32/Cd4f7+6cdBCSpxKnXJ2s
	EBpxlao1q1iE+zxvYS6QtEV/iJsHvblb1JonWcP7SCJfmRJH04FeNN9q4vAAL/2WBWtet/w6VpLy2
	C5fc3L/ycZpEtXbeiWsf+gKaEKS7siLGlfsrqIPqog37auLI8pfc0qHgs/4Z6OEla7OIvsKzhKs6e
	+YvsGU6t8hVkfl9tZEl887xRxiHj7JnhYm9F0+TD8R/hFHb1XChP1Aa8jp/6hZ7eq8Y3ywlUZ/xVE
	IsSeh0HbQGlKNRRTnLYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jSXhJ-0003aK-Ve; Sun, 26 Apr 2020 03:11:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jSXh8-0003R3-25; Sun, 26 Apr 2020 03:11:04 +0000
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C2C202070A;
 Sun, 26 Apr 2020 03:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587870661;
 bh=5ufY2WNf1d+9zTXd2f3aMGdsxjO3ggnK7WB1Ct27mWo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=AoOgEJ/PCHpNCNceEnPC+l4jFraujO8GwZ54QALOYlUi1eslUYlJQgZFhAtDYYnI0
 bCvLruNMB2ngmXYg3t5f5++qHEQG0q1JS7kqvHCkKNSF2AF2Vnr8A183mi/bzybxgf
 /DcO8p2mpk5dVMyUGCfO9UZ3/lOPIOwXq7BD7iNk=
Received: by mail-ed1-f51.google.com with SMTP id k22so10782777eds.6;
 Sat, 25 Apr 2020 20:11:00 -0700 (PDT)
X-Gm-Message-State: AGi0PubojdMo713oo4dQp8zaHNV6BJcU4dYid2RwLLsBgGzTMk9YoPME
 bm7yDC2EOSKI3Ecnf+5EyskhGhGnIdtZKuKgSQ==
X-Google-Smtp-Source: APiQypKzGcK+rktzR+tfPW/JO9EwaomlqVHqX5FQ7TR3YoCZvSXlsx8Rq/Mgm42CxzCH2NCu/qfo70XhLlXeJ46XxG8=
X-Received: by 2002:aa7:c649:: with SMTP id z9mr14002618edr.288.1587870659255; 
 Sat, 25 Apr 2020 20:10:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200226112723.649954-1-enric.balletbo@collabora.com>
In-Reply-To: <20200226112723.649954-1-enric.balletbo@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 26 Apr 2020 11:10:48 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9tfwd-cqxkwUWXM-B7vuLZoKjF6DhFgZZM3QZp1pmCAg@mail.gmail.com>
Message-ID: <CAAOTY_9tfwd-cqxkwUWXM-B7vuLZoKjF6DhFgZZM3QZp1pmCAg@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Remove debug messages for function calls
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200425_201102_142478_5B9C834A 
X-CRM114-Status: GOOD (  16.47  )
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
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, CK Hu <ck.hu@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEVucmljOgoKRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0Ym9AY29sbGFi
b3JhLmNvbT4g5pa8IDIwMjDlubQy5pyIMjbml6Ug6YCx5LiJIOS4i+WNiDc6Mjflr6vpgZPvvJoK
Pgo+IEVxdWl2YWxlbnQgaW5mb3JtYXRpb24gY2FuIGJlIG5vd2FkYXlzIG9idGFpbmVkIHVzaW5n
IGZ1bmN0aW9uIHRyYWNlci4KCkFwcGxpZWQgdG8gbWVkaWF0ZWstZHJtLW5leHQgWzFdLCB0aGFu
a3MuCgpbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
Y2h1bmt1YW5nLmh1L2xpbnV4LmdpdC9sb2cvP2g9bWVkaWF0ZWstZHJtLW5leHQKClJlZ2FyZHMs
CkNodW4tS3VhbmcuCgo+Cj4gU2lnbmVkLW9mZi1ieTogRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8
ZW5yaWMuYmFsbGV0Ym9AY29sbGFib3JhLmNvbT4KPiAtLS0KPgo+ICBkcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMgfCA1IC0tLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHJtX2Rydi5jICB8IDIgLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA3IGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Ny
dGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYwo+IGluZGV4IGEy
MzY0OTkxMjNhYS4uODgyYzY5MGQzZjEzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHJtX2NydGMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHJtX2NydGMuYwo+IEBAIC0xOTIsNyArMTkyLDYgQEAgc3RhdGljIGludCBtdGtfY3J0Y19k
ZHBfY2xrX2VuYWJsZShzdHJ1Y3QgbXRrX2RybV9jcnRjICptdGtfY3J0YykKPiAgICAgICAgIGlu
dCByZXQ7Cj4gICAgICAgICBpbnQgaTsKPgo+IC0gICAgICAgRFJNX0RFQlVHX0RSSVZFUigiJXNc
biIsIF9fZnVuY19fKTsKPiAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBtdGtfY3J0Yy0+ZGRwX2Nv
bXBfbnI7IGkrKykgewo+ICAgICAgICAgICAgICAgICByZXQgPSBjbGtfcHJlcGFyZV9lbmFibGUo
bXRrX2NydGMtPmRkcF9jb21wW2ldLT5jbGspOwo+ICAgICAgICAgICAgICAgICBpZiAocmV0KSB7
Cj4gQEAgLTIxMiw3ICsyMTEsNiBAQCBzdGF0aWMgdm9pZCBtdGtfY3J0Y19kZHBfY2xrX2Rpc2Fi
bGUoc3RydWN0IG10a19kcm1fY3J0YyAqbXRrX2NydGMpCj4gIHsKPiAgICAgICAgIGludCBpOwo+
Cj4gLSAgICAgICBEUk1fREVCVUdfRFJJVkVSKCIlc1xuIiwgX19mdW5jX18pOwo+ICAgICAgICAg
Zm9yIChpID0gMDsgaSA8IG10a19jcnRjLT5kZHBfY29tcF9ucjsgaSsrKQo+ICAgICAgICAgICAg
ICAgICBjbGtfZGlzYWJsZV91bnByZXBhcmUobXRrX2NydGMtPmRkcF9jb21wW2ldLT5jbGspOwo+
ICB9Cj4gQEAgLTI1Nyw3ICsyNTUsNiBAQCBzdGF0aWMgaW50IG10a19jcnRjX2RkcF9od19pbml0
KHN0cnVjdCBtdGtfZHJtX2NydGMgKm10a19jcnRjKQo+ICAgICAgICAgaW50IHJldDsKPiAgICAg
ICAgIGludCBpOwo+Cj4gLSAgICAgICBEUk1fREVCVUdfRFJJVkVSKCIlc1xuIiwgX19mdW5jX18p
Owo+ICAgICAgICAgaWYgKFdBUk5fT04oIWNydGMtPnN0YXRlKSkKPiAgICAgICAgICAgICAgICAg
cmV0dXJuIC1FSU5WQUw7Cj4KPiBAQCAtMjk4LDcgKzI5NSw2IEBAIHN0YXRpYyBpbnQgbXRrX2Ny
dGNfZGRwX2h3X2luaXQoc3RydWN0IG10a19kcm1fY3J0YyAqbXRrX2NydGMpCj4gICAgICAgICAg
ICAgICAgIGdvdG8gZXJyX211dGV4X3VucHJlcGFyZTsKPiAgICAgICAgIH0KPgo+IC0gICAgICAg
RFJNX0RFQlVHX0RSSVZFUigibWVkaWF0ZWtfZGRwX2RkcF9wYXRoX3NldHVwXG4iKTsKPiAgICAg
ICAgIGZvciAoaSA9IDA7IGkgPCBtdGtfY3J0Yy0+ZGRwX2NvbXBfbnIgLSAxOyBpKyspIHsKPiAg
ICAgICAgICAgICAgICAgbXRrX2RkcF9hZGRfY29tcF90b19wYXRoKG10a19jcnRjLT5jb25maWdf
cmVncywKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG10a19jcnRj
LT5kZHBfY29tcFtpXS0+aWQsCj4gQEAgLTM0OCw3ICszNDQsNiBAQCBzdGF0aWMgdm9pZCBtdGtf
Y3J0Y19kZHBfaHdfZmluaShzdHJ1Y3QgbXRrX2RybV9jcnRjICptdGtfY3J0YykKPiAgICAgICAg
IHN0cnVjdCBkcm1fY3J0YyAqY3J0YyA9ICZtdGtfY3J0Yy0+YmFzZTsKPiAgICAgICAgIGludCBp
Owo+Cj4gLSAgICAgICBEUk1fREVCVUdfRFJJVkVSKCIlc1xuIiwgX19mdW5jX18pOwo+ICAgICAg
ICAgZm9yIChpID0gMDsgaSA8IG10a19jcnRjLT5kZHBfY29tcF9ucjsgaSsrKSB7Cj4gICAgICAg
ICAgICAgICAgIG10a19kZHBfY29tcF9zdG9wKG10a19jcnRjLT5kZHBfY29tcFtpXSk7Cj4gICAg
ICAgICAgICAgICAgIGlmIChpID09IDEpCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHJtX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1f
ZHJ2LmMKPiBpbmRleCAxN2YxMThlZTBlNTcuLjQ5MzQ4MzQ5NzdiMyAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jCj4gQEAgLTU3MCw3ICs1NzAsNiBAQCBzdGF0aWMg
aW50IG10a19kcm1fc3lzX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQo+ICAgICAgICAgaW50
IHJldDsKPgo+ICAgICAgICAgcmV0ID0gZHJtX21vZGVfY29uZmlnX2hlbHBlcl9zdXNwZW5kKGRy
bSk7Cj4gLSAgICAgICBEUk1fREVCVUdfRFJJVkVSKCJtdGtfZHJtX3N5c19zdXNwZW5kXG4iKTsK
Pgo+ICAgICAgICAgcmV0dXJuIHJldDsKPiAgfQo+IEBAIC01ODIsNyArNTgxLDYgQEAgc3RhdGlj
IGludCBtdGtfZHJtX3N5c19yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQo+ICAgICAgICAgaW50
IHJldDsKPgo+ICAgICAgICAgcmV0ID0gZHJtX21vZGVfY29uZmlnX2hlbHBlcl9yZXN1bWUoZHJt
KTsKPiAtICAgICAgIERSTV9ERUJVR19EUklWRVIoIm10a19kcm1fc3lzX3Jlc3VtZVxuIik7Cj4K
PiAgICAgICAgIHJldHVybiByZXQ7Cj4gIH0KPiAtLQo+IDIuMjUuMAo+Cj4KPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LW1lZGlhdGVrIG1h
aWxpbmcgbGlzdAo+IExpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRl
ayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
