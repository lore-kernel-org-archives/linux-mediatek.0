Return-Path: <SRS0=vV1m=M2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C236C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 10:34:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A09F6023B
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 10:34:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2A09F6023B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C9Vyv30mUz+qAZ8nHWGXsDJ/44C96GcD2Wd/zmGTxCQ=; b=HQUcD0oTeFQo4H
	DmFmROM6L3XXGnJ3fO0p986BxS1juDKgG2t4AviDp+bVH8WKSFLtcb+zJOGQ/wQDEyLLtRvnxOjYU
	/lTQEM2Q8Q8JGL2Ymuj8Ormffm74xw6cnBS05+h3s8GDAHMAf+1v8uq2JpJ1ONc7kvV8sPtt+5Est
	0KTRMmoJ/AKIhdV0GhXoFKRwjg6qyY0TO5TLL7xDXdppuwF3OT0gjkWzplalk1ZjkiFG2XEF4lPY5
	N9y7EZ1zQsQMZ+5D1D4Yh4GNFzXQpgEqvQbEGP0dE9l84yXRIng56i4moNOl/fiD6FaSO4jZZos+m
	JgtcxJbP7V+komSvMJHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mArkr-00246Z-OX; Tue, 03 Aug 2021 10:34:37 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mArgT-00222v-GB; Tue, 03 Aug 2021 10:30:08 +0000
Received: by mail-ot1-x332.google.com with SMTP id
 61-20020a9d0d430000b02903eabfc221a9so20296758oti.0; 
 Tue, 03 Aug 2021 03:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3psQaSG4d8w1oQM2avr7nhWCNx0TL7drom5fez4dSiA=;
 b=fIfnWsy3hsqYB+PJtAaqeFHZ2boRJZ5sjE/ghiWyO7OXl3t78XlU35QhG2nOjwQw/S
 T7GmDRZ9VA+QBgDBuBGktWIhdhlZU8y/L4vnzPvwpyJfP4jT9GsTk1bJhUoQjO2c6NLu
 HX6d8qiCRup83YWKzbWwfLsVoqRsP3ZTk6VBn3fR3uiseGmyP+OlSPXL+47EemdkSDdM
 usvB9EZlI95pRRVWj3+FoE4evyPoPANbEC70Jg9DBHDX6StbDfi1PDfclEB0yVuAvc/K
 Tg5ZXW9ac+ngp/hGny7Jqnxc8UjtB6gF0XmpE9FgEk3z9BNDT3QlXlayKxRlxiQsav/R
 Swag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3psQaSG4d8w1oQM2avr7nhWCNx0TL7drom5fez4dSiA=;
 b=VN9s3Qm1PM7Vi91XOATnsgF+MVWZaVZV1I2gEs1gXvjoDWnj/EGJWqJygczmDh8wMe
 6iJogFE5u3lMvI0mS7pgjGOqk77PXlXhTwcfyv8dgk9DXSMSsHk5N1KBdDrO88bRib9b
 aEQ3Ot3zwH8rm97AbMhKOyM5yMC8utW8dbFBgJHF0Gj13D7QYrTzF1lLU58MQ/hCxcpp
 iKIozFzNzOMXV32Ob4HnkJICGHqfZChPkXv30J20+Wl6NFMwEM3AEbTKQWwc7ZQMClPr
 yawv9Qg5obcboAwJ0//LTH9QJC6UG4mMyRYzwdCv1LZcbV9XihMw/7hw/3+Q/Hg00kNl
 9C4g==
X-Gm-Message-State: AOAM533PsSWDMDioKuF0Mlgcn8zGxExIqwfqsM2wIQGNI2ckflhM9akQ
 4IR7l9MmX5qABvq0eyH3Q/7yU4b+2Jj279C3g5s=
X-Google-Smtp-Source: ABdhPJz7aYEd1VRZtveXnt0Uwl+nfwcojVZh6wKc8vyRBwlK5dggbGl+2+Ssk57ujfH0wJjXVjtVV0NXFs2KSY3sNV8=
X-Received: by 2002:a9d:27a4:: with SMTP id c33mr15305949otb.281.1627986604246; 
 Tue, 03 Aug 2021 03:30:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210802121215.703023-1-eizan@chromium.org>
In-Reply-To: <20210802121215.703023-1-eizan@chromium.org>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Tue, 3 Aug 2021 12:29:52 +0200
Message-ID: <CAFqH_51ZYwokcWAV0tg5z3vBhHmP3MHGKYf=jWDCa78RSYpifw@mail.gmail.com>
Subject: Re: [PATCH v6 0/9] Refactor MTK MDP driver into core/components
To: Eizan Miyamoto <eizan@chromium.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 Chen-Yu Tsai <wenst@chromium.org>, 
 Houlong Wei <houlong.wei@mediatek.com>, Yong Wu <yong.wu@mediatek.com>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 devicetree <devicetree@vger.kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_033005_616594_AAB962A1 
