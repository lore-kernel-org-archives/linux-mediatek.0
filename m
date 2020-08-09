Return-Path: <SRS0=12Pn=BT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A457DC433DF
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Aug 2020 00:35:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 708FE206B5
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Aug 2020 00:35:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SVS1EB1B";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZhdXHSbG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 708FE206B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ps9enpuNdV+w2b1ZbHpdm4Ax3upI0mY3fVig3DMlYnE=; b=SVS1EB1BFswLeeHEL/8VjgUSb
	8LtH0SHc7qJ9groqxjAYQ+FKPzmemJO1QTFuGgwzI88Xy3Oc+2X5YpUMrkOXl/QtiywOasTArWjGe
	3J5xFSRcHXHmfdfEQxVvqQonIn7n81mF+LmvOyfS8RfThK8oa5GqAf09V6plgvWThSo/xT//9WHYS
	RRojqQsZxvDMNyp5ub0+EghGMdeyfSKNVohhrBu2/4cDAKkkxp6Eksa28/7Iwfc9MSE8SbdJGqdWJ
	OTO3X1kk8v2qBVYoC3aewFskmy1kxIgFbkI65rH9V+2Z+H7iDHClsgfBWiBqcetoq8rx+wQWJbnhJ
	pCSIwzszw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k4ZJJ-0005zo-PV; Sun, 09 Aug 2020 00:35:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k4ZJG-0005z2-3V; Sun, 09 Aug 2020 00:35:35 +0000
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ED37B206C3;
 Sun,  9 Aug 2020 00:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596933333;
 bh=coQD0wBPaBdDQivRZlkVTAL9bKjxlMoqwYidiCYobu8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZhdXHSbGknQR+b+3YLI9YqMjsJmJW+yYdR4b9uOVrGZRu+SOjPpI4W6MI+qb4zD1G
 gQCWZk7GJOgQQakgyUQUaM48Ej8u9z1HE0O4IHBQDQqlhWYb/hADg8auRSzisTMMQe
 pg7hsgKz1+jnLfV6QaWpVMMtJuJb+6xgSPjrKjkg=
Received: by mail-ed1-f52.google.com with SMTP id a14so3894964edx.7;
 Sat, 08 Aug 2020 17:35:32 -0700 (PDT)
X-Gm-Message-State: AOAM532PIt0qCWOE2xJiHC9N/ACg7GfV5ZUIg5wdZV2yaYqJWS3Ym+je
 zKrhoB9cApjKPZklSu+FsFT2mQf82gmfnN02oQ==
X-Google-Smtp-Source: ABdhPJxZvcW8PgfFlsq/+msJNbIn+ca0CblF0488HSrYloUzKvPr/KfxkqW6W3mw1LCCbvI377JkyUuaVPVehXXvAnA=
X-Received: by 2002:a05:6402:2037:: with SMTP id
 ay23mr14822310edb.48.1596933331512; 
 Sat, 08 Aug 2020 17:35:31 -0700 (PDT)
MIME-Version: 1.0
References: <1596855231-5782-1-git-send-email-yongqiang.niu@mediatek.com>
 <1596855231-5782-7-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1596855231-5782-7-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 9 Aug 2020 08:35:20 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8B0xC5QspmLS0NNTD5fG1V+OY6hNU9F4+qcqHFdQtCWw@mail.gmail.com>
