Return-Path: <SRS0=H0vx=GQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A307BC433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 23:49:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B3A72250E
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 23:49:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B3A72250E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QXMhAUN84buUIeRb8QGhDvygj6BvcIYRfZL1V4c4vic=; b=sYo1S6rXkQ303TsDLMkn9ejY6
	RjEyWrpCP4kSf2f1XDb0y56klG4eceY4lPyzXh+eSXChmDDBGa4c78CHL5h9siplToUB5B+pmjet9
	ZxtnBpugSB2+PrEFs9A0IuaN2YsewTfjnmA3hh+tnGGleMCaqIHTT0E8j8WXrEoZGXxCI+QM38DkI
	aqzycdGXJkVglxPDbhC5UW0rVJclTfeWN65MwW+vgklCCSj7juYTun4PveXN+N5vFW/LRp2ZJ7qrM
	yc8yuETVJZaZrE4Y6IWeYriwu73+Can3oidsOKAA48OG0CxlRCji5I99fPnA6ZY5z1fAmMk8DAu7C
	OvtdjvuRw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzpt3-0002vb-9h; Wed, 13 Jan 2021 23:49:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzpsy-0002u8-78; Wed, 13 Jan 2021 23:49:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5F339233ED;
 Wed, 13 Jan 2021 23:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610581746;
 bh=Smp7CBcsbwTpztK0DhWsbG+PGWv9mq20lRCePwZJocM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=UO7fzeItexglalq9gLqMO12U3TTA56lXYBM+GJRkxiBvhlnj8MscCgPfbc87JGjWr
 92I7ndM5YUB+GzlXAljk4nFnQSb+qOJTNMjABim8T/FlvqaPa02DqyHXd+wiYOtwtQ
 PT5YPPpuPJ7JX7gbFnisXUMfP5xs40qhYE5puctsvYGw+URACccJhk0+ACxVtZdg2W
 gMLS9cXtl7hYYZ8t60LYWeOyfxITEVSPhOjH9+lpRkAKQAXJ9paupmxTa/33aKC2Gy
 ZSaHQhJH4oSDVfgNbBZ7FbSD/2D/bV2o5tp4GSPnS3DeB/JWWqVPIZaP61vSYHzPYE
 qiEuwzcFOSGQg==
Received: by mail-wm1-f51.google.com with SMTP id 190so3065423wmz.0;
 Wed, 13 Jan 2021 15:49:06 -0800 (PST)
X-Gm-Message-State: AOAM533wWUUHOHjdJIdOtZqZXSdZuD5uY4ipSqoURB/peufW4zYGx9TW
 6dAOEHQeAuvHPMFnuRMppjUugUgmSNaQ7oQr1g==
X-Google-Smtp-Source: ABdhPJy8+DTEWUczkI17EVLxIUAVLLky1a8Ef6nLYa3ITeegi5pMpgXdPknlUvq+XI50gV49SMzrocSmwF4NuNm4Irw=
X-Received: by 2002:a05:600c:25c2:: with SMTP id
 2mr1376818wml.170.1610581744920; 
 Wed, 13 Jan 2021 15:49:04 -0800 (PST)
MIME-Version: 1.0
References: <20201203082445.1342763-1-hsinyi@chromium.org>
 <CAAOTY__+FHHd6Coa9HDvS_e7Q7dD3gZm7FBbhymOR2w2-i8i4w@mail.gmail.com>
