Return-Path: <SRS0=IR42=AN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48B98C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 08:30:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17669206A1
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 08:30:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hMVsHQYw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NcA01VsI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17669206A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QwURyUbUfVDLagUDwm/guGlOznWNT/PDfjLQNdQbgQs=; b=hMVsHQYwK16V0pGdHroX11Ylm
	l1/zlGbTV7hvC3knILK4jzqK5wfXT75pgaA3BRKXDO8VvtAOgjGXSQ+2JAh1ZuZijsaY5Ed1UcVkC
	RGF7y2QNcIBySUtv2HJAYQtgBUAgHwQ1bqmxJMA5+Ro5TEaAV9czhIE/HVy4O3p2t0PW1l8GTNbA9
	gB94wBgbDeh/yNb33ADVWFoQv65kHp2xbtJlGliSimV1mhtr8xNkUDMzsdl7DQEQof94E7+Lt9E1Y
	SSDsV8xLfChk5ufS+zWVC2Eip1N2m3y0V9B91NohzkOPWWEYXbTghGpki4RU/xeRqZ39V+g05ZQvP
	wA3JNZs/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqubW-0000iu-Ge; Thu, 02 Jul 2020 08:29:58 +0000
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqubS-0000fz-FT; Thu, 02 Jul 2020 08:29:55 +0000
Received: by mail-il1-x144.google.com with SMTP id t27so18520551ill.9;
 Thu, 02 Jul 2020 01:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PFI6JgeUlJ0zCkzBIfqc7DEBAwFXOrcce0CKNSdhhaY=;
 b=NcA01VsImeoYRghLx1f/WoCed8K77wkg/n2nxdjujvgeFu2ykNf91zWIdX1PgDF3bV
 em7xudIT0qkiaGrFgK6BufPqJwFNBNTqz7dFJj7d3rvB0/bWFTarqjivuOptBwOD8Ust
 +rmOlxyPBS8wJ5Ya/rrAkyuLHuOS3I6efbcAFYqVTRJ+pOEDgUeYfddbbaf+Cq8JnoN8
 zktQlYolsZJThAht2LFFVUCgSkokUdBPvLowvkkzUaU/R6CM31lQjrFcRKMqndGnx5KB
 JGWd9gfpLVsaNfW/EUkWNkcFqZ3PlycrOxGIhRVzY5gUOASui0lREVAWgEph38VQzlAH
 XERQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PFI6JgeUlJ0zCkzBIfqc7DEBAwFXOrcce0CKNSdhhaY=;
 b=aaeTQIeRuawgPTrFPrRbn3bFo4FBGMzhga0Ve+NQlOKQbp9lrqut5w1sNkjZ+57o0H
 fmcMjPwcRP9c8L3P+tDreZ29Q60qYYeUfN5MTdq/3KZ0Q8Aa5cmuf0hndT0E2UPA0QMG
 aKFNYuarKCOE7z6JQR8mYlq1I4bgbLVHPrO/0MS9M0TronWqoGfm+KYmWVwayFcu4qxu
 MJnPiH6FGw71sWDuEPAHfZwsFWFTgrUsgzWmoFGEHfz4ld7rvi5wF9ccdlYUmjPIkVaQ
 kjujhk9EP8G5ALzArf5ayNACYzKi47263OWZl+K5cH0/Ey2YPX9jQ6AIyvITyOe7sJf8
 gdGQ==
X-Gm-Message-State: AOAM533Kw9aiSFHGmIS/gw67PEVOzmNHnnseERlpwOHjxjzlxM3WvZ/W
 Tq7t9MQNKeot2ZXwuIog0TmrvTT/h9Mf24my1uk=
X-Google-Smtp-Source: ABdhPJwNPbq0R1jANb1XdVAr90ksp6Cce11K5919+RTL7nX3VNOYDmwKtakBxB6hfuabbbme20388qd6mlT1cFzkquM=
X-Received: by 2002:a92:9f96:: with SMTP id z22mr8671290ilk.266.1593678591282; 
 Thu, 02 Jul 2020 01:29:51 -0700 (PDT)
MIME-Version: 1.0
References: <1592567631-20363-1-git-send-email-gene.chen.richtek@gmail.com>
 <1592567631-20363-3-git-send-email-gene.chen.richtek@gmail.com>
 <20200701071620.GQ1179328@dell>
