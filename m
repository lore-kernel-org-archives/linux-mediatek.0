Return-Path: <SRS0=zFd5=FP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61A39C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Dec 2020 00:45:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D83A23DB4
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Dec 2020 00:45:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D83A23DB4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OU5X3Oi+byqZXDxQK6H6SHnPorpS3CBmJsKVuU+rS1Y=; b=khAnaiXDPWWHnFUPKe8r3vvOwD
	HPIa5zDvZg9qjCiKBilqMYPx2PQn18tVPg7wCVLLkPrvvvS4QXLn+NrfuGC1vn8Gx+HX9XAXyvx81
	IOrk3J4H8vyjgPty9br3gBq7irdSjfLXi2J7rAZab/xPHP6Gg1zcNiEhBPqp0dV5h+2HK0ee/fwpy
	7rsRZy5bA73bsvrTmD25e/l8WNb7rY4Zv1D6Vheg7c/2RRV4pXG1O6aXVfJ+VfOYLwo/+TllojPgU
	xBqoAWprme4+s8m1SGIWQ75ugprcsp3hWUJ1EzUE6zBNdpU9xVYIzZRnwhqRWVt1WKJHNtYvgA+PL
	qRL2G0Yw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knWYs-0001xQ-TC; Fri, 11 Dec 2020 00:45:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knWYl-0001tP-KG; Fri, 11 Dec 2020 00:45:25 +0000
X-UUID: 8b019389954640929c6d73e6b684debd-20201210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:Message-ID;
 bh=E2phvecjpcnxYh432R82AH09qnOeU+p1vhvA2VIcfOk=; 
 b=F7sjF2eqEjKJMwSSU4AZJLeViYRoUx74iNfXtM69MtyBBtfRoQqtSQZXze3mjpnDasQZYc6fiaOKNTYb0RgoFWEEp2RUviE/mfaJ4wpolQ/Jvbs6D9Sy928OedUFkTQJqbSfGRktPACWB0pBaIKXvial8T1UK4O/9gfsxW2XyCE=;
X-UUID: 8b019389954640929c6d73e6b684debd-20201210
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2079382488; Thu, 10 Dec 2020 16:45:18 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Dec 2020 16:45:16 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs05n2.mediatek.inc
 (172.21.101.140) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 11 Dec 2020 08:45:14 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 11 Dec 2020 08:45:13 +0800
Message-ID: <1607647514.12750.5.camel@mhfsdcap03>
Subject: Re: [PATCH v8, 5/6] drm/mediatek: add RDMA fifo size error handle
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 11 Dec 2020 08:45:14 +0800
In-Reply-To: <CAAOTY_-aYFz1Xg6r2ur+BF_k_35F3qNLLb16_2c0MaMsYre-+w@mail.gmail.com>
References: <1607591262-21736-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607591262-21736-6-git-send-email-yongqiang.niu@mediatek.com>
 <CAAOTY_-aYFz1Xg6r2ur+BF_k_35F3qNLLb16_2c0MaMsYre-+w@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_194524_476530_1407B2A9 
X-CRM114-Status: GOOD (  21.90  )
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
Reply-To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob
 Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAyMDIwLTEyLTEwIGF0IDIzOjUwICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOg0K
PiBIaSwgWW9uZ3FpYW5nOg0KPiANCj4gWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRp
YXRlay5jb20+IOaWvCAyMDIw5bm0MTLmnIgxMOaXpSDpgLHlm5sg5LiL5Y2INTowOOWvq+mBk++8
mg0KPiA+DQo+ID4gVGhpcyBwYXRjaCBhZGQgUkRNQSBmaWZvIHNpemUgZXJyb3IgaGFuZGxlDQo+
ID4gcmRtYSBmaWZvIHNpemUgd2lsbCBub3QgYWx3YXlzIGJpZ2dlciB0aGFuIHRoZSBjYWxjdWxh
dGVkIHRocmVzaG9sZA0KPiA+IGlmIHRoYXQgY2FzZSBoYXBwZW5lZCwgd2UgbmVlZCBzZXQgZmlm
byBzaXplIGFzIHRoZSB0aHJlc2hvbGQNCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFlvbmdxaWFu
ZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfcmRtYS5jIHwgNCArKysrDQo+ID4gIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfcmRtYS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kaXNwX3JkbWEuYw0KPiA+IGluZGV4IDc5NGFjYzUuLjA1MDgzOTIgMTAwNjQ0DQo+ID4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX3JkbWEuYw0KPiA+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9yZG1hLmMNCj4gPiBAQCAtMTUxLDYg
KzE1MSwxMCBAQCBzdGF0aWMgdm9pZCBtdGtfcmRtYV9jb25maWcoc3RydWN0IG10a19kZHBfY29t
cCAqY29tcCwgdW5zaWduZWQgaW50IHdpZHRoLA0KPiA+ICAgICAgICAgICogYWNjb3VudCBmb3Ig
YmxhbmtpbmcsIGFuZCB3aXRoIGEgcGl4ZWwgZGVwdGggb2YgNCBieXRlczoNCj4gPiAgICAgICAg
ICAqLw0KPiA+ICAgICAgICAgdGhyZXNob2xkID0gd2lkdGggKiBoZWlnaHQgKiB2cmVmcmVzaCAq
IDQgKiA3IC8gMTAwMDAwMDsNCj4gPiArDQo+ID4gKyAgICAgICBpZiAodGhyZXNob2xkID4gcmRt
YV9maWZvX3NpemUpDQo+ID4gKyAgICAgICAgICAgICAgIHRocmVzaG9sZCA9IHJkbWFfZmlmb19z
aXplOw0KPiANCj4gSWYgdGhlIGZvcm11bGEgaXMgbm90IGNvcnJlY3QsIHlvdSBzaG91bGQgZml4
IHRoZSBmb3JtdWxhIG5vdCB3b3JrIGFyb3VuZC4NCj4gDQo+IFJlZ2FyZHMsDQo+IENodW4tS3Vh
bmcuDQoNCmhvdyBhYm91dCB0aGlzOg0KdGhyZXNob2xkID0gbWF4KHdpZHRoICogaGVpZ2h0ICog
dnJlZnJlc2ggKiA0ICogNyAvIDEwMDAwMDAsDQpyZG1hX2ZpZm9fc2l6ZSk7DQo+IA0KPiA+ICsN
Cj4gPiAgICAgICAgIHJlZyA9IFJETUFfRklGT19VTkRFUkZMT1dfRU4gfA0KPiA+ICAgICAgICAg
ICAgICAgUkRNQV9GSUZPX1BTRVVET19TSVpFKHJkbWFfZmlmb19zaXplKSB8DQo+ID4gICAgICAg
ICAgICAgICBSRE1BX09VVFBVVF9WQUxJRF9GSUZPX1RIUkVTSE9MRCh0aHJlc2hvbGQpOw0KPiA+
IC0tDQo+ID4gMS44LjEuMS5kaXJ0eQ0KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fDQo+ID4gTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0DQo+ID4g
TGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiA+IGh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsNCg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
