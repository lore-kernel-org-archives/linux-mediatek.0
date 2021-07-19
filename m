Return-Path: <SRS0=Po0r=ML=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6959DC12002
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jul 2021 03:37:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 214726100B
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jul 2021 03:37:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 214726100B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h10/JFD9LpBniqWk/Bh2OrcvC8YLx3b0SVk5zlJxUUc=; b=z49fPESMAOv3Cz
	n86eH2emr/iSkL3v+6A33p73Fb9p2/Fcr+uS8MUVFu4tpsgeG81inZ+LAXNv7FtJ8H9Uld7Rt7m47
	t7D0vDF3Qpkgm3vECe+T2DR3ydjZqusBruEpomI7xSqYRm/dG5FrO3esdyd/4HD4lBWWPQAVwRuwT
	vmCPdB0ELUQ7YzDTEagLy71VGbIILtZiKOk3i3XhGHkAFvXkfMDajeJ5khlJ+pCzt3abDpM7k1xe/
	qYp8ZDdu2SuTdDIQiqowMlCDjKskzgNaC8HtzlCowMTG0+8b1gs/0yc3Bslu5dUlrq3rwoZb/28hW
	l/tW46SX2s45qBSdNxSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5K5k-008LK9-Nn; Mon, 19 Jul 2021 03:37:16 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5K5X-008LIl-Rk; Mon, 19 Jul 2021 03:37:05 +0000
Received: by mail-ot1-x32d.google.com with SMTP id
 s2-20020a0568301e02b02904ce2c1a843eso6341114otr.13; 
 Sun, 18 Jul 2021 20:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8+eLQwJG0xHjzA2HdgDG/KvwsZz2/KmvAqN1DaPnEKA=;
 b=rv3Cx9pbv/vLTV9CPR0bg5cnCaG+/S1Yj8gyudMEF4N7xUgTC7BwX5S2/oyX9oWaAT
 4zG4Ykher2mjHmy5TbtRhvnWe0xul4ZRA2kheLSYuYsi+33CGicsJVL3DbX2WT0RBCSE
 HAnHxw0ys6aMdOtLuEW+5xQXyu0d20Gmw170ggzZuTbg280SdmqApU1IARItbkgvHzht
 QkIGz9uQRYKkz1RG4BkHhBYOHCvOrJt9uAMoCwOottenSvkc1S3OmAWtzqRABwJ9iQVV
 bIecFGgpTPGixkL5051Dzd0aoASfvYliW+MGmcceRWN1/NBPTuzkfTSc94PXuWCpGoXK
 Qx6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8+eLQwJG0xHjzA2HdgDG/KvwsZz2/KmvAqN1DaPnEKA=;
 b=epxdkPiw2UsX1HFkk/Jn0IRC4YE4SJ3bmpzpCUEcDgxJhlVYH2Ra5aX5kxOPRDJtuY
 xPD1CjaweGm5NGx8XOG2aFva3BJXaCG4Ko32I523s0WooPIQ/m+vz7Y1jF7U2d8KE/4e
 TsGaCNNorJSsJ1jdob+OnoXqDHX3vIdjmJBxXsV188tPkqibH7L1mqHmq/VcXSPnF6x9
 vOul9KAkRh6oliAvDLaDsBoCiSMS99mRmlVZxEWKA6IXYtuLnd9Y6ngKarxPTojmVNEU
 l4L021IAk1aUmgUNP7JOy2DoPuBx4Bffsu246wPLUD95lMabEHSeksGdFS5eMxdqEsjm
 8wbQ==
X-Gm-Message-State: AOAM533/QP0Wu0+iSCpA5pGu0UfqbDqJ/ONTywcfU1pcJt8SES1cLxim
 eSE+Dxz+SJp4a/0qiMu3aY+vgHX2ldOXUjRno/0=
X-Google-Smtp-Source: ABdhPJxh/mmSJaUt9HEnlJJ/KeCQ4qoiW+T588VXLP8Og/yBwtdsUkzdfeceh/w5vQ9u7AEfGhtzFLihkHGkf4vg4kc=
X-Received: by 2002:a05:6830:2309:: with SMTP id
 u9mr17378974ote.327.1626665821654; 
 Sun, 18 Jul 2021 20:37:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210716094353.140536-1-gene.chen.richtek@gmail.com>
 <a01521d3-bd79-a813-554a-39a750775938@infradead.org>
