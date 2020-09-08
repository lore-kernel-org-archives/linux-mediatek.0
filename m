Return-Path: <SRS0=x1vn=CR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3B2AC43461
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 11:48:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59646206B5
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 11:48:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nen+bk8o";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w3HwZPSl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59646206B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vjeUrFsoH0WRUFCskzKKoJUShj1mwI2zWJaVSsOLl0M=; b=nen+bk8ogAVNV5jwnfsu05bhS
	QdCfm/1GUYDfvsowhzEOUfdiODXZfI05V8hZA2KNlbE/wTjNHE0h33/SDT6BSU1oHHIzan3wS8qrV
	aL+sDV3KLv9R8EH1iXFqn2RgZi+QIDk77qruadBArxjqo1lN9nl8o5vuOLfog5/drv9fQOyap2/Hu
	qqCmKgHaFqjmC8VhvqTMPbyWjPhFAWoyNI0hw1rHXMRXXKBiSq8+GH/YW3k9o8qotD2rcQ8fn6rvO
	asQmW65eTVp2T5AfwkapZJJyu/kSZEjnNQVSw1R8dLJfMXTzTSCRL897Q2U9xExDC8Yi32oqNOKqt
	QlK9iCRxw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFc6t-00069B-8H; Tue, 08 Sep 2020 11:48:27 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFc6p-000682-4d
 for linux-mediatek@lists.infradead.org; Tue, 08 Sep 2020 11:48:24 +0000
Received: by mail-wr1-x444.google.com with SMTP id z4so18790100wrr.4
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Sep 2020 04:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=MOD3myDX5YVgSCWPbOM0MI/Bz9e/gthofWOrn9GDODs=;
 b=w3HwZPSlAP6vTHgPGNbJ1UJODKPETw4ntd97KFSwYdtFeo7txe9ylUitmpfb1OFDYr
 lMPJwxe3ebtCFWxApnFbDkIH5PtVjy29un6eV91d+RqtiPphY/Swsgbhs6Netmj1fSkj
 C/XwUR8vXcbjJGjTBbExzhdeJlm4eDt62q2jPxc+kDuwAIGT8PxBSprcZPiUERYQfGuQ
 LhHTk4s/Av7zN2SuCGdpJmA5XljzsmHbkeOSZCZ0UCv7e16IkdI3Oo6CW+g5cDkmHW71
 pq88MXS6xJC++nxsjhnnxhqW9jmkHmsCdZXPj4meJubE2CIMNNgl/IM6pKMhKSLLDafz
 yvNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=MOD3myDX5YVgSCWPbOM0MI/Bz9e/gthofWOrn9GDODs=;
 b=l6ijB8c867inKB7utU/Ls4zHYzlzoj/KnrBMZbSKJVAnCYye4kWxrSKeXo+IDC+reu
 9MbwcnIQ9tYnFLjl75/ThXUVoAdBYaPgnZkLi8wSs6B0BEj6n83XWfdufyjnvekmnkA2
 IufNrh3E/Ixgn+c0QYfyAGxFmxtybefM9UyQ+XSgMVbDn+cImVI150FOcc0num5mMxPZ
 I1MOyYkobzeuHDaKa8tHk2e+8Elj/0yWaiGGN4+p/an804XugvHIzemv5L04u+nR+KOM
 99PeEVBui2FhAWX7OjC+utkdyNxTc2kvwRaxVviXLs6IGyxAvWRGufzpk99efC1FBMbz
 TKVg==
X-Gm-Message-State: AOAM531YOxdN2pAj5V3OULf28QxqwVpQLr2FNl1c6MYnX7BWtFgij+W2
 Br6OUkaA9ezCbVvBnyE9uhuOfQ==
X-Google-Smtp-Source: ABdhPJwSUZRXvDpDN21AesLjjEhCOKb66RbXY49H7pR60AfMm3M/qabkE9LDWvxs/X+mLiKedGotbQ==
X-Received: by 2002:a5d:458e:: with SMTP id p14mr26713354wrq.61.1599565702035; 
 Tue, 08 Sep 2020 04:48:22 -0700 (PDT)
Received: from dell ([91.110.221.179])
 by smtp.gmail.com with ESMTPSA id i1sm40833436wrc.49.2020.09.08.04.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 04:48:21 -0700 (PDT)
