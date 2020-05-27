Return-Path: <SRS0=IT6v=7J=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B65E4C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 May 2020 23:28:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80D2C2084C
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 May 2020 23:28:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eAzkTTpe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="kwd/vg40"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80D2C2084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mYlE7KfcBRhof51jGqk8nLlZqTzynAh6ZKL0UFuIXPk=; b=eAzkTTpep6lAUN
	ir0NxHr36GVLKlde+5GR5NQewohngbDXy3H0ft6gdyrSUV7Oqo7tmupRSIyheL1EmbN6JeAgWnUgl
	76Bk0kVvfAreR02QvwC7mBh2XuzvxXGsz8/o4s/+XzN5LZi89GocrN9Dp3ft/Ykkz+RyMY/jByd4X
	/UFN7odNSMKTjsw4qBB4RGZi8mN/tM6a8uCSnZLGTEAeqm8WMspXlHdrnJ1DjjAwMzz6G7QDp27lz
	HZeNLudiRg/79/V4rtpW5gk6YG8XDQ/UxKRPcvJOhb5jHlFBJ2lKIK78hG23SAgkfwZANmQUJGemr
	kcMYpbldTxxEowLc2aHQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1je5T7-0005Vc-NE; Wed, 27 May 2020 23:28:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1je5Sx-0005On-Vf; Wed, 27 May 2020 23:28:09 +0000
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9F3F1208E4;
 Wed, 27 May 2020 23:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590622086;
 bh=ON8PGesyAn+4FmexUP19mmvqNBZwY/TUXpZfPPF4QJ0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=kwd/vg40MGTNgBlsGgZ1Ns4+sylbYRSUWSNWkKyvF2LP9p7PPuTN74buHh4ysAfUP
 kx3KaoRMpZhdY7tjVPWt3N1iEkG2St95fPYcLkiFUc6rRYsmwUdfCmOhbSkxxLlh5i
 poNDOBeCPqZrqDXH78oVECSagX75utQkwG/6d91Q=
Received: by mail-ej1-f52.google.com with SMTP id d7so30056793eja.7;
 Wed, 27 May 2020 16:28:06 -0700 (PDT)
X-Gm-Message-State: AOAM531cl7QnBSivzAhB7WcbsLsqqmPK+1UlN7sppCBKA0WCooFe/WKn
 GYjz/FzHzaaUfcM9VanIGVez1tw3+79sSUEAZA==
X-Google-Smtp-Source: ABdhPJzcHSIbC4Mtrhld0K/22ZiApP3zop/6GIPFmfLxlHDVkueEoHAc4k/CHn67ZoeNeAdbwomWMXLXwYcLw84+BHU=
X-Received: by 2002:a17:906:bcf8:: with SMTP id
 op24mr635286ejb.260.1590622084979; 
 Wed, 27 May 2020 16:28:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200522101225.62571-1-jitao.shi@mediatek.com>
In-Reply-To: <20200522101225.62571-1-jitao.shi@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 28 May 2020 07:27:51 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8=HvU8p=6xG5_bNHtjXOsQwNAn1zqHF6AmwtOReZ_Xzw@mail.gmail.com>
Message-ID: <CAAOTY_8=HvU8p=6xG5_bNHtjXOsQwNAn1zqHF6AmwtOReZ_Xzw@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: dsi: fix scrolling of panel with small hfp
 or hbp
To: Jitao Shi <jitao.shi@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200527_162808_059146_99D3D9F3 
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 srv_heupstream <srv_heupstream@mediatek.com>, David Airlie <airlied@linux.ie>,
 huijuan.xie@mediatek.com, stonea168@163.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, cawa.cheng@mediatek.com,
 CK Hu <ck.hu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEppdGFvOgoKSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMOW5
