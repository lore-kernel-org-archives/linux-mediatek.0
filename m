Return-Path: <SRS0=N2rV=IA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BEA0C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Mar 2021 07:17:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 853EC6146B
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Mar 2021 07:17:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 853EC6146B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yhLocTUiRsDhBx7My+ondYVPe+J5TVitXtVLavQBKfk=; b=yt4f5yf09UJWZdf/D+19BA8sT
	TURQML58RlHtZnGX+QXW2LEimBAKI4u3oCvmL2u0F0wgNEDhMR0XCbmt2nsTGV0gmSVlXjVEr/qxJ
	TbGDs0gHs7lsZemuKctK60xbwJTqfaAPTXQxjo/zEDusDrATrC585K4n7SEXnkLcRR7F2pCEYMFUk
	hyChgiSHh2CGOcmmyjqSxh0kiOf9CLBiWwaYB8XED2fT3n20PgI3WKGM4W0GzTaaydsQT7aqb+AND
	OP6pmTCTCz/YVUwjPZse/gBsj44OSVuqCCXNCAAsgwFRc2WPHqkoVWZwJp/RdJhZLA15mB5ZTCaM4
	TtaNdynHQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGzH0-0004fR-2g; Tue, 02 Mar 2021 07:16:50 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGzGw-0004eX-Mg; Tue, 02 Mar 2021 07:16:47 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 40so10721563otu.0;
 Mon, 01 Mar 2021 23:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cvv8ZYn5o9fAfH88FdY8LKHoCI4AuWaKRHSz9HOIfo4=;
 b=vI8VnN1HjfU5ubeo7oar9dcdw1FjnOapzOUa/JjKEJraWJy9ZQU6i4W0TkH/AdUQpt
 7UwZM9RLL2RxaPjfvrniGkjDOXP/GCypNlutbjhLaWYvn21EnvR1WyK7216zGRG3LTxG
 k8RRzr82MnRXdExbacTsojVsNRUeI74IOedc1laMQqIP2rQkDprVmTxG+3v9B27PTOFT
 kGuOQ9mNaJVC7QN4aCkSay4XLodac4r7pb/D6RJWY+tFPVNf0OTDrhuHHVIIkzDwx2rF
 Wys6Rpbl/k53nXWjn5ZlLLSTmoXhe7mwdgsRyz+OPVZG8KVpE9xWjRKNso+QevBxvWjL
 AioQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cvv8ZYn5o9fAfH88FdY8LKHoCI4AuWaKRHSz9HOIfo4=;
 b=O4l37HD+AflLpdQSgDl/iuFOL89wPLt7G31aTbIvs+FZ1nAX06zlqy+NZVfiu7xiy+
 5vL3zF2lgIIElLBYliNmHyY1OvaG7mY6aopRe6nhKKrWrCTXXOw4Igk35ghT/muAEsCt
 6ZBKEXkUq1QTsz7BxE9ICBkduC4ItlpeIZyuWW6pQ7NW+VH0Ud67xpAlEAF05lKmOAkx
 CNpameBmMHBhvRX7AfJULs6p+md6tTXzimkQK0gz5BtpKPENYk3rAejIc/tnrPGyBE5W
 s29qimwxlPsIKO+oEEI7Fs4c6uHPh5ElgZ6R+5LtRwC3LwN0NuKC+V2ZfgC8HFurjnwW
 umzA==
X-Gm-Message-State: AOAM531+DSZ0qUgbROpOMEu5dJDTNIxn1Huy4/uYlDTRf2Oum0NTWWnk
 ObqAo76oLi7CO+xzj/krivDzqrIzZOgpYP+kGRg=
X-Google-Smtp-Source: ABdhPJzbn+DmG8b0+YAooZV+sW8jO+BCSIm8/zqlbYXznrB9TaRejeGUUFs9CqxMhBQNv9z4O2KzuD0odgsc7iwM9wA=
X-Received: by 2002:a9d:4b99:: with SMTP id k25mr16608843otf.327.1614669404078; 
 Mon, 01 Mar 2021 23:16:44 -0800 (PST)
MIME-Version: 1.0
References: <1605177598-23501-1-git-send-email-gene.chen.richtek@gmail.com>
 <1605177598-23501-5-git-send-email-gene.chen.richtek@gmail.com>
 <74b127eb-9a3c-20c9-5692-b00b982f4da3@gmail.com>
 <CAE+NS34qR9f2LOpvxTBDF4OR=Xq-SFP+uHdWe3dZ5x8xggS8kA@mail.gmail.com>
 <20210115073241.GC3975472@dell>
