Return-Path: <SRS0=IT6v=7J=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BC0DC433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 May 2020 08:46:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E77A6206F1
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 May 2020 08:46:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eVCsrVD3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="GxKyCH66"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E77A6206F1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vf7owwcLDELKKM7hzqfH4irjysHVAGdph3BtU9NJX6M=; b=eVCsrVD35qoqZH
	jivyGPyxG/wFSrWoa5Vf7MuYexrozIplhz5RU2xjYjCz+XJekOiaR4R102ITZaT8z9JSJ2a/Unq8O
	4Yh7KgXaeHzKB4OcpmyRo567vgxtME38W7VoTmdr/AR41jf6E6CojUM9MAAG4zY0L9V78oNE8IroS
	NplxMv8EwkGS3Rjc7KSi74++Z0WJ5bvZ8rR6HjnBSZQjJDKD81I0l0Ia3N0oDr+FGdOBtAQHLAA1s
	AtPS9hdoMbz1/E2jFX1QppZmyulIhKimivtHGkPWZ7ScR1K6nbFu0SdTd2uQrgmjjLkAS4Sjmet78
	E2L0XtBn+p5K3kR+Iabw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdrhh-0003Bu-Nc; Wed, 27 May 2020 08:46:25 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdrhd-0003Aj-U5
 for linux-mediatek@lists.infradead.org; Wed, 27 May 2020 08:46:24 +0000
Received: by mail-io1-xd41.google.com with SMTP id d5so15554654ios.9
 for <linux-mediatek@lists.infradead.org>; Wed, 27 May 2020 01:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cpwITzrftWrJAY0LVaSeu6jYTmkJe1PVewzQjLawjdA=;
 b=GxKyCH668dBc5VipkdT8YFjPTCx5H6Ette6THzOjjs/DRDGNcXIMDQi5ZP5v3Sf9Oa
 mwVrP6RSqnYeL10DiHJM1SOkKIcn6brwgQRHX0b0oKqUeDUGj/rjNQW55Xq53NQfseRD
 vXhZTU3mB8ZA8VEHKczO26DPAktbj8hdettUmRE8i6vyRvcYoYFGvApZ8ukhZ5+bQK7D
 9L8+5xCW38IQadhYPoyI/PQs166Rw+w8+8SWRYvSIyYFnkV+77MOB9qUtGq2ER6cdPV/
 +/sr0UAOp1UfaGH7K0FiwaDoGqoJN+EI3wjFXv9n4Zv/oSigkjbvRq3z7WEgWAq+aZOX
 0EsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cpwITzrftWrJAY0LVaSeu6jYTmkJe1PVewzQjLawjdA=;
 b=qAH22UUQL7+5eXufFFNAJqh2AHb4Iz/ivVyc2nQF9g//rNFrlfYuDbP8mG+uchW+vb
 zWYtOy8oD/G/2YUrQtIhoFvZDfOUN5LQ7BUOtgiSAk6N5YvLAFfbAAGpOK4P8PddHvMh
 UnVw2hDFZlqdBGQ1JOP3gdVF/MfCees33YmFy2lsGnPRG1VA+Nlv+OVRLmAhXR2oeo/C
 gKYv5jpDdpikTm0wLLjrhWAAWDwnzXs/37QEK9UFeAAJGH6XdTd+6HBjMwi74GMhks7i
 xaZpV5eptBncoALyAYFj7dymAP+km/CAzrwrlFwanWoQINK6ooE/bvsB6gwMbAShr9AP
 CFwQ==
X-Gm-Message-State: AOAM531rGIGOJM9lm8Ds3hqi+P0AtssVOGlLxWDvS6yGjM+j72xelBg+
 R4lIisCqtQEpFQgQsNw4yIksF/JN1zIfw0T5RHdIog==
X-Google-Smtp-Source: ABdhPJwMXQdy6+RxEU74Dd9WQ5Tly2o2sH55kV9ZSrhh4NH0gl/D2WFHak2VKletNu2Ql3a2wNrDFJNkEIRMls/7rZo=
X-Received: by 2002:a02:3e06:: with SMTP id s6mr4481666jas.57.1590569179357;
 Wed, 27 May 2020 01:46:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200522120700.838-1-brgl@bgdev.pl>
 <20200522120700.838-7-brgl@bgdev.pl>
 <20200527073150.GA3384158@ubuntu-s3-xlarge-x86>
