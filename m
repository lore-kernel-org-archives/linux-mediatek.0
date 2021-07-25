Return-Path: <SRS0=Hp3b=MR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0271C4338F
	for <linux-mediatek@archiver.kernel.org>; Sun, 25 Jul 2021 00:48:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9590A60E90
	for <linux-mediatek@archiver.kernel.org>; Sun, 25 Jul 2021 00:48:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9590A60E90
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ooKrKGs3RE3BrNEvf4yF4kwVy2qaP1Zs5z9QDi9h9rk=; b=bYNjNw5ZLCR2uw
	RaQ2sWwchj75++RGytYJCwaycy0GPOHmjcVyz3Boif2NJC+SOmLyzuBxWcH81H2ssC4WOG+SItnol
	J7mUlSyzPnKRKi9b5K2VH+KEnRQGufGG8c9qVG7z/N0JgUIYyhqfB59bKCrnePZasgw+k1CnlQuCi
	CuKDYwo3JKT8Otk0z3KgMWkVR6TdsRExUEJ3ABn12xLZnWivDOuHAroOKbyPQr3i1iQ49e9j6/Zx3
	Do9y7bu58mEP3NA/TXfydV1rn073CsTprC8bwbPwKIjRLUHzvuThSTV5/cnXK++gCqpoXiMoGdSi7
	iM5EwsXVBy63fYDoB6GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7SJl-00803O-81; Sun, 25 Jul 2021 00:48:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7SJW-007zym-Or; Sun, 25 Jul 2021 00:48:20 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D1E2660EB0;
 Sun, 25 Jul 2021 00:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627174093;
 bh=rqTMF7et93wqK2S9QEQh0AXTbWrjl0wbtX9lz1IwDpU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Wkc/uf486ctKkf9xfXEVlqtYx98X7jN6Jmay8fPvmofQL9S2mJxjOHmzYlw7DT9tA
 iVtlr6ZXqvYy3fKU+EX0EQUV9kDwTkhr8LdzEXcixKZ+6WMm0f1q9hVqatLKO9Yuqt
 R0k8mchMGltDjkDvEoCUvg/C57xMBirz7wDWeEcvNTBY+1eHNHmttLPgACc0ST6ZB+
 Aqz5K2O2kbl9FHOOwiwpszjo2GmudHGF+jSIlRuBM0j2EEdnyExvuCjbHCui1X730L
 pHHG6je1mzknwv0vOHUuKGAYHJQY3Um/ohUTWh9zquFt8ftDcRs28OxaOf3OnLVsxD
 QdLR728OSWICQ==
Received: by mail-ed1-f53.google.com with SMTP id z26so6718891edr.0;
 Sat, 24 Jul 2021 17:48:13 -0700 (PDT)
X-Gm-Message-State: AOAM533PKb1l2GzEpZ8yCFD4ZsIDrCB+jdozgY3TdF9wagDTfEKZ2Ubs
 K0XxYX5KusNEL0apKayYcNgAAj1X0FVfuppDhA==
X-Google-Smtp-Source: ABdhPJyHF3C7y4GxdOWyVoATJvkT4FJF0sPvDzuozkpixhZJOklw3ILHhIso95awG7W8/b7SkUqZ5w068IoN5vLnmUU=
X-Received: by 2002:aa7:c7c2:: with SMTP id o2mr13718311eds.166.1627174092447; 
 Sat, 24 Jul 2021 17:48:12 -0700 (PDT)
MIME-Version: 1.0
References: <1626417143-8015-1-git-send-email-yongqiang.niu@mediatek.com>
 <1626417143-8015-3-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1626417143-8015-3-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 25 Jul 2021 08:48:01 +0800
