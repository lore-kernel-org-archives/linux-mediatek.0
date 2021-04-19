Return-Path: <SRS0=CMHm=JQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36BF7C433ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 15:04:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A68E9611CE
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 15:04:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A68E9611CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NxXIkJgBxg/K+4UqgFKWfaDRkF2zUOidPp+HNQ6rwP8=; b=qBK0DHZvoOjMIXCTujVs5RkGy
	Ct4ySQ7pOX3CThgLqq197zy1dzOi0x8SKonBKDPAwF+bHzDKB551G2BNvdDDe+SgjEZdNXfx8pNs2
	Z3LH4qIAiSnC1Y1mW0vDp6ObNQbbTljRsr0nCDtSRaM8WqTen8J00Yf2j5Q/CJYLAHkicP2FKL9Bf
	vuvr3pqxjTJS8Crqy6vDwho5a3VJ3uH2Q5jCwZXtl5fhw4jzUICMoNOpg6tmx8p5KNEDlfDos8BNE
	cUo+Ac5GX2XESIPVrPwkBvwxDSWZNY3cEM9QZICROIZFkjyR2xJMaAp2pMoMAj1f2+P7jjMoR7TyF
	oPmL9SqoQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYVS5-00A9eB-BA; Mon, 19 Apr 2021 15:04:41 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYVRu-00A9dL-3K; Mon, 19 Apr 2021 15:04:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=sK9kJH32/DEKrA6KoYri3PZGBlZT1dWah2hqamZZ9Cc=; b=1LX9IR5zFPr3ax9q/fKtO58n1r
 TF67IBa2chfjpY9+LPWneeJfP+vjPoGtUE9tYkWueZ+bxHC/T7gbPiIZFchNvWV+RHVjIuj3WV0ha
 WrgiUd0UgESminmT0A/J1ACbdnamGoJ4E7e3KgVFZ3OURO5J/kwT7JNN+BML9ioeLscULqmB4gXdB
 RrwKPXthDbJ5uQ2p4bGLspkxEPDfYODiCdQUrRPI4fNixhPIcWCzNOsa4dIqbrrMbDfvWkDK4BrnH
 K+tqD2qC4IQ4ziSco8QrMtMJtEcWHRoLRJ3/iOgliwJTMvAHarPTVBdLCijn1Zlo67XarYjSCxDQz
 QaMzj+LQ==;
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYVRo-00BTO0-4U; Mon, 19 Apr 2021 15:04:28 +0000
Received: by mail-io1-xd31.google.com with SMTP id z14so1690228ioc.12;
 Mon, 19 Apr 2021 08:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sK9kJH32/DEKrA6KoYri3PZGBlZT1dWah2hqamZZ9Cc=;
 b=s7wVo0vApXU/OM1jt4+gMA9B0M0TVD8p1XDGpgxiXAxuyzaHz2Gj1uaR28sDh9Meyq
 M+ZPjuGWqIFb91kh+t5jJbJhqs8vxijOqlUhQ4V3TEo8yK7ZobGdz5Hr1JHP3AjtAn59
 Re249SBEmo/8oNw//lAyJDppVQ0CHLS5EtwgWyNYZNNCIRMuCnfCXdAvTdD4zSc/vpbc
 vTMTAbEzFLOBOQTWIt4/WlgQzt3Iahmlb6W8ItRJAayJiQUHk2q6qO7zju/SgZJ6EGFn
 YBYjVlEXIUwLGeNoNGzxjQ0CwwpVAeSLagMmZf0XzsRv0HX/+FQoSJGxYUlm4OUkYYnA
 TiBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sK9kJH32/DEKrA6KoYri3PZGBlZT1dWah2hqamZZ9Cc=;
 b=EM+uCKeV6KXdWCihbbTWsculTV84y6B3MjEXUGHtBWTpdNmTjC3qsJfTCiu3VmSPPE
 lolR5xY8GjwuxB/MXgbjTi4rWlcI465gnR5JC9ao5GsZ1RhKTkB1oy3QL4TmQkC8bRSP
 KDDSxDny5v1LhmlwazSRndOQjuTGjZBspWgq01bqSCHUQ3DF7GHAhlzRpGb6vMGc9t1F
 fWOcdHlS87qQTHXaOkLn8na+2mIedsa5fU1BBRtXsjYayhytBu4UH1Y2WMartlj6zb2m
 buowluKbirAHBCSLEdpa9V4CjNt2PZ7cngIB8DD1nJntQ7IQGui8SdssRPbaAqPjzhJV
 S4+A==
