Return-Path: <SRS0=12Pn=BT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5145AC433DF
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Aug 2020 00:52:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C550206DF
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Aug 2020 00:52:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MUx73Rhq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="LIoe2xE0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C550206DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7NY522ogTpOcyWiA1tJgnkBGvXt3sOjJyBvcYI1dy9o=; b=MUx73Rhq8o5AiJDNTeNJdxRiN
	YnUSFAdkkopUHv5Alvq31CQcq4kML7ZrJXtP3iwywe+FbZU2ubwATWW8QnV4tpnb36GmXtQ3FgS9h
	zuHT+Ciu9jOuaQ48r/l9QNVKlbVRRwTfCfcO3NqGdxGbEkhs/us5AETv2Fi2p/32Qjo9Fq0sPzodU
	xwT4Cf4xhBw779qHmx6FfdK23cUeJcXuDD0kNnuFhDOqxJAr+nYKP6pgDY0tR2IBjYYPsL9QJmJ0P
	G6V/2UTikK5iQk0nJ65yfJ2Gsa7e2GX3empPDLmZ179pdASAkEG3ZrJjJai1rwQzRYuKcG0DeFbhM
	ZT+jK7mng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k4ZZV-0007qp-Ca; Sun, 09 Aug 2020 00:52:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k4ZZQ-0007pB-8T; Sun, 09 Aug 2020 00:52:17 +0000
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2B7DB20723;
 Sun,  9 Aug 2020 00:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596934335;
 bh=0z/Z71osg3eyFsMFe8xBmU/V7BFVUMmz+ZgNVRDikSA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=LIoe2xE0rXdW+zvXDMvwmQKw276z7cbIc09/WdCEPlrHjcAtwP4g66M+twROS3A00
 y/obU8dbo2rACU8uFScuMhwY6fEuGZ1wOQUiAjDO5RUUw58IMML/Ad0iMcl4NksTrc
 KLL0w+lRA9YplB45x0BE3cS8nyS8oZVsGXsUpDKA=
Received: by mail-ej1-f46.google.com with SMTP id g19so5861628ejc.9;
 Sat, 08 Aug 2020 17:52:15 -0700 (PDT)
X-Gm-Message-State: AOAM5319yBFIqBLr2RIw1YTDKRk6hLtPwBEGPlMSAxRGQ73NXOIdpsEc
 H8N/oZnnU+pqpKGoI3IvQkDrR0L7O0w+s5SHQw==
X-Google-Smtp-Source: ABdhPJyZt1CSoIboKSwTbNAnnwaQ2vRrvv4qzD8K8i6CZ7BvEyJ3034SciF2SNRDbzK5xcdTgDcXaD4qHRXWuJehpPA=
X-Received: by 2002:a17:906:d92c:: with SMTP id
 rn12mr15178620ejb.187.1596934333673; 
 Sat, 08 Aug 2020 17:52:13 -0700 (PDT)
MIME-Version: 1.0
References: <1596855231-5782-1-git-send-email-yongqiang.niu@mediatek.com>
 <1596855231-5782-3-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1596855231-5782-3-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 9 Aug 2020 08:52:02 +0800
X-Gmail-Original-Message-ID: <CAAOTY__ZbNfRNfQ+DLdZh0WHVqUeQ6AbO=Lc-CUZpx25X=2Kyg@mail.gmail.com>
Message-ID: <CAAOTY__ZbNfRNfQ+DLdZh0WHVqUeQ6AbO=Lc-CUZpx25X=2Kyg@mail.gmail.com>
Subject: Re: [RESEND v7, PATCH 2/7] drm/mediatek: move ddp component define
 into mtk_mmsys.h
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200808_205216_455017_3D5A62D1 
X-CRM114-Status: GOOD (  20.73  )
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
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

