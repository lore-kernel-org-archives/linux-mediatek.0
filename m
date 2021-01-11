Return-Path: <SRS0=02OB=GO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49A7BC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 23:46:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAB6222BED
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 23:46:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAB6222BED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1dvpftKqyf4ncRO4cd/mPP/yWRq05PG/mj7muXOQpMw=; b=0AYEJZZgexORSOBbCJU2PfyaA
	wZ4po3a+4gaz+Gx1TGP/MCVUDX2vCy+HZrsctwjLpamFeZa/k+aAXSh1uOhAY6gSwDmC8Q+tkOKep
	13ccC82r+zM4Z0DQ1JwsTfpjY0nG+BJf0w+kYE5LURvY0P8aK7nwB1XNT15N6twdJ1hQrDbFmJW4f
	rERva3RxkWeCSRytktKtEzq6+rX9p2NKZT6rwL6OmHDexQvh1CIc6buq/NXBQKYY7NG7UPwMCfLq3
	QlJufevr+g8kuoHInTij/THCwPobONeQ8fj8BRHPLtd6jHYc+BWgh02nAOetixkpYN03UkGT5+TSM
	g1vzbkVtQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kz6sf-0002Vi-FN; Mon, 11 Jan 2021 23:45:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kz6sQ-0002Od-UF; Mon, 11 Jan 2021 23:45:36 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5549322BED;
 Mon, 11 Jan 2021 23:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610408733;
 bh=y8VmMFX/CwJMC+FISkp4wyPeCZWTR2wk4gtw3cMWOuI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WMtQVsJHQtrQ2effqQyf1fLeyeLjCq1nK7PvIMKXYaQluEcq7X3sGbjVrp5vG7EaD
 9fpoV5B8h38pUpAFkvCaABVvO9jHkdqiN5RQPS7z63pu9JYHBdbOW70BxquKK11DIj
 7+QJFBw0fMJlbrRSBPf+O5CC4wHpWtkwpKUuGPVuJ/Ta1Ck/UxPZDVSO24iNLK2WP1
 taJR/FPmkFAVmMDjzhwgfTY0b5LwV+zvLZCfnl5DKIW/tqT09Bf03WLWNMjknWqouP
 U4z02X8naqdB5OEp5xuqHm4JB81jva5BLyPRUkV4xbVvT79cwkMovDGakQLbxvUQKR
 lPcBV7fe5eRHA==
Received: by mail-ej1-f49.google.com with SMTP id b9so922464ejy.0;
 Mon, 11 Jan 2021 15:45:33 -0800 (PST)
X-Gm-Message-State: AOAM533wUbu78qwW6aGkmokTkm6wYHAhqibCFg8iH16j1Tyl/B89mRvp
 p8xqI0h07TgSiCO/Hmoi22yaQ56g41gvR4iB9g==
X-Google-Smtp-Source: ABdhPJxCQ7+JqQlCXU4rJnwOHfKTlzTErG573sDackMZHFooxXdVlewp+enT7XUtpEahPvCk4yRAUbKpSdQbplQxJyQ=
X-Received: by 2002:a17:907:d8b:: with SMTP id
 go11mr1213697ejc.303.1610408731872; 
 Mon, 11 Jan 2021 15:45:31 -0800 (PST)
MIME-Version: 1.0
References: <1610351031-21133-1-git-send-email-yongqiang.niu@mediatek.com>
 <1610351031-21133-5-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1610351031-21133-5-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 12 Jan 2021 07:45:21 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9LkCs5qsCCBtekr2jqKovZVsC471a4DA_RQ3PRRn4U3w@mail.gmail.com>
Message-ID: <CAAOTY_9LkCs5qsCCBtekr2jqKovZVsC471a4DA_RQ3PRRn4U3w@mail.gmail.com>
Subject: Re: [PATCH v3, 04/15] drm/mediatek: add component OVL_2L2
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_184535_104065_3E9E8FE9 
X-CRM114-Status: GOOD (  17.57  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Hsin-Yi Wang <hsinyi@chromium.org>,
 CK Hu <ck.hu@mediatek.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMeW5tDHmnIgxMeaXpSDpgLHkuIAg5LiL5Y2IMzo0NOWvq+mBk++8mgo+Cj4gVGhp
cyBwYXRjaCBhZGQgY29tcG9uZW50IE9WTF8yTDIKClJldmlld2VkLWJ5OiBDaHVuLUt1YW5nIEh1
IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBZb25ncWlhbmcg
Tml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYyB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RybV9kZHBfY29tcC5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2Nv
bXAuYwo+IGluZGV4IDgxZWQwNzYuLmE3MTUxMjcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMKPiBAQCAtMzgzLDYgKzM4Myw3IEBAIHN0cnVjdCBt
dGtfZGRwX2NvbXBfbWF0Y2ggewo+ICAgICAgICAgW0REUF9DT01QT05FTlRfT1ZMMV0gICAgPSB7
IE1US19ESVNQX09WTCwgICAgICAgMSwgTlVMTCB9LAo+ICAgICAgICAgW0REUF9DT01QT05FTlRf
T1ZMXzJMMF0gPSB7IE1US19ESVNQX09WTF8yTCwgICAgMCwgTlVMTCB9LAo+ICAgICAgICAgW0RE
UF9DT01QT05FTlRfT1ZMXzJMMV0gPSB7IE1US19ESVNQX09WTF8yTCwgICAgMSwgTlVMTCB9LAo+
ICsgICAgICAgW0REUF9DT01QT05FTlRfT1ZMXzJMMl0gPSB7IE1US19ESVNQX09WTF8yTCwgICAg
MiwgTlVMTCB9LAo+ICAgICAgICAgW0REUF9DT01QT05FTlRfUFdNMF0gICAgPSB7IE1US19ESVNQ
X1BXTSwgICAgICAgMCwgTlVMTCB9LAo+ICAgICAgICAgW0REUF9DT01QT05FTlRfUFdNMV0gICAg
PSB7IE1US19ESVNQX1BXTSwgICAgICAgMSwgTlVMTCB9LAo+ICAgICAgICAgW0REUF9DT01QT05F
TlRfUFdNMl0gICAgPSB7IE1US19ESVNQX1BXTSwgICAgICAgMiwgTlVMTCB9LAo+IC0tCj4gMS44
LjEuMS5kaXJ0eQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Cj4gTGludXgtbWVkaWF0ZWtAbGlzdHMu
aW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbWVkaWF0ZWsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbWVkaWF0ZWsK