In-Reply-To: <CAAOTY__+FHHd6Coa9HDvS_e7Q7dD3gZm7FBbhymOR2w2-i8i4w@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 14 Jan 2021 07:48:53 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8eEgems8T-KJim--t5wCiPV8mEsqW3=HJa7tgEFuoezA@mail.gmail.com>
Message-ID: <CAAOTY_8eEgems8T-KJim--t5wCiPV8mEsqW3=HJa7tgEFuoezA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: mtk_dpi: Create connector for bridges
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_184908_398262_504C50C5 
X-CRM114-Status: GOOD (  18.78  )
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
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEhzaW4tWWk6CgpDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4g5pa8
IDIwMjDlubQxMuaciDEx5pelIOmAseS6lCDkuIvljYgxMDowNOWvq+mBk++8mgo+Cj4gSGksIEhz
aW4tWWk6Cj4KPiBIc2luLVlpIFdhbmcgPGhzaW55aUBjaHJvbWl1bS5vcmc+IOaWvCAyMDIw5bm0
MTLmnIgz5pelIOmAseWbmyDkuIvljYg0OjI05a+r6YGT77yaCj4gPgo+ID4gU2ltaWxhciB0byBh
OWQ5ZmVhNzRiZTIgKCJkcm0vbWVkaWF0ZWs6IG10a19kc2k6IENyZWF0ZSBjb25uZWN0b3IgZm9y
IGJyaWRnZXMiKToKPiA+Cj4gPiBVc2UgdGhlIGRybV9icmlkZ2VfY29ubmVjdG9yIGhlbHBlciB0
byBjcmVhdGUgYSBjb25uZWN0b3IgZm9yIHBpcGVsaW5lcwo+ID4gdGhhdCB1c2UgZHJtX2JyaWRn
ZS4gVGhpcyBhbGxvd3Mgc3BsaXR0aW5nIGNvbm5lY3RvciBvcGVyYXRpb25zIGFjcm9zcwo+ID4g
bXVsdGlwbGUgYnJpZGdlcyB3aGVuIG5lY2Vzc2FyeSwgaW5zdGVhZCBvZiBoYXZpbmcgdGhlIGxh
c3QgYnJpZGdlIGluCj4gPiB0aGUgY2hhaW4gY3JlYXRpbmcgdGhlIGNvbm5lY3RvciBhbmQgaGFu
ZGxpbmcgYWxsIGNvbm5lY3RvciBvcGVyYXRpb25zCj4gPiBpbnRlcm5hbGx5Lgo+Cj4gUmV2aWV3
ZWQtYnk6IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgoKQXBwbGllZCB0
byBtZWRpYXRlay1kcm0tbmV4dCBbMV0sIHRoYW5rcy4KClsxXSBodHRwczovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9jaHVua3VhbmcuaHUvbGludXguZ2l0L2xvZy8/
aD1tZWRpYXRlay1kcm0tbmV4dAoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4KPiA+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBIc2luLVlpIFdhbmcgPGhzaW55aUBjaHJvbWl1bS5vcmc+Cj4gPiAtLS0KPiA+
ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jIHwgMTMgKysrKysrKysrKysrLQo+
ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMgYi9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jCj4gPiBpbmRleCA1MmYxMWE2M2EzMzAuLjE4
OTM3N2UzNDJmYSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHBpLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMKPiA+IEBA
IC0yMCw2ICsyMCw3IEBACj4gPgo+ID4gICNpbmNsdWRlIDxkcm0vZHJtX2F0b21pY19oZWxwZXIu
aD4KPiA+ICAjaW5jbHVkZSA8ZHJtL2RybV9icmlkZ2UuaD4KPiA+ICsjaW5jbHVkZSA8ZHJtL2Ry
bV9icmlkZ2VfY29ubmVjdG9yLmg+Cj4gPiAgI2luY2x1ZGUgPGRybS9kcm1fY3J0Yy5oPgo+ID4g
ICNpbmNsdWRlIDxkcm0vZHJtX29mLmg+Cj4gPiAgI2luY2x1ZGUgPGRybS9kcm1fc2ltcGxlX2tt
c19oZWxwZXIuaD4KPiA+IEBAIC02Niw2ICs2Nyw3IEBAIHN0cnVjdCBtdGtfZHBpIHsKPiA+ICAg
ICAgICAgc3RydWN0IGRybV9lbmNvZGVyIGVuY29kZXI7Cj4gPiAgICAgICAgIHN0cnVjdCBkcm1f
YnJpZGdlIGJyaWRnZTsKPiA+ICAgICAgICAgc3RydWN0IGRybV9icmlkZ2UgKm5leHRfYnJpZGdl
Owo+ID4gKyAgICAgICBzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yOwo+ID4gICAgICAg
ICB2b2lkIF9faW9tZW0gKnJlZ3M7Cj4gPiAgICAgICAgIHN0cnVjdCBkZXZpY2UgKmRldjsKPiA+
ICAgICAgICAgc3RydWN0IGNsayAqZW5naW5lX2NsazsKPiA+IEBAIC02MDMsMTIgKzYwNSwyMSBA
QCBzdGF0aWMgaW50IG10a19kcGlfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZp
Y2UgKm1hc3Rlciwgdm9pZCAqZGF0YSkKPiA+Cj4gPiAgICAgICAgIGRwaS0+ZW5jb2Rlci5wb3Nz
aWJsZV9jcnRjcyA9IG10a19kcm1fZmluZF9wb3NzaWJsZV9jcnRjX2J5X2NvbXAoZHJtX2Rldiwg
ZHBpLT5kZHBfY29tcCk7Cj4gPgo+ID4gLSAgICAgICByZXQgPSBkcm1fYnJpZGdlX2F0dGFjaCgm
ZHBpLT5lbmNvZGVyLCAmZHBpLT5icmlkZ2UsIE5VTEwsIDApOwo+ID4gKyAgICAgICByZXQgPSBk
cm1fYnJpZGdlX2F0dGFjaCgmZHBpLT5lbmNvZGVyLCAmZHBpLT5icmlkZ2UsIE5VTEwsCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIERSTV9CUklER0VfQVRUQUNIX05PX0NPTk5F
Q1RPUik7Cj4gPiAgICAgICAgIGlmIChyZXQpIHsKPiA+ICAgICAgICAgICAgICAgICBkZXZfZXJy
KGRldiwgIkZhaWxlZCB0byBhdHRhY2ggYnJpZGdlOiAlZFxuIiwgcmV0KTsKPiA+ICAgICAgICAg
ICAgICAgICBnb3RvIGVycl9jbGVhbnVwOwo+ID4gICAgICAgICB9Cj4gPgo+ID4gKyAgICAgICBk
cGktPmNvbm5lY3RvciA9IGRybV9icmlkZ2VfY29ubmVjdG9yX2luaXQoZHJtX2RldiwgJmRwaS0+
ZW5jb2Rlcik7Cj4gPiArICAgICAgIGlmIChJU19FUlIoZHBpLT5jb25uZWN0b3IpKSB7Cj4gPiAr
ICAgICAgICAgICAgICAgZGV2X2VycihkZXYsICJVbmFibGUgdG8gY3JlYXRlIGJyaWRnZSBjb25u
ZWN0b3JcbiIpOwo+ID4gKyAgICAgICAgICAgICAgIHJldCA9IFBUUl9FUlIoZHBpLT5jb25uZWN0
b3IpOwo+ID4gKyAgICAgICAgICAgICAgIGdvdG8gZXJyX2NsZWFudXA7Cj4gPiArICAgICAgIH0K
PiA+ICsgICAgICAgZHJtX2Nvbm5lY3Rvcl9hdHRhY2hfZW5jb2RlcihkcGktPmNvbm5lY3Rvciwg
JmRwaS0+ZW5jb2Rlcik7Cj4gPiArCj4gPiAgICAgICAgIGRwaS0+Yml0X251bSA9IE1US19EUElf
T1VUX0JJVF9OVU1fOEJJVFM7Cj4gPiAgICAgICAgIGRwaS0+Y2hhbm5lbF9zd2FwID0gTVRLX0RQ
SV9PVVRfQ0hBTk5FTF9TV0FQX1JHQjsKPiA+ICAgICAgICAgZHBpLT55Y19tYXAgPSBNVEtfRFBJ
X09VVF9ZQ19NQVBfUkdCOwo+ID4gLS0KPiA+IDIuMjkuMi41NzYuZ2EzZmM0NDZkODQtZ29vZwo+
ID4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0
ZWsK
