Return-Path: <SRS0=qDs2=CS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76F24C10DAA
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 07:10:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D28AA21919
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 07:10:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rSxBFDVQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HX+OlvYf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D28AA21919
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vjtV8T8DNKPVWaIXhQ55hQPn7sLvvxnKE/yWjQYZJEE=; b=rSxBFDVQR7u+i3dCvMROhHakV
	mkh5ZgtoClgLNKv1UnFPEF5XpbxkbMwzbpzs4Tn5wagX3DqbaAgODK2/eP26xW/bw8qGYWVOl5Z/e
	K3iJzERO3+nFzmymn9ziahCf6BdDsS/tyvlTalosKprq8JqbHPL64a6KkA0K4jBl/59tD+Ug3lAZT
	prJFtkBG2D7VAhnXfc/XwS69BsrZRWd4NSni9dVMWM+Vo5YY5a5IPTwc+lNfVWgX27PuLh6OTlKSD
	pPcRfaXMbLldss9r67vQqlS1nvjkFS6O91EY13rzAOsGLQGi6/7ht44pMWRZvZHh+AoShGpcO0Edc
	KRC0zYwHw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFuEz-0008V8-26; Wed, 09 Sep 2020 07:10:01 +0000
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFuEv-0008Tw-GE; Wed, 09 Sep 2020 07:09:58 +0000
Received: by mail-il1-x142.google.com with SMTP id b17so1369860ilh.4;
 Wed, 09 Sep 2020 00:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=K5nt6NW95MoUAw6MEltboJP4x+aHBBR4bvSni/nMTG8=;
 b=HX+OlvYfFmyRY5KpnVk1/SUaMZH+K1Xnbx4XAYBPTuFmyWdcLqS50beKODjTdFXU38
 ueuKrhflniqebAemuOkyT7bjtG/DbEI26PRkrdAVlMTxbNRBHL3FVNHv6rRbySPWYwM2
 oinTrfj9fbCM547HrtJlFn1ROfb8IdjVvi1E17ndMY9F6Oub5qfD4i3uxav+hRjHKbmn
 otQy3DKscJbCeBBmuAZ951ikCqkzbXQCMWcCjUNIqDQEzJuPP8axmWCPpa6CALAZPRrd
 SncUjs/kvzfLyisAKFoz1NhI/4LYSp1QG4p7E+nthO8NTQeq73mjmjB7o8fGjOtymCxv
 GTXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=K5nt6NW95MoUAw6MEltboJP4x+aHBBR4bvSni/nMTG8=;
 b=etJBc0/4y6wCXbQixYp4iXq1jMCQV1zCxC6htGoAgr+sA4F4b0XZGvVck31ad/6QGK
 3wRmH3XnIYynWQBky+pnxNDg0gL1GQIArU81N8ATmccWiSNLY+3lAOudh+zBsLlD2EQa
 j/+O2zTpKOfdxiODkcji1Aru5QNiMVz5fGCRZ+i3beJxeuNJVRAl1ZNYj7xpMEyes/8Z
 dfzrcfqa7inM9qkze4reGqjE+rncLQh0hRlN3UUUx6iJ914XmxD3iyiBh3nJP9I0tIiz
 5q2qBulJPB4r/AGkGq1+BCqNcN5odXSF/qneMkOPwx2EAzgOK5qfqIRvpycsfBWg0nc8
 LJXg==
X-Gm-Message-State: AOAM530JEfKB37UX/yfvSHhbzxPexMGnaSoFApLvM1jF2A2opj4rDl4Y
 MH9Fe2hD5bmTf0hW5ar4WkatiQCb1dQ+Nr/cTsE=
X-Google-Smtp-Source: ABdhPJwIA2ommqfDJurjDZrxOv9h0V7R0Dq40OXozD6jcy0NEPGLU4HA7zRSMsxBa1m/L5xOhP6cWc1IIKoPAjG7CgQ=
X-Received: by 2002:a92:d188:: with SMTP id z8mr2525174ilz.292.1599635395503; 
 Wed, 09 Sep 2020 00:09:55 -0700 (PDT)
