Return-Path: <SRS0=p/XJ=EW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 263FEC8B4DA
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 12:40:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96CD020855
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 12:40:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aw063ZY6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Az8/cOOP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96CD020855
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PgPReOvPeX73vqFx3JRo+jz30ttP6Ax+ZXRzETiOg/Y=; b=aw063ZY6vdrrYx7cgJBP8VgJ/
	j10EUION20WaHPRV50Gk+2N7/9RquDZx4AxmeTKoLtLejKSC24IOIt/1qG87VmN7HiMkk212fIPvF
	lQ+clxUTVZ+4O78k5JS6C2/7omMyikvOOIgCJTcQpVdUgXXNfGb6ivvldqnOzrtPKfPyak/YEA+n5
	2gaat0462cykQbIxOWzOrEu0kjLEdZ9RU5SQKoQ/OIaGEJ/RvExK9ygzo1nBJnWlTt7+j/JQNWna4
	HvwixcyEUBX9IGzKINWj+NcbI7uj8pBuBnhZlESqMMufKQi58uCsERLAUEpB9bhjjSTBMP5HsaR96
	iH1lzpDvw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ked4V-0003Rs-Hc; Mon, 16 Nov 2020 11:53:23 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ked4S-0003RK-GS
 for linux-mediatek@lists.infradead.org; Mon, 16 Nov 2020 11:53:21 +0000
Received: by mail-wm1-x341.google.com with SMTP id h2so23480837wmm.0
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2020 03:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p9KGoxxYC+hgGvQRjQrRbEbTQUxe8E5TFAhLeXHI0Yc=;
 b=Az8/cOOPa7z8Y9SOXXHFJUN6I8AP9LU/yTgs5OycpyfRfAMB+J4ObKu4RzXyV1P2HE
 MCv4J7L35OGeXQ2xYHOXGoRpS8bvLz3Y7rgzXy8U3dDdl3XRSvO06r+YxjPwfAGKT2XS
 7Nsk3CnU+TxGNGjuNAQe5XHeCEJ5wR8m3/zxOMr5Ctp22H+r8k509jZKpSLmbdFgpp5j
 dADSEV19QOVfiXD9sJJLzzUkpYnJeWc9xvyGSIu9z+W7d9It06xrw29glDh3chlmr8uU
 TfgWVRsQXNjAZ4Lt4zWn/IsTjrQbqQXlVTvp9kznYPUSZOak332/tsU1vcUtf4v2ZzUW
 n5Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p9KGoxxYC+hgGvQRjQrRbEbTQUxe8E5TFAhLeXHI0Yc=;
 b=CtnKVa65bww2aapOLfsU0ruGhgYLAIMBnezT+2HhsRCEYlnxluSmLsjPGg17wrDdwX
 Wo1LZ6EgeXskwrS8uuhdATgwBkFFJ10Fq4H7WGH5Drqt9sg1mP6888i8f75ZuYNk6mlQ
 WMlPCsI9RLMbIL7kAdteTqbAYlb7PuWAAQzn5UudH5nBlvtG+bDtMZKBoXbYtoPqRWNd
 gzQxe4b+RO/eVPS0TvAE5Qis3oWFkadZ4DHR0Uxwk0PVgaerLEA881OstGWRN1/4/cRn
 XSwYeCbph0lGj0ZxZ887YbPeaXFFS1aTetwBhKC5jyZ2zowTiiZuQXp73ZodnRMCMvug
 /C9A==
X-Gm-Message-State: AOAM531WvizuQqOGLBJ+uluyrG5xMWk1rhiS+PWH1MEKPMJKx7tyoJK6
 6fJdgURmgxnXDs97y2TdyP8=
X-Google-Smtp-Source: ABdhPJyYM5nTj19mPq3Lr3emSdpUM11H8uM1xqtl64jGJLVdb9lVIPJYxAePSU4X7DKb+9yGVHwJjg==
X-Received: by 2002:a1c:e345:: with SMTP id a66mr14986818wmh.188.1605527599204; 
 Mon, 16 Nov 2020 03:53:19 -0800 (PST)
Received: from a-VirtualBox ([103.120.71.253])
 by smtp.gmail.com with ESMTPSA id d134sm19325713wmd.8.2020.11.16.03.53.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 03:53:19 -0800 (PST)
Date: Mon, 16 Nov 2020 16:53:11 +0500
From: Bilal Wasim <bilalwasim676@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: Re: [PATCH] drm/mediatek: dsi: Calculate horizontal_backporch_byte
 by itself
