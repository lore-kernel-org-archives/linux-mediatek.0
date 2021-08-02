Return-Path: <SRS0=Q+Xe=MZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45770C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 23:17:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2D5A60725
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 23:17:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F2D5A60725
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qa2zcUmcMmFDasf8ZEEXMKDpADHARl5AUDEe1xv2erc=; b=iTSRJBcHRNPH/i
	AymbkwFINZGKfADuSdwN4whNcCTRFmogOXMQLsdBBJf+qNh6XN0Ix4ivVvdXphzxsIbGwVwYjYeis
	w5KuAi9IHu34bJ2WzfAMnMDyZR1qqu94dyW58UxYClC+QzwMDYCSUs33CFcYjRUJpkcADt3pydShL
	r0uz9+R9G2Eq/wE0UI2FRdT40sMZFi+HkWssIQbDmH9gmygHhyLLd195+WyhX7o7QYEQ1yaQSC95Y
	SG7ynQCH37zESSSXE2HOawe03gari2a/SakZAwHAU17nqXI7V71hZBN79xKUnAm5dsP3wK+bCiCQP
	OvJwmlI3l8RCnm7LfDsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAhAv-000ZMj-Qp; Mon, 02 Aug 2021 23:16:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAhAi-000ZCb-A9; Mon, 02 Aug 2021 23:16:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B682860EE6;
 Mon,  2 Aug 2021 23:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627946195;
 bh=0CE6qR/gop+OdKgxD/k5bSNptqvMl6JQUMWiGm6+tfw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=JL0zMLYdH8Ohwr0tKC+IKekf9Qbx/szIeRH9N8fqiDCVhLUwEpH0OaP2BmrUBBOMe
 J3d2gpr0JPj+pzFs3AWElm9jmuiqcZnxjHChKTXJAQWwlWelFoGHHNcIj/UBCcLnlB
 h+/MMl4u+SZq16NuI3C67q2HZweSwyOitqWIgJD4HZT4Pqc+pJPJqABOSeKxHrUCDM
 UlgJqUlXToOjoMEgH6wjA7bNQI2Kc+VnewJDgfZWG6m3nFPYTIICwkoTRuYHNTfKLJ
 UtRDwZ81YzKbbrKn4oTHVbrTX8+pRytq8MdWuHIh/97vwkaZJ75slHtGja2GXC0iCN
 pDLNuM01n7y5A==
Received: by mail-ed1-f53.google.com with SMTP id ec13so26146802edb.0;
 Mon, 02 Aug 2021 16:16:35 -0700 (PDT)
X-Gm-Message-State: AOAM532AgTCfLeL1uGPVZdnrCYvNml3G3UEMzEKcU+XDexmAkqNDIgB7
 OeGPwq1iM4TXOy7e6+UAqYdSUSiH6isY0pfcsg==
X-Google-Smtp-Source: ABdhPJxJAhueT9lDCmD6Pnv55JDItfMv10i4eCO+yqwvWYDC+oNsWVEH5yVZqBJ6i6TEgSsxIe1LvfnoD9+mHDpuKCw=
X-Received: by 2002:aa7:c6d3:: with SMTP id b19mr21633222eds.303.1627946194379; 
 Mon, 02 Aug 2021 16:16:34 -0700 (PDT)
MIME-Version: 1.0
References: <1627888227-5757-1-git-send-email-yongqiang.niu@mediatek.com>
 <1627888227-5757-2-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1627888227-5757-2-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 3 Aug 2021 07:16:23 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-7MNrO5my3_9EAeSVxtsVC-dGTZH31tph9TpY3faAdwQ@mail.gmail.com>