WW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+IOaWvCAyMDIw5bm0OOac
iDjml6Ug6YCx5YWtIOS4iuWNiDExOjA15a+r6YGT77yaCj4KPiBtbXN5cyBpcyB0aGUgZHJpdmVy
IHdoaWNoIGNvbnRyb2wgdGhlIHJvdXRpbmcgb2YgdGhlc2UgZGRwIGNvbXBvbmVudCwKPiBzbyB0
aGUgZGVmaW5pdGlvbiBvZiBtdGtfZGRwX2NvbXBfaWQgc2hvdWxkIGJlIHBsYWNlZCBpbiBtdGst
bW1zeXMuaAo+CgpSZXZpZXdlZC1ieTogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5l
bC5vcmc+Cgo+IFNpZ25lZC1vZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVk
aWF0ZWsuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBf
Y29tcC5oIHwgMzQgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgZHJpdmVycy9zb2Mv
bWVkaWF0ZWsvbXRrLW1tc3lzLmMgICAgICAgICAgICB8ICA0ICstLS0KPiAgaW5jbHVkZS9saW51
eC9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmggICAgICB8IDMzICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysKPiAgMyBmaWxlcyBjaGFuZ2VkLCAzNSBpbnNlcnRpb25zKCspLCAzNiBkZWxldGlv
bnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9k
ZHBfY29tcC5oIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuaAo+
IGluZGV4IGRlYmUzNjMuLjE2MTIwMWYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kcm1fZGRwX2NvbXAuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHJtX2RkcF9jb21wLmgKPiBAQCAtNyw2ICs3LDcgQEAKPiAgI2RlZmluZSBNVEtfRFJN
X0REUF9DT01QX0gKPgo+ICAjaW5jbHVkZSA8bGludXgvaW8uaD4KPiArI2luY2x1ZGUgPGxpbnV4
L3NvYy9tZWRpYXRlay9tdGstbW1zeXMuaD4KPgo+ICBzdHJ1Y3QgZGV2aWNlOwo+ICBzdHJ1Y3Qg
ZGV2aWNlX25vZGU7Cj4gQEAgLTM1LDM5ICszNiw2IEBAIGVudW0gbXRrX2RkcF9jb21wX3R5cGUg
ewo+ICAgICAgICAgTVRLX0REUF9DT01QX1RZUEVfTUFYLAo+ICB9Owo+Cj4gLWVudW0gbXRrX2Rk
cF9jb21wX2lkIHsKPiAtICAgICAgIEREUF9DT01QT05FTlRfQUFMMCwKPiAtICAgICAgIEREUF9D
T01QT05FTlRfQUFMMSwKPiAtICAgICAgIEREUF9DT01QT05FTlRfQkxTLAo+IC0gICAgICAgRERQ
X0NPTVBPTkVOVF9DQ09SUiwKPiAtICAgICAgIEREUF9DT01QT05FTlRfQ09MT1IwLAo+IC0gICAg
ICAgRERQX0NPTVBPTkVOVF9DT0xPUjEsCj4gLSAgICAgICBERFBfQ09NUE9ORU5UX0RJVEhFUiwK
PiAtICAgICAgIEREUF9DT01QT05FTlRfRFBJMCwKPiAtICAgICAgIEREUF9DT01QT05FTlRfRFBJ
MSwKPiAtICAgICAgIEREUF9DT01QT05FTlRfRFNJMCwKPiAtICAgICAgIEREUF9DT01QT05FTlRf
RFNJMSwKPiAtICAgICAgIEREUF9DT01QT05FTlRfRFNJMiwKPiAtICAgICAgIEREUF9DT01QT05F
TlRfRFNJMywKPiAtICAgICAgIEREUF9DT01QT05FTlRfR0FNTUEsCj4gLSAgICAgICBERFBfQ09N
UE9ORU5UX09EMCwKPiAtICAgICAgIEREUF9DT01QT05FTlRfT0QxLAo+IC0gICAgICAgRERQX0NP
TVBPTkVOVF9PVkwwLAo+IC0gICAgICAgRERQX0NPTVBPTkVOVF9PVkxfMkwwLAo+IC0gICAgICAg
RERQX0NPTVBPTkVOVF9PVkxfMkwxLAo+IC0gICAgICAgRERQX0NPTVBPTkVOVF9PVkwxLAo+IC0g
ICAgICAgRERQX0NPTVBPTkVOVF9QV00wLAo+IC0gICAgICAgRERQX0NPTVBPTkVOVF9QV00xLAo+
IC0gICAgICAgRERQX0NPTVBPTkVOVF9QV00yLAo+IC0gICAgICAgRERQX0NPTVBPTkVOVF9SRE1B
MCwKPiAtICAgICAgIEREUF9DT01QT05FTlRfUkRNQTEsCj4gLSAgICAgICBERFBfQ09NUE9ORU5U
X1JETUEyLAo+IC0gICAgICAgRERQX0NPTVBPTkVOVF9VRk9FLAo+IC0gICAgICAgRERQX0NPTVBP
TkVOVF9XRE1BMCwKPiAtICAgICAgIEREUF9DT01QT05FTlRfV0RNQTEsCj4gLSAgICAgICBERFBf
Q09NUE9ORU5UX0lEX01BWCwKPiAtfTsKPiAtCj4gIHN0cnVjdCBtdGtfZGRwX2NvbXA7Cj4gIHN0
cnVjdCBjbWRxX3BrdDsKPiAgc3RydWN0IG10a19kZHBfY29tcF9mdW5jcyB7Cj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1tbXN5cy5jIGIvZHJpdmVycy9zb2MvbWVkaWF0
ZWsvbXRrLW1tc3lzLmMKPiBpbmRleCBhNTVmMjU1Li4zNmFkNjZiIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvc29jL21lZGlhdGVrL210ay1tbXN5cy5jCj4gKysrIGIvZHJpdmVycy9zb2MvbWVkaWF0
ZWsvbXRrLW1tc3lzLmMKPiBAQCAtNSwxMyArNSwxMSBAQAo+ICAgKi8KPgo+ICAjaW5jbHVkZSA8
bGludXgvZGV2aWNlLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9pby5oPgo+ICAjaW5jbHVkZSA8bGlu
dXgvb2ZfZGV2aWNlLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KPiAg
I2luY2x1ZGUgPGxpbnV4L3NvYy9tZWRpYXRlay9tdGstbW1zeXMuaD4KPgo+IC0jaW5jbHVkZSAi
Li4vLi4vZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5oIgo+IC0jaW5jbHVkZSAiLi4vLi4v
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmgiCj4gLQo+ICAjZGVmaW5lIERJU1Bf
UkVHX0NPTkZJR19ESVNQX09WTDBfTU9VVF9FTiAgICAgIDB4MDQwCj4gICNkZWZpbmUgRElTUF9S
RUdfQ09ORklHX0RJU1BfT1ZMMV9NT1VUX0VOICAgICAgMHgwNDQKPiAgI2RlZmluZSBESVNQX1JF
R19DT05GSUdfRElTUF9PRF9NT1VUX0VOICAgICAgICAgICAgICAgIDB4MDQ4Cj4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210ay1tbXN5cy5oIGIvaW5jbHVkZS9saW51
eC9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmgKPiBpbmRleCA3YmFiNWQ5Li4yMjI4YmY2IDEwMDY0
NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210ay1tbXN5cy5oCj4gKysrIGIv
aW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmgKPiBAQCAtOSw2ICs5LDM5IEBA
Cj4gIGVudW0gbXRrX2RkcF9jb21wX2lkOwo+ICBzdHJ1Y3QgZGV2aWNlOwo+Cj4gK2VudW0gbXRr
X2RkcF9jb21wX2lkIHsKPiArICAgICAgIEREUF9DT01QT05FTlRfQUFMMCwKPiArICAgICAgIERE
UF9DT01QT05FTlRfQUFMMSwKPiArICAgICAgIEREUF9DT01QT05FTlRfQkxTLAo+ICsgICAgICAg
RERQX0NPTVBPTkVOVF9DQ09SUiwKPiArICAgICAgIEREUF9DT01QT05FTlRfQ09MT1IwLAo+ICsg
ICAgICAgRERQX0NPTVBPTkVOVF9DT0xPUjEsCj4gKyAgICAgICBERFBfQ09NUE9ORU5UX0RJVEhF
UiwKPiArICAgICAgIEREUF9DT01QT05FTlRfRFBJMCwKPiArICAgICAgIEREUF9DT01QT05FTlRf
RFBJMSwKPiArICAgICAgIEREUF9DT01QT05FTlRfRFNJMCwKPiArICAgICAgIEREUF9DT01QT05F
TlRfRFNJMSwKPiArICAgICAgIEREUF9DT01QT05FTlRfRFNJMiwKPiArICAgICAgIEREUF9DT01Q
T05FTlRfRFNJMywKPiArICAgICAgIEREUF9DT01QT05FTlRfR0FNTUEsCj4gKyAgICAgICBERFBf
Q09NUE9ORU5UX09EMCwKPiArICAgICAgIEREUF9DT01QT05FTlRfT0QxLAo+ICsgICAgICAgRERQ
X0NPTVBPTkVOVF9PVkwwLAo+ICsgICAgICAgRERQX0NPTVBPTkVOVF9PVkxfMkwwLAo+ICsgICAg
ICAgRERQX0NPTVBPTkVOVF9PVkxfMkwxLAo+ICsgICAgICAgRERQX0NPTVBPTkVOVF9PVkwxLAo+
ICsgICAgICAgRERQX0NPTVBPTkVOVF9QV00wLAo+ICsgICAgICAgRERQX0NPTVBPTkVOVF9QV00x
LAo+ICsgICAgICAgRERQX0NPTVBPTkVOVF9QV00yLAo+ICsgICAgICAgRERQX0NPTVBPTkVOVF9S
RE1BMCwKPiArICAgICAgIEREUF9DT01QT05FTlRfUkRNQTEsCj4gKyAgICAgICBERFBfQ09NUE9O
RU5UX1JETUEyLAo+ICsgICAgICAgRERQX0NPTVBPTkVOVF9VRk9FLAo+ICsgICAgICAgRERQX0NP
TVBPTkVOVF9XRE1BMCwKPiArICAgICAgIEREUF9DT01QT05FTlRfV0RNQTEsCj4gKyAgICAgICBE
RFBfQ09NUE9ORU5UX0lEX01BWCwKPiArfTsKPiArCj4gIHZvaWQgbXRrX21tc3lzX2RkcF9jb25u
ZWN0KHN0cnVjdCBkZXZpY2UgKmRldiwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICBlbnVt
IG10a19kZHBfY29tcF9pZCBjdXIsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgZW51bSBt
dGtfZGRwX2NvbXBfaWQgbmV4dCk7Cj4gLS0KPiAxLjguMS4xLmRpcnR5Cj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1tZWRpYXRlayBtYWls
aW5nIGxpc3QKPiBMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsg
bWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
