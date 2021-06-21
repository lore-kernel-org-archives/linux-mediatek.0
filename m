Return-Path: <SRS0=ivGG=LP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD393C48BE5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jun 2021 08:30:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FA9660FF4
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jun 2021 08:30:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FA9660FF4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IH9l9lozQnnuPjXf02XNPCYXLdra4RVDoyZN5TzL6mQ=; b=z87rLz2SFqyX5s
	tEZG8tObjzocB72WWsrySQ7sYYSquw2xN9Cc1cMyvlbqYW8Wfk0kCHwi5f2QzccG+gxpmnA1PEK1j
	RRUSnabxxZg3E9K9iLRNOlkGh59pQYRrvbRSHtB3siYiuQ+xoZ8CEXHFhrV/XnRInMKM6Vs7TYxfG
	Mpc27ue1nEoEbywRoLadXP4P83DsxWl0G4HoSxuZ5BGZ+MxJTtOeZF6bIABVZtFs1jM1lJ27WyAiQ
	PFNOvOg9mvX+u5U9vpMZ6w+T/DwZ4oAQ77IY9eQRX4ywPKeCuyQUILd1cP/lNMhXNWVnSUPFfC/5Y
	TQ0uCKl5fyEYTi4tCxyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvFJg-002glP-LV; Mon, 21 Jun 2021 08:30:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvFJS-002gg9-2l; Mon, 21 Jun 2021 08:29:47 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 655B561206;
 Mon, 21 Jun 2021 08:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624264185;
 bh=3k7UKLAzplWylccCBWjz7kXMM/herlyLZaHwytCXBXE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fENbtecuXfxTiz7RPH+9f4S8YpxmcBZol1rcmNfPb26+/uh/SRxCJJcnzISj0bvlN
 8H7IASU54wrLZG84P7cvMi8lGU3pTEkDX4gEyepqJqB0QlzOqzhE2lSzYhCgvwhJST
 z8KWdWiWTzgQPfxtInMgvnMxfSB7EQhLtLxFvEP/CJ9hc20IVQ7CW/hHsMfye89SWg
 aAdZMtkoKR+H9F86ZBXuCthjiPxSgubLC7NDsbdxxZhwGxfXt5DXwlQRqY6jdjWIr2
 YQ5jlF0lPdK7/6uwz+3mZ59mv6Qfh9trZFrkcMVMBZWird4L2EtHRPVy7jtYf5XsCu
 D8dGxhBzEtSHw==
Received: by mail-ed1-f46.google.com with SMTP id df12so15264587edb.2;
 Mon, 21 Jun 2021 01:29:45 -0700 (PDT)
X-Gm-Message-State: AOAM532A79U6cExn7n/mSndTijlIHdqaXTuSxArWSM6c/3tCBewuZUGn
 i191d6uYV4zMOKa0sbaVkxsGVRFFJ8ZBxXnKAA==
X-Google-Smtp-Source: ABdhPJy99W+iUMmSVT+D20GJWXJQDvrweRWoVmNQ4hxYbGjBoj+VtBCmyu5vVrJXOxAqXXXmJvQFU6lq5QdPkA+ASs8=
X-Received: by 2002:aa7:ce0c:: with SMTP id d12mr6504464edv.49.1624264183889; 
 Mon, 21 Jun 2021 01:29:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210617103214.44217-1-jitao.shi@mediatek.com>
