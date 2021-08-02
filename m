Return-Path: <SRS0=Q+Xe=MZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 394BBC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 23:01:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00EC060D07
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 23:01:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 00EC060D07
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w37OLqOWr/dmZsOHHY8jyp9ZUEODWI6/emiWXZzGWkI=; b=kCzya7ZjzDZAFm
	nwpT/MiZyWRtiFPfPhvInctT4kK6VWDZE/aGDYyN0qVWzsQDR+al5KzrDJx18I5AI5WlXToQ4QodK
	P+qe81mkF2tY+LmBroePMX8mG1jyh/idlZom3P3JB+a3vPjYwVesbyOTYoIU4ppIPRLVF51cqsC6Z
	2VIa21rj1G8MHJFe3IyxVNQntDvsbvGy2huL3AEn5drfnbKmDpIKMp61Qgnq5KEhFU0BcwtNUoBSB
	sZVuTsHSian47oiiNkwu/xUq1r7dnIDSJRD694F/nDWo2/TkPLEjIFF+jDm7hTrmk7F9QdRnOZKen
	d4qh/LZOWV03yFKz82kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAgvh-000Wwo-8o; Mon, 02 Aug 2021 23:01:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAgvT-000Wpn-FA; Mon, 02 Aug 2021 23:00:52 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 70E8C60F70;
 Mon,  2 Aug 2021 23:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627945250;
 bh=e822VuDx6z8sMZ4u2JoN2zmm7TSpCXSrlQ2PRMcE4RA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=JxOIrHwDEsSnb0iq0rIpsYlOLoG24P4miwqyD1FG7n4FWHzwDNfy/NHjYdDMu5Qji
 kXPSkX44FzNpdxEJtmmIARGgMRDYC9iIdUV2TyjtD0Sq+Kg/QNdoUV6RLsJm3/acl7
 25pdODPscvgAAJXGUOgPzTBKvkfiDzgA/ato56Vb671pWbF2IJGQzrlpL81XqgcdW3
 pRcpknNaL3LOwPZKRRkwGd2LdUK2o8yDLvrlVmcOBcoyoiz7VZp8vqJysP6tbh3Cse
 8+95COQy5cbA3qCXkRhDTUyY/YfbD6G1rfhrCL41k18t2xk1f7jCngE/ya9GL8S5ER
 FfHzzKXcHrclw==
Received: by mail-ed1-f45.google.com with SMTP id cf5so15090564edb.2;
 Mon, 02 Aug 2021 16:00:50 -0700 (PDT)
X-Gm-Message-State: AOAM532adCkIdYGH0owkV1Edj/iegV2DlhZs0mjYpJPMuA/EcIDvh3AF
 EhLTw13Q5AE6AfkmSSDZziDAqyX+rdaK4IIYtg==
X-Google-Smtp-Source: ABdhPJx6Gl9WihqORzSylHXdbZm8MM0D7sQz2BcZWhMz275j1ol0e9w/UzfEvJ6WuteyWfPe8BLhoqmL0forF5o0OZA=
X-Received: by 2002:a05:6402:718:: with SMTP id
 w24mr21831525edx.49.1627945249057; 
 Mon, 02 Aug 2021 16:00:49 -0700 (PDT)
MIME-Version: 1.0
References: <1626762588-6020-1-git-send-email-yongqiang.niu@mediatek.com>
 <1626762588-6020-2-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1626762588-6020-2-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 3 Aug 2021 07:00:37 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9ynURx3Arevk_Tdc2V2uobJbeRA_2JjmZtsc=wT2V6aA@mail.gmail.com>