In-Reply-To: <a01521d3-bd79-a813-554a-39a750775938@infradead.org>
From: Gene Chen <gene.chen.richtek@gmail.com>
Date: Mon, 19 Jul 2021 11:36:50 +0800
Message-ID: <CAE+NS36kV3hMhgxGPWYiwPZYhgrZDJYM1RiP0kGsrV2M5so+oA@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] power: supply: mt6360_charger: add MT6360 charger
 support
To: Randy Dunlap <rdunlap@infradead.org>
Cc: sre@kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, 
 "Vaittinen, Matti" <matti.vaittinen@fi.rohmeurope.com>,
 Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, devicetree <devicetree@vger.kernel.org>, 
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Gene Chen <gene_chen@richtek.com>, 
 Wilma.Wu@mediatek.com, ChiYuan Huang <cy_huang@richtek.com>,
 benjamin.chao@mediatek.com, Linux PM list <linux-pm@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210718_203703_944613_A4BAA912 
X-CRM114-Status: GOOD (  15.08  )
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

UmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+IOaWvCAyMDIx5bm0N+aciDE35pel
IOmAseWFrSDkuIrljYgxMjoyOeWvq+mBk++8mgo+Cj4gT24gNy8xNi8yMSAyOjQzIEFNLCBHZW5l
IENoZW4gd3JvdGU6Cj4gPgo+ID4gVGhpcyBwYXRjaCBzZXJpZXMgYWRkIE1UNjM2MCBDaGFyZ2Vy
IHN1cHBvcnQgY29udGFpbnMgZHJpdmVyIGFuZCBiaW5kaW5nCj4gPiBkb2N1bWVudAo+ID4KPiA+
IEdlbmUgQ2hlbiAoMykKPiA+ICBsaWI6IGFkZCBsaW5lYXIgcmFuZ2UgZ2V0IHNlbGVjdG9yIHdp
dGhpbgo+ID4gIGR0LWJpbmRpbmdzOiBwb3dlcjogQWRkIGJpbmRpbmdzIGRvY3VtZW50IGZvciBD
aGFyZ2VyIHN1cHBvcnQgb24gTVQ2MzYwIFBNSUMKPiA+ICBwb3dlcjogc3VwcGx5OiBtdDYzNjBf
Y2hhcmdlcjogYWRkIE1UNjM2MCBjaGFyZ2VyIHN1cHBvcnQKPiA+Cj4gPiAgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bvd2VyL3N1cHBseS9tdDYzNjBfY2hhcmdlci55YW1sIHwg
ICA0OAo+ID4gIGRyaXZlcnMvcG93ZXIvc3VwcGx5L0tjb25maWcgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAgMTEKPiA+ICBkcml2ZXJzL3Bvd2VyL3N1cHBseS9NYWtl
ZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAxCj4gPiAgZHJp
dmVycy9wb3dlci9zdXBwbHkvbXQ2MzYwX2NoYXJnZXIuYyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgIDg2NyArKysrKysrKysrCj4gPiAgaW5jbHVkZS9saW51eC9saW5lYXJfcmFuZ2Uu
aCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgMgo+ID4gIGxpYi9s
aW5lYXJfcmFuZ2VzLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAgMzEKPiA+ICA2IGZpbGVzIGNoYW5nZWQsIDk2MCBpbnNlcnRpb25zKCspCj4gPgo+
Cj4KPiBIaSBHZW5lLAo+Cj4gQWxsIHBhdGNoZXMgaW4gdGhpcyBzZXJpZXMgYXJlIGFkZHJlc3Nl
ZCB0byAiaW51eC1wbUB2Z2VyLmtlcm5lbC5vcmciIChtaXNzaW5nIGxlYWRpbmcgJ2wnKSwKPiBz
byBJIGV4cGVjdCB0aGF0IHlvdSBzaG91bGQgcmVzZW5kIHRoZSBzZXJpZXMuCj4KPiAtLQo+IH5S
YW5keQo+CgpBQ0ssIEkgd2lsbCByZXNlbmQgdGhlIHBhdGNoZXMuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxp
c3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
