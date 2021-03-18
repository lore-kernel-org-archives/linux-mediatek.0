Return-Path: <SRS0=MDpP=IQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9182C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Mar 2021 14:15:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CBE464E01
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Mar 2021 14:15:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5CBE464E01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ud2IFX1kvWIsxFyhuSIu8ZnWQPRj51TjMagIBQPHwWw=; b=MFH6PVIvg93UsT1zR/EZAVqqT
	szQKjtpI66mb2ueoS/HGLZsMUiFHV298oLZSN6wRx25PDVnC2DrEhZuE6ZoKFAMjXiNOtgaUdJ8Sk
	vi0oZPpvcp08yBbRfA9AArflg8AbcJh8xDpb71tnNzIbW4NyFgPeqoCmTu6B18x+41xxQFEqC/I/x
	Mk4mCXwkJuQ63ZasZ27/xVnGntTkDA+mZuWWPRKnc0NkENAJMW4qSZdlB9+246M4xVy/kjgYadm7r
	DH9oBur8dED8+xuKQDo9MHlXAcwER3PdK6fjil3aFIxHDFKsSj+zcsjLUAWEO8E/iDicLUGzPp7Nt
	9kQLsrI7g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMtQV-005SXc-JG; Thu, 18 Mar 2021 14:15:03 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMtQP-005SVt-RY; Thu, 18 Mar 2021 14:15:00 +0000
Received: by mail-ot1-x32f.google.com with SMTP id
 t23-20020a0568301e37b02901b65ab30024so5315711otr.4; 
 Thu, 18 Mar 2021 07:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=whMoHbtKnfcby2pmtzf2mISpuDe1wTbNYLjDL6S2nWU=;
 b=qnl2CydrzMzC1UDRQdu6kUSjpCCCERB4VXU1TsW3mEZaC8xka3ipUQL6J1VTG4Pwqc
 RRujaoAFQU03tQFMkmvqldCSHZXv/qbKdUIr2OIVBAwK5GXkvNAX56DXdXaG4qWxbCZx
 etQd4aIdrdgBXruRaS6HSONWle+4MMBa5nTxYAOLgvAB8JyS6BIkT8agoFkL+EnV8nJA
 TyIWpFJZEfFqSDEj0q1KXWfQtBF/F1YebpfrYzjBovVWr2eMRu+EF8WoGBI1S41XL+up
 +6QhY62tVov/4oYqTf8g6b6C6WB8rRmXpi8NJ+mdJHINT0lGPpHfD5Po6xI82jzCDdY0
 t0TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=whMoHbtKnfcby2pmtzf2mISpuDe1wTbNYLjDL6S2nWU=;
 b=m4+N/JIjUdSM8iDgrKMQ6ApRJUoiYNKoryWfbkjbTceJwwCwKd2VE7QHUNJcE4Ht3a
 v+B6+I/jpgVnryM50oq7e5sZN4fJuSYorXNdoB35L7s1zKAcuKkDsIg+mXHfRBXNhCQ8
 AJR0hhKKiJ+BnxaI7kqX2q2tlBNlACn7ZSX2v+R2IeO2+a0BYd7wWhDBwFXNwRXYJZwx
 BdESWP7RD0Oc7djPtl9utgKfazzhVzA1eaZBiZIMYTza7UryNpMqI/BxISNr2XqLMfP6
 qSGV/TkvJtTG3b854YNw3QV++jj+TcgnG2+UTQN7035NoUNAafavzAsNn+PlBFCCbzOc
 7Vfg==
X-Gm-Message-State: AOAM5334silbS9OMG2hrGxhIUn9+i1iAHcikP6IX2wOUdty9CHRglQ3U
 M62n2uRAHUPWxHx0gGXXh656p2kkCJgE+73/ZOg=
X-Google-Smtp-Source: ABdhPJxTMcnggbeYkpD5TX+BjZlctL0gnQTf4UVoA3HsEiYZzWmnyeHJbxL7vl20IqOugt08qXLgSl5C2fQYL7yUt/E=
X-Received: by 2002:a9d:226a:: with SMTP id o97mr7736917ota.362.1616076896631; 
 Thu, 18 Mar 2021 07:14:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210312145545.26050-1-matthias.bgg@kernel.org>
 <20210312145545.26050-7-matthias.bgg@kernel.org>
In-Reply-To: <20210312145545.26050-7-matthias.bgg@kernel.org>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Thu, 18 Mar 2021 15:14:44 +0100
Message-ID: <CAFqH_52aDxqdK8=1iiUcGM-+CcyMmQoAKCUmozD7otoBHOvCcA@mail.gmail.com>
Subject: Re: [PATCH 7/7] arm64: dts: mt8173: Drop compatible for mt6397
To: matthias.bgg@kernel.org
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Matthias Brugger <mbrugger@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_141457_987574_4E68E5B6 
X-CRM114-Status: GOOD (  18.80  )
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

