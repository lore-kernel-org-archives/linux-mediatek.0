Return-Path: <SRS0=ytEc=GY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00B8FC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jan 2021 08:19:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 921122399A
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jan 2021 08:19:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 921122399A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PiFnmFy9I5vt3Hl7cfL3XfP6DoBKzoZoF1QI5YeMyaQ=; b=LhKVJN5Nk4yUkQ6ip+ohDmN46
	iNiV5IJeSXH40I5De6MljvECmBeo+VJzLogS6OAuLUhqLm0w3RM2oRN+dAndbxqQF1+WKiL/kbbsU
	tK4wR1z6Du7MrsXMDwvoETkCdWkJy/beXS8f75wa6u0Kl0EJB8qkOZ8cSNm3SM4atepG1FcMLVOgm
	kU2m5fkz4A/VjI8ku/whGd9EvEudV13rfOiWRdjBjihPS7dSFn6M6nijpi7NG021zyDHO6W1dXtCo
	SG08qd0YN0mwLrmArEnXRFHT0uEdnnBBQmMuWbpJGBjDz7K82Z8Hau8PICxtvM7cD5xodR6aGn2fZ
	/iA99G11g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2VBM-0002SO-D0; Thu, 21 Jan 2021 08:19:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2VBH-0002Qd-2G; Thu, 21 Jan 2021 08:19:04 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 65E1723976;
 Thu, 21 Jan 2021 08:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611217141;
 bh=hhhptWrujcElAbSl2ou/FOxBVarF2/4ZICpA78koQKY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mOSdaqmeY7neZr1NBdUhHGAUKUpB/zX8/VLMLHq0RUKZrQm5L/GslnlEd/F0MmgDs
 KmDJSbUyVPrRRYMjLpHTZFacGkiu2MzPBeB3+ZF/hGQ26lmZlKTazZ/o2LlxuL1E39
 DA0psnM6msta+GWNePYVYBp/ct2i+jmVrMIK399eteygz67RoZmJC+y4azViV7HWQV
 vSzPpc1cJT/RDpgUL4SCbxvsQK27k3yNIIoadcN/3PCMYc1QBowK9ToZ3eru3tWvGG
 oOS/WNXftOI/g647lAalt85eSJoVi4EI92NujfyXHBgXEm3dIzVO55Mbw7q9I2+3rC
 gwZRcTkLQpEFA==
Date: Thu, 21 Jan 2021 09:18:55 +0100
From: Matthias Brugger <matthias.bgg@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: Re: [PATCH v2 3/5] drm/mediatek: Change disp/ddp term to mutex in
 mtk mutex driver
Message-ID: <YAk4722oCzcegGdx@ziggy.stardust>
References: <20210106231729.17173-1-chunkuang.hu@kernel.org>
 <20210106231729.17173-4-chunkuang.hu@kernel.org>
 <YAh2JGUUpMcgyke0@ziggy.stardust>
 <CAAOTY_82Z_DQuJWDD5NMeq35o2Tf-zQzmSxJwRYRRpHQJVHNEA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAOTY_82Z_DQuJWDD5NMeq35o2Tf-zQzmSxJwRYRRpHQJVHNEA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210121_031903_254117_77FA173A 
