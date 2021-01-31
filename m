Return-Path: <SRS0=AqdA=HC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8B35C433E0
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 Jan 2021 03:40:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F40F64E21
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 Jan 2021 03:40:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F40F64E21
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Wcd72Uz6nEXJ3p8p/jljTPc1lMRGiMOn+dOzQIP5Gys=; b=kWE7VV7Fwy2ZKKsUQDlA9RIFF
	v5WS4Jk3H8zJQYW6a5kvS40xmrURZvdFfQiwixUL1kAhHjRemqjj9EVLXL0BecnK3mTMTkNp1HQMB
	gxe4LYNMe5hsbRCtfYSEw2AWIfXE7J9TuqPV2Jw9DBlWcQylxKKnu0LLEifsKGgfjwzXPGsC1jWVp
	mjNlHvRZaO18dJJfuknaBBHbm4AUcxuTLyuPfALPrYzZ/yG+dHPcgpovSBAIiioG23b0ZI5valACa
	heNIg/4CRIKI22EL7W4U5dpq3uO/xDDoPGK5PRlYiTDwe2wAQs0hwa/e3bG+nf0gyZaq8vEimiCw/
	Pj5Pl+yjA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l63ao-0001FA-B2; Sun, 31 Jan 2021 03:40:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l63aj-0001Dq-Ew; Sun, 31 Jan 2021 03:40:03 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 68D9364E25;
 Sun, 31 Jan 2021 03:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612064399;
 bh=RNiZ5TCNkSv22cSv6EJs8IrM1JowIcGzF+Sj2oYNTVA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=G/zhaf7333eKKO8CNnVmYAmmBD8cKv1vWAuXkYVpz7S13Er+f9hv52Jdt9AjQmMM2
 dSfCkb+XmaA3hKpuP48Xgz/cfje3ON4af/SI85nVCDip7Q+T5yTGEx/7wBf/ydmZhU
 rxAN+RyCUXPRFbR6nmv+Xy/EhWWE8HWYIDz8FvyJp5wuOIROm9NjRBfK38lnwbj8nh
 cZDAVDrPP2sx6lbVnxkOaiymSn8z6Vbsh5XYw67e5ePFTAlQZysBcv4/Vedvn3tZlI
 60atmGSgVe9Gir19dYd00Fa21qNQOzBdfmnI1YZB/Slu/KMVaVEllQQEcAxGTe77sx
 W5ruG1Lx7Rnjw==
Received: by mail-ej1-f42.google.com with SMTP id hs11so18962409ejc.1;
 Sat, 30 Jan 2021 19:39:59 -0800 (PST)
X-Gm-Message-State: AOAM531ANh6vQ+r4mWZTVeQZv6OfoytM074X3RmTEy7eOPtsoe63Ex8r
 Cr47AUTnozfInTTihyyyLerQ7YAzceJnhpkz2A==
X-Google-Smtp-Source: ABdhPJzYuzld2+PJhQ77huEimQis5+AK40LnLsdUu5MXFQj1YUc24jKH4JV04Fx95lTBI8IU35UcMjMy/jMWXoOmQq0=
X-Received: by 2002:a17:907:9687:: with SMTP id
 hd7mr11529326ejc.303.1612064397966; 
 Sat, 30 Jan 2021 19:39:57 -0800 (PST)
MIME-Version: 1.0
References: <20210129092209.2584718-1-hsinyi@chromium.org>
 <20210129092209.2584718-7-hsinyi@chromium.org>