Message-ID: <CAAOTY_-7MNrO5my3_9EAeSVxtsVC-dGTZH31tph9TpY3faAdwQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm/mediatek: clear pending flag when cmdq packet is
 done.
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Fabien Parent <fparent@baylibre.com>, 
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 DTML <devicetree@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Hsin-Yi Wang <hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_161636_422697_A0F75BB2 
X-CRM114-Status: GOOD (  18.42  )
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

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMeW5tDjmnIgy5pelIOmAseS4gCDkuIvljYgzOjEx5a+r6YGT77yaCj4KPiBJbiBj
bWRxIG1vZGUsIHBhY2tldCBtYXkgYmUgZmx1c2hlZCBiZWZvcmUgaXQgaXMgZXhlY3V0ZWQsIHNv
Cj4gdGhlIHBlbmRpbmcgZmxhZyBzaG91bGQgYmUgY2xlYXJlZCBhZnRlciBjbWRxIHBhY2tldCBp
cyBkb25lLgo+Cj4gU2lnbmVkLW9mZi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBt
ZWRpYXRlay5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Ny
dGMuYyB8IDUxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLQo+ICAxIGZpbGUgY2hh
bmdlZCwgNDYgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMKPiBpbmRleCA0YzI1ZTMzLi4yYTJkNDNlIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYwo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYwo+IEBAIC0yNjcsNiArMjY3LDQw
IEBAIHN0YXRpYyB2b2lkIGRkcF9jbWRxX2NiKHN0cnVjdCBtYm94X2NsaWVudCAqY2wsIHZvaWQg
Km1zc2cpCj4gIHsKPiAgICAgICAgIHN0cnVjdCBtdGtfZHJtX2NydGMgKm10a19jcnRjID0gY29u
dGFpbmVyX29mKGNsLCBzdHJ1Y3QgbXRrX2RybV9jcnRjLCBjbWRxX2NsKTsKPiAgICAgICAgIHN0
cnVjdCBjbWRxX2NiX2RhdGEgKmRhdGEgPSBtc3NnOwo+ICsgICAgICAgc3RydWN0IG10a19jcnRj
X3N0YXRlICpzdGF0ZTsKPiArICAgICAgIHVuc2lnbmVkIGludCBpOwo+ICsKPiArICAgICAgIHN0
YXRlID0gdG9fbXRrX2NydGNfc3RhdGUobXRrX2NydGMtPmJhc2Uuc3RhdGUpOwo+ICsKPiArICAg
ICAgIGlmIChzdGF0ZS0+cGVuZGluZ19jb25maWcpIHsKCk5vIG1hdHRlciBwZW5kaW5nX2NvbmZp
ZyBpcyB0cnVlIG9yIG5vdCwgaXQgd291bGQgYmUgZmFsc2UgYWZ0ZXIgdGhpcy4KU28gd2UgY291
bGQgc2ltcGx5IGRyb3AgdGhpcyBjaGVja2luZy4KCj4gKyAgICAgICAgICAgICAgIHN0YXRlLT5w
ZW5kaW5nX2NvbmZpZyA9IGZhbHNlOwo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIGlmIChtdGtf
Y3J0Yy0+cGVuZGluZ19wbGFuZXMpIHsKPiArICAgICAgICAgICAgICAgZm9yIChpID0gMDsgaSA8
IG10a19jcnRjLT5sYXllcl9ucjsgaSsrKSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgc3Ry
dWN0IGRybV9wbGFuZSAqcGxhbmUgPSAmbXRrX2NydGMtPnBsYW5lc1tpXTsKPiArICAgICAgICAg
ICAgICAgICAgICAgICBzdHJ1Y3QgbXRrX3BsYW5lX3N0YXRlICpwbGFuZV9zdGF0ZTsKPiArCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgcGxhbmVfc3RhdGUgPSB0b19tdGtfcGxhbmVfc3RhdGUo
cGxhbmUtPnN0YXRlKTsKPiArCj4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKHBsYW5lX3N0
YXRlLT5wZW5kaW5nLmNvbmZpZykKCkRpdHRvLgoKPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHBsYW5lX3N0YXRlLT5wZW5kaW5nLmNvbmZpZyA9IGZhbHNlOwo+ICsgICAgICAgICAg
ICAgICB9Cj4gKyAgICAgICAgICAgICAgIG10a19jcnRjLT5wZW5kaW5nX3BsYW5lcyA9IGZhbHNl
Owo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIGlmIChtdGtfY3J0Yy0+cGVuZGluZ19hc3luY19w
bGFuZXMpIHsKPiArICAgICAgICAgICAgICAgZm9yIChpID0gMDsgaSA8IG10a19jcnRjLT5sYXll
cl9ucjsgaSsrKSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGRybV9wbGFuZSAq
cGxhbmUgPSAmbXRrX2NydGMtPnBsYW5lc1tpXTsKPiArICAgICAgICAgICAgICAgICAgICAgICBz
dHJ1Y3QgbXRrX3BsYW5lX3N0YXRlICpwbGFuZV9zdGF0ZTsKPiArCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgcGxhbmVfc3RhdGUgPSB0b19tdGtfcGxhbmVfc3RhdGUocGxhbmUtPnN0YXRlKTsK
PiArCj4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKHBsYW5lX3N0YXRlLT5wZW5kaW5nLmFz
eW5jX2NvbmZpZykKCkRpdHRvLgoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBwbGFuZV9zdGF0ZS0+cGVuZGluZy5hc3luY19jb25maWcgPSBm
YWxzZTsKPiArICAgICAgICAgICAgICAgfQo+ICsgICAgICAgICAgICAgICBtdGtfY3J0Yy0+cGVu
ZGluZ19hc3luY19wbGFuZXMgPSBmYWxzZTsKPiArICAgICAgIH0KPgo+ICAgICAgICAgbXRrX2Ny
dGMtPmNtZHFfdmJsYW5rX2NudCA9IDA7Cj4gICAgICAgICBtdGtfZHJtX2NtZHFfcGt0X2Rlc3Ry
b3kobXRrX2NydGMtPmNtZHFfY2hhbiwgZGF0YS0+cGt0KTsKPiBAQCAtNDIzLDcgKzQ1Nyw4IEBA
IHN0YXRpYyB2b2lkIG10a19jcnRjX2RkcF9jb25maWcoc3RydWN0IGRybV9jcnRjICpjcnRjLAo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0YXRlLT5wZW5kaW5nX3ZyZWZy
ZXNoLCAwLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNtZHFfaGFuZGxl
KTsKPgo+IC0gICAgICAgICAgICAgICBzdGF0ZS0+cGVuZGluZ19jb25maWcgPSBmYWxzZTsKPiAr
ICAgICAgICAgICAgICAgaWYgKCFjbWRxX2hhbmRsZSkKPiArICAgICAgICAgICAgICAgICAgICAg
ICBzdGF0ZS0+cGVuZGluZ19jb25maWcgPSBmYWxzZTsKPiAgICAgICAgIH0KPgo+ICAgICAgICAg
aWYgKG10a19jcnRjLT5wZW5kaW5nX3BsYW5lcykgewo+IEBAIC00NDMsOSArNDc4LDEyIEBAIHN0
YXRpYyB2b2lkIG10a19jcnRjX2RkcF9jb25maWcoc3RydWN0IGRybV9jcnRjICpjcnRjLAo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbXRrX2RkcF9jb21wX2xheWVyX2NvbmZpZyhj
b21wLCBsb2NhbF9sYXllciwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcGxhbmVfc3RhdGUsCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNtZHFfaGFuZGxlKTsKPiAtICAg
ICAgICAgICAgICAgICAgICAgICBwbGFuZV9zdGF0ZS0+cGVuZGluZy5jb25maWcgPSBmYWxzZTsK
PiArICAgICAgICAgICAgICAgICAgICAgICBpZiAoIWNtZHFfaGFuZGxlKQo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcGxhbmVfc3RhdGUtPnBlbmRpbmcuY29uZmlnID0gZmFsc2U7
Cj4gICAgICAgICAgICAgICAgIH0KPiAtICAgICAgICAgICAgICAgbXRrX2NydGMtPnBlbmRpbmdf
cGxhbmVzID0gZmFsc2U7Cj4gKwo+ICsgICAgICAgICAgICAgICBpZiAoIWNtZHFfaGFuZGxlKQo+
ICsgICAgICAgICAgICAgICAgICAgICAgIG10a19jcnRjLT5wZW5kaW5nX3BsYW5lcyA9IGZhbHNl
Owo+ICAgICAgICAgfQo+Cj4gICAgICAgICBpZiAobXRrX2NydGMtPnBlbmRpbmdfYXN5bmNfcGxh
bmVzKSB7Cj4gQEAgLTQ2NSw5ICs1MDMsMTIgQEAgc3RhdGljIHZvaWQgbXRrX2NydGNfZGRwX2Nv
bmZpZyhzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBtdGtfZGRwX2NvbXBfbGF5ZXJfY29uZmlnKGNvbXAsIGxvY2FsX2xheWVyLAo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwbGFu
ZV9zdGF0ZSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgY21kcV9oYW5kbGUpOwo+IC0gICAgICAgICAgICAgICAgICAgICAgIHBsYW5l
X3N0YXRlLT5wZW5kaW5nLmFzeW5jX2NvbmZpZyA9IGZhbHNlOwo+ICsgICAgICAgICAgICAgICAg
ICAgICAgIGlmICghY21kcV9oYW5kbGUpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBwbGFuZV9zdGF0ZS0+cGVuZGluZy5hc3luY19jb25maWcgPSBmYWxzZTsKPiAgICAgICAgICAg
ICAgICAgfQo+IC0gICAgICAgICAgICAgICBtdGtfY3J0Yy0+cGVuZGluZ19hc3luY19wbGFuZXMg
PSBmYWxzZTsKPiArCj4gKyAgICAgICAgICAgICAgIGlmICghY21kcV9oYW5kbGUpCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgbXRrX2NydGMtPnBlbmRpbmdfYXN5bmNfcGxhbmVzID0gZmFsc2U7
Cj4gICAgICAgICB9Cj4gIH0KPgo+IC0tCj4gMS44LjEuMS5kaXJ0eQo+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5n
IGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