X-CRM114-Status: GOOD (  24.86  )
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
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBKYW4gMjEsIDIwMjEgYXQgMDc6NDY6NDRBTSArMDgwMCwgQ2h1bi1LdWFuZyBIdSB3
cm90ZToKPiBIaSwgTWF0dGhpYXM6Cj4gCj4gTWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhpYXMuYmdn
QGtlcm5lbC5vcmc+IOaWvCAyMDIx5bm0MeaciDIx5pelIOmAseWbmyDkuIrljYgyOjI35a+r6YGT
77yaCj4gPgo+ID4gT24gVGh1LCBKYW4gMDcsIDIwMjEgYXQgMDc6MTc6MjdBTSArMDgwMCwgQ2h1
bi1LdWFuZyBIdSB3cm90ZToKPiA+ID4gRnJvbTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4K
PiA+ID4KPiA+ID4gbXRrIG11dGV4IGlzIHVzZWQgYnkgYm90aCBkcm0gYW5kIG1kcCBkcml2ZXIs
IHNvIGNoYW5nZSBkaXNwL2RkcCB0ZXJtIHRvCj4gPiA+IG11dGV4IHRvIHNob3cgdGhhdCBpdCdz
IGEgY29tbW9uIGRyaXZlciBmb3IgZHJtIGFuZCBtZHAuCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYt
Ynk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IENodW4t
S3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgo+ID4gPiAtLS0KPiA+ID4gIGRyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYyB8ICAzMCArLS0KPiA+ID4gIGRyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jICB8ICAgMiArLQo+ID4gPiAgZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmggIHwgICAyICstCj4gPiA+ICBkcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX211dGV4LmMgICAgfCAzMDUgKysrKysrKysrKysrLS0tLS0t
LS0tLS0tCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX211dGV4LmggICAgfCAg
MjYgKy0KPiA+ID4gIDUgZmlsZXMgY2hhbmdlZCwgMTgyIGluc2VydGlvbnMoKyksIDE4MyBkZWxl
dGlvbnMoLSkKPiA+ID4KPiA+IFsuLi5dCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX211dGV4LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX211
dGV4LmMKPiA+ID4gaW5kZXggMWM4YTI1M2Y0Nzg4Li45OGEwNjBiZjIyNWQgMTAwNjQ0Cj4gPiA+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfbXV0ZXguYwo+ID4gPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX211dGV4LmMKPiA+IFsuLi5dCj4gPiA+Cj4gPiA+
IC1zdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBkZHBfZHJpdmVyX2R0X21hdGNoW10g
PSB7Cj4gPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBtdXRleF9kcml2ZXJf
ZHRfbWF0Y2hbXSA9IHsKPiA+ID4gICAgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDI3
MDEtZGlzcC1tdXRleCIsCj4gPiA+IC0gICAgICAgLmRhdGEgPSAmbXQyNzAxX2RkcF9kcml2ZXJf
ZGF0YX0sCj4gPiA+ICsgICAgICAgLmRhdGEgPSAmbXQyNzAxX211dGV4X2RyaXZlcl9kYXRhfSwK
PiA+ID4gICAgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDI3MTItZGlzcC1tdXRleCIs
Cj4gPiA+IC0gICAgICAgLmRhdGEgPSAmbXQyNzEyX2RkcF9kcml2ZXJfZGF0YX0sCj4gPiA+ICsg
ICAgICAgLmRhdGEgPSAmbXQyNzEyX211dGV4X2RyaXZlcl9kYXRhfSwKPiA+ID4gICAgICAgeyAu
Y29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxNjctZGlzcC1tdXRleCIsCj4gPiA+IC0gICAgICAg
LmRhdGEgPSAmbXQ4MTY3X2RkcF9kcml2ZXJfZGF0YX0sCj4gPiA+ICsgICAgICAgLmRhdGEgPSAm
bXQ4MTY3X211dGV4X2RyaXZlcl9kYXRhfSwKPiA+ID4gICAgICAgeyAuY29tcGF0aWJsZSA9ICJt
ZWRpYXRlayxtdDgxNzMtZGlzcC1tdXRleCIsCj4gPiA+IC0gICAgICAgLmRhdGEgPSAmbXQ4MTcz
X2RkcF9kcml2ZXJfZGF0YX0sCj4gPiA+ICsgICAgICAgLmRhdGEgPSAmbXQ4MTczX211dGV4X2Ry
aXZlcl9kYXRhfSwKPiA+ID4gICAgICAge30sCj4gPiA+ICB9Owo+ID4gPiAtTU9EVUxFX0RFVklD
RV9UQUJMRShvZiwgZGRwX2RyaXZlcl9kdF9tYXRjaCk7Cj4gPiA+ICtNT0RVTEVfREVWSUNFX1RB
QkxFKG9mLCBtdXRleF9kcml2ZXJfZHRfbWF0Y2gpOwo+ID4KPiA+IEkgdGhpbmsgaXQgd291bGQg
bWFrZSBzZW5zZSBpbiBhIGZvbGxvdy11cCBwYXRjaCB0byB1cGRhdGUgdGhlIGJpbmRpbmcKPiA+
IHRvIHVzZSAibWVkaWF0ZWssbXQyNzAxLW11dGV4IiB0byByZWZsZWN0IHRoYXQgbXV0ZXggaXMg
dXNlZCBmb3IgZHJtIGFuZAo+ID4gbWRwIGRyaXZlci4gTWFrZSBzZW5zZT8KPiAKPiBZZXMsIGl0
IG1ha2Ugc2Vuc2UuIEkgd291bGQgdHJ5IHRvIHVwZGF0ZSB0aGUgYmluZGluZywgYnV0IEkgd29u
ZGVyCj4gZGV2aWNlIHRyZWUgc2hvdWxkIGJlIGJhY2t3YXJkIGNvbXBhdGlibGU/IExldCdzIGRp
c2N1c3MgaW4gdGhhdAo+IGZvbGxvdy11cCBwYXRjaGVzLgo+IAoKRnJvbSBteSB1bmRlcnN0YW5k
aW5nLCB3ZSB3aWxsIG5lZWQgdG8ga2VlcCB0aGUgb2ZfZGV2aWNlX2lkIGVudHJpZXMgZm9yCnRo
ZSBvbGQgYmluZGluZyBpbiB0aGUgZHJpdmVyIChzbyB0aGF0IG9sZCBEVHMgc3RpbGwgd29yaykg
d2hpbGUgd2UKc2hvdWxkIGVuZm9yY2UgdGhlIG5ldyBiaW5kaW5nLiBJJ20gbm90IHN1cmUgaWYg
dGhlIHlhbWwgaGFzIGEgb3B0aW9uCmZvciBvdXQtb2YtZGF0ZSBjb21wYXRpYmxlcy4KClJlZ2Fy
ZHMsCk1hdHRoaWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW1lZGlhdGVrCg==
