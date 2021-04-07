Return-Path: <SRS0=xJt/=JE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 431A5C43460
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Apr 2021 16:00:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C071661154
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Apr 2021 16:00:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C071661154
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MS8l+pvFiNDeQxWMXipsMcU7PTFPgeMfymbifJCQ7j8=; b=GAMsqmz4mCDjj9sJJzRJ4+ai0
	8NByR1DkZD1pCQ3f4MophlS3ebYqxU9NiGrla9fkr7e28aw4uZR40zXtdKrWDW47shZnLDpYsD/Ul
	seEpW7Yob9YDlAmJH1c1Lr31uPgC7lmvxX3iEjWqObrM3ZH/8Bwrg8b7NIlPDxB3bCGoEfGihHTd8
	rQQ4nSPjVp1HzmqU1FQ975Ia9JnF8cDP/7b/583SK4y1wSgJiuuGwYbPWufU6m6CED199O/fToTX9
	qmNkkuAqEcXlisvXP6i4G+osfufibBXEyPPpe57G8ka+KEEcOiHJT+WeH6IzRfD0o56l0n2VgkBu/
	m5iX8JrzA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUAbA-005NA6-LY; Wed, 07 Apr 2021 16:00:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUAas-005N4V-Ap; Wed, 07 Apr 2021 15:59:53 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2671361382;
 Wed,  7 Apr 2021 15:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617811187;
 bh=hGXNzVJiH86Iaj7zXKQ35uQKcMAGo1DSHvGN1U3LigI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Eo9KXeSeF+qiiMEGBRTSan29w2Je5fOzX3pOmVElTHi7slb0WJjRYTAXzrWkEi5x6
 yTVFc4CvBTJLc4Oujco6Z+AL2tSisD/h6vlGZU9lXUEL07/Wl6JQn2Ltl6/VIKK/Ye
 kE5p1sWa2AOpUz8CiyzLM9P0jaCQHocVmc316We4uxopIxF4FX5SavnDy87kwOQXVe
 y3qrrM/cTCmaPCZPDElsMGRKu91TH7Zad4Nw1Vnl7HZrMlZFT4pmA7H2B08jwBkbay
 JCixRc/O6Upa3OxBNVKdH4K2DBI/HDrK1y4hXX13GRC95O/hZGGO3y2jZyrxQI4e2T
 TNJ52eMFZd0YQ==
Received: by mail-ej1-f44.google.com with SMTP id a25so5491486ejk.0;
 Wed, 07 Apr 2021 08:59:47 -0700 (PDT)
X-Gm-Message-State: AOAM530I5ObgIhDtPMf1F5ayrwIHVazMVb0Jol6WfLZfL4k1eOGPEJhF
 bzhQthWkY2RUtkZujwG+CF1Kq46JiajgrMlOzA==
X-Google-Smtp-Source: ABdhPJwpyfbWTwn3/jlmyA5Hhu8Vwe6NWCunioufvDhHzHzmvZ82ObW9OPDby6jvwPsk5u2uvIzq/RFbEZhCbrFa1jc=
X-Received: by 2002:a17:906:4a52:: with SMTP id
 a18mr4522021ejv.194.1617811185726; 
 Wed, 07 Apr 2021 08:59:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210407143656.2574-1-jitao.shi@mediatek.com>
In-Reply-To: <20210407143656.2574-1-jitao.shi@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 7 Apr 2021 23:59:34 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9sxEZ-M8dp1w4ac+DR-9ESOxVGfDfhd4d8MkCMsCj7kg@mail.gmail.com>
Message-ID: <CAAOTY_9sxEZ-M8dp1w4ac+DR-9ESOxVGfDfhd4d8MkCMsCj7kg@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: force hsa hsa hfp packets multiple of line
 num to avoid screen shift
To: Jitao Shi <jitao.shi@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, huijuan.xie@mediatek.com,
 stonea168@163.com, 
 Cawa Cheng <cawa.cheng@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 yingjoe.chen@mediatek.com, 
 eddie.huang@mediatek.com, Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_165951_285724_2EC4F068 
