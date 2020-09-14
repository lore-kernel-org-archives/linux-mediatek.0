Return-Path: <SRS0=gVFe=CX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6499BC433E2
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 23:44:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D900208B3
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 23:44:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LfnT95ja";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="tldsgMhM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D900208B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hz0uwLSbRv+zMY1M61tROJwd1aFyqwMVcCg2sz4+6Ko=; b=LfnT95ja96kaUv2gJmf94YVcF
	wGplYPF2brCbcK4CWAd17wZel7r/DP6oLCsMCiEL18Zc/x57bzPjP8iMBK7iE9oQVrfgXhigPxipQ
	aYrv76m9AMnciF1Ygi8+e5trEbd2zaTPvkKeMp5TKrwqYCkDknuunVHzh6QYIojHqDeyP1GpANyw/
	jGcz2sHAMN05kwvqpwsywSswWCJxDQKAYFZkH+3/ExJpkhWM3KAE8Yo9bVa4HlvTJOeugtbxx9HnX
	9UYrtVbcJTZRd02A+Jx+/fT/ZgmxDl093YV3Fm1APS9YvfT9n42Ka8JZi5j1UBnu6Siaf/wlUQlD5
	PesMptHqQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHy8z-0003pu-WF; Mon, 14 Sep 2020 23:44:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHy8u-0003no-Jk; Mon, 14 Sep 2020 23:44:17 +0000
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5F2D221974;
 Mon, 14 Sep 2020 23:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600127055;
 bh=+OhI6QNHCUTezEy3dC8zYNoj1C1U2IUoG/B2Kdfhl0Y=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tldsgMhMqLV/lzvk9W8V5/yK35Olz+LfV3L7KOMtcrLzTTSw9fIEELANJodDHRdQD
 B2T06DyfTxiJHGrZBjdCQxk84dzjB+FaMfaCJZXZ86nBGTk2e53cS8NF4dcy4+EixH
 rkXN5fe+bf0vsl7ZMkLPt9XaQOHrlWvtn5Lg5UjE=
Received: by mail-ej1-f51.google.com with SMTP id p9so2375669ejf.6;
 Mon, 14 Sep 2020 16:44:15 -0700 (PDT)
X-Gm-Message-State: AOAM531DhFRB2eN9A042RE6qNRvjQl7h62M247gzVAUneWAZF1FNWvNO
 IlKlTBhIcd7ATrKrEIkqIVpR2v0zLbxzpc1aGg==
X-Google-Smtp-Source: ABdhPJyYu9jlk9XD95lFQa7HI5Qb4vp8g0UXjCYsPMegPd9apv/vOGC9kUF8wL49jyw/7LJM+MYuJZzZHH36b+Lyj/4=
X-Received: by 2002:a17:906:8690:: with SMTP id
 g16mr16850817ejx.187.1600127053936; 
 Mon, 14 Sep 2020 16:44:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200911112151.3220469-1-yukuai3@huawei.com>
In-Reply-To: <20200911112151.3220469-1-yukuai3@huawei.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 15 Sep 2020 07:44:03 +0800
X-Gmail-Original-Message-ID: <CAAOTY__jzUgrz9UuRFn104ePfMY5sR4vLuRRFNWVO=1naZUntw@mail.gmail.com>
Message-ID: <CAAOTY__jzUgrz9UuRFn104ePfMY5sR4vLuRRFNWVO=1naZUntw@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: add missing put_device() call in
 mtk_hdmi_dt_parse_pdata()
