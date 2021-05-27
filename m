Return-Path: <SRS0=4IUA=KW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DC8DC47089
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 May 2021 10:23:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE5F1613F9
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 May 2021 10:23:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE5F1613F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fi.rohmeurope.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:
	In-Reply-To:Cc:To:From:Subject:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RRoekAkFrIt3KKpf1aId5iCIbeDK+Oa2ynd2u+Bfbzk=; b=2LLysNLBJvbMX1
	FzQHJ5nAipIbLzuLupMS/bjvEv/JMHesz4BHr0uSVDi/q2F0Q1FcpV5E41nPHE+d90lduQtGfeg3u
	N7U40bOXTF6cmQ7KBVUADMgvRjU31jb7cHfyKRInLpkkiozTsvPOP6SSg265gYtpUWlp8FamLItm0
	/5BQim5dHqIHUmqgdxTzxm3koGkZJKKXX3bMW4M6/A6GKuw5tX8QBcemCEJbOY9NYsMZCX+/cQ0XJ
	fG8wNhY0IPD50mzWH+rkTuVvXXYrg1TYG+xd7E1+6ExwGEhoU4u9co3KMFQ5x0sxsEysDt0CxrJHp
	k0MHuPICdhcDQl368qxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmDAQ-004lxl-Ez; Thu, 27 May 2021 10:23:06 +0000
Received: from mail-lj1-f175.google.com ([209.85.208.175])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmDA5-004liY-70; Thu, 27 May 2021 10:22:46 +0000
Received: by mail-lj1-f175.google.com with SMTP id 131so110842ljj.3;
 Thu, 27 May 2021 03:22:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:reply-to:to:cc
 :in-reply-to:references:mime-version:date:user-agent
 :content-transfer-encoding;
 bh=4IxwT6jVEBPP1PUK7HR4Lpreyst/kOYfM9RywQLhveM=;
 b=YJEo8famKgObboWJ86D8liGZPNYIRy+/ViZfsMWPl2CqxN3Scr757orzBlvbBtUi6i
 pD9UDgGs1HsABMvF8p086m0bzmJ+mhjn983xR9fGJ+CKaVZrISepf8qkj0AeJbrEYgu4
 IP2hPtmGGgA7BNkSIbylHOUdynCwLmZvTQnPEZOidFAd4JZrpfVle1Qbl55X9wdjn+wt
 tMht85XNPivBE8lUnm8ITx6RMPuBGgWEF/Ea6phDODZVBuZCBMj65T3AEO+m8vKgRhwW
 Tgxa1VXW2b5lyXAX6G8sg7xqsPi3MhY5r4dyGdfsXa+bGsJi6jbra0ceJg4EaQj60FnP
 kl1g==
X-Gm-Message-State: AOAM5329BmKM452Uw2m4kWtE2KSefVpjHfxaIbVYvEH9zeYwOfubIlhM
 zRWwV1MgxIU+pIeWarUiEVw=
X-Google-Smtp-Source: ABdhPJxaFl9mwFb0vGOT0FiK2vMVF0nxwV7VWhB90w66M1tlkNgbMPPrIPlKg3ipTF4pRiq5v7PVAA==
X-Received: by 2002:a2e:b6d2:: with SMTP id m18mr1878911ljo.233.1622110963168; 
 Thu, 27 May 2021 03:22:43 -0700 (PDT)
Received: from dc7vkhyyyyyyyyyyyyycy-3.rev.dnainternet.fi
 (dc7vkhyyyyyyyyyyyyycy-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::4])
 by smtp.gmail.com with ESMTPSA id r17sm185818ljp.40.2021.05.27.03.22.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 03:22:42 -0700 (PDT)
Message-ID: <f650d4944a291197467e594c75103243f9943527.camel@fi.rohmeurope.com>
Subject: Re: [PATCH v4 2/2] power: supply: mt6360_charger: add MT6360
 charger support
From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To: Gene Chen <gene.chen.richtek@gmail.com>
Cc: sre@kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, linux-pm@vger.kernel.org, devicetree
 <devicetree@vger.kernel.org>, linux-arm Mailing List
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Gene Chen <gene_chen@richtek.com>, 
 Wilma.Wu@mediatek.com, shufan_lee@richtek.com, ChiYuan Huang
 <cy_huang@richtek.com>,  benjamin.chao@mediatek.com
