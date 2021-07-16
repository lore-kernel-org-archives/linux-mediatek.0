Return-Path: <SRS0=t3QX=MI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46E2CC636CE
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 16:43:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7EA161400
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 16:43:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7EA161400
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jf8lDGFG9EF26J5Bz5k5JhepDabzT/gNfaRsv1fvHJU=; b=Qwx0MSXTFmjD/1
	Bn/swJYKa+6+au3+qsrTPQSCl5JzMQYXePy89y613GYdtULNlSNXDZqsUNwbcz5jLOPgifCrS1wz1
	HMP95cxZnCW4iYyMDI7t93tcWJBC8lGpCxSNLFOphYFsQKcthSeF9s2fIPgdndGsD1gcJr4y1c4EP
	6UqRWKESTO+FrnoQq17TxUt/xybKiedavG+uw5/n6wPsnIslZuuWSovK3oknO8MWu724etCOB/B87
	O1mpLoBsiQDbmBnNBWG4T2uZMSDwj6HZt5DBVPYbkrfTo6mDQdeD8vdSSOFHTKAQKD0XPBFDF+AWu
	rF0UxQtaHBErxfZMwm6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4Qve-004u4k-ST; Fri, 16 Jul 2021 16:43:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4QvQ-004u1b-Gy; Fri, 16 Jul 2021 16:42:57 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2A61A613F1;
 Fri, 16 Jul 2021 16:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626453776;
 bh=iyvboBbJB24fM/KsyAy5OW3yngHgd2gk9Z7P8CwT2uQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=BqWFxgtf2F90LRIp3skiNIGRSj9fbCyS/B5EneSGMlCDMjZzXsA3K4x3sYhcZKduJ
 0Y1Je2sxlFdrU7lgi2JhXQ61+2LPmn/B9Pi+k+iK57R+3qzlnDzyPbBW0K4it149Hi
 xLOK7Bng3RL9dyJtTbKwMq0onxIFdHwuQZpW4+OyghyT+eT9dvPYV9qTMZyBfAOO1+
 C27QrYhbrCiuxuJ3sa7PFS7iRwifeGGzGUDFFv+r2pYvlfWIoONcc2OraRS4l2QVW/
 aheSxDUJ4Zwx58GZmR/p+mSKqNw2P2Stgy2F0/NQhyETJsz5v8VYoz2cYRAIfxvhWI
 lbf2D/XbMnaTQ==
Received: by mail-ed1-f42.google.com with SMTP id x17so13703770edd.12;
 Fri, 16 Jul 2021 09:42:56 -0700 (PDT)
X-Gm-Message-State: AOAM530k2Pn5qHp0ljSgpajl2pCAXZm9A4nmspFKHvb2mxmnzmZsvgGL
 7qYoAKRIMMq+KKWg3ascL0uYEoGMW0AUNQkTMw==
X-Google-Smtp-Source: ABdhPJxTUG7dBNjzKlgl2NjPeLK61EE68JCSroh9Re1GaEepDQbfq2+PN9sWPI3SzPvcfAVEylqryt0r4BYXQEWqlYc=
X-Received: by 2002:aa7:da06:: with SMTP id r6mr16153573eds.38.1626453774729; 
 Fri, 16 Jul 2021 09:42:54 -0700 (PDT)
MIME-Version: 1.0
References: <1626418701-28467-1-git-send-email-yongqiang.niu@mediatek.com>
 <1626418701-28467-2-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1626418701-28467-2-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 17 Jul 2021 00:42:43 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8eoz=TaXxT8hbyyEWow2CO1bv9ceEHmY5J5oAwDTtrUg@mail.gmail.com>
