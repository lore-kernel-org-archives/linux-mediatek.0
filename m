Return-Path: <SRS0=452w=GM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 146FBC433DB
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Jan 2021 23:14:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9E3123998
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Jan 2021 23:14:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9E3123998
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EmTdwCMWBqboau2VixH4guoIGK/KiS690I1UuSiCWao=; b=lfN4lPAGI9glv8WP93A+kw5rV
	FiN9q8NKpBs1H7/fknpLYAOe1Sxxv67gZEgBBQPAYbs8xcCTqJx0kXI3RLw6DYSeslg/wBIjiWOM9
	9tGrtqhOOa3sladcZRJ/I0gI/WYvU7FZEEh4HVI/e9rj9r3boiDAUGrp6vUsHAoMruBJs6kQH+yOL
	B+PhP+I6e8n9ZNI6GLBOTkA0xpTs/9TEq4mllklmwXmpWpa0bV23XqyKddx+oOZ4aLOc0RB+SI2ql
	e04t8K8t8047PueXvKpLHiaIoSq0kKY7+9pXvKRZan9s2ppuVU5uPCssdsEmpyFXvnzDc95Gpv3rV
	rL1TUXEwA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyNRQ-0007Yb-SF; Sat, 09 Jan 2021 23:14:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyND1-0000jJ-4s; Sat, 09 Jan 2021 22:59:48 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5B7D1238E7;
 Sat,  9 Jan 2021 22:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610233184;
 bh=fnoMgybr+1G8nuwpGXS+MC2Rlg+Qkb5sQs6b/Ft7L/8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cbsV4BqtD6w0gO5iPcgjgMz7uF/CVhwf5IientYpv2WVOdJPOSS8Rd7saou2Rp06H
 20373RonIDE7vNkJkPkN3vCC0jkUbwgPFQvJ1mS5Z2YP8m6qEWo1ut8qXSZE4JgGOs
 wwHboK8O7R3MkRA3wkP82cp8B7QZH0iX6JOZ20YTHcNZ9WnD++0wu9YieoIyr0/buY
 PXaasg9VanpmG0PwZXufzxTcQgQPpdPTKlwnng934zLLvBPFyjruCbBGGUqDrZW80r
 RWuiXe+LZ5ztLsPpkvzY7fA+jwtRgqkPMhQYFlC5S33B2ZoRVkA3wzHoi8zm3aZdFT
 CIhyzkDt2MBsA==
Received: by mail-ed1-f52.google.com with SMTP id p22so14877638edu.11;
 Sat, 09 Jan 2021 14:59:44 -0800 (PST)
X-Gm-Message-State: AOAM530fAgeqY0xv3TfgSF4Ucb6KWfrgqccXwSDefh4G/AhFkBVwc7W9
 W5GNVnbQprTOqqjWgQHahA1jzOw+0I4Rk8cgVA==
X-Google-Smtp-Source: ABdhPJzg/pGerCaQWoQQQmH4uyvNLs23kMnBDhHhKxh3kBiwEEtWRcupfoLlQtwoM6WHVeOmHlY13STveFAlYY4+9P0=
X-Received: by 2002:a05:6402:3048:: with SMTP id
 bu8mr9553978edb.49.1610233182880; 
 Sat, 09 Jan 2021 14:59:42 -0800 (PST)
