Return-Path: <SRS0=2/VK=DO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11012C4363D
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Oct 2020 00:01:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF5FD212CC
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Oct 2020 00:01:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2xTWa9nG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="bdZiafyz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF5FD212CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mRL6hS2Ef2lb3bLRjFdc2AYCCB/hxRG1HIZRFDxa0Vc=; b=2xTWa9nGgdzA6OMKkY4LowqOD
	NWp6g7aOGXb/8BlkS2uqcjEoi2gcD+56DcRoAv9EpdtoVloE5r6j2410CJYXF7OQzD61FkG+amk8Z
	nfGZkIiyaOaJJdghieuuIKMHlafIeGzcl67bsfqnOBRoXm9AuJekKjP9jKk23YMqgnIwxO5orolFO
	AaMV9KO75x/1rXCKF/2LSFFE+9WHL23KOUlwQOd6DxSk7qmctzY8emBpTcXudDNVU5s4Ej6czzy3w
	2l3pt/c4I6ulIGPAsalXvR9U10YUZDk4PO6DHrLvXDY9qRbfGevJxg6nHD6EqsG/6HopLd35AY2Jx
	2dI/eXcgA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPwt4-0000rc-S3; Wed, 07 Oct 2020 00:00:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPwt0-0000qX-9F; Wed, 07 Oct 2020 00:00:51 +0000
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 999DD21481;
 Wed,  7 Oct 2020 00:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602028848;
 bh=rqrXO7Fopl32OITGJTw7mZLPQic9u3QJlABSnhaxNFQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=bdZiafyzYpqXfDr7kAdeZe/afNyxaUuTJQG6Q4lXlMcyP3tBKjUMdVhctxwvtIMIU
 Bb04TBNQ0uMhLkBavjlj6Df+63/EMx0sORvzM1mqWuVzGDGbZCUuddirQi9FWK7DAk
 nJI5ktQoMyjDjKpj+W6kVDYOl4B7FdaHfu3SO1Cc=
Received: by mail-ej1-f47.google.com with SMTP id lw21so377483ejb.6;
 Tue, 06 Oct 2020 17:00:47 -0700 (PDT)
X-Gm-Message-State: AOAM532wZ1kGvzXywSucwKKsvPwz4iGOMxPQ0JKuP/1L2swc5Vy2hWEj
 E2kmCKgNiyoujEbMGZC3KWNlrJp2vBA2uc3o5A==
X-Google-Smtp-Source: ABdhPJw83HrMB8DCHstrzKiMxFwr2/SMLyYc2oSSAq4ciadRwbZbdL51SMMLL6JQdJ42XgiKaqBLMslisKatsvB0Ioo=
X-Received: by 2002:a17:906:c293:: with SMTP id
 r19mr527625ejz.63.1602028846129; 
 Tue, 06 Oct 2020 17:00:46 -0700 (PDT)
MIME-Version: 1.0
References: <20201006193320.405529-1-enric.balletbo@collabora.com>
 <20201006193320.405529-4-enric.balletbo@collabora.com>
 <CAAOTY_-yoptcLCg1YC-wZv+jsOKsKsYFY1xCCwqWVv7M8nNd_w@mail.gmail.com>
