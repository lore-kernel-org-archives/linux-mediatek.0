Return-Path: <SRS0=eBCQ=PV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10639C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Nov 2021 20:29:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C784860F24
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Nov 2021 20:29:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C784860F24
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9MfnqcZDumF9yCIYbmB1b9bOkQ829N138xGwga3R578=; b=eFeOhKDbUVa2l2
	g6iJADjxv00ZDAc/ht3bLtOPvYsC4YKPT99owA1xRrVUjI9g9TGo3dpenf7j5fjICHy8lRcfuUjbi
	N/3BTjnnekraAIGdYP9JaX4FcVOOcVuCnwMm5eDubL/YDkqAjCnFg57uoXgryugVn9L0ptrnZdU3d
	h5dXiFR+2lnwJlc559a1fHjIbplbN2UmsgcOZkzyZBA7xDbg3qto4R+BW3t8pxhHuGv4nJHGMp5Vu
	VSNCMeZEkrKXueb37iXeHxKumn7AVeQgkrNJhwZHG1ghh+P2OOyOQFv5VXd7DMf7wL8QB5JD5ieso
	2yjzAgnuqdNt3pZmbQlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mi0PR-002xlk-UO; Tue, 02 Nov 2021 20:29:29 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mi0PD-002xiG-7c; Tue, 02 Nov 2021 20:29:16 +0000
Received: by mail-pl1-x62f.google.com with SMTP id k4so639706plx.8;
 Tue, 02 Nov 2021 13:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ASvQxlxAVGYLBZy3FRlgidRj0lB1RSeDDIKlWnkx2iQ=;
 b=bztVHwVFpXxe662jLU5Ha8INsXKDbOrNo4owUkA3pngVscqRCwaeIeQOVyU0HIe4mG
 3bht0HD3gMDI3V8X2RJhayc6ai3Xh7Gt3AyjSbMYn2XUzaqXktozk3e9MleXSE+yZ6ia
 mJ3zaJ1V65szqLeT6OS4t4oio9x4GZgR/zEh9h/7M+dP+Ej81zLAeGdBafDqPVATRDmz
 YZJLm54vCQdCc2fVbrJ1SXK8lmi2DWAHWs/Erx58kX9PTx0YSYH3fNNaMSFTGSvOIXRI
 6deU39OuqPkorqBafEFsGjNaKtCB+PfQUIfpmmxfuigGRoUyTCzCjigCcC/aFpSHmXrZ
 S+sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ASvQxlxAVGYLBZy3FRlgidRj0lB1RSeDDIKlWnkx2iQ=;
 b=XGfIbVb8aEon1//tAajegPHRb90RdZmmsjrJS4bUFUtryqkxydIAWvVRp0J2E0onHB
 yAVp/7fWyJ73vBjAtZ5Loe5e3Ie/r4HTZkkGQYoB1oT0rRe5hzwEjiJfAEcp5F3++J7D
 qdP2mDIxBv5ScR2IXRBqh7sV0/vkeqr1N9BkTJitIdlSj2F0n1UIDjWfqTOjqsbfjvtu
 Uq8mDiatcvBDZnBaVjMINXjTM+R/hQmnNjarAowoT2idR6NUvRE3WfSnsKYhEqmisrU1
 ZZz9VkZn7ydcTWwir9Aq4Co3FO4vq8CQGVEUh/hoIza9BhFQddI1dTZvLMKynDdSblGj
 /rMw==
X-Gm-Message-State: AOAM533VHWAvEWsPNgrNkjDcUD+PhucApf8cuSPOHHTCi8Gvu+zYANGs
 aWkj7SBaaVBZkg3dXNIitHs=
X-Google-Smtp-Source: ABdhPJwQWOSRDMVpCoA0MibNGqmhIadvvk+nBvXOFjIlvs3rLi+GvnIzMJAYxZYj9fT8T4AqxjlDvw==
X-Received: by 2002:a17:90a:9915:: with SMTP id
 b21mr9366166pjp.195.1635884948422; 
 Tue, 02 Nov 2021 13:29:08 -0700 (PDT)
Received: from [192.168.50.189] (67.218.130.61.16clouds.com. [67.218.130.61])
 by smtp.gmail.com with ESMTPSA id rj2sm12pjb.32.2021.11.02.13.29.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 13:29:08 -0700 (PDT)
