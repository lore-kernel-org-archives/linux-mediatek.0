Return-Path: <SRS0=12Pn=BT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB2A9C433E0
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Aug 2020 00:37:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4270206B5
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Aug 2020 00:37:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3kL2XVaW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="TlFTbbMV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4270206B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=o7vTcQpwnssC0GpVJexNY7DYE02Z9LC4Ac9FiB5hMyA=; b=3kL2XVaWDWaA9UhcjPDBApa1l
	oczqUc+f/sCezYD/KqoFrvcZhC+RODTrUcQNVb2CAc8sC+jmYRtVxtmCoDn5zi/smJ2nkqWYqb9h6
	18Jp2zov2I/DnqSsOlEY2mVwFsr8h335evPUtV8dJW1YglweW42ZPTNQsjEpZfb766nZ2YUAVjoBW
	SBOIu8WDGZ7lSIrsD93J+I+akqIaZujgwOYOZOYuZUxcccckHWl4OIysFIu3n/z3zEtEbKGhLEk7V
	zuIX40IQS+wVwui+ogQJQM8xCr7Tqe1Ot1isVbglB2aULrmy2dBHqCK3UoiYw4IFDmUCqrPI9OjtQ
	qMe6YPd9Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k4ZKp-0006Dm-KG; Sun, 09 Aug 2020 00:37:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k4ZKk-0006Bc-5V; Sun, 09 Aug 2020 00:37:07 +0000
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 237A92073E;
 Sun,  9 Aug 2020 00:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596933425;
 bh=OwZbj9j2fVznBXJWG+kGBBS6B2y4BHwVj3nvv2bUc+o=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=TlFTbbMV/k+o66PWyKj3MJLo37tNkgYDcrrUiK+N73KaD55/NMcj9yl4sXEqJV+Ve
 8sU2kjCPKUYEX7g0XgGoRl8cq5fnESFhrnVv4Z+af7+hm6EgI9NLQlKLqlzc+cFXLT
 /NFLdgtWCZuXa/8F1GZhNh0CeqKGSZRSA133jfII=
Received: by mail-ej1-f51.google.com with SMTP id bo3so5849363ejb.11;
 Sat, 08 Aug 2020 17:37:05 -0700 (PDT)
X-Gm-Message-State: AOAM533Bg9oG47p1THljj7oHvxgiurRUXOkAgOiA6cq7wgm196RGrz5M
 Sw4d9AEorNVeBKtzLRP7wF7eOT8BuJZWX1ebXg==
X-Google-Smtp-Source: ABdhPJyRhNiwUtOdFe5BV5TXi2CdPsenCRK7yZwtV8dYfmYgEntYLcapnDUx1Pn9vQyDNpXrZ1cECP5wWDwV76cWsVI=
X-Received: by 2002:a17:906:12d8:: with SMTP id
 l24mr4040593ejb.260.1596933423727; 
 Sat, 08 Aug 2020 17:37:03 -0700 (PDT)
