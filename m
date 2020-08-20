Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69577C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 23:40:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 357DF2072D
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 23:40:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Rjw24uM+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="a3vAsrfe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 357DF2072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Z6wIX9nUSOZgGyuJ8VSJUwHtMxyvBTZOXEZUKP9/ciQ=; b=Rjw24uM+nR4I4+cdOeAySkGPg
	DmjN9+fRAVq1K0gt9xYKbN4nROZlYtSt+qRhSpV9AOgnVENYAzMR9TcZMFhBWufzc+AReLVbiBg0x
	0YRkCArgakGGJsqZUg5tt5BARcUqM1qbBRpPIC5HLtwXffvt0McpTSCUbiwvnfhUre4w/dCwTHKDH
	voMqm6O9hnpMI8zKe6GNODuuDX27Vi5bm7uQFjBrV4YS9JQp/2vVOKQBOQ6vOmDJQYmCgV7WK2Gl+
	+UjE1nwA6v6JbNBVrTbM4kudzsvOf6JfYPoBSH9PAzAisJjsHX/FseoL16THDGeDzxLmzj06x8jRx
	Keib9ygsA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8uAU-00042A-V9; Thu, 20 Aug 2020 23:40:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8uAP-00040b-VA; Thu, 20 Aug 2020 23:40:23 +0000
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 054CE21775;
 Thu, 20 Aug 2020 23:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597966821;
 bh=JeuGzk3Jo72ENzZOP/w7evl58YykGw/rfEkk7d6Bnpo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=a3vAsrfeJ3XPEnlQEcN4od4V3SSKEJZzcpwwisxe/CuZw6iMFYA9EkBoMo0KEQ+bT
 Lx6ATLXDPkRDWK30QPfXXUzReIoBRSsm0h+huSNNfawXTHltpj6ZLD9NTSpVUZxket
 dr1w2tQrIBMnfWMcMYLWLFVtGEHlGpX9qPfzZ+nE=
Received: by mail-ed1-f42.google.com with SMTP id m20so23894eds.2;
 Thu, 20 Aug 2020 16:40:20 -0700 (PDT)
X-Gm-Message-State: AOAM532SOBCV0Ka29qcg6ODSwC33oCbyvy/yjEZS4uCDgcdDEPVTYS42
 1JQFGGSAaMVEWguYlBPK8ghK5QWPdSDFTNK5Tw==
X-Google-Smtp-Source: ABdhPJzna3InnRxo8hkyDHSNU+9VcCcyFr6DNyT7xME6ZRkd0mWDrHGJLBqAN3OHiSHoxJRJW9bWBYnWZRnLLuJ25Vg=
X-Received: by 2002:a50:d80b:: with SMTP id o11mr311324edj.148.1597966819553; 
 Thu, 20 Aug 2020 16:40:19 -0700 (PDT)
MIME-Version: 1.0
References: <1597903458-8055-1-git-send-email-yongqiang.niu@mediatek.com>
 <1597903458-8055-7-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1597903458-8055-7-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 21 Aug 2020 07:40:07 +0800