X-Gm-Message-State: AOAM5330zvFLIa+yT9cBVknFKQLjCrqLXhOcLMSgTttv/DR827tbKHA2
 nt1JvWPi8WkC01Uep+i6T8/5EhtfVdso4wCnRcw=
X-Google-Smtp-Source: ABdhPJzEZQjUJvUvF+QDBgYHgewS1rUZVS39JXLXF5zSRaqhTgFexQhrwFdP/SIkUu/RjU+JN91KzcVrPuuY0GRWz/U=
X-Received: by 2002:a02:a487:: with SMTP id d7mr2653012jam.84.1618844661634;
 Mon, 19 Apr 2021 08:04:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210419040352.2452-1-ilya.lipnitskiy@gmail.com>
 <20210419040352.2452-3-ilya.lipnitskiy@gmail.com> <YH10UNuJZ5s7dfLh@lunn.ch>
In-Reply-To: <YH10UNuJZ5s7dfLh@lunn.ch>
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Date: Mon, 19 Apr 2021 08:04:10 -0700
Message-ID: <CALCv0x2SSGjiqKOBhK1GT2ksjc9J--Qm3Uq-0xc3sgHvDju5-A@mail.gmail.com>
Subject: Re: [PATCH net-next 2/2] net: ethernet: mediatek: support custom GMAC
 label
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 John Crispin <john@phrozen.org>, 
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Russell King <linux@armlinux.org.uk>,
 netdev@vger.kernel.org, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_080424_199470_EF8EE755 
X-CRM114-Status: GOOD (  26.28  )
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