MIME-Version: 1.0
References: <20201202235856.7652-1-chunkuang.hu@kernel.org>
In-Reply-To: <20201202235856.7652-1-chunkuang.hu@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 10 Jan 2021 06:59:30 +0800
X-Gmail-Original-Message-ID: <CAAOTY__p4C0ctXuOFu42-9HaTrGnOef-Sg47pyC0Uk7yN5406w@mail.gmail.com>
Message-ID: <CAAOTY__p4C0ctXuOFu42-9HaTrGnOef-Sg47pyC0Uk7yN5406w@mail.gmail.com>
Subject: Re: [PATCH] soc: mediatek: cmdq: Remove cmdq_pkt_flush()
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210109_175947_363310_92F2ABD5 
X-CRM114-Status: GOOD (  18.84  )
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
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIE1hdHRoaWFzOgoKQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+IOaW
vCAyMDIw5bm0MTLmnIgz5pelIOmAseWbmyDkuIrljYg3OjU55a+r6YGT77yaCj4KPiByeF9jYWxs
YmFjayBpcyBhIHN0YW5kYXJkIG1haWxib3ggY2FsbGJhY2sgbWVjaGFuaXNtIGFuZCBjb3VsZAo+
IGNvdmVyIHRoZSBmdW5jdGlvbiBvZiBwcm9wcmlldGFyeSBjbWRxX3Rhc2tfY2IsIHNvIGl0IGlz
IGJldHRlcgo+IHRvIHVzZSB0aGUgc3RhbmRhcmQgb25lIGluc3RlYWQgb2YgdGhlIHByb3ByaWV0
YXJ5IG9uZS4gQnV0Cj4gcmVnaXN0ZXIgcnhfY2FsbGJhY2sgc2hvdWxkIGJlZm9yZSBtYm94X3Jl
cXVlc3RfY2hhbm5lbCgpLAo+IHNvIHJlbW92ZSBjbWRxX3BrdF9mbHVzaCgpIGFuZCBsZXQgY2xp
ZW50IGRyaXZlciBpbXBsZW1lbnQKPiBpdHMgb3duIHN5bmNocm9ub3VzIGZsdXNoLgoKSG93IGRv
IHlvdSB0aGluayBhYm91dCB0aGlzIHBhdGNoPyBUaGlzIHBhdGNoIGlzIGRlcml2ZWQgZnJvbSBb
MV0KYWNjb3JkaW5nIHRvIEphc3NpJ3Mgc3VnZ2VzdGlvbiBbMl0uCgpbMV0gaHR0cHM6Ly9wYXRj
aHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVrL3BhdGNoLzIwMjAwOTI3MjMw
NDIyLjExNjEwLTMtY2h1bmt1YW5nLmh1QGtlcm5lbC5vcmcvClsyXSBodHRwczovL3BhdGNod29y
ay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsvY292ZXIvMjAyMDA5MjcyMzA0MjIu
MTE2MTAtMS1jaHVua3VhbmcuaHVAa2VybmVsLm9yZy8KClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+
Cj4gU2lnbmVkLW9mZi1ieTogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+
Cj4gLS0tCj4gIGRyaXZlcnMvc29jL21lZGlhdGVrL210ay1jbWRxLWhlbHBlci5jIHwgMzIgLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRr
LWNtZHEuaCAgfCAxMiAtLS0tLS0tLS0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgNDQgZGVsZXRpb25z
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLWNtZHEtaGVscGVy
LmMgYi9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstY21kcS1oZWxwZXIuYwo+IGluZGV4IDUwNTY1
MWIwZDcxNS4uZmQzYmMzOTUzOGExIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvc29jL21lZGlhdGVr
L210ay1jbWRxLWhlbHBlci5jCj4gKysrIGIvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLWNtZHEt
aGVscGVyLmMKPiBAQCAtNTAyLDM2ICs1MDIsNCBAQCBpbnQgY21kcV9wa3RfZmx1c2hfYXN5bmMo
c3RydWN0IGNtZHFfcGt0ICpwa3QsIGNtZHFfYXN5bmNfZmx1c2hfY2IgY2IsCj4gIH0KPiAgRVhQ
T1JUX1NZTUJPTChjbWRxX3BrdF9mbHVzaF9hc3luYyk7Cj4KPiAtc3RydWN0IGNtZHFfZmx1c2hf
Y29tcGxldGlvbiB7Cj4gLSAgICAgICBzdHJ1Y3QgY29tcGxldGlvbiBjbXBsdDsKPiAtICAgICAg
IGJvb2wgZXJyOwo+IC19Owo+IC0KPiAtc3RhdGljIHZvaWQgY21kcV9wa3RfZmx1c2hfY2Ioc3Ry
dWN0IGNtZHFfY2JfZGF0YSBkYXRhKQo+IC17Cj4gLSAgICAgICBzdHJ1Y3QgY21kcV9mbHVzaF9j
b21wbGV0aW9uICpjbXBsdDsKPiAtCj4gLSAgICAgICBjbXBsdCA9IChzdHJ1Y3QgY21kcV9mbHVz
aF9jb21wbGV0aW9uICopZGF0YS5kYXRhOwo+IC0gICAgICAgaWYgKGRhdGEuc3RhICE9IENNRFFf
Q0JfTk9STUFMKQo+IC0gICAgICAgICAgICAgICBjbXBsdC0+ZXJyID0gdHJ1ZTsKPiAtICAgICAg
IGVsc2UKPiAtICAgICAgICAgICAgICAgY21wbHQtPmVyciA9IGZhbHNlOwo+IC0gICAgICAgY29t
cGxldGUoJmNtcGx0LT5jbXBsdCk7Cj4gLX0KPiAtCj4gLWludCBjbWRxX3BrdF9mbHVzaChzdHJ1
Y3QgY21kcV9wa3QgKnBrdCkKPiAtewo+IC0gICAgICAgc3RydWN0IGNtZHFfZmx1c2hfY29tcGxl
dGlvbiBjbXBsdDsKPiAtICAgICAgIGludCBlcnI7Cj4gLQo+IC0gICAgICAgaW5pdF9jb21wbGV0
aW9uKCZjbXBsdC5jbXBsdCk7Cj4gLSAgICAgICBlcnIgPSBjbWRxX3BrdF9mbHVzaF9hc3luYyhw
a3QsIGNtZHFfcGt0X2ZsdXNoX2NiLCAmY21wbHQpOwo+IC0gICAgICAgaWYgKGVyciA8IDApCj4g
LSAgICAgICAgICAgICAgIHJldHVybiBlcnI7Cj4gLSAgICAgICB3YWl0X2Zvcl9jb21wbGV0aW9u
KCZjbXBsdC5jbXBsdCk7Cj4gLQo+IC0gICAgICAgcmV0dXJuIGNtcGx0LmVyciA/IC1FRkFVTFQg
OiAwOwo+IC19Cj4gLUVYUE9SVF9TWU1CT0woY21kcV9wa3RfZmx1c2gpOwo+IC0KPiAgTU9EVUxF
X0xJQ0VOU0UoIkdQTCB2MiIpOwo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3NvYy9tZWRp
YXRlay9tdGstY21kcS5oIGIvaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRrLWNtZHEuaAo+
IGluZGV4IDk2MDcwNGQ3NTk5NC4uMmM2YWE4NGMwZTgwIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUv
bGludXgvc29jL21lZGlhdGVrL210ay1jbWRxLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L3NvYy9t
ZWRpYXRlay9tdGstY21kcS5oCj4gQEAgLTI4OCwxNiArMjg4LDQgQEAgaW50IGNtZHFfcGt0X2Zp
bmFsaXplKHN0cnVjdCBjbWRxX3BrdCAqcGt0KTsKPiAgaW50IGNtZHFfcGt0X2ZsdXNoX2FzeW5j
KHN0cnVjdCBjbWRxX3BrdCAqcGt0LCBjbWRxX2FzeW5jX2ZsdXNoX2NiIGNiLAo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICB2b2lkICpkYXRhKTsKPgo+IC0vKioKPiAtICogY21kcV9wa3RfZmx1
c2goKSAtIHRyaWdnZXIgQ01EUSB0byBleGVjdXRlIHRoZSBDTURRIHBhY2tldAo+IC0gKiBAcGt0
OiAgICAgICB0aGUgQ01EUSBwYWNrZXQKPiAtICoKPiAtICogUmV0dXJuOiAwIGZvciBzdWNjZXNz
OyBlbHNlIHRoZSBlcnJvciBjb2RlIGlzIHJldHVybmVkCj4gLSAqCj4gLSAqIFRyaWdnZXIgQ01E
USB0byBleGVjdXRlIHRoZSBDTURRIHBhY2tldC4gTm90ZSB0aGF0IHRoaXMgaXMgYQo+IC0gKiBz
eW5jaHJvbm91cyBmbHVzaCBmdW5jdGlvbi4gV2hlbiB0aGUgZnVuY3Rpb24gcmV0dXJuZWQsIHRo
ZSByZWNvcmRlZAo+IC0gKiBjb21tYW5kcyBoYXZlIGJlZW4gZG9uZS4KPiAtICovCj4gLWludCBj
bWRxX3BrdF9mbHVzaChzdHJ1Y3QgY21kcV9wa3QgKnBrdCk7Cj4gLQo+ICAjZW5kaWYgLyogX19N
VEtfQ01EUV9IX18gKi8KPiAtLQo+IDIuMTcuMQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgt
bWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
