Return-Path: <SRS0=yT6o=PW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D346C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Nov 2021 08:52:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C82D9610E8
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Nov 2021 08:52:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C82D9610E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fgukV/PyAec6YhhpMOFz50Ncafv/wV2N/7oFqDHw7iI=; b=QIhqdxdb9zyVHKiCpv02zHXUeo
	SIVPfLvQ77yudpwvfgZg1+CQij77wpSYvAnxr39laZfjmxAQ8lnFmbffXW/1CXzlN0yd6KGGhGAb3
	Yjo0vQViiklb2+HpFX0iZ99JgOwDVn7E97y4/J1WeU403Bh/ZVfzQxHwsmTuB+i0PQccQ76ou3AdR
	OfyMnr+I96tYt6cu/wlBUV+UOjof8vTQ9+Ph1/KvDCPaAoaEmLDrW2MfQnyD7UFAwtTelfbAwbvtK
	dxG8NGaZjrZkpMuUbpbdJ+q9MrbyfuFzVNk9NMWeASmf4x2ylY32Odi0r5tpHop0Xe3hC69uRE5W2
	0/zgJgvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miBzt-004b7Q-1P; Wed, 03 Nov 2021 08:51:53 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miBzq-004b6n-Iz
 for linux-mediatek@lists.infradead.org; Wed, 03 Nov 2021 08:51:52 +0000
Received: from [IPv6:2a01:e0a:120:3210:b6d1:2f0:214:8c2a] (unknown
 [IPv6:2a01:e0a:120:3210:b6d1:2f0:214:8c2a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: benjamin.gaignard)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B80B31F453FB
 for <linux-mediatek@lists.infradead.org>; Wed,  3 Nov 2021 08:51:46 +0000 (GMT)
Subject: Re: [PATCH v2] media: mtk-vcodec: Align width and height to 64 bytes
To: linux-mediatek@lists.infradead.org
References: <20211103033708.14469-1-yunfei.dong@mediatek.com>
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Message-ID: <e7f4b7e0-7787-9acd-40c6-8f81d9f4bb14@collabora.com>
Date: Wed, 3 Nov 2021 09:51:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211103033708.14469-1-yunfei.dong@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_015150_803883_48034B2F 
X-CRM114-Status: GOOD (  17.37  )
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

CkxlIDAzLzExLzIwMjEgw6AgMDQ6MzcsIFl1bmZlaSBEb25nIGEgw6ljcml0wqA6Cj4gV2lkdGgg
YW5kIGhlaWdodCBuZWVkIHRvIDY0IGJ5dGVzIGFsaWduZWQgd2hlbiBzZXR0aW5nIHRoZSBmb3Jt
YXQuCj4gTmVlZCB0byBtYWtlIHN1cmUgYWxsIGlzIDY0IGJ5dGVzIGFsaWduIHdoZW4gdXNlIHdp
ZHRoIGFuZCBoZWlnaHQgdG8KPiBjYWxjdWxhdGUgYnVmZmVyIHNpemUuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBZdW5mZWkgRG9uZyA8eXVuZmVpLmRvbmdAbWVkaWF0ZWsuY29tPgo+IENoYW5nZS1JZDog
STM5ODg2YjFhNmI0MzNjOTI1NjVkZGJmMjk3ZWIxOTM0NTZlZWMxZDIKClBsZWFzZSByZW1vdmUg
Q2hhbmdlLUlkIHRhZyB3aXRoIHRoYXQ6ClJldmlld2VkLWJ5OiBCZW5qYW1pbiBHYWlnbmFyZCA8
YmVuamFtaW4uZ2FpZ25hcmRAY29sbGFib3JhLmNvbT4KCj4gLS0tCj4gICBkcml2ZXJzL21lZGlh
L3BsYXRmb3JtL210ay12Y29kZWMvbXRrX3Zjb2RlY19kZWMuaCAgICAgICAgfCAxICsKPiAgIGRy
aXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy92ZGVjL3ZkZWNfaDI2NF9yZXFfaWYuYyB8
IDQgKystLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdmNvZGVjL210
a192Y29kZWNfZGVjLmggYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMvbXRrX3Zj
b2RlY19kZWMuaAo+IGluZGV4IGUzMDgwNmMxZmFlYS4uNjZjZDZkMjI0MmMzIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVjX2RlYy5oCj4g
KysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdmNvZGVjL210a192Y29kZWNfZGVjLmgK
PiBAQCAtMTEsNiArMTEsNyBAQAo+ICAgI2luY2x1ZGUgPG1lZGlhL3ZpZGVvYnVmMi1jb3JlLmg+
Cj4gICAjaW5jbHVkZSA8bWVkaWEvdjRsMi1tZW0ybWVtLmg+Cj4gICAKPiArI2RlZmluZSBWQ09E
RUNfREVDX0FMSUdORURfNjQgNjQKPiAgICNkZWZpbmUgVkNPREVDX0NBUEFCSUxJVFlfNEtfRElT
QUJMRUQJMHgxMAo+ICAgI2RlZmluZSBWQ09ERUNfREVDXzRLX0NPREVEX1dJRFRICTQwOTZVCj4g
ICAjZGVmaW5lIFZDT0RFQ19ERUNfNEtfQ09ERURfSEVJR0hUCTIzMDRVCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy92ZGVjL3ZkZWNfaDI2NF9yZXFfaWYu
YyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy92ZGVjL3ZkZWNfaDI2NF9yZXFf
aWYuYwo+IGluZGV4IGQ0MDJmYzRiZGE2OS4uZTFhMzAxMTc3MmE5IDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy92ZGVjL3ZkZWNfaDI2NF9yZXFfaWYuYwo+
ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy92ZGVjL3ZkZWNfaDI2NF9y
ZXFfaWYuYwo+IEBAIC01NjIsOCArNTYyLDggQEAgc3RhdGljIHZvaWQgZ2V0X3BpY19pbmZvKHN0
cnVjdCB2ZGVjX2gyNjRfc2xpY2VfaW5zdCAqaW5zdCwKPiAgIHsKPiAgIAlzdHJ1Y3QgbXRrX3Zj
b2RlY19jdHggKmN0eCA9IGluc3QtPmN0eDsKPiAgIAo+IC0JY3R4LT5waWNpbmZvLmJ1Zl93ID0g
KGN0eC0+cGljaW5mby5waWNfdyArIDE1KSAmIDB4RkZGRkZGRjA7Cj4gLQljdHgtPnBpY2luZm8u
YnVmX2ggPSAoY3R4LT5waWNpbmZvLnBpY19oICsgMzEpICYgMHhGRkZGRkZFMDsKPiArCWN0eC0+
cGljaW5mby5idWZfdyA9IEFMSUdOKGN0eC0+cGljaW5mby5waWNfdywgVkNPREVDX0RFQ19BTElH
TkVEXzY0KTsKPiArCWN0eC0+cGljaW5mby5idWZfaCA9IEFMSUdOKGN0eC0+cGljaW5mby5waWNf
aCwgVkNPREVDX0RFQ19BTElHTkVEXzY0KTsKPiAgIAljdHgtPnBpY2luZm8uZmJfc3pbMF0gPSBj
dHgtPnBpY2luZm8uYnVmX3cgKiBjdHgtPnBpY2luZm8uYnVmX2g7Cj4gICAJY3R4LT5waWNpbmZv
LmZiX3N6WzFdID0gY3R4LT5waWNpbmZvLmZiX3N6WzBdID4+IDE7Cj4gICAJaW5zdC0+dnNpX2N0
eC5kZWMuY2FwX251bV9wbGFuZXMgPQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVr
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tZWRpYXRlawo=
