Return-Path: <SRS0=+aVJ=JH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F43BC433B4
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Apr 2021 03:12:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36F1A611AD
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Apr 2021 03:12:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36F1A611AD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=vivo.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:From:MIME-Version:In-Reply-To:Subject:Cc:To:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=vyew90GVFMUKwWbggw81SKwvl31cKC64NaRf2pHzy0g=; b=BcOyCaB0eLomTTJ+mdikKU1RY
	AQvG5cxpt1TX51QLL4F7yrE2EfYRncdInEcfQDMdL/4vH0SAeMJP8vetJRbjkW46BSA+nUT2v8aod
	JT66d2I4EQDgSQE5zwWtgVUxqzZDciDHIeOmyMlwYH+FtlyVm6sGvaoehkF8JbR8A10+YpjieIDkU
	K2UGyBJDn9T77nKJq3Wwatc+zli2Gd9fdjyVTp/6hzxJcNUhbS5LqbipXSu4Zjw45cfA+c2cxCRMT
	+XDh+mFG4x0qYGSCNcUa0+UZeScEsJ8hMQNwvg1BR4a8RugpOGfdEnutkQESZ8f+keJST6+D2Zah1
	Nxiu/APAg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lV42u-0022Kd-HQ; Sat, 10 Apr 2021 03:12:36 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lV42J-0022Hh-W6; Sat, 10 Apr 2021 03:11:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Date:From:MIME-Version:In-Reply-To:
 Subject:Cc:To:Message-ID:Content-Transfer-Encoding:Content-Type:Sender:
 Reply-To:Content-ID:Content-Description:References;
 bh=SkomsutCKIHzPJrmFYMY9tqtdQLZECwu9MGdq/wDl/Y=; b=Nk0vq5N4daEmGWs2PZ3meAMCxf
 QXorivtFgyevbeziy8ispFTbD+PLbj1qAi0LzDulWtmiAqcAMc2viLps5x/ZqsWSMs3R80OHB45K9
 l3yl78rRQ0Yz8SsUQomlU0tC/OeHa50hvyK4nFbdQIeDZPM8594rb/QD7XCCzJaK5Wsoproyzs7n2
 NczvWJpfaRMS2JSKa3LJ/2Vhan6nf2+SiXeTv1QRNyIeUybnzC1QWLc8x5bxutDVzpM9jI4HNVGoy
 kJwp1BQF+lIrpyEnB1dzuwNWAdQLBg7rf12M+AeT4J0XWCUmvyRWqdZZleXh3WpA/PGzMpOVJeioZ
 lGJldMTw==;
Received: from m176149.mail.qiye.163.com ([59.111.176.149])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lV42F-004uyp-Qv; Sat, 10 Apr 2021 03:11:49 +0000
Received: from vivo.com (wm-9.qy.internal [127.0.0.1])
 by m176149.mail.qiye.163.com (Hmail) with ESMTP id 72DB6282503;
 Sat, 10 Apr 2021 11:11:45 +0800 (CST)
Message-ID: <AKoADwCwDn4bllbdA00CnKoA.3.1618024305455.Hmail.wangqing@vivo.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: =?UTF-8?B?UmU6UmU6IFtQQVRDSF0gd2F0Y2hkb2c6IG10azogc3VwcG9ydCBwcmUtdGltZW91dCB3aGVuIHRoZSBiYXJrIGlycSBpcyBhdmFpbGFibGU=?=
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com
X-Originating-IP: 36.152.145.182
In-Reply-To: <95861c15-0294-ddda-6080-ca15f19eb048@roeck-us.net>
MIME-Version: 1.0
Received: from wangqing@vivo.com( [36.152.145.182) ] by ajax-webmail (
 [127.0.0.1] ) ; Sat, 10 Apr 2021 11:11:45 +0800 (GMT+08:00)
From: =?UTF-8?B?546L5pOO?= <wangqing@vivo.com>
Date: Sat, 10 Apr 2021 11:11:45 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZGU9OGFZMTR5PQkhCGh0eT09VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 hKQ1VLWQY+
X-HM-Sender-Digest: e1kJHlYWEh9ZQU1JTEhOTkhCSUtLN1dZDB4ZWUEPCQ4eV1kSHx4VD1lB
 WUc6MBQ6Pww4DD8VTxkXFxkfOktLOBUwFDpVSFVKTUpDS0lPSEtOTE5JVTMWGhIXVQwaFRwKEhUc
 Ow0SDRRVGBQWRVlXWRILWUFZSE1VSk5JVUpPTlVKQ0lZV1kIAVlBT01PTDcG
X-HM-Tid: 0a78b9c393409395kuws72db6282503
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_201148_241974_2B76A022 
X-CRM114-Status: GOOD (  10.87  )
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

