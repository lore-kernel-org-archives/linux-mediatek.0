Return-Path: <SRS0=CLKU=ME=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 134BDC07E99
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 15:34:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7F3A611C1
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 15:34:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7F3A611C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mb8P+giRpc9EcKvc1HQKQnQPCADDXBBx9atpIXwuRVE=; b=HyYWuKy9BUH+OW
	XD5b81MiWt7N8z7QKbnO/hoKmVxSH3xBxHXZrCMZrUdRZmgPPUDP2Wumy0RVrlixsUsDs1RKX/5tQ
	njMPhuGgcpQZKSzoPJwllP3Hd/Jr1yVf2NIw7FfCn9ElhmpBWOpImg8ZuuXx+hbiFk6sXI+RQHt/4
	Mr3o8sSui1yNjlKvphzu3pGy75sxA3WOTAb7j8UmpXxDaHGarhoHKlvx79ybvEp6IqkrlPWynFKxg
	8HhMDhqUWsGgSoE7XD6SIZ04NJsmCBAwyobnFbu5cj1YJpU1orPOZX8fR/HhkT+T19kenw6ecOI3d
	37pwLLQC3snljRLoLdyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2xwi-007kbo-4n; Mon, 12 Jul 2021 15:34:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2xwS-007kVx-Ni; Mon, 12 Jul 2021 15:33:58 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 63756611C1;
 Mon, 12 Jul 2021 15:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626104036;
 bh=5X2UURg25rMrNoAilDfJ7k5RncDDoVLvR+Fw5b9WLPE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=dN9t5tWJoXIcqxJmju4K9H9qiofOopREzVIeKkjPOyRWSxyMPc5+lr+BWCkfl61Qy
 eTun6f4aOQ5xKTiU6IpCRyY4dgvh5uTE3rvyCazU9lR82vjAk65hNQTbF0fLhXDHX6
 BOPT3DwNCG4hkcAhXIe/NJ3k4AkJbRRC6RC34HbTcRgMHKJef/UyEGSdz6KwGHOfFI
 aR2nqk3nPXYzYeude33hsHbYwOJ00nZjplGbhRvSu2UbzKir3Vdj1DZZdzTR3vQBct
 4lcXjW5m4VCZU498cPGilAvzWtBqM/qU2n6q3rrGhwxKvt1gczZBAw4oebh658ugz1
 pwQyWSbW/96sw==
Received: by mail-ej1-f52.google.com with SMTP id bu12so35487048ejb.0;
 Mon, 12 Jul 2021 08:33:56 -0700 (PDT)
X-Gm-Message-State: AOAM5319RccAFvBsCDdSnSNGnWWTt34z7h4t7xk9pHJUF244EmWJrt6S
 Ne1KFFo6T7w/WFfWGxLWXVzIDPHrBBkw3rrdVg==
X-Google-Smtp-Source: ABdhPJwj+mU1GvCIh7UbOfcTMRsKzqq4SbbuuVJj57Xk+j0+HYYnALX6tsQE/1bSkimd2ZH7rSzVXRe5CtlOJPmpo1I=
X-Received: by 2002:a17:906:7e4f:: with SMTP id
 z15mr49606241ejr.194.1626104034975; 
 Mon, 12 Jul 2021 08:33:54 -0700 (PDT)
MIME-Version: 1.0
References: <1626051778-13577-1-git-send-email-yongqiang.niu@mediatek.com>
 <1626051778-13577-3-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1626051778-13577-3-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 12 Jul 2021 23:33:43 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-W-wm2X5PPSzRjQ0LSFEQaDZvsC4bW_Q58NXX-PpBe+Q@mail.gmail.com>
Message-ID: <CAAOTY_-W-wm2X5PPSzRjQ0LSFEQaDZvsC4bW_Q58NXX-PpBe+Q@mail.gmail.com>
Subject: Re: [PATCH v2, 2/3] drm/mediatek: add mt8183 aal support
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
X-CRM114-CacheID: sfid-20210712_083356_846545_8F52F140 
X-CRM114-Status: GOOD (  14.64  )
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
PiDmlrwgMjAyMeW5tDfmnIgxMuaXpSDpgLHkuIAg5LiK5Y2IOTowM+Wvq+mBk++8mgo+Cj4gVGhp
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
