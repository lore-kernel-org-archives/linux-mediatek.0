Return-Path: <SRS0=rPqH=BG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62B06C433E5
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 14:51:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20B6020775
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2020 14:51:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nbWST9pw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="N6L+nvbc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20B6020775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YBDp4o/kKmcNx3+z8IxUVOup7DJA5qIsanZcIq3lHGk=; b=nbWST9pw8JUauHwMBstDazZ8U
	NBPD65ZmSUE0KUy8hn/jMFE2Vh3KC5LLkE+OQOGVgPdcTJWtiUIjqwl7D5UeEuNgq00sPY1YVR/Vd
	V37iy627GU6eq6xcGwzgXG145u4xYA1iW9qx0wrpZMAXmjSEFQwChUp3WGTJXqBSKk8ghaO6QBqVF
	IXiIePPDDaAJx+mAPN95sLJwgcPScGblGiqDL6PBDLCWmmy/O5mWrQbsnkZdDIIRA0bJgi76v07hz
	YS43RcLW5WEfy22aKMVbI9JiU/wSEGL9C0LuT8nX5+vC2jw2IWqsZttgV89EfKFjweHk4GV0HjBw6
	BEIy0uaAQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k04Sx-0003ga-My; Mon, 27 Jul 2020 14:50:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k04St-0003fD-2E; Mon, 27 Jul 2020 14:50:56 +0000
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F39BF20FC3;
 Mon, 27 Jul 2020 14:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595861454;
 bh=X2JcmQLapGD/be7xhyIu8ppnMrgOK1IeDnlemxXWS2Y=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=N6L+nvbc31b6FNedS/fMRDlLAFurRdNk0HPcMYqo8EJri5oUeiRPOYRB508Jy3JdK
 qE9xLArrdgnBVRCMx34XuleagS7K+pMQ1wgAe+hiBFZpA5NEWXYNenqTsIbA4gX2AC
 jMJGGg2sEkka/fltzwYZUeAvibAeF95uUnj7zBTA=
Received: by mail-ej1-f49.google.com with SMTP id g19so3543366ejc.9;
 Mon, 27 Jul 2020 07:50:53 -0700 (PDT)
X-Gm-Message-State: AOAM531GNJ5Hb0g72Jq2VjNtqeM6tgwq4ew2IDYFOU/XSl7m4jfDo/eN
 N1angiVZ6zNhc3SOK+/wK9S5eojnP0FFajoRtA==
X-Google-Smtp-Source: ABdhPJyfw45qjwGTCjkSEVhe9T06czwzA40FRvdDXbs+qhY1AaG72uIPAub3y+32mZt7m5FaTB+yhXKiJsoeEZueZc4=
X-Received: by 2002:a17:906:b6d0:: with SMTP id
 ec16mr1858571ejb.94.1595861452516; 
 Mon, 27 Jul 2020 07:50:52 -0700 (PDT)
MIME-Version: 1.0
References: <1595469798-3824-1-git-send-email-yongqiang.niu@mediatek.com>
 <1595469798-3824-8-git-send-email-yongqiang.niu@mediatek.com>
 <CAAOTY_9hdvw7htuOkJmmmGR9SAev4O+kWuMopfP_F=8Vg=_U+A@mail.gmail.com>
 <1595836355.13250.24.camel@mhfsdcap03>
