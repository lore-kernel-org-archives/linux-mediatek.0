Return-Path: <SRS0=eBCQ=PV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B7DAC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Nov 2021 23:45:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 089D561050
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Nov 2021 23:45:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 089D561050
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mc2vBiFYh74qRZYUo8mRyW594xMGkQrEhgi8kksDlHI=; b=tYM+3Bfb0IcCzM
	s00z1yx0WSKvICOoKikvmkjzhWPdn9Dh3i3YHQgRPEw+BHzYt3tJSlr1aBEJThOg1lPWFmypm/VXg
	YbC4J/3upMHLlPzBl+PwRGbnot2uhsbCSh1eLx9Eh7lES49Qft9X7hMusNdkShMOzK+VhiSYN9TB/
	tG14rwC6mGlAbtcsLHDZZroarUJaH+ysJwi9WzgHGeMk+13/rD4XLyDUfItbUeIe1WGzyAqx09xwl
	ZYiYc9aIXF8axs1HmCGJa25bIm3jSzHMgxFipv9rIT7WdB18RAgwv6TPgx6dAyn9za9ZloxXVtkdR
	uj6UQMgDpLld+OXmL9xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mi3T5-003SOu-Cm; Tue, 02 Nov 2021 23:45:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mi3Sj-003SGA-Em; Tue, 02 Nov 2021 23:45:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DD87060FC4;
 Tue,  2 Nov 2021 23:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635896704;
 bh=vPWkcBo86BKXwrWC2Qmwb+8ugZHdTIg3yCp8jZrT4So=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=dWGnqdTy6EO7H4LtFwBmfmPTHjiCwUBWySCiJ5Eqr8S+8tG61+LcSyR9TwEkmpZ1g
 Z4RJoxYyuiFBmbCGwqp7JhqMPv/zpxahpa4Diba9LVrcnPrvN640bSjK0eIKoZz4og
 LkeZnBl0NLy+kV+hcnsgQlZai2jr0TjHu5pWZImuOya9id20awwjPQVaScG5qZanSy
 ygmg0hmbSzq8/5kcDltaliIlB/hTrsz0Od8ykBP+xOLNUWA7yNInD62ra8A8pgXsIE
 BeB+9fR0Zn6v0dEdC3Mqh0I77dTNjc4/6x+Pn10kCg7O+rboZ2F2sczmZ2+qDRAAiI
 w1JmBbNEZzzfA==
Received: by mail-ed1-f41.google.com with SMTP id f4so2922493edx.12;
 Tue, 02 Nov 2021 16:45:04 -0700 (PDT)
X-Gm-Message-State: AOAM532UNSv+ZW4ZbC4Y59svjLW8fYWshCcOkESVh4zVGQfZq6BHlPGR
 r8SGQU6Zp8FzS0oN4cFBd2B5Mto3HFog2RxExw==
X-Google-Smtp-Source: ABdhPJx78xVu8kk62eC7oU7ATd8SHhqdRwLd4zs6Ro16CmY9rBQi3H+kNLSo5dcEKqzkwoK7bgzmFSJ4lPSesTMqBL0=
X-Received: by 2002:a17:907:6ea6:: with SMTP id
 sh38mr51576120ejc.388.1635896703367; 
 Tue, 02 Nov 2021 16:45:03 -0700 (PDT)
MIME-Version: 1.0
References: <20211029075203.17093-1-nancy.lin@mediatek.com>
 <20211029075203.17093-15-nancy.lin@mediatek.com>
