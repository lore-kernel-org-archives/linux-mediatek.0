Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B71C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Dec 2021 10:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0oTUaMJ6ckOq1gHY2W0cP17Ni6UpmxnzfbM52J3eRcM=; b=TfxOgtfjCiUUHd
	v+tys6aQv5z/cjgF++M3i+e5XOBKr4Rx86KIG6ubBd2xct9ndz7M2n3KSSW0cmN8AFIW28XN7iY1B
	Tg2FSJadpUvJAG+Wiztoahx0NwP1TzDNNUl5Hu/89A+UTbgLtdyh6OZQO6F5PYb99Q2u8mzZvkcP2
	FjJ3yWhtBd3WuhIFqyrexwg2Jl6fkTMombrzCKDZpI0moAHeeTR2YcWU+DYkr9bOr7MlBU3CvMo8z
	OevJK1/ZBJq5ZS+QowTd8ueztXQAdBYVYSu5anglRtyvXBq/ie0u/p5xSZKlfLzdb36w80uUkN0tD
	Ioe60EhV19xV2FwCNJSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myX6p-00DZ0I-AA; Sat, 18 Dec 2021 10:38:35 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11] helo=mx1.molgen.mpg.de)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myWvW-00DWP6-Ex
 for linux-mediatek@lists.infradead.org; Sat, 18 Dec 2021 10:26:56 +0000
Received: from [192.168.0.3] (ip5f5aecf3.dynamic.kabel-deutschland.de
 [95.90.236.243])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id DA4BE61E5FE00;
 Sat, 18 Dec 2021 11:26:38 +0100 (CET)
Message-ID: <67f062f9-293b-78aa-6474-f018d4bd269c@molgen.mpg.de>
Date: Sat, 18 Dec 2021 11:26:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH RESEND 1/3] Bluetooth: btmtksdio: add the support of wake
 on bluetooth
Content-Language: en-US
To: Sean Wang <sean.wang@mediatek.com>, Mark Chen <Mark-YW.Chen@mediatek.com>
Cc: Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>, Soul.Huang@mediatek.com,
 YN.Chen@mediatek.com, Leon.Yen@mediatek.com, Eric-SY.Chang@mediatek.com,
 Deren.Wu@mediatek.com, km.lin@mediatek.com, robin.chiu@mediatek.com,
 Eddie.Chen@mediatek.com, ch.yeh@mediatek.com, posh.sun@mediatek.com,
 ted.huang@mediatek.com, Eric.Liang@mediatek.com, Stella.Chang@mediatek.com,
 Tom.Chou@mediatek.com, steve.lee@mediatek.com, jsiuda@google.com,
 frankgor@google.com, jemele@google.com, abhishekpandit@google.com,
 michaelfsun@google.com, mcchou@chromium.org, shawnku@google.com,
 linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <632534014b9b8a38e81dfb5749dcd75e2088adb1.1639787634.git.objelf@gmail.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <632534014b9b8a38e81dfb5749dcd75e2088adb1.1639787634.git.objelf@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211218_022654_715100_BAB292A2 
