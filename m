Return-Path: <SRS0=xNtl=OL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E996C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Sep 2021 08:37:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 559AD611EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Sep 2021 08:37:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 559AD611EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kvU1En3YSo2xgxiJdchBEiVdW1wLGWcguTONNWnLYe4=; b=Kychbpe8+PfVD1
	Xm/y0E4uqHsX1/PI4Ipglj5cPgchoL1TeqSTYD4oCtRpgQZP1lCSJyiq5BA6kHyD/pvDCgnhn0LjY
	quISzpHyptFfzzp4s8Ix9Z1GI2hsX0gNoN6DnzxM/zz31+HPWA32zoUeHvFpAGZOa0XMCFtc4xVaY
	SAqbo9NG/JcMhzJ3aziAgMPfx8no84NZng6+oyjeKdjBULPbkHO/Q+L0bDpz0/iOz4cDXeoNp6YwO
	wHkLV/pogLKhYbOYhv9XvQetAP6NBbHCUdSc/pODtAPEBF2aXz+Xzkz9ykdZTqhpPKClXm693LUnP
	h2eyFLCr2ysrN0QN5kuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSbGr-003xjI-EI; Tue, 21 Sep 2021 08:36:57 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSbGo-003xi8-GV
 for linux-mediatek@lists.infradead.org; Tue, 21 Sep 2021 08:36:56 +0000
Received: by mail-oi1-x22f.google.com with SMTP id y201so13952232oie.3
 for <linux-mediatek@lists.infradead.org>; Tue, 21 Sep 2021 01:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bg3GdEDta4alq5EcpFnKMHpnaJigutsFTYZs6RKXRos=;
 b=ZcFBBgvctstgt5BhYORG28cC2JeYUdHavEY11rLRXIZvTkm8Yu5uJVKhUXDjwFImiZ
 r/axHGTlAB+yxUTSTbKqOhuVqpsHspq+986dff4TH6985kUVPib7cXfSjIB+G7pVNBzn
 dMtirIg9a9z4Cg58clgML0lnqbFg9H7GuwArqrNOEowK0V+S3oN75xO8adhAugIfY4Uj
 2QXgCUbmQGJ2KqCwDfSscJiIn/MWaqf7s69HTZlNS1Eq4zO10K3NSaHZzNYjQ9O4ASoF
 K7VirpStOPOKGScn4nNYRoG2AC6YuDVoR6wEf57DeA0h8DQsGJeKqCQdY+nBxCw55Aey
 IMTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bg3GdEDta4alq5EcpFnKMHpnaJigutsFTYZs6RKXRos=;
 b=tYpGWGUZzwfDiJrY0oSNWZ7+ajBmXVIORWF0Q06CXxBonxmrZP0Z2P12sGXBuqSWkM
 1a+1H/iBdPaeqb7R2oASrLxBNHc4w86vYgFx9TbbqnQrQCmeSCb4f/otPkoYb79RyXQN
 NSc47i2QS1fsEF74DCNxn5+tDvZqwVylxJtuoTRZfDAoFs70wZByA7ap95OxtFPS+AbT
 m93QSUqluum1E06QmnQpCzw3CXoMquF/1HR/udrbMN2KAEP2reCRVL31ja0g9ED2k+BY
 x2w6J5U/YhcryjADT99wDyzbaPPS/KB7AdLejDIzOKxF35fiGWF6cXo7dMMUtLO3coJR
 Qmug==
X-Gm-Message-State: AOAM531Y77feXpM2HYaTdPgSezugxJ6VNIQumgWoB1JmRAnPuHPPJ950
 Xw3+ngvXj4T4AQFO4MYX65yJaPlF5C3PWK6Vnkc=
