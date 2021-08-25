Return-Path: <SRS0=pvhC=NQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92EF5C432BE
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 03:50:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AE816128A
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 03:50:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5AE816128A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=vanguardiasur.com.ar
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C6dyX5ykZke5XMk2IW9v6UkmiO5PVQrHIVn5LeIIfds=; b=WssSdys2JDjVEL
	DcjieNGuDHN8VlDo9rwkjHrsWVhTTnnIYX95igHRY42w53TW8ms6aLekAtTd0Cwbr+vTl3iEn0xv6
	IsMllYuKY/Z/9k/HrZKr6xYtVveOyySpMYL6thMScVKSSn/AqZxz+zRlLWqb6k1qltjfTR2lXpRDz
	nDLWJNualxIsK/AsAVKx4FsUcflPj2oehqIwVx3WH3k/Fx6zKOVwaTRX3XRdpEj7YSitavlEsU2eW
	oSPvGYzZ1pY2MgLsOCBBX+80+CdG+BAnwWIvvtwQpxBXnMv/BrmMROWrFT0vcVtsJxcZI2Baac20d
	dG9dA/v0qki6klRGyw/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIjvX-005OhG-MM; Wed, 25 Aug 2021 03:50:11 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIjvH-005OZd-MA
 for linux-mediatek@lists.infradead.org; Wed, 25 Aug 2021 03:49:59 +0000
Received: by mail-ed1-x52f.google.com with SMTP id g22so4441082edy.12
 for <linux-mediatek@lists.infradead.org>; Tue, 24 Aug 2021 20:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3kZXI1vtvS0Yvb6slBFRI9pS9XAeJXzQm2yXW938Umo=;
 b=rYLlw4fbNP1HTkXasUqH8ZRD7nxcL0P7KPGpLdqgwnOWslAsIhC9jnsZlxrx5otqpo
 0N0Z+R3+Qd9VBsJP0pp/X6mjgcKX3uDeXXaB5/YKqIdbBniid8BqTFbbBMuUFH7VRQ2T
 Gzc7ZpquX6irb4GDSnakgLUYLUbs6xRt4YJIpJX+XMSY3x77cXB6jDgxNm+O18zr5b8A
 kTeVsXIQ2igplvXzF6erSAKUInYqMD2njfkNLSEu8YQh/71OI4SqC48mpwOC+CZoa+ol
 I86mqWiZk1OM2fNoHpEGJrBm8W8vMZr1pSS/ixy3CwCqtxKi/Hz96FMuVoW6m/o4UpRv
 PLHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3kZXI1vtvS0Yvb6slBFRI9pS9XAeJXzQm2yXW938Umo=;
 b=YZN3LrUix0MhrtSjoLNQMdw19bTO5fAH6IN8Cq3CMO5vtJFXAGXI17niHw2U/Um5PD
 +GcyLObmJRH7xUXpdwZ2L18BLn1VDIR7yyx6hfYg9f6tE/HBgw7/tbi1WtLzGgbWQtXY
 De7uO6YrMzSPuAsR5EiHW0pVHJlKU+AKMqyx80TwyqolPNzoe/pmGOUeyQBS97Y6hztJ
 tUdUqpHbwbqEsmIEMDSvN0sgdog2Tc2efKIu3QACeQpO+VaD9hW795MC5RnDQ3fsw5vv
 3CV1SW61y+q7H1KVIXsn+Rab4sIe1ZJ0bcEmjsb7t7aR/AiNN+mt8FJ1/BTH/uISYo5b
 AGJA==
X-Gm-Message-State: AOAM531IEgWUhY+vr/hrkxylxHFou7r8ZUibk1KL0Zs2pwDwuQSNbCio
 tFLjcNXhi3E3l+2yfsq/dKmcUJsy7fH8kccVAf7RvQ==
X-Google-Smtp-Source: ABdhPJz6WxJB9n9R0lhxCYrp90OGkbSPfI3upiI7vUcraPT3a8lXeVRKeYJ+3pLVzsidvy6f73vg7LbF70pb18gBPoI=
X-Received: by 2002:a05:6402:693:: with SMTP id
 f19mr20106726edy.213.1629863393359; 
 Tue, 24 Aug 2021 20:49:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210816105934.28265-1-irui.wang@mediatek.com>
 <20210816105934.28265-2-irui.wang@mediatek.com>
 <CAAEAJfDoSW3F85bFKTRvvGZXTZbCBRpUwZzEyx3zhrA6psiZfA@mail.gmail.com>
 <6efbfdbac55c5c8175168be96d3a2e63b4ac0f07.camel@mediatek.com>