Message-ID: <62d0ac30-f2b9-f58c-cb1e-215ccb455753@gmail.com>
Date: Wed, 3 Nov 2021 04:29:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2] usb: core: reduce power-on-good delay time of root hub
Content-Language: en-US
To: Mathias Nyman <mathias.nyman@linux.intel.com>,
 Alan Stern <stern@rowland.harvard.edu>,
 Mathias Nyman <mathias.nyman@intel.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nishad Kamdar <nishadkamdar@gmail.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Eddie Hung <eddie.hung@mediatek.com>
References: <1618017645-12259-1-git-send-email-chunfeng.yun@mediatek.com>
 <5e907ccd-40bb-2ece-fe05-1a65a74f3aa2@gmail.com>
 <20211101140613.GC1456700@rowland.harvard.edu>
 <3cf46eaf-5443-30df-6d72-b92a6a518afc@linux.intel.com>
From: "Walt Jr. Brake" <mr.yming81@gmail.com>
In-Reply-To: <3cf46eaf-5443-30df-6d72-b92a6a518afc@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_132915_313889_87D42E1B 
X-CRM114-Status: GOOD (  23.55  )
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

T24gMi8xMS8yMDIxIDE3OjA1LCBNYXRoaWFzIE55bWFuIHdyb3RlOgo+IE9uIDEuMTEuMjAyMSAx
Ni4wNiwgQWxhbiBTdGVybiB3cm90ZToKPj4gT24gU2F0LCBPY3QgMzAsIDIwMjEgYXQgMTI6NDk6
MzdQTSArMDgwMCwgV2FsdCBKci4gQnJha2Ugd3JvdGU6Cj4+PiBUaGlzIHBhdGNoIG1ha2UgVVNC
IDMuMSBkZXZpY2UgY2Fubm90IGJlIGRldGVjdGVkLCBhbmQgSSByZXBvcnQgdGhlIGJ1ZyBbMV0K
Pj4+IHRvIGFyY2hsaW51eCB0aHJlZSBtb250aCBhZ28uIFllc3RlcmRheSBJIHRyeSB0byBmaXgg
aXQgbXlzZWxmLCBhbmQgYWZ0ZXIgSQo+Pj4gcmV2ZXJ0IHRoaXMgcGF0Y2gsIGNvbXBpbGUgdGhl
IGtlcm5lbCBhbmQgdGVzdCwgaXQgd29ya3MuCj4+Pgo+Pj4gWzFdIGh0dHBzOi8vYnVncy5hcmNo
bGludXgub3JnL3Rhc2svNzE2NjA/cHJvamVjdD0xJnBhZ2VudW09Mgo+Pj4KPj4+Cj4+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy91c2IvY29yZS9odWIuaCBiL2RyaXZlcnMvdXNiL2NvcmUvaHViLmgK
Pj4+IGluZGV4IDIyZWExZjRmMmQ2Ni4uNzNmNDQ4MmQ4MzNhIDEwMDY0NAo+Pj4gLS0tIGEvZHJp
dmVycy91c2IvY29yZS9odWIuaAo+Pj4gKysrIGIvZHJpdmVycy91c2IvY29yZS9odWIuaAo+Pj4g
QEAgLTE0OCwxMCArMTQ4LDggQEAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBodWJfcG93ZXJfb25f
Z29vZF9kZWxheShzdHJ1Y3QKPj4+IHVzYl9odWIgKmh1YikKPj4+ICDCoHsKPj4+ICDCoMKgwqDC
oMKgwqDCoCB1bnNpZ25lZCBkZWxheSA9IGh1Yi0+ZGVzY3JpcHRvci0+YlB3ck9uMlB3ckdvb2Qg
KiAyOwo+Pj4KPj4+IC3CoMKgwqDCoMKgwqAgaWYgKCFodWItPmhkZXYtPnBhcmVudCkgLyogcm9v
dCBodWIgKi8KPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBkZWxheTsK
Pj4+IC3CoMKgwqDCoMKgwqAgZWxzZSAvKiBXYWl0IGF0IGxlYXN0IDEwMCBtc2VjIGZvciBwb3dl
ciB0byBiZWNvbWUgc3RhYmxlICovCj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBy
ZXR1cm4gbWF4KGRlbGF5LCAxMDBVKTsKPj4+ICvCoMKgwqDCoMKgwqAgLyogV2FpdCBhdCBsZWFz
dCAxMDAgbXNlYyBmb3IgcG93ZXIgdG8gYmVjb21lIHN0YWJsZSAqLwo+Pj4gK8KgwqDCoMKgwqDC
oCByZXR1cm4gbWF4KGRlbGF5LCAxMDBVKTsKPj4+ICDCoH0KPj4gTWF0aGlhczoKPj4KPj4gSXQg
bG9va3MgbGlrZSB0aGUgYlB3ck9uMlB3ckdvb2QgdmFsdWUgaW4geGhjaS1oY2QncyBodWIgZGVz
Y3JpcHRvciBpcwo+PiB0b28gc21hbGwgZm9yIHNvbWUgVVNCIDMuMSBkZXZpY2VzLgo+Pgo+PiBD
YW4geW91IGxvb2sgaW50byB0aGlzPwo+Pgo+PiBBbGFuIFN0ZXJuCj4+Cj4gQXQgZmlyc3QgZ2xh
bmNlIHRoZSB4aGNpIHJvb3RodWIgYlB3ck9uMlB3ckdvb2QgdmFsdWUgbG9va3Mgb2suCj4geGhj
aSBzcGVjIDUuNC44IHN0YXRlcyBzb2Z0d2FyZSBzaG91bGQgd2FpdCAyMG1zIGFmdGVyIGFzc2Vy
dGluZyBQUCwgYmVmb3JlCj4gYXR0ZW1wdGluZyB0byBjaGFuZ2UgdGhlIHN0YXRlIG9mIHRoZSBw
b3J0Lgo+Cj4geGhjaSBkcml2ZXIgc2V0cyBkZXNjLT5iUHdyT24yUHdyR29vZCA9IDEwOyAoMm1z
IGludGVydmFsLCBzbyBlcXVhbHMgMjBtcyApCj4KPiBXZSBzaG91bGQgcHJvYmFibHkgZ2V0IHRo
aXMgd29ya2luZyBpbW1lZGlhdGVseSwgc28gbWF5YmUgcmV2ZXJ0IHRoYXQgcGF0Y2gKPiB3aGls
ZSBsb29raW5nIGludG8gdGhlIHJvb3RjYXVzZS4KPgo+IFdhbHQgSnIuIEJyYWtlLCBpbnN0ZWFk
IG9mIHJldmVydGluZyB0aGF0IHBhdGNoLCBjb3VsZCB5b3UgdGVzdCBpZiBjaGFuZ2luZyB0aGUK
PiB4aGNpIHJvb3RodWIgYlB3ck9uMlB3ckdvb2QgdmFsdWUgaGVscHMuCj4KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy91c2IvaG9zdC94aGNpLWh1Yi5jIGIvZHJpdmVycy91c2IvaG9zdC94aGNpLWh1
Yi5jCj4gaW5kZXggYTNmODc1ZWVhNzUxLi43NTYyMzFhNTU2MDIgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy91c2IvaG9zdC94aGNpLWh1Yi5jCj4gKysrIGIvZHJpdmVycy91c2IvaG9zdC94aGNpLWh1
Yi5jCj4gQEAgLTI1Nyw3ICsyNTcsNyBAQCBzdGF0aWMgdm9pZCB4aGNpX2NvbW1vbl9odWJfZGVz
Y3JpcHRvcihzdHJ1Y3QgeGhjaV9oY2QgKnhoY2ksCj4gICB7Cj4gICAgICAgICAgdTE2IHRlbXA7
Cj4gICAKPiAtICAgICAgIGRlc2MtPmJQd3JPbjJQd3JHb29kID0gMTA7ICAgICAgLyogeGhjaSBz
ZWN0aW9uIDUuNC45IHNheXMgMjBtcyBtYXggKi8KPiArICAgICAgIGRlc2MtPmJQd3JPbjJQd3JH
b29kID0gNTA7ICAgICAgLyogVGhlIDIwbXMgaW4geGhjaSA1LjQuOCBpc24ndCBlbm91Z2ggZm9y
IFVTQiAzLjEgKi8KPiAgICAgICAgICBkZXNjLT5iSHViQ29udHJDdXJyZW50ID0gMDsKPiAgIAo+
ICAgICAgICAgIGRlc2MtPmJOYnJQb3J0cyA9IHBvcnRzOwo+Cj4gVGhhbmtzCj4gLU1hdGhpYXMK
Ck1hdGhpYXM6CgpTb3JyeSB0byByZXBseSBsYXRlbHkuIEkgdGVzdCB3aXRoIHlvdXIgcGF0Y2gs
IGl0IHdvcmtzLgoKSSBhbHNvIHRlc3Qgd2l0aCBzZXR0aW5nIGJQd3JPbjJQd3JHb29kIHRvIDQ1
LCBhbmQgaXQgbm90IHdvcmsuCgpTZWVtcyB0aGF0IHRoZSBtaW5pbWFsIHZhbHVlIHNob3VsZCBi
ZSA1MCBmb3IgdGhpcyBjYXNlLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbWVkaWF0ZWsK