In-Reply-To: <1595836355.13250.24.camel@mhfsdcap03>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 27 Jul 2020 22:50:39 +0800
X-Gmail-Original-Message-ID: <CAAOTY_84qPMZPSpXvF9=hCWVPQ2Y4ndZB8gt8E_ZpuxQ0YiitQ@mail.gmail.com>
Message-ID: <CAAOTY_84qPMZPSpXvF9=hCWVPQ2Y4ndZB8gt8E_ZpuxQ0YiitQ@mail.gmail.com>
Subject: Re: [v7, PATCH 7/7] drm/mediatek: add support for mediatek SOC MT8183
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_105055_242774_89E2DD8C 
X-CRM114-Status: GOOD (  30.78  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
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

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMOW5tDfmnIgyN+aXpSDpgLHkuIAg5LiL5Y2IMzo1NOWvq+mBk++8mgo+Cj4gT24g
U2F0LCAyMDIwLTA3LTI1IGF0IDA3OjI0ICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOgo+ID4g
SGkgWW9uZ3FpYW5nOgo+ID4KPiA+IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0
ZWsuY29tPiDmlrwgMjAyMOW5tDfmnIgyM+aXpSDpgLHlm5sg5LiK5Y2IMTA6MTXlr6vpgZPvvJoK
PiA+ID4KPiA+ID4gVGhpcyBwYXRjaCBhZGQgc3VwcG9ydCBmb3IgbWVkaWF0ZWsgU09DIE1UODE4
Mwo+ID4gPiAxLm92bF8ybCBzaGFyZSBkcml2ZXIgd2l0aCBvdmwKPiA+Cj4gPiBJIHRoaW5rIHRo
aXMgaXMgZG9uZSBpbiBbMV0sIFsyXSwgWzNdLCB0aGlzIHBhdGNoIGp1c3QgYWRkIHRoZSBzdXBw
b3J0Cj4gPiBvZiBtdDgxODMtb3ZsIGFuZCBtdDgxODMtb3ZsLTJsLgo+ID4KPiA+IFsxXSBodHRw
czovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51
eC5naXQvY29tbWl0L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlaz9oPXY1LjgtcmM2JmlkPTEzMmM2
ZTI1MGVkNzQ1NDQzOTczY2FkYThkYjE3Y2RiYWViZGY1NTEKPiA+IFsyXSBodHRwczovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvY29t
bWl0L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlaz9oPXY1LjgtcmM2JmlkPTMxODQ2MmQxYTU2ODYz
NGJhMDkyNjNjYzczMGNiMGZiMWQ1NmMyYjMKPiA+IFszXSBodHRwczovL2dpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvY29tbWl0L2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlaz9oPXY1LjgtcmM2JmlkPTU3MTQ4YmFhYzhiNzg0NjFlMzk0OTUz
Y2ZkNTMxN2JkZThmNzk1YWIKPiA+Cj4gPiA+IDIucmRtYTEgc2hhcmUgZHJpdmUgd2l0aCByZG1h
MCwgYnV0IGZpZm8gc2l6ZSBpcyBkaWZmZXJlbnQKPiA+Cj4gPiBJIHRoaW5rIHRoaXMgaXMgZG9u
ZSBpbiBbNF0sIHRoaXMgcGF0Y2gganVzdCBhZGQgdGhlIHN1cHBvcnQgb2YgbXQ4MTgzLXJkbWEu
Cj4gPgo+ID4gWzRdIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTE2Nzk1NDkv
Cj4gPgo+ID4gPiAzLmFkZCBtdDgxODMgbXV0ZXggcHJpdmF0ZSBkYXRhLCBhbmQgbW1zeXMgcHJp
dmF0ZSBkYXRhCj4gPiA+IDQuYWRkIG10ODE4MyBtYWluIGFuZCBleHRlcm5hbCBwYXRoIG1vZHVs
ZSBmb3IgY3J0YyBjcmVhdGUKPiA+Cj4gPiBUaGUgZm91cnRoIGl0ZW0gaXMgdGhlIG1tc3lzIHBy
aXZhdGUgZGF0YSBpbiB0aGlyZCBpdGVtLCBzbyB5b3UgbmVlZAo+ID4gbm90IHRvIHJlcGVhdCBp
dC4KPiA+Cj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFu
Zy5uaXVAbWVkaWF0ZWsuY29tPgo+ID4gPiAtLS0KPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZGlzcF9vdmwuYyAgfCAxOCArKysrKysrKysrKysKPiA+ID4gIGRyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZGlzcF9yZG1hLmMgfCAgNiArKysrCj4gPiA+ICBkcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYyAgIHwgNDcgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysKPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5j
ICAgfCA0MyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gPiAgNCBmaWxlcyBjaGFu
Z2VkLCAxMTQgaW5zZXJ0aW9ucygrKQo+ID4gPgo+ID4KPiA+IFtzbmlwXQo+ID4KPiA+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jIGIvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMKPiA+ID4gaW5kZXggMDE0YzFiYi4uNjA3
ODhjMSAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1f
ZGRwLmMKPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMK
PiA+ID4gQEAgLTE1LDYgKzE1LDggQEAKPiA+ID4KPiA+ID4gICNkZWZpbmUgTVQyNzAxX0RJU1Bf
TVVURVgwX01PRDAgICAgICAgICAgICAgICAgICAgICAgICAweDJjCj4gPiA+ICAjZGVmaW5lIE1U
MjcwMV9ESVNQX01VVEVYMF9TT0YwICAgICAgICAgICAgICAgICAgICAgICAgMHgzMAo+ID4gPiAr
I2RlZmluZSBNVDgxODNfRElTUF9NVVRFWDBfTU9EMCAgICAgICAgICAgICAgICAgICAgICAgIDB4
MzAKPiA+ID4gKyNkZWZpbmUgTVQ4MTgzX0RJU1BfTVVURVgwX1NPRjAgICAgICAgICAgICAgICAg
ICAgICAgICAweDJjCj4gPiA+Cj4gPiA+ICAjZGVmaW5lIERJU1BfUkVHX01VVEVYX0VOKG4pICAg
ICAgICAgICAgICAgICAgICgweDIwICsgMHgyMCAqIChuKSkKPiA+ID4gICNkZWZpbmUgRElTUF9S
RUdfTVVURVgobikgICAgICAgICAgICAgICAgICAgICAgKDB4MjQgKyAweDIwICogKG4pKQo+ID4g
PiBAQCAtMjUsNiArMjcsMTggQEAKPiA+ID4KPiA+ID4gICNkZWZpbmUgSU5UX01VVEVYICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgQklUKDEpCj4gPiA+Cj4gPiA+ICsjZGVmaW5lIE1UODE4
M19NVVRFWF9NT0RfRElTUF9SRE1BMCAgICAgICAgICAgIDAKPiA+ID4gKyNkZWZpbmUgTVQ4MTgz
X01VVEVYX01PRF9ESVNQX1JETUExICAgICAgICAgICAgMQo+ID4gPiArI2RlZmluZSBNVDgxODNf
TVVURVhfTU9EX0RJU1BfT1ZMMCAgICAgICAgICAgICA5Cj4gPiA+ICsjZGVmaW5lIE1UODE4M19N
VVRFWF9NT0RfRElTUF9PVkwwXzJMICAgICAgICAgIDEwCj4gPiA+ICsjZGVmaW5lIE1UODE4M19N
VVRFWF9NT0RfRElTUF9PVkwxXzJMICAgICAgICAgIDExCj4gPiA+ICsjZGVmaW5lIE1UODE4M19N
VVRFWF9NT0RfRElTUF9XRE1BMCAgICAgICAgICAgIDEyCj4gPiA+ICsjZGVmaW5lIE1UODE4M19N
VVRFWF9NT0RfRElTUF9DT0xPUjAgICAgICAgICAgIDEzCj4gPiA+ICsjZGVmaW5lIE1UODE4M19N
VVRFWF9NT0RfRElTUF9DQ09SUjAgICAgICAgICAgIDE0Cj4gPiA+ICsjZGVmaW5lIE1UODE4M19N
VVRFWF9NT0RfRElTUF9BQUwwICAgICAgICAgICAgIDE1Cj4gPiA+ICsjZGVmaW5lIE1UODE4M19N
VVRFWF9NT0RfRElTUF9HQU1NQTAgICAgICAgICAgIDE2Cj4gPiA+ICsjZGVmaW5lIE1UODE4M19N
VVRFWF9NT0RfRElTUF9ESVRIRVIwICAgICAgICAgIDE3Cj4gPiA+ICsKPiA+ID4gICNkZWZpbmUg
TVQ4MTczX01VVEVYX01PRF9ESVNQX09WTDAgICAgICAgICAgICAgMTEKPiA+ID4gICNkZWZpbmUg
TVQ4MTczX01VVEVYX01PRF9ESVNQX09WTDEgICAgICAgICAgICAgMTIKPiA+ID4gICNkZWZpbmUg
TVQ4MTczX01VVEVYX01PRF9ESVNQX1JETUEwICAgICAgICAgICAgMTMKPiA+ID4gQEAgLTc0LDYg
Kzg4LDEwIEBACj4gPiA+ICAjZGVmaW5lIE1VVEVYX1NPRl9EU0kyICAgICAgICAgICAgICAgICA1
Cj4gPiA+ICAjZGVmaW5lIE1VVEVYX1NPRl9EU0kzICAgICAgICAgICAgICAgICA2Cj4gPiA+Cj4g
PiA+ICsjZGVmaW5lIE1UODE4M19NVVRFWF9TT0ZfRFBJMCAgICAgICAgICAgICAgICAgIDIKPiA+
ID4gKyNkZWZpbmUgTVQ4MTgzX01VVEVYX0VPRl9EU0kwICAgICAgICAgICAgICAgICAgKE1VVEVY
X1NPRl9EU0kwIDw8IDYpCj4gPiA+ICsjZGVmaW5lIE1UODE4M19NVVRFWF9FT0ZfRFBJMCAgICAg
ICAgICAgICAgICAgIChNVDgxODNfTVVURVhfU09GX0RQSTAgPDwgNikKPiA+ID4gKwo+ID4gPgo+
ID4gPiAgc3RydWN0IG10a19kaXNwX211dGV4IHsKPiA+ID4gICAgICAgICBpbnQgaWQ7Cj4gPiA+
IEBAIC0xNTMsNiArMTcxLDIwIEBAIHN0cnVjdCBtdGtfZGRwIHsKPiA+ID4gICAgICAgICBbRERQ
X0NPTVBPTkVOVF9XRE1BMV0gPSBNVDgxNzNfTVVURVhfTU9EX0RJU1BfV0RNQTEsCj4gPiA+ICB9
Owo+ID4gPgo+ID4gPiArc3RhdGljIGNvbnN0IHVuc2lnbmVkIGludCBtdDgxODNfbXV0ZXhfbW9k
W0REUF9DT01QT05FTlRfSURfTUFYXSA9IHsKPiA+ID4gKyAgICAgICBbRERQX0NPTVBPTkVOVF9B
QUwwXSA9IE1UODE4M19NVVRFWF9NT0RfRElTUF9BQUwwLAo+ID4gPiArICAgICAgIFtERFBfQ09N
UE9ORU5UX0NDT1JSXSA9IE1UODE4M19NVVRFWF9NT0RfRElTUF9DQ09SUjAsCj4gPiA+ICsgICAg
ICAgW0REUF9DT01QT05FTlRfQ09MT1IwXSA9IE1UODE4M19NVVRFWF9NT0RfRElTUF9DT0xPUjAs
Cj4gPiA+ICsgICAgICAgW0REUF9DT01QT05FTlRfRElUSEVSXSA9IE1UODE4M19NVVRFWF9NT0Rf
RElTUF9ESVRIRVIwLAo+ID4gPiArICAgICAgIFtERFBfQ09NUE9ORU5UX0dBTU1BXSA9IE1UODE4
M19NVVRFWF9NT0RfRElTUF9HQU1NQTAsCj4gPiA+ICsgICAgICAgW0REUF9DT01QT05FTlRfT1ZM
MF0gPSBNVDgxODNfTVVURVhfTU9EX0RJU1BfT1ZMMCwKPiA+ID4gKyAgICAgICBbRERQX0NPTVBP
TkVOVF9PVkxfMkwwXSA9IE1UODE4M19NVVRFWF9NT0RfRElTUF9PVkwwXzJMLAo+ID4gPiArICAg
ICAgIFtERFBfQ09NUE9ORU5UX09WTF8yTDFdID0gTVQ4MTgzX01VVEVYX01PRF9ESVNQX09WTDFf
MkwsCj4gPiA+ICsgICAgICAgW0REUF9DT01QT05FTlRfUkRNQTBdID0gTVQ4MTgzX01VVEVYX01P
RF9ESVNQX1JETUEwLAo+ID4gPiArICAgICAgIFtERFBfQ09NUE9ORU5UX1JETUExXSA9IE1UODE4
M19NVVRFWF9NT0RfRElTUF9SRE1BMSwKPiA+ID4gKyAgICAgICBbRERQX0NPTVBPTkVOVF9XRE1B
MF0gPSBNVDgxODNfTVVURVhfTU9EX0RJU1BfV0RNQTAsCj4gPiA+ICt9Owo+ID4gPiArCj4gPiA+
ICBzdGF0aWMgY29uc3QgdW5zaWduZWQgaW50IG10MjcxMl9tdXRleF9zb2ZbRERQX01VVEVYX1NP
Rl9EU0kzICsgMV0gPSB7Cj4gPiA+ICAgICAgICAgW0REUF9NVVRFWF9TT0ZfU0lOR0xFX01PREVd
ID0gTVVURVhfU09GX1NJTkdMRV9NT0RFLAo+ID4gPiAgICAgICAgIFtERFBfTVVURVhfU09GX0RT
STBdID0gTVVURVhfU09GX0RTSTAsCj4gPiA+IEBAIC0xNjMsNiArMTk1LDEyIEBAIHN0cnVjdCBt
dGtfZGRwIHsKPiA+ID4gICAgICAgICBbRERQX01VVEVYX1NPRl9EU0kzXSA9IE1VVEVYX1NPRl9E
U0kzLAo+ID4gPiAgfTsKPiA+ID4KPiA+ID4gK3N0YXRpYyBjb25zdCB1bnNpZ25lZCBpbnQgbXQ4
MTgzX211dGV4X3NvZltERFBfTVVURVhfU09GX0RTSTMgKyAxXSA9IHsKPiA+ID4gKyAgICAgICBb
RERQX01VVEVYX1NPRl9TSU5HTEVfTU9ERV0gPSBNVVRFWF9TT0ZfU0lOR0xFX01PREUsCj4gPiA+
ICsgICAgICAgW0REUF9NVVRFWF9TT0ZfRFNJMF0gPSBNVVRFWF9TT0ZfRFNJMCB8IE1UODE4M19N
VVRFWF9FT0ZfRFNJMCwKPiA+Cj4gPiBJIHRoaW5rIHRoaXMgYXJyYXkgaXMgZm9yICdzb2YnLCBz
byB5b3Ugc2hvdWxkIGRyb3AgTVQ4MTgzX01VVEVYX0VPRl9EU0kwLgo+ID4KPiA+ID4gKyAgICAg
ICBbRERQX01VVEVYX1NPRl9EUEkwXSA9IE1UODE4M19NVVRFWF9TT0ZfRFBJMCB8IE1UODE4M19N
VVRFWF9FT0ZfRFBJMCwKPiA+Cj4gPiBEaXR0by4KPiA+Cj4gPiBSZWdhcmRzLAo+ID4gQ2h1bi1L
dWFuZy4KPgo+IE1UODE4MyBtdXRleCBzZXR0aW5nIGlzIGRpZmZlcmVudCB3aXRoIGJlZm9yZSBT
b0MuCj4gaWYgd2UgZG8gbm90IHNldCBFT0YsIE92ZXJsYXkgaGFyZHdhcmUgd2lsbCBub3QgcmVj
ZWl2ZSBmcmFtZSBkb25lIGlycSwKPiBhbmQgd2lsbCBkaXNwbGF5IGVycm9yLgoKUGxlYXNlIGFk
ZCBjb21tZW50IGZvciB0aGlzIGJlY2F1c2UgdGhpcyBpcyBub3QgYSB0cml2aWFsIHRoaW5nLgoK
UmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4gPgo+ID4gPiArfTsKPiA+ID4gKwo+ID4gPiAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBtdGtfZGRwX2RhdGEgbXQyNzAxX2RkcF9kcml2ZXJfZGF0YSA9IHsKPiA+
ID4gICAgICAgICAubXV0ZXhfbW9kID0gbXQyNzAxX211dGV4X21vZCwKPiA+ID4gICAgICAgICAu
bXV0ZXhfc29mID0gbXQyNzEyX211dGV4X3NvZiwKPiA+ID4gQEAgLTE4NCw2ICsyMjIsMTMgQEAg
c3RydWN0IG10a19kZHAgewo+ID4gPiAgICAgICAgIC5tdXRleF9zb2ZfcmVnID0gTVQyNzAxX0RJ
U1BfTVVURVgwX1NPRjAsCj4gPiA+ICB9Owo+ID4gPgo+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGlu
dXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