In-Reply-To: <6efbfdbac55c5c8175168be96d3a2e63b4ac0f07.camel@mediatek.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Wed, 25 Aug 2021 00:49:41 -0300
Message-ID: <CAAEAJfBvWDqtb8oqxx9zosEbBhFVMiszG2cu=Y7OXx3-T4gAOQ@mail.gmail.com>
Subject: Re: [PATCH 1/9] dt-bindings: media: mtk-vcodec: Add binding for
 MT8195 two venc cores
To: =?UTF-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, 
 =?UTF-8?B?TG9uZ2ZlaSBXYW5nICjnjovpvpnpo54p?= <Longfei.Wang@mediatek.com>, 
 =?UTF-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>, 
 "frkoenig@chromium.org" <frkoenig@chromium.org>, 
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
 =?UTF-8?B?TWFvZ3VhbmcgTWVuZyAo5a2f5q+b5bm/KQ==?= <Maoguang.Meng@mediatek.com>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "tzungbi@chromium.org" <tzungbi@chromium.org>, 
 =?UTF-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>, 
 =?UTF-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>, 
 srv_heupstream <srv_heupstream@mediatek.com>,
 "tfiga@google.com" <tfiga@google.com>, 
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
 "hsinyi@chromium.org" <hsinyi@chromium.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
 =?UTF-8?B?QW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qik=?= <Andrew-CT.Chen@mediatek.com>,
 "acourbot@chromium.org" <acourbot@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_204956_336262_E70DA03D 
X-CRM114-Status: GOOD (  25.48  )
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