Cj5PbiA0LzkvMjEgNzo0MiBQTSwg546L5pOOIHdyb3RlOgo+PiAKPj4+IE9uIDQvOS8yMSAyOjU1
IEFNLCBXYW5nIFFpbmcgd3JvdGU6Cj4+Pj4gVXNlIHRoZSBiYXJrIGludGVycnVwdCBhcyB0aGUg
cHJldGltZW91dCBub3RpZmllciBpZiBhdmFpbGFibGUuCj4+Pj4KPj4+PiBCeSBkZWZhdWx0LCB0
aGUgcHJldGltZW91dCBub3RpZmljYXRpb24gc2hhbGwgb2NjdXIgb25lIHNlY29uZCBlYXJsaWVy
Cj4+Pj4gdGhhbiB0aGUgdGltZW91dC4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IFdhbmcgUWlu
ZyA8d2FuZ3FpbmdAdml2by5jb20+Cj4+Pj4gLS0tCj4+Pj4gIGRyaXZlcnMvd2F0Y2hkb2cvbXRr
X3dkdC5jIHwgNDcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0t
LQo+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgNDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkK
Pj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3dhdGNoZG9nL210a193ZHQuYyBiL2RyaXZl
cnMvd2F0Y2hkb2cvbXRrX3dkdC5jCj4+Pj4gaW5kZXggOTdjYTk5My4uOGI5MTljYwo+Pj4+IC0t
LSBhL2RyaXZlcnMvd2F0Y2hkb2cvbXRrX3dkdC5jCj4+Pj4gKysrIGIvZHJpdmVycy93YXRjaGRv
Zy9tdGtfd2R0LmMKPj4+PiBAQCAtMjUsNiArMjUsNyBAQAo+Pj4+ICAjaW5jbHVkZSA8bGludXgv
cmVzZXQtY29udHJvbGxlci5oPgo+Pj4+ICAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KPj4+PiAg
I2luY2x1ZGUgPGxpbnV4L3dhdGNoZG9nLmg+Cj4+Pj4gKyNpbmNsdWRlIDxsaW51eC9pbnRlcnJ1
cHQuaD4KPj4+PiAgCj4+Pj4gICNkZWZpbmUgV0RUX01BWF9USU1FT1VUCQkzMQo+Pj4+ICAjZGVm
aW5lIFdEVF9NSU5fVElNRU9VVAkJMQo+Pj4+IEBAIC0yMzQsMTggKzIzNSwzNSBAQCBzdGF0aWMg
aW50IG10a193ZHRfc3RhcnQoc3RydWN0IHdhdGNoZG9nX2RldmljZSAqd2R0X2RldikKPj4+PiAg
CXZvaWQgX19pb21lbSAqd2R0X2Jhc2UgPSBtdGtfd2R0LT53ZHRfYmFzZTsKPj4+PiAgCWludCBy
ZXQ7Cj4+Pj4gIAo+Pj4+IC0JcmV0ID0gbXRrX3dkdF9zZXRfdGltZW91dCh3ZHRfZGV2LCB3ZHRf
ZGV2LT50aW1lb3V0KTsKPj4+PiArCXJldCA9IG10a193ZHRfc2V0X3RpbWVvdXQod2R0X2Rldiwg
d2R0X2Rldi0+dGltZW91dCAtIHdkdF9kZXYtPnByZXRpbWVvdXQpOwo+Pj4KPj4+IFRoYXQgbG9v
a3Mgc3VzcGljaW91c2x5IGxpa2UgdGhlIHJlYWwgd2F0Y2hkb2cgd29uJ3QgaGFwcGVuIGF0IGFs
bC4KPj4+IFdoYXQgd2lsbCBoYXBwZW4gaWYgdGhlIHByZXRpbWVvdXQgZ292ZXJub3IgaXMgc2V0
IHRvIG5vbmUgPwo+Pj4KPj4+IEd1ZW50ZXIKPj4+Cj4+IFRoZSBwcmV0aW1lb3V0IGdvdmVybm9y
IGlzIHBhbmljIGJ5IGRlZmF1bHQuIElmIHByZXRpbWVvdXQgaXMgZW5hYmxlZCBhbmQgdGhlIGdv
dmVybm9yIGlzCj4+IHNldCB0byBub25lLCBpdCBtZWFucyB0aGUgdGltZW91dCBiZWhhdmlvciBk
b2VzIG5vdCBuZWVkIHRvIGJlIHByb2Nlc3NlZCwgb25seSBwcmludGluZy4KPj4gCj4KPlRoYXQg
d2FzIG5vdCBteSBxdWVzdGlvbi4gTXkgcXVlc3Rpb24gd2FzIGlmIHRoZSByZWFsIHRpbWVvdXQg
aGFwcGVucyBpbiB0aGF0IGNhc2UuCj4KPkd1ZW50ZXIKPgpZZXMsIHRoZSByZWFsIHRpbWVvdXQg
d2lsbCBoYXBwZW4uIEFmdGVyIFdEVCB0aW1lb3V0LCBJUlEgaXMgc2VudCBvdXQgaW5zdGVhZCBv
ZiAKcmVzZXQgc2lnbmFsIGZpcnN0LiBJbiBvcmRlciB0byBlbnN1cmUgdGhhdCBDUFUgZG9lcyBu
b3QgZ2V0IHN0dWNrIGFmdGVyIElSUSBpcyBzZW50IG91dCwgCldEVCB3aWxsIHRpbWUgYWdhaW4g
YW5kIHNlbmQgcmVzZXQgc2lnbmFsIHRvIHJlc2V0LgoKVGhhbmtzLgpRaW5nIFdhbmcuDQoNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlh
dGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
