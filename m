Return-Path: <SRS0=1w4W=BI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5B7DC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 22:47:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 721382065C
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 22:47:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T2IwI1Iz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="bTjVUwRN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 721382065C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ELnFHOcZUcOUAYOl7UseCCGYckf81xPoHOrOK01ApgI=; b=T2IwI1IzSn37Qbv6dynenXJ+3
	ltlNyt6obS2HLi+jgw66s7qPaKxBoRfJa4BPbz0a2m90msvGgZSoaMPoqjr/kUp7vqNgrnB6SamyA
	VKktMH/BICQQUoX76jKbPcIBq7mwgeTs5N8P+pdI4cSJGcz2ff99WOtLnoK3MWKOVH1R1JZXaVmhq
	W5NocswDLt7wRvUppcpKC0jqBdjyhEEzXQsUY15I0uI1a5qupUMlEdlR7Lz+TruZoAWno5sU8MzhB
	p5qkwL341Stq/Wd4CRtViG60cT1j0oWcSrbVdzNmdYRqv29WKwXrbbph1uo1Tp7IC2Y+V8mefgVZp
	88T+LSkqQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0ur7-0000xC-Ur; Wed, 29 Jul 2020 22:47:26 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0ur0-0000vg-9Y; Wed, 29 Jul 2020 22:47:19 +0000
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F0D5B2067D;
 Wed, 29 Jul 2020 22:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596062837;
 bh=klKSOlHcs2r4bmzNnXq4Xe7PD5R3XSNJtVynCtjaa0A=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=bTjVUwRNfsJ/7uTGgyRRg1z3+JU0qI0OB5rY12sGpsidiDlNpQSN27Q19r0zoJBTO
 doyvq0VJDH4q029N6VuBGFZ+u18PFnHyhf3sDffhaLdMIBH4MfLtbCWCIcPuzL7yy3
 RNX19oqaG1v+X+9gVEoTjmgcWAXScP/vlhrfisrQ=
Received: by mail-ej1-f46.google.com with SMTP id a26so171561ejc.2;
 Wed, 29 Jul 2020 15:47:16 -0700 (PDT)
X-Gm-Message-State: AOAM533aTOlsVif5QSlqtWIPNruPxdgPult3Ai6cF/dMAzYdQfOhRRCV
 l6hPbSVDS0OXYPh9sV6CuVUsJO7zJUcfqdcDaw==
X-Google-Smtp-Source: ABdhPJxlUf8wHtgaUmw1RVqJVXI8FHcJjTmdLWj3e6c9lhjXZckNQ/gauu5X7cH8Pd2kVqvteU1A6h6RdHuTocMEk34=
X-Received: by 2002:a17:906:d92c:: with SMTP id
 rn12mr527342ejb.187.1596062835563; 
 Wed, 29 Jul 2020 15:47:15 -0700 (PDT)
MIME-Version: 1.0
References: <1596010690-13178-1-git-send-email-neal.liu@mediatek.com>
 <1596010690-13178-3-git-send-email-neal.liu@mediatek.com>
