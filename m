Return-Path: <SRS0=02OB=GO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66D0FC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 10:46:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 118B32226A
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 10:46:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 118B32226A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hkHutwmvmJma+LapA/MPPaDb6VdtVyNpHV3QHGPvmUk=; b=mOBDCOxN3snnuT0E9+pnXGE5X
	3NRWh2rNg9IZJJYyBU9ulkCYFU9Vy0TIlpp81uWumwQxXvmDcfe9CroB3zf0vqGw7uF1t9E//SUe5
	FIUoUWvDf4eR5olXm108m0Mfhq1gYMAiiaGlR2cxTgn0BOZJePoEhDQNoBGU36MG8RCi/jvhNwToF
	4LCEs6brX2Vvgu1Zmtc9dsH12dKf2UA17xJ8BRe1kZzalpQ3N6e+s5R7PphjV/MrBV2ZeoCSx29Yv
	lwYHhBydDgrubh9Trdb9ef2T2c0FnZ1xoQUI4Vsp0pNS5FuwN47ipuZDU+MUw2nFnALTdtAPEqUlR
	qaFGwgHug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyuiO-0004h5-2p; Mon, 11 Jan 2021 10:46:24 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyuiG-0004dO-Dn; Mon, 11 Jan 2021 10:46:17 +0000
Received: by mail-ot1-x32e.google.com with SMTP id b24so16512882otj.0;
 Mon, 11 Jan 2021 02:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DgDphA8O/OaGpiUzOXGEVjnzalcsMUilm6fpK3IxuZY=;
 b=P3OyxWSbAoSyFpEuQAUWE/G/nvfHDpyHmXZ/01V707QBb4baZqCYsMhU5vWFEU81d+
 OnlPhC5/bv3VY4EaRKf2a3kwJwlkNoyzoPNMeGgKljtaN4Tl3Ft3DZbHQQQJCWDTUFeI
 m7/bgEd9aBveccDb9Gt1LVIsvVrOet7tmw2IBDtFLEld6BHEHKgt8n5Y1we79RS3Blbl
 BtAILTh+aKtJX+lAcWIh0NtePkIUZElFiF8gfhc0NoSW4RG0jLfvj0PwFSQx9MoX2P9y
 eT/akvGwKELB6IjSDpeViTlBpDbSVVjYcBIUCoBzm4isM9ZRb4D4FUW9WJu0hpyr50Vw
 XBDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DgDphA8O/OaGpiUzOXGEVjnzalcsMUilm6fpK3IxuZY=;
 b=QVWwb8wds1M7FF+W/48IJJ7uGkopGw864W7Axefs8vG26w5XE02uCih23pGsTtBN0u
 WbeJvUdMqWDkTZRpzgi/cBAM0JGYC9RccBxM4J62ItLPK+pIyfkvAVBB/lXSIshsXpJk
 JL6YYnAGWXc8+wsvbduw78nGDsueNs6aP4eWYTBwL8J6wlkdYKPjUeR9ILDAEempBw4Q
 ebP/OISkLQ/mLjqchXCJ2MX92hEeAt4Em4tNU+eMN43muQMbBhzuEt/nFt9wY769LPXg
 vofSQoCjEKeecmMX6I5cb4chLDqfpXrmXimbcmz7ovKfoP46DODGBJ8DexXY3KqqSJpD
 ByXg==
X-Gm-Message-State: AOAM531liW91rhoQ8UcD1BmtsLbXRHDaIu147N99WE0nxjUZ2HkyPTJo
 RzCqbm2slAVSLjyxVotZ30IxBRZfZXKW3V6VEPY=
X-Google-Smtp-Source: ABdhPJwtwWAcszv5AktECZV7ekom++ferq0emh1Qt6rmfwnHaqN5qiEoNDnMJG5pxeaHq9Rfp7QdF+ywB5+OHa+araE=
X-Received: by 2002:a9d:6c92:: with SMTP id c18mr10331229otr.232.1610361973579; 
 Mon, 11 Jan 2021 02:46:13 -0800 (PST)
MIME-Version: 1.0
References: <1608779989-9641-1-git-send-email-gene.chen.richtek@gmail.com>
 <04b06a6a4020212c4ae65bea9685afccc90c6dee.camel@fi.rohmeurope.com>