MIME-Version: 1.0
References: <1596855231-5782-1-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1596855231-5782-1-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 9 Aug 2020 08:36:52 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8nE4mHq0O2hnqr7+ooKSPS-O2CB6MprODF95gEJB_naQ@mail.gmail.com>
Message-ID: <CAAOTY_8nE4mHq0O2hnqr7+ooKSPS-O2CB6MprODF95gEJB_naQ@mail.gmail.com>
Subject: Re: [RESEND v7, PATCH 0/7] add drm support for MT8183
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200808_203706_405871_C3C9AB30 
X-CRM114-Status: GOOD (  21.79  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIFlvbmdxaWFuZzoKClRoaXMgc2VyaWVzIGlzICd2OCcsIG5vdCAnUkVTRU5EIHY3JwoKWW9u
Z3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+IOaWvCAyMDIw5bm0OOaciDjm
l6Ug6YCx5YWtIOS4iuWNiDEwOjU25a+r6YGT77yaCj4KPiBUaGlzIHNlcmllcyBhcmUgYmFzZWQg
b24gNS44LXJjMSBhbmQgcHJvdmlkZSA3IHBhdGNoCj4gdG8gc3VwcG9ydCBtZWRpYXRlayBTT0Mg
TVQ4MTgzCj4KPiBDaGFuZ2Ugc2luY2UgdjYKPiAtIG1vdmUgZGRwIGNvbXBvbmVudCBkZWZpbmUg
aW50byBtdGtfbW1zeXMuaAo+IC0gYWRkIG1tc3lzIHByaXZhdGUgZGF0YSB0byBzdXBwb3J0IGRp
ZmZlcmVudCBpYyBwYXRoIGNvbm5lY3Rpb24KPiAtIGFkZCBtdDgxODMtbW1zeXMuYyB0byBzdXBw
b3J0IDgxODMgcGF0aCBjb25uZWN0aW9uCj4gLSBmaXggcmV2aWV3ZWQgaXNzdWUgaW4gdjYKPgo+
IENoYW5nZSBzaW5jZSB2NQo+IC0gZml4IHJldmlld2VkIGlzc3VlIGluIHY1Cj4gYmFzZSBodHRw
czovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsvbGlzdC8/c2Vy
aWVzPTIxMzIxOQo+Cj4gQ2hhbmdlIHNpbmNlIHY0Cj4gLSBmaXggcmV2aWV3ZWQgaXNzdWUgaW4g
djQKPgo+IENoYW5nZSBzaW5jZSB2Mwo+IC0gZml4IHJldmlld2VkIGlzc3VlIGluIHYzCj4gLSBm
aXggdHlwZSBlcnJvciBpbiB2Mwo+IC0gZml4IGNvbmZsaWN0IHdpdGggaW9tbXUgcGF0Y2gKPgo+
IENoYW5nZSBzaW5jZSB2Mgo+IC0gZml4IHJldmlld2VkIGlzc3VlIGluIHYyCj4gLSBhZGQgbXV0
ZXggbm9kZSBpbnRvIGR0cyBmaWxlCj4KPiBDaGFuZ2VzIHNpbmNlIHYxOgo+IC0gZml4IHJldmll
d2VkIGlzc3VlIGluIHYxCj4gLSBhZGQgZHRzIGZvciBtdDgxODMgZGlzcGxheSBub2Rlcwo+IC0g
YWRqdXN0IGRpc3BsYXkgY2xvY2sgY29udHJvbCBmbG93IGluIHBhdGNoIDIyCj4gLSBhZGQgdm1h
cCBzdXBwb3J0IGZvciBtZWRpYXRlayBkcm0gaW4gcGF0Y2ggMjMKPiAtIGZpeCBwYWdlIG9mZnNl
dCBpc3N1ZSBmb3IgbW1hcCBmdW5jdGlvbiBpbiBwYXRjaCAyNAo+IC0gZW5hYmxlIGFsbG93X2Zi
X21vZGlmaWVycyBmb3IgbWVkaWF0ZWsgZHJtIGluIHBhdGNoIDI1Cj4KPiBZb25ncWlhbmcgTml1
ICg3KToKPiAgIGR0LWJpbmRpbmdzOiBtZWRpYXRlazogYWRkIHJkbWFfZmlmb19zaXplIGRlc2Ny
aXB0aW9uIGZvciBtdDgxODMKPiAgICAgZGlzcGxheQo+ICAgZHJtL21lZGlhdGVrOiBtb3ZlIGRk
cCBjb21wb25lbnQgZGVmaW5lIGludG8gbXRrX21tc3lzLmgKPiAgIG10ay1tbXN5czogYWRkIG1t
c3lzIHByaXZhdGUgZGF0YQo+ICAgbXRrLW1tc3lzOiBhZGQgbXQ4MTgzIG1tc3lzIHN1cHBvcnQK
PiAgIGRybS9tZWRpYXRlazogYWRkIGZpZm9fc2l6ZSBpbnRvIHJkbWEgcHJpdmF0ZSBkYXRhCj4g
ICBkcm0vbWVkaWF0ZWs6IGFkZCBzdXBwb3J0IGZvciBtZWRpYXRlayBTT0MgTVQ4MTgzCj4gICBh
cm02NDogZHRzOiBhZGQgZGlzcGxheSBub2RlcyBmb3IgbXQ4MTgzCj4KPiAgLi4uL2JpbmRpbmdz
L2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQgICAgfCAgMTQgKysKPiAgYXJjaC9h
cm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxODMuZHRzaSAgICAgICAgICAgfCAgOTggKysrKysr
KysKPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jICAgICAgICAgICAg
fCAgMTggKysKPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX3JkbWEuYyAgICAg
ICAgICAgfCAgMjUgKy0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMg
ICAgICAgICAgICAgfCAgNDcgKysrKwo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Ry
bV9kZHBfY29tcC5oICAgICAgICB8ICAzNCArLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcm1fZHJ2LmMgICAgICAgICAgICAgfCAgNDMgKysrKwo+ICBkcml2ZXJzL3NvYy9tZWRp
YXRlay9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCj4gIGRyaXZlcnMvc29j
L21lZGlhdGVrL21tc3lzL01ha2VmaWxlICAgICAgICAgICAgICAgIHwgICAzICsKPiAgZHJpdmVy
cy9zb2MvbWVkaWF0ZWsvbW1zeXMvbXQyNzAxLW1tc3lzLmMgICAgICAgICAgfCAyNTAgKysrKysr
KysrKysrKysrKysrKwo+ICBkcml2ZXJzL3NvYy9tZWRpYXRlay9tbXN5cy9tdDgxODMtbW1zeXMu
YyAgICAgICAgICB8IDE1NCArKysrKysrKysrKysKPiAgZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRr
LW1tc3lzLmMgICAgICAgICAgICAgICAgICAgfCAyNzYgKysrKy0tLS0tLS0tLS0tLS0tLS0tCj4g
IGluY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210ay1tbXN5cy5oICAgICAgICAgICAgIHwgIDQ4
ICsrKysKPiAgMTMgZmlsZXMgY2hhbmdlZCwgNzQ5IGluc2VydGlvbnMoKyksIDI2MiBkZWxldGlv
bnMoLSkKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvc29jL21lZGlhdGVrL21tc3lzL01h
a2VmaWxlCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3NvYy9tZWRpYXRlay9tbXN5cy9t
dDI3MDEtbW1zeXMuYwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9zb2MvbWVkaWF0ZWsv
bW1zeXMvbXQ4MTgzLW1tc3lzLmMKPgo+IC0tCj4gMS44LjEuMS5kaXJ0eQo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXgtbWVkaWF0ZWsgbWFp
bGluZyBsaXN0Cj4gTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVr
IG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