T24gTW9uLCBBcHIgMTksIDIwMjEgYXQgNToxNSBBTSBBbmRyZXcgTHVubiA8YW5kcmV3QGx1bm4u
Y2g+IHdyb3RlOgo+Cj4gT24gU3VuLCBBcHIgMTgsIDIwMjEgYXQgMDk6MDM6NTJQTSAtMDcwMCwg
SWx5YSBMaXBuaXRza2l5IHdyb3RlOgo+ID4gVGhlIE1BQyBkZXZpY2UgbmFtZSBjYW4gbm93IGJl
IHNldCB3aXRoaW4gRFRTIGZpbGUgaW5zdGVhZCBvZiBhbHdheXMKPiA+IGJlaW5nICJldGhYIi4g
VGhpcyBpcyBoZWxwZnVsIGZvciBEU0EgdG8gY2xlYXJseSBsYWJlbCB0aGUgRFNBIG1hc3Rlcgo+
ID4gZGV2aWNlIGFuZCBkaXN0aW5ndWlzaCBpdCBmcm9tIERTQSBzbGF2ZSBwb3J0cy4KPiA+Cj4g
PiBGb3IgZXhhbXBsZSwgc29tZSBkZXZpY2VzLCBzdWNoIGFzIHRoZSBVYmlxdWl0aSBFZGdlUm91
dGVyIFgsIG1heSBoYXZlCj4gPiBwb3J0cyBsYWJlbGVkIGV0aFguIExhYmVsaW5nIHRoZSBtYXN0
ZXIgR01BQyB3aXRoIGEgZGlmZmVyZW50IHByZWZpeAo+ID4gdGhhbiBEU0EgcG9ydHMgaGVscHMg
d2l0aCBjbGFyaXR5Lgo+ID4KPiA+IFN1Z2dlc3RlZC1ieTogUmVuw6kgdmFuIERvcnN0IDxvcGVu
c291cmNlQHZkb3JzdC5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBJbHlhIExpcG5pdHNraXkgPGls
eWEubGlwbml0c2tpeUBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL25ldC9ldGhlcm5l
dC9tZWRpYXRlay9tdGtfZXRoX3NvYy5jIHwgNCArKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9t
ZWRpYXRlay9tdGtfZXRoX3NvYy5jIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvbWVkaWF0ZWsvbXRr
X2V0aF9zb2MuYwo+ID4gaW5kZXggNmIwMGMxMmM2YzQzLi40YzBjZTRmYjc3MzUgMTAwNjQ0Cj4g
PiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9tZWRpYXRlay9tdGtfZXRoX3NvYy5jCj4gPiAr
KysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9tZWRpYXRlay9tdGtfZXRoX3NvYy5jCj4gPiBAQCAt
Mjg0NSw2ICsyODQ1LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBuZXRfZGV2aWNlX29wcyBtdGtf
bmV0ZGV2X29wcyA9IHsKPiA+Cj4gPiAgc3RhdGljIGludCBtdGtfYWRkX21hYyhzdHJ1Y3QgbXRr
X2V0aCAqZXRoLCBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wKQo+ID4gIHsKPiA+ICsgICAgIGNvbnN0
IGNoYXIgKmxhYmVsID0gb2ZfZ2V0X3Byb3BlcnR5KG5wLCAibGFiZWwiLCBOVUxMKTsKPiA+ICAg
ICAgIGNvbnN0IF9fYmUzMiAqX2lkID0gb2ZfZ2V0X3Byb3BlcnR5KG5wLCAicmVnIiwgTlVMTCk7
Cj4gPiAgICAgICBwaHlfaW50ZXJmYWNlX3QgcGh5X21vZGU7Cj4gPiAgICAgICBzdHJ1Y3QgcGh5
bGluayAqcGh5bGluazsKPiA+IEBAIC0yOTQwLDYgKzI5NDEsOSBAQCBzdGF0aWMgaW50IG10a19h
ZGRfbWFjKHN0cnVjdCBtdGtfZXRoICpldGgsIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnApCj4gPiAg
ICAgICBlbHNlCj4gPiAgICAgICAgICAgICAgIGV0aC0+bmV0ZGV2W2lkXS0+bWF4X210dSA9IE1U
S19NQVhfUlhfTEVOR1RIXzJLIC0gTVRLX1JYX0VUSF9ITEVOOwo+ID4KPiA+ICsgICAgIGlmIChs
YWJlbCkKPiA+ICsgICAgICAgICAgICAgc3Ryc2NweShldGgtPm5ldGRldltpZF0tPm5hbWUsIGxh
YmVsLCBJRk5BTVNJWik7Cj4KPiBJdCBpcyBiZXR0ZXIgdG8gdXNlIGFsbG9jX25ldGRldl9tcXMo
KSBzbyB5b3UgZ2V0IHZhbGlkYXRpb24gdGhlIG5hbWUKPiBpcyB1bmlxdWUuCkl0IGRvZXNuJ3Qg
bG9vayBsaWtlIHRoZSBuYW1lIHZhbGlkYXRpb24gaGFwcGVucyB1bnRpbCB0aGUgbmV0ZGV2IGlz
CnJlZ2lzdGVyZWQsIGFuZCBpdCBkb2VzIG5vdCBnZXQgcmVnaXN0ZXJlZCBhdCBhbGxvYywgcmln
aHQ/CgpJIGRvIGFncmVlIHRoYXQgaXQncyBiZXR0ZXIgdG8gdXNlIHRoZSBjb3JyZWN0IG5hbWUg
aW4gdGhlIGZpcnN0IHBsYWNlCmluc3RlYWQgb2YgcmVuYW1pbmcsIHJlZ2FyZGxlc3MsIHNvIHVz
aW5nIGFsbG9jX25ldGRldl9tcXMoKSBzZWVtcwpsaWtlIGEgYmV0dGVyIHNvbHV0aW9uIC0gSSds
bCBtYWtlIHRoZSBjaGFuZ2UuCgpJbHlhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0
ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
