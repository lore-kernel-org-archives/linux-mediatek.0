Return-Path: <SRS0=QG8e=ND=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFF42C432BE
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Aug 2021 00:20:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 822076104F
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Aug 2021 00:20:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 822076104F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HSpGa8QO6qBIj9ZGJqfdZEmel69Fo3vDlmbwsABFKq4=; b=v6EGjgMuyfXVLe
	EbC3nGdN+uE6PT6dsYcsOVno42WYoXwtso7reHGvW9eNFieuCDKCuNEXm7YiN3L3U3aD9bV1Fq4BZ
	+iMNhYepyzs6xPko5c0wbTjvplyf72xi8HbZdLvLiyn8UaJbrVk1SJZj272NwoRCK8TTgBQmNAE2X
	/pIDhsPSjFeWn3pf4syspuXO1BIdmzI3/PTKJacAhGT/Ne4SPk4ncOPs80qEkY5vyOpKO+H+2g0DT
	7BAUMrn/oDtS29FeUgREBN2G+grqP1h9TLiZEjesloOIOJ37DoRcPkVf9m4X/XbPH5zymzPk2As0k
	ih25ff01tOXAfMH9vAMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDySK-008MMd-89; Thu, 12 Aug 2021 00:20:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDyS7-008MKg-FM; Thu, 12 Aug 2021 00:20:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CDF64610A8;
 Thu, 12 Aug 2021 00:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628727606;
 bh=8WwHn/zMxj39QrM8VdRSIm8zdth6Umf39XRXeWVmE6k=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=BPdorrsEj599FTpV2LS39F6Tkr7571nFfRknfLNvvlprN33+Mdmtk2FkntqYaOqT9
 xLaKybLKzih4HlHo05atceeZjxSNlu8GRKunLtv0Vy7MSBt3ZZehXaCqTAYDXKzUBQ
 Q3TtQ9dv+zW/TQv76lpXgVnEKnszkaB5MW1qUP1EmhTQjA0M2Cibm2POPpniTuIlnB
 PRPoRAiIrFUblWwJrrZpoPjv9At7Cnqo7JNagMZn5ikS/M/QqSLAUogbQ3YFVF+xbx
 /3SYgtHKDKew0Ctay6GJfjgMOtbqVniX9ov11YaLOCPp4Kc925XF3m/ssLUqBR/MaL
 JudwvfnNexlYA==
Received: by mail-ed1-f49.google.com with SMTP id n12so6587697edx.8;
 Wed, 11 Aug 2021 17:20:06 -0700 (PDT)
X-Gm-Message-State: AOAM531Wm2iyKtje1voOL7qU+XfIuyciy1zK2tk2271lRALsJ+Bjpkev
 1i5MF4hwBvE05TTpBPrYDX/DyunZ8rKeMbEBSA==
X-Google-Smtp-Source: ABdhPJxKHb7wCRP3M/rwctlj0eB86IcbWXjn8UwsLLYmcTXsasU1mLRWPrWTRtopKhZ4g6A4oAdieVECbfuvx3wokHw=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr2005613edt.219.1628727605357; 
 Wed, 11 Aug 2021 17:20:05 -0700 (PDT)
MIME-Version: 1.0
References: <1628646468-29775-1-git-send-email-yongqiang.niu@mediatek.com>
 <1628646468-29775-2-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1628646468-29775-2-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 12 Aug 2021 08:19:54 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-qigNtPJETHsE8YaVqxctrZ7Y+a31f5eqOVHXPowuucw@mail.gmail.com>
