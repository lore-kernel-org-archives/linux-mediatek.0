Return-Path: <SRS0=U17p=77=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF9F0C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2020 11:38:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90AA420734
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2020 11:38:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ajcpghSI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XbgW/1mX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90AA420734
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7dQpmUGWx7I5INY+s4cNdC1y6sOi4rnHiqNY9OJFojE=; b=ajcpghSIDmYXcw
	RKiPBYd+PRK8PizfnPQOpcnR//GMvxrXkVkdSc0+tG4y6ShQsV5A5ZAa4YpcG9LObaAZE+notUHhC
	b0XQ4vexcv9xvCpatwxlqhcpeoEMOwnl2EJ/VKO+B584oztnW5L021KPNFNnfmjQZWKjleKa91LrO
	7X9HsJmTyRgyWVuIx+OLgBdmF2HkDdbu8zScgu0/1Kd5v3rVfjkFMZUfycd80N8wW0ICjiSaU4Ys4
	kELKqk+UbUUqpJGVRGRKsgp9j/8uLF3IM0qYKIcMfKikIo6oKVLjoJc5olTqCcDzJeWpi3rmlcHSv
	1GRBApB1nXcy+HguV6GQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlssT-00040l-EA; Thu, 18 Jun 2020 11:38:41 +0000
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlssF-0003p0-CL; Thu, 18 Jun 2020 11:38:28 +0000
Received: by mail-il1-x143.google.com with SMTP id h3so5376128ilh.13;
 Thu, 18 Jun 2020 04:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HnqZ825QaUjHcFcUoPVeekIL3cloh6uSJswdCHcGNMU=;
 b=XbgW/1mXE4RlRrvQUAPe6piL/vvN9pMY8TMFHLIfTTurGrvqjI7qc00i30vHQLli1M
 OGqVPPM3Bo/wUZ51cib1et1xvfLqpJePfWs6ULwM7yUhrWpn8C7Sac8BAMpXhofGttKG
 Y95mEIZ2YSDycjFQJ74N0d76rpEVaUYI/EY2uB8A5dYu9ESLVf+txrJJWMU6LuUZtCQI
 Z8jHEAo1nZ2VxW46rH5fBN+YuoGUgGb3KCzBbqMqL8EOF5vtWajx0+Z653kWkLAHd7VT
 vc77SbsNaeagrUdkcUWyF3dv85R1qPMtVwc7YkUwJwkzmo11StWyebx5iSysmHeKqFOp
 Sseg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HnqZ825QaUjHcFcUoPVeekIL3cloh6uSJswdCHcGNMU=;
 b=D9xZAXKE8u2UP1EPI7GAhYAk6Y9Y0lVVeMO1WzyD6sAZkz0zolzDBqRxyR4/nZWcZi
 1vuU+oZ1UO7PrpWgsuGjPY5kYmiPP7bsrssBD7nQ9OVZHUs3h6pglu2hbYy282PnxfJy
 SkVSSWeZ0voR1BQCVplzvbll1OAlenxSaup+PkIMtv2R65krQCJQdYHZ4BoR4xV+OztJ
 bmpdN8LnN94rNRjWGC9qrqlN7jeqk8x0aWhAMineNrVyvPl0CvoETTGnITauZV2zjy8C
 QbqvQ4RdBPUdtQIjs1sNDDm5dUlPCFVrUqOGjKAOodnLm4WRXue5eLQhSRRsoJ2qYtLt
 jVCw==
X-Gm-Message-State: AOAM531aJ2Syl8E0MPY7ZDDk80o42K0n3gB05YX4NsXpfexSt2Z99X77
 9XxlxK2T40R2FLOjF3D0ERaei4cogy4UrcnJtr0=
X-Google-Smtp-Source: ABdhPJxcR9iEAJokjPMB/KxunZWalwUdWYUL4oPT1aiima67yngP6LTlhi+OnZVtLJNI8vSsb2FTq1BpSc6gS0vdZiI=
X-Received: by 2002:a05:6e02:92:: with SMTP id
 l18mr1254204ilm.212.1592480306512; 
 Thu, 18 Jun 2020 04:38:26 -0700 (PDT)
MIME-Version: 1.0
References: <1591254387-10304-1-git-send-email-gene.chen.richtek@gmail.com>
 <4135d264-6758-301a-0f19-ba2f229301c3@infradead.org>