Message-ID: <CAAOTY_8B0xC5QspmLS0NNTD5fG1V+OY6hNU9F4+qcqHFdQtCWw@mail.gmail.com>
Subject: Re: [RESEND v7,
 PATCH 6/7] drm/mediatek: add support for mediatek SOC MT8183
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200808_203534_406885_6B014BAE 
X-CRM114-Status: GOOD (  15.29  )
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
PiDmlrwgMjAyMOW5tDjmnIg45pelIOmAseWFrSDkuIrljYgxMTowNeWvq+mBk++8mgo+Cj4gVGhp
cyBwYXRjaCBhZGQgc3VwcG9ydCBmb3IgbWVkaWF0ZWsgU09DIE1UODE4Mwo+IDEuIGFkZCBvdmwg
cHJpdmF0ZSBkYXRhCj4gMi4gYWRkIHJkbWEgcHJpdmF0ZSBkYXRhCj4gMy4gYWRkIG11dGVzIHBy
aXZhdGUgZGF0YQo+IDQuIGFkZCBtYWluIGFuZCBleHRlcm5hbCBwYXRoIG1vZHVsZSBmb3IgY3J0
YyBjcmVhdGUKPgo+IFNpZ25lZC1vZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVA
bWVkaWF0ZWsuY29tPgoKW3NuaXBdCgo+ICsKPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZp
Y2VfaWQgbXRrX2Rpc3Bfb3ZsX2RyaXZlcl9kdF9tYXRjaFtdID0gewo+ICAgICAgICAgeyAuY29t
cGF0aWJsZSA9ICJtZWRpYXRlayxtdDI3MDEtZGlzcC1vdmwiLAo+ICAgICAgICAgICAuZGF0YSA9
ICZtdDI3MDFfb3ZsX2RyaXZlcl9kYXRhfSwKPiAgICAgICAgIHsgLmNvbXBhdGlibGUgPSAibWVk
aWF0ZWssbXQ4MTczLWRpc3Atb3ZsIiwKPiAgICAgICAgICAgLmRhdGEgPSAmbXQ4MTczX292bF9k
cml2ZXJfZGF0YX0sCj4gKyAgICAgICB7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE4My1k
aXNwLW92bCIsCgoibWVkaWF0ZWssbXQ4MTgzLWRpc3Atb3ZsIiBpcyBub3QgZGVmaW5lZCBpbiBi
aW5kaW5nIGRvY3VtZW50IFsxXQoKWzFdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRpc3AudHh0P2g9djUu
OAoKPiArICAgICAgICAgLmRhdGEgPSAmbXQ4MTgzX292bF9kcml2ZXJfZGF0YX0sCj4gKyAgICAg
ICB7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE4My1kaXNwLW92bC0ybCIsCgpEaXR0by4K
Cj4gKyAgICAgICAgIC5kYXRhID0gJm10ODE4M19vdmxfMmxfZHJpdmVyX2RhdGF9LAo+ICAgICAg
ICAge30sCj4gIH07Cgpbc25pcF0KCj4gKwo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rldmlj
ZV9pZCBtdGtfZGlzcF9yZG1hX2RyaXZlcl9kdF9tYXRjaFtdID0gewo+ICAgICAgICAgeyAuY29t
cGF0aWJsZSA9ICJtZWRpYXRlayxtdDI3MDEtZGlzcC1yZG1hIiwKPiAgICAgICAgICAgLmRhdGEg
PSAmbXQyNzAxX3JkbWFfZHJpdmVyX2RhdGF9LAo+ICAgICAgICAgeyAuY29tcGF0aWJsZSA9ICJt
ZWRpYXRlayxtdDgxNzMtZGlzcC1yZG1hIiwKPiAgICAgICAgICAgLmRhdGEgPSAmbXQ4MTczX3Jk
bWFfZHJpdmVyX2RhdGF9LAo+ICsgICAgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgx
ODMtZGlzcC1yZG1hIiwKCkRpdHRvLgoKPiArICAgICAgICAgLmRhdGEgPSAmbXQ4MTgzX3JkbWFf
ZHJpdmVyX2RhdGF9LAo+ICAgICAgICAge30sCj4gIH07Cj4gIE1PRFVMRV9ERVZJQ0VfVEFCTEUo
b2YsIG10a19kaXNwX3JkbWFfZHJpdmVyX2R0X21hdGNoKTsKCltzbmlwXQoKPiArCj4gIHN0cnVj
dCBtdGtfZGlzcF9tdXRleCAqbXRrX2Rpc3BfbXV0ZXhfZ2V0KHN0cnVjdCBkZXZpY2UgKmRldiwg
dW5zaWduZWQgaW50IGlkKQo+ICB7Cj4gICAgICAgICBzdHJ1Y3QgbXRrX2RkcCAqZGRwID0gZGV2
X2dldF9kcnZkYXRhKGRldik7Cj4gQEAgLTQwMiw2ICs0NDcsOCBAQCBzdGF0aWMgaW50IG10a19k
ZHBfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gICAgICAgICAgIC5kYXRh
ID0gJm10MjcxMl9kZHBfZHJpdmVyX2RhdGF9LAo+ICAgICAgICAgeyAuY29tcGF0aWJsZSA9ICJt
ZWRpYXRlayxtdDgxNzMtZGlzcC1tdXRleCIsCj4gICAgICAgICAgIC5kYXRhID0gJm10ODE3M19k
ZHBfZHJpdmVyX2RhdGF9LAo+ICsgICAgICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgx
ODMtZGlzcC1tdXRleCIsCgpEaXR0by4KClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+ICsgICAgICAg
ICAuZGF0YSA9ICZtdDgxODNfZGRwX2RyaXZlcl9kYXRhfSwKPiAgICAgICAgIHt9LAo+ICB9Owo+
ICBNT0RVTEVfREVWSUNFX1RBQkxFKG9mLCBkZHBfZHJpdmVyX2R0X21hdGNoKTsKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1h
aWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