In-Reply-To: <20200527073150.GA3384158@ubuntu-s3-xlarge-x86>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 27 May 2020 10:46:08 +0200
Message-ID: <CAMRc=MevVsYZFDQif+8Zyv41sSkbS8XqWbKGdCvHooneXz88hg@mail.gmail.com>
Subject: Re: [PATCH v5 06/11] net: ethernet: mtk-star-emac: new driver
To: Nathan Chancellor <natechancellor@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200527_014623_362818_7AE7FF7F 
X-CRM114-Status: GOOD (  22.26  )
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
Cc: Edwin Peer <edwin.peer@broadcom.com>,
 devicetree <devicetree@vger.kernel.org>,
 Stephane Le Provost <stephane.leprovost@mediatek.com>,
 Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 netdev <netdev@vger.kernel.org>, Sean Wang <sean.wang@mediatek.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Pedro Tsai <pedro.tsai@mediatek.com>, "David S . Miller" <davem@davemloft.net>,
 Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 clang-built-linux@googlegroups.com,
 Andrew Perepech <andrew.perepech@mediatek.com>,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

xZtyLiwgMjcgbWFqIDIwMjAgbyAwOTozMSBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0ZWNoYW5jZWxs
b3JAZ21haWwuY29tPgpuYXBpc2HFgihhKToKPgo+IE9uIEZyaSwgTWF5IDIyLCAyMDIwIGF0IDAy
OjA2OjU1UE0gKzAyMDAsIEJhcnRvc3ogR29sYXN6ZXdza2kgd3JvdGU6Cj4KPiA8c25pcD4KPgo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L21lZGlhdGVrL210a19zdGFyX2Vt
YWMuYyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L21lZGlhdGVrL210a19zdGFyX2VtYWMuYwo+ID4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uNzg5Yzc3YWY1MDFm
Cj4gPiAtLS0gL2Rldi9udWxsCj4gPiArKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9tZWRpYXRl
ay9tdGtfc3Rhcl9lbWFjLmMKPiA+IEBAIC0wLDAgKzEsMTY3OCBAQAo+Cj4gPHNuaXA+Cj4KPiBJ
J3ZlIHNlYXJjaGVkIG5ldGRldiBhbmQgSSBjYW5ub3QgZmluZCBhbnkgcmVwb3J0cyBmcm9tIG90
aGVycyBidXQgdGhpcwo+IGZ1bmN0aW9uIGludHJvZHVjZXMgYSBjbGFuZyB3YXJuaW5nOgo+Cj4g
ZHJpdmVycy9uZXQvZXRoZXJuZXQvbWVkaWF0ZWsvbXRrX3N0YXJfZW1hYy5jOjEyOTY6Njogd2Fy
bmluZzogdmFyaWFibGUgJ25ld19kbWFfYWRkcicgaXMgdXNlZCB1bmluaXRpYWxpemVkIHdoZW5l
dmVyICdpZicgY29uZGl0aW9uIGlzIHRydWUgWy1Xc29tZXRpbWVzLXVuaW5pdGlhbGl6ZWRdCj4g
ICAgICAgICBpZiAoIW5ld19za2IpIHsKPiAgICAgICAgICAgICBefn5+fn5+fgo+IGRyaXZlcnMv
bmV0L2V0aGVybmV0L21lZGlhdGVrL210a19zdGFyX2VtYWMuYzoxMzIxOjIzOiBub3RlOiB1bmlu
aXRpYWxpemVkIHVzZSBvY2N1cnMgaGVyZQo+ICAgICAgICAgZGVzY19kYXRhLmRtYV9hZGRyID0g
bmV3X2RtYV9hZGRyOwo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+
Cj4gZHJpdmVycy9uZXQvZXRoZXJuZXQvbWVkaWF0ZWsvbXRrX3N0YXJfZW1hYy5jOjEyOTY6Mjog
bm90ZTogcmVtb3ZlIHRoZSAnaWYnIGlmIGl0cyBjb25kaXRpb24gaXMgYWx3YXlzIGZhbHNlCj4g
ICAgICAgICBpZiAoIW5ld19za2IpIHsKPiAgICAgICAgIF5+fn5+fn5+fn5+fn5+fgo+IGRyaXZl
cnMvbmV0L2V0aGVybmV0L21lZGlhdGVrL210a19zdGFyX2VtYWMuYzoxMjg1OjY6IHdhcm5pbmc6
IHZhcmlhYmxlICduZXdfZG1hX2FkZHInIGlzIHVzZWQgdW5pbml0aWFsaXplZCB3aGVuZXZlciAn
aWYnIGNvbmRpdGlvbiBpcyB0cnVlIFstV3NvbWV0aW1lcy11bmluaXRpYWxpemVkXQo+ICAgICAg
ICAgaWYgKChkZXNjX2RhdGEuZmxhZ3MgJiBNVEtfU1RBUl9ERVNDX0JJVF9SWF9DUkNFKSB8fAo+
ICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fgo+IGRyaXZlcnMvbmV0L2V0aGVybmV0L21lZGlhdGVrL210a19zdGFyX2VtYWMuYzoxMzIx
OjIzOiBub3RlOiB1bmluaXRpYWxpemVkIHVzZSBvY2N1cnMgaGVyZQo+ICAgICAgICAgZGVzY19k
YXRhLmRtYV9hZGRyID0gbmV3X2RtYV9hZGRyOwo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXn5+fn5+fn5+fn5+Cj4gZHJpdmVycy9uZXQvZXRoZXJuZXQvbWVkaWF0ZWsvbXRrX3N0YXJf
ZW1hYy5jOjEyODU6Mjogbm90ZTogcmVtb3ZlIHRoZSAnaWYnIGlmIGl0cyBjb25kaXRpb24gaXMg
YWx3YXlzIGZhbHNlCj4gICAgICAgICBpZiAoKGRlc2NfZGF0YS5mbGFncyAmIE1US19TVEFSX0RF
U0NfQklUX1JYX0NSQ0UpIHx8Cj4gICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4gZHJpdmVycy9uZXQvZXRoZXJuZXQvbWVkaWF0ZWsv
bXRrX3N0YXJfZW1hYy5jOjEyODU6Njogd2FybmluZzogdmFyaWFibGUgJ25ld19kbWFfYWRkcicg
aXMgdXNlZCB1bmluaXRpYWxpemVkIHdoZW5ldmVyICd8fCcgY29uZGl0aW9uIGlzIHRydWUgWy1X
c29tZXRpbWVzLXVuaW5pdGlhbGl6ZWRdCj4gICAgICAgICBpZiAoKGRlc2NfZGF0YS5mbGFncyAm
IE1US19TVEFSX0RFU0NfQklUX1JYX0NSQ0UpIHx8Cj4gICAgICAgICAgICAgXn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4gZHJpdmVycy9uZXQvZXRoZXJuZXQv
bWVkaWF0ZWsvbXRrX3N0YXJfZW1hYy5jOjEzMjE6MjM6IG5vdGU6IHVuaW5pdGlhbGl6ZWQgdXNl
IG9jY3VycyBoZXJlCj4gICAgICAgICBkZXNjX2RhdGEuZG1hX2FkZHIgPSBuZXdfZG1hX2FkZHI7
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn4KPiBkcml2ZXJzL25l
dC9ldGhlcm5ldC9tZWRpYXRlay9tdGtfc3Rhcl9lbWFjLmM6MTI4NTo2OiBub3RlOiByZW1vdmUg
dGhlICd8fCcgaWYgaXRzIGNvbmRpdGlvbiBpcyBhbHdheXMgZmFsc2UKPiAgICAgICAgIGlmICgo
ZGVzY19kYXRhLmZsYWdzICYgTVRLX1NUQVJfREVTQ19CSVRfUlhfQ1JDRSkgfHwKPiAgICAgICAg
ICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KPiBk
cml2ZXJzL25ldC9ldGhlcm5ldC9tZWRpYXRlay9tdGtfc3Rhcl9lbWFjLmM6MTI3NDoyNTogbm90
ZTogaW5pdGlhbGl6ZSB0aGUgdmFyaWFibGUgJ25ld19kbWFfYWRkcicgdG8gc2lsZW5jZSB0aGlz
IHdhcm5pbmcKPiAgICAgICAgIGRtYV9hZGRyX3QgbmV3X2RtYV9hZGRyOwo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBeCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA9
IDAKPiAzIHdhcm5pbmdzIGdlbmVyYXRlZC4KPgo+ID4gK3N0YXRpYyBpbnQgbXRrX3N0YXJfcmVj
ZWl2ZV9wYWNrZXQoc3RydWN0IG10a19zdGFyX3ByaXYgKnByaXYpCj4gPiArewo+ID4gKyAgICAg
c3RydWN0IG10a19zdGFyX3JpbmcgKnJpbmcgPSAmcHJpdi0+cnhfcmluZzsKPiA+ICsgICAgIHN0
cnVjdCBkZXZpY2UgKmRldiA9IG10a19zdGFyX2dldF9kZXYocHJpdik7Cj4gPiArICAgICBzdHJ1
Y3QgbXRrX3N0YXJfcmluZ19kZXNjX2RhdGEgZGVzY19kYXRhOwo+ID4gKyAgICAgc3RydWN0IG5l
dF9kZXZpY2UgKm5kZXYgPSBwcml2LT5uZGV2Owo+ID4gKyAgICAgc3RydWN0IHNrX2J1ZmYgKmN1
cnJfc2tiLCAqbmV3X3NrYjsKPiA+ICsgICAgIGRtYV9hZGRyX3QgbmV3X2RtYV9hZGRyOwo+Cj4g
VW5pbml0aWFsaXplZCBoZXJlCj4KPiA+ICsgICAgIGludCByZXQ7Cj4gPiArCj4gPiArICAgICBz
cGluX2xvY2soJnByaXYtPmxvY2spOwo+ID4gKyAgICAgcmV0ID0gbXRrX3N0YXJfcmluZ19wb3Bf
dGFpbChyaW5nLCAmZGVzY19kYXRhKTsKPiA+ICsgICAgIHNwaW5fdW5sb2NrKCZwcml2LT5sb2Nr
KTsKPiA+ICsgICAgIGlmIChyZXQpCj4gPiArICAgICAgICAgICAgIHJldHVybiAtMTsKPiA+ICsK
PiA+ICsgICAgIGN1cnJfc2tiID0gZGVzY19kYXRhLnNrYjsKPiA+ICsKPiA+ICsgICAgIGlmICgo
ZGVzY19kYXRhLmZsYWdzICYgTVRLX1NUQVJfREVTQ19CSVRfUlhfQ1JDRSkgfHwKPiA+ICsgICAg
ICAgICAoZGVzY19kYXRhLmZsYWdzICYgTVRLX1NUQVJfREVTQ19CSVRfUlhfT1NJWkUpKSB7Cj4g
PiArICAgICAgICAgICAgIC8qIEVycm9yIHBhY2tldCAtPiBkcm9wIGFuZCByZXVzZSBza2IuICov
Cj4gPiArICAgICAgICAgICAgIG5ld19za2IgPSBjdXJyX3NrYjsKPiA+ICsgICAgICAgICAgICAg
Z290byBwdXNoX25ld19za2I7Cj4KPiB0aGlzIGdvdG8KPgo+ID4gKyAgICAgfQo+ID4gKwo+ID4g
KyAgICAgLyogUHJlcGFyZSBuZXcgc2tiIGJlZm9yZSByZWNlaXZpbmcgdGhlIGN1cnJlbnQgb25l
LiBSZXVzZSB0aGUgY3VycmVudAo+ID4gKyAgICAgICogc2tiIGlmIHdlIGZhaWwgYXQgYW55IHBv
aW50Lgo+ID4gKyAgICAgICovCj4gPiArICAgICBuZXdfc2tiID0gbXRrX3N0YXJfYWxsb2Nfc2ti
KG5kZXYpOwo+ID4gKyAgICAgaWYgKCFuZXdfc2tiKSB7Cj4gPiArICAgICAgICAgICAgIG5kZXYt
PnN0YXRzLnJ4X2Ryb3BwZWQrKzsKPiA+ICsgICAgICAgICAgICAgbmV3X3NrYiA9IGN1cnJfc2ti
Owo+ID4gKyAgICAgICAgICAgICBnb3RvIHB1c2hfbmV3X3NrYjsKPgo+IGFuZCB0aGlzIGdvdG8K
Pgo+ID4gKyAgICAgfQo+ID4gKwo+ID4gKyAgICAgbmV3X2RtYV9hZGRyID0gbXRrX3N0YXJfZG1h
X21hcF9yeChwcml2LCBuZXdfc2tiKTsKPiA+ICsgICAgIGlmIChkbWFfbWFwcGluZ19lcnJvcihk
ZXYsIG5ld19kbWFfYWRkcikpIHsKPiA+ICsgICAgICAgICAgICAgbmRldi0+c3RhdHMucnhfZHJv
cHBlZCsrOwo+ID4gKyAgICAgICAgICAgICBkZXZfa2ZyZWVfc2tiKG5ld19za2IpOwo+ID4gKyAg
ICAgICAgICAgICBuZXdfc2tiID0gY3Vycl9za2I7Cj4gPiArICAgICAgICAgICAgIG5ldGRldl9l
cnIobmRldiwgIkRNQSBtYXBwaW5nIGVycm9yIG9mIFJYIGRlc2NyaXB0b3JcbiIpOwo+ID4gKyAg
ICAgICAgICAgICBnb3RvIHB1c2hfbmV3X3NrYjsKPiA+ICsgICAgIH0KPiA+ICsKPiA+ICsgICAg
IC8qIFdlIGNhbid0IGZhaWwgYW55bW9yZSBhdCB0aGlzIHBvaW50OiBpdCdzIHNhZmUgdG8gdW5t
YXAgdGhlIHNrYi4gKi8KPiA+ICsgICAgIG10a19zdGFyX2RtYV91bm1hcF9yeChwcml2LCAmZGVz
Y19kYXRhKTsKPiA+ICsKPiA+ICsgICAgIHNrYl9wdXQoZGVzY19kYXRhLnNrYiwgZGVzY19kYXRh
Lmxlbik7Cj4gPiArICAgICBkZXNjX2RhdGEuc2tiLT5pcF9zdW1tZWQgPSBDSEVDS1NVTV9OT05F
Owo+ID4gKyAgICAgZGVzY19kYXRhLnNrYi0+cHJvdG9jb2wgPSBldGhfdHlwZV90cmFucyhkZXNj
X2RhdGEuc2tiLCBuZGV2KTsKPiA+ICsgICAgIGRlc2NfZGF0YS5za2ItPmRldiA9IG5kZXY7Cj4g
PiArICAgICBuZXRpZl9yZWNlaXZlX3NrYihkZXNjX2RhdGEuc2tiKTsKPiA+ICsKPiA+ICtwdXNo
X25ld19za2I6Cj4gPiArICAgICBkZXNjX2RhdGEuZG1hX2FkZHIgPSBuZXdfZG1hX2FkZHI7Cj4K
PiBhc3NpZ24gaXQgdW5pbml0aWFsaXplZCBoZXJlLgo+Cj4gPiArICAgICBkZXNjX2RhdGEubGVu
ID0gc2tiX3RhaWxyb29tKG5ld19za2IpOwo+ID4gKyAgICAgZGVzY19kYXRhLnNrYiA9IG5ld19z
a2I7Cj4gPiArCj4gPiArICAgICBzcGluX2xvY2soJnByaXYtPmxvY2spOwo+ID4gKyAgICAgbXRr
X3N0YXJfcmluZ19wdXNoX2hlYWRfcngocmluZywgJmRlc2NfZGF0YSk7Cj4gPiArICAgICBzcGlu
X3VubG9jaygmcHJpdi0+bG9jayk7Cj4gPiArCj4gPiArICAgICByZXR1cm4gMDsKPiA+ICt9Cj4K
PiBJIGRvbid0IGtub3cgaWYgdGhlcmUgc2hvdWxkIGJlIGEgbmV3IGxhYmVsIHRoYXQgZXhjbHVk
ZXMgdGhhdAo+IGFzc2lnbm1lbnQgZm9yIHRob3NlIHBhcnRpY3VsYXIgZ290b3Mgb3IgaWYgbmV3
X2RtYV9hZGRyIHNob3VsZAo+IGJlIGluaXRpYWxpemVkIHRvIHNvbWV0aGluZyBhdCB0aGUgdG9w
LiBQbGVhc2UgdGFrZSBhIGxvb2sgYXQKPiBhZGRyZXNzaW5nIHRoaXMgd2hlbiB5b3UgZ2V0IGEg
Y2hhbmNlLgo+Cj4gQ2hlZXJzLAo+IE5hdGhhbgoKSGkgTmF0aGFuLAoKVGhhbmtzIGZvciByZXBv
cnRpbmcgdGhpcyEgSSBoYXZlIGEgZml4IHJlYWR5IGFuZCB3aWxsIHNlbmQgaXQgc2hvcnRseS4K
CkJhcnRvc3oKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bWVkaWF0ZWsK