MIME-Version: 1.0
References: <1597661277-27862-1-git-send-email-gene.chen.richtek@gmail.com>
 <1597661277-27862-10-git-send-email-gene.chen.richtek@gmail.com>
 <20200828104053.GM1826686@dell>
 <CAE+NS37uFoDhWyGkw0WTu+tR+_85EwzYRqecNMG6nK6b2J=9jg@mail.gmail.com>
 <20200908114819.GO4400@dell>
In-Reply-To: <20200908114819.GO4400@dell>
From: Gene Chen <gene.chen.richtek@gmail.com>
Date: Wed, 9 Sep 2020 07:09:44 +0800
Message-ID: <CAE+NS36MVA=9e0Ev73gpJ-gOcY+_aNveTr+DhquD6iqY-GKXCQ@mail.gmail.com>
Subject: Re: [PATCH v4 9/9] mfd: mt6360: Merge different sub-devices I2C
 read/write
To: Lee Jones <lee.jones@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_030957_571118_1156F06B 
X-CRM114-Status: GOOD (  35.00  )
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
Cc: Gene Chen <gene_chen@richtek.com>, linux-kernel@vger.kernel.org,
 cy_huang@richtek.com, benjamin.chao@mediatek.com,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

TGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4g5pa8IDIwMjDlubQ55pyIOOaXpSDpgLHk
uowg5LiL5Y2INzo0OOWvq+mBk++8mgo+Cj4gT24gVHVlLCAwMSBTZXAgMjAyMCwgR2VuZSBDaGVu
IHdyb3RlOgo+Cj4gPiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPiDmlrwgMjAyMOW5
tDjmnIgyOOaXpSDpgLHkupQg5LiL5Y2INjo0MOWvq+mBk++8mgo+ID4gPgo+ID4gPiBPbiBNb24s
IDE3IEF1ZyAyMDIwLCBHZW5lIENoZW4gd3JvdGU6Cj4gPiA+Cj4gPiA+ID4gRnJvbTogR2VuZSBD
aGVuIDxnZW5lX2NoZW5AcmljaHRlay5jb20+Cj4gPiA+ID4KPiA+ID4gPiBSZW1vdmUgdW51c2Ug
cmVnaXN0ZXIgZGVmaW5pdGlvbi4KPiA+ID4KPiA+ID4gVGhpcyBzaG91bGQgYmUgaW4gYSBzZXBh
cmF0ZSBwYXRjaC4KPiA+ID4KPiA+ID4gPiBNZXJnZSBkaWZmZXJlbnQgc3ViLWRldmljZXMgSTJD
IHJlYWQvd3JpdGUgZnVuY3Rpb25zIGludG8gb25lIFJlZ21hcCwKPiA+ID4gPiBiZWNhdXNlIFBN
SUMgYW5kIExETyBwYXJ0IG5lZWQgQ1JDIGJpdHMgZm9yIGFjY2VzcyBwcm90ZWN0aW9uLgo+ID4g
PiA+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogR2VuZSBDaGVuIDxnZW5lX2NoZW5AcmljaHRlay5j
b20+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gIGRyaXZlcnMvbWZkL0tjb25maWcgICAgICAgIHwgICAx
ICsKPiA+ID4gPiAgZHJpdmVycy9tZmQvbXQ2MzYwLWNvcmUuYyAgfCAyNjAgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tCj4gPiA+ID4gIGluY2x1ZGUvbGludXgv
bWZkL210NjM2MC5oIHwgMjQwIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCj4gPiA+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMjI2IGluc2VydGlvbnMoKyksIDI3NSBkZWxl
dGlvbnMoLSkKPiA+ID4gPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgvbWZkL210
NjM2MC5oCj4gPiA+ID4KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZmQvS2NvbmZpZyBi
L2RyaXZlcnMvbWZkL0tjb25maWcKPiA+ID4gPiBpbmRleCBhMzdkN2QxLi4wNjg0ZGRjIDEwMDY0
NAo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvbWZkL0tjb25maWcKPiA+ID4gPiArKysgYi9kcml2ZXJz
L21mZC9LY29uZmlnCj4gPiA+ID4gQEAgLTkxMyw2ICs5MTMsNyBAQCBjb25maWcgTUZEX01UNjM2
MAo+ID4gPiA+ICAgICAgIHNlbGVjdCBNRkRfQ09SRQo+ID4gPiA+ICAgICAgIHNlbGVjdCBSRUdN
QVBfSTJDCj4gPiA+ID4gICAgICAgc2VsZWN0IFJFR01BUF9JUlEKPiA+ID4gPiArICAgICBzZWxl
Y3QgQ1JDOAo+ID4gPiA+ICAgICAgIGRlcGVuZHMgb24gSTJDCj4gPiA+ID4gICAgICAgaGVscAo+
ID4gPiA+ICAgICAgICAgU2F5IFkgaGVyZSB0byBlbmFibGUgTVQ2MzYwIFBNVS9QTUlDL0xETyBm
dW5jdGlvbmFsIHN1cHBvcnQuCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWZkL210NjM2
MC1jb3JlLmMgYi9kcml2ZXJzL21mZC9tdDYzNjAtY29yZS5jCj4gPiA+ID4gaW5kZXggNjc3Yzk3
NC4uZTk5NTIyMCAxMDA2NDQKPiA+ID4gPiAtLS0gYS9kcml2ZXJzL21mZC9tdDYzNjAtY29yZS5j
Cj4gPiA+ID4gKysrIGIvZHJpdmVycy9tZmQvbXQ2MzYwLWNvcmUuYwo+ID4gPiA+IEBAIC0xNCw3
ICsxNCw1MyBAQAo+ID4gPiA+ICAjaW5jbHVkZSA8bGludXgvcmVnbWFwLmg+Cj4gPiA+ID4gICNp
bmNsdWRlIDxsaW51eC9zbGFiLmg+Cj4gPiA+ID4KPiA+ID4gPiAtI2luY2x1ZGUgPGxpbnV4L21m
ZC9tdDYzNjAuaD4KPiA+ID4gPiArZW51bSB7Cj4gPiA+ID4gKyAgICAgTVQ2MzYwX1NMQVZFX1RD
UEMgPSAwLAo+ID4gPiA+ICsgICAgIE1UNjM2MF9TTEFWRV9QTUlDLAo+ID4gPiA+ICsgICAgIE1U
NjM2MF9TTEFWRV9MRE8sCj4gPiA+ID4gKyAgICAgTVQ2MzYwX1NMQVZFX1BNVSwKPiA+ID4gPiAr
ICAgICBNVDYzNjBfU0xBVkVfTUFYLAo+ID4gPiA+ICt9Owo+ID4gPiA+ICsKPiA+ID4gPiArc3Ry
dWN0IG10NjM2MF9kZGF0YSB7Cj4gPiA+ID4gKyAgICAgc3RydWN0IGkyY19jbGllbnQgKmkyY1tN
VDYzNjBfU0xBVkVfTUFYXTsKPiA+ID4gPiArICAgICBzdHJ1Y3QgZGV2aWNlICpkZXY7Cj4gPiA+
ID4gKyAgICAgc3RydWN0IHJlZ21hcCAqcmVnbWFwOwo+ID4gPiA+ICsgICAgIHN0cnVjdCByZWdt
YXBfaXJxX2NoaXBfZGF0YSAqaXJxX2RhdGE7Cj4gPiA+ID4gKyAgICAgdW5zaWduZWQgaW50IGNo
aXBfcmV2Owo+ID4gPiA+ICsgICAgIHU4IGNyYzhfdGJsW0NSQzhfVEFCTEVfU0laRV07Cj4gPiA+
ID4gK307Cj4gPiA+Cj4gPiA+IFRoaXMgaXMgbm90IGEgbmV3IHN0cnVjdHVyZSwgcmlnaHQ/ICBX
aGVyZSB3YXMgdGhpcyBiZWZvcmU/ICBTdXJlbHkgaXQKPiA+ID4gc2hvdWxkIGJlIHJlbW92ZWQg
ZnJvbSB3aGVyZXZlciBpdCB3YXMgaW4gdGhlIHNhbWUgcGF0Y2ggdGhhdCBwbGFjZXMKPiA+ID4g
aXQgaGVyZT8KPiA+ID4KPiA+Cj4gPiBObywgaXQgaXMgbWVyZ2UgZnJvbSBoZWFkZXIgZmlsZSB0
byBzb3VyY2UgY29kZSBmb3IgdW51c2UgaW4gb3RoZXIgc3ViLW1vZHVsZS4KPgo+IFNvIHdoZXJl
IGRpZCBpdCBjb21lIGZyb20gYW5kIHdoeSBkb24ndCBJIHNlZSB0aGUgcmVtb3ZhbCBpbiB0aGlz
Cj4gcGF0Y2g/Cj4KCkNoYW5nZSBpcyBpbiB0aGUgYm90dG9tIG9mIHRoaXMgcGF0Y2guClRoZXJl
IGlzIGEgbGl0dGxlIGNvbmZ1c2UgcGFydCBpbiAiW1BBVENIIHY0IDUvOV0gbWZkOiBtdDYzNjA6
IFJlbmFtZQptdDYzNjBfcG11X2RhdGEgYnkgbXQ2MzYwX2RkYXRhIgpUaGUgIlBBVENIIDUvOSIg
Y2hhbmdlIG10NjM2MF9wbXVfZGF0YSB0byBtdDYzNjBfZGRhdGEgaW5zdGVhZCBvZiBtdDYzNjBf
ZGF0YS4KSSB3aWxsIHVwZGF0ZSBQQVRDSCB2NSB0byBmaXggaXQuCgpbUEFUQ0ggdjQgOS85XQpk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tZmQvbXQ2MzYwLmggYi9pbmNsdWRlL2xpbnV4L21m
ZC9tdDYzNjAuaAotc3RydWN0IG10NjM2MF9kYXRhIHsKLSAgICAgICBzdHJ1Y3QgaTJjX2NsaWVu
dCAqaTJjW01UNjM2MF9TTEFWRV9NQVhdOwotICAgICAgIHN0cnVjdCBkZXZpY2UgKmRldjsKLSAg
ICAgICBzdHJ1Y3QgcmVnbWFwICpyZWdtYXA7Ci0gICAgICAgc3RydWN0IHJlZ21hcF9pcnFfY2hp
cF9kYXRhICppcnFfZGF0YTsKLSAgICAgICB1bnNpZ25lZCBpbnQgY2hpcF9yZXY7Ci19OwoKW1BB
VENIIHY0IDUvOV0KZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbWZkL210NjM2MC5oIGIvaW5j
bHVkZS9saW51eC9tZmQvbXQ2MzYwLmgKLXN0cnVjdCBtdDYzNjBfcG11X2RhdGEgeworc3RydWN0
IG10NjM2MF9kYXRhIHsKICAgICAgICBzdHJ1Y3QgaTJjX2NsaWVudCAqaTJjW01UNjM2MF9TTEFW
RV9NQVhdOwogICAgICAgIHN0cnVjdCBkZXZpY2UgKmRldjsKICAgICAgICBzdHJ1Y3QgcmVnbWFw
ICpyZWdtYXA7CgoKPiBbLi4uXQo+Cj4gPiA+ID4gLXN0YXRpYyBjb25zdCB1bnNpZ25lZCBzaG9y
dCBtdDYzNjBfc2xhdmVfYWRkcltNVDYzNjBfU0xBVkVfTUFYXSA9IHsKPiA+ID4gPiAtICAgICBN
VDYzNjBfUE1VX1NMQVZFSUQsCj4gPiA+ID4gK3N0YXRpYyBjb25zdCB1MTYgbXQ2MzYwX3NsYXZl
X2FkZHJzW01UNjM2MF9TTEFWRV9NQVhdID0gewo+ID4gPgo+ID4gPiBXaHkgYXJlIHlvdSBjaGFu
Z2luZyB0aGUgZGF0YSB0eXBlPwo+ID4gPgo+ID4KPiA+IEVhc3kgdG8gcmVhZC4KPiA+IEkgdGhp
bmsgaXQncyB0aGUgc2FtZT8KPgo+IEl0J3MgYW4gdW5yZWxhdGVkIGNoYW5nZSBhbmQgc2hvdWxk
IG5vdCBiZSBpbiB0aGlzIHBhdGNoLgo+Cj4gUGxlYXNlIHNlcGFyYXRlIHBhdGNoZXMgaW50byBm
dW5jdGlvbmFsIGNoYW5nZXMuCj4KCkFDSy4gSXQncyBub3QgdmVyeSBpbXBvcnRhbnQgY2hhbmdl
LiBJIHdpbGwgcmV2ZXJ0IGl0LgoKPiA+ID4gPiArICAgICBNVDYzNjBfVENQQ19TTEFWRUlELAo+
ID4gPiA+ICAgICAgIE1UNjM2MF9QTUlDX1NMQVZFSUQsCj4gPiA+ID4gICAgICAgTVQ2MzYwX0xE
T19TTEFWRUlELAo+ID4gPiA+IC0gICAgIE1UNjM2MF9UQ1BDX1NMQVZFSUQsCj4gPiA+ID4gKyAg
ICAgTVQ2MzYwX1BNVV9TTEFWRUlELAo+ID4gPiA+ICt9Owo+Cj4gWy4uLl0KPgo+ID4gPiA+ICBz
dGF0aWMgaW50IG10NjM2MF9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQo+ID4gPiA+
IEBAIC0zMjksOSArNTIxLDIzIEBAIHN0YXRpYyBpbnQgbXQ2MzYwX3Byb2JlKHN0cnVjdCBpMmNf
Y2xpZW50ICpjbGllbnQpCj4gPiA+ID4gICAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsKPiA+
ID4gPgo+ID4gPiA+ICAgICAgIGRkYXRhLT5kZXYgPSAmY2xpZW50LT5kZXY7Cj4gPiA+ID4gLSAg
ICAgaTJjX3NldF9jbGllbnRkYXRhKGNsaWVudCwgZGRhdGEpOwo+ID4gPiA+Cj4gPiA+ID4gLSAg
ICAgZGRhdGEtPnJlZ21hcCA9IGRldm1fcmVnbWFwX2luaXRfaTJjKGNsaWVudCwgJm10NjM2MF9w
bXVfcmVnbWFwX2NvbmZpZyk7Cj4gPiA+ID4gKyAgICAgZm9yIChpID0gMDsgaSA8IE1UNjM2MF9T
TEFWRV9NQVggLSAxOyBpKyspIHsKPiA+ID4gPiArICAgICAgICAgICAgIGRkYXRhLT5pMmNbaV0g
PSBkZXZtX2kyY19uZXdfZHVtbXlfZGV2aWNlKCZjbGllbnQtPmRldiwKPiA+ID4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNsaWVudC0+
YWRhcHRlciwKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIG10NjM2MF9zbGF2ZV9hZGRyc1tpXSk7Cj4gPiA+ID4gKyAgICAgICAg
ICAgICBpZiAoSVNfRVJSKGRkYXRhLT5pMmNbaV0pKSB7Cj4gPiA+ID4gKyAgICAgICAgICAgICAg
ICAgICAgIGRldl9lcnIoJmNsaWVudC0+ZGV2LAo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICJGYWlsZWQgdG8gZ2V0IG5ldyBkdW1teSBJMkMgZGV2aWNlIGZvciBhZGRyZXNz
IDB4JXgiLAo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG10NjM2MF9zbGF2
ZV9hZGRyc1tpXSk7Cj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIHJldHVybiBQVFJfRVJS
KGRkYXRhLT5pMmNbaV0pOwo+ID4gPgo+ID4gPiBEbyB5b3UgaGF2ZSB0byBmcmVlIHRoZSBuZXcg
ZGV2aWNlcyB5b3UganVzdCBhbGxvY2F0ZWQ/Cj4gPiA+Cj4gPgo+ID4gVXN1YWxseSBubyBuZWVk
IHRvIGZyZWUgZGV2bV9pMmNfbmV3X2R1bW15X2RldmljZSwKPiA+IFNob3VsZCBJIHVzZSBrZnJl
ZShkZGF0YS0+aTJjW2ldKTs/Cj4KPiBZb3UgdGVsbCBtZS4KPgoKSSBzdXJ2ZXkgdGhlIHVwc3Ry
ZWFtIGNvZGUgZS5xLiBkcml2ZXJzL21mZC90cHM4MDAzMS5jCkl0JyBzaG91bGQgbm90IGhhdmUg
dG8gZnJlZSB0aGUgbWVtb3J5LgoKPiAtLQo+IExlZSBKb25lcyBb5p2O55C85pavXQo+IFNlbmlv
ciBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwo+IExpbmFyby5vcmcg4pSCIE9w
ZW4gc291cmNlIHNvZnR3YXJlIGZvciBBcm0gU29Dcwo+IEZvbGxvdyBMaW5hcm86IEZhY2Vib29r
IHwgVHdpdHRlciB8IEJsb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbWVkaWF0ZWsK