tDXmnIgyMuaXpSDpgLHkupQg5LiL5Y2INjoxMuWvq+mBk++8mgo+Cj4gSWYgcGFuZWwgaGFzIHRv
byBzbWFsbCBoZnAgb3IgaGJwLCBob3Jpem9udGFsX2Zyb250cG9yY2hfYnl0ZSBvcgo+IGhvcml6
b250YWxfYmFja3BvcmNoX2J5dGUgbWF5IGJlY29tZSB2ZXJ5IHNtYWxsIHZhbHVlIG9yIG5lZ2F0
aXZlCj4gdmFsdWUuIFRoaXMgcGF0Y2ggYWRqdXN0cyB0aGVpciB2YWx1ZXMgc28gdGhhdCB0aGV5
IGFyZSBncmVhdGVyCj4gdGhhbiBtaW5pbXVtIHZhbHVlIGFuZCBrZWVwIHRvdGFsIG9mIHRoZW0g
dW5jaGFuZ2VkLgo+Cj4gU2lnbmVkLW9mZi1ieTogSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0
ZWsuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIHwgMTgg
KysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspCj4K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyBiL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiBpbmRleCAwZWRlNjk4MzBhOWQuLmFlYmFh
ZmQ5MGNlYiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+IEBAIC0xNDgsNiAr
MTQ4LDkgQEAKPiAgICAgICAgICh0eXBlID09IE1JUElfRFNJX0dFTkVSSUNfUkVBRF9SRVFVRVNU
XzJfUEFSQU0pIHx8IFwKPiAgICAgICAgICh0eXBlID09IE1JUElfRFNJX0RDU19SRUFEKSkKPgo+
ICsjZGVmaW5lIE1JTl9IRlBfQllURSAgICAgICAgICAgMHgwMgo+ICsjZGVmaW5lIE1JTl9IQlBf
QllURSAgICAgICAgICAgMHgwMgo+ICsKPiAgc3RydWN0IG10a19waHlfdGltaW5nIHsKPiAgICAg
ICAgIHUzMiBscHg7Cj4gICAgICAgICB1MzIgZGFfaHNfcHJlcGFyZTsKPiBAQCAtNDUwLDYgKzQ1
Myw3IEBAIHN0YXRpYyB2b2lkIG10a19kc2lfY29uZmlnX3Zkb190aW1pbmcoc3RydWN0IG10a19k
c2kgKmRzaSkKPiAgICAgICAgIHUzMiBob3Jpem9udGFsX3N5bmNfYWN0aXZlX2J5dGU7Cj4gICAg
ICAgICB1MzIgaG9yaXpvbnRhbF9iYWNrcG9yY2hfYnl0ZTsKPiAgICAgICAgIHUzMiBob3Jpem9u
dGFsX2Zyb250cG9yY2hfYnl0ZTsKPiArICAgICAgIHMzMiBzaWduZWRfaGZwX2J5dGUsIHNpZ25l
ZF9oYnBfYnl0ZTsKPiAgICAgICAgIHUzMiBkc2lfdG1wX2J1Zl9icHAsIGRhdGFfcGh5X2N5Y2xl
czsKPiAgICAgICAgIHN0cnVjdCBtdGtfcGh5X3RpbWluZyAqdGltaW5nID0gJmRzaS0+cGh5X3Rp
bWluZzsKPgo+IEBAIC01MTksNiArNTIzLDIwIEBAIHN0YXRpYyB2b2lkIG10a19kc2lfY29uZmln
X3Zkb190aW1pbmcoc3RydWN0IG10a19kc2kgKmRzaSkKPiAgICAgICAgICAgICAgICAgfQo+ICAg
ICAgICAgfQo+Cj4gKyAgICAgICBzaWduZWRfaGZwX2J5dGUgPSAoczMyKWhvcml6b250YWxfZnJv
bnRwb3JjaF9ieXRlOwo+ICsgICAgICAgc2lnbmVkX2hicF9ieXRlID0gKHMzMilob3Jpem9udGFs
X2JhY2twb3JjaF9ieXRlOwo+ICsKPiArICAgICAgIGlmIChzaWduZWRfaGZwX2J5dGUgKyBzaWdu
ZWRfaGJwX2J5dGUgPCBNSU5fSEZQX0JZVEUgKyBNSU5fSEJQX0JZVEUpIHsKPiArICAgICAgICAg
ICAgICAgRFJNX1dBUk4oIkNhbGN1bGF0ZWQgaGZwX2J5dGUgYW5kIGhicF9ieXRlIGFyZSB0b28g
c21hbGwsICIKPiArICAgICAgICAgICAgICAgICAgICAgICAgInBhbmVsIG1heSBub3Qgd29yayBw
cm9wZXJseS5cbiIpOwo+ICsgICAgICAgfSBlbHNlIGlmIChzaWduZWRfaGZwX2J5dGUgPCBNSU5f
SEZQX0JZVEUpIHsKPiArICAgICAgICAgICAgICAgaG9yaXpvbnRhbF9mcm9udHBvcmNoX2J5dGUg
PSBNSU5fSEZQX0JZVEU7Cj4gKyAgICAgICAgICAgICAgIGhvcml6b250YWxfYmFja3BvcmNoX2J5
dGUgLT0gTUlOX0hGUF9CWVRFIC0gc2lnbmVkX2hmcF9ieXRlOwo+ICsgICAgICAgfSBlbHNlIGlm
IChzaWduZWRfaGJwX2J5dGUgPCBNSU5fSEJQX0JZVEUpIHsKPiArICAgICAgICAgICAgICAgaG9y
aXpvbnRhbF9mcm9udHBvcmNoX2J5dGUgLT0gTUlOX0hCUF9CWVRFIC0gc2lnbmVkX2hicF9ieXRl
Owo+ICsgICAgICAgICAgICAgICBob3Jpem9udGFsX2JhY2twb3JjaF9ieXRlID0gTUlOX0hCUF9C
WVRFOwo+ICsgICAgICAgfQo+ICsKCkkgdGhpbmsgaG9yaXpvbnRhbF9mcm9udHBvcmNoX2J5dGUg
d291bGQgbmV2ZXIgYmUgbmVndGl2ZSwgYW5kCmhvcml6b250YWxfYmFja3BvcmNoX2J5dGUgd291
bGQgYmUgbmVndGl2ZSB3aGVuCgogaWYgKGRzaS0+bW9kZV9mbGFncyAmIE1JUElfRFNJX01PREVf
VklERU9fU1lOQ19QVUxTRSkKaG9yaXpvbnRhbF9iYWNrcG9yY2hfYnl0ZSA9Cih2bS0+aGJhY2tf
cG9yY2ggKiBkc2lfdG1wX2J1Zl9icHAgLSAxMCk7CmVsc2UKaG9yaXpvbnRhbF9iYWNrcG9yY2hf
Ynl0ZSA9ICgodm0tPmhiYWNrX3BvcmNoICsgdm0tPmhzeW5jX2xlbikgKgpkc2lfdG1wX2J1Zl9i
cHAgLSAxMCk7CgpJZiB0aGlzIHRpbWUgaXQncyBuZWd0aXZlLCB0aGUgY2FsY3VsYXRpb24gb2YK
aG9yaXpvbnRhbF9mcm9udHBvcmNoX2J5dGUgaXMgc28gc3RyYW5nZS4KSSB0aGluayBwcm9jZXNz
aW5nIG5lZ3RpdmUgdmFsdWUgc2hvdWxkIGJlZm9yZSBoZXJlLgoKUmVnYXJkcywKQ2h1bi1LdWFu
Zy4KCj4gICAgICAgICB3cml0ZWwoaG9yaXpvbnRhbF9zeW5jX2FjdGl2ZV9ieXRlLCBkc2ktPnJl
Z3MgKyBEU0lfSFNBX1dDKTsKPiAgICAgICAgIHdyaXRlbChob3Jpem9udGFsX2JhY2twb3JjaF9i
eXRlLCBkc2ktPnJlZ3MgKyBEU0lfSEJQX1dDKTsKPiAgICAgICAgIHdyaXRlbChob3Jpem9udGFs
X2Zyb250cG9yY2hfYnl0ZSwgZHNpLT5yZWdzICsgRFNJX0hGUF9XQyk7Cj4gLS0KPiAyLjI1LjEK
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4
LW1lZGlhdGVrIG1haWxpbmcgbGlzdAo+IExpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5v
cmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1l
ZGlhdGVrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1l
ZGlhdGVrCg==