Message-ID: <20201116165311.15a36e82@a-VirtualBox>
In-Reply-To: <CAAOTY_-_N9pcmao0FFtGs-qVLrvA-QBz5FJrSaYynuMZMe1Qhg@mail.gmail.com>
References: <20201115001403.7833-1-chunkuang.hu@kernel.org>
 <CAAOTY_-16s=NXg2kOJijhO+82nNsT9HkKj4PVh1qN8dKchBOBA@mail.gmail.com>
 <20201116002522.1a5c3736@a-VirtualBox>
 <CAAOTY_-_N9pcmao0FFtGs-qVLrvA-QBz5FJrSaYynuMZMe1Qhg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_065320_581178_58F3E6E5 
X-CRM114-Status: GOOD (  26.01  )
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek
 SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgQ0ssIAoKT24gTW9uLCAxNiBOb3YgMjAyMCAwNzoxMjo1NSArMDgwMApDaHVuLUt1YW5nIEh1
IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4gd3JvdGU6Cgo+IEhpLCBCaWxhbDoKPiAKPiBCaWxh
bCBXYXNpbSA8YmlsYWx3YXNpbTY3NkBnbWFpbC5jb20+IOaWvCAyMDIw5bm0MTHmnIgxNuaXpSDp
gLHkuIAKPiDkuIrljYgzOjI15a+r6YGT77yaCj4gPgo+ID4gSGkgQ0ssCj4gPgo+ID4gT24gU3Vu
LCAxNSBOb3YgMjAyMCAwODo1MzoyNCArMDgwMAo+ID4gQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5n
Lmh1QGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gIAo+ID4gPiBIaSwgQmlsYWw6Cj4gPiA+Cj4gPiA+
IFBsZWFzZSBoZWxwIHRvIHRlc3QgdGhpcyBwYXRjaCBvbiB5b3VyIENocm9tZWJvb2sgZWxtLCB0
aGFua3MuCj4gPiA+Cj4gPiA+IFJlZ2FyZHMsCj4gPiA+IENodW4tS3VhbmcgSHUgIAo+ID4KPiA+
IEp1c3QgdHJpZWQgdGhpcyBwYXRjaCBvbiB0aGUgQ2hyb21lYm9vayBFbG0sIGFuZCBpdCBkb2Vz
bid0IHdvcmsuCj4gPiBUaGUgSERNSSBzY3JlZW4gcmVtYWlucyBibGFjaywgdGhvdWdoIHRoZSBy
ZXN0IG9mIHRoZSBzeXN0ZW0ga2VlcHMKPiA+IG9uIG9wZXJhdGluZyBub3JtYWxseS4gIAo+IAo+
IENvdWxkIHlvdSBwcmludCB0aGlzIGluZm9ybWF0aW9uLCBzbyBJIGNvdWxkIGZpbmQgb3V0IHRo
ZSBzb2x1dGlvbiBmb3IKPiBib3RoIHNtYWxsIGhicCBhbmQgZWxtLgo+IAo+IHZtLT5oZnJvbnRf
cG9yY2gsIHZtLT5oYmFja19wb3JjaCwgZHNpX3RtcF9idWZfYnBwLAo+IGRhdGFfcGh5X2N5Y2xl
c19ieXRlLCBhbmQgdGhlIGZpbmFsIGhvcml6b250YWxfZnJvbnRwb3JjaF9ieXRlLAo+IGhvcml6
b250YWxfYmFja3BvcmNoX2J5dGUuCgpIZXJlIGFyZSB0aGUgdmFsdWVzIEkgZ290LCAKClsgICAg
Mi41MDY0MDBdIFtkcm1dIHZtLT5oZnJvbnRfcG9yY2g6IDQ4ClsgICAgMi41MDY0MDJdIFtkcm1d
IHZtLT5oYmFja19wb3JjaDogMjAwClsgICAgMi41MDY0MDRdIFtkcm1dIGRzaV90bXBfYnVmX2Jw
cDogMwpbICAgIDIuNTA2NDA2XSBbZHJtXSBkYXRhX3BoeV9jeWNsZXNfYnl0ZTogMTgwClsgICAg
Mi41MDY0MDhdIFtkcm1dIGhvcml6b250YWxfZnJvbnRwb3JjaF9ieXRlOiAxMTAKWyAgICAyLjUw
NjQwOV0gW2RybV0gaG9yaXpvbnRhbF9iYWNrcG9yY2hfYnl0ZTogNDU1CgpQbGVhc2UgbGV0IG1l
IGtub3cgaWYgSSBjYW4gaGVscCBkZWJ1ZyB0aGlzIGluIGFueSBvdGhlciB3YXkuCgpUaGFua3Ms
IApCaWxhbAoKPiAKPiBSZWdhcmRzLAo+IENodW4tS3VhbmcuCj4gCj4gPiAgCj4gPiA+Cj4gPiA+
IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPiDmlrwgMjAyMOW5tDEx5pyI
MTXml6Ug6YCx5pelCj4gPiA+IOS4iuWNiDg6MTTlr6vpgZPvvJogIAo+ID4gPiA+Cj4gPiA+ID4g
RnJvbTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4KPiA+ID4gPgo+ID4gPiA+IFVzaW5nIHZt
LT5oZnJvbnRfcG9yY2ggKyB2bS0+aGJhY2tfcG9yY2ggdG8gY2FsY3VsYXRlCj4gPiA+ID4gaG9y
aXpvbnRhbF9iYWNrcG9yY2hfYnl0ZSB3b3VsZCBtYWtlIGl0IG5lZ3RpdmUsIHNvCj4gPiA+ID4g
dXNlIGhvcml6b250YWxfYmFja3BvcmNoX2J5dGUgaXRzZWxmIHRvIG1ha2UgaXQgcG9zaXRpdmUu
Cj4gPiA+ID4KPiA+ID4gPiBGaXhlczogMzViZjk0OGYxZWRiICgiZHJtL21lZGlhdGVrOiBkc2k6
IEZpeCBzY3JvbGxpbmcgb2YgcGFuZWwKPiA+ID4gPiB3aXRoIHNtYWxsIGhmcCBvciBoYnAiKQo+
ID4gPiA+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4K
PiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVs
Lm9yZz4KPiA+ID4gPiAtLS0KPiA+ID4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
c2kuYyB8IDUzCj4gPiA+ID4gKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tIDEgZmlsZSBj
aGFuZ2VkLCAxOAo+ID4gPiA+IGluc2VydGlvbnMoKyksIDM1IGRlbGV0aW9ucygtKQo+ID4gPiA+
Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMK
PiA+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgaW5kZXgKPiA+ID4g
PiA0YTE4OGE5NDJjMzguLjJhNjRmZGFlZDlhNyAxMDA2NDQgLS0tCj4gPiA+ID4gYS9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jICsrKwo+ID4gPiA+IGIvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kc2kuYyBAQCAtNDQ0LDcgKzQ0NCwxMCBAQCBzdGF0aWMKPiA+ID4gPiB2
b2lkIG10a19kc2lfY29uZmlnX3Zkb190aW1pbmcoc3RydWN0IG10a19kc2kgKmRzaSkgdTMyCj4g
PiA+ID4gaG9yaXpvbnRhbF9zeW5jX2FjdGl2ZV9ieXRlOyB1MzIgaG9yaXpvbnRhbF9iYWNrcG9y
Y2hfYnl0ZTsKPiA+ID4gPiAgICAgICAgIHUzMiBob3Jpem9udGFsX2Zyb250cG9yY2hfYnl0ZTsK
PiA+ID4gPiArICAgICAgIHUzMiBob3Jpem9udGFsX2Zyb250X2JhY2tfYnl0ZTsKPiA+ID4gPiAr
ICAgICAgIHUzMiBkYXRhX3BoeV9jeWNsZXNfYnl0ZTsKPiA+ID4gPiAgICAgICAgIHUzMiBkc2lf
dG1wX2J1Zl9icHAsIGRhdGFfcGh5X2N5Y2xlczsKPiA+ID4gPiArICAgICAgIHUzMiBkZWx0YTsK
PiA+ID4gPiAgICAgICAgIHN0cnVjdCBtdGtfcGh5X3RpbWluZyAqdGltaW5nID0gJmRzaS0+cGh5
X3RpbWluZzsKPiA+ID4gPgo+ID4gPiA+ICAgICAgICAgc3RydWN0IHZpZGVvbW9kZSAqdm0gPSAm
ZHNpLT52bTsKPiA+ID4gPiBAQCAtNDc0LDQyICs0NzcsMjIgQEAgc3RhdGljIHZvaWQKPiA+ID4g
PiBtdGtfZHNpX2NvbmZpZ192ZG9fdGltaW5nKHN0cnVjdCBtdGtfZHNpICpkc2kpIGRhdGFfcGh5
X2N5Y2xlcwo+ID4gPiA+ID0gdGltaW5nLT5scHggKyB0aW1pbmctPmRhX2hzX3ByZXBhcmUKPiA+
ID4gPiArIHRpbWluZy0+ZGFfaHNfemVybyArIHRpbWluZy0+ZGFfaHNfZXhpdDsKPiA+ID4gPgo+
ID4gPiA+IC0gICAgICAgaWYgKGRzaS0+bW9kZV9mbGFncyAmIE1JUElfRFNJX01PREVfVklERU9f
QlVSU1QpIHsKPiA+ID4gPiAtICAgICAgICAgICAgICAgaWYgKCh2bS0+aGZyb250X3BvcmNoICsg
dm0tPmhiYWNrX3BvcmNoKSAqCj4gPiA+ID4gZHNpX3RtcF9idWZfYnBwID4KPiA+ID4gPiAtICAg
ICAgICAgICAgICAgICAgIGRhdGFfcGh5X2N5Y2xlcyAqIGRzaS0+bGFuZXMgKyAxOCkgewo+ID4g
PiA+IC0gICAgICAgICAgICAgICAgICAgICAgIGhvcml6b250YWxfZnJvbnRwb3JjaF9ieXRlID0K
PiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZtLT5oZnJvbnRfcG9yY2gg
Kgo+ID4gPiA+IGRzaV90bXBfYnVmX2JwcCAtCj4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAoZGF0YV9waHlfY3ljbGVzICogZHNpLT5sYW5lcyArCj4gPiA+ID4gMTgpICoK
PiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZtLT5oZnJvbnRfcG9yY2gg
Lwo+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKHZtLT5oZnJvbnRfcG9y
Y2ggKwo+ID4gPiA+IHZtLT5oYmFja19wb3JjaCk7IC0KPiA+ID4gPiAtICAgICAgICAgICAgICAg
ICAgICAgICBob3Jpem9udGFsX2JhY2twb3JjaF9ieXRlID0KPiA+ID4gPiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGhvcml6b250YWxfYmFja3BvcmNoX2J5dGUgLQo+ID4gPiA+IC0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKGRhdGFfcGh5X2N5Y2xlcyAqIGRzaS0+bGFu
ZXMgKwo+ID4gPiA+IDE4KSAqCj4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB2bS0+aGJhY2tfcG9yY2ggLwo+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgKHZtLT5oZnJvbnRfcG9yY2ggKwo+ID4gPiA+IHZtLT5oYmFja19wb3JjaCk7Cj4gPiA+ID4g
LSAgICAgICAgICAgICAgIH0gZWxzZSB7Cj4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAg
RFJNX1dBUk4oIkhGUCBsZXNzIHRoYW4gZC1waHksIEZQUyB3aWxsCj4gPiA+ID4gdW5kZXIgNjBI
elxuIik7Cj4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgaG9yaXpvbnRhbF9mcm9udHBv
cmNoX2J5dGUgPQo+ID4gPiA+IHZtLT5oZnJvbnRfcG9yY2ggKgo+ID4gPiA+IC0KPiA+ID4gPiBk
c2lfdG1wX2J1Zl9icHA7Cj4gPiA+ID4gLSAgICAgICAgICAgICAgIH0KPiA+ID4gPiArICAgICAg
IGRlbHRhID0gZHNpLT5tb2RlX2ZsYWdzICYgTUlQSV9EU0lfTU9ERV9WSURFT19CVVJTVCA/Cj4g
PiA+ID4gMTggOiAxMjsgKwo+ID4gPiA+ICsgICAgICAgaG9yaXpvbnRhbF9mcm9udHBvcmNoX2J5
dGUgPSB2bS0+aGZyb250X3BvcmNoICoKPiA+ID4gPiBkc2lfdG1wX2J1Zl9icHA7Cj4gPiA+ID4g
KyAgICAgICBob3Jpem9udGFsX2Zyb250X2JhY2tfYnl0ZSA9IGhvcml6b250YWxfZnJvbnRwb3Jj
aF9ieXRlCj4gPiA+ID4gKyBob3Jpem9udGFsX2JhY2twb3JjaF9ieXRlOwo+ID4gPiA+ICsgICAg
ICAgZGF0YV9waHlfY3ljbGVzX2J5dGUgPSBkYXRhX3BoeV9jeWNsZXMgKiBkc2ktPmxhbmVzICsK
PiA+ID4gPiBkZWx0YTsgKwo+ID4gPiA+ICsgICAgICAgaWYgKGhvcml6b250YWxfZnJvbnRfYmFj
a19ieXRlID4gZGF0YV9waHlfY3ljbGVzX2J5dGUpIHsKPiA+ID4gPiArICAgICAgICAgICAgICAg
aG9yaXpvbnRhbF9mcm9udHBvcmNoX2J5dGUgLT0KPiA+ID4gPiBkYXRhX3BoeV9jeWNsZXNfYnl0
ZSAqICsKPiA+ID4gPiBob3Jpem9udGFsX2Zyb250cG9yY2hfYnl0ZSAvCj4gPiA+ID4gKwo+ID4g
PiA+IGhvcml6b250YWxfZnJvbnRfYmFja19ieXRlOyArCj4gPiA+ID4gKyAgICAgICAgICAgICAg
IGhvcml6b250YWxfYmFja3BvcmNoX2J5dGUgLT0KPiA+ID4gPiBkYXRhX3BoeV9jeWNsZXNfYnl0
ZSAqICsKPiA+ID4gPiBob3Jpem9udGFsX2JhY2twb3JjaF9ieXRlIC8KPiA+ID4gPiArCj4gPiA+
ID4gaG9yaXpvbnRhbF9mcm9udF9iYWNrX2J5dGU7IH0gZWxzZSB7Cj4gPiA+ID4gLSAgICAgICAg
ICAgICAgIGlmICgodm0tPmhmcm9udF9wb3JjaCArIHZtLT5oYmFja19wb3JjaCkgKgo+ID4gPiA+
IGRzaV90bXBfYnVmX2JwcCA+Cj4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICBkYXRhX3BoeV9j
eWNsZXMgKiBkc2ktPmxhbmVzICsgMTIpIHsKPiA+ID4gPiAtICAgICAgICAgICAgICAgICAgICAg
ICBob3Jpem9udGFsX2Zyb250cG9yY2hfYnl0ZSA9Cj4gPiA+ID4gLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB2bS0+aGZyb250X3BvcmNoICoKPiA+ID4gPiBkc2lfdG1wX2J1Zl9icHAg
LQo+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKGRhdGFfcGh5X2N5Y2xl
cyAqIGRzaS0+bGFuZXMgKwo+ID4gPiA+IDEyKSAqCj4gPiA+ID4gLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB2bS0+aGZyb250X3BvcmNoIC8KPiA+ID4gPiAtICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICh2bS0+aGZyb250X3BvcmNoICsKPiA+ID4gPiB2bS0+aGJhY2tfcG9y
Y2gpOwo+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIGhvcml6b250YWxfYmFja3BvcmNo
X2J5dGUgPQo+ID4gPiA+IGhvcml6b250YWxfYmFja3BvcmNoX2J5dGUgLQo+ID4gPiA+IC0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgKGRhdGFfcGh5X2N5Y2xlcyAqIGRzaS0+bGFuZXMg
Kwo+ID4gPiA+IDEyKSAqCj4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2
bS0+aGJhY2tfcG9yY2ggLwo+ID4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
KHZtLT5oZnJvbnRfcG9yY2ggKwo+ID4gPiA+IHZtLT5oYmFja19wb3JjaCk7Cj4gPiA+ID4gLSAg
ICAgICAgICAgICAgIH0gZWxzZSB7Cj4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgRFJN
X1dBUk4oIkhGUCBsZXNzIHRoYW4gZC1waHksIEZQUyB3aWxsCj4gPiA+ID4gdW5kZXIgNjBIelxu
Iik7Cj4gPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgaG9yaXpvbnRhbF9mcm9udHBvcmNo
X2J5dGUgPQo+ID4gPiA+IHZtLT5oZnJvbnRfcG9yY2ggKgo+ID4gPiA+IC0KPiA+ID4gPiBkc2lf
dG1wX2J1Zl9icHA7Cj4gPiA+ID4gLSAgICAgICAgICAgICAgIH0KPiA+ID4gPiArICAgICAgICAg
ICAgICAgRFJNX1dBUk4oIkhGUCArIEhCUCBsZXNzIHRoYW4gZC1waHksIEZQUyB3aWxsCj4gPiA+
ID4gdW5kZXIgNjBIelxuIik7IH0KPiA+ID4gPgo+ID4gPiA+ICAgICAgICAgd3JpdGVsKGhvcml6
b250YWxfc3luY19hY3RpdmVfYnl0ZSwgZHNpLT5yZWdzICsKPiA+ID4gPiBEU0lfSFNBX1dDKTsg
LS0KPiA+ID4gPiAyLjE3LjEKPiA+ID4gPiAgCj4gPgo+ID4gVGhhbmtzLAo+ID4gQmlsYWwgIAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1l
ZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
