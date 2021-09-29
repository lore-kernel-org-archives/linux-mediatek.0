Return-Path: <SRS0=h0C2=OT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26809C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Sep 2021 15:00:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE5A6613CE
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Sep 2021 15:00:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DE5A6613CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hHO3TOmFXes8r9OdKF6DSXlK6EmGBqSfhRGfz+IWtf4=; b=v7fA2nD/47XGhd
	VWVkgZGLAOxYr7zUeF7tXWeeBlXLrxX7U+ckG5+oGBUmYeCtrfjITijEmX6EkWedaCpO6KnicMidf
	cIbIzviTwGzkJ+QrdGT5yeNvugxbfK5fq8w1omd6FiSu4GurX0fYJQEU2RDanaYPfv7leib8vn8Vp
	CVGwRWIIGEVjvVn5wet1FF6F9AecfSn5hjl2NCNNAsGO8ImE6IcKndXVbPKDtOpFUZEjkJv2KWWC1
	5Tehh3q+RzdBl+/l7Mj6HMrj9V3nY6+d21qnOkgM3CMyHVx3eT9Uhk6j/1GwUhBB29Jd/TrLc5kir
	Abi60OX5ga1X4p5ucfUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVb3t-00BRbl-Eq; Wed, 29 Sep 2021 14:59:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVb3Z-00BRTF-Ui; Wed, 29 Sep 2021 14:59:39 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8FFA7613D3;
 Wed, 29 Sep 2021 14:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632927577;
 bh=fk2MhdHw89PM9OnTQ22OUkjvEi2mid5QuP4EjsFGyks=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=TQyJoL5EaRAUHMby2aLzPXvZS0oL1b0nGYcWOQTYjshQ9FAnFGwtcZcFJZMIj0G4/
 9xFuXJIj+7oloOB0Bz93My2aaCx/KSIu57qg/2YaYfrTebB8ZnszHld4ZSFft0dG0X
 9adWQ0OBN+MX6zHJFRci4LN17p7FdOLujivXljES+OmfliCXpQ0vhQikCwF2wiW+mw
 0+W+SQApB0gKnfQoMvgoVCWSjrhCNLR1rdsKIR7AnRRVNnfllp9OLjOQrzPigooD+W
 DnsCdlCbOO9uGmtT1Iq+gBaX20MIZAug2UDbILnlzDbpdWBQImy7eb2sf1/R53hW21
 87FWiOZhYq+dw==
Received: by mail-ed1-f45.google.com with SMTP id x7so9579919edd.6;
 Wed, 29 Sep 2021 07:59:37 -0700 (PDT)
X-Gm-Message-State: AOAM533be6KqzTW6PJ9xFLUEKYWdw2bxjK93Q/VrvHtgsnpo55RbLyGQ
 SsQCUVmTGo3NkIqzvAk+YFW3Pn3mBXKptLQ6cA==
X-Google-Smtp-Source: ABdhPJwCGdIq+oqx27NfXCSPDAUfJueMf8gUKcQgTqgUAMZrpdXWe4oipBNxHCQTw6eESlV9N3bkv12WqrTgIBYJt8c=
X-Received: by 2002:a17:906:26c4:: with SMTP id
 u4mr118869ejc.511.1632927500166; 
 Wed, 29 Sep 2021 07:58:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210915223117.7857-1-jitao.shi@mediatek.com>
 <20210915223117.7857-3-jitao.shi@mediatek.com>
In-Reply-To: <20210915223117.7857-3-jitao.shi@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 29 Sep 2021 22:58:09 +0800
X-Gmail-Original-Message-ID: <CAAOTY__ayWfcqsVsyMun-_jX_Po_AiHfpiuTJAkEaeRYq902MQ@mail.gmail.com>
Message-ID: <CAAOTY__ayWfcqsVsyMun-_jX_Po_AiHfpiuTJAkEaeRYq902MQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] drm/mediatek: implment the dsi hs packets aligned
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
 Rex-BC Chen <rex-bc.chen@mediatek.com>, shuijing.li@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_075938_058534_70C7F1FE 
X-CRM114-Status: GOOD (  16.10  )
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

SGksIEppdGFvOgoKSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMeW5
tDnmnIgxNuaXpSDpgLHlm5sg5LiK5Y2INjozMeWvq+mBk++8mgo+Cj4gU29tZSBkc2kgZGV2aWNl
cyByZXF1aXJlIHRoZSBwYWNrZXRzIG9uIGxhbmVzIGFsaWduZWQgYXQgdGhlIGVuZCwKPiBvciB0
aGUgc2NyZWVuIHdpbGwgc2hpZnQgb3Igc2Nyb2xsLgoKUmV2aWV3ZWQtYnk6IENodW4tS3Vhbmcg
SHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgoKPgo+IFNpZ25lZC1vZmYtYnk6IEppdGFvIFNo
aSA8aml0YW8uc2hpQG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kc2kuYyB8IDEwICsrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2Vy
dGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rz
aS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+IGluZGV4IDkzYjQwYzI0
NWYwMC4uOWQ3MmU2ZGNlMGJmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHNpLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCj4g
QEAgLTE5NCw2ICsxOTQsOCBAQCBzdHJ1Y3QgbXRrX2RzaSB7Cj4gICAgICAgICBzdHJ1Y3QgY2xr
ICpoc19jbGs7Cj4KPiAgICAgICAgIHUzMiBkYXRhX3JhdGU7Cj4gKyAgICAgICAvKiBmb3JjZSBk
c2kgbGluZSBlbmQgd2l0aG91dCBkc2lfbnVsbCBkYXRhICovCj4gKyAgICAgICBib29sIGhzX3Bh
Y2tldF9lbmRfYWxpZ25lZDsKPgo+ICAgICAgICAgdW5zaWduZWQgbG9uZyBtb2RlX2ZsYWdzOwo+
ICAgICAgICAgZW51bSBtaXBpX2RzaV9waXhlbF9mb3JtYXQgZm9ybWF0Owo+IEBAIC00OTksNiAr
NTAxLDEzIEBAIHN0YXRpYyB2b2lkIG10a19kc2lfY29uZmlnX3Zkb190aW1pbmcoc3RydWN0IG10
a19kc2kgKmRzaSkKPiAgICAgICAgICAgICAgICAgRFJNX1dBUk4oIkhGUCArIEhCUCBsZXNzIHRo
YW4gZC1waHksIEZQUyB3aWxsIHVuZGVyIDYwSHpcbiIpOwo+ICAgICAgICAgfQo+Cj4gKyAgICAg
ICBpZiAoZHNpLT5oc19wYWNrZXRfZW5kX2FsaWduZWQpIHsKPiArICAgICAgICAgICAgICAgaG9y
aXpvbnRhbF9zeW5jX2FjdGl2ZV9ieXRlID0gcm91bmR1cChob3Jpem9udGFsX3N5bmNfYWN0aXZl
X2J5dGUsIGRzaS0+bGFuZXMpIC0gMjsKPiArICAgICAgICAgICAgICAgaG9yaXpvbnRhbF9mcm9u
dHBvcmNoX2J5dGUgPSByb3VuZHVwKGhvcml6b250YWxfZnJvbnRwb3JjaF9ieXRlLCBkc2ktPmxh
bmVzKSAtIDI7Cj4gKyAgICAgICAgICAgICAgIGhvcml6b250YWxfYmFja3BvcmNoX2J5dGUgPSBy
b3VuZHVwKGhvcml6b250YWxfYmFja3BvcmNoX2J5dGUsIGRzaS0+bGFuZXMpIC0gMjsKPiArICAg
ICAgICAgICAgICAgaG9yaXpvbnRhbF9iYWNrcG9yY2hfYnl0ZSAtPSAodm0tPmhhY3RpdmUgKiBk
c2lfdG1wX2J1Zl9icHAgKyAyKSAlIGRzaS0+bGFuZXM7Cj4gKyAgICAgICB9Cj4gKwo+ICAgICAg
ICAgd3JpdGVsKGhvcml6b250YWxfc3luY19hY3RpdmVfYnl0ZSwgZHNpLT5yZWdzICsgRFNJX0hT
QV9XQyk7Cj4gICAgICAgICB3cml0ZWwoaG9yaXpvbnRhbF9iYWNrcG9yY2hfYnl0ZSwgZHNpLT5y
ZWdzICsgRFNJX0hCUF9XQyk7Cj4gICAgICAgICB3cml0ZWwoaG9yaXpvbnRhbF9mcm9udHBvcmNo
X2J5dGUsIGRzaS0+cmVncyArIERTSV9IRlBfV0MpOwo+IEBAIC03OTMsNiArODAyLDcgQEAgc3Rh
dGljIGludCBtdGtfZHNpX2hvc3RfYXR0YWNoKHN0cnVjdCBtaXBpX2RzaV9ob3N0ICpob3N0LAo+
ICAgICAgICAgZHNpLT5sYW5lcyA9IGRldmljZS0+bGFuZXM7Cj4gICAgICAgICBkc2ktPmZvcm1h
dCA9IGRldmljZS0+Zm9ybWF0Owo+ICAgICAgICAgZHNpLT5tb2RlX2ZsYWdzID0gZGV2aWNlLT5t
b2RlX2ZsYWdzOwo+ICsgICAgICAgZHNpLT5oc19wYWNrZXRfZW5kX2FsaWduZWQgPSBkZXZpY2Ut
PmhzX3BhY2tldF9lbmRfYWxpZ25lZDsKPgo+ICAgICAgICAgcmV0dXJuIDA7Cj4gIH0KPiAtLQo+
IDIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
ZWRpYXRlawo=