In-Reply-To: <20210129092209.2584718-7-hsinyi@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 31 Jan 2021 11:39:46 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8rAAiiwtUJ_8nkp3WZKZ05Mo4oGxWnncywabGNHu3Ffg@mail.gmail.com>
Message-ID: <CAAOTY_8rAAiiwtUJ_8nkp3WZKZ05Mo4oGxWnncywabGNHu3Ffg@mail.gmail.com>
Subject: Re: [PATCH v13 6/8] drm/mediatek: enable dither function
To: Hsin-Yi Wang <hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210130_224001_677657_3513DABF 
X-CRM114-Status: GOOD (  20.73  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEhzaW4tWWk6CgpIc2luLVlpIFdhbmcgPGhzaW55aUBjaHJvbWl1bS5vcmc+IOaWvCAyMDIx
5bm0MeaciDI55pelIOmAseS6lCDkuIvljYg1OjIz5a+r6YGT77yaCj4KPiBGcm9tOiBZb25ncWlh
bmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4KPgo+IEVuYWJsZSBkaXRoZXIgZnVu
Y3Rpb24gdG8gaW1wcm92ZSB0aGUgZGlzcGxheSBxdWFsaXR5IGZvciBkaXRoZXIKPiBzdXBwb3J0
ZWQgYnBjIDQsIDYsIDguIEZvciBub3Qgc3VwcG9ydGVkIGJwYywgdXNlIHJlbGF5IG1vZGUuCj4K
PiBTaWduZWQtb2ZmLWJ5OiBZb25ncWlhbmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNv
bT4KPiBTaWduZWQtb2ZmLWJ5OiBIc2luLVlpIFdhbmcgPGhzaW55aUBjaHJvbWl1bS5vcmc+Cj4g
LS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMgfCAxNSAr
KysrKysrKysrKystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cm1fZGRwX2NvbXAuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21w
LmMKPiBpbmRleCBhYzJjYjI1NjIwMzU3Li41NzYxZGQxNWVlZGYyIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jCj4gQEAgLTUzLDYgKzUzLDcgQEAK
PiAgI2RlZmluZSBESVRIRVJfRU4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBCSVQoMCkK
PiAgI2RlZmluZSBESVNQX0RJVEhFUl9DRkcgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IDB4MDAyMAo+ICAjZGVmaW5lIERJVEhFUl9SRUxBWV9NT0RFICAgICAgICAgICAgICAgICAgICAg
IEJJVCgwKQo+ICsjZGVmaW5lIERJVEhFUl9FTkdJTkVfRU4gICAgICAgICAgICAgICAgICAgICAg
IEJJVCgxKQo+ICAjZGVmaW5lIERJU1BfRElUSEVSX1NJWkUgICAgICAgICAgICAgICAgICAgICAg
IDB4MDAzMAo+Cj4gICNkZWZpbmUgTFVUXzEwQklUX01BU0sgICAgICAgICAgICAgICAgICAgICAg
ICAgMHgwM2ZmCj4gQEAgLTMxNCw5ICszMTUsMTcgQEAgc3RhdGljIHZvaWQgbXRrX2RpdGhlcl9j
b25maWcoc3RydWN0IGRldmljZSAqZGV2LCB1bnNpZ25lZCBpbnQgdywKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgYnBjLCBzdHJ1Y3QgY21kcV9wa3QgKmNtZHFf
cGt0KQo+ICB7Cj4gICAgICAgICBzdHJ1Y3QgbXRrX2RkcF9jb21wX2RldiAqcHJpdiA9IGRldl9n
ZXRfZHJ2ZGF0YShkZXYpOwo+IC0KPiAtICAgICAgIG10a19kZHBfd3JpdGUoY21kcV9wa3QsIGgg
PDwgMTYgfCB3LCAmcHJpdi0+Y21kcV9yZWcsIHByaXYtPnJlZ3MsIERJU1BfRElUSEVSX1NJWkUp
Owo+IC0gICAgICAgbXRrX2RkcF93cml0ZShjbWRxX3BrdCwgRElUSEVSX1JFTEFZX01PREUsICZw
cml2LT5jbWRxX3JlZywgcHJpdi0+cmVncywgRElTUF9ESVRIRVJfQ0ZHKTsKPiArICAgICAgIGJv
b2wgdmFsaWRfYnBjID0gKGJwYyA9PSA0IHx8IGJwYyA9PSA2IHx8IGJwYyA9PSA4KTsKPiArCj4g
KyAgICAgICBtdGtfZGRwX3dyaXRlKGNtZHFfcGt0LCBoIDw8IDE2IHwgdywgJnByaXYtPmNtZHFf
cmVnLCBwcml2LT5yZWdzLAo+ICsgICAgICAgICAgICAgICAgICAgICBESVNQX0RJVEhFUl9TSVpF
KTsKPiArICAgICAgIGlmICh2YWxpZF9icGMpCj4gKyAgICAgICAgICAgICAgIG10a19kaXRoZXJf
c2V0X2NvbW1vbihwcml2LT5yZWdzLCAmcHJpdi0+Y21kcV9yZWcsIGJwYywKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIERJU1BfRElUSEVSX0NGRywgRElUSEVSX0VOR0lO
RV9FTiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNtZHFfcGt0KTsK
PiArICAgICAgIGVsc2UKPiArICAgICAgICAgICAgICAgbXRrX2RkcF93cml0ZShjbWRxX3BrdCwg
RElUSEVSX1JFTEFZX01PREUsICZwcml2LT5jbWRxX3JlZywKPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBwcml2LT5yZWdzLCBESVNQX0RJVEhFUl9DRkcpOwoKb2QgaGFzIHJlbGF5IG1v
ZGUsCgpzdGF0aWMgdm9pZCBtdGtfb2RfY29uZmlnKHN0cnVjdCBtdGtfZGRwX2NvbXAgKmNvbXAs
IHVuc2lnbmVkIGludCB3LAogIHVuc2lnbmVkIGludCBoLCB1bnNpZ25lZCBpbnQgdnJlZnJlc2gs
CiAgdW5zaWduZWQgaW50IGJwYywgc3RydWN0IGNtZHFfcGt0ICpjbWRxX3BrdCkKewptdGtfZGRw
X3dyaXRlKGNtZHFfcGt0LCB3IDw8IDE2IHwgaCwgY29tcCwgRElTUF9PRF9TSVpFKTsKbXRrX2Rk
cF93cml0ZShjbWRxX3BrdCwgT0RfUkVMQVlNT0RFLCBjb21wLCBESVNQX09EX0NGRyk7Cm10a19k
aXRoZXJfc2V0KGNvbXAsIGJwYywgRElTUF9PRF9DRkcsIGNtZHFfcGt0KTsKfQoKYW5kIGl0IGRv
ZXMgbm90IGNoZWNrIHZhbGlkIGJwYyAoSSB0aGluayBkcm0gY29yZSBhbHJlYWR5IHNldCBicGMg
dG8KNCwgNiwgOCBvciAwKSwgc28gYWxpZ24gaW1wbGVtZW50YXRpb24gb2YgbXRrX2RpdGhlcl9j
b25maWcoKSB3aXRoCm10a19vZF9jb25maWcoKS4KZ2FtbWEgYWxzbyBoYXMgcmVsYXkgbW9kZSAo
cmVmZXIgdG8gWzFdIHBhZ2UgNjg5KSwgYnV0IHdlIG5lZWQgdG8KZW5hYmxlIGdhbW1hJ3MgZ2Ft
bWEgZnVuY3Rpb24sIHNvIHdlIGRvIG5vdCBzZXQgZ2FtbWEgdG8gcmVsYXkgbW9kZS4KU28gSSB0
aGluayBtYXliZSB3ZSBjb3VsZCBpbXBsZW1lbnQgbXRrX2RpdGhlcl9jb25maWcoKSBhczoKCm10
a19kaXRoZXJfY29uZmlnKCkKewogICAgICAgIG10a19kZHBfd3JpdGUoY21kcV9wa3QsIGggPDwg
MTYgfCB3LCAmcHJpdi0+Y21kcV9yZWcsCnByaXYtPnJlZ3MsIERJU1BfRElUSEVSX1NJWkUpOwog
ICAgICAgIG10a19kZHBfd3JpdGUoY21kcV9wa3QsIERJVEhFUl9SRUxBWV9NT0RFLCAmcHJpdi0+
Y21kcV9yZWcsCnByaXYtPnJlZ3MsIERJU1BfRElUSEVSX0NGRyk7CiAgICAgICAgbXRrX2RpdGhl
cl9zZXRfY29tbW9uKHByaXYtPnJlZ3MsICZwcml2LT5jbWRxX3JlZywgYnBjLApESVNQX0RJVEhF
Ul9DRkcsIERJVEhFUl9FTkdJTkVfRU4sIGNtZHFfcGt0KTsKfQoKWzFdIGh0dHBzOi8vd3d3Ljk2
Ym9hcmRzLm9yZy9kb2N1bWVudGF0aW9uL2NvbnN1bWVyL21lZGlhdGVreDIwL2FkZGl0aW9uYWwt
ZG9jcy9kb2NzL01UNjc5N19SZWdpc3Rlcl9UYWJsZV9QYXJ0XzIucGRmCgpSZWdhcmRzLApDaHVu
LUt1YW5nLgoKPiAgfQo+Cj4gIHN0YXRpYyB2b2lkIG10a19kaXRoZXJfc3RhcnQoc3RydWN0IGRl
dmljZSAqZGV2KQo+IC0tCj4gMi4zMC4wLjM2NS5nMDJiYzY5Mzc4OS1nb29nCj4KPgo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXgtbWVkaWF0
ZWsgbWFpbGluZyBsaXN0Cj4gTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1l
ZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
