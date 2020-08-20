Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 932DEC433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 23:45:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6461F2072D
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 23:45:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iBIljlO1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="jZnXbZvd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6461F2072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=a+aLDDUsmGftOAeOk2270woV/3aGgzEU/OyuLjtow0w=; b=iBIljlO1BlwLEiVUNk5u/uW6j
	52IMRmUIkX4tzPYd4ZorkbV2F7s2MPDtj8iDAISR3yosTeSQhFmFzpBqlbTncVdfjNGjP9xHzIEKH
	9ZGxS8sRJFhiXmevdlAee82jcGlx8MKiw7D/P4kVvjLNwA8gQ50SG94WM1MFH3LZVMV7TYW1QaMDU
	lgRuhrNpIA2XbtyXwh4aRfAnIZNd6iEASjCjmJjHe7blo2T/5k4W9dSP2SxQY33q6aY5/0ZCfW8M8
	IBUwqLqxh5cr9F3nDEa5F7z7K2SmemRWq2PnPWGRAGknXG9UkNNtq1hl96iWA5W10vX+BgamJ42vt
	iWFc01m9g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8uEu-0004nL-R5; Thu, 20 Aug 2020 23:45:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8uEp-0004kY-0q; Thu, 20 Aug 2020 23:44:55 +0000
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0257021734;
 Thu, 20 Aug 2020 23:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597967094;
 bh=OrvMhzElo/BOA9sucY6YNBL0y8bC8eI2i5C7W2muAhY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=jZnXbZvd6r/RDmhRl8Pd5bDqWjtnOLOVXZheUhdWXNR8JZL8+j8DXWO/rfJUaVM7s
 /aoaV762OQv+WFcuD4lrNZquWhQrGZiaGbYEq0edwA/JnZ6oCShF0kGqpoBWarODnk
 T0eURcudahnEMu2tSEyme9KyN5dYpoIqloRcKgaU=
Received: by mail-ej1-f54.google.com with SMTP id d6so246794ejr.5;
 Thu, 20 Aug 2020 16:44:53 -0700 (PDT)
X-Gm-Message-State: AOAM531Rz2ngWvdNFX8GMepcL/o06FmNWqDoPdzotnOiKRxPqccNL0iZ
 cHaWK4Lbuar5wAr3XiZAZB6r0vYmMM7xtvofUA==
X-Google-Smtp-Source: ABdhPJyfF0seo8n875amt4dn9oSi2w9SsfnbMsQlnhtKaOBwUNOQeGo3OezMKFROAQyoW2OBGtjzdsNfwx1Y6KwE1IM=
X-Received: by 2002:a17:906:3a41:: with SMTP id
 a1mr337598ejf.260.1597967092612; 
 Thu, 20 Aug 2020 16:44:52 -0700 (PDT)
MIME-Version: 1.0
References: <1597903458-8055-1-git-send-email-yongqiang.niu@mediatek.com>
 <1597903458-8055-9-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1597903458-8055-9-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 21 Aug 2020 07:44:40 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9Xt8=tQByDAZwuu_TT9bta1UtLak58uNKb2YM9XtG8DA@mail.gmail.com>
Message-ID: <CAAOTY_9Xt8=tQByDAZwuu_TT9bta1UtLak58uNKb2YM9XtG8DA@mail.gmail.com>
Subject: Re: [PATCH v1 08/21] drm/mediatek: check if fb is null
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_194455_156154_CCEB1F79 
X-CRM114-Status: GOOD (  20.51  )
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
PiDmlrwgMjAyMOW5tDjmnIgyMOaXpSDpgLHlm5sg5LiL5Y2IMjowNuWvq+mBk++8mgo+Cj4gSXQn
cyBwb3NzaWJsZSB0aGF0IHN0YXRlLT5iYXNlLmZiIGlzIG51bGwuIEFkZCBhIGNoZWNrIGJlZm9y
ZSBhY2Nlc3MgaXRzCj4gZm9ybWF0LgoKQWRkIGEgRml4ZXMgdGFnLgoKUmVnYXJkcywKQ2h1bi1L
dWFuZy4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBZb25ncWlhbmcgTml1IDx5b25ncWlhbmcubml1QG1l
ZGlhdGVrLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292
bC5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3Zs
LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMKPiBpbmRleCA0Mjdm
ZTdmLi4yNTA2ODAzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZGlzcF9vdmwuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwu
Ywo+IEBAIC0yNjksNyArMjY5LDcgQEAgc3RhdGljIHZvaWQgbXRrX292bF9sYXllcl9jb25maWco
c3RydWN0IG10a19kZHBfY29tcCAqY29tcCwgdW5zaWduZWQgaW50IGlkeCwKPiAgICAgICAgIH0K
Pgo+ICAgICAgICAgY29uID0gb3ZsX2ZtdF9jb252ZXJ0KG92bCwgZm10KTsKPiAtICAgICAgIGlm
IChzdGF0ZS0+YmFzZS5mYi0+Zm9ybWF0LT5oYXNfYWxwaGEpCj4gKyAgICAgICBpZiAoc3RhdGUt
PmJhc2UuZmIgJiYgc3RhdGUtPmJhc2UuZmItPmZvcm1hdC0+aGFzX2FscGhhKQo+ICAgICAgICAg
ICAgICAgICBjb24gfD0gT1ZMX0NPTl9BRU4gfCBPVkxfQ09OX0FMUEhBOwo+Cj4gICAgICAgICBp
ZiAocGVuZGluZy0+cm90YXRpb24gJiBEUk1fTU9ERV9SRUZMRUNUX1kpIHsKPiAtLQo+IDEuOC4x
LjEuZGlydHkKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+IExpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdAo+IExpbnV4LW1lZGlhdGVrQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW1lZGlhdGVrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW1lZGlhdGVrCg==