X-CRM114-Status: GOOD (  21.03  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

RGVhciBTZWFuLCBkZWFyIE1hcmssCgoKQW0gMTguMTIuMjEgdW0gMDI6MDggc2NocmllYiBzZWFu
LndhbmdAbWVkaWF0ZWsuY29tOgo+IEZyb206IE1hcmsgQ2hlbiA8bWFyay15dy5jaGVuQG1lZGlh
dGVrLmNvbT4KClNob3J0ZXIgc3VtbWFyeTogQmx1ZXRvb3RoOiBidG10a3NkaW86IFN1cHBvcnQg
d2FrZSBvbiBibHVldG9vdGgKCj4gQWRkIHRoZSBzdXBwb3J0IHRvIGVuYWJsZSB3YWtlIG9uIGJs
dWV0b290aAoKQ2FuIHlvdSBwbGVhc2UgbGlzdCB0aGUgZGF0YXNoZWV0IG5hbWUgYW5kIHJldmlz
aW9uIHVzZWQgZm9yIHRoZSAKaW1wbGVtZW50YXRpb24uCgpQbGVhc2UgZG9jdW1lbnQgaG93IHlv
dSB0ZXN0ZWQgdGhpcy4KCj4gQ28tZGV2ZWxvcGVkLWJ5OiBTZWFuIFdhbmcgPHNlYW4ud2FuZ0Bt
ZWRpYXRlay5jb20+Cj4gU2lnbmVkLW9mZi1ieTogU2VhbiBXYW5nIDxzZWFuLndhbmdAbWVkaWF0
ZWsuY29tPgo+IFNpZ25lZC1vZmYtYnk6IE1hcmsgQ2hlbiA8bWFyay15dy5jaGVuQG1lZGlhdGVr
LmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvYmx1ZXRvb3RoL2J0bXRrLmggICAgIHwgIDggKysrKysr
KysKPiAgIGRyaXZlcnMvYmx1ZXRvb3RoL2J0bXRrc2Rpby5jIHwgMzEgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmx1ZXRvb3RoL2J0bXRrLmgg
Yi9kcml2ZXJzL2JsdWV0b290aC9idG10ay5oCj4gaW5kZXggNmU3YjBjNzU2N2MwLi4yYmUxZDI2
ODBhZDggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ibHVldG9vdGgvYnRtdGsuaAo+ICsrKyBiL2Ry
aXZlcnMvYmx1ZXRvb3RoL2J0bXRrLmgKPiBAQCAtNjgsNiArNjgsMTQgQEAgc3RydWN0IGJ0bXRr
X3RjaV9zbGVlcCB7Cj4gICAJdTggdGltZV9jb21wZW5zYXRpb247Cj4gICB9IF9fcGFja2VkOwo+
ICAgCj4gK3N0cnVjdCBidG10a193YWtlb24gewo+ICsJdTggbW9kZTsKPiArCXU4IGdwbzsKPiAr
CXU4IGFjdGl2ZV9oaWdoOwo+ICsJX19sZTE2IGVuYWJsZV9kZWxheTsKPiArCV9fbGUxNiB3YWtl
dXBfZGVsYXk7Cj4gK30gX19wYWNrZWQ7Cj4gKwo+ICAgc3RydWN0IGJ0bXRrX2hjaV93bXRfcGFy
YW1zIHsKPiAgIAl1OCBvcDsKPiAgIAl1OCBmbGFnOwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Js
dWV0b290aC9idG10a3NkaW8uYyBiL2RyaXZlcnMvYmx1ZXRvb3RoL2J0bXRrc2Rpby5jCj4gaW5k
ZXggYjVlYThkM2JmZmFhLi43NzE3MzNjZTM2MmIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ibHVl
dG9vdGgvYnRtdGtzZGlvLmMKPiArKysgYi9kcml2ZXJzL2JsdWV0b290aC9idG10a3NkaW8uYwo+
IEBAIC05NTgsNiArOTU4LDMwIEBAIHN0YXRpYyBpbnQgYnRtdGtzZGlvX3NlbmRfZnJhbWUoc3Ry
dWN0IGhjaV9kZXYgKmhkZXYsIHN0cnVjdCBza19idWZmICpza2IpCj4gICAJcmV0dXJuIDA7Cj4g
ICB9Cj4gICAKPiArc3RhdGljIGJvb2wgYnRtdGtfc2Rpb193YWtldXAoc3RydWN0IGhjaV9kZXYg
KmhkZXYpCj4gK3sKPiArCXN0cnVjdCBidG10a3NkaW9fZGV2ICpiZGV2ID0gaGNpX2dldF9kcnZk
YXRhKGhkZXYpOwo+ICsJYm9vbCBtYXlfd2FrZXVwID0gZGV2aWNlX21heV93YWtldXAoYmRldi0+
ZGV2KTsKPiArCXN0cnVjdCBidG10a193YWtlb24gYnRfYXdha2UgPSB7Cj4gKwkJLm1vZGUgPSAw
eDEsCj4gKwkJLmdwbyA9IDAsCj4gKwkJLmFjdGl2ZV9oaWdoID0gMHgxLAo+ICsJCS5lbmFibGVf
ZGVsYXkgPSBjcHVfdG9fbGUxNigweGM4MCksCj4gKwkJLndha2V1cF9kZWxheSA9IGNwdV90b19s
ZTE2KDB4MjApCj4gKwl9Owo+ICsJc3RydWN0IHNrX2J1ZmYgKnNrYjsKPiArCj4gKwlpZiAobWF5
X3dha2V1cCAmJgo+ICsJICAgIGJkZXYtPmRhdGEtPmNoaXBpZCA9PSAweDc5MjEpIHsKCldoeSB0
aGUgY2hlY2sgZm9yIDB4NzkyMT8gSXMgdGhhdCBkZXZpY2Ugb25seSBzdXBwb3J0ZWQ/IFRoZSBj
b21taXQgCm1lc3NhZ2UgZG9lcyBub3Qgc2F5IGFueXRoaW5nIGFib3V0IGl0LgoKPiArCQlza2Ig
PSAgX19oY2lfY21kX3N5bmMoaGRldiwgMHhmYzI3LCBzaXplb2YoYnRfYXdha2UpLAo+ICsJCQkJ
ICAgICAgJmJ0X2F3YWtlLCBIQ0lfQ01EX1RJTUVPVVQpOwo+ICsJCWlmIChJU19FUlIoc2tiKSkK
PiArCQkJbWF5X3dha2V1cCA9IGZhbHNlOwo+ICsJfQo+ICsKPiArCXJldHVybiBtYXlfd2FrZXVw
Owo+ICt9Cj4gKwo+ICAgc3RhdGljIGludCBidG10a3NkaW9fcHJvYmUoc3RydWN0IHNkaW9fZnVu
YyAqZnVuYywKPiAgIAkJCSAgIGNvbnN0IHN0cnVjdCBzZGlvX2RldmljZV9pZCAqaWQpCj4gICB7
Cj4gQEAgLTk5OCw2ICsxMDIyLDcgQEAgc3RhdGljIGludCBidG10a3NkaW9fcHJvYmUoc3RydWN0
IHNkaW9fZnVuYyAqZnVuYywKPiAgIAloZGV2LT5zaHV0ZG93biA9IGJ0bXRrc2Rpb19zaHV0ZG93
bjsKPiAgIAloZGV2LT5zZW5kICAgICA9IGJ0bXRrc2Rpb19zZW5kX2ZyYW1lOwo+ICAgCWhkZXYt
PnNldF9iZGFkZHIgPSBidG10a19zZXRfYmRhZGRyOwo+ICsJaGRldi0+d2FrZXVwID0gYnRtdGtf
c2Rpb193YWtldXA7Cj4gICAKPiAgIAlTRVRfSENJREVWX0RFVihoZGV2LCAmZnVuYy0+ZGV2KTsK
PiAgIAo+IEBAIC0xMDMyLDcgKzEwNTcsMTEgQEAgc3RhdGljIGludCBidG10a3NkaW9fcHJvYmUo
c3RydWN0IHNkaW9fZnVuYyAqZnVuYywKPiAgIAkgKi8KPiAgIAlwbV9ydW50aW1lX3B1dF9ub2lk
bGUoYmRldi0+ZGV2KTsKPiAgIAo+IC0JcmV0dXJuIDA7Cj4gKwllcnIgPSBkZXZpY2VfaW5pdF93
YWtldXAoYmRldi0+ZGV2LCB0cnVlKTsKPiArCWlmIChlcnIpCj4gKwkJYnRfZGV2X2VycihoZGV2
LCAiJXM6IGZhaWxlZCB0byBpbml0X3dha2V1cCIsIF9fZnVuY19fKTsKCkNvdWxkIHRoZSBlcnJv
ciBtZXNzYWdlIGJlIGV4dGVuZGVkLCBzbyBub3JtYWwgdXNlcnMga25vdyB3aGF0IHRvIGRvPyAK
Q3VycmVudGx5IGl04oCZcyBvbmx5IHVzZWZ1bCBmb3IgZGV2ZWxvcGVycy4KCj4gKwo+ICsJcmV0
dXJuIGVycjsKPiAgIH0KPiAgIAo+ICAgc3RhdGljIHZvaWQgYnRtdGtzZGlvX3JlbW92ZShzdHJ1
Y3Qgc2Rpb19mdW5jICpmdW5jKQoKCktpbmQgcmVnYXJkcywKClBhdWwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcg
bGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
