Return-Path: <SRS0=UyV0=DN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A5C8C4363D
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2020 23:24:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CACC9206F4
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2020 23:24:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K06LiGSg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="OFHm1jcx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CACC9206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=O6KJqFO/hwfzCkB1M6TTxnWsK4oj6GT3beWpTLilsRM=; b=K06LiGSguSJ5ZJILmfP7VUCUp
	9vEESqV40TP7Fjp8zQRmYW2dn3HeHVfpYPfAcQRgKmF4Pq7iQEorupQnIhJQdCMjylH/bwzHV1dfi
	dklGGp6ULK3rxUCXzn1Jx4oLSisPs9P+4q5wT02wlcJypN6JVK4YPaO7oP9RXU4PTO8O99lZuEhnD
	oX9baOY5voCADkLSTt2Ln4HMn3ZMEwYYf6+wqkXxwsVOa60QxJLyBmycHe1P1xXJOZOHgQc/7FRW2
	tuaIR4NspefRAVpN4/IQNifdEFEHnq5yMT5w2CJbI2gY2xGNlykYOWwxuxyxeK99bj/GPtxZ+S6Tq
	k0DQMLOlw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPwK0-0005TE-8K; Tue, 06 Oct 2020 23:24:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPwJv-0005SC-LU; Tue, 06 Oct 2020 23:24:36 +0000
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 227F92100A;
 Tue,  6 Oct 2020 23:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602026674;
 bh=7fCFux5T52NDX9X2wa4ONXbiYQX8LD2c8RnqfpaOVKM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=OFHm1jcxiWUYB9G6jvRQPqXKAcgVUdnPMO7wHxKd6A38ZjnGabDGDK9hJz9yrOfjW
 5pEMVNUkuTmGzSnXt5tQwLzXk4ieJRk55CoMGxqv3T0hCkmo04WQVggC3aYgayVB6C
 SbncSCiGnjZcOhJZop/FzRoFV8XoVbO20QxHWt/Q=
Received: by mail-ed1-f49.google.com with SMTP id t21so221770eds.6;
 Tue, 06 Oct 2020 16:24:34 -0700 (PDT)
X-Gm-Message-State: AOAM530V2fMUScAs/0tdgKVl5XByVvE2AVhIWa1dlr11tQSRJEJQnZgu
 aSTrP850Pg94vrrB+u3JPDVWDWNOEJ8Ya3SvyA==
X-Google-Smtp-Source: ABdhPJwkiVZMgIhg+FDOs00EiyOPpGCdsQi8SVV4lVL6LqIgdTHCy0njE2cQDMAxUJQR6YQtRXDDbdTlrnOVRoProjw=
X-Received: by 2002:aa7:cd5a:: with SMTP id v26mr541730edw.38.1602026672473;
 Tue, 06 Oct 2020 16:24:32 -0700 (PDT)
MIME-Version: 1.0
References: <20201006193320.405529-1-enric.balletbo@collabora.com>
 <20201006193320.405529-4-enric.balletbo@collabora.com>
In-Reply-To: <20201006193320.405529-4-enric.balletbo@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 7 Oct 2020 07:24:20 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-yoptcLCg1YC-wZv+jsOKsKsYFY1xCCwqWVv7M8nNd_w@mail.gmail.com>
Message-ID: <CAAOTY_-yoptcLCg1YC-wZv+jsOKsKsYFY1xCCwqWVv7M8nNd_w@mail.gmail.com>
Subject: Re: [PATCH 3/4] soc: mediatek: mmsys: Create struct mtk_mmsys to
 store context data
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_192435_855402_C6665E0B 
X-CRM114-Status: GOOD (  20.84  )
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
 Nicolas Boichat <drinkcat@chromium.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, CK Hu <ck.hu@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

