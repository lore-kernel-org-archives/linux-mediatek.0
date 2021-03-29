Return-Path: <SRS0=9jr7=I3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25DD3C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 23:08:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97B3C61935
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 23:08:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97B3C61935
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=70gz85yJ1Rq5VgnAhA3Q18fGHWMpnUA5rlyGhPtMJtM=; b=QtPLi9TeJk0+X193ugJpopOym
	bphm7CYdnBbtUcDq184rataklLdpzA0Fce/0auVHYYiikl8X33S5MQQ0E9lxeClx84n+5DxyEWe2H
	T5WJRKFFWwHbb4Hf6Htaony6sZRQvPdIgEjN/ZZQpN4Jb0+Tpzmv27zLgBNSrOphm1oqCy34olDYv
	YlcQEgpxkUhTifeLGekMaYvmu8f1nSkpvedodbiMCHE5mQKiO2q6M2SKLtS8f4TIsVUWnp4FatChe
	mw1rHgQ4AiThIFrfQvgFuoOtF4NezkEQzMIy4ukVAxPT0uGTTFWZCI1CwHgAkDiqqXT5eiqyQlu2v
	nUnXOj6IA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR0zG-001qGX-16; Mon, 29 Mar 2021 23:07:58 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQtyl-000jyi-0T; Mon, 29 Mar 2021 15:39:11 +0000
Received: by mail-wr1-x42b.google.com with SMTP id x7so13311992wrw.10;
 Mon, 29 Mar 2021 08:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=S1lZrYa4RgkGtFeObfBwaH9rh2684UNbDqMBiRRBdv8=;
 b=odZbbv5rUQgy7f+7QYYAnbvqRWxOrNggdNRJaRcxvSBFtdAP0l3Efa7CY2YrLQREba
 06oUdKMVlKGELOWCJG/zQendxvtiLaXqHp1tQhetrGnCyPhsnzqccznG7mNIUaasgM0a
 I2X44glX8CM6VUZ1NWnJRlx8dmMyJ31mvti/HH56/OLbpWwheX1y+6d2pfGp0SQdcT1c
 oxuE9/W9tpDT7/zdB/KFhBtyzIpi6E56HOYO9u9YZpz+1IvahHkH+YOW3Y1/gnCOPzcW
 fzU/tUv0vnwvjXJnHeF73IiKs8lvJwEdCKPNzFYK8do1GD4cxfabJ1YTW3VC+IB9Z3gd
 GBXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=S1lZrYa4RgkGtFeObfBwaH9rh2684UNbDqMBiRRBdv8=;
 b=Hwy3g+q/NtV84nJ6zbFTvdsSOONrNoY45FLv+98dRigChlwQrjLbHF1tRJ9rLUOz1s
 b8xCIp4CuzQcOzxnVXLK7y22aAbX5xiys2/FYre5ewJruzVa4LwxOx5rPAuqi18wTC4h
 9drp0MUjqqc3lek1ZN9r0tTmj7LBozVKAat6A4DKaPzYhCF63ei95+ggkiu8F2g88EKk
 7o/UDbwVTZTVEr+Sw6RI22FFJOjSIG2QqNGhzmU4/NPXozI/cIUudSaATzQijNXOK0TL
 CA5WH30924Us978xmvcM3Qsj1Kg/Y1CnINw1SKMYZPTbWm4rVihszr2XapDSGx46NvCC
 DRpw==
X-Gm-Message-State: AOAM530mCsMywzhqrg7FFXGYOuymssnMyVmvNSofwS1ez2pLmI3OofNI
 VFUQznAhAefj8M0xB9fMJeV8dnm/YmKtRI7J
X-Google-Smtp-Source: ABdhPJyya11CowoA7VEiWPCnbakkjzZDIiLpDg04ysh56Z7tU0L0hIE/aPfdwMl/6YmU2Gjo2Shg0Q==
X-Received: by 2002:adf:8523:: with SMTP id 32mr15610137wrh.375.1617032338241; 
 Mon, 29 Mar 2021 08:38:58 -0700 (PDT)
