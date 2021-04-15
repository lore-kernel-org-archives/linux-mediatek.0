Return-Path: <SRS0=QSA9=JM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EF3AC433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 09:42:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20B0A61166
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 09:42:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20B0A61166
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=vivo.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:From:MIME-Version:In-Reply-To:Subject:Cc:To:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=5Yer5pzOe8soOubE1O8+nztcpwvvUx23Bo6zVgOrD2c=; b=n8f0CFPWeMwkOCMm+WWld0apq
	2Xsj0RqgYiBWOMabnyOpudKgVpJR1/8GIMqhJh959dd/iCPnB1lLm8UvSKaoadq+mNYmGX65LaLzX
	Ga5zwZFOFYtN0qSAUD9mGJGozJ1mDQAKawOWjW1bBbLkxNaDw9qsTR7YVyum87rO5aATI1ITI5EDK
	jTxsK5MZ1NTuDrXfH9yNzfon3SVv0DwI0xec9/2woo4FV0FK70t8cCfQUA+uA/046Mg/uc0Zw2GkA
	9M33SiZttnJm84kgwEJ1Y78KMxhwqISbrcRxDxeKNhWLlnRMSH8EqOAhjz8OnfAvmAaXcBgLN8Xv5
	HEon/mDsA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWyVx-00FaPC-Vg; Thu, 15 Apr 2021 09:42:22 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWyTw-00FZk6-Vj; Thu, 15 Apr 2021 09:40:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Date:From:MIME-Version:In-Reply-To:
 Subject:Cc:To:Message-ID:Content-Transfer-Encoding:Content-Type:Sender:
 Reply-To:Content-ID:Content-Description:References;
 bh=f7ppJHvR8jCpjvl12mH3Cu/zhEtImNvwtQZGHLiCPXQ=; b=20InZsSHEHuzrRofvTfw8c4ZfJ
 B3DB0UXdkT3oJBcJwXJ3g4/MLb4WmCOq7oxkZ/YDLjSdlSHapiWxrXZHaIGoYGuf/XxpG8Sai8g7V
 LIWgTlN1OYKvK1FPMMa1zoKsXlSUA4IgCveiy2X0XvMcPCM/WdTYJpqG0eKMuE1WH7TgFEH+H242X
 Tqq8GU59962sNoZLBIHl5WSp2fkUpiJ3gJAhXFDwCl35s9YaMmr84Vq4/wQcyGQeF/D2hatU6f9Iq
 K8YnqpoCmSqsWvMuS8dGuRHxWdiolWTAPOpimw8v4iBHQ/XdOa7R5mCZNPzv1aS9yNPVfmuGqRFkd
 A0v2f9uw==;
Received: from m176149.mail.qiye.163.com ([59.111.176.149])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWyTs-008R2Y-Gm; Thu, 15 Apr 2021 09:40:14 +0000
Received: from vivo.com (wm-9.qy.internal [127.0.0.1])
 by m176149.mail.qiye.163.com (Hmail) with ESMTP id 6E7C128308B;
 Thu, 15 Apr 2021 17:40:05 +0800 (CST)
Message-ID: <AAgApgCdDjCicbWFGpPmeaor.3.1618479605424.Hmail.wangqing@vivo.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: =?UTF-8?B?UmU6UmU6IFtQQVRDSCBWM10gd2F0Y2hkb2c6IG10azogc3VwcG9ydCBwcmUtdGltZW91dCB3aGVuIHRoZSBiYXJrIGlycSBpcyBhdmFpbGFibGU=?=
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com
X-Originating-IP: 36.152.145.182
In-Reply-To: <1e60551b-4961-91d6-1ea8-7e3b6becd385@roeck-us.net>
MIME-Version: 1.0
Received: from wangqing@vivo.com( [36.152.145.182) ] by ajax-webmail (
 [127.0.0.1] ) ; Thu, 15 Apr 2021 17:40:05 +0800 (GMT+08:00)
From: =?UTF-8?B?546L5pOO?= <wangqing@vivo.com>
Date: Thu, 15 Apr 2021 17:40:05 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZGk9NSFZDGE0eShlPSh5JTxlVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 hKTFVLWQY+
X-HM-Sender-Digest: e1kJHlYWEh9ZQU1JQ0hPSUlCSEJIN1dZDB4ZWUEPCQ4eV1kSHx4VD1lB
 WUc6Ohw6Cxw4Hz8ROBIYGSw9PAsrFh4aFAlVSFVKTUpDT0xCTUtOTExDVTMWGhIXVQwaFRwKEhUc
 Ow0SDRRVGBQWRVlXWRILWUFZSE1VSk5JVUpPTlVKQ0lZV1kIAVlBTEJDQjcG
