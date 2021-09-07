Return-Path: <SRS0=gwp9=N5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93AE4C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Sep 2021 16:30:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55138610FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Sep 2021 16:30:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 55138610FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jr5FUF0nGIXdYpHguwSFbCxQEQQgzkwqKcc93xF/mHI=; b=NpTKY3AxRufX26
	BVmMRhoenzrhZK+u9Qdy4r3s1ZmGrfgz2IgnjdFCwBU+9XawSp52mXQWTNiEEv/AcGc/wFV3ng3HN
	ITygpO1zJjcaYBM+FiLqtdUQIKU6O+zoEXIRZSNrkpMRHKlBjPLx50DbDVsrUrcOKWq9e2jphmoS9
	Z6srB63oUzb/hdWwxe+wu4yR+j54XweV7/rZ3+j1OZ2snZqbiLLF/P1kcZomm5vvlBRYX37vhzSnI
	L6YTcBXS28Z4BV6flyEniT1B0bxQqILZtNnU3XaVXNm4U6IibFgd1ivVBcKs+CKZ5bP4Gtb7mCLHl
	0jasY3Akx6xArLNjrPSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNdzJ-004CBg-CV; Tue, 07 Sep 2021 16:30:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNdz6-004CAK-Qz; Tue, 07 Sep 2021 16:30:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 786776112E;
 Tue,  7 Sep 2021 16:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631032208;
 bh=/i//j1fOwb+XWtxuMbanMqqYVLUzNfmK+qoMX+CZRPA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mkZu7pmXbunqidV6Z4TfVTgG0f4GSI5hVnMQOaf9tX6yhq4GqTta9ha6MZUZRx+tI
 HPMDGM5KOeI03HKlMwXRCJdZOtGzGtrWe58CYs5V6TtP5i+i21nmPnAR6Gfe/BzqiQ
 /aB4b9JyWuM5XjJ+Qa4AnukeCL6S/6Rzsslye/t6iSlTifwkna0bOgVDnpHrOq2fNP
 grNJ/VVOKspovDWPFV+janTR2jIRhWqCSLSBhTWCwtjTUX25yyEtVbi+PC3XOZaI3V
 /lElVXr4ZxuQjwE3xuH3ta9bNs5FFpPVRBieujtlxvbs8CVlC3I/yZnAl2ApWGS3Qs
 TEJ/T0PlQjiew==
Received: by mail-ej1-f51.google.com with SMTP id n27so20838487eja.5;
 Tue, 07 Sep 2021 09:30:08 -0700 (PDT)
X-Gm-Message-State: AOAM530sP4k0fsI3+mqSGg+4/u4NROKx58xVkf4gaZu6pDHIOXRNwp3X
 vkmahIQUAlsHfXxpUO++psHwh1r7+PiniErxSg==
X-Google-Smtp-Source: ABdhPJzLkwddxnUcVX7bVwwUpGSHGMnvVQjKfrWTpYvJ7hWPLwru5ku9P/Cjopdi8PWOnTY9S83DeW/a1j3JAydcmCc=
X-Received: by 2002:a17:906:158f:: with SMTP id
 k15mr19791012ejd.241.1631032206943; 
 Tue, 07 Sep 2021 09:30:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210906071539.12953-1-nancy.lin@mediatek.com>
 <20210906071539.12953-9-nancy.lin@mediatek.com>
In-Reply-To: <20210906071539.12953-9-nancy.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 8 Sep 2021 00:29:55 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8aQkx55C=mqK-4bULpG_biHkq4brBF2SDdtbpnhP3Rvw@mail.gmail.com>
Message-ID: <CAAOTY_8aQkx55C=mqK-4bULpG_biHkq4brBF2SDdtbpnhP3Rvw@mail.gmail.com>
Subject: Re: [PATCH v5 08/16] soc: mediatek: add cmdq support of mtk-mmsys
 config API for mt8195 vdosys1
To: "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, 
 Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, singo.chang@mediatek.com, 
 srv_heupstream <srv_heupstream@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210907_093008_954111_3D2ED8F5 
X-CRM114-Status: GOOD (  24.50  )
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

