Return-Path: <SRS0=EHBe=FS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DE18C2BBCA
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Dec 2020 23:40:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9C3D22510
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Dec 2020 23:40:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9C3D22510
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=S/k6vmnL3+T+CqrsZiSixJ9rTmfcEP+FOg4tGSZa0X8=; b=OLstk8Gh47M9pv/M9xaCV6hPn
	akRHXPRpbwhcnaTaEr0NYrC8s1GTaoXaKZgQQdCkmMEY2Ke32MXLNGbQr8fi1LrWQHQk26gd27rJt
	INiGk/fr6dWJI88nsC6gFk0Y8CTBwqkGaey1k8x7d669xCUvO2CYs99uF7D0XX+fVz9hkPDMUTyi2
	9ymcs/lJ61sf6cNkOvmMimHhb3nIRhF3nFGr+GS6WM5DYKUCa1y1esR49jo7Zz1OKtEhqAYpH/eSO
	kkZtYPQbwLcMi5mZmRnLrttW0g/xbuGx4TGW02/7OIv/8jsm92GEIs/6TE2E8vvdNI61RjnyPonxR
	UKQ213cuA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1koxSH-00068m-Sw; Mon, 14 Dec 2020 23:40:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1koxSD-00067T-A7; Mon, 14 Dec 2020 23:40:34 +0000
X-Gm-Message-State: AOAM5327iOi3tuCv1FrCXW95MB9a9kVELYVGZ+86k/MYe4Z1XW0CriNH
 PW5apXFpuP20cxVqVXMWl5Q1fL5SVN8uK9CsiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607989232;
 bh=lSvX6jnFQqoxIpPBccW/7g9EJN/cgkuyf1nA2W1wiv8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=XSQOCR9KRlZI2AHdmt/ukZlEy89IoEm17SJs3lOD0fZiwwAd43Q1ReNJNrxkWj9gr
 8wXhz/am3uKMBcRbdr1lrKQ/1Zf+pLtwkh8TwbLCW8U6op3W87xpjiNg1yyvDCUit2
 TkxSp0wuaQE8Vq8OXCpT/74qRGMrMr8MsDwD3I5px5wT5ncNdVZQDmMHzzIuGPBB/p
 Gsw50I6FiXK/PC9gLUdx0JugG/usVDEiEnYyZQyK3OVJyaYjgq1rP0cmthpnJb+zLf
 tkzZIrMU6U9JLjKuKBK/ptdlAuYRnqx6XwrPMJJDlXbS8WInT9vAYTOCXh8FSM7X5q
 rfNwqP9PsJxFg==
X-Google-Smtp-Source: ABdhPJyMR1hWv0NrAVLxlYf3urPvZsTPggqomRIMAVMLDR99rCR51PGzTsrrsSQzNCxZ8SbUppoaI6FehtXfPLhv9Uw=
X-Received: by 2002:a05:6402:845:: with SMTP id b5mr44289edz.38.1607989230343; 
 Mon, 14 Dec 2020 15:40:30 -0800 (PST)
MIME-Version: 1.0
References: <1607746317-4696-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607746317-4696-13-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1607746317-4696-13-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 15 Dec 2020 07:40:19 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9gzncFEFe8uyhNSO0Mr9SnQ0b5oCC31_4QSdMtwOx0Mw@mail.gmail.com>
Message-ID: <CAAOTY_9gzncFEFe8uyhNSO0Mr9SnQ0b5oCC31_4QSdMtwOx0Mw@mail.gmail.com>
Subject: Re: [PATCH v2, 12/17] drm/mediatek: fix gamma size config
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201214_184033_450783_19447E79 
X-CRM114-Status: GOOD (  17.09  )
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
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMOW5tDEy5pyIMTLml6Ug6YCx5YWtIOS4i+WNiDEyOjEz5a+r6YGT77yaCj4KPiBm
aXggZ2FtbWEgc2l6ZSBjb25maWcKCkkgd291bGQgbGlrZSB5b3UgdG8gcHJvdmlkZSBtb3JlIGlu
Zm9ybWF0aW9uLiBUaGUgb3JpZ2luYWwgY29kZSB3b3JrcwppbiBtdDgxNzMsIHdoeSBkbyB5b3Ug
bW9kaWZ5IHRoaXM/IFRoZSBkZXNjcmlwdGlvbiBtYXkgYmUgc29tZXRoaW5nCmxpa2UgdGhpczoK
CkFjY29yZGluZyB0byBkYXRhIHNoZWV0LCB0aGUgd2lkdGggaXMgaW4gYml0cyBbMzEsIDE2XSBh
bmQgaGVpZ2h0IGlzCmluIGJpdHMgWzE1LCAwXS4gRXZlbiB0aG91Z2ggd3Jvbmcgc2V0dGluZyBt
YXkgd29ya3MgaW4gc29tZSBTb0Mgc3VjaAphcyBtdDgxNzMsIGJ1dCBpdCBkb2VzIG5vdCB3b3Jr
IGluIG10ODE5Mi4KClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+Cj4gRml4ZXM6IGUwYTVkMzM3MDI0
NSAoZHJtL21lZGlhdGVrOiBBZGQgR0FNTUEgZW5naW5lIGJhc2ljIGZ1bmN0aW9uKQo+IFNpZ25l
ZC1vZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPgo+IC0t
LQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jIHwgMiArLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jIGIvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYwo+IGluZGV4IDAwZDU2ODcu
LjUyYjZmYzcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1f
ZGRwX2NvbXAuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9j
b21wLmMKPiBAQCAtMjk3LDcgKzI5Nyw3IEBAIHN0YXRpYyB2b2lkIG10a19nYW1tYV9jb25maWco
c3RydWN0IG10a19kZHBfY29tcCAqY29tcCwgdW5zaWduZWQgaW50IHcsCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgaCwgdW5zaWduZWQgaW50IHZyZWZyZXNoLAo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGJwYywgc3RydWN0IGNt
ZHFfcGt0ICpjbWRxX3BrdCkKPiAgewo+IC0gICAgICAgbXRrX2RkcF93cml0ZShjbWRxX3BrdCwg
aCA8PCAxNiB8IHcsIGNvbXAsIERJU1BfR0FNTUFfU0laRSk7Cj4gKyAgICAgICBtdGtfZGRwX3dy
aXRlKGNtZHFfcGt0LCB3IDw8IDE2IHwgaCwgY29tcCwgRElTUF9HQU1NQV9TSVpFKTsKPiAgICAg
ICAgIG10a19kaXRoZXJfc2V0KGNvbXAsIGJwYywgRElTUF9HQU1NQV9DRkcsIGNtZHFfcGt0KTsK
PiAgfQo+Cj4gLS0KPiAxLjguMS4xLmRpcnR5Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKPiBMaW51
eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Ckxp
bnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