Date: Tue, 8 Sep 2020 12:48:19 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v4 9/9] mfd: mt6360: Merge different sub-devices I2C
 read/write
Message-ID: <20200908114819.GO4400@dell>
References: <1597661277-27862-1-git-send-email-gene.chen.richtek@gmail.com>
 <1597661277-27862-10-git-send-email-gene.chen.richtek@gmail.com>
 <20200828104053.GM1826686@dell>
 <CAE+NS37uFoDhWyGkw0WTu+tR+_85EwzYRqecNMG6nK6b2J=9jg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAE+NS37uFoDhWyGkw0WTu+tR+_85EwzYRqecNMG6nK6b2J=9jg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_074823_598740_7A272A02 
X-CRM114-Status: GOOD (  32.11  )
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
Cc: Gene Chen <gene_chen@richtek.com>, linux-kernel@vger.kernel.org,
 cy_huang@richtek.com, benjamin.chao@mediatek.com,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAwMSBTZXAgMjAyMCwgR2VuZSBDaGVuIHdyb3RlOgoKPiBMZWUgSm9uZXMgPGxlZS5q
b25lc0BsaW5hcm8ub3JnPiDmlrwgMjAyMOW5tDjmnIgyOOaXpSDpgLHkupQg5LiL5Y2INjo0MOWv
q+mBk++8mgo+ID4KPiA+IE9uIE1vbiwgMTcgQXVnIDIwMjAsIEdlbmUgQ2hlbiB3cm90ZToKPiA+
Cj4gPiA+IEZyb206IEdlbmUgQ2hlbiA8Z2VuZV9jaGVuQHJpY2h0ZWsuY29tPgo+ID4gPgo+ID4g
PiBSZW1vdmUgdW51c2UgcmVnaXN0ZXIgZGVmaW5pdGlvbi4KPiA+Cj4gPiBUaGlzIHNob3VsZCBi
ZSBpbiBhIHNlcGFyYXRlIHBhdGNoLgo+ID4KPiA+ID4gTWVyZ2UgZGlmZmVyZW50IHN1Yi1kZXZp
Y2VzIEkyQyByZWFkL3dyaXRlIGZ1bmN0aW9ucyBpbnRvIG9uZSBSZWdtYXAsCj4gPiA+IGJlY2F1
c2UgUE1JQyBhbmQgTERPIHBhcnQgbmVlZCBDUkMgYml0cyBmb3IgYWNjZXNzIHByb3RlY3Rpb24u
Cj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEdlbmUgQ2hlbiA8Z2VuZV9jaGVuQHJpY2h0ZWsu
Y29tPgo+ID4gPiAtLS0KPiA+ID4gIGRyaXZlcnMvbWZkL0tjb25maWcgICAgICAgIHwgICAxICsK
PiA+ID4gIGRyaXZlcnMvbWZkL210NjM2MC1jb3JlLmMgIHwgMjYwICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKy0tLS0tLQo+ID4gPiAgaW5jbHVkZS9saW51eC9tZmQvbXQ2
MzYwLmggfCAyNDAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiA+
ID4gIDMgZmlsZXMgY2hhbmdlZCwgMjI2IGluc2VydGlvbnMoKyksIDI3NSBkZWxldGlvbnMoLSkK
PiA+ID4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L21mZC9tdDYzNjAuaAo+ID4g
Pgo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZmQvS2NvbmZpZyBiL2RyaXZlcnMvbWZkL0tj
b25maWcKPiA+ID4gaW5kZXggYTM3ZDdkMS4uMDY4NGRkYyAxMDA2NDQKPiA+ID4gLS0tIGEvZHJp
dmVycy9tZmQvS2NvbmZpZwo+ID4gPiArKysgYi9kcml2ZXJzL21mZC9LY29uZmlnCj4gPiA+IEBA
IC05MTMsNiArOTEzLDcgQEAgY29uZmlnIE1GRF9NVDYzNjAKPiA+ID4gICAgICAgc2VsZWN0IE1G
RF9DT1JFCj4gPiA+ICAgICAgIHNlbGVjdCBSRUdNQVBfSTJDCj4gPiA+ICAgICAgIHNlbGVjdCBS
RUdNQVBfSVJRCj4gPiA+ICsgICAgIHNlbGVjdCBDUkM4Cj4gPiA+ICAgICAgIGRlcGVuZHMgb24g
STJDCj4gPiA+ICAgICAgIGhlbHAKPiA+ID4gICAgICAgICBTYXkgWSBoZXJlIHRvIGVuYWJsZSBN
VDYzNjAgUE1VL1BNSUMvTERPIGZ1bmN0aW9uYWwgc3VwcG9ydC4KPiA+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbWZkL210NjM2MC1jb3JlLmMgYi9kcml2ZXJzL21mZC9tdDYzNjAtY29yZS5jCj4g
PiA+IGluZGV4IDY3N2M5NzQuLmU5OTUyMjAgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvbWZk
L210NjM2MC1jb3JlLmMKPiA+ID4gKysrIGIvZHJpdmVycy9tZmQvbXQ2MzYwLWNvcmUuYwo+ID4g
PiBAQCAtMTQsNyArMTQsNTMgQEAKPiA+ID4gICNpbmNsdWRlIDxsaW51eC9yZWdtYXAuaD4KPiA+
ID4gICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+Cj4gPiA+Cj4gPiA+IC0jaW5jbHVkZSA8bGludXgv
bWZkL210NjM2MC5oPgo+ID4gPiArZW51bSB7Cj4gPiA+ICsgICAgIE1UNjM2MF9TTEFWRV9UQ1BD
ID0gMCwKPiA+ID4gKyAgICAgTVQ2MzYwX1NMQVZFX1BNSUMsCj4gPiA+ICsgICAgIE1UNjM2MF9T
TEFWRV9MRE8sCj4gPiA+ICsgICAgIE1UNjM2MF9TTEFWRV9QTVUsCj4gPiA+ICsgICAgIE1UNjM2
MF9TTEFWRV9NQVgsCj4gPiA+ICt9Owo+ID4gPiArCj4gPiA+ICtzdHJ1Y3QgbXQ2MzYwX2RkYXRh
IHsKPiA+ID4gKyAgICAgc3RydWN0IGkyY19jbGllbnQgKmkyY1tNVDYzNjBfU0xBVkVfTUFYXTsK
PiA+ID4gKyAgICAgc3RydWN0IGRldmljZSAqZGV2Owo+ID4gPiArICAgICBzdHJ1Y3QgcmVnbWFw
ICpyZWdtYXA7Cj4gPiA+ICsgICAgIHN0cnVjdCByZWdtYXBfaXJxX2NoaXBfZGF0YSAqaXJxX2Rh
dGE7Cj4gPiA+ICsgICAgIHVuc2lnbmVkIGludCBjaGlwX3JldjsKPiA+ID4gKyAgICAgdTggY3Jj
OF90YmxbQ1JDOF9UQUJMRV9TSVpFXTsKPiA+ID4gK307Cj4gPgo+ID4gVGhpcyBpcyBub3QgYSBu
ZXcgc3RydWN0dXJlLCByaWdodD8gIFdoZXJlIHdhcyB0aGlzIGJlZm9yZT8gIFN1cmVseSBpdAo+
ID4gc2hvdWxkIGJlIHJlbW92ZWQgZnJvbSB3aGVyZXZlciBpdCB3YXMgaW4gdGhlIHNhbWUgcGF0
Y2ggdGhhdCBwbGFjZXMKPiA+IGl0IGhlcmU/Cj4gPgo+IAo+IE5vLCBpdCBpcyBtZXJnZSBmcm9t
IGhlYWRlciBmaWxlIHRvIHNvdXJjZSBjb2RlIGZvciB1bnVzZSBpbiBvdGhlciBzdWItbW9kdWxl
LgoKU28gd2hlcmUgZGlkIGl0IGNvbWUgZnJvbSBhbmQgd2h5IGRvbid0IEkgc2VlIHRoZSByZW1v
dmFsIGluIHRoaXMKcGF0Y2g/CgpbLi4uXQoKPiA+ID4gLXN0YXRpYyBjb25zdCB1bnNpZ25lZCBz
aG9ydCBtdDYzNjBfc2xhdmVfYWRkcltNVDYzNjBfU0xBVkVfTUFYXSA9IHsKPiA+ID4gLSAgICAg
TVQ2MzYwX1BNVV9TTEFWRUlELAo+ID4gPiArc3RhdGljIGNvbnN0IHUxNiBtdDYzNjBfc2xhdmVf
YWRkcnNbTVQ2MzYwX1NMQVZFX01BWF0gPSB7Cj4gPgo+ID4gV2h5IGFyZSB5b3UgY2hhbmdpbmcg
dGhlIGRhdGEgdHlwZT8KPiA+Cj4gCj4gRWFzeSB0byByZWFkLgo+IEkgdGhpbmsgaXQncyB0aGUg
c2FtZT8KCkl0J3MgYW4gdW5yZWxhdGVkIGNoYW5nZSBhbmQgc2hvdWxkIG5vdCBiZSBpbiB0aGlz
IHBhdGNoLgoKUGxlYXNlIHNlcGFyYXRlIHBhdGNoZXMgaW50byBmdW5jdGlvbmFsIGNoYW5nZXMu
Cgo+ID4gPiArICAgICBNVDYzNjBfVENQQ19TTEFWRUlELAo+ID4gPiAgICAgICBNVDYzNjBfUE1J
Q19TTEFWRUlELAo+ID4gPiAgICAgICBNVDYzNjBfTERPX1NMQVZFSUQsCj4gPiA+IC0gICAgIE1U
NjM2MF9UQ1BDX1NMQVZFSUQsCj4gPiA+ICsgICAgIE1UNjM2MF9QTVVfU0xBVkVJRCwKPiA+ID4g
K307CgpbLi4uXQoKPiA+ID4gIHN0YXRpYyBpbnQgbXQ2MzYwX3Byb2JlKHN0cnVjdCBpMmNfY2xp
ZW50ICpjbGllbnQpCj4gPiA+IEBAIC0zMjksOSArNTIxLDIzIEBAIHN0YXRpYyBpbnQgbXQ2MzYw
X3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQpCj4gPiA+ICAgICAgICAgICAgICAgcmV0
dXJuIC1FTk9NRU07Cj4gPiA+Cj4gPiA+ICAgICAgIGRkYXRhLT5kZXYgPSAmY2xpZW50LT5kZXY7
Cj4gPiA+IC0gICAgIGkyY19zZXRfY2xpZW50ZGF0YShjbGllbnQsIGRkYXRhKTsKPiA+ID4KPiA+
ID4gLSAgICAgZGRhdGEtPnJlZ21hcCA9IGRldm1fcmVnbWFwX2luaXRfaTJjKGNsaWVudCwgJm10
NjM2MF9wbXVfcmVnbWFwX2NvbmZpZyk7Cj4gPiA+ICsgICAgIGZvciAoaSA9IDA7IGkgPCBNVDYz
NjBfU0xBVkVfTUFYIC0gMTsgaSsrKSB7Cj4gPiA+ICsgICAgICAgICAgICAgZGRhdGEtPmkyY1tp
XSA9IGRldm1faTJjX25ld19kdW1teV9kZXZpY2UoJmNsaWVudC0+ZGV2LAo+ID4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNsaWVudC0+
YWRhcHRlciwKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBtdDYzNjBfc2xhdmVfYWRkcnNbaV0pOwo+ID4gPiArICAgICAgICAgICAg
IGlmIChJU19FUlIoZGRhdGEtPmkyY1tpXSkpIHsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAg
IGRldl9lcnIoJmNsaWVudC0+ZGV2LAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAiRmFpbGVkIHRvIGdldCBuZXcgZHVtbXkgSTJDIGRldmljZSBmb3IgYWRkcmVzcyAweCV4IiwK
PiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbXQ2MzYwX3NsYXZlX2FkZHJzW2ld
KTsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKGRkYXRhLT5pMmNb
aV0pOwo+ID4KPiA+IERvIHlvdSBoYXZlIHRvIGZyZWUgdGhlIG5ldyBkZXZpY2VzIHlvdSBqdXN0
IGFsbG9jYXRlZD8KPiA+Cj4gCj4gVXN1YWxseSBubyBuZWVkIHRvIGZyZWUgZGV2bV9pMmNfbmV3
X2R1bW15X2RldmljZSwKPiBTaG91bGQgSSB1c2Uga2ZyZWUoZGRhdGEtPmkyY1tpXSk7PwoKWW91
IHRlbGwgbWUuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClNlbmlvciBUZWNobmljYWwgTGVh
ZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2Fy
ZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVk
aWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
