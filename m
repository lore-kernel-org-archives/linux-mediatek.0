Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8BE9C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Dec 2021 13:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IObebeyurqFlLRquK9qnlDRpzQpRJvJRehA0M8+DvDw=; b=hCnJs0A0NUZhnc
	64xbm4mPdWx5//hgJGlrNg+jTMeC8/RjfOAt9yujwWiYwYcB7gTKNsSvVNdhWHJbRv0vtTJAnK2cf
	h1UJtzuiy8XsZKKJ0Hr7bdNPs5ZTFNDMZCEn2/oYCbVjPNDtXPKCQJOrXXCE7ZBy54jdEfphGL2p4
	pzJ3QFImuOtua18CTO/90tS4TjA/ZYWN2iqaw0XPKD899fzpti4tX6Vuwt75NHNhrtDO5ePwJmJxC
	4JKBTzjlV9dxcFuHRJArUwCO0Oq/Ccbmh5CiFFqnWwgV+qxnA03vmGu7H0+ib3JdbZAhWKrRuUUO+
	/c7n7MDvi5Xdr7N6QwEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwl4R-009cYa-5e; Mon, 13 Dec 2021 13:08:47 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwl4E-009cUq-A6; Mon, 13 Dec 2021 13:08:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 39D7BCE102D;
 Mon, 13 Dec 2021 13:08:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C162EC34606;
 Mon, 13 Dec 2021 13:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639400908;
 bh=9ydNHDYKsiCtb2ZflappRnVfHZy3RsZlLzo1HG0qTQ8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=QltArIYaie93S6C5AMwxAjh3W4jCgoXKgmk8VWFWm3IvsJ7W9sEg4tGTWdI2fKqPU
 +4DWsXNRb5Ruxd7HJySCpwFEfq6luwBPS38TuOmvwW2fd2h840wTW6bkNgyEXA2w5J
 BDi9rZKBpme8UmtF1cE0YlrrEuugLKajdTnIXgJXk/R5RxKaOB3xyIInNtNSYb2s1y
 q5DcgN0sw7DICyY1QhX4CouZS0B8AbPFLJ7IPgze3RdH052fuCj/kxgcygJ04TYSoL
 hx8wGPzsMYcGql/b4g3TvWNzOQ2+EGlLD8vgSBNm7PHxVCdc7K+paLRF32PrE2NB+7
 4HX7yqmNrc6hA==
Received: by mail-ed1-f41.google.com with SMTP id z5so52564795edd.3;
 Mon, 13 Dec 2021 05:08:28 -0800 (PST)
X-Gm-Message-State: AOAM5336vucjuHZSdJyX5OzmQ2S8E04OoCzkTH+tv1yOug0RNVLH4UqF
 G+rz8WoL3D/5p03PeBytMLZLvBJNM7o2HM/ynA==
X-Google-Smtp-Source: ABdhPJyYH9M8ZF1ALPPysi0+E5P/GHohfR0mv1DVIz4G6JHoIMRL1u/arPHp4YYjl7O+tsaAU4Q6wDrSLDSQCkFycpk=
X-Received: by 2002:a50:d883:: with SMTP id p3mr63843811edj.94.1639400906772; 
 Mon, 13 Dec 2021 05:08:26 -0800 (PST)
MIME-Version: 1.0
References: <20211028074311.57842-1-angelogioacchino.delregno@collabora.com>
 <000ba19e-0220-f5c3-0efd-abb8338bb8f2@collabora.com>
In-Reply-To: <000ba19e-0220-f5c3-0efd-abb8338bb8f2@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 13 Dec 2021 21:08:15 +0800
X-Gmail-Original-Message-ID: <CAAOTY_87ugiuo+nz2D1upTX+oO8r3yHHLsU3r07qkpvu3UESDQ@mail.gmail.com>
Message-ID: <CAAOTY_87ugiuo+nz2D1upTX+oO8r3yHHLsU3r07qkpvu3UESDQ@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: hdmi: Perform NULL pointer check for
 mtk_hdmi_conf
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Collabora Kernel ML <kernel@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_050834_757072_E1780705 
X-CRM114-Status: GOOD (  23.54  )
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