In-Reply-To: <20211029075203.17093-15-nancy.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 3 Nov 2021 07:44:52 +0800
X-Gmail-Original-Message-ID: <CAAOTY_94jzVaDQC-DBdo584oQ6u_j=ibjRyTQEXaDwrSo24rsQ@mail.gmail.com>
Message-ID: <CAAOTY_94jzVaDQC-DBdo584oQ6u_j=ibjRyTQEXaDwrSo24rsQ@mail.gmail.com>
Subject: Re: [PATCH v7 14/20] drm/mediatek: add display merge start/stop API
 for cmdq support
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
X-CRM114-CacheID: sfid-20211102_164505_575244_D188E242 
X-CRM114-Status: GOOD (  16.73  )
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
tDEw5pyIMjnml6Ug6YCx5LqUIOS4i+WNiDM6NTLlr6vpgZPvvJoKPgo+IEFkZCBtZXJnZSBzdGFy
dC9zdG9wIEFQSSBmb3IgY21kcSBzdXBwb3J0LiBUaGUgb3ZsX2FkYXB0b3IgbWVyZ2VzCj4gYXJl
IGNvbmZpZ3VyZWQgd2l0aCBlYWNoIGRybSBwbGFuZSB1cGRhdGUuIE5lZWQgdG8gZW5hYmxlL2Rp
c2FibGUKPiBtZXJnZSB3aXRoIGNtZHEgbWFraW5nIHN1cmUgYWxsIHRoZSBzZXR0aW5ncyB0YWtl
biBlZmZlY3QgaW4gdGhlCj4gc2FtZSB2YmxhbmsuCgpSZXZpZXdlZC1ieTogQ2h1bi1LdWFuZyBI
dSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cgo+Cj4gU2lnbmVkLW9mZi1ieTogTmFuY3kuTGlu
IDxuYW5jeS5saW5AbWVkaWF0ZWsuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2Rpc3BfZHJ2LmggICB8ICAyICsrCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZGlzcF9tZXJnZS5jIHwgMjAgKysrKysrKysrKysrKysrKystLS0KPiAgMiBmaWxlcyBjaGFu
Z2VkLCAxOSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9kcnYuaCBiL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZGlzcF9kcnYuaAo+IGluZGV4IGMyZGU1M2E1ODkyZS4uMjI0YTcxMGJiNTM3
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9kcnYuaAo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9kcnYuaAo+IEBAIC02Niw2
ICs2Niw4IEBAIHZvaWQgbXRrX21lcmdlX3N0b3Aoc3RydWN0IGRldmljZSAqZGV2KTsKPiAgdm9p
ZCBtdGtfbWVyZ2VfYWR2YW5jZV9jb25maWcoc3RydWN0IGRldmljZSAqZGV2LCB1bnNpZ25lZCBp
bnQgbF93LCB1bnNpZ25lZCBpbnQgcl93LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHVuc2lnbmVkIGludCBoLCB1bnNpZ25lZCBpbnQgdnJlZnJlc2gsIHVuc2lnbmVkIGludCBicGMs
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGNtZHFfcGt0ICpjbWRxX3Br
dCk7Cj4gK3ZvaWQgbXRrX21lcmdlX3N0YXJ0X2NtZHEoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1
Y3QgY21kcV9wa3QgKmNtZHFfcGt0KTsKPiArdm9pZCBtdGtfbWVyZ2Vfc3RvcF9jbWRxKHN0cnVj
dCBkZXZpY2UgKmRldiwgc3RydWN0IGNtZHFfcGt0ICpjbWRxX3BrdCk7Cj4KPiAgdm9pZCBtdGtf
b3ZsX2JnY2xyX2luX29uKHN0cnVjdCBkZXZpY2UgKmRldik7Cj4gIHZvaWQgbXRrX292bF9iZ2Ns
cl9pbl9vZmYoc3RydWN0IGRldmljZSAqZGV2KTsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kaXNwX21lcmdlLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2Rpc3BfbWVyZ2UuYwo+IGluZGV4IDU1OGUwY2IyYTI5Ny4uOTJjODFjZTI0YTQ5IDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9tZXJnZS5jCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX21lcmdlLmMKPiBAQCAtNjcsMTcg
KzY3LDMxIEBAIHN0cnVjdCBtdGtfZGlzcF9tZXJnZSB7Cj4gIH07Cj4KPiAgdm9pZCBtdGtfbWVy
Z2Vfc3RhcnQoc3RydWN0IGRldmljZSAqZGV2KQo+ICt7Cj4gKyAgICAgICBtdGtfbWVyZ2Vfc3Rh
cnRfY21kcShkZXYsIE5VTEwpOwo+ICt9Cj4gKwo+ICt2b2lkIG10a19tZXJnZV9zdG9wKHN0cnVj
dCBkZXZpY2UgKmRldikKPiAgewo+ICAgICAgICAgc3RydWN0IG10a19kaXNwX21lcmdlICpwcml2
ID0gZGV2X2dldF9kcnZkYXRhKGRldik7Cj4KPiAtICAgICAgIHdyaXRlbChNRVJHRV9FTiwgcHJp
di0+cmVncyArIERJU1BfUkVHX01FUkdFX0NUUkwpOwo+ICsgICAgICAgbXRrX21lcmdlX3N0b3Bf
Y21kcShkZXYsIE5VTEwpOwo+ICB9Cj4KPiAtdm9pZCBtdGtfbWVyZ2Vfc3RvcChzdHJ1Y3QgZGV2
aWNlICpkZXYpCj4gK3ZvaWQgbXRrX21lcmdlX3N0YXJ0X2NtZHEoc3RydWN0IGRldmljZSAqZGV2
LCBzdHJ1Y3QgY21kcV9wa3QgKmNtZHFfcGt0KQo+ICt7Cj4gKyAgICAgICBzdHJ1Y3QgbXRrX2Rp
c3BfbWVyZ2UgKnByaXYgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKPiArCj4gKyAgICAgICBtdGtf
ZGRwX3dyaXRlKGNtZHFfcGt0LCAxLCAmcHJpdi0+Y21kcV9yZWcsIHByaXYtPnJlZ3MsCj4gKyAg
ICAgICAgICAgICAgICAgICAgIERJU1BfUkVHX01FUkdFX0NUUkwpOwo+ICt9Cj4gKwo+ICt2b2lk
IG10a19tZXJnZV9zdG9wX2NtZHEoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgY21kcV9wa3Qg
KmNtZHFfcGt0KQo+ICB7Cj4gICAgICAgICBzdHJ1Y3QgbXRrX2Rpc3BfbWVyZ2UgKnByaXYgPSBk
ZXZfZ2V0X2RydmRhdGEoZGV2KTsKPgo+IC0gICAgICAgd3JpdGVsKDB4MCwgcHJpdi0+cmVncyAr
IERJU1BfUkVHX01FUkdFX0NUUkwpOwo+ICsgICAgICAgbXRrX2RkcF93cml0ZShjbWRxX3BrdCwg
MCwgJnByaXYtPmNtZHFfcmVnLCBwcml2LT5yZWdzLAo+ICsgICAgICAgICAgICAgICAgICAgICBE
SVNQX1JFR19NRVJHRV9DVFJMKTsKPiAgfQo+Cj4gIHN0YXRpYyB2b2lkIG10a19tZXJnZV9maWZv
X3NldHRpbmcoc3RydWN0IG10a19kaXNwX21lcmdlICpwcml2LAo+IC0tCj4gMi4xOC4wCj4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlh
dGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
