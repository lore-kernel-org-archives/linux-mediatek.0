Return-Path: <SRS0=ZZ2m=JU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34880C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 23:50:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 961CD611BF
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 23:50:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 961CD611BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ate/y6A49iiPGfKekCqgpbEn+vcmJMN3a5+yWpLuBC8=; b=aOOh6NXrzHcrp2a5EnfwF56zy
	vxc5lM2K7GK9fz7VshPfSzdm7/8mDOHhSudnqIeZaNTidZHrzC7GIwCYgW7N/7sW9nz3xtpcqgFIV
	pFrA3ZhJ7C+k0dyelDWOhGsFEgDCdT2uUXXD55vs3fg9PhCzhPBz+koBTVm7LZS9GlCye/cuwkgtk
	6gWzLHsc6Sruf58pqES2u/RbA6h2MMxjk7+7EGkY+iTgu4D24YfueyQY38OCDadWoNqoz2jQepE/9
	vN6cs1MWpj2Q/TZk/as3u6/zfcIUBawuEgtKHjOKKez/kHJ3b9qC/F+sifDhKBh2ceI+Vc+CjY3Sa
	Q9/SLQ6EA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1la5ZF-002byj-Pe; Fri, 23 Apr 2021 23:50:37 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1la5Z1-002bwB-5p; Fri, 23 Apr 2021 23:50:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=eBX27XI4GxB+Ooj98n+PBgdiLUWn3thEafEdE7iXfC0=; b=AskOUSv0aOD6eAMy0C8sL8tJ04
 OfLgYdQXZGGHZDGfnCEjGT7AudYW7x/2qgYDd8pe04AKTO8tj+1+NvzMVeDzYo3LzFTrNfuQgB2pM
 idiFu34uG7BNH9fBd2y0HpQFn47zIqvMsyfIIFa7oCFppRxLTTBdOAp9nKL9jlJgA484wX5ZEIkbY
 0HqMaViyMll4ESt/+bXNy3Ywa93SR0VNrnjV3SCxxkUKAS0M4sigOcTr8TfGKAsmvELBFrZfvbwtm
 jh3Mb/KCZgqXb4PUobrh0yKX2kW2u599U4sHbgZCZtpwnaFVHEJfRLrR0BSv2Q4kd/2cJzk7kNIzj
 EYeVUSTg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1la5Yy-00Em66-Bw; Fri, 23 Apr 2021 23:50:21 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8C0FF6147D;
 Fri, 23 Apr 2021 23:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619221819;
 bh=ztQ6BB47y5pg5s5XIXQqZ3xaTwRQkbGaRUPw9y7VJVo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=r+YzHc/0eGDg4hwwB3cYiV49KICfpmWTjscSSChhp1hV5Vp/6IQ8zeD5bUKlSThji
 z5+OItSlKRar+wz1Rs2X95GRyma8bLcyOPGJDKaEkNtjz3JbBjdR8J8mSCI63chQej
 cgZga8jXru0D2gmdMXea1ZkdDVB9krzXfz6jKW9buMpXW20FipCReVj+/BpBwsOO2U
 U4Otj5Zvx3M8SKv1qrkGIvlDiREReUY6vfx7UnoepHb3MmDb3wmsXXCNXmPyLn4oYs
 XZQ6jNJ3iabzEB1tZIsxr54OUD5rFQdV6f8xdIeFEXgzmC4amvF0RMhsYLM36qEucG
 Y8UUklQNk/n+g==
Received: by mail-ed1-f43.google.com with SMTP id g17so58521902edm.6;
 Fri, 23 Apr 2021 16:50:19 -0700 (PDT)
X-Gm-Message-State: AOAM531AkBKTQXvniqmlGRTKH6cfaPtXqzVW3rBXK6k4VzufxJ/AZnP9
 i5O6LkdC5kNMsvZ6cTspFY27dS9aRrtjHqMsCA==
X-Google-Smtp-Source: ABdhPJzlVD28y0pYvsLPGGp62BNLpS8yONHuPO054avTUO5tWEZi+o/N9PFsuZ2V+7mlxrPRRUsealY34YDjmiFn7cA=
X-Received: by 2002:a05:6402:1157:: with SMTP id
 g23mr7364478edw.303.1619221818075; 
 Fri, 23 Apr 2021 16:50:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210420132614.150242-1-jitao.shi@mediatek.com>
 <20210420132614.150242-4-jitao.shi@mediatek.com>
