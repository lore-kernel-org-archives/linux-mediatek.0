Return-Path: <SRS0=WPHR=7H=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9894C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 May 2020 00:23:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 880B52076C
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 May 2020 00:23:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G8E+Uh4/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="SSsZhLY9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 880B52076C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xc8duh0ma/jBnGmoO4EZCXBv3PNbzr1oaDVS9keuGG4=; b=G8E+Uh4/+zk62h
	YulsfKpdU0zfL0SkdBwlqjBLU9EBI9z37GKP3UO6SQQl44rZBUh37goonbkNYRy9ZqGU+NFcKtFDD
	3D39gwJbbKz2xOJPfrZKqaklIoV/mn0K+q1EhYenGyennmQvACtM6nHzadEtJdKWTALrpRmdHums1
	JbDS+n7orLD+9pVPa2pPAEJaKk1wGg/i5IfU9Lzrl2GD/BvJPW3i5oxCYrJ7I65pQoG5V/VGkxYAx
	x8wRlwb7HYkUPcfyve0M3gNSAZDp4pipnZL3ML3OVf9nUihKYSC7ypQZ1WqTB0EzfqqHcUHjS1o27
	xA2lN6jGjGB/pejtVOYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jd0u1-00016Y-2P; Mon, 25 May 2020 00:23:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jd0ts-000101-Bs; Mon, 25 May 2020 00:23:29 +0000
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C595E20823;
 Mon, 25 May 2020 00:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590366207;
 bh=3fQWdb2Uv3qePojZmO+4tSxfnjltQG0nFeUsHQam6o4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=SSsZhLY9EfC5qU/BYZB5juZ2bjSbJoVAyMNtCB7kiCirQUkaYGHR55KJ0c1fF7/Ef
 VbIV+wO8v8USBpPo7WhacJSxyY2972LW49K4/yNGsQd4kX8QkJ8G82crzuzRp9LtTq
 tAeBF9wRdr/GFOIc6eBUm4nZKEJx0SEgWEXwPRpQ=
Received: by mail-ej1-f52.google.com with SMTP id x1so18839608ejd.8;
 Sun, 24 May 2020 17:23:26 -0700 (PDT)
X-Gm-Message-State: AOAM532O+9cuoO2d1pgBsL5hbGVZrU0IqN/HPGgdfpN8o36KnxAjzxWM
 Pa1Igu8D9mg0d/XeKiEqv4WGhzDFCliwj/4BEA==
X-Google-Smtp-Source: ABdhPJwUQS45aN6Ho1zx5rWy7SPdbMvS7/nnetQcqChrnsfFeME43g1GOq9VgR+o2PMTCTxZRcZhBKuPj3a+20kllCw=
X-Received: by 2002:a17:906:3041:: with SMTP id
 d1mr17295243ejd.7.1590366205137; 
 Sun, 24 May 2020 17:23:25 -0700 (PDT)
MIME-Version: 1.0
References: <1583664775-19382-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1583664775-19382-11-git-send-email-dennis-yc.hsieh@mediatek.com>
 <5d6b61b2-23c9-647f-fa22-73e779010bd8@gmail.com>
In-Reply-To: <5d6b61b2-23c9-647f-fa22-73e779010bd8@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 25 May 2020 08:23:13 +0800
X-Gmail-Original-Message-ID: <CAAOTY___HNcRPr8Jq-wNPO_G9pLVjf2D7ezbpPcGbXVNYy1_nA@mail.gmail.com>
Message-ID: <CAAOTY___HNcRPr8Jq-wNPO_G9pLVjf2D7ezbpPcGbXVNYy1_nA@mail.gmail.com>
Subject: Re: [PATCH v5 10/13] soc: mediatek: cmdq: export finalize function
To: Matthias Brugger <matthias.bgg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200524_172328_447108_02AD8187 
X-CRM114-Status: GOOD (  21.19  )
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
 Daniel Vetter <daniel@ffwll.ch>, wsd_upstream@mediatek.com,
 David Airlie <airlied@linux.ie>, Jassi Brar <jassisinghbrar@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 HS Liao <hs.liao@mediatek.com>, Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Houlong Wei <houlong.wei@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIE1hdHRoaWFzOgoKTWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT4g