X-CRM114-Status: GOOD (  20.20  )
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
tDTmnIg35pelIOmAseS4iSDkuIvljYgxMDozN+Wvq+mBk++8mgo+Cj4gVGhlIGJyaWRnZSBjaGlw
IEFOWDc2MjUgcmVxdWlyZSB0aGUgbGluZSBwYWNrZXRzIGVuZGluZyBhdCB0aGUgc2FtZXRpbWUK
PiBvciBBTlg3NjI1IHdpbGwgc2hpZnQgdGhlIHNjcmVlbi4KPgo+IENoYW5nZS1JZDogSWEzMjRh
ZDI4ZmJmZjU0MTQwZmVlZGI5YTFkNmJmYjJiMjQ2ZDA0NDcKPiBTaWduZWQtb2ZmLWJ5OiBKaXRh
byBTaGkgPGppdGFvLnNoaUBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHNpLmMgfCAxMiArKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDEy
IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RzaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+IGluZGV4IGEx
ZmYxNTJlZjQ2OC4uZTgyNWE4MDg2MmRlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHNpLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rz
aS5jCj4gQEAgLTE5NCw2ICsxOTQsOCBAQCBzdHJ1Y3QgbXRrX2RzaSB7Cj4gICAgICAgICBzdHJ1
Y3QgY2xrICpoc19jbGs7Cj4KPiAgICAgICAgIHUzMiBkYXRhX3JhdGU7Cj4gKyAgICAgICAvKiBm
b3JjZSBkc2kgbGluZSBlbmQgd2l0aG91dCBkc2lfbnVsbCBkYXRhICovCj4gKyAgICAgICBib29s
IGZvcmNlX2RzaV9lbmRfd2l0aG91dF9udWxsOwo+Cj4gICAgICAgICB1bnNpZ25lZCBsb25nIG1v
ZGVfZmxhZ3M7Cj4gICAgICAgICBlbnVtIG1pcGlfZHNpX3BpeGVsX2Zvcm1hdCBmb3JtYXQ7Cj4g
QEAgLTQ5NSw2ICs0OTcsMTMgQEAgc3RhdGljIHZvaWQgbXRrX2RzaV9jb25maWdfdmRvX3RpbWlu
ZyhzdHJ1Y3QgbXRrX2RzaSAqZHNpKQo+ICAgICAgICAgICAgICAgICBEUk1fV0FSTigiSEZQICsg
SEJQIGxlc3MgdGhhbiBkLXBoeSwgRlBTIHdpbGwgdW5kZXIgNjBIelxuIik7Cj4gICAgICAgICB9
Cj4KPiArICAgICAgIGlmIChkc2ktPmZvcmNlX2RzaV9lbmRfd2l0aG91dF9udWxsKSB7Cj4gKyAg
ICAgICAgICAgICAgIGhvcml6b250YWxfc3luY19hY3RpdmVfYnl0ZSA9IHJvdW5kdXAoaG9yaXpv
bnRhbF9zeW5jX2FjdGl2ZV9ieXRlLCBkc2ktPmxhbmVzKSAtIDI7Cj4gKyAgICAgICAgICAgICAg
IGhvcml6b250YWxfZnJvbnRwb3JjaF9ieXRlID0gcm91bmR1cChob3Jpem9udGFsX2Zyb250cG9y
Y2hfYnl0ZSwgZHNpLT5sYW5lcykgLSAyOwo+ICsgICAgICAgICAgICAgICBob3Jpem9udGFsX2Jh
Y2twb3JjaF9ieXRlID0gcm91bmR1cChob3Jpem9udGFsX2JhY2twb3JjaF9ieXRlLCBkc2ktPmxh
bmVzKSAtIDI7Cj4gKyAgICAgICAgICAgICAgIGhvcml6b250YWxfYmFja3BvcmNoX2J5dGUgLT0g
KHZtLT5oYWN0aXZlICogZHNpX3RtcF9idWZfYnBwICsgMikgJSBkc2ktPmxhbmVzOwo+ICsgICAg
ICAgfQo+ICsKPiAgICAgICAgIHdyaXRlbChob3Jpem9udGFsX3N5bmNfYWN0aXZlX2J5dGUsIGRz
aS0+cmVncyArIERTSV9IU0FfV0MpOwo+ICAgICAgICAgd3JpdGVsKGhvcml6b250YWxfYmFja3Bv
cmNoX2J5dGUsIGRzaS0+cmVncyArIERTSV9IQlBfV0MpOwo+ICAgICAgICAgd3JpdGVsKGhvcml6
b250YWxfZnJvbnRwb3JjaF9ieXRlLCBkc2ktPnJlZ3MgKyBEU0lfSEZQX1dDKTsKPiBAQCAtMTA5
MSw2ICsxMTAwLDkgQEAgc3RhdGljIGludCBtdGtfZHNpX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpCj4gICAgICAgICBkc2ktPmJyaWRnZS5vZl9ub2RlID0gZGV2LT5vZl9ub2Rl
Owo+ICAgICAgICAgZHNpLT5icmlkZ2UudHlwZSA9IERSTV9NT0RFX0NPTk5FQ1RPUl9EU0k7Cj4K
PiArICAgICAgIGRzaS0+Zm9yY2VfZHNpX2VuZF93aXRob3V0X251bGwgPSBvZl9wcm9wZXJ0eV9y
ZWFkX2Jvb2woZGV2LT5vZl9ub2RlLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiZm9yY2VfZHNpX2VuZF93aXRob3V0X251
bGwiKTsKCklmIGZvcmNlX2RzaV9lbmRfd2l0aG91dF9udWxsIGlzIGNhdXNlZCBieSBBTlg3NjI1
LCBJIHRoaW5rIHdlIHNob3VsZApnZXQgdGhpcyBpbmZvcm1hdGlvbiBmcm9tIEFOWDc2MjUuCgpS
ZWdhcmRzLApDaHVuLUt1YW5nLgoKPiArCj4gICAgICAgICBkcm1fYnJpZGdlX2FkZCgmZHNpLT5i
cmlkZ2UpOwo+Cj4gICAgICAgICByZXQgPSBjb21wb25lbnRfYWRkKCZwZGV2LT5kZXYsICZtdGtf
ZHNpX2NvbXBvbmVudF9vcHMpOwo+IC0tCj4gMi4yNS4xCj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgt
bWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
