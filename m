Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C9DC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Feb 2022 08:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UfSaKzvPZJoYU4sQ2iYbYuphP3XNVITrgISF2A4mLVk=; b=RBlYpbaDVT9+zP
	rDM7IO5VT7zBT/qXgfsrnrjR1aoN2lkSNemcm6pxcBULTLEC55WO66tpxS0/IgZwd2uR09D9J57pL
	NMy+BOQX1udrKzqerhWFnpkQSpiMuds3osgcGWMdCDHudnhcFfL+w5EXrRP7lTKS2Shz+Fcpo0tnR
	FtNEfsUlLsLy44zGUae9CNi/X++T+ETdx647EAnO284SkbJ/aTakcV0eYIgQhqjolKyTHpYjS7vPG
	OJLR0STvHMuoMW5F129fvRcIBXNnsL1610aPTUnsWnVFKUa3YBrGWYRGmblkle3VyMDr7SL6iPaiz
	WS8E7TMKFdL//Vbc2Cdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHLX5-00CrRO-Ko; Tue, 08 Feb 2022 08:07:27 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHLX3-00CrQA-Ua
 for linux-mediatek@lists.infradead.org; Tue, 08 Feb 2022 08:07:27 +0000
Received: by mail-il1-x12d.google.com with SMTP id d3so13245177ilr.10
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Feb 2022 00:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2nn1yw6s4IptKKkqexjsVuYGnZXdnpYECt5wmy4nCLI=;
 b=RbemnSrhXrKKcmiNAQChCDTCfg6l6ls5LgDIaRQkZLTLaWYDjG6MM8osL8JkLF3bCp
 /Kq4sd9uU0NEZm+Wz8RgynFJAbap5ItA1CILACu+hFiwrULXgQ7eCzkQ14TNBanKSWIw
 TjONrz2gQtSvRje+DKUublwrHeFhbhnyVgZ3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2nn1yw6s4IptKKkqexjsVuYGnZXdnpYECt5wmy4nCLI=;
 b=zd0rFO9WUMtNM+Cn/CSTU1sK7HLiDgu4jOfqQVF0HNzy+i8fzswK+pl9fsWFJf3vZA
 fae11gjGcvJU/cO4LTIJvTDE+3BoJZd5s0uolghwqg/VTF6yZlK1UcuqsJd1OSgaSO0U
 WU8+BlgTHF+NMC0qotX0JsCDQANiV6uiREK+e6taw/HiIQMIIu1utp+X4xShAS7Wcx73
 UD5sjpDQ3SaA12elp+KgLd+T/ZrSUB86muh/nI6MOxucmdrUDI+DPTIN8onQY2ZAm7zO
 PuS4j9jcGy8SKwcquAKcH8GRWLIRcB2FyAPz0ehYN0ufiSffCZTulW9bTB3oWMW6Fp7T
 bFHg==
X-Gm-Message-State: AOAM531Fq1nqfjhdMXLFE2b4d76TfwRhR7VOicjuX68iBzYDcOxho3Mq
 iov1u6rP98gstbYv1+o78wbXFn6MsWJwyvFUbj830g==
X-Google-Smtp-Source: ABdhPJzX6bk4eNvEnp69aytew5yHADtPJVvGPNtbE4EZRnOFljwbLJwfYxI5lISAClkMzxAfRIq8Gdm85/RAs5cGYNM=
X-Received: by 2002:a05:6e02:18c6:: with SMTP id
 s6mr1637885ilu.230.1644307645048; 
 Tue, 08 Feb 2022 00:07:25 -0800 (PST)
MIME-Version: 1.0
References: <20220208073714.1540390-1-hsinyi@chromium.org>
 <YgIhJb3+MckKD4dC@intel.com>
In-Reply-To: <YgIhJb3+MckKD4dC@intel.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 8 Feb 2022 16:06:59 +0800
Message-ID: <CAJMQK-hzjtZrXC+sdcs39kF6nvUzkNcgNXFXPzTUQHzr8f6ZkA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v7 1/3] gpu: drm: separate panel orientation
 property creating and value setting
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 devicetree@vger.kernel.org, Simon Ser <contact@emersion.fr>, 
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, 
 Alex Deucher <alexander.deucher@amd.com>, Rob Herring <robh+dt@kernel.org>, 
 linux-mediatek@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>, 
 Harry Wentland <harry.wentland@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_000725_997983_0F06782C 