IEhpLCBBbmdlbG86CgpBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5nZWxvZ2lvYWNjaGlu
by5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPiDmlrwKMjAyMeW5tDEy5pyIMTPml6Ug6YCx5LiAIOS4
i+WNiDY6MDLlr6vpgZPvvJoKPgo+IElsIDI4LzEwLzIxIDA5OjQzLCBBbmdlbG9HaW9hY2NoaW5v
IERlbCBSZWdubyBoYSBzY3JpdHRvOgo+ID4gSW4gY29tbWl0IDQxY2E5Y2FhYWUwYiAoImRybS9t
ZWRpYXRlazogaGRtaTogQWRkIGNoZWNrIGZvciBDRUEgbW9kZXMgb25seSIpCj4gPiBhIGNoZWNr
IGZvciBDRUEgbW9kZXMgd2FzIGFkZGVkIHRvIGZ1bmN0aW9uIG10a19oZG1pX2JyaWRnZV9tb2Rl
X3ZhbGlkKCkKPiA+IGluIG9yZGVyIHRvIGFkZHJlc3MgcG9zc2libGUgaXNzdWVzIG9uIE1UODE2
NzsgbW9yZW92ZXIsIHdpdGggY29tbWl0Cj4gPiBjOTEwMjZhOTM4YzIgKCJkcm0vbWVkaWF0ZWs6
IGhkbWk6IEFkZCBvcHRpb25hbCBsaW1pdCBvbiBtYXhpbWFsIEhETUkgbW9kZSBjbG9jayIpCj4g
PiBhbm90aGVyIHNpbWlsYXIgY2hlY2sgd2FzIGludHJvZHVjZWQuCj4gPgo+ID4gVW5mb3J0dW5h
dGVseSB0aG91Z2gsIGF0IHRoZSB0aW1lIG9mIHdyaXRpbmcsIE1UODE3MyBkb2VzIG5vdCBwcm92
aWRlCj4gPiBhbnkgbXRrX2hkbWlfY29uZiBzdHJ1Y3R1cmUgYW5kIHRoaXMgaXMgY3Jhc2hpbmcg
dGhlIGtlcm5lbCB3aXRoIE5VTEwKPiA+IHBvaW50ZXIgdXBvbiBlbnRlcmluZyBtdGtfaGRtaV9i
cmlkZ2VfbW9kZV92YWxpZCgpLCB3aGljaCBoYXBwZW5zIGFzCj4gPiBzb29uIGFzIGEgSERNSSBj
YWJsZSBnZXRzIHBsdWdnZWQgaW4uCj4gPgo+ID4gVG8gZml4IHRoaXMgcmVncmVzc2lvbiwgYWRk
IGEgTlVMTCBwb2ludGVyIGNoZWNrIGZvciBoZG1pLT5jb25mIGluIHRoZQo+ID4gc2FpZCBmdW5j
dGlvbiwgcmVzdG9yaW5nIEhETUkgZnVuY3Rpb25hbGl0eSBhbmQgYXZvaWRpbmcgTlVMTCBwb2lu
dGVyCj4gPiBrZXJuZWwgcGFuaWNzLgo+ID4KPiA+IEZpeGVzOiA0MWNhOWNhYWFlMGIgKCJkcm0v
bWVkaWF0ZWs6IGhkbWk6IEFkZCBjaGVjayBmb3IgQ0VBIG1vZGVzIG9ubHkiKQo+ID4gRml4ZXM6
IGM5MTAyNmE5MzhjMiAoImRybS9tZWRpYXRlazogaGRtaTogQWRkIG9wdGlvbmFsIGxpbWl0IG9u
IG1heGltYWwgSERNSSBtb2RlIGNsb2NrIikKPiA+IFNpZ25lZC1vZmYtYnk6IEFuZ2Vsb0dpb2Fj
Y2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+
Cj4gPiAtLS0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMgfCAxMiAr
KysrKysrLS0tLS0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNSBkZWxl
dGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYwo+ID4gaW5kZXgg
NTgzOGM0NGNiZjZmLi4zMTk2MTg5NDI5YmMgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2hkbWkuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19oZG1pLmMKPiA+IEBAIC0xMjI0LDEyICsxMjI0LDE0IEBAIHN0YXRpYyBpbnQgbXRrX2hk
bWlfYnJpZGdlX21vZGVfdmFsaWQoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwKPiA+ICAgICAg
ICAgICAgICAgICAgICAgICByZXR1cm4gTU9ERV9CQUQ7Cj4gPiAgICAgICB9Cj4gPgo+ID4gLSAg
ICAgaWYgKGhkbWktPmNvbmYtPmNlYV9tb2Rlc19vbmx5ICYmICFkcm1fbWF0Y2hfY2VhX21vZGUo
bW9kZSkpCj4gPiAtICAgICAgICAgICAgIHJldHVybiBNT0RFX0JBRDsKPiA+ICsgICAgIGlmICho
ZG1pLT5jb25mKSB7Cj4gPiArICAgICAgICAgICAgIGlmIChoZG1pLT5jb25mLT5jZWFfbW9kZXNf
b25seSAmJiAhZHJtX21hdGNoX2NlYV9tb2RlKG1vZGUpKQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgIHJldHVybiBNT0RFX0JBRDsKPiA+Cj4gPiAtICAgICBpZiAoaGRtaS0+Y29uZi0+bWF4X21v
ZGVfY2xvY2sgJiYKPiA+IC0gICAgICAgICBtb2RlLT5jbG9jayA+IGhkbWktPmNvbmYtPm1heF9t
b2RlX2Nsb2NrKQo+ID4gLSAgICAgICAgICAgICByZXR1cm4gTU9ERV9DTE9DS19ISUdIOwo+ID4g
KyAgICAgICAgICAgICBpZiAoaGRtaS0+Y29uZi0+bWF4X21vZGVfY2xvY2sgJiYKPiA+ICsgICAg
ICAgICAgICAgICAgIG1vZGUtPmNsb2NrID4gaGRtaS0+Y29uZi0+bWF4X21vZGVfY2xvY2spCj4g
PiArICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIE1PREVfQ0xPQ0tfSElHSDsKPiA+ICsgICAg
IH0KPiA+Cj4gPiAgICAgICBpZiAobW9kZS0+Y2xvY2sgPCAyNzAwMCkKPiA+ICAgICAgICAgICAg
ICAgcmV0dXJuIE1PREVfQ0xPQ0tfTE9XOwo+ID4KPgo+IEhlbGxvLCBmcmllbmRseSBwaW5nIQo+
Cj4gQ2FuIEkgcGxlYXNlIGdldCBhIHJldmlldyAob3IgbWVyZ2UpIG9mIHRoaXMgY29tbWl0Pwo+
Cj4gVGhpcyBpcyBhbiBpbXBvcnRhbnQgZml4IGZvciBhIG51bGwgcG9pbnRlciBLUCBhbmQgcmVz
dG9yZXMgSERNSSBmdW5jdGlvbmFsaXR5LgoKQXBwbGllZCB0byBtZWRpYXRlay1kcm0tZml4ZXMg
WzFdLCB0aGFua3MuCgpbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tl
cm5lbC9naXQvY2h1bmt1YW5nLmh1L2xpbnV4LmdpdC9sb2cvP2g9bWVkaWF0ZWstZHJtLWZpeGVz
CgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKPgo+IFRoYW5rcywKPiAtIEFuZ2VsbwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFp
bGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