RW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0Ym9AY29sbGFib3JhLmNvbT4g5pa8
IDIwMjDlubQxMOaciDfml6Ug6YCx5LiJIOS4iuWNiDM6MzPlr6vpgZPvvJoKPgo+IEZyb206IENL
IEh1IDxjay5odUBtZWRpYXRlay5jb20+Cj4KPiBBcGFydCBmcm9tIHRoZSBkcml2ZXIgZGF0YSwg
aW4gb3JkZXIgdG8gZXh0ZW5kIHRoZSBkcml2ZXIgdG8gc3VwcG9ydCBtb3JlCj4gYW5kIG1vcmUg
U29Dcywgd2Ugd2lsbCBuZWVkIHRvIHN0b3JlIG90aGVyIGNvbmZpZ3VyYXRpb24gZGF0YS4gU28s
IGNyZWF0ZQo+IGEgbXRrX21tc3lzIHN0cnVjdCB0byBlbmNhcHN1bGF0ZSBhbGwgdGhhdCBpbmZv
cm1hdGlvbi4KClJldmlld2VkLWJ5OiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAbWVkaWF0
ZWsuY29tPgoKPgo+IFNpZ25lZC1vZmYtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+Cj4g
U2lnbmVkLW9mZi1ieTogRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0Ym9AY29s
bGFib3JhLmNvbT4KPiAtLS0KPgo+ICBkcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstbW1zeXMuYyB8
IDQ3ICsrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAy
NyBpbnNlcnRpb25zKCspLCAyMCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3NvYy9tZWRpYXRlay9tdGstbW1zeXMuYyBiL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1tbXN5
cy5jCj4gaW5kZXggMThmOTM5NzllMTRhLi5kYTJkZThmNjk2OWUgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmMKPiArKysgYi9kcml2ZXJzL3NvYy9tZWRpYXRl
ay9tdGstbW1zeXMuYwo+IEBAIC0xMDEsNiArMTAxLDExIEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
bXRrX21tc3lzX2RyaXZlcl9kYXRhIG10ODE4M19tbXN5c19kcml2ZXJfZGF0YSA9IHsKPiAgICAg
ICAgIC5jbGtfZHJpdmVyID0gImNsay1tdDgxODMtbW0iLAo+ICB9Owo+Cj4gK3N0cnVjdCBtdGtf
bW1zeXMgewo+ICsgICAgICAgdm9pZCBfX2lvbWVtICpyZWdzOwo+ICsgICAgICAgY29uc3Qgc3Ry
dWN0IG10a19tbXN5c19kcml2ZXJfZGF0YSAqZGF0YTsKPiArfTsKPiArCj4gIHN0YXRpYyB1bnNp
Z25lZCBpbnQgbXRrX21tc3lzX2RkcF9tb3V0X2VuKGVudW0gbXRrX2RkcF9jb21wX2lkIGN1ciwK
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlbnVtIG10a19kZHBf
Y29tcF9pZCBuZXh0LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHVuc2lnbmVkIGludCAqYWRkcikKPiBAQCAtMjU5LDIxICsyNjQsMjEgQEAgdm9pZCBtdGtfbW1z
eXNfZGRwX2Nvbm5lY3Qoc3RydWN0IGRldmljZSAqZGV2LAo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGVudW0gbXRrX2RkcF9jb21wX2lkIGN1ciwKPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBlbnVtIG10a19kZHBfY29tcF9pZCBuZXh0KQo+ICB7Cj4gLSAgICAgICB2b2lkIF9faW9t
ZW0gKmNvbmZpZ19yZWdzID0gZGV2X2dldF9kcnZkYXRhKGRldik7Cj4gKyAgICAgICBzdHJ1Y3Qg
bXRrX21tc3lzICptbXN5cyA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwo+ICAgICAgICAgdW5zaWdu
ZWQgaW50IGFkZHIsIHZhbHVlLCByZWc7Cj4KPiAgICAgICAgIHZhbHVlID0gbXRrX21tc3lzX2Rk
cF9tb3V0X2VuKGN1ciwgbmV4dCwgJmFkZHIpOwo+ICAgICAgICAgaWYgKHZhbHVlKSB7Cj4gLSAg
ICAgICAgICAgICAgIHJlZyA9IHJlYWRsX3JlbGF4ZWQoY29uZmlnX3JlZ3MgKyBhZGRyKSB8IHZh
bHVlOwo+IC0gICAgICAgICAgICAgICB3cml0ZWxfcmVsYXhlZChyZWcsIGNvbmZpZ19yZWdzICsg
YWRkcik7Cj4gKyAgICAgICAgICAgICAgIHJlZyA9IHJlYWRsX3JlbGF4ZWQobW1zeXMtPnJlZ3Mg
KyBhZGRyKSB8IHZhbHVlOwo+ICsgICAgICAgICAgICAgICB3cml0ZWxfcmVsYXhlZChyZWcsIG1t
c3lzLT5yZWdzICsgYWRkcik7Cj4gICAgICAgICB9Cj4KPiAtICAgICAgIG10a19tbXN5c19kZHBf
c291dF9zZWwoY29uZmlnX3JlZ3MsIGN1ciwgbmV4dCk7Cj4gKyAgICAgICBtdGtfbW1zeXNfZGRw
X3NvdXRfc2VsKG1tc3lzLT5yZWdzLCBjdXIsIG5leHQpOwo+Cj4gICAgICAgICB2YWx1ZSA9IG10
a19tbXN5c19kZHBfc2VsX2luKGN1ciwgbmV4dCwgJmFkZHIpOwo+ICAgICAgICAgaWYgKHZhbHVl
KSB7Cj4gLSAgICAgICAgICAgICAgIHJlZyA9IHJlYWRsX3JlbGF4ZWQoY29uZmlnX3JlZ3MgKyBh
ZGRyKSB8IHZhbHVlOwo+IC0gICAgICAgICAgICAgICB3cml0ZWxfcmVsYXhlZChyZWcsIGNvbmZp
Z19yZWdzICsgYWRkcik7Cj4gKyAgICAgICAgICAgICAgIHJlZyA9IHJlYWRsX3JlbGF4ZWQobW1z
eXMtPnJlZ3MgKyBhZGRyKSB8IHZhbHVlOwo+ICsgICAgICAgICAgICAgICB3cml0ZWxfcmVsYXhl
ZChyZWcsIG1tc3lzLT5yZWdzICsgYWRkcik7Cj4gICAgICAgICB9Cj4gIH0KPiAgRVhQT1JUX1NZ
TUJPTF9HUEwobXRrX21tc3lzX2RkcF9jb25uZWN0KTsKPiBAQCAtMjgyLDQ0ICsyODcsNDYgQEAg
dm9pZCBtdGtfbW1zeXNfZGRwX2Rpc2Nvbm5lY3Qoc3RydWN0IGRldmljZSAqZGV2LAo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGVudW0gbXRrX2RkcF9jb21wX2lkIGN1ciwKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBlbnVtIG10a19kZHBfY29tcF9pZCBuZXh0KQo+ICB7
Cj4gLSAgICAgICB2b2lkIF9faW9tZW0gKmNvbmZpZ19yZWdzID0gZGV2X2dldF9kcnZkYXRhKGRl
dik7Cj4gKyAgICAgICBzdHJ1Y3QgbXRrX21tc3lzICptbXN5cyA9IGRldl9nZXRfZHJ2ZGF0YShk
ZXYpOwo+ICAgICAgICAgdW5zaWduZWQgaW50IGFkZHIsIHZhbHVlLCByZWc7Cj4KPiAgICAgICAg
IHZhbHVlID0gbXRrX21tc3lzX2RkcF9tb3V0X2VuKGN1ciwgbmV4dCwgJmFkZHIpOwo+ICAgICAg
ICAgaWYgKHZhbHVlKSB7Cj4gLSAgICAgICAgICAgICAgIHJlZyA9IHJlYWRsX3JlbGF4ZWQoY29u
ZmlnX3JlZ3MgKyBhZGRyKSAmIH52YWx1ZTsKPiAtICAgICAgICAgICAgICAgd3JpdGVsX3JlbGF4
ZWQocmVnLCBjb25maWdfcmVncyArIGFkZHIpOwo+ICsgICAgICAgICAgICAgICByZWcgPSByZWFk
bF9yZWxheGVkKG1tc3lzLT5yZWdzICsgYWRkcikgJiB+dmFsdWU7Cj4gKyAgICAgICAgICAgICAg
IHdyaXRlbF9yZWxheGVkKHJlZywgbW1zeXMtPnJlZ3MgKyBhZGRyKTsKPiAgICAgICAgIH0KPgo+
ICAgICAgICAgdmFsdWUgPSBtdGtfbW1zeXNfZGRwX3NlbF9pbihjdXIsIG5leHQsICZhZGRyKTsK
PiAgICAgICAgIGlmICh2YWx1ZSkgewo+IC0gICAgICAgICAgICAgICByZWcgPSByZWFkbF9yZWxh
eGVkKGNvbmZpZ19yZWdzICsgYWRkcikgJiB+dmFsdWU7Cj4gLSAgICAgICAgICAgICAgIHdyaXRl
bF9yZWxheGVkKHJlZywgY29uZmlnX3JlZ3MgKyBhZGRyKTsKPiArICAgICAgICAgICAgICAgcmVn
ID0gcmVhZGxfcmVsYXhlZChtbXN5cy0+cmVncyArIGFkZHIpICYgfnZhbHVlOwo+ICsgICAgICAg
ICAgICAgICB3cml0ZWxfcmVsYXhlZChyZWcsIG1tc3lzLT5yZWdzICsgYWRkcik7Cj4gICAgICAg
ICB9Cj4gIH0KPiAgRVhQT1JUX1NZTUJPTF9HUEwobXRrX21tc3lzX2RkcF9kaXNjb25uZWN0KTsK
Pgo+ICBzdGF0aWMgaW50IG10a19tbXN5c19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQo+ICB7Cj4gLSAgICAgICBjb25zdCBzdHJ1Y3QgbXRrX21tc3lzX2RyaXZlcl9kYXRhICpk
YXRhOwo+ICAgICAgICAgc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsKPiAgICAgICAg
IHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKmNsa3M7Cj4gICAgICAgICBzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpkcm07Cj4gLSAgICAgICB2b2lkIF9faW9tZW0gKmNvbmZpZ19yZWdzOwo+ICsgICAg
ICAgc3RydWN0IG10a19tbXN5cyAqbW1zeXM7Cj4gICAgICAgICBpbnQgcmV0Owo+Cj4gLSAgICAg
ICBjb25maWdfcmVncyA9IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZShwZGV2LCAwKTsK
PiAtICAgICAgIGlmIChJU19FUlIoY29uZmlnX3JlZ3MpKSB7Cj4gLSAgICAgICAgICAgICAgIHJl
dCA9IFBUUl9FUlIoY29uZmlnX3JlZ3MpOwo+ICsgICAgICAgbW1zeXMgPSBkZXZtX2t6YWxsb2Mo
ZGV2LCBzaXplb2YoKm1tc3lzKSwgR0ZQX0tFUk5FTCk7Cj4gKyAgICAgICBpZiAoIW1tc3lzKQo+
ICsgICAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsKPiArCj4gKyAgICAgICBtbXN5cy0+cmVn
cyA9IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZShwZGV2LCAwKTsKPiArICAgICAgIGlm
IChJU19FUlIobW1zeXMtPnJlZ3MpKSB7Cj4gKyAgICAgICAgICAgICAgIHJldCA9IFBUUl9FUlIo
bW1zeXMtPnJlZ3MpOwo+ICAgICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBp
b3JlbWFwIG1tc3lzIHJlZ2lzdGVyczogJWRcbiIsIHJldCk7Cj4gICAgICAgICAgICAgICAgIHJl
dHVybiByZXQ7Cj4gICAgICAgICB9Cj4KPiAtICAgICAgIHBsYXRmb3JtX3NldF9kcnZkYXRhKHBk
ZXYsIGNvbmZpZ19yZWdzKTsKPiAtCj4gLSAgICAgICBkYXRhID0gb2ZfZGV2aWNlX2dldF9tYXRj
aF9kYXRhKCZwZGV2LT5kZXYpOwo+ICsgICAgICAgbW1zeXMtPmRhdGEgPSBvZl9kZXZpY2VfZ2V0
X21hdGNoX2RhdGEoJnBkZXYtPmRldik7Cj4gKyAgICAgICBwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShw
ZGV2LCBtbXN5cyk7Cj4KPiAtICAgICAgIGNsa3MgPSBwbGF0Zm9ybV9kZXZpY2VfcmVnaXN0ZXJf
ZGF0YSgmcGRldi0+ZGV2LCBkYXRhLT5jbGtfZHJpdmVyLAo+ICsgICAgICAgY2xrcyA9IHBsYXRm
b3JtX2RldmljZV9yZWdpc3Rlcl9kYXRhKCZwZGV2LT5kZXYsIG1tc3lzLT5kYXRhLT5jbGtfZHJp
dmVyLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBMQVRG
T1JNX0RFVklEX0FVVE8sIE5VTEwsIDApOwo+ICAgICAgICAgaWYgKElTX0VSUihjbGtzKSkKPiAg
ICAgICAgICAgICAgICAgcmV0dXJuIFBUUl9FUlIoY2xrcyk7Cj4gLS0KPiAyLjI4LjAKPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0
ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