T24gVHVlLCAyNCBBdWcgMjAyMSBhdCAyMzowNCwgSXJ1aSBXYW5nICjnjovnkZ4pIDxJcnVpLldh
bmdAbWVkaWF0ZWsuY29tPiB3cm90ZToKPgo+IEhpLEV6ZXF1aWVsLAo+Cj4gVGhhbmtzIGZvciB5
b3VyIHJldmlld2luZy4KPgo+IE9uIFR1ZSwgMjAyMS0wOC0yNCBhdCAwODowMiAtMDMwMCwgRXpl
cXVpZWwgR2FyY2lhIHdyb3RlOgo+ID4gSGkgSXJ1aSwKPiA+Cj4gPiBPbiBNb24sIDE2IEF1ZyAy
MDIxIGF0IDA4OjAwLCBJcnVpIFdhbmcgPGlydWkud2FuZ0BtZWRpYXRlay5jb20+Cj4gPiB3cm90
ZToKPiA+ID4KPiA+ID4gRW5hYmxlIE1UODE5NSB0d28gSC4yNjQgdmVuYyBjb3JlcywgdXBkYXRl
cyB2Y29kZWMgYmluZGluZwo+ID4gPiBkb2N1bWVudC4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1i
eTogSXJ1aSBXYW5nIDxpcnVpLndhbmdAbWVkaWF0ZWsuY29tPgo+ID4gPiAtLS0KPiA+ID4gIERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlay12Y29kZWMudHh0
IHwgMiArKwo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+ID4gPgo+ID4g
PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21l
ZGlhdGVrLQo+ID4gPiB2Y29kZWMudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL21lZGlhL21lZGlhdGVrLQo+ID4gPiB2Y29kZWMudHh0Cj4gPiA+IGluZGV4IGRlOTYxNjk5
YmEwYS4uZWIyZTI0YzMyNDI2IDEwMDY0NAo+ID4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWstdmNvZGVjLnR4dAo+ID4gPiArKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWstdmNvZGVjLnR4dAo+
ID4gPiBAQCAtMTEsNiArMTEsOCBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzOgo+ID4gPiAgICAibWVk
aWF0ZWssbXQ4MTczLXZjb2RlYy1kZWMiIGZvciBNVDgxNzMgZGVjb2Rlci4KPiA+ID4gICAgIm1l
ZGlhdGVrLG10ODE5Mi12Y29kZWMtZW5jIiBmb3IgTVQ4MTkyIGVuY29kZXIuCj4gPiA+ICAgICJt
ZWRpYXRlayxtdDgxOTUtdmNvZGVjLWVuYyIgZm9yIE1UODE5NSBlbmNvZGVyLgo+ID4gPiArICAi
bWVkaWF0ZWssbXRrLXZlbmMtY29yZTAiIGZvciBNVDgxOTUgYXZjIGNvcmUwIGRldmljZS4KPiA+
ID4gKyAgIm1lZGlhdGVrLG10ay12ZW5jLWNvcmUxIiBmb3IgTVQ4MTk1IGF2YyBjb3JlMSBkZXZp
Y2UuCj4gPgo+ID4gV2hhdCBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIGNvcmUwIGFuZCBjb3Jl
MT8KPiA+Cj4gPiBUaGFua3MsCj4gPiBFemVxdWllbAo+Cj4gQm90aCBjb3JlMCBhbmQgY29yZTEg
YXJlIEgyNjQgZW5jb2RlciBoYXJkd2FyZSwgdGhleSBoYXZlIHRoZWlyIG93bgo+IGhhcmR3YXJl
IHJlZ2lzdGVyIGJhc2UsIHVzZWQgcG93ZXItZG9tYWlucy9jbG9ja3MvaXJxcy4gV2UgY2FuIHVz
ZSBhbnkKPiBvZiB0aGVtIGZvciBILjI2NCBlbmNvZGluZywgYnV0IHRoZSB0d28gY29yZXMgY2Fu
IHdvcmsgdG9nZXRoZXIgZm9yCj4gaGlnaGVyIHBlcmZvcm1hbmNlLCBpdCdzIGNhbGxlZCAiZnJh
bWUgcmFjaW5nIiwgYSBoYXJkd2FyZSBlbmNvZGluZwo+IG1vZGUsIGNvbnRyb2wgZmxvdyBqdXN0
IGxpa2UgaW4gdGhlIGNvbW1pdCBtZXNzYWdlczoKPgo+IGNvcmUwIGZyYW1lIzAuZnJhbWUjMi5m
cmFtZSM0Li4uCj4gY29yZTEgICAgZnJhbWUjMS5mcmFtZSMzLmZyYW1lIzUuLi4KPgoKSWYgdGhl
eSBhcmUgdHdvIGVuY29kZXIgY29yZXMsIHdoeSBkbyB5b3UgbmVlZCBkaWZmZXJlbnQgY29tcGF0
aWJsZSBzdHJpbmdzPwoKSXQgd291bGQgYmUgaW50ZXJlc3RpbmcgdG8gc2VlIGEgZGV2aWNlIHRy
ZWUgd2hpY2ggc2hvd3MgaG93IHRoaXMgc2hvdWxkCmJlIHVzZWQgaW4gdGhlIHJlYWwgd29ybGQs
IGJ1dCBmcm9tIHRoZSBsb29rcyBvZiBpdCwgaXQgc2VlbXMgeW91IGRvbid0Cm5lZWQgYSBzZXBh
cmF0ZSBjb21wYXRpYmxlLgoKSXQgc2VlbXMgdGhpcyBzZXJpZXMgaXMgc29tZXdoYXQgcmVsYXRl
ZCB0byBZdW5mZWkncyAiW1BBVENIIHY1LAowMC8xNV0gVXNpbmcgY29tcG9uZW50IGZyYW1ld29y
ayB0byBzdXBwb3J0IG11bHRpIGhhcmR3YXJlIGRlY29kZSIsCmJ1dCBJIGRvbid0IHNlZSBhIGRl
dmljZSB0cmVlIHBhdGNoIGVpdGhlciBpbiB0aGF0IHNlcmllcy4KCkdpdmVuIHRoaXMgaXMgYSBj
b21wbGV4IGFyY2hpdGVjdHVyZSwgSSBkb24ndCBrbm93IGlmIGl0Cm1ha2VzIHNlbnNlIHRvIGRp
c2N1c3MgZGVjb2RlciBhbmQgZW5jb2RlciBpbmRlcGVuZGVudGx5LgoKSWYgeW91IGd1eXMgdW5p
ZnkgdGhlIHR3byBzZXJpZXMsIGFuZCBhZGQgdGhlIGRldmljZSB0cmVlIHBhdGNoZXMgZm9yIGl0
LApvciBhdCBsZWFzdCBmb3IgdGhlIG1vc3QgY29tcGxleCBjYXNlcywgbWF5YmUgdGhhdCB3aWxs
IHN1cmZhY2UgdGhlCmFyY2hpdGVjdHVyZSBtb3JlIGNsZWFybHkgYW5kIGNvbWUgdXAgd2l0aCBh
biBlYXNpZXIgc29sdXRpb24gdGhhdApkb2Vzbid0IGludm9sdmUKYW4gYXN5bmMgZnJhbWV3b3Jr
IHRvIHB1bGwgaW4gdGhlIHBhcnRzIHRvZ2V0aGVyLgoKVGhhbmtzLApFemVxdWllbAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsg
bWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
