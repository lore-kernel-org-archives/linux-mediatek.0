Return-Path: <SRS0=j7dB=GK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9B6AC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 10:29:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 696E223333
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 10:29:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 696E223333
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=abYd15VTRiPHFsCOhqD28b0g2F2fmUFWb2JklpSRROw=; b=QpSPRrsgaKPhpHbbCOBfQjZKW
	L4kcTd81nsrCMZJHtiok7fSux4LaSTHCTnATrNQ7zkp+koB9IPKdVvv2BJ8x7m8NCoFyLuBWbaOsw
	l4C9JPTXZjfbDDRCoBpyR3x1Qde16jqV0JS7zAGvH03rVZtSOWxiiiM+UY2rRlp5yZwlQs3ZGiLbu
	i3JbtKYuLrd2G4rErWjnGXOzQ9I7Gu/gXrhciAUzLplF9px/IHIse0elHiN4chipZlGWT04zgSyHW
	vzsZF9M+GoQKXoJOf4CaO2/TcUuFire57OGUyx5cGkJKsC0eFL9v406xyG/Ms55Ne6+r1z6TjhMCS
	aNykORAhw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxSXx-0002Yn-8S; Thu, 07 Jan 2021 10:29:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxSXq-0002WJ-U3; Thu, 07 Jan 2021 10:29:32 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C398E23356;
 Thu,  7 Jan 2021 10:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610015370;
 bh=13M5zIZH8BYdSgLHcSiUssuxy7aGnL0zsfUTM4vT+Pc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=PhzyKeH/omMWDkne6YDBSmYzC952k4TKrqQ+OcU3RWV226x+kfHocirL+sOZ1Ec1I
 L6FYpSbXcq2asi3sfqgBi0QnTs03QoC98IdxSzGWTO41n/JYWqaq0o4k86z7HrC8Ie
 ilPmplMJtIaIQ3XygqQIoEY2Hyr24EGZ914HsqxKeELf1D8HedliDW2sGcd4JtwV2f
 vhoiv7NnQ9Sr4DIB5ghdCSrOkw132MTxao0h77BnA1+creB8OzggJAtOWa+zzsJxlD
 YyErySULnK2ZXXY8Pl9n4joMIK9fxLbho21bcscMsaf3/9mZzdDdy0IOYt5tLzvHwp
 9lKjVFeYW7w2w==
Received: by mail-ej1-f45.google.com with SMTP id q22so9050522eja.2;
 Thu, 07 Jan 2021 02:29:29 -0800 (PST)
X-Gm-Message-State: AOAM532ixgGpmTTQtDmQtKv18l90blFEwUbh1uTmrJrOrIeX2xmhIO2B
 Jb2z9OwgUE3cX/COjvi1Vxjvmf2FX6yW25191Q==
X-Google-Smtp-Source: ABdhPJz05+dsxcv5R7wZF5woSln0ppvl0ASJjVM3ts6esC2GEruDIYNAngku7nUd4kbjmo3tFkzNSYPUlVOCGP5KdM4=
X-Received: by 2002:a17:907:9627:: with SMTP id
 gb39mr5843470ejc.267.1610015368212; 
 Thu, 07 Jan 2021 02:29:28 -0800 (PST)
MIME-Version: 1.0
References: <1609989081-29353-1-git-send-email-yongqiang.niu@mediatek.com>
 <1609989081-29353-9-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1609989081-29353-9-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 7 Jan 2021 18:29:16 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8Gvk_tR-omr0ObbdB68kvjXR9rcri_ADSHvhGeFdOiHA@mail.gmail.com>