In-Reply-To: <20210420132614.150242-4-jitao.shi@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 24 Apr 2021 07:50:07 +0800
X-Gmail-Original-Message-ID: <CAAOTY__JZsAmGtX-+hNu0123xKoEdP2CgGxmQK2bqa-i+3dr6Q@mail.gmail.com>
Message-ID: <CAAOTY__JZsAmGtX-+hNu0123xKoEdP2CgGxmQK2bqa-i+3dr6Q@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/mediatek: add dsi module reset driver
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
X-CRM114-CacheID: sfid-20210423_165020_481770_8C96E9FA 
X-CRM114-Status: GOOD (  22.86  )
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
tDTmnIgyMOaXpSDpgLHkuowg5LiL5Y2IOToyNuWvq+mBk++8mgo+Cj4gUmVzZXQgZHNpIEhXIHRv
IGRlZmF1bHQgd2hlbiBwb3dlciBvbi4gUHJldmVudCB0aGUgc2V0dGluZyBkaWZmZXJldAo+IGJl
dHdlZW4gYm9vdGxvYWRlciBhbmQga2VybmVsLgo+Cj4gU2lnbmVkLW9mZi1ieTogSml0YW8gU2hp
IDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RzaS5jIHwgMzYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKystCj4gIDEgZmls
ZSBjaGFuZ2VkLCAzNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHNpLmMKPiBpbmRleCA0NTVmZTU4MmM2YjUuLjExMzQzOGRkZDRjYyAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+IEBAIC03LDEwICs3LDEyIEBACj4gICNp
bmNsdWRlIDxsaW51eC9jb21wb25lbnQuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2lvcG9sbC5oPgo+
ICAjaW5jbHVkZSA8bGludXgvaXJxLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9tZmQvc3lzY29uLmg+
Cj4gICNpbmNsdWRlIDxsaW51eC9vZi5oPgo+ICAjaW5jbHVkZSA8bGludXgvb2ZfcGxhdGZvcm0u
aD4KPiAgI2luY2x1ZGUgPGxpbnV4L3BoeS9waHkuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3BsYXRm
b3JtX2RldmljZS5oPgo+ICsjaW5jbHVkZSA8bGludXgvcmVnbWFwLmg+Cj4KPiAgI2luY2x1ZGUg
PHZpZGVvL21pcGlfZGlzcGxheS5oPgo+ICAjaW5jbHVkZSA8dmlkZW8vdmlkZW9tb2RlLmg+Cj4g
QEAgLTE0Myw2ICsxNDUsOCBAQAo+ICAjZGVmaW5lIERBVEFfMCAgICAgICAgICAgICAgICAgICAg
ICAgICAoMHhmZiA8PCAxNikKPiAgI2RlZmluZSBEQVRBXzEgICAgICAgICAgICAgICAgICAgICAg
ICAgKDB4ZmYgPDwgMjQpCj4KPiArI2RlZmluZSBNTVNZU19TV19SU1RfRFNJX0IgQklUKDI1KQo+
ICsKPiAgI2RlZmluZSBOU19UT19DWUNMRShuLCBjKSAgICAoKG4pIC8gKGMpICsgKCgobikgJSAo
YykpID8gMSA6IDApKQo+Cj4gICNkZWZpbmUgTVRLX0RTSV9IT1NUX0lTX1JFQUQodHlwZSkgXAo+
IEBAIC0xODYsNyArMTkwLDggQEAgc3RydWN0IG10a19kc2kgewo+ICAgICAgICAgc3RydWN0IGRy
bV9icmlkZ2UgKm5leHRfYnJpZGdlOwo+ICAgICAgICAgc3RydWN0IGRybV9jb25uZWN0b3IgKmNv
bm5lY3RvcjsKPiAgICAgICAgIHN0cnVjdCBwaHkgKnBoeTsKPiAtCj4gKyAgICAgICBzdHJ1Y3Qg
cmVnbWFwICptbXN5c19zd19yc3RfYjsKPiArICAgICAgIHUzMiBzd19yc3RfYjsKPiAgICAgICAg
IHZvaWQgX19pb21lbSAqcmVnczsKPgo+ICAgICAgICAgc3RydWN0IGNsayAqZW5naW5lX2NsazsK
PiBAQCAtMjcyLDYgKzI3NywxNiBAQCBzdGF0aWMgdm9pZCBtdGtfZHNpX2Rpc2FibGUoc3RydWN0
IG10a19kc2kgKmRzaSkKPiAgICAgICAgIG10a19kc2lfbWFzayhkc2ksIERTSV9DT05fQ1RSTCwg
RFNJX0VOLCAwKTsKPiAgfQo+Cj4gK3N0YXRpYyB2b2lkIG10a19kc2lfcmVzZXRfYWxsKHN0cnVj
dCBtdGtfZHNpICpkc2kpCj4gK3sKPiArICAgICAgIHJlZ21hcF91cGRhdGVfYml0cyhkc2ktPm1t
c3lzX3N3X3JzdF9iLCBkc2ktPnN3X3JzdF9iLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
IE1NU1lTX1NXX1JTVF9EU0lfQiwgMCk7Cj4gKyAgICAgICB1c2xlZXBfcmFuZ2UoMTAwMCwgMTEw
MCk7Cj4gKwo+ICsgICAgICAgcmVnbWFwX3VwZGF0ZV9iaXRzKGRzaS0+bW1zeXNfc3dfcnN0X2Is
IGRzaS0+c3dfcnN0X2IsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgTU1TWVNfU1dfUlNU
X0RTSV9CLCBNTVNZU19TV19SU1RfRFNJX0IpOwo+ICt9Cj4gKwo+ICBzdGF0aWMgdm9pZCBtdGtf
ZHNpX3Jlc2V0X2VuZ2luZShzdHJ1Y3QgbXRrX2RzaSAqZHNpKQo+ICB7Cj4gICAgICAgICBtdGtf
ZHNpX21hc2soZHNpLCBEU0lfQ09OX0NUUkwsIERTSV9SRVNFVCwgRFNJX1JFU0VUKTsKPiBAQCAt
OTg1LDYgKzEwMDAsOCBAQCBzdGF0aWMgaW50IG10a19kc2lfYmluZChzdHJ1Y3QgZGV2aWNlICpk
ZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3Rlciwgdm9pZCAqZGF0YSkKPgo+ICAgICAgICAgcmV0ID0g
bXRrX2RzaV9lbmNvZGVyX2luaXQoZHJtLCBkc2kpOwo+Cj4gKyAgICAgICBtdGtfZHNpX3Jlc2V0
X2FsbChkc2kpOwo+ICsKPiAgICAgICAgIHJldHVybiByZXQ7Cj4gIH0KPgo+IEBAIC0xMDA3LDYg
KzEwMjQsNyBAQCBzdGF0aWMgaW50IG10a19kc2lfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikKPiAgICAgICAgIHN0cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7Cj4gICAg
ICAgICBzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbDsKPiAgICAgICAgIHN0cnVjdCByZXNvdXJjZSAq
cmVnczsKPiArICAgICAgIHN0cnVjdCByZWdtYXAgKnJlZ21hcDsKPiAgICAgICAgIGludCBpcnFf
bnVtOwo+ICAgICAgICAgaW50IHJldDsKPgo+IEBAIC0xMDIyLDYgKzEwNDAsMjIgQEAgc3RhdGlj
IGludCBtdGtfZHNpX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gICAgICAg
ICAgICAgICAgIHJldHVybiByZXQ7Cj4gICAgICAgICB9Cj4KPiArICAgICAgIHJlZ21hcCA9IHN5
c2Nvbl9yZWdtYXBfbG9va3VwX2J5X3BoYW5kbGUoZGV2LT5vZl9ub2RlLAo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAibWVkaWF0ZWssc3lzY29uLWRz
aSIpOwo+ICsgICAgICAgcmV0ID0gb2ZfcHJvcGVydHlfcmVhZF91MzJfaW5kZXgoZGV2LT5vZl9u
b2RlLCAibWVkaWF0ZWssc3lzY29uLWRzaSIsIDEsCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAmZHNpLT5zd19yc3RfYik7Cj4gKwo+ICsgICAgICAgaWYgKElTX0VS
UihyZWdtYXApKQo+ICsgICAgICAgICAgICAgICByZXQgPSBQVFJfRVJSKHJlZ21hcCk7Cj4gKwo+
ICsgICAgICAgaWYgKHJldCkgewo+ICsgICAgICAgICAgICAgICByZXQgPSBQVFJfRVJSKHJlZ21h
cCk7Cj4gKyAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiRmFpbGVkIHRvIGdldCBtbXN5cyBy
ZWdpc3RlcnM6ICVkXG4iLCByZXQpOwo+ICsgICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ICsg
ICAgICAgfQo+ICsKPiArICAgICAgIGRzaS0+bW1zeXNfc3dfcnN0X2IgPSByZWdtYXA7Cj4gKwoK
SXQgbG9va3MgbGlrZSB0aGF0IG10ay1tbXN5cyBpcyB0aGUgcmVzZXQgY29udHJvbGxlciBhbmQg
bXRrLWRzaSBpcwpyZXNldCBjb25zdW1lci4gUGxlYXNlIHJlZmVyIHRvIFsxXSwgWzJdIHRvIGlt
cGxlbWVudC4KClsxXSBodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL2xhdGVzdC9kcml2
ZXItYXBpL3Jlc2V0Lmh0bWwKWzJdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51
eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9yZXNldC9yZXNldC50eHQ/aD12NS4xMi1yYzgKClJlZ2FyZHMsCkNodW4t
S3VhbmcuCgo+ICAgICAgICAgcmV0ID0gZHJtX29mX2ZpbmRfcGFuZWxfb3JfYnJpZGdlKGRldi0+
b2Zfbm9kZSwgMCwgMCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAmcGFuZWwsICZkc2ktPm5leHRfYnJpZGdlKTsKPiAgICAgICAgIGlmIChyZXQpCj4gLS0KPiAy
LjI1LjEKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0
ZWsK
