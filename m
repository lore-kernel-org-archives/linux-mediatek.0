Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B95EC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Apr 2022 10:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yrjxlO2splmsTSIPdSuvPJssWGBZi/etoA5Wx7bhmr8=; b=iM0oEb7mAqTUPS
	vIEV5uYml2Wws2m1AoETfWEJIR9CL/Pdj7DjOSmLIo0dYIApLNnMhLk9udPEfGm7HA5HqrmZNSJKU
	KfxtxNSVzcUlfLuvq8WnVFeNdX+JSptTNRelSp128jJ0/S2LnoV3FKqP8FIItwYYYw+Bnk76rzoZ4
	iOqezkGLY8Az3VcUKBsoibEZjdsJuz5NML7oh770WrhJx99riJwCVlGBYxyV7BnVecMqS7PL8StgU
	2ukFJM+XFhqbsR0x4+1ZZXjqgh9DCVNFwB4RhBN2kaBcT/8vWTP/IpfSkEtj4ih1Txx1ZIL2m/MuT
	JMfyfAXZJI+KgnlcvGwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neaTx-000e1w-4u; Wed, 13 Apr 2022 10:44:17 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neaQm-000ciZ-OQ; Wed, 13 Apr 2022 10:41:03 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1649846438; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=hTK7F7eh6Xj5J9hP1dIAfil1UZQXRGvObkBRkCHTzuj0q+lftB/3yKqiMTFAIdVBma5pFUK4GvD+9o5kxtw8GPcV0uoSYViNV+3P9tCh13Y8rj6EbKqUXZeG+JIbmcPSmyOo09mjWI0rdks8X/kpwFelWwDS8FUsxvmaDpKqTM0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1649846438;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=8cuduJRz7v/CIkmAbDKACdBfRvx+g1IMGtExWKUFiic=; 
 b=LrHwsyl96YzAPFyMZZpFmRM8ZAsJ7/WEnxyJJT47vRS3WxWnU2BBZFzoeMIHMJsIi/NUO3WoRdmkQnPEU83K6p2T35tvAWhFLlG4l91geiLdcIqHxkwTsURZrQTp1eCLlY/SNH8xoJJfwBFcQHP1JhSguHb/gquV5RSm7IEzzRI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=arinc9.com;
 spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
 dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1649846438; 
 s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=8cuduJRz7v/CIkmAbDKACdBfRvx+g1IMGtExWKUFiic=;
 b=V6098wza0NbqnazK1jLojGrElIUHRSajhlmRUN/clG2dIogHtpfLVNrqY+sw+VCA
 AD3eI/5ydAsd+vuTzj7gvQxsFy/6SRuudVpbpvRuggPtxo+a6v7Y3wWh0EBBKvOYbG/
 XrpN6GHMTC7RG28BeFmvGzv0bAV51k+Ci3sNHQ6g=
Received: from [10.10.10.3] (85.117.236.245 [85.117.236.245]) by
 mx.zohomail.com with SMTPS id 164984643564144.415058780915956;
 Wed, 13 Apr 2022 03:40:35 -0700 (PDT)
Message-ID: <f5f3b847-eb6d-9978-3040-245e3b1acb23@arinc9.com>
Date: Wed, 13 Apr 2022 13:40:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 08/14] MAINTAINERS: add Ralink pinctrl driver
Content-Language: en-US
To: Joe Perches <joe@perches.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: erkin.bozoglu@xeront.com, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org
References: <20220413060729.27639-1-arinc.unal@arinc9.com>
 <20220413060729.27639-9-arinc.unal@arinc9.com>
 <d0ed8518dfb93e6f2bbbaf4aac3436dd20369c00.camel@perches.com>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <d0ed8518dfb93e6f2bbbaf4aac3436dd20369c00.camel@perches.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_034100_911052_88FB2865 
X-CRM114-Status: GOOD (  12.54  )
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