X-CRM114-Status: GOOD (  12.32  )
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

T24gVHVlLCBGZWIgOCwgMjAyMiBhdCAzOjUyIFBNIFZpbGxlIFN5cmrDpGzDpAo8dmlsbGUuc3ly
amFsYUBsaW51eC5pbnRlbC5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBGZWIgMDgsIDIwMjIgYXQg
MDM6Mzc6MTJQTSArMDgwMCwgSHNpbi1ZaSBXYW5nIHdyb3RlOgo+ID4gK2ludCBkcm1fY29ubmVj
dG9yX2luaXRfcGFuZWxfb3JpZW50YXRpb25fcHJvcGVydHkoCj4gPiArICAgICBzdHJ1Y3QgZHJt
X2Nvbm5lY3RvciAqY29ubmVjdG9yKQo+ID4gK3sKPiA+ICsgICAgIHN0cnVjdCBkcm1fZGV2aWNl
ICpkZXYgPSBjb25uZWN0b3ItPmRldjsKPiA+ICsgICAgIHN0cnVjdCBkcm1fcHJvcGVydHkgKnBy
b3A7Cj4gPiArCj4gPiArICAgICBwcm9wID0gZHJtX3Byb3BlcnR5X2NyZWF0ZV9lbnVtKGRldiwg
RFJNX01PREVfUFJPUF9JTU1VVEFCTEUsCj4gPiArICAgICAgICAgICAgICAgICAgICAgInBhbmVs
IG9yaWVudGF0aW9uIiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICBkcm1fcGFuZWxfb3JpZW50
YXRpb25fZW51bV9saXN0LAo+ID4gKyAgICAgICAgICAgICAgICAgICAgIEFSUkFZX1NJWkUoZHJt
X3BhbmVsX29yaWVudGF0aW9uX2VudW1fbGlzdCkpOwo+ID4gKyAgICAgaWYgKCFwcm9wKQo+ID4g
KyAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsKPiA+ICsKPiA+ICsgICAgIGRldi0+bW9kZV9j
b25maWcucGFuZWxfb3JpZW50YXRpb25fcHJvcGVydHkgPSBwcm9wOwo+Cj4gTGVhayB3aGVuIGNh
bGxlZCBtdWx0aXBsZSB0aW1lcy4gSSBndWVzcyB5b3UgY291bGQganVzdCBwdXQKPiB0aGlzIGlu
dG8gZHJtX2Nvbm5lY3Rvcl9jcmVhdGVfc3RhbmRhcmRfcHJvcGVydGllcygpIGluc3RlYWQKPiBh
bmQgYXZvaWQgdGhhdCBpc3N1ZSBlbnRpcmVseS4KPgpJJ2xsIGFkZCBhIGNoZWNrIGZvciBkZXYt
Pm1vZGVfY29uZmlnLnBhbmVsX29yaWVudGF0aW9uX3Byb3BlcnR5IHRvCmF2b2lkIHRoZSBsZWFr
IGlzc3VlIGlmIGNhbGxlZCBtdWx0aXBsZSB0aW1lcy4KSWYgd2UgYWRkIGluIGRybV9jb25uZWN0
b3JfY3JlYXRlX3N0YW5kYXJkX3Byb3BlcnRpZXMoKSwgd2Ugc3RpbGwgbmVlZAphbm90aGVyIGZ1
bmN0aW9uIHRvIGF0dGFjaCB0aGUgcHJvcGVydHkgZWFybGllciBmb3IgYnJpZGdlL2Nvbm5lY3Rv
cnMKdGhhdCByZXF1aXJlIHRoaXMgcHJvcGVydHksIHNpbmNlIG5vdCBhbGwgYnJpZGdlL2Nvbm5l
Y3RvcnMgbmVlZCB0aGlzCnByb3BlcnR5LgoKPiAtLQo+IFZpbGxlIFN5cmrDpGzDpAo+IEludGVs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1t
ZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVr
Cg==