To: Yu Kuai <yukuai3@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_194416_779164_616F8D02 
X-CRM114-Status: GOOD (  21.02  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, junzhi.zhao@mediatek.com,
 Philipp Zabel <p.zabel@pengutronix.de>, jie.qiu@mediatek.com,
 yi.zhang@huawei.com, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIFl1IEt1YWk6CgpZdSBLdWFpIDx5dWt1YWkzQGh1YXdlaS5jb20+IOaWvCAyMDIw5bm0Oeac
iDEx5pelIOmAseS6lCDkuIvljYg3OjIy5a+r6YGT77yaCj4KPiBpZiBvZl9maW5kX2RldmljZV9i
eV9ub2RlKCkgc3VjY2VlZCwgbXRrX2RybV9rbXNfaW5pdCgpIGRvZXNuJ3QgaGF2ZQo+IGEgY29y
cmVzcG9uZGluZyBwdXRfZGV2aWNlKCkuIFRodXMgYWRkIGp1bXAgdGFyZ2V0IHRvIGZpeCB0aGUg
ZXhjZXB0aW9uCj4gaGFuZGxpbmcgZm9yIHRoaXMgZnVuY3Rpb24gaW1wbGVtZW50YXRpb24uCgpS
ZXZpZXdlZC1ieTogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cgo+Cj4g
Rml4ZXM6IDhmODNmMjY4OTFlMSAoImRybS9tZWRpYXRlazogQWRkIEhETUkgc3VwcG9ydCIpCj4g
U2lnbmVkLW9mZi1ieTogWXUgS3VhaSA8eXVrdWFpM0BodWF3ZWkuY29tPgo+IC0tLQo+ICBkcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2hkbWkuYyB8IDI2ICsrKysrKysrKysrKysrKysrKy0t
LS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygt
KQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jIGIv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMKPiBpbmRleCBmMmU5YjQyOTk2MGIu
LmE5NzcyNTY4MGQ0ZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2hkbWkuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5jCj4gQEAg
LTE1MDcsMjUgKzE1MDcsMzAgQEAgc3RhdGljIGludCBtdGtfaGRtaV9kdF9wYXJzZV9wZGF0YShz
dHJ1Y3QgbXRrX2hkbWkgKmhkbWksCj4gICAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LAo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICJGYWlsZWQgdG8gZ2V0IHN5c3RlbSBjb25maWd1cmF0aW9u
IHJlZ2lzdGVyczogJWRcbiIsCj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0KTsKPiAtICAg
ICAgICAgICAgICAgcmV0dXJuIHJldDsKPiArICAgICAgICAgICAgICAgZ290byBwdXRfZGV2aWNl
Owo+ICAgICAgICAgfQo+ICAgICAgICAgaGRtaS0+c3lzX3JlZ21hcCA9IHJlZ21hcDsKPgo+ICAg
ICAgICAgbWVtID0gcGxhdGZvcm1fZ2V0X3Jlc291cmNlKHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAw
KTsKPiAgICAgICAgIGhkbWktPnJlZ3MgPSBkZXZtX2lvcmVtYXBfcmVzb3VyY2UoZGV2LCBtZW0p
Owo+IC0gICAgICAgaWYgKElTX0VSUihoZG1pLT5yZWdzKSkKPiAtICAgICAgICAgICAgICAgcmV0
dXJuIFBUUl9FUlIoaGRtaS0+cmVncyk7Cj4gKyAgICAgICBpZiAoSVNfRVJSKGhkbWktPnJlZ3Mp
KSB7Cj4gKyAgICAgICAgICAgICAgIHJldCA9IFBUUl9FUlIoaGRtaS0+cmVncyk7Cj4gKyAgICAg
ICAgICAgICAgIGdvdG8gcHV0X2RldmljZTsKPiArICAgICAgIH0KPgo+ICAgICAgICAgcmVtb3Rl
ID0gb2ZfZ3JhcGhfZ2V0X3JlbW90ZV9ub2RlKG5wLCAxLCAwKTsKPiAtICAgICAgIGlmICghcmVt
b3RlKQo+IC0gICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiArICAgICAgIGlmICghcmVt
b3RlKSB7Cj4gKyAgICAgICAgICAgICAgIHJldCA9IC1FSU5WQUw7Cj4gKyAgICAgICAgICAgICAg
IGdvdG8gcHV0X2RldmljZTsKPiArICAgICAgIH0KPgo+ICAgICAgICAgaWYgKCFvZl9kZXZpY2Vf
aXNfY29tcGF0aWJsZShyZW1vdGUsICJoZG1pLWNvbm5lY3RvciIpKSB7Cj4gICAgICAgICAgICAg
ICAgIGhkbWktPm5leHRfYnJpZGdlID0gb2ZfZHJtX2ZpbmRfYnJpZGdlKHJlbW90ZSk7Cj4gICAg
ICAgICAgICAgICAgIGlmICghaGRtaS0+bmV4dF9icmlkZ2UpIHsKPiAgICAgICAgICAgICAgICAg
ICAgICAgICBkZXZfZXJyKGRldiwgIldhaXRpbmcgZm9yIGV4dGVybmFsIGJyaWRnZVxuIik7Cj4g
ICAgICAgICAgICAgICAgICAgICAgICAgb2Zfbm9kZV9wdXQocmVtb3RlKTsKPiAtICAgICAgICAg
ICAgICAgICAgICAgICByZXR1cm4gLUVQUk9CRV9ERUZFUjsKPiArICAgICAgICAgICAgICAgICAg
ICAgICByZXQgPSAtRVBST0JFX0RFRkVSOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGdvdG8g
cHV0X2RldmljZTsKPiAgICAgICAgICAgICAgICAgfQo+ICAgICAgICAgfQo+Cj4gQEAgLTE1MzQs
NyArMTUzOSw4IEBAIHN0YXRpYyBpbnQgbXRrX2hkbWlfZHRfcGFyc2VfcGRhdGEoc3RydWN0IG10
a19oZG1pICpoZG1pLAo+ICAgICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBm
aW5kIGRkYy1pMmMtYnVzIG5vZGUgaW4gJXBPRlxuIiwKPiAgICAgICAgICAgICAgICAgICAgICAg
ICByZW1vdGUpOwo+ICAgICAgICAgICAgICAgICBvZl9ub2RlX3B1dChyZW1vdGUpOwo+IC0gICAg
ICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiArICAgICAgICAgICAgICAgcmV0ID0gLUVJTlZB
TDsKPiArICAgICAgICAgICAgICAgZ290byBwdXRfZGV2aWNlOwo+ICAgICAgICAgfQo+ICAgICAg
ICAgb2Zfbm9kZV9wdXQocmVtb3RlKTsKPgo+IEBAIC0xNTQyLDEwICsxNTQ4LDE0IEBAIHN0YXRp
YyBpbnQgbXRrX2hkbWlfZHRfcGFyc2VfcGRhdGEoc3RydWN0IG10a19oZG1pICpoZG1pLAo+ICAg
ICAgICAgb2Zfbm9kZV9wdXQoaTJjX25wKTsKPiAgICAgICAgIGlmICghaGRtaS0+ZGRjX2FkcHQp
IHsKPiAgICAgICAgICAgICAgICAgZGV2X2VycihkZXYsICJGYWlsZWQgdG8gZ2V0IGRkYyBpMmMg
YWRhcHRlciBieSBub2RlXG4iKTsKPiAtICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4g
KyAgICAgICAgICAgICAgIHJldCA9IC1FSU5WQUw7Cj4gKyAgICAgICAgICAgICAgIGdvdG8gcHV0
X2RldmljZTsKPiAgICAgICAgIH0KPgo+ICAgICAgICAgcmV0dXJuIDA7Cj4gK3B1dF9kZXZpY2U6
Cj4gKyAgICAgICBwdXRfZGV2aWNlKGhkbWktPmNlY19kZXYpOwo+ICsgICAgICAgcmV0dXJuIHJl
dDsKPiAgfQo+Cj4gIC8qCj4gLS0KPiAyLjI1LjQKPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4
LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