In-Reply-To: <CAAOTY_-yoptcLCg1YC-wZv+jsOKsKsYFY1xCCwqWVv7M8nNd_w@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 7 Oct 2020 08:00:35 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-EBCPG9akkPvi=OJhnKQ6bFSnDufvEvgyyw-8yuqMJ5w@mail.gmail.com>
Message-ID: <CAAOTY_-EBCPG9akkPvi=OJhnKQ6bFSnDufvEvgyyw-8yuqMJ5w@mail.gmail.com>
Subject: Re: [PATCH 3/4] soc: mediatek: mmsys: Create struct mtk_mmsys to
 store context data
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_200050_545742_EB069AFD 
X-CRM114-Status: GOOD (  20.80  )
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Q2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+IOaWvCAyMDIw5bm0MTDmnIg3
5pelIOmAseS4iSDkuIrljYg3OjI05a+r6YGT77yaCj4KPiBFbnJpYyBCYWxsZXRibyBpIFNlcnJh
IDxlbnJpYy5iYWxsZXRib0Bjb2xsYWJvcmEuY29tPiDmlrwgMjAyMOW5tDEw5pyIN+aXpSDpgLHk
uIkg5LiK5Y2IMzozM+Wvq+mBk++8mgo+ID4KPiA+IEZyb206IENLIEh1IDxjay5odUBtZWRpYXRl
ay5jb20+Cj4gPgo+ID4gQXBhcnQgZnJvbSB0aGUgZHJpdmVyIGRhdGEsIGluIG9yZGVyIHRvIGV4
dGVuZCB0aGUgZHJpdmVyIHRvIHN1cHBvcnQgbW9yZQo+ID4gYW5kIG1vcmUgU29Dcywgd2Ugd2ls
bCBuZWVkIHRvIHN0b3JlIG90aGVyIGNvbmZpZ3VyYXRpb24gZGF0YS4gU28sIGNyZWF0ZQo+ID4g
YSBtdGtfbW1zeXMgc3RydWN0IHRvIGVuY2Fwc3VsYXRlIGFsbCB0aGF0IGluZm9ybWF0aW9uLgo+
Cj4gUmV2aWV3ZWQtYnk6IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBtZWRpYXRlay5jb20+
CgpTb3JyeSBmb3IgdHlwbzoKClJldmlld2VkLWJ5OiBDaHVuLUt1YW5nIEh1IDxjaHVua3Vhbmcu
aHVAa2VybmVsLm9yZz4KCj4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBDSyBIdSA8Y2suaHVAbWVk
aWF0ZWsuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5y
aWMuYmFsbGV0Ym9AY29sbGFib3JhLmNvbT4KPiA+IC0tLQo+ID4KPiA+ICBkcml2ZXJzL3NvYy9t
ZWRpYXRlay9tdGstbW1zeXMuYyB8IDQ3ICsrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0t
Cj4gPiAgMSBmaWxlIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQo+
ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstbW1zeXMuYyBiL2Ry
aXZlcnMvc29jL21lZGlhdGVrL210ay1tbXN5cy5jCj4gPiBpbmRleCAxOGY5Mzk3OWUxNGEuLmRh
MmRlOGY2OTY5ZSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1tbXN5
cy5jCj4gPiArKysgYi9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstbW1zeXMuYwo+ID4gQEAgLTEw
MSw2ICsxMDEsMTEgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfbW1zeXNfZHJpdmVyX2RhdGEg
bXQ4MTgzX21tc3lzX2RyaXZlcl9kYXRhID0gewo+ID4gICAgICAgICAuY2xrX2RyaXZlciA9ICJj
bGstbXQ4MTgzLW1tIiwKPiA+ICB9Owo+ID4KPiA+ICtzdHJ1Y3QgbXRrX21tc3lzIHsKPiA+ICsg
ICAgICAgdm9pZCBfX2lvbWVtICpyZWdzOwo+ID4gKyAgICAgICBjb25zdCBzdHJ1Y3QgbXRrX21t
c3lzX2RyaXZlcl9kYXRhICpkYXRhOwo+ID4gK307Cj4gPiArCj4gPiAgc3RhdGljIHVuc2lnbmVk
IGludCBtdGtfbW1zeXNfZGRwX21vdXRfZW4oZW51bSBtdGtfZGRwX2NvbXBfaWQgY3VyLAo+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZW51bSBtdGtfZGRwX2Nv
bXBfaWQgbmV4dCwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHVuc2lnbmVkIGludCAqYWRkcikKPiA+IEBAIC0yNTksMjEgKzI2NCwyMSBAQCB2b2lkIG10a19t
bXN5c19kZHBfY29ubmVjdChzdHJ1Y3QgZGV2aWNlICpkZXYsCj4gPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBlbnVtIG10a19kZHBfY29tcF9pZCBjdXIsCj4gPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBlbnVtIG10a19kZHBfY29tcF9pZCBuZXh0KQo+ID4gIHsKPiA+IC0gICAgICAg
dm9pZCBfX2lvbWVtICpjb25maWdfcmVncyA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwo+ID4gKyAg
ICAgICBzdHJ1Y3QgbXRrX21tc3lzICptbXN5cyA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwo+ID4g
ICAgICAgICB1bnNpZ25lZCBpbnQgYWRkciwgdmFsdWUsIHJlZzsKPiA+Cj4gPiAgICAgICAgIHZh
bHVlID0gbXRrX21tc3lzX2RkcF9tb3V0X2VuKGN1ciwgbmV4dCwgJmFkZHIpOwo+ID4gICAgICAg
ICBpZiAodmFsdWUpIHsKPiA+IC0gICAgICAgICAgICAgICByZWcgPSByZWFkbF9yZWxheGVkKGNv
bmZpZ19yZWdzICsgYWRkcikgfCB2YWx1ZTsKPiA+IC0gICAgICAgICAgICAgICB3cml0ZWxfcmVs
YXhlZChyZWcsIGNvbmZpZ19yZWdzICsgYWRkcik7Cj4gPiArICAgICAgICAgICAgICAgcmVnID0g
cmVhZGxfcmVsYXhlZChtbXN5cy0+cmVncyArIGFkZHIpIHwgdmFsdWU7Cj4gPiArICAgICAgICAg
ICAgICAgd3JpdGVsX3JlbGF4ZWQocmVnLCBtbXN5cy0+cmVncyArIGFkZHIpOwo+ID4gICAgICAg
ICB9Cj4gPgo+ID4gLSAgICAgICBtdGtfbW1zeXNfZGRwX3NvdXRfc2VsKGNvbmZpZ19yZWdzLCBj
dXIsIG5leHQpOwo+ID4gKyAgICAgICBtdGtfbW1zeXNfZGRwX3NvdXRfc2VsKG1tc3lzLT5yZWdz
LCBjdXIsIG5leHQpOwo+ID4KPiA+ICAgICAgICAgdmFsdWUgPSBtdGtfbW1zeXNfZGRwX3NlbF9p
bihjdXIsIG5leHQsICZhZGRyKTsKPiA+ICAgICAgICAgaWYgKHZhbHVlKSB7Cj4gPiAtICAgICAg
ICAgICAgICAgcmVnID0gcmVhZGxfcmVsYXhlZChjb25maWdfcmVncyArIGFkZHIpIHwgdmFsdWU7
Cj4gPiAtICAgICAgICAgICAgICAgd3JpdGVsX3JlbGF4ZWQocmVnLCBjb25maWdfcmVncyArIGFk
ZHIpOwo+ID4gKyAgICAgICAgICAgICAgIHJlZyA9IHJlYWRsX3JlbGF4ZWQobW1zeXMtPnJlZ3Mg
KyBhZGRyKSB8IHZhbHVlOwo+ID4gKyAgICAgICAgICAgICAgIHdyaXRlbF9yZWxheGVkKHJlZywg
bW1zeXMtPnJlZ3MgKyBhZGRyKTsKPiA+ICAgICAgICAgfQo+ID4gIH0KPiA+ICBFWFBPUlRfU1lN
Qk9MX0dQTChtdGtfbW1zeXNfZGRwX2Nvbm5lY3QpOwo+ID4gQEAgLTI4Miw0NCArMjg3LDQ2IEBA
IHZvaWQgbXRrX21tc3lzX2RkcF9kaXNjb25uZWN0KHN0cnVjdCBkZXZpY2UgKmRldiwKPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVudW0gbXRrX2RkcF9jb21wX2lkIGN1ciwKPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVudW0gbXRrX2RkcF9jb21wX2lkIG5leHQp
Cj4gPiAgewo+ID4gLSAgICAgICB2b2lkIF9faW9tZW0gKmNvbmZpZ19yZWdzID0gZGV2X2dldF9k
cnZkYXRhKGRldik7Cj4gPiArICAgICAgIHN0cnVjdCBtdGtfbW1zeXMgKm1tc3lzID0gZGV2X2dl
dF9kcnZkYXRhKGRldik7Cj4gPiAgICAgICAgIHVuc2lnbmVkIGludCBhZGRyLCB2YWx1ZSwgcmVn
Owo+ID4KPiA+ICAgICAgICAgdmFsdWUgPSBtdGtfbW1zeXNfZGRwX21vdXRfZW4oY3VyLCBuZXh0
LCAmYWRkcik7Cj4gPiAgICAgICAgIGlmICh2YWx1ZSkgewo+ID4gLSAgICAgICAgICAgICAgIHJl
ZyA9IHJlYWRsX3JlbGF4ZWQoY29uZmlnX3JlZ3MgKyBhZGRyKSAmIH52YWx1ZTsKPiA+IC0gICAg
ICAgICAgICAgICB3cml0ZWxfcmVsYXhlZChyZWcsIGNvbmZpZ19yZWdzICsgYWRkcik7Cj4gPiAr
ICAgICAgICAgICAgICAgcmVnID0gcmVhZGxfcmVsYXhlZChtbXN5cy0+cmVncyArIGFkZHIpICYg
fnZhbHVlOwo+ID4gKyAgICAgICAgICAgICAgIHdyaXRlbF9yZWxheGVkKHJlZywgbW1zeXMtPnJl
Z3MgKyBhZGRyKTsKPiA+ICAgICAgICAgfQo+ID4KPiA+ICAgICAgICAgdmFsdWUgPSBtdGtfbW1z
eXNfZGRwX3NlbF9pbihjdXIsIG5leHQsICZhZGRyKTsKPiA+ICAgICAgICAgaWYgKHZhbHVlKSB7
Cj4gPiAtICAgICAgICAgICAgICAgcmVnID0gcmVhZGxfcmVsYXhlZChjb25maWdfcmVncyArIGFk
ZHIpICYgfnZhbHVlOwo+ID4gLSAgICAgICAgICAgICAgIHdyaXRlbF9yZWxheGVkKHJlZywgY29u
ZmlnX3JlZ3MgKyBhZGRyKTsKPiA+ICsgICAgICAgICAgICAgICByZWcgPSByZWFkbF9yZWxheGVk
KG1tc3lzLT5yZWdzICsgYWRkcikgJiB+dmFsdWU7Cj4gPiArICAgICAgICAgICAgICAgd3JpdGVs
X3JlbGF4ZWQocmVnLCBtbXN5cy0+cmVncyArIGFkZHIpOwo+ID4gICAgICAgICB9Cj4gPiAgfQo+
ID4gIEVYUE9SVF9TWU1CT0xfR1BMKG10a19tbXN5c19kZHBfZGlzY29ubmVjdCk7Cj4gPgo+ID4g
IHN0YXRpYyBpbnQgbXRrX21tc3lzX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
Cj4gPiAgewo+ID4gLSAgICAgICBjb25zdCBzdHJ1Y3QgbXRrX21tc3lzX2RyaXZlcl9kYXRhICpk
YXRhOwo+ID4gICAgICAgICBzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2Owo+ID4gICAg
ICAgICBzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpjbGtzOwo+ID4gICAgICAgICBzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpkcm07Cj4gPiAtICAgICAgIHZvaWQgX19pb21lbSAqY29uZmlnX3JlZ3M7
Cj4gPiArICAgICAgIHN0cnVjdCBtdGtfbW1zeXMgKm1tc3lzOwo+ID4gICAgICAgICBpbnQgcmV0
Owo+ID4KPiA+IC0gICAgICAgY29uZmlnX3JlZ3MgPSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVz
b3VyY2UocGRldiwgMCk7Cj4gPiAtICAgICAgIGlmIChJU19FUlIoY29uZmlnX3JlZ3MpKSB7Cj4g
PiAtICAgICAgICAgICAgICAgcmV0ID0gUFRSX0VSUihjb25maWdfcmVncyk7Cj4gPiArICAgICAg
IG1tc3lzID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKCptbXN5cyksIEdGUF9LRVJORUwpOwo+
ID4gKyAgICAgICBpZiAoIW1tc3lzKQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVN
Owo+ID4gKwo+ID4gKyAgICAgICBtbXN5cy0+cmVncyA9IGRldm1fcGxhdGZvcm1faW9yZW1hcF9y
ZXNvdXJjZShwZGV2LCAwKTsKPiA+ICsgICAgICAgaWYgKElTX0VSUihtbXN5cy0+cmVncykpIHsK
PiA+ICsgICAgICAgICAgICAgICByZXQgPSBQVFJfRVJSKG1tc3lzLT5yZWdzKTsKPiA+ICAgICAg
ICAgICAgICAgICBkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBpb3JlbWFwIG1tc3lzIHJlZ2lzdGVy
czogJWRcbiIsIHJldCk7Cj4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiA+ICAgICAg
ICAgfQo+ID4KPiA+IC0gICAgICAgcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgY29uZmlnX3Jl
Z3MpOwo+ID4gLQo+ID4gLSAgICAgICBkYXRhID0gb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRhKCZw
ZGV2LT5kZXYpOwo+ID4gKyAgICAgICBtbXN5cy0+ZGF0YSA9IG9mX2RldmljZV9nZXRfbWF0Y2hf
ZGF0YSgmcGRldi0+ZGV2KTsKPiA+ICsgICAgICAgcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwg
bW1zeXMpOwo+ID4KPiA+IC0gICAgICAgY2xrcyA9IHBsYXRmb3JtX2RldmljZV9yZWdpc3Rlcl9k
YXRhKCZwZGV2LT5kZXYsIGRhdGEtPmNsa19kcml2ZXIsCj4gPiArICAgICAgIGNsa3MgPSBwbGF0
Zm9ybV9kZXZpY2VfcmVnaXN0ZXJfZGF0YSgmcGRldi0+ZGV2LCBtbXN5cy0+ZGF0YS0+Y2xrX2Ry
aXZlciwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBM
QVRGT1JNX0RFVklEX0FVVE8sIE5VTEwsIDApOwo+ID4gICAgICAgICBpZiAoSVNfRVJSKGNsa3Mp
KQo+ID4gICAgICAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKGNsa3MpOwo+ID4gLS0KPiA+IDIu
MjguMAo+ID4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bWVkaWF0ZWsK