In-Reply-To: <20210115073241.GC3975472@dell>
From: Gene Chen <gene.chen.richtek@gmail.com>
Date: Tue, 2 Mar 2021 15:16:34 +0800
Message-ID: <CAE+NS37hVMVJA04ZmdcfKvw05ga1-vT=fGRAf=bh17XOJHEh4A@mail.gmail.com>
Subject: Re: [PATCH v7 04/11] mfd: mt6360: Combine mt6360 pmic/ldo resources
 into mt6360 regulator resources
To: Lee Jones <lee.jones@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_021646_775271_06EE0207 
X-CRM114-Status: GOOD (  22.78  )
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
Cc: Gene Chen <gene_chen@richtek.com>, devicetree <devicetree@vger.kernel.org>,
 linux-pm@vger.kernel.org, sre@kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 ChiYuan Huang <cy_huang@richtek.com>, benjamin.chao@mediatek.com,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Wilma.Wu@mediatek.com,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

TGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4g5pa8IDIwMjHlubQx5pyIMTXml6Ug6YCx
5LqUIOS4i+WNiDM6MzLlr6vpgZPvvJoKPgo+IE9uIEZyaSwgMTUgSmFuIDIwMjEsIEdlbmUgQ2hl
biB3cm90ZToKPgo+ID4gTWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT4g
5pa8IDIwMjHlubQx5pyIMTLml6Ug6YCx5LqMIOS4i+WNiDg6MzLlr6vpgZPvvJoKPiA+ID4KPiA+
ID4KPiA+ID4KPiA+ID4gT24gMTIvMTEvMjAyMCAxMTozOSwgR2VuZSBDaGVuIHdyb3RlOgo+ID4g
PiA+IEZyb206IEdlbmUgQ2hlbiA8Z2VuZV9jaGVuQHJpY2h0ZWsuY29tPgo+ID4gPiA+Cj4gPiA+
ID4gQ29tYmluZSBtdDYzNjAgcG1pYy9sZG8gcmVzb3VyY2VzIGludG8gbXQ2MzYwIHJlZ3VsYXRv
ciByZXNvdXJjZXMKPiA+ID4gPiB0byBzaW1wbGlmeSB0aGUgc2ltaWxhciByZXNvdXJjZXMgb2Jq
ZWN0Lgo+ID4gPiA+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogR2VuZSBDaGVuIDxnZW5lX2NoZW5A
cmljaHRlay5jb20+Cj4gPiA+ID4gQWNrZWQtZm9yLU1GRC1ieTogTGVlIEpvbmVzIDxsZWUuam9u
ZXNAbGluYXJvLm9yZz4KPiA+ID4gPiAtLS0KPiA+ID4gPiAgZHJpdmVycy9tZmQvbXQ2MzYwLWNv
cmUuYyB8IDExICsrKy0tLS0tLS0tCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKyksIDggZGVsZXRpb25zKC0pCj4gPiA+ID4KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9tZmQvbXQ2MzYwLWNvcmUuYyBiL2RyaXZlcnMvbWZkL210NjM2MC1jb3JlLmMKPiA+ID4gPiBp
bmRleCA2OTJlNDdiLi41MTE5ZTUxIDEwMDY0NAo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvbWZkL210
NjM2MC1jb3JlLmMKPiA+ID4gPiArKysgYi9kcml2ZXJzL21mZC9tdDYzNjAtY29yZS5jCj4gPiA+
ID4gQEAgLTI2NSw3ICsyNjUsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHJlc291cmNlIG10NjM2
MF9sZWRfcmVzb3VyY2VzW10gPSB7Cj4gPiA+ID4gICAgICAgREVGSU5FX1JFU19JUlFfTkFNRUQo
TVQ2MzYwX0ZMRUQxX1NUUkJfVE9fRVZULCAiZmxlZDFfc3RyYl90b19ldnQiKSwKPiA+ID4gPiAg
fTsKPiA+ID4gPgo+ID4gPiA+IC1zdGF0aWMgY29uc3Qgc3RydWN0IHJlc291cmNlIG10NjM2MF9w
bWljX3Jlc291cmNlc1tdID0gewo+ID4gPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHJlc291cmNl
IG10NjM2MF9yZWd1bGF0b3JfcmVzb3VyY2VzW10gPSB7Cj4gPiA+ID4gICAgICAgREVGSU5FX1JF
U19JUlFfTkFNRUQoTVQ2MzYwX0JVQ0sxX1BHQl9FVlQsICJidWNrMV9wZ2JfZXZ0IiksCj4gPiA+
ID4gICAgICAgREVGSU5FX1JFU19JUlFfTkFNRUQoTVQ2MzYwX0JVQ0sxX09DX0VWVCwgImJ1Y2sx
X29jX2V2dCIpLAo+ID4gPiA+ICAgICAgIERFRklORV9SRVNfSVJRX05BTUVEKE1UNjM2MF9CVUNL
MV9PVl9FVlQsICJidWNrMV9vdl9ldnQiKSwKPiA+ID4gPiBAQCAtMjc4LDkgKzI3OCw2IEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgcmVzb3VyY2UgbXQ2MzYwX3BtaWNfcmVzb3VyY2VzW10gPSB7Cj4g
PiA+ID4gICAgICAgREVGSU5FX1JFU19JUlFfTkFNRUQoTVQ2MzYwX0xETzdfT0NfRVZULCAibGRv
N19vY19ldnQiKSwKPiA+ID4gPiAgICAgICBERUZJTkVfUkVTX0lSUV9OQU1FRChNVDYzNjBfTERP
Nl9QR0JfRVZULCAibGRvNl9wZ2JfZXZ0IiksCj4gPiA+ID4gICAgICAgREVGSU5FX1JFU19JUlFf
TkFNRUQoTVQ2MzYwX0xETzdfUEdCX0VWVCwgImxkbzdfcGdiX2V2dCIpLAo+ID4gPiA+IC19Owo+
ID4gPiA+IC0KPiA+ID4gPiAtc3RhdGljIGNvbnN0IHN0cnVjdCByZXNvdXJjZSBtdDYzNjBfbGRv
X3Jlc291cmNlc1tdID0gewo+ID4gPiA+ICAgICAgIERFRklORV9SRVNfSVJRX05BTUVEKE1UNjM2
MF9MRE8xX09DX0VWVCwgImxkbzFfb2NfZXZ0IiksCj4gPiA+ID4gICAgICAgREVGSU5FX1JFU19J
UlFfTkFNRUQoTVQ2MzYwX0xETzJfT0NfRVZULCAibGRvMl9vY19ldnQiKSwKPiA+ID4gPiAgICAg
ICBERUZJTkVfUkVTX0lSUV9OQU1FRChNVDYzNjBfTERPM19PQ19FVlQsICJsZG8zX29jX2V2dCIp
LAo+ID4gPiA+IEBAIC0yOTgsMTAgKzI5NSw4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbWZkX2Nl
bGwgbXQ2MzYwX2RldnNbXSA9IHsKPiA+ID4gPiAgICAgICAgICAgICAgICAgICBOVUxMLCAwLCAw
LCAibWVkaWF0ZWssbXQ2MzYwLWNoZyIpLAo+ID4gPiA+ICAgICAgIE9GX01GRF9DRUxMKCJtdDYz
NjAtbGVkIiwgbXQ2MzYwX2xlZF9yZXNvdXJjZXMsCj4gPiA+ID4gICAgICAgICAgICAgICAgICAg
TlVMTCwgMCwgMCwgIm1lZGlhdGVrLG10NjM2MC1sZWQiKSwKPiA+ID4gPiAtICAgICBPRl9NRkRf
Q0VMTCgibXQ2MzYwLXBtaWMiLCBtdDYzNjBfcG1pY19yZXNvdXJjZXMsCj4gPiA+ID4gLSAgICAg
ICAgICAgICAgICAgTlVMTCwgMCwgMCwgIm1lZGlhdGVrLG10NjM2MC1wbWljIiksCj4gPiA+ID4g
LSAgICAgT0ZfTUZEX0NFTEwoIm10NjM2MC1sZG8iLCBtdDYzNjBfbGRvX3Jlc291cmNlcywKPiA+
ID4gPiAtICAgICAgICAgICAgICAgICBOVUxMLCAwLCAwLCAibWVkaWF0ZWssbXQ2MzYwLWxkbyIp
LAo+ID4gPiA+ICsgICAgIE9GX01GRF9DRUxMKCJtdDYzNjAtcmVndWxhdG9yIiwgbXQ2MzYwX3Jl
Z3VsYXRvcl9yZXNvdXJjZXMsCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgTlVMTCwgMCwgMCwg
Im1lZGlhdGVrLG10NjM2MC1yZWd1bGF0b3IiKSwKPiA+ID4KPiA+ID4gQXMgZGlzY3Vzc2VkIHdp
dGggdGhlIE1GRCBtYWludGFpbmVyIFsxXSwgdGhlIHJlZ3VsYXRvciAoYW5kIHByb2JhYmx5IGFs
bCBjZWxscykKPiA+ID4gc2hvdWxkbid0IGhhdmUgYSBEVCBiaW5kaW5nLgo+ID4gPgo+ID4gPiBT
byBwbGVhc2Ugc2VuZCBhIG5ldyB2ZXJzaW9uIHdoaWNoIGZpeGVzIHRoYXQuCj4gPiA+Cj4gPiA+
IFJlZ2FyZHMsCj4gPiA+IE1hdHRoaWFzCj4gPiA+Cj4gPiA+IFsxXSBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1tZWRpYXRlay8yMDIxMDExMTE2NDExOC5HRTQ3MjhAc2lyZW5hLm9yZy51
ay8KPgo+IEkgZG9uJ3QgdGhpbmsgTWFyayBpcyBjb3JyZWN0IGhlcmUuCj4KPiBXZSB1c3VhbGx5
IGRvIGltcGxlbWVudCBjb21wYXRpYmxlIHN0cmluZ3MgZm9yIHN1Yi1kZXZpY2VzIGFuZCB0aGV5
IGRvCj4gdGVuZCB0byBoYXZlIHRoZWlyIG93biBkZXZpY2Ugbm9kZXMuCj4KPiBJdCdzIGEgdmVy
eSBsb25nIHRpbWUgYWdvIHNpbmNlIEkgY29kZWQgdGhpcyB1cCBteXNlbGYsIGJ1dCBmcm9tCj4g
bWVtb3J5LCB5b3UgY2FuJ3QgaGF2ZSAyIGRldmljZXMgc2hhcmUgYSBjb21wYXRpYmxlIHN0cmlu
Zy4KPgoKRWl0aGVyIE1hcmsgb3IgTGVlIHN1Z2dlc3Rpb24gaXMgd29yay4KSXMgdGhlcmUgYSBj
b25jbHVzaW9uIHRoYXQgd2UgY2FuIGFwcGx5IGl0PwpJZiBNRkQgaXMgYWxyZWFkeSBzdXBwb3J0
ZWQgb2ZfY29tcGF0aWJsZSwgd2UgcHJlZmVyIHVzZSBvZl9jb21wYXRpYmxlIG1hcHBpbmcuCgo+
ID4gU2hvdWxkIEkgdXNlIHBhcmVudCdzIGRldmljZSB0byBmaW5kIHN1Yi1kZXZpY2VzIG9mX25v
ZGUgaWYgd2l0aG91dAo+ID4gY29tcGF0aWJsZSBuYW1lPwo+ID4gSSB0cmFjZSB0aGUgZnVuY3Rp
b24gbWZkX2FkZF9kZXZpY2UsCj4gPgo+ID4gaWYgKElTX0VOQUJMRUQoQ09ORklHX09GKSAmJiBw
YXJlbnQtPm9mX25vZGUgJiYgY2VsbC0+b2ZfY29tcGF0aWJsZSkgewo+ID4gICAgIC4uLi4uCj4g
PiAgICAgcmV0ID0gbWZkX21hdGNoX29mX25vZGVfdG9fZGV2KHBkZXYsIG5wLCBjZWxsKTsKPiA+
ICAgICAuLi4uLgo+ID4gfQo+ID4KPiA+IHdoaWNoIGlzIGJpbmRpbmcgbWZkIHN1Yi1kZXZpY2Ug
d2l0aCBjb21wYXRpYmxlLiBEb2VzIGl0IGJlIHJlbW92ZWQgaW4KPiA+IHRoZSBmZWF0dXJlPwo+
ID4KPiA+ID4gPiAgICAgICBPRl9NRkRfQ0VMTCgibXQ2MzYwLXRjcGMiLCBOVUxMLAo+ID4gPiA+
ICAgICAgICAgICAgICAgICAgIE5VTEwsIDAsIDAsICJtZWRpYXRlayxtdDYzNjAtdGNwYyIpLAo+
ID4gPiA+ICB9Owo+ID4gPiA+Cj4KPiAtLQo+IExlZSBKb25lcyBb5p2O55C85pavXQo+IFNlbmlv
ciBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwo+IExpbmFyby5vcmcg4pSCIE9w
ZW4gc291cmNlIHNvZnR3YXJlIGZvciBBcm0gU29Dcwo+IEZvbGxvdyBMaW5hcm86IEZhY2Vib29r
IHwgVHdpdHRlciB8IEJsb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbWVkaWF0ZWsK