Message-ID: <CAAOTY_8Gvk_tR-omr0ObbdB68kvjXR9rcri_ADSHvhGeFdOiHA@mail.gmail.com>
Subject: Re: [PATCH v9,
 08/11] drm/mediatek: add has_dither private data for gamma
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_052931_213819_8EC22673 
X-CRM114-Status: GOOD (  18.51  )
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
PiDmlrwgMjAyMeW5tDHmnIg35pelIOmAseWbmyDkuIrljYgxMToxMuWvq+mBk++8mgo+Cj4gbm90
IGFsbCBTb0MgaGFzIGRpdGhlciBmdW5jdGlvbiBpbiBnYW1tYSBtb2R1bGUKPiBkZCBwcml2YXRl
IGRhdGEgdG8gY29udHJvbCB0aGlzIGZ1bmN0aW9uIHNldHRpbmcKCidhZGQnID8KCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBZb25ncWlhbmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4KPiAt
LS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX2dhbW1hLmMgfCAxMiArKysr
KysrKystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMo
LSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfZ2Ft
bWEuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9nYW1tYS5jCj4gaW5kZXgg
ODUwMTgyMS4uNGVhYjgyYSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2Rpc3BfZ2FtbWEuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlz
cF9nYW1tYS5jCj4gQEAgLTI0LDcgKzI0LDcgQEAKPiAgI2RlZmluZSBMVVRfMTBCSVRfTUFTSyAg
ICAgICAgICAgICAgICAgICAgICAgICAweDAzZmYKPgo+ICBzdHJ1Y3QgbXRrX2Rpc3BfZ2FtbWFf
ZGF0YSB7Cj4gLSAgICAgICB1MzIgcmVzZXJ2ZWQ7Cj4gKyAgICAgICBib29sIGhhc19kaXRoZXI7
Cj4gIH07Cj4KPiAgLyoqCj4gQEAgLTcyLDcgKzcyLDggQEAgc3RhdGljIHZvaWQgbXRrX2dhbW1h
X2NvbmZpZyhzdHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wLCB1bnNpZ25lZCBpbnQgdywKPgo+ICAg
ICAgICAgbXRrX2RkcF93cml0ZShjbWRxX3BrdCwgaCA8PCAxNiB8IHcsIGNvbXAsIERJU1BfR0FN
TUFfU0laRSk7Cj4KPiAtICAgICAgIG10a19kaXRoZXJfc2V0KGNvbXAsIGJwYywgRElTUF9HQU1N
QV9DRkcsIGNtZHFfcGt0KTsKPiArICAgICAgIGlmIChnYW1tYS0+ZGF0YSAmJiBnYW1tYS0+ZGF0
YS0+aGFzX2RpdGhlcikKPiArICAgICAgICAgICAgICAgbXRrX2RpdGhlcl9zZXQoY29tcCwgYnBj
LCBESVNQX0dBTU1BX0NGRywgY21kcV9wa3QpOwo+ICB9Cj4KPiAgc3RhdGljIHZvaWQgbXRrX2dh
bW1hX3N0YXJ0KHN0cnVjdCBtdGtfZGRwX2NvbXAgKmNvbXApCj4gQEAgLTE2OCw4ICsxNjksMTMg
QEAgc3RhdGljIGludCBtdGtfZGlzcF9nYW1tYV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikKPiAgICAgICAgIHJldHVybiAwOwo+ICB9Cj4KPiArc3RhdGljIGNvbnN0IHN0cnVj
dCBtdGtfZGlzcF9nYW1tYV9kYXRhIG10ODE3M19nYW1tYV9kcml2ZXJfZGF0YSA9IHsKPiArICAg
ICAgIC5oYXNfZGl0aGVyID0gdHJ1ZSwKPiArfTsKPiArCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
b2ZfZGV2aWNlX2lkIG10a19kaXNwX2dhbW1hX2RyaXZlcl9kdF9tYXRjaFtdID0gewo+IC0gICAg
ICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxNzMtZGlzcC1nYW1tYSJ9LAo+ICsgICAg
ICAgeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxNzMtZGlzcC1nYW1tYSIsCj4gKyAgICAg
ICAgIC5kYXRhID0gJm10ODE3M19nYW1tYV9kcml2ZXJfZGF0YX0sCj4gICAgICAgICB7fSwKPiAg
fTsKPiAgTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgbXRrX2Rpc3BfZ2FtbWFfZHJpdmVyX2R0X21h
dGNoKTsKPiAtLQo+IDEuOC4xLjEuZGlydHkKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+IExpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdAo+IExpbnV4
LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGlu
dXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