Message-ID: <CAAOTY_-qigNtPJETHsE8YaVqxctrZ7Y+a31f5eqOVHXPowuucw@mail.gmail.com>
Subject: Re: [PATCH v4] drm/mediatek: clear pending flag when cmdq packet is
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
X-CRM114-CacheID: sfid-20210811_172007_592155_7020109A 
X-CRM114-Status: GOOD (  16.96  )
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
PiDmlrwgMjAyMeW5tDjmnIgxMeaXpSDpgLHkuIkg5LiK5Y2IOTo0OOWvq+mBk++8mgo+Cj4gSW4g
Y21kcSBtb2RlLCBwYWNrZXQgbWF5IGJlIGZsdXNoZWQgYmVmb3JlIGl0IGlzIGV4ZWN1dGVkLCBz
bwo+IHRoZSBwZW5kaW5nIGZsYWcgc2hvdWxkIGJlIGNsZWFyZWQgYWZ0ZXIgY21kcSBwYWNrZXQg
aXMgZG9uZS4KCkFwcGxpZWQgdG8gbWVkaWF0ZWstZHJtLW5leHQgWzFdLCB0aGFua3MuCgpbMV0g
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvY2h1bmt1YW5n
Lmh1L2xpbnV4LmdpdC9sb2cvP2g9bWVkaWF0ZWstZHJtLW5leHQKClJlZ2FyZHMsCkNodW4tS3Vh
bmcuCgo+Cj4gU2lnbmVkLW9mZi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRp
YXRlay5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMu
YyB8IDQ3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgNDIgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RybV9jcnRjLmMKPiBpbmRleCA0YzI1ZTMzLi44OWYwOTNkIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYwo+IEBAIC0yNjcsNiArMjY3LDM2IEBA
IHN0YXRpYyB2b2lkIGRkcF9jbWRxX2NiKHN0cnVjdCBtYm94X2NsaWVudCAqY2wsIHZvaWQgKm1z
c2cpCj4gIHsKPiAgICAgICAgIHN0cnVjdCBtdGtfZHJtX2NydGMgKm10a19jcnRjID0gY29udGFp
bmVyX29mKGNsLCBzdHJ1Y3QgbXRrX2RybV9jcnRjLCBjbWRxX2NsKTsKPiAgICAgICAgIHN0cnVj
dCBjbWRxX2NiX2RhdGEgKmRhdGEgPSBtc3NnOwo+ICsgICAgICAgc3RydWN0IG10a19jcnRjX3N0
YXRlICpzdGF0ZTsKPiArICAgICAgIHVuc2lnbmVkIGludCBpOwo+ICsKPiArICAgICAgIHN0YXRl
ID0gdG9fbXRrX2NydGNfc3RhdGUobXRrX2NydGMtPmJhc2Uuc3RhdGUpOwo+ICsKPiArICAgICAg
IHN0YXRlLT5wZW5kaW5nX2NvbmZpZyA9IGZhbHNlOwo+ICsKPiArICAgICAgIGlmIChtdGtfY3J0
Yy0+cGVuZGluZ19wbGFuZXMpIHsKPiArICAgICAgICAgICAgICAgZm9yIChpID0gMDsgaSA8IG10
a19jcnRjLT5sYXllcl9ucjsgaSsrKSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0
IGRybV9wbGFuZSAqcGxhbmUgPSAmbXRrX2NydGMtPnBsYW5lc1tpXTsKPiArICAgICAgICAgICAg
ICAgICAgICAgICBzdHJ1Y3QgbXRrX3BsYW5lX3N0YXRlICpwbGFuZV9zdGF0ZTsKPiArCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgcGxhbmVfc3RhdGUgPSB0b19tdGtfcGxhbmVfc3RhdGUocGxh
bmUtPnN0YXRlKTsKPiArCj4gKyAgICAgICAgICAgICAgICAgICAgICAgcGxhbmVfc3RhdGUtPnBl
bmRpbmcuY29uZmlnID0gZmFsc2U7Cj4gKyAgICAgICAgICAgICAgIH0KPiArICAgICAgICAgICAg
ICAgbXRrX2NydGMtPnBlbmRpbmdfcGxhbmVzID0gZmFsc2U7Cj4gKyAgICAgICB9Cj4gKwo+ICsg
ICAgICAgaWYgKG10a19jcnRjLT5wZW5kaW5nX2FzeW5jX3BsYW5lcykgewo+ICsgICAgICAgICAg
ICAgICBmb3IgKGkgPSAwOyBpIDwgbXRrX2NydGMtPmxheWVyX25yOyBpKyspIHsKPiArICAgICAg
ICAgICAgICAgICAgICAgICBzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSA9ICZtdGtfY3J0Yy0+cGxh
bmVzW2ldOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBtdGtfcGxhbmVfc3RhdGUg
KnBsYW5lX3N0YXRlOwo+ICsKPiArICAgICAgICAgICAgICAgICAgICAgICBwbGFuZV9zdGF0ZSA9
IHRvX210a19wbGFuZV9zdGF0ZShwbGFuZS0+c3RhdGUpOwo+ICsKPiArICAgICAgICAgICAgICAg
ICAgICAgICBwbGFuZV9zdGF0ZS0+cGVuZGluZy5hc3luY19jb25maWcgPSBmYWxzZTsKPiArICAg
ICAgICAgICAgICAgfQo+ICsgICAgICAgICAgICAgICBtdGtfY3J0Yy0+cGVuZGluZ19hc3luY19w
bGFuZXMgPSBmYWxzZTsKPiArICAgICAgIH0KPgo+ICAgICAgICAgbXRrX2NydGMtPmNtZHFfdmJs
YW5rX2NudCA9IDA7Cj4gICAgICAgICBtdGtfZHJtX2NtZHFfcGt0X2Rlc3Ryb3kobXRrX2NydGMt
PmNtZHFfY2hhbiwgZGF0YS0+cGt0KTsKPiBAQCAtNDIzLDcgKzQ1Myw4IEBAIHN0YXRpYyB2b2lk
IG10a19jcnRjX2RkcF9jb25maWcoc3RydWN0IGRybV9jcnRjICpjcnRjLAo+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHN0YXRlLT5wZW5kaW5nX3ZyZWZyZXNoLCAwLAo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNtZHFfaGFuZGxlKTsKPgo+IC0gICAg
ICAgICAgICAgICBzdGF0ZS0+cGVuZGluZ19jb25maWcgPSBmYWxzZTsKPiArICAgICAgICAgICAg
ICAgaWYgKCFjbWRxX2hhbmRsZSkKPiArICAgICAgICAgICAgICAgICAgICAgICBzdGF0ZS0+cGVu
ZGluZ19jb25maWcgPSBmYWxzZTsKPiAgICAgICAgIH0KPgo+ICAgICAgICAgaWYgKG10a19jcnRj
LT5wZW5kaW5nX3BsYW5lcykgewo+IEBAIC00NDMsOSArNDc0LDEyIEBAIHN0YXRpYyB2b2lkIG10
a19jcnRjX2RkcF9jb25maWcoc3RydWN0IGRybV9jcnRjICpjcnRjLAo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgbXRrX2RkcF9jb21wX2xheWVyX2NvbmZpZyhjb21wLCBsb2NhbF9s
YXllciwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcGxhbmVfc3RhdGUsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGNtZHFfaGFuZGxlKTsKPiAtICAgICAgICAgICAgICAg
ICAgICAgICBwbGFuZV9zdGF0ZS0+cGVuZGluZy5jb25maWcgPSBmYWxzZTsKPiArICAgICAgICAg
ICAgICAgICAgICAgICBpZiAoIWNtZHFfaGFuZGxlKQo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcGxhbmVfc3RhdGUtPnBlbmRpbmcuY29uZmlnID0gZmFsc2U7Cj4gICAgICAgICAg
ICAgICAgIH0KPiAtICAgICAgICAgICAgICAgbXRrX2NydGMtPnBlbmRpbmdfcGxhbmVzID0gZmFs
c2U7Cj4gKwo+ICsgICAgICAgICAgICAgICBpZiAoIWNtZHFfaGFuZGxlKQo+ICsgICAgICAgICAg
ICAgICAgICAgICAgIG10a19jcnRjLT5wZW5kaW5nX3BsYW5lcyA9IGZhbHNlOwo+ICAgICAgICAg
fQo+Cj4gICAgICAgICBpZiAobXRrX2NydGMtPnBlbmRpbmdfYXN5bmNfcGxhbmVzKSB7Cj4gQEAg
LTQ2NSw5ICs0OTksMTIgQEAgc3RhdGljIHZvaWQgbXRrX2NydGNfZGRwX2NvbmZpZyhzdHJ1Y3Qg
ZHJtX2NydGMgKmNydGMsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtdGtfZGRw
X2NvbXBfbGF5ZXJfY29uZmlnKGNvbXAsIGxvY2FsX2xheWVyLAo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwbGFuZV9zdGF0ZSwKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Y21kcV9oYW5kbGUpOwo+IC0gICAgICAgICAgICAgICAgICAgICAgIHBsYW5lX3N0YXRlLT5wZW5k
aW5nLmFzeW5jX2NvbmZpZyA9IGZhbHNlOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGlmICgh
Y21kcV9oYW5kbGUpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwbGFuZV9zdGF0
ZS0+cGVuZGluZy5hc3luY19jb25maWcgPSBmYWxzZTsKPiAgICAgICAgICAgICAgICAgfQo+IC0g
ICAgICAgICAgICAgICBtdGtfY3J0Yy0+cGVuZGluZ19hc3luY19wbGFuZXMgPSBmYWxzZTsKPiAr
Cj4gKyAgICAgICAgICAgICAgIGlmICghY21kcV9oYW5kbGUpCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgbXRrX2NydGMtPnBlbmRpbmdfYXN5bmNfcGxhbmVzID0gZmFsc2U7Cj4gICAgICAgICB9
Cj4gIH0KPgo+IC0tCj4gMS44LjEuMS5kaXJ0eQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgt
bWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