In-Reply-To: <04b06a6a4020212c4ae65bea9685afccc90c6dee.camel@fi.rohmeurope.com>
From: Gene Chen <gene.chen.richtek@gmail.com>
Date: Mon, 11 Jan 2021 18:46:01 +0800
Message-ID: <CAE+NS373aYm9T_mJd23PXvGRqUB9QaEC-T8=zku_OmawQRpGFw@mail.gmail.com>
Subject: Re: [PATCH resend] dt-bindings: mfd: mediatek: Add bindings for
 MT6360 PMIC
To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_054616_505693_411A49E7 
X-CRM114-Status: GOOD (  20.94  )
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
Cc: "gene_chen@richtek.com" <gene_chen@richtek.com>,
 "Wilma.Wu@mediatek.com" <Wilma.Wu@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "cy_huang@richtek.com" <cy_huang@richtek.com>,
 "benjamin.chao@mediatek.com" <benjamin.chao@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "shufan_lee@richtek.com" <shufan_lee@richtek.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

VmFpdHRpbmVuLCBNYXR0aSA8TWF0dGkuVmFpdHRpbmVuQGZpLnJvaG1ldXJvcGUuY29tPiDmlrwg
MjAyMeW5tDHmnIgxMeaXpSDpgLHkuIAg5LiL5Y2INToxM+Wvq+mBk++8mgo+Cj4gSGVsbG8gUGVl
cHMsCj4KPiBPbiBUaHUsIDIwMjAtMTItMjQgYXQgMTE6MTkgKzA4MDAsIEdlbmUgQ2hlbiB3cm90
ZToKPiA+IEZyb206IEdlbmUgQ2hlbiA8Z2VuZV9jaGVuQHJpY2h0ZWsuY29tPgo+ID4KPiA+IEFk
ZCBiaW5kaW5ncyBmb3IgTVQ2MzYwIFBNSUMKPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBHZW5lIENo
ZW4gPGdlbmVfY2hlbkByaWNodGVrLmNvbT4KPiA+IC0tLQo+ID4gIERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9tZmQvbXQ2MzYwLnlhbWwgfCA2OQo+ID4gKysrKysrKysrKysrKysr
KysrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgNjkgaW5zZXJ0aW9ucygrKQo+ID4gIGNyZWF0
ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL210NjM2
MC55YW1sCj4gPgo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tZmQvbXQ2MzYwLnlhbWwKPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL21mZC9tdDYzNjAueWFtbAo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAw
MDAwMDAuLjI3ODFjMzEKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvbXQ2MzYwLnlhbWwKPiA+IEBAIC0wLDAgKzEsNjkgQEAK
PiA+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCBPUiBCU0QtMi1DbGF1c2Up
Cj4gPiArJVlBTUwgMS4yCj4gPiArLS0tCj4gPiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcv
c2NoZW1hcy9tZmQvbXQ2MzYwLnlhbWwjCj4gPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUu
b3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4gPiArCj4gPiArdGl0bGU6IE1UNjM2MCBQTUlD
IGZyb20gTWVkaWFUZWsgSW50ZWdyYXRlZAo+ID4gKwo+ID4gK21haW50YWluZXJzOgo+ID4gKyAg
LSBHZW5lIENoZW4gPGdlbmVfY2hlbkByaWNodGVrLmNvbT4KPiA+ICsKPiA+ICtkZXNjcmlwdGlv
bjogfAo+ID4gKyAgTVQ2MzYwIGlzIGEgUE1JQyBkZXZpY2Ugd2l0aCB0aGUgZm9sbG93aW5nIHN1
YiBtb2R1bGVzLgo+ID4gKyAgSXQgaXMgaW50ZXJmYWNlZCB0byBob3N0IGNvbnRyb2xsZXIgdXNp
bmcgSTJDIGludGVyZmFjZS4KPiA+ICsKPiA+ICsgIFRoaXMgZG9jdW1lbnQgZGVzY3JpYmVzIHRo
ZSBiaW5kaW5nIGZvciBQTUlDIGRldmljZSBhbmQgaXRzIHN1Ygo+ID4gbW9kdWxlLgo+ID4gKwo+
ID4gK3Byb3BlcnRpZXM6Cj4gPiArICBjb21wYXRpYmxlOgo+ID4gKyAgICBjb25zdDogbWVkaWF0
ZWssbXQ2MzYwCj4gPiArCj4gPiArICByZWc6Cj4gPiArICAgIGRlc2NyaXB0aW9uOgo+ID4gKyAg
ICAgIEkyQyBkZXZpY2UgYWRkcmVzcy4KPiA+ICsgICAgbWF4SXRlbXM6IDEKPiA+ICsKPiA+ICsg
IHdha2V1cC1zb3VyY2U6IHRydWUKPiA+ICsKPiA+ICsgIGludGVycnVwdHM6Cj4gPiArICAgIG1h
eEl0ZW1zOiAxCj4gPiArCj4gPiArICBpbnRlcnJ1cHQtbmFtZXM6Cj4gPiArICAgICAgZW51bToK
PiA+ICsgICAgICAgIC0gSVJRQgo+ID4gKwo+ID4gKyAgaW50ZXJydXB0LWNvbnRyb2xsZXI6IHRy
dWUKPiA+ICsKPiA+ICsgICIjaW50ZXJydXB0LWNlbGxzIjoKPiA+ICsgICAgY29uc3Q6IDEKPiA+
ICsgICAgZGVzY3JpcHRpb246Cj4gPiArICAgICAgVGhlIGZpcnN0IGNlbGwgaXMgdGhlIElSUSBu
dW1iZXIuCj4gPiArCj4gPiArcmVxdWlyZWQ6Cj4gPiArICAtIGNvbXBhdGlibGUKPiA+ICsgIC0g
cmVnCj4gPiArICAtIGludGVycnVwdHMKPiA+ICsgIC0gaW50ZXJydXB0LWNvbnRyb2xsZXIKPiA+
ICsgIC0gIiNpbnRlcnJ1cHQtY2VsbHMiCj4gPiArCj4gPiArYWRkaXRpb25hbFByb3BlcnRpZXM6
IGZhbHNlCj4gPiArCj4gPiArZXhhbXBsZXM6Cj4gPiArICAtIHwKPiA+ICsgICAgI2luY2x1ZGUg
PGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2lycS5oPgo+ID4gKyAgICAjaW5jbHVk
ZSA8ZHQtYmluZGluZ3MvcmVndWxhdG9yL21lZGlhdGVrLG10NjM2MC1yZWd1bGF0b3IuaD4KPiA+
ICsgICAgaTJjIHsKPiA+ICsgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Owo+ID4gKyAgICAg
ICAgI3NpemUtY2VsbHMgPSA8MD47Cj4gPiArCj4gPiArICAgICAgICBtdDYzNjBAMzQgewo+ID4g
KyAgICAgICAgICAgIGNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ2MzYwIjsKPiA+ICsgICAgICAg
ICAgICByZWcgPSA8MHgzND47Cj4gPiArICAgICAgICAgICAgd2FrZXVwLXNvdXJjZTsKPiA+ICsg
ICAgICAgICAgICBpbnRlcnJ1cHRzLWV4dGVuZGVkID0gPCZncGlvMjYgMCBJUlFfVFlQRV9MRVZF
TF9MT1c+Owo+ID4gKyAgICAgICAgICAgIGludGVycnVwdC1uYW1lcyA9ICJJUlFCIjsKPiA+ICsg
ICAgICAgICAgICBpbnRlcnJ1cHQtY29udHJvbGxlcjsKPiA+ICsgICAgICAgICAgICAjaW50ZXJy
dXB0LWNlbGxzID0gPDE+Owo+Cj4gT3V0IG9mIHRoZSBjdXJpb3NpdHkgLSBpcyB0aGlzIHRoZSBj
b21wbGV0ZSBub2RlPyBJIHdvdWxkIGFzc3VtZSBzb21lCj4gc3ViLWRldmljZXMgbGlrZSByZWd1
bGF0b3JzIGhlcmU/Cj4KCkFmdGVyIGFsbCBzdWItZGV2aWNlcyBtb2R1bGUgcmV2aWV3IGRvbmUs
IEkgd2lsbCBhZGQgbmV3IHBhdGNoIHRvIGFkZApyZWZlcmVuY2UgZGVzY3JpcHRpb24uCmUuZy4g
bWF4Nzc2NTAueWFtbApsZWRzOgogICRyZWY6IC4uL2xlZHMvbGVkcy1tYXg3NzY1MC55YW1sCgo+
ID4gKyAgICAgICAgfTsKPiA+ICsgICAgfTsKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1l
ZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