X-Gmail-Original-Message-ID: <CAAOTY__+KNkf0nc4-RH6HJZuTWMM+JWfKU2Rgctr6XogomNGHA@mail.gmail.com>
Message-ID: <CAAOTY__+KNkf0nc4-RH6HJZuTWMM+JWfKU2Rgctr6XogomNGHA@mail.gmail.com>
Subject: Re: [PATCH v3, 2/3] drm/mediatek: add mt8183 aal support
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Fabien Parent <fparent@baylibre.com>, 
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 DTML <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Hsin-Yi Wang <hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210724_174818_921627_87D86E08 
X-CRM114-Status: GOOD (  14.13  )
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

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMeW5tDfmnIgxNuaXpSDpgLHkupQg5LiL5Y2IMjozMuWvq+mBk++8mgo+Cj4gVGhp
cyBwYXRjaCBhZGQgbXQ4MTgzIHByaXZhdGUgZGF0YQoKQXBwbGllZCB0byBtZWRpYXRlay1kcm0t
bmV4dCBbMV0sIHRoYW5rcy4KClsxXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGlu
dXgva2VybmVsL2dpdC9jaHVua3VhbmcuaHUvbGludXguZ2l0L2xvZy8/aD1tZWRpYXRlay1kcm0t
bmV4dAoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBZb25ncWlhbmcg
Tml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kaXNwX2FhbC5jIHwgMSArCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHJtX2Rydi5jICB8IDIgKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfYWFs
LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfYWFsLmMKPiBpbmRleCBmYjIx
MmU5Ni4uNjRiNDUyOCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2Rpc3BfYWFsLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfYWFs
LmMKPiBAQCAtMTUxLDYgKzE1MSw3IEBAIHN0YXRpYyBpbnQgbXRrX2Rpc3BfYWFsX3JlbW92ZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rl
dmljZV9pZCBtdGtfZGlzcF9hYWxfZHJpdmVyX2R0X21hdGNoW10gPSB7Cj4gICAgICAgICB7IC5j
b21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE3My1kaXNwLWFhbCIsCj4gICAgICAgICAgIC5kYXRh
ID0gJm10ODE3M19hYWxfZHJpdmVyX2RhdGF9LAo+ICsgICAgICAgeyAuY29tcGF0aWJsZSA9ICJt
ZWRpYXRlayxtdDgxODMtZGlzcC1hYWwifSwKPiAgICAgICAgIHt9LAo+ICB9Owo+ICBNT0RVTEVf
REVWSUNFX1RBQkxFKG9mLCBtdGtfZGlzcF9hYWxfZHJpdmVyX2R0X21hdGNoKTsKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMgYi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYwo+IGluZGV4IDY3YTU4NWUuLjE0M2JhMjQgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYwo+IEBAIC00MjAsNiArNDIw
LDggQEAgc3RhdGljIHZvaWQgbXRrX2RybV91bmJpbmQoc3RydWN0IGRldmljZSAqZGV2KQo+ICAg
ICAgICAgICAuZGF0YSA9ICh2b2lkICopTVRLX0RJU1BfQ09MT1IgfSwKPiAgICAgICAgIHsgLmNv
bXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTczLWRpc3AtYWFsIiwKPiAgICAgICAgICAgLmRhdGEg
PSAodm9pZCAqKU1US19ESVNQX0FBTH0sCj4gKyAgICAgICB7IC5jb21wYXRpYmxlID0gIm1lZGlh
dGVrLG10ODE4My1kaXNwLWFhbCIsCj4gKyAgICAgICAgIC5kYXRhID0gKHZvaWQgKilNVEtfRElT
UF9BQUx9LAo+ICAgICAgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxNzMtZGlzcC1n
YW1tYSIsCj4gICAgICAgICAgIC5kYXRhID0gKHZvaWQgKilNVEtfRElTUF9HQU1NQSwgfSwKPiAg
ICAgICAgIHsgLmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTgzLWRpc3AtZ2FtbWEiLAo+IC0t
Cj4gMS44LjEuMS5kaXJ0eQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW1lZGlhdGVrCg==