X-HM-Tid: 0a78d4e6e6cf9395kuws6e7c128308b
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_024012_922513_B695D486 
X-CRM114-Status: GOOD (  22.13  )
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

Cj5PbiA0LzE0LzIxIDQ6NDggQU0sIFdhbmcgUWluZyB3cm90ZToKPj4gVXNlIHRoZSBiYXJrIGlu
dGVycnVwdCBhcyB0aGUgcHJldGltZW91dCBub3RpZmllciBpZiBhdmFpbGFibGUuCj4+IAo+PiBC
eSBkZWZhdWx0LCB0aGUgcHJldGltZW91dCBub3RpZmljYXRpb24gc2hhbGwgb2NjdXIgb25lIHNl
Y29uZCBlYXJsaWVyCj4+IHRoYW4gdGhlIHRpbWVvdXQuCj4+IAo+PiBWMjoKPj4gLSBwYW5pYygp
IGJ5IGRlZmF1bHQgaWYgV0FUQ0hET0dfUFJFVElNRU9VVF9HT1YgaXMgbm90IGVuYWJsZWQuCj4+
IAo+PiBWMzoKPj4gLSBNb2RpZnkgdGhlIHByZXRpbWVvdXQgYmVoYXZpb3IsIG1hbnVhbGx5IHJl
c2V0IGFmdGVyIHRoZSBwcmV0aW1lb3V0Cj4+IC0gaXMgcHJvY2Vzc2VkIGFuZCB3YWl0IHVudGls
IHRpbWVvdXQuCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBXYW5nIFFpbmcgPHdhbmdxaW5nQHZpdm8u
Y29tPgo+PiAtLS0KPj4gIGRyaXZlcnMvd2F0Y2hkb2cvbXRrX3dkdC5jIHwgNjIgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLQo+PiAgMSBmaWxlIGNoYW5nZWQs
IDU3IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4+IAo+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy93YXRjaGRvZy9tdGtfd2R0LmMgYi9kcml2ZXJzL3dhdGNoZG9nL210a193ZHQuYwo+PiBp
bmRleCA5N2NhOTkzLi43YmVmMWUzCj4+IC0tLSBhL2RyaXZlcnMvd2F0Y2hkb2cvbXRrX3dkdC5j
Cj4+ICsrKyBiL2RyaXZlcnMvd2F0Y2hkb2cvbXRrX3dkdC5jCj4+IEBAIC0yNSw2ICsyNSw3IEBA
Cj4+ICAjaW5jbHVkZSA8bGludXgvcmVzZXQtY29udHJvbGxlci5oPgo+PiAgI2luY2x1ZGUgPGxp
bnV4L3R5cGVzLmg+Cj4+ICAjaW5jbHVkZSA8bGludXgvd2F0Y2hkb2cuaD4KPj4gKyNpbmNsdWRl
IDxsaW51eC9pbnRlcnJ1cHQuaD4KPj4gIAo+PiAgI2RlZmluZSBXRFRfTUFYX1RJTUVPVVQJCTMx
Cj4+ICAjZGVmaW5lIFdEVF9NSU5fVElNRU9VVAkJMQo+PiBAQCAtMjM0LDE4ICsyMzUsNDYgQEAg
c3RhdGljIGludCBtdGtfd2R0X3N0YXJ0KHN0cnVjdCB3YXRjaGRvZ19kZXZpY2UgKndkdF9kZXYp
Cj4+ICAJdm9pZCBfX2lvbWVtICp3ZHRfYmFzZSA9IG10a193ZHQtPndkdF9iYXNlOwo+PiAgCWlu
dCByZXQ7Cj4+ICAKPj4gLQlyZXQgPSBtdGtfd2R0X3NldF90aW1lb3V0KHdkdF9kZXYsIHdkdF9k
ZXYtPnRpbWVvdXQpOwo+PiArCXJldCA9IG10a193ZHRfc2V0X3RpbWVvdXQod2R0X2Rldiwgd2R0
X2Rldi0+dGltZW91dCAtIHdkdF9kZXYtPnByZXRpbWVvdXQpOwo+PiAgCWlmIChyZXQgPCAwKQo+
PiAgCQlyZXR1cm4gcmV0Owo+PiAgCj4+ICAJcmVnID0gaW9yZWFkMzIod2R0X2Jhc2UgKyBXRFRf
TU9ERSk7Cj4+IC0JcmVnICY9IH4oV0RUX01PREVfSVJRX0VOIHwgV0RUX01PREVfRFVBTF9FTik7
Cj4+ICsJcmVnICY9IH5XRFRfTU9ERV9JUlFfRU47Cj4+ICsJaWYgKHdkdF9kZXYtPnByZXRpbWVv
dXQpCj4+ICsJCXJlZyB8PSBXRFRfTU9ERV9JUlFfRU47Cj4+ICsJZWxzZQo+PiArCQlyZWcgJj0g
fldEVF9NT0RFX0lSUV9FTjsKPj4gIAlyZWcgfD0gKFdEVF9NT0RFX0VOIHwgV0RUX01PREVfS0VZ
KTsKPj4gIAlpb3dyaXRlMzIocmVnLCB3ZHRfYmFzZSArIFdEVF9NT0RFKTsKPj4gIAo+PiAgCXJl
dHVybiAwOwo+PiAgfQo+PiAgCj4+ICtzdGF0aWMgaW50IG10a193ZHRfc2V0X3ByZXRpbWVvdXQo
c3RydWN0IHdhdGNoZG9nX2RldmljZSAqd2RkLAo+PiArCQkJCSAgIHVuc2lnbmVkIGludCB0aW1l
b3V0KQo+PiArewo+PiArCXdkZC0+cHJldGltZW91dCA9IHRpbWVvdXQ7Cj4+ICsJcmV0dXJuIG10
a193ZHRfc3RhcnQod2RkKTsKPgo+VGhlIHdhdGNoZG9nIGlzIG5vdCBuZWNlc3NhcmlseSBhY3Rp
dmUgaGVyZS4KPgo+PiArfQo+PiArCj4+ICtzdGF0aWMgaXJxcmV0dXJuX3QgbXRrX3dkdF9pc3Io
aW50IGlycSwgdm9pZCAqYXJnKQo+PiArewo+PiArCXN0cnVjdCB3YXRjaGRvZ19kZXZpY2UgKndk
ZCA9IGFyZzsKPj4gKwlzdHJ1Y3QgbXRrX3dkdF9kZXYgKm10a193ZHQgPSB3YXRjaGRvZ19nZXRf
ZHJ2ZGF0YSh3ZGQpOwo+PiArCXZvaWQgX19pb21lbSAqd2R0X2Jhc2UgPSBtdGtfd2R0LT53ZHRf
YmFzZTsKPj4gKwo+PiArCXdhdGNoZG9nX25vdGlmeV9wcmV0aW1lb3V0KHdkZCk7Cj4+ICsJLyoK
Pj4gKwkgKiBHdWFyYW50ZWVkIHRvIGJlIHJlc2V0IHdoZW4gdGhlIHRpbWVvdXQKPj4gKwkgKiBl
eHBpcmVzIHVuZGVyIGFueSBzaXR1YXRpb25zCj4+ICsJICovCj4+ICsJbWRlbGF5KDEwMDAqd2Rk
LT5wcmV0aW1lb3V0KTsKPgo+VGhhdCBpcyBub3QgaG93IHRoaXMgaXMgc3VwcG9zZWQgdG8gd29y
ay4gVGhlIGlkZWEgd2l0aCBhIHByZXRpbWVvdXQgaXMgdGhhdCB0aGUKPnJlYWwgd2F0Y2hkb2cg
cmVzZXQgd2lsbCBoYXBwZW4gdW5kZXIgYWxsIGNpcmN1bXN0YW5jZXMsIGFuZCB0aGF0IGV4ZWN1
dGluZwo+dGhlIHByZXRpbWVvdXQgKGFuZCBjaGFuZ2luZyBzb21lIGhhcmR3YXJlIHJlZ2lzdGVy
cykgaXMgbm90IGEgcHJlcmVxdWlzaXRlCj5mb3IgdGhlIHJlYWwgdGltZW91dCB0byBoYXBwZW4u
IEFmdGVyIGFsbCwgdGhlIHN5c3RlbSBjb3VsZCBiZSBzdHVjayBoYXJkLCB3aXRoCj5pbnRlcnJ1
cHRzIGRpc2FibGVkLgo+Cj5PbiB0b3Agb2YgdGhhdCwganVzdCBzbGVlcGluZyBoZXJlIHdoaWxl
IHdhaXRpbmcgZm9yIHRoZSByZWFsIHRpbWVvdXQgYW5kCj50aGVuIHJlc2V0dGluZyB0aGUgc3lz
dGVtIGlzbid0IHRoZSBpZGVhIGVpdGhlci4gT24gYSBzaW5nbGUgY29yZSBzeXN0ZW0gdGhpcwo+
d2lsbCBqdXN0IGhhbmcuIE9uIGEgbXVsdGktY29yZSBzeXN0ZW0sIHdobyBrbm93cyBpZiB1c2Vy
c3BhY2UgbWFuYWdlZCB0byBwaW5nCj50aGUgd2F0Y2hkb2cgaW4gdGhlIG1lYW50aW1lLgo+Cj5V
bmxlc3MgdGhlcmUgaXMgYSBtZWFucyB0byB0cmlnZ2VyIHRoZSB3YXRjaGRvZyB0d2ljZSwgd2l0
aG91dCBpbnRlcnZlbnRpb24sCj50aGUgZmlyc3QgdGltZSBnZW5lcmF0aW5nIGFuIGludGVycnVw
dCBhbmQgdGhlIHNlY29uZCB0aW1lIHJlc2V0dGluZyB0aGUgc3lzdGVtLAo+dGhlcmUgaXMgbm8g
d2F5IGZvciB0aGlzIHRvIHdvcmsuIEkgZG9uJ3Qgc2VlIGhvdyB0aGlzIGNoaXAgcmVhbGx5IHN1
cHBvcnRzCj5wcmV0aW1lb3V0LiBJdCBzZWVtcyB0aGF0IGl0IHN1cHBvcnRzIGVpdGhlciBhIGhh
cmQgcmVzZXQgb3IgZ2VuZXJhdGluZyBhbgo+aW50ZXJydXB0IG9uIHdhdGNoZG9nIHRpbWVvdXQs
IGFuZCB0aGVyZSBpcyBvbmx5IGEgc2luZ2xlIHRpbWVvdXQuCj4KPklmIHlvdSBoYXZlIGEgdXNl
IGNhc2UgZm9yIGdlbmVyYXRpbmcgYW4gaW50ZXJydXB0IGFuZCByZXNldHRpbmcgdGhlIHN5c3Rl
bSB2aWEKPnNvZnR3YXJlIChpZSBwYW5pYykgX2luc3RlYWRfIG9mIGhhdmluZyBpdCBnZW5lcmF0
ZSBhIGhhcmQgcmVzZXQsIHBsZWFzZSBmZWVsCj5mcmVlIHRvIHN1Ym1pdCBhIHBhdGNoIGFsb25n
IHRoYXQgbGluZSwgdG9nZXRoZXIgd2l0aCBhIGRlc2NyaXB0aW9uIG9mIGl0cyB1c2UKPmNhc2Uu
Cj4KPlRoYW5rcywKPkd1ZW50ZXIKPgoKWWVzLCBhcyBtZW50aW9uZWQgYmVmb3JlLCB0aGUgYmVo
YXZpb3Igb2YgV0RUX01PREVfSVJRX0VOIGlzIHVzZSBpcnEgaW5zdGVhZCBvZgpyZXNldCwgc28g
d2UgbXVzdCB1c2UgV0RUX01PREVfSVJRX0VOIHwgV0RUX01PREVfRFVBTF9FTiBpZiBsaWtlIHlv
dSBzYWlkCiJ0aGUgZmlyc3QgdGltZSBnZW5lcmF0aW5nIGFuIGludGVycnVwdCBhbmQgdGhlIHNl
Y29uZCB0aW1lIHJlc2V0dGluZyB0aGUgc3lzdGVtIiAuIAoKVGhlIER1YWwgbW9kZSBpcyBtZW50
aW9uZWQgaW4gdGhlIE1USyBkYXRhc2hlZXQ6CkluIHRoaXMgbW9kZSwgdGhlIHdhdGNoZG9nIHdp
bGwgYmUgQVVUTy1SRVNUQVJUIGFmdGVyIGludGVycnVwdCBpcyB0cmlnZ2VyZWQuIApBUCBuZWVk
IHRvIGNsZWFyIFdEVF9TVEEgYWZ0ZXIgcmVjZWl2aW5nIGludGVycnVwdCBmcm9tIFRPUFJHVSwg
b3Igc3lzdGVtIHJlc2V0CndpbGwgYmUgdHJpZ2dlcmVkIGFmdGVyIHdhdGNoZG9nIHRpbWVyIGV4
cGlyZXMuCkluc3RydWN0aW9ucyBmb3IgdXNl77yaClNldCB3ZHRfZW4gPSAxJ2IxLgpTZXQgZHVh
bF9tb2RlID0gMSdiMS4KU2V0IHdkdF9pcnEgPSAxJ2IxLgoKV2UgY2FuIHVzZSBEdWFsIG1vZGUg
dG8gYWNoaWV2ZSBwcmV0aW1lb3V0IGJlaGF2aW9yLCBvbmx5IGluIHRoaXMgd2F5IGNhbiB3ZQpn
ZXQgbW9yZSBpbmZvcm1hdGlvbiBkdXJpbmcgcHJldGltZW91dCBwcm9jZXNzaW5nLCBpbnN0ZWFk
IG9mIGRpcmVjdGx5IHJlc2V0dGluZy4KClRoYW5rcywKUWluZw0KDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxp
c3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