In-Reply-To: <4135d264-6758-301a-0f19-ba2f229301c3@infradead.org>
From: Gene Chen <gene.chen.richtek@gmail.com>
Date: Thu, 18 Jun 2020 19:38:14 +0800
Message-ID: <CAE+NS360B8S6sDNPSwEOFWoEDLwtYKxf96M5wdu1brKtMD-Nvg@mail.gmail.com>
Subject: Re: [PATCH] regulator: mt6360: Add support for MT6360 regulator
To: Randy Dunlap <rdunlap@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200618_043827_419331_C6BF9AAB 
X-CRM114-Status: GOOD (  11.97  )
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
Cc: Gene Chen <gene_chen@richtek.com>, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, benjamin.chao@mediatek.com,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, Wilma.Wu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

UmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+IOaWvCAyMDIw5bm0NuaciDTml6Ug
6YCx5ZubIOS4i+WNiDExOjA25a+r6YGT77yaCj4KPiBPbiA2LzQvMjAgMTI6MDYgQU0sIEdlbmUg
Q2hlbiB3cm90ZToKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3JlZ3VsYXRvci9LY29uZmlnIGIv
ZHJpdmVycy9yZWd1bGF0b3IvS2NvbmZpZwo+ID4gaW5kZXggZjRiNzJjYi4uMDVhM2IxNCAxMDA2
NDQKPiA+IC0tLSBhL2RyaXZlcnMvcmVndWxhdG9yL0tjb25maWcKPiA+ICsrKyBiL2RyaXZlcnMv
cmVndWxhdG9yL0tjb25maWcKPiA+IEBAIC02ODAsNiArNjgwLDE2IEBAIGNvbmZpZyBSRUdVTEFU
T1JfTVQ2MzU4Cj4gPiAgICAgICAgIFRoaXMgZHJpdmVyIHN1cHBvcnRzIHRoZSBjb250cm9sIG9m
IGRpZmZlcmVudCBwb3dlciByYWlscyBvZiBkZXZpY2UKPiA+ICAgICAgICAgdGhyb3VnaCByZWd1
bGF0b3IgaW50ZXJmYWNlLgo+ID4KPiA+ICtjb25maWcgUkVHVUxBVE9SX01UNjM2MAo+ID4gKyAg
ICAgdHJpc3RhdGUgIk1UNjM2MCBTdWJQTUlDIFJlZ3VsYXRvciIKPiA+ICsgICAgIGRlcGVuZHMg
b24gTUZEX01UNjM2MAo+ID4gKyAgICAgc2VsZWN0IENSQzgKPiA+ICsgICAgIGhlbHAKPiA+ICsg
ICAgICAgU2F5IFkgaGVyZSB0byBlbmFibGUgTVQ2MzYwIHJlZ3VsYXRvciBzdXBwb3J0Lgo+ID4g
KyAgICAgICBUaGlzIGlzIHN1cHBvcnQgTVQ2MzYwIFBNSUMvTERPIHBhcnQgaW5jbHVkZQo+Cj4g
ICAgICAgICAgIFRoaXMgc3VwcG9ydHMgdGhlIE1UNjMwMCBQTUlDL0xETyBwYXJ0LCB3aGljaCBp
bmNsdWRlcwo+Cj4gPiArICAgICAgIDItY2hhbm5lbCBidWNrIHdpdGggVGhlcm1hbCBTaHV0ZG93
biBhbmQgT3ZlcmxvcmQgUHJvdGVjdGlvbgo+Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBpcyB0aGF0ICAgICAgT3ZlcmxvYWQgID8KPiBZZXMsIGl0IGNvdWxkIGJlIE92
ZXJsb3JkLgo+Cgp0eXBvLCBvdmVybG9hZCBpcyBzdWl0YWJsZSwgdGhhbmtzCgo+ID4gKyAgICAg
ICA2LWNoYW5uZWwgSGlnaCBQU1JSIGFuZCBMb3cgRHJvcG91dCBMRE8uCj4gPiArCj4gPiAgY29u
ZmlnIFJFR1VMQVRPUl9NVDYzODAKPiA+ICAgICAgIHRyaXN0YXRlICJNZWRpYVRlayBNVDYzODAg
UE1JQyIKPiA+ICAgICAgIGRlcGVuZHMgb24gTVRLX1BNSUNfV1JBUAo+Cj4KPiAtLQo+IH5SYW5k
eQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlh
dGVrCg==
