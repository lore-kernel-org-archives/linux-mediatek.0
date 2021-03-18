Return-Path: <SRS0=MDpP=IQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DF83C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Mar 2021 00:32:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8ABF064F2B
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Mar 2021 00:32:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8ABF064F2B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=z9KoCWIom8hOVLxhDpJD/EP47MKO731XmblqCt2MXJw=; b=XkztewclZdbxCzVidncgUM449
	bj6ooOLJZ2yKSWfaa4WARwqEbD1sNVPY+m9mfM2a/LU8YNeffzcc5SW+WmWiWKaHb2PQYMrsL3RkN
	Si+prd9IduTak+xH8ZyIn7rYVdNibkLbZAjj7VWuptsnbWbirY4up00Wsjta/yGCIpbqDhgU4Fcpy
	RzHOtB9Shut6zPqO3ElOfbFzEbChmspNWsFEkw558hBPdbRWKlI7GVI9rB5ljLZStOde4Mw04l604
	TJpPK9cR2OG9DmOyxyEMBNzKkMQNR6rMwxOQkLXjN89hcgYJvZAw4XbykCKsI/C0cj4KJ7hq4mUoJ
	k+UXdLrQg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMga2-004AQk-B4; Thu, 18 Mar 2021 00:32:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMgZJ-004AIE-TD; Thu, 18 Mar 2021 00:31:22 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A9B8364F41;
 Thu, 18 Mar 2021 00:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616027476;
 bh=kE5pzJREcMtcsKe3XXovC6KJw1unQTOB5zOB90M91cY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mgEdWsITi62mNieWrt3tt4Ns/P9SkqyfMc4vReldRwLoUMBhwCeLpKFrGitrVwO59
 i8j6PIp2pGqzOw5zBDDYh3FCyiHGnYDTzzv7DimOmXrbnxyjT58J57rttyeT+gXRsP
 hhSHuapQuAoYMuAcVFjcxOre4h3RyYrNXlp7nyqvWEmrJg+JzhxnEjufjYuF+IrqwD
 KV3tZDwKhJQqOrVs4NIvcq74tTGCKgKBWMklbZUvKI1x9hTDejZ6eeWdeN7HAW4ZYj
 ZCLrQaO51S3FceqzACjNEjRZ0JxLaAh4HaExjt9IK1Jj+R/12M0fAGa4t+Ok2UMDs3
 /gMmCT9ZWHEpQ==
Received: by mail-ej1-f54.google.com with SMTP id b9so1189296ejc.11;
 Wed, 17 Mar 2021 17:31:15 -0700 (PDT)
X-Gm-Message-State: AOAM531pqEnP/WJ6wZGMzy3+ZcIrsMhAvudO0POIpo2zWVoGcn14VUVB
 BSv30txjJei8hCFHsfjaMWS85FHuQVgeFMmCnw==
X-Google-Smtp-Source: ABdhPJyRt0/BHVBbK/+kJchk+xOcRQnGlNm6MFZSoVqqh6s/25AE46ySni1iQzV9dfexmdF4fKF39m+xGj/DSl/FVys=
X-Received: by 2002:a17:907:3e8a:: with SMTP id
 hs10mr38674530ejc.267.1616027473977; 
 Wed, 17 Mar 2021 17:31:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210201034755.15793-1-jitao.shi@mediatek.com>
In-Reply-To: <20210201034755.15793-1-jitao.shi@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 18 Mar 2021 08:31:02 +0800
X-Gmail-Original-Message-ID: <CAAOTY_--LQxwvnmWws23OkShBiQdxumoULoLTuHeXXMqZ6aW7g@mail.gmail.com>
Message-ID: <CAAOTY_--LQxwvnmWws23OkShBiQdxumoULoLTuHeXXMqZ6aW7g@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: fine tune the data lane trail by project dts
To: Jitao Shi <jitao.shi@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, huijuan.xie@mediatek.com,
 stonea168@163.com, 
 Cawa Cheng <cawa.cheng@mediatek.com>, shuijing.li@mediatek.com, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 yingjoe.chen@mediatek.com, 
 eddie.huang@mediatek.com, Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_003120_866710_5BCA8999 
X-CRM114-Status: GOOD (  22.48  )
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

SGksIEppdGFvOgoKSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMeW5
tDLmnIgx5pelIOmAseS4gCDkuIrljYgxMTo0OOWvq+mBk++8mgo+Cj4gU29tZSBwYW5lbHMgb3Ig
YnJpZGdlcyByZXF1aXJlIGN1c3RvbWl6ZWQgaHNfZGFfdHJhaWwgdGltZS4KPiBTbyBhZGQgYSBw
cm9wZXJ0eSBpbiBkZXZpY2V0cmVlIGZvciB0aGlzIHBhbmVscyBhbmQgYnJpZGdlcy4KPgo+IFNp
Z25lZC1vZmYtYnk6IEppdGFvIFNoaSA8aml0YW8uc2hpQG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAg
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyB8IDEwICsrKysrKysrKy0KPiAgMSBm
aWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RzaS5jCj4gaW5kZXggOGM3MGVjMzliZmUxLi42ZTcwOTJmYTJmZWUgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiBAQCAtMTk0LDYgKzE5NCw3IEBAIHN0
cnVjdCBtdGtfZHNpIHsKPiAgICAgICAgIHN0cnVjdCBjbGsgKmhzX2NsazsKPgo+ICAgICAgICAg
dTMyIGRhdGFfcmF0ZTsKPiArICAgICAgIHUzMiBkYV90cmFpbF9kZWx0YTsKPgo+ICAgICAgICAg
dW5zaWduZWQgbG9uZyBtb2RlX2ZsYWdzOwo+ICAgICAgICAgZW51bSBtaXBpX2RzaV9waXhlbF9m
b3JtYXQgZm9ybWF0Owo+IEBAIC0yMzQsNyArMjM1LDcgQEAgc3RhdGljIHZvaWQgbXRrX2RzaV9w
aHlfdGltY29uZmlnKHN0cnVjdCBtdGtfZHNpICpkc2kpCj4gICAgICAgICB0aW1pbmctPmRhX2hz
X3ByZXBhcmUgPSAoODAgKiBkYXRhX3JhdGVfbWh6ICsgNCAqIDEwMDApIC8gODAwMDsKPiAgICAg
ICAgIHRpbWluZy0+ZGFfaHNfemVybyA9ICgxNzAgKiBkYXRhX3JhdGVfbWh6ICsgMTAgKiAxMDAw
KSAvIDgwMDAgKyAxIC0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRpbWluZy0+ZGFf
aHNfcHJlcGFyZTsKPiAtICAgICAgIHRpbWluZy0+ZGFfaHNfdHJhaWwgPSB0aW1pbmctPmRhX2hz
X3ByZXBhcmUgKyAxOwo+ICsgICAgICAgdGltaW5nLT5kYV9oc190cmFpbCA9IHRpbWluZy0+ZGFf
aHNfcHJlcGFyZSArIDEgKyBkc2ktPmRhX3RyYWlsX2RlbHRhOwo+Cj4gICAgICAgICB0aW1pbmct
PnRhX2dvID0gNCAqIHRpbWluZy0+bHB4IC0gMjsKPiAgICAgICAgIHRpbWluZy0+dGFfc3VyZSA9
IHRpbWluZy0+bHB4ICsgMjsKPiBAQCAtMTA5NCw2ICsxMDk1LDEzIEBAIHN0YXRpYyBpbnQgbXRr
X2RzaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAgICAgICAgICAgICAg
ICBnb3RvIGVycl91bnJlZ2lzdGVyX2hvc3Q7Cj4gICAgICAgICB9Cj4KPiArICAgICAgIHJldCA9
IG9mX3Byb3BlcnR5X3JlYWRfdTMyX2luZGV4KGRldi0+b2Zfbm9kZSwgImRhX3RyYWlsX2RlbHRh
IiwgMCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZkc2ktPmRh
X3RyYWlsX2RlbHRhKTsKClRoaXMgdmFsdWUgZGVwZW5kcyBvbiBwYW5lbCwgc28gSSB0aGluayB3
ZSBzaG91bGQgZ2V0IHNvbWUgdmFsdWUgZnJvbQpwYW5lbCdzIGRldmljZSBub2RlIHRvIGNhbGN1
bGF0ZSB0aGlzIHZhbHVlLgoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4gKyAgICAgICBpZiAocmV0
KSB7Cj4gKyAgICAgICAgICAgICAgIGRldl9pbmZvKGRldiwgIkNhbid0IGdldCBkYV90cmFpbF9k
ZWx0YSwga2VlcCBpdCBhcyAwOiAlZFxuIiwgcmV0KTsKPiArICAgICAgICAgICAgICAgZHNpLT5k
YV90cmFpbF9kZWx0YSA9IDA7Cj4gKyAgICAgICB9Cj4gKwo+ICAgICAgICAgY29tcF9pZCA9IG10
a19kZHBfY29tcF9nZXRfaWQoZGV2LT5vZl9ub2RlLCBNVEtfRFNJKTsKPiAgICAgICAgIGlmIChj
b21wX2lkIDwgMCkgewo+ICAgICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBp
ZGVudGlmeSBieSBhbGlhczogJWRcbiIsIGNvbXBfaWQpOwo+IC0tCj4gMi4xMi41Cj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFp
bGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWls
aW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
