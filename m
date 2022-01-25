Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18AC1C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jan 2022 16:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lva7chdhFVUUnZrZaDykRbMCT/DSQVo4/GcylwZFPGQ=; b=F654kXapWyZoO6
	PCcDRBjIeYAVwSUyPiS0X9CVKUcM2BI+Q+O+ISgghBjv5KjvkFGunTu99icBme/INiLdOW+09nNKh
	OF9A9taiSFH8wo6PNhFYaj0vQQqyv/b0b+54bvUqtygcDpClXWdLmcmb9t/9W57W5I1Pgn8TsjlNB
	EqmR7Z5R+EVWaXKbQIx75MzvEXkT+lkGDc8sZtoLErx3wphUl56LEk6bxZnM/+9LJVwGrIm4uAu9L
	a4E+hLCPtmjsR/GY3Et4oUpOKL8vPl5v1PwIanQXpeitiOKL8vbHAXmGgFeH4DzNEg3+bKSjez90k
	3rCsvHdX4izdCCF5wHcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCOwV-008l39-RF; Tue, 25 Jan 2022 16:45:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCOvl-008kjB-HF; Tue, 25 Jan 2022 16:44:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0134761799;
 Tue, 25 Jan 2022 16:44:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2A62C340F7;
 Tue, 25 Jan 2022 16:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643129067;
 bh=H5RYWVHLEF7hBelXtGAmQjOOxTr3ZKC1AcfdG0LUWzQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=R47mX52drvUrlL7Q4Y1Xr/wgrPFoMWxfnAVyTwN8ZPMCrjei5okuL+nvvnTE7ZV1o
 jFYDNH9Nj3wF2y9utevaVkPsJwxcOOphtSbFpHHjd8uCRudn3bYQtXSX/qGoJtb8yG
 8XnxU/QomCPTJs0vq1Vgsx9wyOwmAX1VrHFGn1KacteXhtqCWF6AuYXyKOu/Ma5eoT
 XTO59/RhXsDPs88sGwJtLSUwOFCBsP6heBGrZKjRBKb6W1+CritisMTBtYLhEEK+Ud
 eWkKfmpxMYUKN3pJBE2ZQnnVw3JvlpEnzSxwMR1JH29bVDbOYHZS5Tt3pJtr5Wabe2
 hVArpzFshBJaA==
Received: by mail-ej1-f44.google.com with SMTP id k25so31523238ejp.5;
 Tue, 25 Jan 2022 08:44:27 -0800 (PST)
X-Gm-Message-State: AOAM533o8GksL64U3jSNKI95+wwSgC3YbNauDMRDvXK7NWrx2Go7Fe7c
 +TTh3QWOuguWBw4F4bubgg3Se39hACYi8QCvaw==
X-Google-Smtp-Source: ABdhPJxZ+7OI1k1HlLK70kQOOUHF/t4avWi15FYddefD8ktBIzegy6VbLiDBFPwtobYR8uak011eNfvkJALGQFkgLvs=
X-Received: by 2002:a17:906:4785:: with SMTP id
 cw5mr11543421ejc.406.1643129066032; 
 Tue, 25 Jan 2022 08:44:26 -0800 (PST)
MIME-Version: 1.0
References: <20220112150133.11275-1-jitao.shi@mediatek.com>
In-Reply-To: <20220112150133.11275-1-jitao.shi@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 26 Jan 2022 00:44:14 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8v6UvcVcLL2ba-pOXD2UwF=qoTNNk9FNtK7CYDBQOfhQ@mail.gmail.com>
Message-ID: <CAAOTY_8v6UvcVcLL2ba-pOXD2UwF=qoTNNk9FNtK7CYDBQOfhQ@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: DP HPD Detect with debounce
To: Jitao Shi <jitao.shi@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, CK Hu <ck.hu@mediatek.com>, 
 stonea168@163.com, huijuan.xie@mediatek.com, 
 Rex-BC Chen <rex-bc.chen@mediatek.com>, shuijing.li@mediatek.com, 
 Rob Herring <robh+dt@kernel.org>, DTML <devicetree@vger.kernel.org>, 
 Guillaume Ranquet <granquet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_084429_688776_E13F1E02 