SGkgTWF0dGhpYXMsCgpUaGFuayB5b3UgZm9yIHlvdXIgcGF0Y2guCgpNaXNzYXRnZSBkZSBsJ2Fk
cmXDp2EgPG1hdHRoaWFzLmJnZ0BrZXJuZWwub3JnPiBkZWwgZGlhIGR2LiwgMTIgZGUgbWFyw6cK
MjAyMSBhIGxlcyAxNTo1NzoKPgo+IEZyb206IE1hdHRoaWFzIEJydWdnZXIgPG1icnVnZ2VyQHN1
c2UuY29tPgo+Cj4gVGhlIHJlZ3VsYXRvciBmcmFtZXdvcmsgZG9lcyBub3QgbmVlZCBjb21wYXRp
YmxlLCBpdCdzIGFjdHVhbGx5Cj4gc3VwZXJmbHVvdXMuIERyb3AgaXQgZnJvbSB0aGUgRFQuCj4K
PiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGlhcyBCcnVnZ2VyIDxtYnJ1Z2dlckBzdXNlLmNvbT4KPgo+
IFNlcmllcy10bzogbGVlLmpvbmVzQGxpbmFyby5vcmcKPiBTZXJpZXMtdG86IHJvYmgrZHRAa2Vy
bmVsLm9yZwo+IFNlcmllcy10bzogbWF0dGhpYXMuYmdnQGdtYWlsLmNvbQo+IFNlcmllcy10bzog
bGdpcmR3b29kQGdtYWlsLmNvbQo+IFNlcmllcy10bzogYnJvb25pZUBrZXJuZWwub3JnCj4gU2Vy
aWVzLWNjOiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZwo+IFNlcmllcy1jYzogbGludXgtYXJt
LWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gU2VyaWVzLWNjOiBsaW51eC1tZWRpYXRla0Bs
aXN0cy5pbmZyYWRlYWQub3JnCj4gU2VyaWVzLWNjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwu
b3JnCj4gLS0tCj4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTczLWVsbS5kdHNp
IHwgNCArLS0tCj4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTczLWV2Yi5kdHMg
IHwgNCArLS0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTcz
LWVsbS5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxNzMtZWxtLmR0c2kK
PiBpbmRleCAyMTQ1MmM1MWEyMGE4Li5kYjA2YTk4NmY3NjNlIDEwMDY0NAo+IC0tLSBhL2FyY2gv
YXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTczLWVsbS5kdHNpCj4gKysrIGIvYXJjaC9hcm02
NC9ib290L2R0cy9tZWRpYXRlay9tdDgxNzMtZWxtLmR0c2kKPiBAQCAtOTE2LDkgKzkxNiw3IEBA
IHBpbzYzOTc6IHBpbmN0cmwgewo+ICAgICAgICAgICAgICAgICAgICAgICAgICNncGlvLWNlbGxz
ID0gPDI+Owo+ICAgICAgICAgICAgICAgICB9Owo+Cj4gLSAgICAgICAgICAgICAgIHJlZ3VsYXRv
cjogbXQ2Mzk3cmVndWxhdG9yIHsKPiAtICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxl
ID0gIm1lZGlhdGVrLG10NjM5Ny1yZWd1bGF0b3IiOwo+IC0KPiArICAgICAgICAgICAgICAgbXQ2
Mzk3cmVndWxhdG9yIHsKClRoZSBzYW1lIGhhcHBlbnMgaGVyZSwgaXQgaXMgbm90IGNoZWNrZWQg
YmVjYXVzZSB0aGUgbXQ2Mzk3IGlzIG5vdCBpbgpZQU1MIGZvcm1hdCB5ZXQsIGJ1dCBvbmNlIHdl
IGRvIHRoaXMgaXQnbGwgdHJpZ2dlciBhbiBlcnJvciBhcyB0aGUKbm9kZSBuYW1lIHNob3VsZCBi
ZSAncmVndWxhdG9ycycKCgo+ICAgICAgICAgICAgICAgICAgICAgICAgIG10NjM5N192cGNhMTVf
cmVnOiBidWNrX3ZwY2ExNSB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZWd1
bGF0b3ItY29tcGF0aWJsZSA9ICJidWNrX3ZwY2ExNSI7Cj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICByZWd1bGF0b3ItbmFtZSA9ICJ2cGNhMTUiOwo+IGRpZmYgLS1naXQgYS9hcmNo
L2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODE3My1ldmIuZHRzIGIvYXJjaC9hcm02NC9ib290
L2R0cy9tZWRpYXRlay9tdDgxNzMtZXZiLmR0cwo+IGluZGV4IDZkZmZhZGEyZTY2YjQuLmMzZjJh
ODVkNTVmZTcgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgx
NzMtZXZiLmR0cwo+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTczLWV2
Yi5kdHMKPiBAQCAtMzAzLDkgKzMwMyw3IEBAIHBtaWM6IG10NjM5NyB7Cj4gICAgICAgICAgICAg
ICAgIGludGVycnVwdC1jb250cm9sbGVyOwo+ICAgICAgICAgICAgICAgICAjaW50ZXJydXB0LWNl
bGxzID0gPDI+Owo+Cj4gLSAgICAgICAgICAgICAgIG10NjM5N3JlZ3VsYXRvcjogbXQ2Mzk3cmVn
dWxhdG9yIHsKPiAtICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gIm1lZGlhdGVr
LG10NjM5Ny1yZWd1bGF0b3IiOwo+IC0KPiArICAgICAgICAgICAgICAgbXQ2Mzk3cmVndWxhdG9y
IHsKPiAgICAgICAgICAgICAgICAgICAgICAgICBtdDYzOTdfdnBjYTE1X3JlZzogYnVja192cGNh
MTUgewo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVndWxhdG9yLWNvbXBhdGli
bGUgPSAiYnVja192cGNhMTUiOwo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVn
dWxhdG9yLW5hbWUgPSAidnBjYTE1IjsKPiAtLQo+IDIuMzAuMQo+Cj4KPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LW1lZGlhdGVrIG1haWxp
bmcgbGlzdAo+IExpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBt
YWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