SGksIE5hbmN5OgoKTmFuY3kuTGluIDxuYW5jeS5saW5AbWVkaWF0ZWsuY29tPiDmlrwgMjAyMeW5
tDnmnIg25pelIOmAseS4gCDkuIvljYgzOjE15a+r6YGT77yaCj4KPiBBZGQgY21kcSBzdXBwb3J0
IGZvciBtdGstbW1zeXMgY29uZmlnIEFQSS4KPiBUaGUgbW1zeXMgY29uZmlnIHJlZ2lzdGVyIHNl
dHRpbmdzIG5lZWQgdG8gdGFrZSBlZmZlY3Qgd2l0aCB0aGUgb3RoZXIKPiBIVyBzZXR0aW5ncyhs
aWtlIE9WTF9BREFQVE9SLi4uKSBhdCB0aGUgc2FtZSB2YmxhbmtpbmcgdGltZS4KPgo+IElmIHdl
IHVzZSBDUFUgdG8gd3JpdGUgdGhlIG1tc3lzIHJlZywgd2UgY2FuJ3QgZ3VhcmFudGVlIGFsbCB0
aGUKPiBzZXR0aW5ncyBjYW4gYmUgd3JpdHRlbiBpbiB0aGUgc2FtZSB2YmxhbmtpbmcgdGltZS4K
PiBDbWRxIGlzIHVzZWQgZm9yIHRoaXMgcHVycG9zZS4gV2UgcHJlcGFyZSBhbGwgdGhlIHJlbGF0
ZWQgSFcgc2V0dGluZ3MKPiBpbiBvbmUgY21kcSBwYWNrZXQuIFRoZSBmaXJzdCBjb21tYW5kIGlu
IHRoZSBwYWNrZXQgaXMgIndhaXQgc3RyZWFtIGRvbmUiLAo+IGFuZCB0aGVuIGZvbGxvd2luZyB3
aXRoIGFsbCB0aGUgSFcgc2V0dGluZ3MuIEFmdGVyIHRoZSBjbWRxIHBhY2tldCBpcwo+IGZsdXNo
IHRvIEdDRSBIVy4gVGhlIEdDRSB3YWl0cyBmb3IgdGhlICJzdHJlYW0gZG9uZSBldmVudCIgdG8g
Y29taW5nCj4gYW5kIHRoZW4gc3RhcnRzIGZsdXNoaW5nIGFsbCB0aGUgSFcgc2V0dGluZ3MuIFRo
aXMgY2FuIGd1YXJhbnRlZSBhbGwKPiB0aGUgc2V0dGluZ3MgZmx1c2ggaW4gdGhlIHNhbWUgdmJs
YW5raW5nLgo+Cj4gU2lnbmVkLW9mZi1ieTogTmFuY3kuTGluIDxuYW5jeS5saW5AbWVkaWF0ZWsu
Y29tPgo+IC0tLQo+ICBkcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstbW1zeXMuYyAgICAgICB8IDI4
ICsrKysrKysrKysrKysrKysrKysrKy0tLS0tCj4gIGluY2x1ZGUvbGludXgvc29jL21lZGlhdGVr
L210ay1tbXN5cy5oIHwgIDYgKysrKystCj4gIDIgZmlsZXMgY2hhbmdlZCwgMjggaW5zZXJ0aW9u
cygrKSwgNiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NvYy9tZWRpYXRl
ay9tdGstbW1zeXMuYyBiL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1tbXN5cy5jCj4gaW5kZXgg
M2EzOGI4MjY5YzcxLi4wNjAwNjU1MDFiOGEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9zb2MvbWVk
aWF0ZWsvbXRrLW1tc3lzLmMKPiArKysgYi9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstbW1zeXMu
Ywo+IEBAIC04MSw2ICs4MSw3IEBAIHN0cnVjdCBtdGtfbW1zeXMgewo+ICAgICAgICAgY29uc3Qg
c3RydWN0IG10a19tbXN5c19kcml2ZXJfZGF0YSAqZGF0YTsKPiAgICAgICAgIHNwaW5sb2NrX3Qg
bG9jazsgLyogcHJvdGVjdHMgbW1zeXNfc3dfcnN0X2IgcmVnICovCj4gICAgICAgICBzdHJ1Y3Qg
cmVzZXRfY29udHJvbGxlcl9kZXYgcmNkZXY7Cj4gKyAgICAgICBzdHJ1Y3QgY21kcV9jbGllbnRf
cmVnIGNtZHFfYmFzZTsKPiAgfTsKPgo+ICB2b2lkIG10a19tbXN5c19kZHBfY29ubmVjdChzdHJ1
Y3QgZGV2aWNlICpkZXYsCj4gQEAgLTE3NCw3ICsxNzUsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IHJlc2V0X2NvbnRyb2xfb3BzIG10a19tbXN5c19yZXNldF9vcHMgPSB7Cj4gIH07Cj4KPiAgdm9p
ZCBtdGtfbW1zeXNfZGRwX2NvbmZpZyhzdHJ1Y3QgZGV2aWNlICpkZXYsIGVudW0gbXRrX21tc3lz
X2NvbmZpZ190eXBlIGNvbmZpZywKPiAtICAgICAgICAgICAgICAgICAgICAgICAgIHUzMiBpZCwg
dTMyIHZhbCkKPiArICAgICAgICAgICAgICAgICAgICAgICAgIHUzMiBpZCwgdTMyIHZhbCwgc3Ry
dWN0IGNtZHFfcGt0ICpjbWRxX3BrdCkKPiAgewo+ICAgICAgICAgc3RydWN0IG10a19tbXN5cyAq
bW1zeXMgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKPiAgICAgICAgIGNvbnN0IHN0cnVjdCBtdGtf
bW1zeXNfY29uZmlnICptbXN5c19jb25maWcgPSBtbXN5cy0+ZGF0YS0+Y29uZmlnOwo+IEBAIC0x
OTcsMTAgKzE5OCwyMCBAQCB2b2lkIG10a19tbXN5c19kZHBfY29uZmlnKHN0cnVjdCBkZXZpY2Ug
KmRldiwgZW51bSBtdGtfbW1zeXNfY29uZmlnX3R5cGUgY29uZmlnLAo+ICAgICAgICAgbWFzayA9
IG1tc3lzX2NvbmZpZ1tpXS5tYXNrOwo+ICAgICAgICAgcmVnX3ZhbCA9IHZhbCA8PCBtbXN5c19j
b25maWdbaV0uc2hpZnQ7Cj4KPiAtICAgICAgIHUzMiB0bXAgPSByZWFkbChtbXN5cy0+cmVncyAr
IG9mZnNldCk7Cj4gLQo+IC0gICAgICAgdG1wID0gKHRtcCAmIH5tYXNrKSB8IHJlZ192YWw7Cj4g
LSAgICAgICB3cml0ZWwodG1wLCBtbXN5cy0+cmVncyArIG9mZnNldCk7Cj4gKyNpZiBJU19SRUFD
SEFCTEUoQ09ORklHX01US19DTURRKQo+ICsgICAgICAgaWYgKGNtZHFfcGt0ICYmIG1tc3lzLT5j
bWRxX2Jhc2Uuc2l6ZSkgewo+ICsgICAgICAgICAgICAgICBjbWRxX3BrdF93cml0ZV9tYXNrKGNt
ZHFfcGt0LCBtbXN5cy0+Y21kcV9iYXNlLnN1YnN5cywKPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBtbXN5cy0+Y21kcV9iYXNlLm9mZnNldCArIG9mZnNldCwgcmVnX3ZhbCwK
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtYXNrKTsKPiArICAgICAgIH0g
ZWxzZSB7Cj4gKyNlbmRpZgo+ICsgICAgICAgICAgICAgICB1MzIgdG1wID0gcmVhZGwobW1zeXMt
PnJlZ3MgKyBvZmZzZXQpOwo+ICsKPiArICAgICAgICAgICAgICAgdG1wID0gKHRtcCAmIH5tYXNr
KSB8IHJlZ192YWw7Cj4gKyAgICAgICAgICAgICAgIHdyaXRlbCh0bXAsIG1tc3lzLT5yZWdzICsg
b2Zmc2V0KTsKPiArI2lmIElTX1JFQUNIQUJMRShDT05GSUdfTVRLX0NNRFEpCj4gKyAgICAgICB9
Cj4gKyNlbmRpZgo+ICB9Cj4gIEVYUE9SVF9TWU1CT0xfR1BMKG10a19tbXN5c19kZHBfY29uZmln
KTsKPgo+IEBAIC0yMzYsNiArMjQ3LDEzIEBAIHN0YXRpYyBpbnQgbXRrX21tc3lzX3Byb2JlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gICAgICAgICB9Cj4KPiAgICAgICAgIG1tc3lz
LT5kYXRhID0gb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRhKCZwZGV2LT5kZXYpOwo+ICsKPiArI2lm
IElTX1JFQUNIQUJMRShDT05GSUdfTVRLX0NNRFEpCj4gKyAgICAgICByZXQgPSBjbWRxX2Rldl9n
ZXRfY2xpZW50X3JlZyhkZXYsICZtbXN5cy0+Y21kcV9iYXNlLCAwKTsKCkRlZmluZSBtZWRpYXRl
ayxnY2UtY2xpZW50LXJlZyBpbiBiaW5kaW5nIGRvY3VtZW50IGZpcnN0LgoKUmVnYXJkcywKQ2h1
bi1LdWFuZy4KCj4gKyAgICAgICBpZiAocmV0KQo+ICsgICAgICAgICAgICAgICBkZXZfZGJnKGRl
diwgIk5vIG1lZGlhdGVrLGdjZS1jbGllbnQtcmVnIVxuIik7Cj4gKyNlbmRpZgo+ICsKPiAgICAg
ICAgIHBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIG1tc3lzKTsKPgo+ICAgICAgICAgY2xrcyA9
IHBsYXRmb3JtX2RldmljZV9yZWdpc3Rlcl9kYXRhKCZwZGV2LT5kZXYsIG1tc3lzLT5kYXRhLT5j
bGtfZHJpdmVyLAo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGst
bW1zeXMuaCBiL2luY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210ay1tbXN5cy5oCj4gaW5kZXgg
ZWYyYTZkOWE4MzRiLi45NzA1ZDI0Mjg0OWEgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9z
b2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRl
ay9tdGstbW1zeXMuaAo+IEBAIC02LDYgKzYsMTAgQEAKPiAgI2lmbmRlZiBfX01US19NTVNZU19I
Cj4gICNkZWZpbmUgX19NVEtfTU1TWVNfSAo+Cj4gKyNpbmNsdWRlIDxsaW51eC9tYWlsYm94X2Nv
bnRyb2xsZXIuaD4KPiArI2luY2x1ZGUgPGxpbnV4L21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5o
Pgo+ICsjaW5jbHVkZSA8bGludXgvc29jL21lZGlhdGVrL210ay1jbWRxLmg+Cj4gKwo+ICBlbnVt
IG10a19kZHBfY29tcF9pZDsKPiAgc3RydWN0IGRldmljZTsKPgo+IEBAIC03NSw2ICs3OSw2IEBA
IHZvaWQgbXRrX21tc3lzX2RkcF9kaXNjb25uZWN0KHN0cnVjdCBkZXZpY2UgKmRldiwKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBlbnVtIG10a19kZHBfY29tcF9pZCBuZXh0KTsKPgo+
ICB2b2lkIG10a19tbXN5c19kZHBfY29uZmlnKHN0cnVjdCBkZXZpY2UgKmRldiwgZW51bSBtdGtf
bW1zeXNfY29uZmlnX3R5cGUgY29uZmlnLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgdTMy
IGlkLCB1MzIgdmFsKTsKPiArICAgICAgICAgICAgICAgICAgICAgICAgIHUzMiBpZCwgdTMyIHZh
bCwgc3RydWN0IGNtZHFfcGt0ICpjbWRxX3BrdCk7Cj4KPiAgI2VuZGlmIC8qIF9fTVRLX01NU1lT
X0ggKi8KPiAtLQo+IDIuMTguMAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