X-CRM114-Status: GOOD (  25.80  )
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

SGksIEppdGFvOgoKSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMuW5
tDHmnIgxMuaXpSDpgLHkuIkg5LiL5Y2IMTE6MDHlr6vpgZPvvJoKPgo+IERQIFNwZWMgMS40YSAz
LjMgcmVxdWlyZXMgZHAgZGV0ZWN0IHRoZSBocGQgd2l0aCBkZWJvdW5jZS4KPgo+IFVwc3RyZWFt
IGltcGxlbWVudGF0aW9ucyBzaG91bGQgaW1wbGVtZW50IEhQRCBzaWduYWwgZGUtYm91bmNpbmcg
b24KPiBhbiBleHRlcm5hbCBjb25uZWN0aW9uLiBBIHBlcmlvZCBvZiAxMDBtcyBzaG91bGQgYmUg
dXNlZCBmb3IKPiBkZXRlY3RpbmcgYW4gSFBEIGNvbm5lY3QgZXZlbnQgKGkuZS4sIHRoZSBldmVu
dCwg4oCcSFBEIGhpZ2gs4oCdIGlzCj4gY29uZmlybWVkIG9ubHkgYWZ0ZXIgSFBEIGhhcyBiZWVu
IGNvbnRpbnVvdXNseSBhc3NlcnRlZCBmb3IgMTAwbXMpLgo+IENhcmUgc2hvdWxkIGJlIHRha2Vu
IHRvIG5vdCBpbXBsZW1lbnQgZGUtYm91bmNpbmcgb24gYW4gSVJRX0hQRCBhbmQKPiBvbiBhIGRv
d25zdHJlYW0gZGV2aWNlLWdlbmVyYXRlZCBwYWlyIG9mIEhQRCBkaXNjb25uZWN0L3JlY29ubmVj
dAo+IGV2ZW50cyAodHlwaWNhbGx5IEhQRCBzaGFsbCBiZSBkZS1hc3NlcnRlZCBmb3IgbW9yZSB0
aGFuIDJtcywgYnV0Cj4gbGVzcyB0aGFuIDEwMG1zIGluIHRoaXMgY2FzZSkuIFRvIGNvdmVyIHRo
ZXNlIGNhc2VzLCBIUEQgZGUtYm91bmNlCj4gc2hvdWxkIGJlIGltcGxlbWVudGVkIG9ubHkgYWZ0
ZXIgSFBEIGxvdyBoYXMgYmVlbiBkZXRlY3RlZCBmb3IgMTAwbXMuCj4gIFRpbWluZyByZXF1aXJl
bWVudHMgaW4gdGhpcyBTdGFuZGFyZCByZWxhdGVkIHRvIHRoZSBkZXRlY3Rpb24gb2YKPiBIUEQg
aGlnaCBhcmUgdG8gYmUgaW50ZXJwcmV0ZWQgYXMgYXBwbHlpbmcgZnJvbSB0aGUgY29tcGxldGlv
biBvZiBhbgo+IGltcGxlbWVudGF0aW9uLWRlcGVuZGVudCBkZS1ib3VuY2UgcGVyaW9kLgo+Cj4g
U2lnbmVkLW9mZi1ieTogSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPgo+IC0tLQoK
bXRrIGRwIGRyaXZlciBoYXMgbm90IGJlZW4gdXBzdHJlYW1lZCB5ZXQuIFRoaXMgcGF0Y2ggc2Vl
bXMgZGVwZW5kIG9uCmFub3RoZXIgc2VyaWVzIFsxXS4gUGxlYXNlIGRlc2NyaWJlIHRoZSBkZXBl
bmRlbmN5IGluZm9ybWF0aW9uIGhlcmUuCgpbMV0gaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9y
Zy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVrL2xpc3QvP3Nlcmllcz01OTc0ODUKClJlZ2FyZHMsCkNo
dW4tS3VhbmcuCgo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwLmMgfCAyNCArKysr
KysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKykK
Pgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwLmMgYi9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwLmMKPiBpbmRleCBhMjU2ZDU1MzQ2YTIuLjA1ZjQw
MWEwMjRhNCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwLmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwLmMKPiBAQCAtMTkzLDYgKzE5
Myw4IEBAIHN0cnVjdCBtdGtfZHAgewo+ICAgICAgICAgc3RydWN0IG11dGV4IGVsZF9sb2NrOwo+
ICAgICAgICAgdTggY29ubmVjdG9yX2VsZFtNQVhfRUxEX0JZVEVTXTsKPiAgICAgICAgIHN0cnVj
dCBkcm1fY29ubmVjdG9yICpjb25uOwo+ICsgICAgICAgYm9vbCBuZWVkX2RlYm91bmNlOwo+ICsg
ICAgICAgc3RydWN0IHRpbWVyX2xpc3QgZGVib3VuY2VfdGltZXI7Cj4gIH07Cj4KPiAgZW51bSBt
dGtfZHBfc2RwX3R5cGUgewo+IEBAIC0yMjE3LDYgKzIyMTksOSBAQCBzdGF0aWMgaXJxcmV0dXJu
X3QgbXRrX2RwX2hwZF9ldmVudF90aHJlYWQoaW50IGhwZCwgdm9pZCAqZGV2KQo+ICAgICAgICAg
aWYgKGV2ZW50IDwgMCkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIElSUV9IQU5ETEVEOwo+Cj4g
KyAgICAgICBpZiAobXRrX2RwLT5uZWVkX2RlYm91bmNlICYmIG10a19kcC0+dHJhaW5faW5mby5j
YWJsZV9wbHVnZ2VkX2luKQo+ICsgICAgICAgICAgICAgICBtc2xlZXAoMTAwKTsKPiArCj4gICAg
ICAgICBpZiAobXRrX2RwLT5kcm1fZGV2KSB7Cj4gICAgICAgICAgICAgICAgIGRldl9pbmZvKG10
a19kcC0+ZGV2LCAiZHJtX2hlbHBlcl9ocGRfaXJxX2V2ZW50XG4iKTsKPiAgICAgICAgICAgICAg
ICAgZHJtX2hlbHBlcl9ocGRfaXJxX2V2ZW50KG10a19kcC0+YnJpZGdlLmRldik7Cj4gQEAgLTIy
OTYsNiArMjMwMSwxNCBAQCBzdGF0aWMgaXJxcmV0dXJuX3QgbXRrX2RwX2hwZF9pc3JfaGFuZGxl
cihzdHJ1Y3QgbXRrX2RwICptdGtfZHApCj4gICAgICAgICAgICAgICAgIG10a19kcC0+dHJhaW5f
c3RhdGUgPSBNVEtfRFBfVFJBSU5fU1RBVEVfU1RBUlRVUDsKPiAgICAgICAgIH0KPiAgICAgICAg
IHRyYWluX2luZm8tPmNhYmxlX3N0YXRlX2NoYW5nZSA9IHRydWU7Cj4gKwo+ICsgICAgICAgaWYg
KHRyYWluX2luZm8tPmNhYmxlX3N0YXRlX2NoYW5nZSkgewo+ICsgICAgICAgICAgICAgICBpZiAo
IXRyYWluX2luZm8tPmNhYmxlX3BsdWdnZWRfaW4pIHsKPiArICAgICAgICAgICAgICAgICAgICAg
ICBtb2RfdGltZXIoJm10a19kcC0+ZGVib3VuY2VfdGltZXIsIGppZmZpZXMgKyBtc2Vjc190b19q
aWZmaWVzKDEwMCkgLSAxKTsKPiArICAgICAgICAgICAgICAgICAgICAgICBtdGtfZHAtPm5lZWRf
ZGVib3VuY2UgPSBmYWxzZTsKPiArICAgICAgICAgICAgICAgfQo+ICsgICAgICAgfQo+ICsKPiAg
ICAgICAgIHJldHVybiBJUlFfV0FLRV9USFJFQUQ7Cj4gIH0KPgo+IEBAIC0yOTAzLDYgKzI5MTYs
MTMgQEAgc3RhdGljIGludCBtdGtfZHBfcmVnaXN0ZXJfYXVkaW9fZHJpdmVyKHN0cnVjdCBkZXZp
Y2UgKmRldikKPiAgICAgICAgIHJldHVybiAwOwo+ICB9Cj4KPiArc3RhdGljIHZvaWQgbXRrX2Rw
X2RlYm91bmNlX3RpbWVyKHN0cnVjdCB0aW1lcl9saXN0ICp0KQo+ICt7Cj4gKyAgICAgICBzdHJ1
Y3QgbXRrX2RwICptdGtfZHAgPSBmcm9tX3RpbWVyKG10a19kcCwgdCwgZGVib3VuY2VfdGltZXIp
Owo+ICsKPiArICAgICAgIG10a19kcC0+bmVlZF9kZWJvdW5jZSA9IHRydWU7Cj4gK30KPiArCj4g
IHN0YXRpYyBpbnQgbXRrX2RwX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4g
IHsKPiAgICAgICAgIHN0cnVjdCBtdGtfZHAgKm10a19kcDsKPiBAQCAtMjk5MCw2ICszMDEwLDkg
QEAgc3RhdGljIGludCBtdGtfZHBfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikK
PiAgICAgICAgIGVsc2UKPiAgICAgICAgICAgICAgICAgbXRrX2RwLT5icmlkZ2UudHlwZSA9IERS
TV9NT0RFX0NPTk5FQ1RPUl9EaXNwbGF5UG9ydDsKPgo+ICsgICAgICAgbXRrX2RwLT5uZWVkX2Rl
Ym91bmNlID0gdHJ1ZTsKPiArICAgICAgIHRpbWVyX3NldHVwKCZtdGtfZHAtPmRlYm91bmNlX3Rp
bWVyLCBtdGtfZHBfZGVib3VuY2VfdGltZXIsIDApOwo+ICsKPiAgICAgICAgIG10a19kcC0+YnJp
ZGdlLm9wcyA9Cj4gICAgICAgICAgICAgICAgIERSTV9CUklER0VfT1BfREVURUNUIHwgRFJNX0JS
SURHRV9PUF9FRElEIHwgRFJNX0JSSURHRV9PUF9IUEQ7Cj4gICAgICAgICBkcm1fYnJpZGdlX2Fk
ZCgmbXRrX2RwLT5icmlkZ2UpOwo+IEBAIC0zMDA4LDYgKzMwMzEsNyBAQCBzdGF0aWMgaW50IG10
a19kcF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPgo+ICAgICAgICAgbXRr
X2RwX3ZpZGVvX211dGUobXRrX2RwLCB0cnVlKTsKPiAgICAgICAgIG10a19kcF9hdWRpb19tdXRl
KG10a19kcCwgdHJ1ZSk7Cj4gKyAgICAgICBkZWxfdGltZXJfc3luYygmbXRrX2RwLT5kZWJvdW5j
ZV90aW1lcik7Cj4KPiAgICAgICAgIHBtX3J1bnRpbWVfZGlzYWJsZSgmcGRldi0+ZGV2KTsKPgo+
IC0tCj4gMi4xMi41Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbWVkaWF0ZWsK