X-Gmail-Original-Message-ID: <CAAOTY__s51xHeESdBwiRNL_2dg5n755ZT3cT+bn+2YDEaXCYBA@mail.gmail.com>
Message-ID: <CAAOTY__s51xHeESdBwiRNL_2dg5n755ZT3cT+bn+2YDEaXCYBA@mail.gmail.com>
Subject: Re: [PATCH v1 06/21] drm/mediatek: add disp config and mm 26mhz clock
 into mutex device
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_194022_461897_D80AB328 
X-CRM114-Status: GOOD (  25.66  )
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

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMOW5tDjmnIgyMOaXpSDpgLHlm5sg5LiL5Y2IMjowNuWvq+mBk++8mgo+Cj4gdGhl
cmUgYXJlIDIgbW9yZSBjbG9jayBuZWVkIGVuYWJsZSBmb3IgZGlzcGxheS4KPiBwYXJzZXIgdGhl
c2UgY2xvY2sgd2hlbiBtdXRleCBkZXZpY2UgcHJvYmUsCj4gZW5hYmxlIGFuZCBkaXNhYmxlIHdo
ZW4gbXV0ZXggb24vb2ZmCj4KPiBTaWduZWQtb2ZmLWJ5OiBZb25ncWlhbmcgTml1IDx5b25ncWlh
bmcubml1QG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcm1fZGRwLmMgfCA0OSArKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tCj4gIDEg
ZmlsZSBjaGFuZ2VkLCA0MSBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jIGIvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMKPiBpbmRleCA2MDc4OGMxLi5kZTYxOGExIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMKPiBAQCAtMTE4LDcgKzEx
OCw3IEBAIHN0cnVjdCBtdGtfZGRwX2RhdGEgewo+Cj4gIHN0cnVjdCBtdGtfZGRwIHsKPiAgICAg
ICAgIHN0cnVjdCBkZXZpY2UgICAgICAgICAgICAgICAgICAgKmRldjsKPiAtICAgICAgIHN0cnVj
dCBjbGsgICAgICAgICAgICAgICAgICAgICAgKmNsazsKPiArICAgICAgIHN0cnVjdCBjbGsgICAg
ICAgICAgICAgICAgICAgICAgKmNsa1szXTsKPiAgICAgICAgIHZvaWQgX19pb21lbSAgICAgICAg
ICAgICAgICAgICAgKnJlZ3M7Cj4gICAgICAgICBzdHJ1Y3QgbXRrX2Rpc3BfbXV0ZXggICAgICAg
ICAgIG11dGV4WzEwXTsKPiAgICAgICAgIGNvbnN0IHN0cnVjdCBtdGtfZGRwX2RhdGEgICAgICAg
KmRhdGE7Cj4gQEAgLTI1NywxNCArMjU3LDM5IEBAIGludCBtdGtfZGlzcF9tdXRleF9wcmVwYXJl
KHN0cnVjdCBtdGtfZGlzcF9tdXRleCAqbXV0ZXgpCj4gIHsKPiAgICAgICAgIHN0cnVjdCBtdGtf
ZGRwICpkZHAgPSBjb250YWluZXJfb2YobXV0ZXgsIHN0cnVjdCBtdGtfZGRwLAo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtdXRleFttdXRleC0+aWRdKTsKPiAt
ICAgICAgIHJldHVybiBjbGtfcHJlcGFyZV9lbmFibGUoZGRwLT5jbGspOwo+ICsgICAgICAgaW50
IHJldDsKPiArICAgICAgIGludCBpOwo+ICsKPiArICAgICAgIGZvciAoaSA9IDA7IGkgPCBBUlJB
WV9TSVpFKGRkcC0+Y2xrKTsgaSsrKSB7Cj4gKyAgICAgICAgICAgICAgIGlmIChJU19FUlIoZGRw
LT5jbGtbaV0pKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+ICsgICAgICAg
ICAgICAgICByZXQgPSBjbGtfcHJlcGFyZV9lbmFibGUoZGRwLT5jbGtbaV0pOwo+ICsgICAgICAg
ICAgICAgICBpZiAocmV0KSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcHJfZXJyKCJmYWls
ZWQgdG8gZW5hYmxlIGNsb2NrLCBlcnIgJWQuIGk6JWRcbiIsCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICByZXQsIGkpOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gZXJy
Owo+ICsgICAgICAgICAgICAgICB9Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgcmV0dXJuIDA7
Cj4gKwo+ICtlcnI6Cj4gKyAgICAgICB3aGlsZSAoLS1pID49IDApCj4gKyAgICAgICAgICAgICAg
IGNsa19kaXNhYmxlX3VucHJlcGFyZShkZHAtPmNsa1tpXSk7Cj4gKyAgICAgICByZXR1cm4gcmV0
Owo+ICB9Cj4KPiAgdm9pZCBtdGtfZGlzcF9tdXRleF91bnByZXBhcmUoc3RydWN0IG10a19kaXNw
X211dGV4ICptdXRleCkKPiAgewo+ICAgICAgICAgc3RydWN0IG10a19kZHAgKmRkcCA9IGNvbnRh
aW5lcl9vZihtdXRleCwgc3RydWN0IG10a19kZHAsCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIG11dGV4W211dGV4LT5pZF0pOwo+IC0gICAgICAgY2xrX2Rpc2Fi
bGVfdW5wcmVwYXJlKGRkcC0+Y2xrKTsKPiArICAgICAgIGludCBpOwo+ICsKPiArICAgICAgICBm
b3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShkZHAtPmNsayk7IGkrKykgewo+ICsgICAgICAgICAg
ICAgICBpZiAoSVNfRVJSKGRkcC0+Y2xrW2ldKSkKPiArICAgICAgICAgICAgICAgICAgICAgICBj
b250aW51ZTsKPiArICAgICAgICAgICAgICAgY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGRkcC0+Y2xr
W2ldKTsKPiArICAgICAgIH0KPiAgfQo+Cj4gIHZvaWQgbXRrX2Rpc3BfbXV0ZXhfYWRkX2NvbXAo
c3RydWN0IG10a19kaXNwX211dGV4ICptdXRleCwKPiBAQCAtNDE1LDExICs0NDAsMTkgQEAgc3Rh
dGljIGludCBtdGtfZGRwX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gICAg
ICAgICBkZHAtPmRhdGEgPSBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEoZGV2KTsKPgo+ICAgICAg
ICAgaWYgKCFkZHAtPmRhdGEtPm5vX2Nsaykgewo+IC0gICAgICAgICAgICAgICBkZHAtPmNsayA9
IGRldm1fY2xrX2dldChkZXYsIE5VTEwpOwo+IC0gICAgICAgICAgICAgICBpZiAoSVNfRVJSKGRk
cC0+Y2xrKSkgewo+IC0gICAgICAgICAgICAgICAgICAgICAgIGlmIChQVFJfRVJSKGRkcC0+Y2xr
KSAhPSAtRVBST0JFX0RFRkVSKQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGV2
X2VycihkZXYsICJGYWlsZWQgdG8gZ2V0IGNsb2NrXG4iKTsKPiAtICAgICAgICAgICAgICAgICAg
ICAgICByZXR1cm4gUFRSX0VSUihkZHAtPmNsayk7Cj4gKyAgICAgICAgICAgICAgIGludCByZXQ7
Cj4gKwo+ICsgICAgICAgICAgICAgICBmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShkZHAtPmNs
ayk7IGkrKykgewoKTW9kaWZ5IGJpbmRpbmcgZG9jdW1lbnQgZm9yIHRoaXMuCgpSZWdhcmRzLApD
aHVuLUt1YW5nLgoKPiArICAgICAgICAgICAgICAgICAgICAgICBkZHAtPmNsa1tpXSA9IG9mX2Ns
a19nZXQoZGV2LT5vZl9ub2RlLCBpKTsKPiArCj4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYg
KElTX0VSUihkZHAtPmNsa1tpXSkpIHsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHJldCA9IFBUUl9FUlIoZGRwLT5jbGtbaV0pOwo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgaWYgKHJldCAhPSBFUFJPQkVfREVGRVIpCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGdldCBjbG9jayAlZFxuIiwK
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXQpOwo+
ICsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgfQo+ICAgICAgICAgICAgICAgICB9Cj4gICAgICAgICB9Cj4KPiAt
LQo+IDEuOC4xLjEuZGlydHkKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IExpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdAo+IExpbnV4LW1lZGlhdGVr
QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0
ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