Received: from ziggy.stardust (80.174.240.175.dyn.user.ono.com.
 [80.174.240.175])
 by smtp.gmail.com with ESMTPSA id p16sm34875137wrt.54.2021.03.29.08.38.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Mar 2021 08:38:57 -0700 (PDT)
Subject: Re: [PATCH v7 04/11] mfd: mt6360: Combine mt6360 pmic/ldo resources
 into mt6360 regulator resources
To: Gene Chen <gene.chen.richtek@gmail.com>, Lee Jones <lee.jones@linaro.org>
Cc: sre@kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-pm@vger.kernel.org, devicetree <devicetree@vger.kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Gene Chen <gene_chen@richtek.com>, Wilma.Wu@mediatek.com,
 shufan_lee@richtek.com, ChiYuan Huang <cy_huang@richtek.com>,
 benjamin.chao@mediatek.com
References: <1605177598-23501-1-git-send-email-gene.chen.richtek@gmail.com>
 <1605177598-23501-5-git-send-email-gene.chen.richtek@gmail.com>
 <74b127eb-9a3c-20c9-5692-b00b982f4da3@gmail.com>
 <CAE+NS34qR9f2LOpvxTBDF4OR=Xq-SFP+uHdWe3dZ5x8xggS8kA@mail.gmail.com>
 <20210115073241.GC3975472@dell>
 <CAE+NS37hVMVJA04ZmdcfKvw05ga1-vT=fGRAf=bh17XOJHEh4A@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <496b647d-35e4-59c1-71ad-f3cc6ffee287@gmail.com>
Date: Mon, 29 Mar 2021 17:38:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAE+NS37hVMVJA04ZmdcfKvw05ga1-vT=fGRAf=bh17XOJHEh4A@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_163909_003837_757B9AAF 
X-CRM114-Status: GOOD (  20.98  )
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