In-Reply-To: <20200701071620.GQ1179328@dell>
From: Gene Chen <gene.chen.richtek@gmail.com>
Date: Thu, 2 Jul 2020 16:29:38 +0800
Message-ID: <CAE+NS35Kj_H9uSgBiff4hogTWmwh6z+vmPNWDh_yU1=p68xQZA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] mfd: mt6360: implement i2c R/W with CRC
To: Lee Jones <lee.jones@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200702_042954_555972_024C3F20 
X-CRM114-Status: GOOD (  14.15  )
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
Cc: linux-arm-kernel@lists.infradead.org, Gene Chen <gene_chen@richtek.com>,
 lars@metafoo.de, pmeerw@pmeerw.net, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, benjamin.chao@mediatek.com,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 jacek.anaszewski@gmail.com, pavel@ucw.cz, knaack.h@gmx.de,
 matthias.bgg@gmail.com, shufan_lee@richtek.com, jic23@kernel.org,
 dmurphy@ti.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

TGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4g5pa8IDIwMjDlubQ35pyIMeaXpSDpgLHk
uIkg5LiL5Y2IMzoxNuWvq+mBk++8mgo+Cj4gT24gRnJpLCAxOSBKdW4gMjAyMCwgR2VuZSBDaGVu
IHdyb3RlOgo+Cj4gPiBGcm9tOiBHZW5lIENoZW4gPGdlbmVfY2hlbkByaWNodGVrLmNvbT4KPiA+
Cj4gPiBpbWxlbWVudCBpMmMgUi9XIHdpdGggQ1JDIHdoZW4gYWNjZXNzIHN1Yi1kZXZpY2UgUE1J
QyBhbmQgTERPIHBhcnQKPgo+IFBsZWFzZSB1c2UgcHJvcGVyIGdyYW1tYXIsIGluY2x1ZGluZyBj
YXBpdGFsIGxldHRlcnMgYXQgdGhlIHN0YXJ0IG9mCj4gdGhlIHNlbnRlbmNlIGFuZCBmb3IgYWJi
cmV2aWF0aW9ucyBzdWNoIGFzICJJMkMiIGFuZCBmdWxsIHN0b3BzLgo+Cj4gQWxzbyB0aGlzIGRv
ZXNuJ3QgbWFrZSBzZW5zZSB0byBtZS4gIFBsZWFzZSBlbGFib3JhdGUuCj4KCkFDSwoKPiA+IFNp
Z25lZC1vZmYtYnk6IEdlbmUgQ2hlbiA8Z2VuZV9jaGVuQHJpY2h0ZWsuY29tPgo+ID4gLS0tCj4g
PiAgZHJpdmVycy9tZmQvS2NvbmZpZyAgICAgICAgfCAgIDEgKwo+ID4gIGRyaXZlcnMvbWZkL210
NjM2MC1jb3JlLmMgIHwgNTQxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0t
LS0tLS0tLQo+Cj4gVGhpcyBwYXRjaCBpcyBkb2luZyB3YXkgdG9vIG11Y2ggd2Fja3kgc3R1ZmYg
YWxsIGF0IG9uY2UsIG1ha2luZyBpdAo+IHZlcnkgZGlmZmljdWx0IHRvIHJldmlldy4gIFBsZWFz
ZSBicmVhayBpdCB1cCBpbnRvIGZ1bmN0aW9uYWwgcGllY2VzCj4gYW5kIHN1Ym1pdCBhcyBzZXBh
cmF0ZSBsb2dpY2FsIHBhdGNoZXMgKGluIGEgc2V0IG9mIGNvdXJzZSkuCj4KCklmIEkgdW5kZXJz
dGFuZCBjb3JyZWN0bHksIEkgbmVlZCB0byBzZXBhcmF0ZSBwYXRjaFsyLzRdIGJ1dCBub3QKZW50
aXJlIG10NjM2Mi1jb3JlLmMgaW50byBzZXZlcmFsIHBhdGNoZXMuCgo+ID4gIGluY2x1ZGUvbGlu
dXgvbWZkL210NjM2MC5oIHwgMjQwIC0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiAgMyBmaWxlcyBj
aGFuZ2VkLCAzNTcgaW5zZXJ0aW9ucygrKSwgNDI1IGRlbGV0aW9ucygtKQo+ID4gIGRlbGV0ZSBt
b2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L21mZC9tdDYzNjAuaAo+Cj4gLS0KPiBMZWUgSm9uZXMg
W+adjueQvOaWr10KPiBTZW5pb3IgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2VydmljZXMK
PiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKPiBGb2xs
b3cgTGluYXJvOiBGYWNlYm9vayB8IFR3aXR0ZXIgfCBCbG9nCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QK
TGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