In-Reply-To: <20210617103214.44217-1-jitao.shi@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 21 Jun 2021 16:29:30 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9LkeWjz0zs19hvb_3AMxhytqmAk6H1jGS1VxDkQqFr5Q@mail.gmail.com>
Message-ID: <CAAOTY_9LkeWjz0zs19hvb_3AMxhytqmAk6H1jGS1VxDkQqFr5Q@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: force hsa hbp hfp packets multiple of
 lanenum to avoid screen shift
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
X-CRM114-CacheID: sfid-20210621_012946_204006_D15D6545 
X-CRM114-Status: GOOD (  17.38  )
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
tDbmnIgxN+aXpSDpgLHlm5sg5LiL5Y2INjozMuWvq+mBk++8mgo+Cj4gVGhlIGJyaWRnZSBjaGlw
ICJBTlg3NjI1IiByZXF1aXJlcyB0aGUgcGFja2V0cyBvbiBsYW5lcyB0byBhbGlnbmUgYXQgdGhl
IGVuZCwKPiBvciBBTlg3NjI1IHdpbGwgc2hpZnQgdGhlIHNjcmVlbi4KPgo+IFNpZ25lZC1vZmYt
Ynk6IEppdGFvIFNoaSA8aml0YW8uc2hpQG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kc2kuYyB8IDEzICsrKysrKysrKysrKysKPiAgMSBmaWxlIGNo
YW5nZWQsIDEzIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RzaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+
IGluZGV4IGFlNDAzYzY3Y2JkOS4uNDczNWUwMDkyZmZlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RzaS5jCj4gQEAgLTE5NCw2ICsxOTQsOCBAQCBzdHJ1Y3QgbXRrX2RzaSB7Cj4gICAg
ICAgICBzdHJ1Y3QgY2xrICpoc19jbGs7Cj4KPiAgICAgICAgIHUzMiBkYXRhX3JhdGU7Cj4gKyAg
ICAgICAvKiBmb3JjZSBkc2kgbGluZSBlbmQgd2l0aG91dCBkc2lfbnVsbCBkYXRhICovCj4gKyAg
ICAgICBib29sIGZvcmNlX2RzaV9lbmRfd2l0aG91dF9udWxsOwo+Cj4gICAgICAgICB1bnNpZ25l
ZCBsb25nIG1vZGVfZmxhZ3M7Cj4gICAgICAgICBlbnVtIG1pcGlfZHNpX3BpeGVsX2Zvcm1hdCBm
b3JtYXQ7Cj4gQEAgLTQ5OSw2ICs1MDEsMTMgQEAgc3RhdGljIHZvaWQgbXRrX2RzaV9jb25maWdf
dmRvX3RpbWluZyhzdHJ1Y3QgbXRrX2RzaSAqZHNpKQo+ICAgICAgICAgICAgICAgICBEUk1fV0FS
TigiSEZQICsgSEJQIGxlc3MgdGhhbiBkLXBoeSwgRlBTIHdpbGwgdW5kZXIgNjBIelxuIik7Cj4g
ICAgICAgICB9Cj4KPiArICAgICAgIGlmIChkc2ktPmZvcmNlX2RzaV9lbmRfd2l0aG91dF9udWxs
KSB7Cj4gKyAgICAgICAgICAgICAgIGhvcml6b250YWxfc3luY19hY3RpdmVfYnl0ZSA9IHJvdW5k
dXAoaG9yaXpvbnRhbF9zeW5jX2FjdGl2ZV9ieXRlLCBkc2ktPmxhbmVzKSAtIDI7Cj4gKyAgICAg
ICAgICAgICAgIGhvcml6b250YWxfZnJvbnRwb3JjaF9ieXRlID0gcm91bmR1cChob3Jpem9udGFs
X2Zyb250cG9yY2hfYnl0ZSwgZHNpLT5sYW5lcykgLSAyOwo+ICsgICAgICAgICAgICAgICBob3Jp
em9udGFsX2JhY2twb3JjaF9ieXRlID0gcm91bmR1cChob3Jpem9udGFsX2JhY2twb3JjaF9ieXRl
LCBkc2ktPmxhbmVzKSAtIDI7Cj4gKyAgICAgICAgICAgICAgIGhvcml6b250YWxfYmFja3BvcmNo
X2J5dGUgLT0gKHZtLT5oYWN0aXZlICogZHNpX3RtcF9idWZfYnBwICsgMikgJSBkc2ktPmxhbmVz
Owo+ICsgICAgICAgfQo+ICsKPiAgICAgICAgIHdyaXRlbChob3Jpem9udGFsX3N5bmNfYWN0aXZl
X2J5dGUsIGRzaS0+cmVncyArIERTSV9IU0FfV0MpOwo+ICAgICAgICAgd3JpdGVsKGhvcml6b250
YWxfYmFja3BvcmNoX2J5dGUsIGRzaS0+cmVncyArIERTSV9IQlBfV0MpOwo+ICAgICAgICAgd3Jp
dGVsKGhvcml6b250YWxfZnJvbnRwb3JjaF9ieXRlLCBkc2ktPnJlZ3MgKyBEU0lfSEZQX1dDKTsK
PiBAQCAtMTA5NSw2ICsxMTA0LDEwIEBAIHN0YXRpYyBpbnQgbXRrX2RzaV9wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAgICAgICAgZHNpLT5icmlkZ2Uub2Zfbm9kZSA9IGRl
di0+b2Zfbm9kZTsKPiAgICAgICAgIGRzaS0+YnJpZGdlLnR5cGUgPSBEUk1fTU9ERV9DT05ORUNU
T1JfRFNJOwo+Cj4gKyAgICAgICBpZiAoZHNpLT5uZXh0X2JyaWRnZSkKPiArICAgICAgICAgICAg
ICAgZHNpLT5mb3JjZV9kc2lfZW5kX3dpdGhvdXRfbnVsbCA9IG9mX3Byb3BlcnR5X3JlYWRfYm9v
bChkc2ktPm5leHRfYnJpZGdlLT5vZl9ub2RlLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJmb3JjZV9kc2lf
ZW5kX3dpdGhvdXRfbnVsbCIpOwoKVGhpcyBwYXRjaCBsb29rcyBnb29kIHRvIG1lLCBidXQgSSBj
b3VsZCBub3QgZmluZAoiZm9yY2VfZHNpX2VuZF93aXRob3V0X251bGwiIGluIGJpbmRpbmcgZG9j
dW1lbnQuCgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKPiArCj4gICAgICAgICBkcm1fYnJpZGdlX2Fk
ZCgmZHNpLT5icmlkZ2UpOwo+Cj4gICAgICAgICByZXQgPSBjb21wb25lbnRfYWRkKCZwZGV2LT5k
ZXYsICZtdGtfZHNpX2NvbXBvbmVudF9vcHMpOwo+IC0tCj4gMi4yNS4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5n
IGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
