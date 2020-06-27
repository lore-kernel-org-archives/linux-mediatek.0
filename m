Return-Path: <SRS0=2fNz=AI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 648FEC433DF
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Jun 2020 02:36:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D2F220787
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Jun 2020 02:36:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L1Du3r9k";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="RcLz9fwj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D2F220787
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Rr3y+tZchtoKPJX6hvrNw5rqQEJ46/9qOP7F5f2U0uQ=; b=L1Du3r9kvKzlAq3fnipfIO+gJ
	ngcg0Gzr/2ezjwwvq3NqyJlaN4Z9piqlUecPMKc/w3reBscellThzp+OjuOM80wLa9lJlH+TenygX
	RveowNVDwdPUr17ZiwVhpQ/pJbaD/xBcKd5Amm8g9h614VghBhMMsxuWPBxyq7IftiIopTCOKQA+r
	GC48ZfBBPP/cM+wbt3K+A2kQdygPNPFedEv0g+WyLpeG8IXm6jNQtvcDKdlYK1vp8yFfhhIZf3I7i
	CSjZKFHutPj+FsWs/fDH84YRAuMjtnjcMxJd0RuJO8DR3L19juNX/9KdfR84YZj4rd0dZPq/Bgono
	hLVAoktww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jp0hJ-00007D-By; Sat, 27 Jun 2020 02:36:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jp0hF-00006r-I5; Sat, 27 Jun 2020 02:36:02 +0000
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DD0282100A;
 Sat, 27 Jun 2020 02:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593225359;
 bh=tU0ZbN22a3NbtsWXdd7dOzD8damchBjamFVFeRZ8J54=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=RcLz9fwjyZCTlbXGEg1uhlK21xVGWDpa/NFDEddfO2GoH8eN4YTKhO0OL/OGsDE7r
 92BeYFjijvqps/03BmOHDsIstqTjRXMkROajoX9my2pIgpr6SBkSx6NBbYfMSoKdGD
 wJk8Od2vw/6Uu0HKTLRIboThNj2Cby7c7PveIb40=
Received: by mail-ed1-f50.google.com with SMTP id cy7so8335609edb.5;
 Fri, 26 Jun 2020 19:35:58 -0700 (PDT)
X-Gm-Message-State: AOAM530JhJlg49Z05z2dUxDNDMY8pDr78e7OdJp7+//1Dx92tdYfnoH8
 FhazXsiBwkZio/hR7CLV8iWyNOGHk4dyElPM7g==
X-Google-Smtp-Source: ABdhPJzP4QmbPNwQeLEiF97aUp8PQdQXE1zF6ViwygvifOO7aMKo9MpdiKf0B44WJbGzWjJ4qPlypq0xfkZktqcz1+4=
X-Received: by 2002:aa7:c3d6:: with SMTP id l22mr6451343edr.148.1593225357299; 
 Fri, 26 Jun 2020 19:35:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200622155753.130181-1-hsinyi@chromium.org>