5pa8IDIwMjDlubQ15pyIMTfml6Ug6YCx5pelIOS4iuWNiDI6MjLlr6vpgZPvvJoKPgo+Cj4KPiBP
biAwOC8wMy8yMDIwIDExOjUyLCBEZW5uaXMgWUMgSHNpZWggd3JvdGU6Cj4gPiBFeHBvcnQgZmlu
YWxpemUgZnVuY3Rpb24gdG8gY2xpZW50IHdoaWNoIGhlbHBzIGFwcGVuZCBlb2MgYW5kIGp1bXAK
PiA+IGNvbW1hbmQgdG8gcGt0LiBMZXQgY2xpZW50IGRlY2lkZSBjYWxsIGZpbmFsaXplIG9yIG5v
dC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBEZW5uaXMgWUMgSHNpZWggPGRlbm5pcy15Yy5oc2ll
aEBtZWRpYXRlay5jb20+Cj4gPiBSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNv
bT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYyB8
IDEgKwo+ID4gIGRyaXZlcnMvc29jL21lZGlhdGVrL210ay1jbWRxLWhlbHBlci5jICB8IDcgKyst
LS0tLQo+ID4gIGluY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210ay1jbWRxLmggICB8IDggKysr
KysrKysKPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25z
KC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJt
X2NydGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYwo+ID4gaW5k
ZXggMGRmY2QxNzg3ZTY1Li43ZGFhYWJjMjZlYjEgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHJtX2NydGMuYwo+ID4gQEAgLTQ5MCw2ICs0OTAsNyBAQCBzdGF0aWMgdm9p
ZCBtdGtfZHJtX2NydGNfaHdfY29uZmlnKHN0cnVjdCBtdGtfZHJtX2NydGMgKm10a19jcnRjKQo+
ID4gICAgICAgICAgICAgICBjbWRxX3BrdF9jbGVhcl9ldmVudChjbWRxX2hhbmRsZSwgbXRrX2Ny
dGMtPmNtZHFfZXZlbnQpOwo+ID4gICAgICAgICAgICAgICBjbWRxX3BrdF93ZmUoY21kcV9oYW5k
bGUsIG10a19jcnRjLT5jbWRxX2V2ZW50KTsKPiA+ICAgICAgICAgICAgICAgbXRrX2NydGNfZGRw
X2NvbmZpZyhjcnRjLCBjbWRxX2hhbmRsZSk7Cj4gPiArICAgICAgICAgICAgIGNtZHFfcGt0X2Zp
bmFsaXplKGNtZHFfaGFuZGxlKTsKPiA+ICAgICAgICAgICAgICAgY21kcV9wa3RfZmx1c2hfYXN5
bmMoY21kcV9oYW5kbGUsIGRkcF9jbWRxX2NiLCBjbWRxX2hhbmRsZSk7Cj4gPiAgICAgICB9Cj4g
PiAgI2VuZGlmCj4KPiBUaGlzIHNob3VsZCBiZSBhIGluZGVwZW5kZW50IHBhdGNoLgo+IE90aGVy
IHRoZW4gdGhhdCBwYXRjaCBsb29rcyBnb29kLgoKQXBwbHkgb25seSBkcm0gcGFydCBvciBvbmx5
IGNtZHEgaGVscHIgcGFydCwgaXQgd291bGQgYmUgYWJub3JtYWwuClNoYWxsIHdlIHNlcGVyYXRl
IHRoaXMgcGF0Y2g/Ck9yIHNlcGVyYXRlIGl0IGJ1dCBtYWtlIHN1cmUgdGhlc2UgdHdvIHBhdGNo
ZXMgYmUgaW4gdGhlIHNhbWUgdHJlZT8KClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+Cj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLWNtZHEtaGVscGVyLmMgYi9kcml2ZXJz
L3NvYy9tZWRpYXRlay9tdGstY21kcS1oZWxwZXIuYwo+ID4gaW5kZXggYTllYmJhYmI3NDM5Li41
OWJjMTE2NGI0MTEgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstY21k
cS1oZWxwZXIuYwo+ID4gKysrIGIvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLWNtZHEtaGVscGVy
LmMKPiA+IEBAIC0zNzIsNyArMzcyLDcgQEAgaW50IGNtZHFfcGt0X2Fzc2lnbihzdHJ1Y3QgY21k
cV9wa3QgKnBrdCwgdTE2IHJlZ19pZHgsIHUzMiB2YWx1ZSkKPiA+ICB9Cj4gPiAgRVhQT1JUX1NZ
TUJPTChjbWRxX3BrdF9hc3NpZ24pOwo+ID4KPiA+IC1zdGF0aWMgaW50IGNtZHFfcGt0X2ZpbmFs
aXplKHN0cnVjdCBjbWRxX3BrdCAqcGt0KQo+ID4gK2ludCBjbWRxX3BrdF9maW5hbGl6ZShzdHJ1
Y3QgY21kcV9wa3QgKnBrdCkKPiA+ICB7Cj4gPiAgICAgICBzdHJ1Y3QgY21kcV9pbnN0cnVjdGlv
biBpbnN0ID0geyB7MH0gfTsKPiA+ICAgICAgIGludCBlcnI7Cj4gPiBAQCAtMzkyLDYgKzM5Miw3
IEBAIHN0YXRpYyBpbnQgY21kcV9wa3RfZmluYWxpemUoc3RydWN0IGNtZHFfcGt0ICpwa3QpCj4g
Pgo+ID4gICAgICAgcmV0dXJuIGVycjsKPiA+ICB9Cj4gPiArRVhQT1JUX1NZTUJPTChjbWRxX3Br
dF9maW5hbGl6ZSk7Cj4gPgo+ID4gIHN0YXRpYyB2b2lkIGNtZHFfcGt0X2ZsdXNoX2FzeW5jX2Ni
KHN0cnVjdCBjbWRxX2NiX2RhdGEgZGF0YSkKPiA+ICB7Cj4gPiBAQCAtNDI2LDEwICs0MjcsNiBA
QCBpbnQgY21kcV9wa3RfZmx1c2hfYXN5bmMoc3RydWN0IGNtZHFfcGt0ICpwa3QsIGNtZHFfYXN5
bmNfZmx1c2hfY2IgY2IsCj4gPiAgICAgICB1bnNpZ25lZCBsb25nIGZsYWdzID0gMDsKPiA+ICAg
ICAgIHN0cnVjdCBjbWRxX2NsaWVudCAqY2xpZW50ID0gKHN0cnVjdCBjbWRxX2NsaWVudCAqKXBr
dC0+Y2w7Cj4gPgo+ID4gLSAgICAgZXJyID0gY21kcV9wa3RfZmluYWxpemUocGt0KTsKPiA+IC0g
ICAgIGlmIChlcnIgPCAwKQo+ID4gLSAgICAgICAgICAgICByZXR1cm4gZXJyOwo+ID4gLQo+ID4g
ICAgICAgcGt0LT5jYi5jYiA9IGNiOwo+ID4gICAgICAgcGt0LT5jYi5kYXRhID0gZGF0YTsKPiA+
ICAgICAgIHBrdC0+YXN5bmNfY2IuY2IgPSBjbWRxX3BrdF9mbHVzaF9hc3luY19jYjsKPiA+IGRp
ZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstY21kcS5oIGIvaW5jbHVk
ZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRrLWNtZHEuaAo+ID4gaW5kZXggZmVjMjkyYWFjODNjLi45
OWU3NzE1NWY5NjcgMTAwNjQ0Cj4gPiAtLS0gYS9pbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9t
dGstY21kcS5oCj4gPiArKysgYi9pbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstY21kcS5o
Cj4gPiBAQCAtMjEzLDYgKzIxMywxNCBAQCBpbnQgY21kcV9wa3RfcG9sbF9tYXNrKHN0cnVjdCBj
bWRxX3BrdCAqcGt0LCB1OCBzdWJzeXMsCj4gPiAgICovCj4gPiAgaW50IGNtZHFfcGt0X2Fzc2ln
bihzdHJ1Y3QgY21kcV9wa3QgKnBrdCwgdTE2IHJlZ19pZHgsIHUzMiB2YWx1ZSk7Cj4gPgo+ID4g
Ky8qKgo+ID4gKyAqIGNtZHFfcGt0X2ZpbmFsaXplKCkgLSBBcHBlbmQgRU9DIGFuZCBqdW1wIGNv
bW1hbmQgdG8gcGt0Lgo+ID4gKyAqIEBwa3Q6ICAgICB0aGUgQ01EUSBwYWNrZXQKPiA+ICsgKgo+
ID4gKyAqIFJldHVybjogMCBmb3Igc3VjY2VzczsgZWxzZSB0aGUgZXJyb3IgY29kZSBpcyByZXR1
cm5lZAo+ID4gKyAqLwo+ID4gK2ludCBjbWRxX3BrdF9maW5hbGl6ZShzdHJ1Y3QgY21kcV9wa3Qg
KnBrdCk7Cj4gPiArCj4gPiAgLyoqCj4gPiAgICogY21kcV9wa3RfZmx1c2hfYXN5bmMoKSAtIHRy
aWdnZXIgQ01EUSB0byBhc3luY2hyb25vdXNseSBleGVjdXRlIHRoZSBDTURRCj4gPiAgICogICAg
ICAgICAgICAgICAgICAgICAgICAgIHBhY2tldCBhbmQgY2FsbCBiYWNrIGF0IHRoZSBlbmQgb2Yg
ZG9uZSBwYWNrZXQKPiA+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW1lZGlhdGVrCg==
