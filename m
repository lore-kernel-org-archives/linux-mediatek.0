Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB382C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Apr 2022 09:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eTmDNnBhYYGwGc4LF9N1qbzzCV2f96eNktv7hy5HGmg=; b=rSTD19nbt6Mbv8
	Lh9j+VOlFRmMl3Oun4pKxa4zXY3ZImGzo+spmzQpoCe5+eM1uhhsgammHw46namimm9xTw51tNRsJ
	xTazbclfMlpzMyD6CbiKi9GPaTN/ZZZVGpyz5SSBHR+7QwlF7oWnhJW0yVRFDfS6nBHGe92Uy4u6I
	hS1tSDf+i1g+5djPibSBjmWVvP2EWOZEnJhOEbhiebFT5zoCzlyly6sEGjoZwGOEpvJ3XQCFXpuVu
	5isr4XHG1GnrFi9OQwrCnVAsx4/WJ1RitvMPJYDvcd4d+xo2uN1ol/AG8Q+5vC9I++vqIjBrqfvuk
	I8hGwtv/oz9fd/jPOpjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nivUW-0091nE-Uf; Mon, 25 Apr 2022 09:58:48 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nivU9-0091fN-Qf
 for linux-mediatek@lists.infradead.org; Mon, 25 Apr 2022 09:58:30 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1nivTq-0000ya-E2; Mon, 25 Apr 2022 11:58:06 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1nivTq-0057XY-CK; Mon, 25 Apr 2022 11:58:04 +0200
Received: from pza by lupine with local (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1nivTo-00057A-8s; Mon, 25 Apr 2022 11:58:04 +0200
Message-ID: <b4f438026fe208f8f6511de34c7e84c8c59d843c.camel@pengutronix.de>
Subject: Re: [PATCH v17 13/21] drm/mediatek: add display merge async reset
 control
From: Philipp Zabel <p.zabel@pengutronix.de>
To: "Nancy.Lin" <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, wim@linux-watchdog.org,  AngeloGioacchino Del
 Regno <angelogioacchino.delregno@collabora.com>, linux@roeck-us.net
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>,  devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,  dri-devel@lists.freedesktop.org,
 llvm@lists.linux.dev, singo.chang@mediatek.com, 
 srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Date: Mon, 25 Apr 2022 11:58:04 +0200
In-Reply-To: <20220416020749.29010-14-nancy.lin@mediatek.com>
References: <20220416020749.29010-1-nancy.lin@mediatek.com>
 <20220416020749.29010-14-nancy.lin@mediatek.com>
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_025825_917977_8C1E949E 
X-CRM114-Status: GOOD (  15.75  )
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

T24gU2EsIDIwMjItMDQtMTYgYXQgMTA6MDcgKzA4MDAsIE5hbmN5LkxpbiB3cm90ZToKPiBBZGQg
bWVyZ2UgYXN5bmMgcmVzZXQgY29udHJvbCBpbiBtdGtfbWVyZ2Vfc3RvcC4gQXN5bmMgaHcgZG9l
c24ndCBkbyBzZWxmCj4gcmVzZXQgb24gZWFjaCBzb2Ygc2lnbmFsKHN0YXJ0IG9mIGZyYW1lKSwg
c28gbmVlZCB0byByZXNldCB0aGUgYXN5bmMgdG8KPiBjbGVhciB0aGUgaHcgc3RhdHVzIGZvciB0
aGUgbmV4dCBtZXJnZSBzdGFydC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBOYW5jeS5MaW4gPG5hbmN5
LmxpbkBtZWRpYXRlay5jb20+Cj4gUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5j
b20+Cj4gUmV2aWV3ZWQtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9h
Y2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+Cj4gLS0tCj4gwqBkcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2Rpc3BfbWVyZ2UuYyB8IDQgKysrKwo+IMKgMSBmaWxlIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2Rpc3BfbWVyZ2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9tZXJn
ZS5jCj4gaW5kZXggOWRjYTE0NWNmYjcxLi4xNzc0NzNmYTgxNjAgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX21lcmdlLmMKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfbWVyZ2UuYwo+IEBAIC04LDYgKzgsNyBAQAo+IMKgI2lu
Y2x1ZGUgPGxpbnV4L29mX2RldmljZS5oPgo+IMKgI2luY2x1ZGUgPGxpbnV4L29mX2lycS5oPgo+
IMKgI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgo+ICsjaW5jbHVkZSA8bGludXgv
cmVzZXQuaD4KPiDCoCNpbmNsdWRlIDxsaW51eC9zb2MvbWVkaWF0ZWsvbXRrLWNtZHEuaD4KPiDC
oAo+IAo+IAo+IAo+IMKgI2luY2x1ZGUgIm10a19kcm1fZGRwX2NvbXAuaCIKPiBAQCAtNzksNiAr
ODAsOSBAQCB2b2lkIG10a19tZXJnZV9zdG9wKHN0cnVjdCBkZXZpY2UgKmRldikKPiDCoAlzdHJ1
Y3QgbXRrX2Rpc3BfbWVyZ2UgKnByaXYgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKPiDCoAo+IAo+
IAo+IAo+IMKgCW10a19tZXJnZV9zdG9wX2NtZHEoZGV2LCBOVUxMKTsKPiArCj4gKwlpZiAocHJp
di0+YXN5bmNfY2xrKQo+ICsJCWRldmljZV9yZXNldF9vcHRpb25hbChkZXYpOwoKVG8gYXZvaWQg
dGhlIG92ZXJoZWFkIG9mIGxvb2tpbmcgdXAgdGhlIHJlc2V0IGNvbnRyb2wgaW4gdGhlIGRldmlj
ZQp0cmVlIGV2ZXJ5IHRpbWUsIGl0IHdvdWxkIGJlIGJldHRlciB0byByZXF1ZXN0IGEgcmVzZXQg
Y29udHJvbCBkdXJpbmcKcHJvYmUgdXNpbmcgZGV2bV9yZXNldF9jb250cm9sX2dldF9vcHRpb25h
bF9leGNsdXNpdmUoKS4gSGVyZSB5b3UnZApqdXN0IGNhbGwgcmVzZXRfY29udHJvbF9yZXNldCgp
LgoKcmVnYXJkcwpQaGlsaXBwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW1lZGlhdGVrCg==
