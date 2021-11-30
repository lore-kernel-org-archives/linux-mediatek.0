Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D8FC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Nov 2021 13:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5QB3weT6E+jBtorKIzspBTgq8JXDzfuSEOYF+kKcWYs=; b=GOpOWSZqU73eNH+/m14asNkWSj
	RHhOnjpZ/39tzc8+eBdZrmm8cjxIFCuMUKSS3RO7byYcsbbSlg1nh+a7T2zLaxD6/J2JGMLBS7UEs
	Gco61IVRsxRACGCYFTi35gz6m1NOx2tRP0KTW/84xtjKwzYGpPZ9afrk54UashNtKU8toVoNvWbbU
	G/KQ5ndXP+/l3DI2xTsdULcCyZglA73CDf9n0zoxErrCTjBwF3ja6BRhgzsaW4U/HoZmKdO8jqbGO
	i8J2dSmASFTPZpKOwOvplriCCUKQeBkU1la7h9XPZLuKmyYxagisVjy93osqoTIER6hB7NTk5R5dt
	yVDZOqEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms3HE-005Lzi-Iz; Tue, 30 Nov 2021 13:34:32 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ms3Gz-005LvY-OQ; Tue, 30 Nov 2021 13:34:19 +0000
Received: from [IPv6:2a01:e0a:120:3210:b422:9841:4afb:11b5] (unknown
 [IPv6:2a01:e0a:120:3210:b422:9841:4afb:11b5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: benjamin.gaignard)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 331AC1F450C4;
 Tue, 30 Nov 2021 13:34:11 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1638279251; bh=8dFt0ved6B1YlHXel+R6Z2zNSNgLE7JvZbncVuRC5Qw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=CXXTXeNJfZ9/XZgE6YFUstBI4Ouw4A5FsgohbT2N95JbtcK2UIipznG5/gVg8Sfem
 JCpbIkg8WQz69wj4MwV68UV40duRU21gjgJFkjoUma0tvpF6V3TmFiLdyhORfTItD9
 /R124eq8PRPWQYM4QqhiMUgfBZnzdfyvYb3rb37PdMwAOuSOQGehdscmDifViugAFH
 mEhQ/PuzYsPcY/L0OCUhp4r0Gf/lYpE1D+9ZT3iiYuLqFxocIyV+GNSdae1CRYolzI
 2PMMkcwokvYFBO1SwrmmVUTFgsj8//HfcsE9pyAjEBFQtt3oBrbKPl3TbheQKrlmRO
 8jrbiFcGxJf1A==
Subject: Re: [PATCH v11, 04/19] media: mtk-vcodec: export decoder pm functions
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih
 <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20211129034201.5767-1-yunfei.dong@mediatek.com>
 <20211129034201.5767-5-yunfei.dong@mediatek.com>
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Message-ID: <2fa4e19f-d57c-6264-4284-8387c4182d1f@collabora.com>
Date: Tue, 30 Nov 2021 14:34:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211129034201.5767-5-yunfei.dong@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_053418_051186_79DB1A29 
X-CRM114-Status: GOOD (  18.40  )
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

CkxlIDI5LzExLzIwMjEgw6AgMDQ6NDEsIFl1bmZlaSBEb25nIGEgw6ljcml0wqA6Cj4gUmVnaXN0
ZXIgZWFjaCBoYXJkd2FyZSBhcyBwbGF0Zm9ybSBkZXZpY2UsIG5lZWQgdG8gY2FsbCBwbSBmdW5j
dGlvbnMKPiB0byBvcGVuL2Nsb3NlIHBvd2VyIGFuZCBjbG9jayBmcm9tIG1vZHVsZSBtdGstdmNv
ZGVjLWRlYywgZXhwb3J0IHRoZXNlCj4gZnVuY3Rpb25zLgoKVGhlIGNvbW1pdCBtZXNzYWdlIGNv
bmZ1c2UgbWUsIG1heWJlIHNvbWV0aGluZyBsaWtlOgoiV2hlbiBtdGsgdmNvZGVjIGRlY29kZXIg
aXMgYnVpbGQgYXMgYSBtb2R1bGUgd2UgbmVlZCB0byBleHBvcnQKbXRrLXZjb2RlYy1kZWMgcG0g
ZnVuY3Rpb25zIHRvIG1ha2UgdGhlbSB2aXNpYmxlIGJ5IHRoZSBvdGhlciBjb21wb25lbnRzIgoK
V2l0aCB0aGF0OgpSZXZpZXdlZC1ieTogQmVuamFtaW4gR2FpZ25hcmQgPGJlbmphbWluLmdhaWdu
YXJkQGNvbGxhYm9yYS5jb20+Cgo+Cj4gU2lnbmVkLW9mZi1ieTogWXVuZmVpIERvbmcgPHl1bmZl
aS5kb25nQG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRr
LXZjb2RlYy9tdGtfdmNvZGVjX2RlY19wbS5jIHwgNiArKysrKysKPiAgIDEgZmlsZSBjaGFuZ2Vk
LCA2IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3Jt
L210ay12Y29kZWMvbXRrX3Zjb2RlY19kZWNfcG0uYyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0v
bXRrLXZjb2RlYy9tdGtfdmNvZGVjX2RlY19wbS5jCj4gaW5kZXggMjBiZDE1N2E4NTVjLi4yMjFj
ZjYwZTlmYmYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdmNvZGVj
L210a192Y29kZWNfZGVjX3BtLmMKPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12
Y29kZWMvbXRrX3Zjb2RlY19kZWNfcG0uYwo+IEBAIC03NywxMiArNzcsMTQgQEAgaW50IG10a192
Y29kZWNfaW5pdF9kZWNfcG0oc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwKPiAgIAlwdXRf
ZGV2aWNlKHBtLT5sYXJidmRlYyk7Cj4gICAJcmV0dXJuIHJldDsKPiAgIH0KPiArRVhQT1JUX1NZ
TUJPTF9HUEwobXRrX3Zjb2RlY19pbml0X2RlY19wbSk7Cj4gICAKPiAgIHZvaWQgbXRrX3Zjb2Rl
Y19yZWxlYXNlX2RlY19wbShzdHJ1Y3QgbXRrX3Zjb2RlY19wbSAqcG0pCj4gICB7Cj4gICAJcG1f
cnVudGltZV9kaXNhYmxlKHBtLT5kZXYpOwo+ICAgCXB1dF9kZXZpY2UocG0tPmxhcmJ2ZGVjKTsK
PiAgIH0KPiArRVhQT1JUX1NZTUJPTF9HUEwobXRrX3Zjb2RlY19yZWxlYXNlX2RlY19wbSk7Cj4g
ICAKPiAgIGludCBtdGtfdmNvZGVjX2RlY19wd19vbihzdHJ1Y3QgbXRrX3Zjb2RlY19wbSAqcG0p
Cj4gICB7Cj4gQEAgLTk0LDYgKzk2LDcgQEAgaW50IG10a192Y29kZWNfZGVjX3B3X29uKHN0cnVj
dCBtdGtfdmNvZGVjX3BtICpwbSkKPiAgIAo+ICAgCXJldHVybiByZXQ7Cj4gICB9Cj4gK0VYUE9S
VF9TWU1CT0xfR1BMKG10a192Y29kZWNfZGVjX3B3X29uKTsKPiAgIAo+ICAgdm9pZCBtdGtfdmNv
ZGVjX2RlY19wd19vZmYoc3RydWN0IG10a192Y29kZWNfcG0gKnBtKQo+ICAgewo+IEBAIC0xMDMs
NiArMTA2LDcgQEAgdm9pZCBtdGtfdmNvZGVjX2RlY19wd19vZmYoc3RydWN0IG10a192Y29kZWNf
cG0gKnBtKQo+ICAgCWlmIChyZXQpCj4gICAJCW10a192NGwyX2VycigicG1fcnVudGltZV9wdXRf
c3luYyBmYWlsICVkIiwgcmV0KTsKPiAgIH0KPiArRVhQT1JUX1NZTUJPTF9HUEwobXRrX3Zjb2Rl
Y19kZWNfcHdfb2ZmKTsKPiAgIAo+ICAgdm9pZCBtdGtfdmNvZGVjX2RlY19jbG9ja19vbihzdHJ1
Y3QgbXRrX3Zjb2RlY19wbSAqcG0pCj4gICB7Cj4gQEAgLTEyOSw2ICsxMzMsNyBAQCB2b2lkIG10
a192Y29kZWNfZGVjX2Nsb2NrX29uKHN0cnVjdCBtdGtfdmNvZGVjX3BtICpwbSkKPiAgIAlmb3Ig
KGkgLT0gMTsgaSA+PSAwOyBpLS0pCj4gICAJCWNsa19kaXNhYmxlX3VucHJlcGFyZShkZWNfY2xr
LT5jbGtfaW5mb1tpXS52Y29kZWNfY2xrKTsKPiAgIH0KPiArRVhQT1JUX1NZTUJPTF9HUEwobXRr
X3Zjb2RlY19kZWNfY2xvY2tfb24pOwo+ICAgCj4gICB2b2lkIG10a192Y29kZWNfZGVjX2Nsb2Nr
X29mZihzdHJ1Y3QgbXRrX3Zjb2RlY19wbSAqcG0pCj4gICB7Cj4gQEAgLTEzOSwzICsxNDQsNCBA
QCB2b2lkIG10a192Y29kZWNfZGVjX2Nsb2NrX29mZihzdHJ1Y3QgbXRrX3Zjb2RlY19wbSAqcG0p
Cj4gICAJZm9yIChpID0gZGVjX2Nsay0+Y2xrX251bSAtIDE7IGkgPj0gMDsgaS0tKQo+ICAgCQlj
bGtfZGlzYWJsZV91bnByZXBhcmUoZGVjX2Nsay0+Y2xrX2luZm9baV0udmNvZGVjX2Nsayk7Cj4g
ICB9Cj4gK0VYUE9SVF9TWU1CT0xfR1BMKG10a192Y29kZWNfZGVjX2Nsb2NrX29mZik7CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRl
ayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