X-Google-Smtp-Source: ABdhPJz5b/t20bc16VMoDEDAs3Czo0etpYXIUTXIwcba8wdCT/5iOp8lmpW35rcqNJGzZ/xm3fh6WNrdzNR/tqD3mxs=
X-Received: by 2002:aca:210d:: with SMTP id 13mr2651010oiz.47.1632213411694;
 Tue, 21 Sep 2021 01:36:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210808234733.14782-1-chunkuang.hu@kernel.org>
 <CAAOTY_9LstZegE_Gyibov5tLo5eEqiPfoAcnyj_uoS=8xLLhnA@mail.gmail.com>
In-Reply-To: <CAAOTY_9LstZegE_Gyibov5tLo5eEqiPfoAcnyj_uoS=8xLLhnA@mail.gmail.com>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Tue, 21 Sep 2021 10:36:39 +0200
Message-ID: <CAFqH_53M2OO8DpkPa3L7cwppVRYiUgEDjrLjK7JJNgKgxnQpVA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] CMDQ refinement of Mediatek DRM driver
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_013654_612884_1ACCEC78 
X-CRM114-Status: GOOD (  19.46  )
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

SGkgQ2h1bi1LdWFuZywKCihhZ2FpbiB3aXRob3V0IGh0bWwgZm9ybWF0LCBzb3JyeSBmb3IgdGhl
IG5vaXNlKQoKTWlzc2F0Z2UgZGUgQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5v
cmc+IGRlbCBkaWEgZGouLCAxMgpk4oCZYWcuIDIwMjEgYSBsZXMgMjoxMzoKPgo+IENodW4tS3Vh
bmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPiDmlrwgMjAyMeW5tDjmnIg55pelIOmAseS4
gCDkuIrljYg3OjQ35a+r6YGT77yaCj4gPgo+ID4gVGhlc2UgcmVmaW5lbWVudHMgaW5jbHVkZSB1
c2luZyBzdGFuZGFyZCBtYWlsYm94IGNhbGxiYWNrIGludGVyZmFjZSwKPiA+IHRpbWVvdXQgZGV0
ZWN0aW9uLCBhbmQgYSBmaXhlZCBjbWRxX2hhbmRsZS4KPgo+IEZvciB0aGlzIHNlcmllcywgYXBw
bGllZCB0byBtZWRpYXRlay1kcm0tbmV4dCBbMV0uCj4KPiBbMV0gaHR0cHM6Ly9naXQua2VybmVs
Lm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvY2h1bmt1YW5nLmh1L2xpbnV4LmdpdC9sb2cv
P2g9bWVkaWF0ZWstZHJtLW5leHQKPgoKVGhlc2UgcGF0Y2hlcyBzZWVtIHRvIGJyZWFrIHRoZSBk
aXNwbGF5IG9uIHRoZSBBY2VyIENocm9tZWJvb2sgUiAxMwooTVQ4MTczKSBpbiB0aGUgY3VycmVu
dCBtYWlubGluZS4gQWZ0ZXIgcnVubmluZyBhIGJpc2VjdGlvbiBpdCBwb2ludGVkCm1lIHRvIHRo
ZSBmb2xsb3dpbmcgY29tbWl0Cgpjb21taXQgZjRiZTE3Y2Q1YjE0ZGQ3MzU0NWIwZTAxNGE2M2Vi
ZTlhYjVlZjgzNwpBdXRob3I6IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3Jn
PgpEYXRlOiAgIFN1biBKdWwgNCAxNTozNjo0OCAyMDIxICswODAwCgogICAgZHJtL21lZGlhdGVr
OiBSZW1vdmUgc3RydWN0IGNtZHFfY2xpZW50CgpSZXZlcnRpbmcgdGhpcyBwYXRjaCBhbG9uZSBp
cyBub3QgdHJpdmlhbCwgc28gSSBlbmRlZCB1cCByZXZlcnRpbmcgdGhlCmZ1bGwgc2VyaWVzLCBh
bmQgSSBjYW4gY29uZmlybSB0aGF0IHJldmVydGluZyB0aGUgZnVsbCBzZXJpZXMgbWFrZXMKdGhl
IGRpc3BsYXkgd29yayBhZ2Fpbi4KClVuZm9ydHVuYXRlbHksIGFmdGVyIHRoZSBtZXJnZSB3aW5k
b3csIGRpZmZlcmVudCB0aGluZ3MgYnJva2UgZm9yIHRoaXMKZGV2aWNlLCBhbmQgSSBkaWRuJ3Qg
ZmluaXNoIGlzb2xhdGluZyB0aGVtLCBhbmQgaXQgaXMgbm90IGNsZWFyIHRvIG1lCnlldCB3aGV0
aGVyIHRoZSBsb2dzIEknbSBnZXR0aW5nIGFyZSB1c2VmdWwgZm9yIHRoaXMgc3BlY2lmaWMgaXNz
dWUgb3IKbm90LiBCYXNpY2FsbHkgd2l0aCB0aGlzIHNlcmllcyBtZXJnZWQgdGhlIGtlcm5lbCBz
ZWVtcyB0byBiZSBzdHVjaywKYW5kIHRoZSBkaXNwbGF5IGlzIG5vdCB3b3JraW5nLiBMYXRlc3Qg
bWVzc2FnZSBpcwoKWyAgIDEyLjMyOTE3M10gbXRrLWlvbW11IDEwMjA1MDAwLmlvbW11OiBQYXJ0
aWFsIFRMQiBmbHVzaCB0aW1lZCBvdXQsCmZhbGxpbmcgYmFjayB0byBmdWxsIGZsdXNoCgpXaXRo
b3V0IHRoZSBzZXJpZXMsIHRoZSBrZXJuZWwgZ29lcyBmYXIgYW5kIGRpc3BsYXkgd29ya3MsIGhv
d2V2ZXIKdGhlcmUgYXJlIG90aGVyIGlzc3VlcyBhZmZlY3RpbmcgdGhlIGNyb3MtZWMsIGJ1dCBJ
IHRoaW5rIHRoYXQncwphbm90aGVyIGlzc3VlLgoKSSdsbCB0cnkgdG8gZGlnIGEgYml0IG1vcmUs
IGJ1dCwgbWVhbndoaWxlLCBpZiB5b3UgaGF2ZSBhbnkgaWRlYQpwbGVhc2UgbGV0IG1lIGtub3cu
CgpUaGFua3MsCiBFbnJpYwoKCj4gUmVnYXJkcywKPiBDaHVuLUt1YW5nLgo+Cj4gPgo+ID4gQ2hh
bmdlcyBpbiB2MjoKPiA+IDEuIERlZmluZSBtdGtfZHJtX2NtZHFfcGt0X2NyZWF0ZSgpIGFuZCBt
dGtfZHJtX2NtZHFfcGt0X2Rlc3Ryb3koKQo+ID4gICAgd2hlbiBDT05GSUdfTVRLX0NNRFEgaXMg
cmVhY2hhYmxlLgo+ID4KPiA+IENodW4tS3VhbmcgSHUgKDQpOgo+ID4gICBkcm0vbWVkaWF0ZWs6
IFVzZSBtYWlsYm94IHJ4X2NhbGxiYWNrIGluc3RlYWQgb2YgY21kcV90YXNrX2NiCj4gPiAgIGRy
bS9tZWRpYXRlazogUmVtb3ZlIHN0cnVjdCBjbWRxX2NsaWVudAo+ID4gICBkcm0vbWVkaWF0ZWs6
IERldGVjdCBDTURRIGV4ZWN1dGlvbiB0aW1lb3V0Cj4gPiAgIGRybS9tZWRpYXRlazogQWRkIGNt
ZHFfaGFuZGxlIGluIG10a19jcnRjCj4gPgo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHJtX2NydGMuYyB8IDExMCArKysrKysrKysrKysrKysrKysrKy0tLS0KPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgOTEgaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25zKC0pCj4gPgo+ID4gLS0KPiA+
IDIuMjUuMQo+ID4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbWVkaWF0ZWsK