Message-ID: <CAAOTY_9ynURx3Arevk_Tdc2V2uobJbeRA_2JjmZtsc=wT2V6aA@mail.gmail.com>
Subject: Re: [PATCH v5] drm/mediatek: add dither 6 setting
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
X-CRM114-CacheID: sfid-20210802_160051_585140_9FA67A52 
X-CRM114-Status: GOOD (  14.51  )
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
PiDmlrwgMjAyMeW5tDfmnIgyMOaXpSDpgLHkuowg5LiL5Y2IMjozMOWvq+mBk++8mgo+Cj4gZGl0
aGVyIDYgc2V0dGluZyBpcyBtaXNzZWQgaW4gYTZiN2M5OGFmZGNhCj4gYml0IDEgaXMgbGZzcl9l
biggIkVuYWJsZXMgTEZTUi10eXBlIGRpdGhlcmluZyIpLCBuZWVkIGVuYWJsZQo+IGJpdCAyIGlz
IHJkaXRoZXJfZW4oRW5hYmxlcyBydW5uaW5nIG9yZGVyIGRpdGhlcmluZyksIG5lZWQgZGlzYWJs
ZQo+Cj4gRml4ZXM6IGE2YjdjOThhZmRjYShkcm0vbWVkaWF0ZWs6IGFkZCBtdGtfZGl0aGVyX3Nl
dF9jb21tb24oKSkKPiBTaWduZWQtb2ZmLWJ5OiBZb25ncWlhbmcgTml1IDx5b25ncWlhbmcubml1
QG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1f
ZGRwX2NvbXAuYyB8IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+Cj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jCj4gaW5kZXggOTlj
YmY0NC4uN2RkOGUwNSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RybV9kZHBfY29tcC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1f
ZGRwX2NvbXAuYwo+IEBAIC0yNiw2ICsyNiw3IEBACj4gICNkZWZpbmUgRElTUF9PRF9DRkcgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgMHgwMDIwCj4gICNkZWZpbmUgRElTUF9PRF9TSVpFICAg
ICAgICAgICAgICAgICAgICAgICAgICAgMHgwMDMwCj4gICNkZWZpbmUgRElTUF9ESVRIRVJfNSAg
ICAgICAgICAgICAgICAgICAgICAgICAgMHgwMTE0Cj4gKyNkZWZpbmUgRElTUF9ESVRIRVJfNiAg
ICAgICAgICAgICAgICAgICAgICAgICAgMHgwMTE4Cj4gICNkZWZpbmUgRElTUF9ESVRIRVJfNyAg
ICAgICAgICAgICAgICAgICAgICAgICAgMHgwMTFjCj4gICNkZWZpbmUgRElTUF9ESVRIRVJfMTUg
ICAgICAgICAgICAgICAgICAgICAgICAgMHgwMTNjCj4gICNkZWZpbmUgRElTUF9ESVRIRVJfMTYg
ICAgICAgICAgICAgICAgICAgICAgICAgMHgwMTQwCj4gQEAgLTEzNSw2ICsxMzYsNyBAQCB2b2lk
IG10a19kaXRoZXJfc2V0X2NvbW1vbih2b2lkIF9faW9tZW0gKnJlZ3MsIHN0cnVjdCBjbWRxX2Ns
aWVudF9yZWcgKmNtZHFfcmVnLAo+Cj4gICAgICAgICBpZiAoYnBjID49IE1US19NSU5fQlBDKSB7
Cj4gICAgICAgICAgICAgICAgIG10a19kZHBfd3JpdGUoY21kcV9wa3QsIDAsIGNtZHFfcmVnLCBy
ZWdzLCBESVNQX0RJVEhFUl81KTsKPiArICAgICAgICAgICAgICAgbXRrX2RkcF93cml0ZShjbWRx
X3BrdCwgMHgzMDAyLCBjbWRxX3JlZywgcmVncywgRElTUF9ESVRIRVJfNik7CgpTeW1ib2xpemVk
IDB4MzAwMi4gQklUKDEpIGlzIGxmc3JfZW4uCgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKPiAgICAg
ICAgICAgICAgICAgbXRrX2RkcF93cml0ZShjbWRxX3BrdCwgMCwgY21kcV9yZWcsIHJlZ3MsIERJ
U1BfRElUSEVSXzcpOwo+ICAgICAgICAgICAgICAgICBtdGtfZGRwX3dyaXRlKGNtZHFfcGt0LAo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIERJVEhFUl9MU0JfRVJSX1NISUZUX1IoTVRL
X01BWF9CUEMgLSBicGMpIHwKPiAtLQo+IDEuOC4xLjEuZGlydHkKPgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBs
aXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