T24gMTMvMDQvMjAyMiAxMToyOSwgSm9lIFBlcmNoZXMgd3JvdGU6Cj4gT24gV2VkLCAyMDIyLTA0
LTEzIGF0IDA5OjA3ICswMzAwLCBBcsSxbsOnIMOcTkFMIHdyb3RlOgo+PiBBZGQgYSBuZXcgc2Vj
dGlvbiBmb3IgdGhlIFJhbGluayBwaW5jdHJsIGRyaXZlciBhbmQgYWRkIG1lIGFuZCBTZXJnaW8g
YXMKPj4gdGhlIG1haW50YWluZXJzLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBcsSxbsOnIMOcTkFM
IDxhcmluYy51bmFsQGFyaW5jOS5jb20+Cj4gCj4gSXQncyB1bnVzdWFsIGZvciBhIGxhc3QgbmFt
ZSB0byBiZSBjb21wbGV0ZWx5IGNhcGl0YWxpemVkLgoKSSB3YXMgaW5mbHVlbmNlZCBieSBhIGxh
dyBmb3Igb2ZmaWNpYWwgY29ycmVzcG9uZGVuY2UgZnJvbSB3aGVyZSBJIGxpdmUuIApJdCBzb3J0
IG9mIHN0dWNrIHdpdGggbWUuIFN1cmVseSB0aGF0J3Mgbm90IGEgcHJvYmxlbT8KCj4gCj4+IGRp
ZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCj4gW10KPj4gQEAgLTE2NTAyLDYg
KzE2NTAyLDEzIEBAIEw6CWxpbnV4LW1pcHNAdmdlci5rZXJuZWwub3JnCj4+ICAgUzoJTWFpbnRh
aW5lZAo+PiAgIEY6CWFyY2gvbWlwcy9ib290L2R0cy9yYWxpbmsvbXQ3NjIxKgo+PiAgIAo+PiAr
UkFMSU5LIFBJTkNUUkwgRFJJVkVSCj4+ICtNOglBcsSxbsOnIMOcTkFMIDxhcmluYy51bmFsQGFy
aW5jOS5jb20+Cj4+ICtNOglTZXJnaW8gUGFyYWN1ZWxsb3MgPHNlcmdpby5wYXJhY3VlbGxvc0Bn
bWFpbC5jb20+Cj4+ICtMOglsaW51eC1taXBzQHZnZXIua2VybmVsLm9yZwo+PiArUzoJTWFpbnRh
aW5lZAo+PiArRjoJZHJpdmVycy9waW5jdHJsL3JhbGluay8qCj4gCj4gVHlwaWNhbGx5IHRoaXMg
aXMganVzdCB0aGUgZGlyZWN0b3J5Lgo+IAo+IEY6CWRyaXZlcnMvcGluY3RybC9yYWxpbmsvCj4g
Cj4gYXMgdGhpcyBjb3ZlcnMgYW55IGZpbGUgaW4gdGhlIGRpcmVjdG9yeSBhcyB3ZWxsIGFzCj4g
YW55IHBvc3NpYmxlIHN1YmRpcmVjdG9yaWVzIGFuZCBmaWxlcy4KPiAKPiBVc2luZwo+IAo+IEY6
CWRyaXZlcnMvcGluY3RybC9yYWxpbmsvKgo+IAo+IGV4Y2x1ZGVzIGFueSBwb3NzaWJsZSBzdWJk
aXJlY3RvcmllcyBhbmQgZmlsZXMgd2l0aGluIHRob3NlCj4gcG9zc2libGUgc3ViZGlyZWN0b3Jp
ZXMuCgpUaGFua3MhIEknbGwgY2hhbmdlIHRoaXMgaWYgSSBnZXQgbW9yZSBzdHVmZiB0byBhZGRy
ZXNzLiBJIHRoaW5rIHRoaXMgaXMgCnRvbyBtaW5vciBvZiBhIGNoYW5nZSBmb3IgcmVzdWJtaXR0
aW5nIHRoZSBzZXJpZXMgYXMgdGhlcmUncmUgbm8gCnN1YmRpcmVjdG9yaWVzIG9uIHRoZXJlIHll
dC4KCkFyxLFuw6cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbWVkaWF0ZWsK