In-Reply-To: <20200622155753.130181-1-hsinyi@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 27 Jun 2020 10:35:46 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-mB5EC7_fHzpn+NFPRxAHEzY-f5dRv3g1TKfR5Hui58A@mail.gmail.com>
Message-ID: <CAAOTY_-mB5EC7_fHzpn+NFPRxAHEzY-f5dRv3g1TKfR5Hui58A@mail.gmail.com>
Subject: Re: [PATCH v4] drm/mediatek: check plane visibility in atomic_update
To: Hsin-Yi Wang <hsinyi@chromium.org>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@chromium.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEhzaW4tWWk6CgpIc2luLVlpIFdhbmcgPGhzaW55aUBjaHJvbWl1bS5vcmc+IOaWvCAyMDIw
5bm0NuaciDIy5pelIOmAseS4gCDkuIvljYgxMTo1N+Wvq+mBk++8mgo+Cj4gRGlzYWJsZSB0aGUg
cGxhbmUgaWYgaXQncyBub3QgdmlzaWJsZS4gT3RoZXJ3aXNlIG10a19vdmxfbGF5ZXJfY29uZmln
KCkKPiB3b3VsZCBwcm9jZWVkIHdpdGggaW52YWxpZCBwbGFuZSBhbmQgd2UgbWF5IHNlZSB2Ymxh
bmsgdGltZW91dC4KPgoKQXBwbGllZCB0byBtZWRpYXRlay1kcm0tbmV4dCBbMV0sIHRoYW5rcy4K
ClsxXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9jaHVu
a3VhbmcuaHUvbGludXguZ2l0L2xvZy8/aD1tZWRpYXRlay1kcm0tbmV4dAoKUmVnYXJkcywKQ2h1
bi1LdWFuZy4KCj4gRml4ZXM6IDExOWY1MTczNjI4YSAoImRybS9tZWRpYXRlazogQWRkIERSTSBE
cml2ZXIgZm9yIE1lZGlhdGVrIFNvQyBNVDgxNzMuIikKPiBTaWduZWQtb2ZmLWJ5OiBIc2luLVlp
IFdhbmcgPGhzaW55aUBjaHJvbWl1bS5vcmc+Cj4gUmV2aWV3ZWQtYnk6IENodW4tS3VhbmcgSHUg
PGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgo+IFJldmlld2VkLWJ5OiBUb21hc3ogRmlnYSA8dGZp
Z2FAY2hyb21pdW0ub3JnPgo+IC0tLQo+IHY0OiBmaXggY29tbWl0IG1lc3NhZ2UKPiB2MzogQWRk
cmVzcyBjb21tZW50Cj4gdjI6IEFkZCBmaXhlcyB0YWcKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kcm1fcGxhbmUuYyB8IDI1ICsrKysrKysrKysrKysrLS0tLS0tLS0tLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCj4KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fcGxhbmUuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX3BsYW5lLmMKPiBpbmRleCBjMmJkNjgzYTg3
YzguLjkyMTQxYTE5NjgxYiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RybV9wbGFuZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1f
cGxhbmUuYwo+IEBAIC0xNjQsNiArMTY0LDE2IEBAIHN0YXRpYyBpbnQgbXRrX3BsYW5lX2F0b21p
Y19jaGVjayhzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwKPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0cnVlLCB0cnVlKTsKPiAgfQo+Cj4gK3N0YXRp
YyB2b2lkIG10a19wbGFuZV9hdG9taWNfZGlzYWJsZShzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwK
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGRybV9wbGFuZV9z
dGF0ZSAqb2xkX3N0YXRlKQo+ICt7Cj4gKyAgICAgICBzdHJ1Y3QgbXRrX3BsYW5lX3N0YXRlICpz
dGF0ZSA9IHRvX210a19wbGFuZV9zdGF0ZShwbGFuZS0+c3RhdGUpOwo+ICsKPiArICAgICAgIHN0
YXRlLT5wZW5kaW5nLmVuYWJsZSA9IGZhbHNlOwo+ICsgICAgICAgd21iKCk7IC8qIE1ha2Ugc3Vy
ZSB0aGUgYWJvdmUgcGFyYW1ldGVyIGlzIHNldCBiZWZvcmUgdXBkYXRlICovCj4gKyAgICAgICBz
dGF0ZS0+cGVuZGluZy5kaXJ0eSA9IHRydWU7Cj4gK30KPiArCj4gIHN0YXRpYyB2b2lkIG10a19w
bGFuZV9hdG9taWNfdXBkYXRlKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLAo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKm9sZF9zdGF0
ZSkKPiAgewo+IEBAIC0xNzgsNiArMTg4LDExIEBAIHN0YXRpYyB2b2lkIG10a19wbGFuZV9hdG9t
aWNfdXBkYXRlKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLAo+ICAgICAgICAgaWYgKCFjcnRjIHx8
IFdBUk5fT04oIWZiKSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuOwo+Cj4gKyAgICAgICBpZiAo
IXBsYW5lLT5zdGF0ZS0+dmlzaWJsZSkgewo+ICsgICAgICAgICAgICAgICBtdGtfcGxhbmVfYXRv
bWljX2Rpc2FibGUocGxhbmUsIG9sZF9zdGF0ZSk7Cj4gKyAgICAgICAgICAgICAgIHJldHVybjsK
PiArICAgICAgIH0KPiArCj4gICAgICAgICBnZW0gPSBmYi0+b2JqWzBdOwo+ICAgICAgICAgbXRr
X2dlbSA9IHRvX210a19nZW1fb2JqKGdlbSk7Cj4gICAgICAgICBhZGRyID0gbXRrX2dlbS0+ZG1h
X2FkZHI7Cj4gQEAgLTIwMCwxNiArMjE1LDYgQEAgc3RhdGljIHZvaWQgbXRrX3BsYW5lX2F0b21p
Y191cGRhdGUoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCj4gICAgICAgICBzdGF0ZS0+cGVuZGlu
Zy5kaXJ0eSA9IHRydWU7Cj4gIH0KPgo+IC1zdGF0aWMgdm9pZCBtdGtfcGxhbmVfYXRvbWljX2Rp
c2FibGUoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCj4gLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHN0cnVjdCBkcm1fcGxhbmVfc3RhdGUgKm9sZF9zdGF0ZSkKPiAtewo+IC0g
ICAgICAgc3RydWN0IG10a19wbGFuZV9zdGF0ZSAqc3RhdGUgPSB0b19tdGtfcGxhbmVfc3RhdGUo
cGxhbmUtPnN0YXRlKTsKPiAtCj4gLSAgICAgICBzdGF0ZS0+cGVuZGluZy5lbmFibGUgPSBmYWxz
ZTsKPiAtICAgICAgIHdtYigpOyAvKiBNYWtlIHN1cmUgdGhlIGFib3ZlIHBhcmFtZXRlciBpcyBz
ZXQgYmVmb3JlIHVwZGF0ZSAqLwo+IC0gICAgICAgc3RhdGUtPnBlbmRpbmcuZGlydHkgPSB0cnVl
Owo+IC19Cj4gLQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9wbGFuZV9oZWxwZXJfZnVuY3Mg
bXRrX3BsYW5lX2hlbHBlcl9mdW5jcyA9IHsKPiAgICAgICAgIC5wcmVwYXJlX2ZiID0gZHJtX2dl
bV9mYl9wcmVwYXJlX2ZiLAo+ICAgICAgICAgLmF0b21pY19jaGVjayA9IG10a19wbGFuZV9hdG9t
aWNfY2hlY2ssCj4gLS0KPiAyLjI3LjAuMTExLmdjNzJjN2RhNjY3LWdvb2cKPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFp
bGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