X-CRM114-Status: GOOD (  24.56  )
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

SGkgYWxsLAoKTWlzc2F0Z2UgZGUgRWl6YW4gTWl5YW1vdG8gPGVpemFuQGNocm9taXVtLm9yZz4g
ZGVsIGRpYSBkbC4sIDIgZOKAmWFnLgoyMDIxIGEgbGVzIDE0OjEyOgo+Cj4KPiBUaGlzIGlzIGFu
IHVwZGF0ZSB0bwo+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1t
ZWRpYXRlay9saXN0Lz9zZXJpZXM9MjgzMDc1Cj4gVG8gYWRkcmVzcyBzb21lIGNvbW1lbnRzIGFu
ZCBmaXhlcy4KPgo+IFRoaXMgc2VyaWVzIGhhcyBiZWVuIHZlcmlmaWVkIHRvIHdvcmsgb24gNS4x
My4KPgoKVGhlIHNlcmllcyBoYXZlIGFsc28gYmVlbiB2YWxpZGF0ZWQgb24gdG9wIG9mIDUuMTQt
cmM0IGFuZCBsaW51eC1uZXh0Cm9uIGFuIEFjZXIgQ2hyb21lYm9vayBSIDEzIHdpdGhvdXQgb2Jz
ZXJ2aW5nIGFueSBwcm9ibGVtcyBhbmQgcnVubmluZwpzb21lIHZpZGVvIGRlY29kaW5nIHRlc3Rz
LCBzbywgZm9yIHRoZSBmdWxsIHNlcmllcy4KClRlc3RlZC1ieTogRW5yaWMgQmFsbGV0Ym8gaSBT
ZXJyYSA8ZW5yaWMuYmFsbGV0Ym9AY29sbGFib3JhLmNvbT4KCj4KPiBDaGFuZ2VzIGluIHY2Ogo+
IC0gRG9uJ3QgcHJvcGFnYXRlIGVycm9ycyBmcm9tIGNsb2NrX29uL29mZiBhcyBhbiBhZnRlcnRo
b3VnaHQuCj4gLSBTcGxpdCBhcGFydCBtb2RpZnlpbmcgbWRwIGRyaXZlciB0byBiZSBsb2FkYWJs
ZSBmcm9tIG1tc3lzIGZyb20KPiAgIGFjdHVhbGx5IGxvYWRpbmcgaXQgZnJvbSBtbXN5cyBpbnRv
IHR3byBjaGFuZ3MgdG8gbWFrZSByZXZpZXcgZWFzaWVyLgo+IC0gVXBkYXRlIGRldmljZXRyZWUg
YmluZGluZ3MgdG8gcmVmbGVjdCBubyBsb25nZXIgbmVlZGluZyB0aGUKPiAgIG1lZGlhdGVrLHZw
dSBwcm9wZXJ0eSBpbiB0aGUgbWRwX3JkbWEwIGRldmljZSBub2RlLgo+IC0gU29tZSBzdHlsaXN0
aWMgY2xlYW51cHMuCj4KPiBDaGFuZ2VzIGluIHY1Ogo+IC0gcmViYXNlIGFuZCB0ZXN0IG9uIDUu
MTMtbmV4dCBAIGUyZjc0YjEzZGJlNgo+Cj4gQ2hhbmdlcyBpbiB2NDoKPiAtIHJlYmFzZSBhbmQg
dGVzdCBvbiA1LjEzCj4gLSBkb24ndCBkZXBlbmQgb24gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVs
Lm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVrL2xpc3QvP3Nlcmllcz00NjQ4NzMKPgo+IENoYW5n
ZXMgaW4gdjM6Cj4gLSBnZXQgbWRwIG1hc3RlciBmcm9tIGFsaWFzZXMgaW5zdGVhZCBvZiBzdHJj
bXAgYWdhaW5zdCBvZl9ub2RlLT5uYW1lCj4KPiBDaGFuZ2VzIGluIHYyOgo+IC0gcmViYXNlZCBv
bnRvIExpbnV4IDUuMTIKPiAtIDEwMCBjaGFyIGxpbmUgbGVuZ3RoIGFsbG93YW5jZSB3YXMgdXRp
bGl6ZWQgaW4gYSBmZXcgcGxhY2VzCj4gLSBSZW1vdmFsIG9mIGEgcmVkdW5kYW50IGRldl9lcnIo
KSBwcmludCBhdCB0aGUgZW5kIG9mCj4gICBtdGtfbWRwX2NvbXBfaW5pdCgpCj4gLSBJbnN0ZWFk
IG9mIHByaW50aW5nIGVycm9ycyBhbmQgaWdub3JpbmcgdGhlbSwgSSd2ZSBhZGRlZCBhIHBhdGNo
IHRvCj4gICBjb3JyZWN0bHkgcHJvcGFnYXRlIHRoZW0uCj4gLSBVc2Ugb2YgQyBzdHlsZSBjb21t
ZW50cy4KPiAtIFRocmVlIGFkZGl0aW9uYWwgcGF0Y2hlcyB3ZXJlIGFkZGVkIHRvIGVsaW1pbmF0
ZSBkZXBlbmRlbmN5IG9uIHRoZQo+ICAgbWVkaWF0ZWssdnB1IHByb3BlcnR5IGluc2lkZSB0aGUg
bWRwX3JkbWEwIGRldmljZSBub2RlLgo+Cj4gRWl6YW4gTWl5YW1vdG8gKDkpOgo+ICAgbXRrLW1k
cDogcHJvcGFnYXRlIGVycm9ycyBmcm9tIGNsb2NrX29uCj4gICBtdGstbWRwOiBhZGQgZHJpdmVy
IHRvIHByb2JlIG1kcCBjb21wb25lbnRzCj4gICBtdGstbWRwOiB1c2UgcG1fcnVudGltZSBpbiBN
RFAgY29tcG9uZW50IGRyaXZlcgo+ICAgbWVkaWE6IG10ay1tZHA6IGRvbid0IHBtX3J1bl90aW1l
X2dldC9wdXQgZm9yIG1hc3RlciBjb21wIGluIGNsb2NrX29uCj4gICBtdGstbWRwOiBtYWtlIG1k
cCBkcml2ZXIgdG8gYmUgbG9hZGFibGUgYnkgcGxhdGZvcm1fZGV2aWNlX3JlZ2lzdGVyKigpCj4g
ICBzb2M6IG1lZGlhdGVrOiBtbXN5czogaW5zdGFudGlhdGUgbWRwIHZpcnR1YWwgZGV2aWNlIGZy
b20gbW1zeXMKPiAgIG1lZGlhOiBtdGstbWRwOiB1c2UgbWRwLXJkbWEwIGFsaWFzIHRvIHBvaW50
IHRvIE1EUCBtYXN0ZXIKPiAgIGR0czogbXRrLW1kcDogcmVtb3ZlIG1lZGlhdGVrLHZwdSBwcm9w
ZXJ0eSBmcm9tIHByaW1hcnkgTURQIGRldmljZQo+ICAgZHQtYmluZGluZ3M6IG1lZGlhdGVrOiBy
ZW1vdmUgdnB1IHJlcXVpcmVtZW50IGZyb20gbXRrLW1kcAo+Cj4gIC4uLi9iaW5kaW5ncy9tZWRp
YS9tZWRpYXRlay1tZHAudHh0ICAgICAgICAgICB8ICAgMyAtCj4gIGFyY2gvYXJtNjQvYm9vdC9k
dHMvbWVkaWF0ZWsvbXQ4MTczLmR0c2kgICAgICB8ICAgMSAtCj4gIGRyaXZlcnMvbWVkaWEvcGxh
dGZvcm0vbXRrLW1kcC9tdGtfbWRwX2NvbXAuYyB8IDI2OCArKysrKysrKysrKysrKystLQo+ICBk
cml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1tZHAvbXRrX21kcF9jb21wLmggfCAgMzQgKy0tCj4g
IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLW1kcC9tdGtfbWRwX2NvcmUuYyB8IDI4MiArKysr
KysrKysrKystLS0tLS0KPiAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstbWRwL210a19tZHBf
Y29yZS5oIHwgICAzICsKPiAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstbWRwL210a19tZHBf
bTJtLmMgIHwgICA0ICstCj4gIGRyaXZlcnMvc29jL21lZGlhdGVrL210ay1tbXN5cy5jICAgICAg
ICAgICAgICB8ICAyMCArLQo+ICA4IGZpbGVzIGNoYW5nZWQsIDQ3MCBpbnNlcnRpb25zKCspLCAx
NDUgZGVsZXRpb25zKC0pCj4KPiAtLQo+IDIuMzIuMC41NTQuZ2UxYjMyNzA2ZDgtZ29vZwo+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRp
YXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