CgpPbiAwMi8wMy8yMDIxIDA4OjE2LCBHZW5lIENoZW4gd3JvdGU6Cj4gTGVlIEpvbmVzIDxsZWUu
am9uZXNAbGluYXJvLm9yZz4g5pa8IDIwMjHlubQx5pyIMTXml6Ug6YCx5LqUIOS4i+WNiDM6MzLl
r6vpgZPvvJoKPj4KPj4gT24gRnJpLCAxNSBKYW4gMjAyMSwgR2VuZSBDaGVuIHdyb3RlOgo+Pgo+
Pj4gTWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT4g5pa8IDIwMjHlubQx
5pyIMTLml6Ug6YCx5LqMIOS4i+WNiDg6MzLlr6vpgZPvvJoKPj4+Pgo+Pj4+Cj4+Pj4KPj4+PiBP
biAxMi8xMS8yMDIwIDExOjM5LCBHZW5lIENoZW4gd3JvdGU6Cj4+Pj4+IEZyb206IEdlbmUgQ2hl
biA8Z2VuZV9jaGVuQHJpY2h0ZWsuY29tPgo+Pj4+Pgo+Pj4+PiBDb21iaW5lIG10NjM2MCBwbWlj
L2xkbyByZXNvdXJjZXMgaW50byBtdDYzNjAgcmVndWxhdG9yIHJlc291cmNlcwo+Pj4+PiB0byBz
aW1wbGlmeSB0aGUgc2ltaWxhciByZXNvdXJjZXMgb2JqZWN0Lgo+Pj4+Pgo+Pj4+PiBTaWduZWQt
b2ZmLWJ5OiBHZW5lIENoZW4gPGdlbmVfY2hlbkByaWNodGVrLmNvbT4KPj4+Pj4gQWNrZWQtZm9y
LU1GRC1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KPj4+Pj4gLS0tCj4+Pj4+
ICBkcml2ZXJzL21mZC9tdDYzNjAtY29yZS5jIHwgMTEgKysrLS0tLS0tLS0KPj4+Pj4gIDEgZmls
ZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4+Pj4+Cj4+Pj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL21mZC9tdDYzNjAtY29yZS5jIGIvZHJpdmVycy9tZmQvbXQ2MzYw
LWNvcmUuYwo+Pj4+PiBpbmRleCA2OTJlNDdiLi41MTE5ZTUxIDEwMDY0NAo+Pj4+PiAtLS0gYS9k
cml2ZXJzL21mZC9tdDYzNjAtY29yZS5jCj4+Pj4+ICsrKyBiL2RyaXZlcnMvbWZkL210NjM2MC1j
b3JlLmMKPj4+Pj4gQEAgLTI2NSw3ICsyNjUsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHJlc291
cmNlIG10NjM2MF9sZWRfcmVzb3VyY2VzW10gPSB7Cj4+Pj4+ICAgICAgIERFRklORV9SRVNfSVJR
X05BTUVEKE1UNjM2MF9GTEVEMV9TVFJCX1RPX0VWVCwgImZsZWQxX3N0cmJfdG9fZXZ0IiksCj4+
Pj4+ICB9Owo+Pj4+Pgo+Pj4+PiAtc3RhdGljIGNvbnN0IHN0cnVjdCByZXNvdXJjZSBtdDYzNjBf
cG1pY19yZXNvdXJjZXNbXSA9IHsKPj4+Pj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgcmVzb3VyY2Ug
bXQ2MzYwX3JlZ3VsYXRvcl9yZXNvdXJjZXNbXSA9IHsKPj4+Pj4gICAgICAgREVGSU5FX1JFU19J
UlFfTkFNRUQoTVQ2MzYwX0JVQ0sxX1BHQl9FVlQsICJidWNrMV9wZ2JfZXZ0IiksCj4+Pj4+ICAg
ICAgIERFRklORV9SRVNfSVJRX05BTUVEKE1UNjM2MF9CVUNLMV9PQ19FVlQsICJidWNrMV9vY19l
dnQiKSwKPj4+Pj4gICAgICAgREVGSU5FX1JFU19JUlFfTkFNRUQoTVQ2MzYwX0JVQ0sxX09WX0VW
VCwgImJ1Y2sxX292X2V2dCIpLAo+Pj4+PiBAQCAtMjc4LDkgKzI3OCw2IEBAIHN0YXRpYyBjb25z
dCBzdHJ1Y3QgcmVzb3VyY2UgbXQ2MzYwX3BtaWNfcmVzb3VyY2VzW10gPSB7Cj4+Pj4+ICAgICAg
IERFRklORV9SRVNfSVJRX05BTUVEKE1UNjM2MF9MRE83X09DX0VWVCwgImxkbzdfb2NfZXZ0Iiks
Cj4+Pj4+ICAgICAgIERFRklORV9SRVNfSVJRX05BTUVEKE1UNjM2MF9MRE82X1BHQl9FVlQsICJs
ZG82X3BnYl9ldnQiKSwKPj4+Pj4gICAgICAgREVGSU5FX1JFU19JUlFfTkFNRUQoTVQ2MzYwX0xE
TzdfUEdCX0VWVCwgImxkbzdfcGdiX2V2dCIpLAo+Pj4+PiAtfTsKPj4+Pj4gLQo+Pj4+PiAtc3Rh
dGljIGNvbnN0IHN0cnVjdCByZXNvdXJjZSBtdDYzNjBfbGRvX3Jlc291cmNlc1tdID0gewo+Pj4+
PiAgICAgICBERUZJTkVfUkVTX0lSUV9OQU1FRChNVDYzNjBfTERPMV9PQ19FVlQsICJsZG8xX29j
X2V2dCIpLAo+Pj4+PiAgICAgICBERUZJTkVfUkVTX0lSUV9OQU1FRChNVDYzNjBfTERPMl9PQ19F
VlQsICJsZG8yX29jX2V2dCIpLAo+Pj4+PiAgICAgICBERUZJTkVfUkVTX0lSUV9OQU1FRChNVDYz
NjBfTERPM19PQ19FVlQsICJsZG8zX29jX2V2dCIpLAo+Pj4+PiBAQCAtMjk4LDEwICsyOTUsOCBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IG1mZF9jZWxsIG10NjM2MF9kZXZzW10gPSB7Cj4+Pj4+ICAg
ICAgICAgICAgICAgICAgIE5VTEwsIDAsIDAsICJtZWRpYXRlayxtdDYzNjAtY2hnIiksCj4+Pj4+
ICAgICAgIE9GX01GRF9DRUxMKCJtdDYzNjAtbGVkIiwgbXQ2MzYwX2xlZF9yZXNvdXJjZXMsCj4+
Pj4+ICAgICAgICAgICAgICAgICAgIE5VTEwsIDAsIDAsICJtZWRpYXRlayxtdDYzNjAtbGVkIiks
Cj4+Pj4+IC0gICAgIE9GX01GRF9DRUxMKCJtdDYzNjAtcG1pYyIsIG10NjM2MF9wbWljX3Jlc291
cmNlcywKPj4+Pj4gLSAgICAgICAgICAgICAgICAgTlVMTCwgMCwgMCwgIm1lZGlhdGVrLG10NjM2
MC1wbWljIiksCj4+Pj4+IC0gICAgIE9GX01GRF9DRUxMKCJtdDYzNjAtbGRvIiwgbXQ2MzYwX2xk
b19yZXNvdXJjZXMsCj4+Pj4+IC0gICAgICAgICAgICAgICAgIE5VTEwsIDAsIDAsICJtZWRpYXRl
ayxtdDYzNjAtbGRvIiksCj4+Pj4+ICsgICAgIE9GX01GRF9DRUxMKCJtdDYzNjAtcmVndWxhdG9y
IiwgbXQ2MzYwX3JlZ3VsYXRvcl9yZXNvdXJjZXMsCj4+Pj4+ICsgICAgICAgICAgICAgICAgIE5V
TEwsIDAsIDAsICJtZWRpYXRlayxtdDYzNjAtcmVndWxhdG9yIiksCj4+Pj4KPj4+PiBBcyBkaXNj
dXNzZWQgd2l0aCB0aGUgTUZEIG1haW50YWluZXIgWzFdLCB0aGUgcmVndWxhdG9yIChhbmQgcHJv
YmFibHkgYWxsIGNlbGxzKQo+Pj4+IHNob3VsZG4ndCBoYXZlIGEgRFQgYmluZGluZy4KPj4+Pgo+
Pj4+IFNvIHBsZWFzZSBzZW5kIGEgbmV3IHZlcnNpb24gd2hpY2ggZml4ZXMgdGhhdC4KPj4+Pgo+
Pj4+IFJlZ2FyZHMsCj4+Pj4gTWF0dGhpYXMKPj4+Pgo+Pj4+IFsxXSBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1tZWRpYXRlay8yMDIxMDExMTE2NDExOC5HRTQ3MjhAc2lyZW5hLm9yZy51
ay8KPj4KPj4gSSBkb24ndCB0aGluayBNYXJrIGlzIGNvcnJlY3QgaGVyZS4KPj4KPj4gV2UgdXN1
YWxseSBkbyBpbXBsZW1lbnQgY29tcGF0aWJsZSBzdHJpbmdzIGZvciBzdWItZGV2aWNlcyBhbmQg
dGhleSBkbwo+PiB0ZW5kIHRvIGhhdmUgdGhlaXIgb3duIGRldmljZSBub2Rlcy4KPj4KPj4gSXQn
cyBhIHZlcnkgbG9uZyB0aW1lIGFnbyBzaW5jZSBJIGNvZGVkIHRoaXMgdXAgbXlzZWxmLCBidXQg
ZnJvbQo+PiBtZW1vcnksIHlvdSBjYW4ndCBoYXZlIDIgZGV2aWNlcyBzaGFyZSBhIGNvbXBhdGli
bGUgc3RyaW5nLgo+Pgo+IAo+IEVpdGhlciBNYXJrIG9yIExlZSBzdWdnZXN0aW9uIGlzIHdvcmsu
Cj4gSXMgdGhlcmUgYSBjb25jbHVzaW9uIHRoYXQgd2UgY2FuIGFwcGx5IGl0Pwo+IElmIE1GRCBp
cyBhbHJlYWR5IHN1cHBvcnRlZCBvZl9jb21wYXRpYmxlLCB3ZSBwcmVmZXIgdXNlIG9mX2NvbXBh
dGlibGUgbWFwcGluZy4KPiAKCkZvciByZWd1bGF0b3Igb24gUE1JQyB5b3Ugc2hvdWxkIGFkZCB0
aGUgcmVndWxhdG9yIHRvIHRoZSBwbWljIG5vZGUgZGlyZWN0bHkuClBsZWFzZSBzZWUgdGhlIHNl
cmllcyBmcm9tIEhzaW4tSHNpdW5nIGZvciByZWZlcmVjZToKaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGludXgtbWVkaWF0ZWsvMTYxNTgyOTc1Ny0zMjIzLTYtZ2l0LXNlbmQtZW1haWwtaHNpbi1o
c2l1bmcud2FuZ0BtZWRpYXRlay5jb20vVC8jdQoKUmVnYXJkcywKTWF0dGhpYXMKCj4+PiBTaG91
bGQgSSB1c2UgcGFyZW50J3MgZGV2aWNlIHRvIGZpbmQgc3ViLWRldmljZXMgb2Zfbm9kZSBpZiB3
aXRob3V0Cj4+PiBjb21wYXRpYmxlIG5hbWU/Cj4+PiBJIHRyYWNlIHRoZSBmdW5jdGlvbiBtZmRf
YWRkX2RldmljZSwKPj4+Cj4+PiBpZiAoSVNfRU5BQkxFRChDT05GSUdfT0YpICYmIHBhcmVudC0+
b2Zfbm9kZSAmJiBjZWxsLT5vZl9jb21wYXRpYmxlKSB7Cj4+PiAgICAgLi4uLi4KPj4+ICAgICBy
ZXQgPSBtZmRfbWF0Y2hfb2Zfbm9kZV90b19kZXYocGRldiwgbnAsIGNlbGwpOwo+Pj4gICAgIC4u
Li4uCj4+PiB9Cj4+Pgo+Pj4gd2hpY2ggaXMgYmluZGluZyBtZmQgc3ViLWRldmljZSB3aXRoIGNv
bXBhdGlibGUuIERvZXMgaXQgYmUgcmVtb3ZlZCBpbgo+Pj4gdGhlIGZlYXR1cmU/Cj4+Pgo+Pj4+
PiAgICAgICBPRl9NRkRfQ0VMTCgibXQ2MzYwLXRjcGMiLCBOVUxMLAo+Pj4+PiAgICAgICAgICAg
ICAgICAgICBOVUxMLCAwLCAwLCAibWVkaWF0ZWssbXQ2MzYwLXRjcGMiKSwKPj4+Pj4gIH07Cj4+
Pj4+Cj4+Cj4+IC0tCj4+IExlZSBKb25lcyBb5p2O55C85pavXQo+PiBTZW5pb3IgVGVjaG5pY2Fs
IExlYWQgLSBEZXZlbG9wZXIgU2VydmljZXMKPj4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ug
c29mdHdhcmUgZm9yIEFybSBTb0NzCj4+IEZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRl
ciB8IEJsb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bWVkaWF0ZWsK