Message-ID: <CAAOTY_8eoz=TaXxT8hbyyEWow2CO1bv9ceEHmY5J5oAwDTtrUg@mail.gmail.com>
Subject: Re: [PATCH v1] mailbox: cmdq: add instruction time-out interrupt
 support
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
X-CRM114-CacheID: sfid-20210716_094256_633889_9D4B2644 
X-CRM114-Status: GOOD (  17.31  )
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
PiDmlrwgMjAyMeW5tDfmnIgxNuaXpSDpgLHkupQg5LiL5Y2IMjo1OOWvq+mBk++8mgo+Cj4gYWRk
IHRpbWUtb3V0IGN5Y2xlIHNldHRpbmcgdG8gbWFrZSBzdXJlIHRpbWUtb3V0IGludGVycnVwdCBp
cnEKPiB3aWxsIGhhcHBlbmVkIHdoZW4gaW5zdHJ1Y3Rpb24gdGltZS1vdXQgZm9yIHdhaXQgYW5k
IHBvbGwKPgo+IFNpZ25lZC1vZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVk
aWF0ZWsuY29tPgo+IC0tLQo+ICBkcml2ZXJzL21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5jIHwg
MTEgKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykKPgo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5jIGIvZHJpdmVycy9t
YWlsYm94L210ay1jbWRxLW1haWxib3guYwo+IGluZGV4IGRlNDc5M2UuLjlhNzZiY2QgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9tYWlsYm94L210ay1jbWRxLW1haWxib3guYwo+ICsrKyBiL2RyaXZl
cnMvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmMKPiBAQCAtMzUsNiArMzUsNyBAQAo+ICAjZGVm
aW5lIENNRFFfVEhSX0VORF9BRERSICAgICAgICAgICAgICAweDI0Cj4gICNkZWZpbmUgQ01EUV9U
SFJfV0FJVF9UT0tFTiAgICAgICAgICAgIDB4MzAKPiAgI2RlZmluZSBDTURRX1RIUl9QUklPUklU
WSAgICAgICAgICAgICAgMHg0MAo+ICsjZGVmaW5lIENNRFFfVEhSX0lOU1ROX1RJTUVPVVRfQ1lD
TEVTICAweDUwCj4KPiAgI2RlZmluZSBHQ0VfR0NUTF9WQUxVRSAgICAgICAgICAgICAgICAgMHg0
OAo+Cj4gQEAgLTUzLDYgKzU0LDE1IEBACj4gICNkZWZpbmUgQ01EUV9KVU1QX0JZX09GRlNFVCAg
ICAgICAgICAgIDB4MTAwMDAwMDAKPiAgI2RlZmluZSBDTURRX0pVTVBfQllfUEEgICAgICAgICAg
ICAgICAgICAgICAgICAweDEwMDAwMDAxCj4KPiArLyoKPiArICogaW5zdHJ1Y3Rpb24gdGltZS1v
dXQKPiArICogY3ljbGVzIHRvIGlzc3VlIGluc3RydWN0aW9uIHRpbWUtb3V0IGludGVycnVwdCBm
b3Igd2FpdCBhbmQgcG9sbCBpbnN0cnVjdGlvbnMKPiArICogR0NFIGF4aV9jbG9jayAxNTZNSHoK
PiArICogMSBjeWNsZSA9IDYuNDFucwo+ICsgKiBpbnN0cnVjdGlvbiB0aW1lIG91dCAyXjIyKjIq
Ni40MW5zID0gNTNtcwoKSSB0aGluayBldmVyeSBjbGllbnQgaGFzIGRpZmZlcmVudCB0aW1lb3V0
IHZhbHVlLCBzbyBpdCdzIG5vdCBhIGdvb2QKaWRlYSB0byBoYXZlIGEgdW5pcXVlIHRpbWVvdXQg
dmFsdWUgaW4gbWFpbGJveCBjb250cm9sbGVyLiBDbGllbnQKY291bGQgdXNlIHRpbWVyIG9yIHNv
bWV0aGluZyBzaW1pbGFyIHRvIGRldGVjdCB0aW1lb3V0LgoKUmVnYXJkcywKQ2h1bi1LdWFuZy4K
Cj4gKyAqLwo+ICsjZGVmaW5lIENNRFFfSU5TVE5fVElNRU9VVF9DWUNMRVMgICAgICAyMgo+ICsK
PiAgc3RydWN0IGNtZHFfdGhyZWFkIHsKPiAgICAgICAgIHN0cnVjdCBtYm94X2NoYW4gICAgICAg
ICpjaGFuOwo+ICAgICAgICAgdm9pZCBfX2lvbWVtICAgICAgICAgICAgKmJhc2U7Cj4gQEAgLTM2
OCw2ICszNzgsNyBAQCBzdGF0aWMgaW50IGNtZHFfbWJveF9zZW5kX2RhdGEoc3RydWN0IG1ib3hf
Y2hhbiAqY2hhbiwgdm9pZCAqZGF0YSkKPiAgICAgICAgICAgICAgICAgd3JpdGVsKCh0YXNrLT5w
YV9iYXNlICsgcGt0LT5jbWRfYnVmX3NpemUpID4+IGNtZHEtPnNoaWZ0X3BhLAo+ICAgICAgICAg
ICAgICAgICAgICAgICAgdGhyZWFkLT5iYXNlICsgQ01EUV9USFJfRU5EX0FERFIpOwo+Cj4gKyAg
ICAgICAgICAgICAgIHdyaXRlbChDTURRX0lOU1ROX1RJTUVPVVRfQ1lDTEVTLCB0aHJlYWQtPmJh
c2UgKyBDTURRX1RIUl9JTlNUTl9USU1FT1VUX0NZQ0xFUyk7Cj4gICAgICAgICAgICAgICAgIHdy
aXRlbCh0aHJlYWQtPnByaW9yaXR5LCB0aHJlYWQtPmJhc2UgKyBDTURRX1RIUl9QUklPUklUWSk7
Cj4gICAgICAgICAgICAgICAgIHdyaXRlbChDTURRX1RIUl9JUlFfRU4sIHRocmVhZC0+YmFzZSAr
IENNRFFfVEhSX0lSUV9FTkFCTEUpOwo+ICAgICAgICAgICAgICAgICB3cml0ZWwoQ01EUV9USFJf
RU5BQkxFRCwgdGhyZWFkLT5iYXNlICsgQ01EUV9USFJfRU5BQkxFX1RBU0spOwo+IC0tCj4gMS44
LjEuMS5kaXJ0eQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW1lZGlhdGVrCg==