In-Reply-To: <1596010690-13178-3-git-send-email-neal.liu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 30 Jul 2020 06:47:04 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9dqcQdZd5x9ckE67KKh-4d_5gN9MQYDq7b4vGCWwHoDw@mail.gmail.com>
Message-ID: <CAAOTY_9dqcQdZd5x9ckE67KKh-4d_5gN9MQYDq7b4vGCWwHoDw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] soc: mediatek: add mtk-devapc driver
To: Neal Liu <neal.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_184718_461532_B34A501E 
X-CRM114-Status: GOOD (  24.82  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream <wsd_upstream@mediatek.com>,
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIE5lYWw6CgpOZWFsIExpdSA8bmVhbC5saXVAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMOW5tDfm
nIgyOeaXpSDpgLHkuIkg5LiL5Y2INDoyOeWvq+mBk++8mgo+Cj4gTWVkaWFUZWsgYnVzIGZhYnJp
YyBwcm92aWRlcyBUcnVzdFpvbmUgc2VjdXJpdHkgc3VwcG9ydCBhbmQgZGF0YQo+IHByb3RlY3Rp
b24gdG8gcHJldmVudCBzbGF2ZXMgZnJvbSBiZWluZyBhY2Nlc3NlZCBieSB1bmV4cGVjdGVkCj4g
bWFzdGVycy4KPiBUaGUgc2VjdXJpdHkgdmlvbGF0aW9uIGlzIGxvZ2dlZCBhbmQgc2VudCB0byB0
aGUgcHJvY2Vzc29yIGZvcgo+IGZ1cnRoZXIgYW5hbHlzaXMgb3IgY291bnRlcm1lYXN1cmVzLgo+
Cj4gQW55IG9jY3VycmVuY2Ugb2Ygc2VjdXJpdHkgdmlvbGF0aW9uIHdvdWxkIHJhaXNlIGFuIGlu
dGVycnVwdCwgYW5kCj4gaXQgd2lsbCBiZSBoYW5kbGVkIGJ5IG10ay1kZXZhcGMgZHJpdmVyLiBU
aGUgdmlvbGF0aW9uCj4gaW5mb3JtYXRpb24gaXMgcHJpbnRlZCBpbiBvcmRlciB0byBmaW5kIHRo
ZSBtdXJkZXJlci4KPgo+IFNpZ25lZC1vZmYtYnk6IE5lYWwgTGl1IDxuZWFsLmxpdUBtZWRpYXRl
ay5jb20+Cgpbc25pcF0KCj4gKwo+ICtzdGF0aWMgdm9pZCBkZXZhcGNfdmlvX2luZm9fcHJpbnQo
c3RydWN0IG10a19kZXZhcGNfY29udGV4dCAqY3R4KQo+ICt7Cj4gKyAgICAgICBzdHJ1Y3QgbXRr
X2RldmFwY192aW9faW5mbyAqdmlvX2luZm8gPSBjdHgtPnZpb19pbmZvOwo+ICsKPiArICAgICAg
IC8qIFByaW50IHZpb2xhdGlvbiBpbmZvcm1hdGlvbiAqLwo+ICsgICAgICAgaWYgKHZpb19pbmZv
LT53cml0ZSkKPiArICAgICAgICAgICAgICAgZGV2X2luZm8oY3R4LT5kZXYsICJXcml0ZSBWaW9s
YXRpb25cbiIpOwo+ICsgICAgICAgZWxzZSBpZiAodmlvX2luZm8tPnJlYWQpCj4gKyAgICAgICAg
ICAgICAgIGRldl9pbmZvKGN0eC0+ZGV2LCAiUmVhZCBWaW9sYXRpb25cbiIpOwo+ICsKPiArICAg
ICAgIGRldl9pbmZvKGN0eC0+ZGV2LCAiVmlvIEFkZHI6MHgleCwgSGlnaDoweCV4LCBCdXMgSUQ6
MHgleCwgRG9tIElEOiV4XG4iLAo+ICsgICAgICAgICAgICAgICAgdmlvX2luZm8tPnZpb19hZGRy
LCB2aW9faW5mby0+dmlvX2FkZHJfaGlnaCwKPiArICAgICAgICAgICAgICAgIHZpb19pbmZvLT5t
YXN0ZXJfaWQsIHZpb19pbmZvLT5kb21haW5faWQpOwo+ICt9CgpkZXZhcGNfdmlvX2luZm9fcHJp
bnQoKSBpcyBzbWFsbCBmdW5jdGlvbiBhbmQgb25seSBjYWxsZWQgYnkKZGV2YXBjX2V4dHJhY3Rf
dmlvX2RiZygpLCBzbyBJIHdvdWxkIGxpa2UgdG8gbWVyZ2UgdGhpcyBmdW5jdGlvbiBpbnRvCmRl
dmFwY19leHRyYWN0X3Zpb19kYmcoKSBhbmQgeW91IGNvdWxkIGRyb3Agc3RydWN0IG10a19kZXZh
cGNfdmlvX2luZm8KYmVjYXVzZSBpdHMgbWVtYmVyIGFyZSBhbGwgbG9jYWwgdmFyaWFibGUuCgo+
ICsKPiArLyoKPiArICogZGV2YXBjX2V4dHJhY3RfdmlvX2RiZyAtIGV4dHJhY3QgZnVsbCB2aW9s
YXRpb24gaW5mb3JtYXRpb24gYWZ0ZXIgZG9pbmcKPiArICogICAgICAgICAgICAgICAgICAgICAg
ICAgIHNoaWZ0IG1lY2hhbmlzbS4KPiArICovCj4gK3N0YXRpYyB2b2lkIGRldmFwY19leHRyYWN0
X3Zpb19kYmcoc3RydWN0IG10a19kZXZhcGNfY29udGV4dCAqY3R4KQo+ICt7Cj4gKyAgICAgICBj
b25zdCBzdHJ1Y3QgbXRrX2RldmFwY192aW9fZGJncyAqdmlvX2RiZ3M7Cj4gKyAgICAgICBzdHJ1
Y3QgbXRrX2RldmFwY192aW9faW5mbyAqdmlvX2luZm87Cj4gKyAgICAgICB2b2lkIF9faW9tZW0g
KnZpb19kYmcwX3JlZzsKPiArICAgICAgIHZvaWQgX19pb21lbSAqdmlvX2RiZzFfcmVnOwo+ICsg
ICAgICAgdTMyIGRiZzA7Cj4gKwo+ICsgICAgICAgdmlvX2RiZzBfcmVnID0gY3R4LT5kZXZhcGNf
cGRfYmFzZSArIGN0eC0+b2Zmc2V0LT52aW9fZGJnMDsKPiArICAgICAgIHZpb19kYmcxX3JlZyA9
IGN0eC0+ZGV2YXBjX3BkX2Jhc2UgKyBjdHgtPm9mZnNldC0+dmlvX2RiZzE7Cj4gKwo+ICsgICAg
ICAgdmlvX2RiZ3MgPSBjdHgtPnZpb19kYmdzOwo+ICsgICAgICAgdmlvX2luZm8gPSBjdHgtPnZp
b19pbmZvOwo+ICsKPiArICAgICAgIC8qIFN0YXJ0cyB0byBleHRyYWN0IHZpb2xhdGlvbiBpbmZv
cm1hdGlvbiAqLwo+ICsgICAgICAgZGJnMCA9IHJlYWRsKHZpb19kYmcwX3JlZyk7Cj4gKyAgICAg
ICB2aW9faW5mby0+dmlvX2FkZHIgPSByZWFkbCh2aW9fZGJnMV9yZWcpOwo+ICsKPiArICAgICAg
IHZpb19pbmZvLT5tYXN0ZXJfaWQgPSAoZGJnMCAmIHZpb19kYmdzLT5tc3RpZC5tYXNrKSA+Pgo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZpb19kYmdzLT5tc3RpZC5zdGFydDsKPiAr
ICAgICAgIHZpb19pbmZvLT5kb21haW5faWQgPSAoZGJnMCAmIHZpb19kYmdzLT5kbW5pZC5tYXNr
KSA+Pgo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZpb19kYmdzLT5kbW5pZC5zdGFy
dDsKPiArICAgICAgIHZpb19pbmZvLT53cml0ZSA9ICgoZGJnMCAmIHZpb19kYmdzLT52aW9fdy5t
YXNrKSA+Pgo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICB2aW9fZGJncy0+dmlvX3cuc3Rh
cnQpID09IDE7Cj4gKyAgICAgICB2aW9faW5mby0+cmVhZCA9ICgoZGJnMCAmIHZpb19kYmdzLT52
aW9fci5tYXNrKSA+Pgo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgdmlvX2RiZ3MtPnZpb19y
LnN0YXJ0KSA9PSAxOwo+ICsgICAgICAgdmlvX2luZm8tPnZpb19hZGRyX2hpZ2ggPSAoZGJnMCAm
IHZpb19kYmdzLT5hZGRyX2gubWFzaykgPj4KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdmlvX2RiZ3MtPmFkZHJfaC5zdGFydDsKPiArCj4gKyAgICAgICBkZXZhcGNfdmlvX2lu
Zm9fcHJpbnQoY3R4KTsKPiArfQo+ICsKCltzbmlwXQoKPiArCj4gKy8qCj4gKyAqIHN0YXJ0X2Rl
dmFwYyAtIHVubWFzayBzbGF2ZSdzIGlycSB0byBzdGFydCByZWNlaXZpbmcgZGV2YXBjIHZpb2xh
dGlvbi4KPiArICovCj4gK3N0YXRpYyB2b2lkIHN0YXJ0X2RldmFwYyhzdHJ1Y3QgbXRrX2RldmFw
Y19jb250ZXh0ICpjdHgpCj4gK3sKPiArICAgICAgIHUzMiB2aW9faWR4Owo+ICsKPiArICAgICAg
IGZvciAodmlvX2lkeCA9IDA7IHZpb19pZHggPCBjdHgtPnZpb19pZHhfbnVtOyB2aW9faWR4Kysp
Cj4gKyAgICAgICAgICAgICAgIG1hc2tfbW9kdWxlX2lycShjdHgsIHZpb19pZHgsIGZhbHNlKTsK
CkFyZSB0aGVzZSBiaXRzIGRlZmF1bHQgdHJ1ZT8gSWYgdGhleSBhcmUgZGVmYXVsdCBmYWxzZSwg
eW91IG5lZWQgbm90CnRvIHNldHVwIGl0IHRvIGZhbHNlIGFnYWluLgoKPiArfQo+ICsKCltzbmlw
XQoKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLWRldmFwYy5oIGIvZHJp
dmVycy9zb2MvbWVkaWF0ZWsvbXRrLWRldmFwYy5oCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBp
bmRleCAwMDAwMDAwLi43YmQ3ZTY2Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2RyaXZlcnMvc29j
L21lZGlhdGVrL210ay1kZXZhcGMuaAo+IEBAIC0wLDAgKzEsNTQgQEAKPiArLyogU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8KPiArLyoKPiArICogQ29weXJpZ2h0IChDKSAyMDIw
IE1lZGlhVGVrIEluYy4KPiArICovCj4gKwo+ICsjaWZuZGVmIF9fTVRLX0RFVkFQQ19IX18KPiAr
I2RlZmluZSBfX01US19ERVZBUENfSF9fCj4gKwo+ICsjZGVmaW5lIFZJT19NT0RfVE9fUkVHX0lO
RChtKSAgKChtKSAvIDMyKQo+ICsjZGVmaW5lIFZJT19NT0RfVE9fUkVHX09GRihtKSAgKChtKSAl
IDMyKQo+ICsKPiArc3RydWN0IG10a19kZXZhcGNfcGRfb2Zmc2V0IHsKPiArICAgICAgIHUzMiB2
aW9fbWFzazsKPiArICAgICAgIHUzMiB2aW9fc3RhOwo+ICsgICAgICAgdTMyIHZpb19kYmcwOwo+
ICsgICAgICAgdTMyIHZpb19kYmcxOwo+ICsgICAgICAgdTMyIGFwY19jb247Cj4gKyAgICAgICB1
MzIgdmlvX3NoaWZ0X3N0YTsKPiArICAgICAgIHUzMiB2aW9fc2hpZnRfc2VsOwo+ICsgICAgICAg
dTMyIHZpb19zaGlmdF9jb247Cj4gK307Cj4gKwo+ICtzdHJ1Y3QgbXRrX2RldmFwY192aW9fZGJn
c19kZXNjIHsKPiArICAgICAgIHUzMiBtYXNrOwo+ICsgICAgICAgdTMyIHN0YXJ0Owo+ICt9Owo+
ICsKPiArc3RydWN0IG10a19kZXZhcGNfdmlvX2RiZ3Mgewo+ICsgICAgICAgc3RydWN0IG10a19k
ZXZhcGNfdmlvX2RiZ3NfZGVzYyBtc3RpZDsKPiArICAgICAgIHN0cnVjdCBtdGtfZGV2YXBjX3Zp
b19kYmdzX2Rlc2MgZG1uaWQ7Cj4gKyAgICAgICBzdHJ1Y3QgbXRrX2RldmFwY192aW9fZGJnc19k
ZXNjIHZpb193Owo+ICsgICAgICAgc3RydWN0IG10a19kZXZhcGNfdmlvX2RiZ3NfZGVzYyB2aW9f
cjsKPiArICAgICAgIHN0cnVjdCBtdGtfZGV2YXBjX3Zpb19kYmdzX2Rlc2MgYWRkcl9oOwo+ICt9
Owo+ICsKPiArc3RydWN0IG10a19kZXZhcGNfdmlvX2luZm8gewo+ICsgICAgICAgYm9vbCByZWFk
Owo+ICsgICAgICAgYm9vbCB3cml0ZTsKPiArICAgICAgIHUzMiB2aW9fYWRkcjsKPiArICAgICAg
IHUzMiB2aW9fYWRkcl9oaWdoOwo+ICsgICAgICAgdTMyIG1hc3Rlcl9pZDsKPiArICAgICAgIHUz
MiBkb21haW5faWQ7Cj4gK307Cj4gKwo+ICtzdHJ1Y3QgbXRrX2RldmFwY19jb250ZXh0IHsKPiAr
ICAgICAgIHN0cnVjdCBkZXZpY2UgKmRldjsKPiArICAgICAgIHUzMiB2aW9faWR4X251bTsKPiAr
ICAgICAgIHZvaWQgX19pb21lbSAqZGV2YXBjX3BkX2Jhc2U7Cj4gKyAgICAgICBzdHJ1Y3QgbXRr
X2RldmFwY192aW9faW5mbyAqdmlvX2luZm87Cj4gKyAgICAgICBjb25zdCBzdHJ1Y3QgbXRrX2Rl
dmFwY19wZF9vZmZzZXQgKm9mZnNldDsKPiArICAgICAgIGNvbnN0IHN0cnVjdCBtdGtfZGV2YXBj
X3Zpb19kYmdzICp2aW9fZGJnczsKPiArfTsKPiArCj4gKyNlbmRpZiAvKiBfX01US19ERVZBUENf
SF9fICovCgpEYXRhIGluIHRoaXMgaGVhZGVyIGZpbGUgaXMgb25seSB1c2VkIGluIG10ay1kZXZh
cGMuYyBhbmQgbXRrLWRldmFwYy5jCmlzIGEgc21hbGwgZmlsZSwgc28gSSB0aGluayBpdCdzIGJl
dHRlciB0byBtb3ZlIGRhdGEgaW4gaGVhZGVyIGZpbGUKaW50byAuYyBmaWxlIHRvIG1ha2UgY29k
ZSBzaW1wbGVyLgoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51
eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