In-Reply-To: <CAE+NS36skw0XRCnNzHp8KSvdS+YPCAgwBNM-F7Wg=dxuiF5z1w@mail.gmail.com>
References: <1610973703-676-1-git-send-email-gene.chen.richtek@gmail.com>
 <1610973703-676-3-git-send-email-gene.chen.richtek@gmail.com>
 <771c7da0584cf37da6ba370207a89a7401a20c33.camel@fi.rohmeurope.com>
 <CAE+NS35BOC6rr4U9rtBkNph8mZCVV=5MGbh0VQXBvhLRkBaAvQ@mail.gmail.com>
 <a4646a277d692f4b4a04382b7367b641b2ff0fc6.camel@fi.rohmeurope.com>
 <CAE+NS36skw0XRCnNzHp8KSvdS+YPCAgwBNM-F7Wg=dxuiF5z1w@mail.gmail.com>
MIME-Version: 1.0
Date: Thu, 27 May 2021 13:22:33 +0300
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_032245_303178_C56CE633 
X-CRM114-Status: GOOD (  28.70  )
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
Reply-To: matti.vaittinen@fi.rohmeurope.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Ck9uIFRodSwgMjAyMS0wNS0yNyBhdCAxNzo1OCArMDgwMCwgR2VuZSBDaGVuIHdyb3RlOgo+IE1h
dHRpIFZhaXR0aW5lbiA8bWF0dGkudmFpdHRpbmVuQGZpLnJvaG1ldXJvcGUuY29tPiDmlrwgMjAy
MeW5tDXmnIgyN+aXpSDpgLHlm5sKPiDkuIvljYgxMjoyNeWvq+mBk++8mgo+ID4gCj4gPiBPbiBX
ZWQsIDIwMjEtMDUtMjYgYXQgMTc6NDAgKzA4MDAsIEdlbmUgQ2hlbiB3cm90ZToKPiA+ID4gTWF0
dGkgVmFpdHRpbmVuIDxtYXR0aS52YWl0dGluZW5AZmkucm9obWV1cm9wZS5jb20+IOaWvCAyMDIx
5bm0M+aciDMw5pelCj4gPiA+IOmAseS6jAo+ID4gPiDkuIvljYg3OjQ45a+r6YGT77yaCj4gPiA+
ID4gT24gTW9uLCAyMDIxLTAxLTE4IGF0IDIwOjQxICswODAwLCBHZW5lIENoZW4gd3JvdGU6Cj4g
PiA+ID4gPiBGcm9tOiBHZW5lIENoZW4gPGdlbmVfY2hlbkByaWNodGVrLmNvbT4KPiA+ID4gPiA+
IAo+ID4gPiA+ID4gQWRkIGJhc2ljIHN1cHBvcnQgZm9yIHRoZSBiYXR0ZXJ5IGNoYXJnZXIgZm9y
IE1UNjM2MCBQTUlDCj4gPiA+ID4gPiAKPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEdlbmUgQ2hl
biA8Z2VuZV9jaGVuQHJpY2h0ZWsuY29tPgo+ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiAgZHJpdmVy
cy9wb3dlci9zdXBwbHkvS2NvbmZpZyAgICAgICAgICB8ICAxMCArCj4gPiA+ID4gPiAgZHJpdmVy
cy9wb3dlci9zdXBwbHkvTWFrZWZpbGUgICAgICAgICB8ICAgMSArCj4gPiA+ID4gPiAgZHJpdmVy
cy9wb3dlci9zdXBwbHkvbXQ2MzYwX2NoYXJnZXIuYyB8IDkxNAo+ID4gPiA+ID4gKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gPiA+ID4gIDMgZmlsZXMgY2hhbmdlZCwgOTI1
IGluc2VydGlvbnMoKykKPiA+ID4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9wb3dl
ci9zdXBwbHkvbXQ2MzYwX2NoYXJnZXIuYwo+ID4gPiA+ID4gCj4gPiA+ID4gCj4gPiA+ID4gVGhh
bmtzIGZvciB0aGUgY29udHJpYnV0aW9uIDopCj4gPiA+ID4gCj4gPiA+ID4gRmV3IGNvbW1lbnRz
IHdoaWNoIEkgYW0gbm90IGRlbWFuZGluZyB0byBiZSAnZml4ZWQnIC0gYnV0IHdoaWNoCj4gPiA+
ID4gbWlnaHQKPiA+ID4gPiBiZSBnb29kIHRvIGJlIGNoZWNrZWQuIEVnLCBwbGVhc2UgY29uc2lk
ZXIgbXkgY29tbWVudHMgYXMKPiA+ID4gPiAnbml0J3MuCj4gPiA+ID4gCj4gPiA+ID4gLi4uCj4g
PiA+ID4gCj4gPiA+ID4gPiArc3RhdGljIHVuc2lnbmVkIGludCBtdDYzNjBfbWFwX3JlZ19zZWwo
dTMyIGRhdGEsIHUzMiBtaW4sCj4gPiA+ID4gPiB1MzIKPiA+ID4gPiA+IG1heCwKPiA+ID4gPiA+
IHUzMiBzdGVwKQo+ID4gPiA+ID4gK3sKPiA+ID4gPiA+ICsgICAgIHUzMiB0YXJnZXQgPSAwLCBt
YXhfc2VsOwo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKyAgICAgaWYgKGRhdGEgPj0gbWluKSB7Cj4g
PiA+ID4gPiArICAgICAgICAgICAgIHRhcmdldCA9IChkYXRhIC0gbWluKSAvIHN0ZXA7Cj4gPiA+
ID4gPiArICAgICAgICAgICAgIG1heF9zZWwgPSAobWF4IC0gbWluKSAvIHN0ZXA7Cj4gPiA+ID4g
PiArICAgICAgICAgICAgIGlmICh0YXJnZXQgPiBtYXhfc2VsKQo+ID4gPiA+ID4gKyAgICAgICAg
ICAgICAgICAgICAgIHRhcmdldCA9IG1heF9zZWw7Cj4gPiA+ID4gPiArICAgICB9Cj4gPiA+ID4g
PiArICAgICByZXR1cm4gdGFyZ2V0Owo+ID4gPiA+ID4gK30KPiA+ID4gPiAKPiA+ID4gPiBsaWIv
bGluZWFyX3Jhbmdlcy5jIG1pZ2h0IGFscmVhZHkgaW1wbGVtZW50IHRoaXMgLi4uCj4gPiA+ID4g
Cj4gPiA+IAo+ID4gPiBJIGZvdW5kIHdlIGFyZSBuZWl0aGVyIGxpbmVhcl9yYW5nZV9nZXRfc2Vs
ZWN0b3JfaGlnaCBvcgo+ID4gPiBsaW5lYXJfcmFuZ2VfZ2V0X3NlbGVjdG9yX2xvdy4KPiA+ID4g
V2hlbiB2YWx1ZSBsb3dlciB0aGFuIG1pbl92YWx1ZSwgY2hvb3NlIG1pbl9zZWwuIElmIGhpZ2hl
ciB0aGFuCj4gPiA+IG1heF92YWx1ZSwgY2hvb3NlIG1heF9zZWwuCj4gPiAKPiA+IEFoLCBjb3Jy
ZWN0Lgo+ID4gCj4gPiA+IFNob3VsZCBJIGNyZWF0ZSBsaW5lYXJfcmFuZ2VfZ2V0X3NlbGVjdG9y
KCkgZm9yIHRoaXM/Cj4gPiAKPiA+IE15IHN1Z2dlc3Rpb24gd291bGQgYmUgeWVzLCBidXQgSSBh
bSBub3QgaW5zaXN0aW5nIG9uIGl0Lgo+ID4gCj4gCj4gTWF5YmUgdGhpcyBpcyBhIHNwZWNpYWwg
Y2hvb3NpbmcgbWVjaGFuaXNtLCBJIHdpbGwga2VlcCBpdC4KPiBDb3VsZCBJIGFsc28ga2VlcCBt
dDYzNjBfbWFwX3JlYWxfdmFsPwoKSSB0aGluayBhZGRpbmcgZ2VuZXJpYyBmdW5jdGlvbiB0byBs
aW5lYXIgcmFuZ2UgY29kZSBmb3Igb3RoZXJzIHRvIHJlLQp1c2Ugd291bGQgYmUgbmljZS4gQnV0
IGlmIHlvdSBjaG9vc2UgdG8ga2VlcCB0aGUgbXQ2MzYwX21hcF9yZWdfc2VsKCkKdGhlbiBpdCBJ
IGFncmVlIHRoYXQgeW91IHNob3VsZCBhbHNvIGtlZXAgdGhlIG10NjM2MF9tYXBfcmVhbF92YWwo
KS4KCkJlc3QgcmVnYXJkcwoJTWF0dGkgVmFpdHRpbmVuCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Ckxp
bnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
