Return-Path: <SRS0=RXgq=A4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3B2CC433E4
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2020 18:20:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B6F320737
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2020 18:20:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zruPivoI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DnZo+JEq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B6F320737
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PF2rUrIkCLITaWHbbYCvOpF7hp+EaWf1+5sANBHLs3Q=; b=zruPivoIwcZrAvMTYnYrUSQtl
	gsacfSmhvgZ+FR/Du1sIMwDbqDlE4N9LJAXU3lGqKG0miOwmWKZqYSZIloO3X8z8R0pI12LvVI6eu
	RTupMU2sXpQucDrEX4bA5/ziECnBl9oxt9/lsA9U9Meh/+SH7nbuAVv75/QNXWNEuDafWDr6m8bNV
	j95geAkdEkWlBGhx6sBLMk9sG6lG5VY9jiCwHj/BBsD4sPu2FZhyoLcx+oEyPzf5Jtr9x5Ujbp4Jn
	M8Gb0AbfkCdRyc837prCC23vPFppQY4JBK0b4/ltIyVjjZQrnenfVgcAAuxPs5l8hovAGj8KuXzJG
	Yg6NgFwrw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwUxx-000694-2M; Fri, 17 Jul 2020 18:20:13 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwUxu-000685-8D
 for linux-mediatek@lists.infradead.org; Fri, 17 Jul 2020 18:20:11 +0000
Received: by mail-ej1-x644.google.com with SMTP id a1so11800092ejg.12
 for <linux-mediatek@lists.infradead.org>; Fri, 17 Jul 2020 11:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=aGUvFH+sODfGIbVPA5R44eiPHp7FCQwvL8xoNLjysts=;
 b=DnZo+JEqaDbavlZz8p8DiPCRVZHjOz56yKaUpS3worr5AQqymgVVTL6a3jenXTKBNH
 xX2VFpaebECIhF3ezCKrv45//Jh6LxuWJjQsA7us8IZBD+S78eB8zojD8gJrVGcT+DD3
 n5eb6TIrtzwVBziA4eEs09PZmZA7BDAQtv9gg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=aGUvFH+sODfGIbVPA5R44eiPHp7FCQwvL8xoNLjysts=;
 b=pDSlGeyjsMeaphNTbL6E6GK+YQfc6QNg3n3fmJQEWJYCFA0tNC6S5JNFm48isdfaGV
 Y+W/iWi1aawqsKVDspQ+P+TFXu021NZKsY5JsUGXx9qCt5NMzDc0qC+3rDMCbkQl0/Ez
 v80WBuX4WYtq8H1Kz7nm1+YVQ3whITTFHhJuClls/pCrFvBpJa4qI19ynosRqhKIIEVs
 2y7eEfO1/5OkXtFgpRvHB7GbkN+v28cBX9dMUDJwKOUrA9drC0Qs3UYp8OfpriaSHzP9
 Tlf5Bg2AQddKftCBBiJInuosf3XjDx4E44boS4YWMSqWC8zi1KcGU2UuZSWLGc8NnZC2
 ETvQ==
X-Gm-Message-State: AOAM531sBu3iFSSt3AzzrjD54P3qhmSppnrRSx3AIqQ9YvspJxInCyb2
 H0+wnUF/PCJA96I9UASlW6fwcXyNNCE=
X-Google-Smtp-Source: ABdhPJywj9sTPiwOFvMIHJCKeLbtQBTyi3NlDaJ8TCKYIGF0r9NPRI8DdMCgtFUmNedtKEyZvT/DDQ==
X-Received: by 2002:a17:906:3152:: with SMTP id
 e18mr10104099eje.137.1595010007312; 
 Fri, 17 Jul 2020 11:20:07 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com.
 [209.85.221.51])
 by smtp.gmail.com with ESMTPSA id d22sm8436540ejc.90.2020.07.17.11.20.04
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jul 2020 11:20:05 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id q5so12100767wru.6
 for <linux-mediatek@lists.infradead.org>; Fri, 17 Jul 2020 11:20:04 -0700 (PDT)
X-Received: by 2002:adf:80e6:: with SMTP id 93mr11251489wrl.17.1595010004058; 
 Fri, 17 Jul 2020 11:20:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200708104023.3225-1-louis.kuo@mediatek.com>
 <20200708104023.3225-2-louis.kuo@mediatek.com>
 <CAAOTY_-+v_t3Vv-Ms7k9jCxJ+0B9qb93tBkL=3OmpMLeyAdV-g@mail.gmail.com>
 <b7b77606aa3e476aa68b2fa116329f84@mtkmbs02n2.mediatek.inc>
 <CAAOTY__Jeu67-jajV5jysoTTXPoKXuXpvbGzHFYsUKG=j44sQg@mail.gmail.com>
 <CAAFQd5B=e6bcmeO5LBd7eqOWaVvbzPKEv2nJHUfpUVJ3ruFqRg@mail.gmail.com>
 <CAAOTY_9S9Jq=+Na7JRmhEaJyFaVnvuVn2HSRa8mChuxtqGiGKg@mail.gmail.com>
In-Reply-To: <CAAOTY_9S9Jq=+Na7JRmhEaJyFaVnvuVn2HSRa8mChuxtqGiGKg@mail.gmail.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Fri, 17 Jul 2020 20:19:51 +0200
X-Gmail-Original-Message-ID: <CAAFQd5AzXGnFxkNCS4cUZXDHFN0Ha8fRAet9wqWdo9b8NNFb3A@mail.gmail.com>
Message-ID: <CAAFQd5AzXGnFxkNCS4cUZXDHFN0Ha8fRAet9wqWdo9b8NNFb3A@mail.gmail.com>
Subject: Re: [RFC PATCH V7 1/3] media: platform: mtk-isp: Add Mediatek sensor
 interface driver
To: =?UTF-8?B?TG91aXMgS3VvICjpg63lvrflr6cp?= <louis.kuo@mediatek.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200717_142010_331211_34402E9D 
X-CRM114-Status: GOOD (  30.01  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?U2VhbiBDaGVuZyAo6YSt5piH5byYKQ==?= <Sean.Cheng@mediatek.com>,
 "laurent.pinchart+renesas@ideasonboard.com"
 <laurent.pinchart+renesas@ideasonboard.com>,
 =?UTF-8?B?Q2hyaXN0aWUgWXUgKOa4uOmbheaDoCk=?= <christie.yu@mediatek.com>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 =?UTF-8?B?SmVycnktY2ggQ2hlbiAo6Zmz5pWs5oayKQ==?= <Jerry-ch.Chen@mediatek.com>,
 "keiichiw@chromium.org" <keiichiw@chromium.org>,
 =?UTF-8?B?SnVuZ28gTGluICjmnpfmmI7kv4op?= <jungo.lin@mediatek.com>,
 =?UTF-8?B?U2ogSHVhbmcgKOm7g+S/oeeSiyk=?= <sj.huang@mediatek.com>,
 "yuzhao@chromium.org" <yuzhao@chromium.org>,
 "hans.verkuil@cisco.com" <hans.verkuil@cisco.com>,
 "zwisler@chromium.org" <zwisler@chromium.org>,
 =?UTF-8?B?RnJlZGVyaWMgQ2hlbiAo6Zmz5L+K5YWDKQ==?= <Frederic.Chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBKdWwgMTcsIDIwMjAgYXQgNTo0NyBQTSBDaHVuLUt1YW5nIEh1IDxjaHVua3Vhbmcu
aHVAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBUb21hc3ogRmlnYSA8dGZpZ2FAY2hyb21pdW0ub3Jn
PiDmlrwgMjAyMOW5tDfmnIgxN+aXpSDpgLHkupQg5LiL5Y2IMTA6MzPlr6vpgZPvvJoKPiA+Cj4g
PiBPbiBGcmksIEp1bCAxNywgMjAyMCBhdCA0OjIxIFBNIENodW4tS3VhbmcgSHUgPGNodW5rdWFu
Zy5odUBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4KPiA+ID4gSGksIExvdWlzOgo+ID4gPgo+ID4g
PiBMb3VpcyBLdW8gKOmDreW+t+WvpykgPGxvdWlzLmt1b0BtZWRpYXRlay5jb20+IOaWvCAyMDIw
5bm0N+aciDE35pelIOmAseS6lCDkuIrljYgxMDo1NuWvq+mBk++8mgo+ID4gPiA+Cj4gPiA+ID4g
SGkgQ2h1bi1LdWFuZywKPiA+ID4gPgo+ID4gPiA+IFNpbmNlIHBoeSBkcml2ZXIgaXMgbm90IGJl
bG9uZyB0byBWNEwyIHNjb3BlCj4gPiA+ID4KPiA+ID4gPiBTaG91bGQgSSBuZWVkIHRvIHVwc3Rl
YW0gODE4MyBtaXBpIHBoeSBkcml2ZXIgd2l0aCBuZXcgYSBwYXRjaCBvdGhlciB0aGFuIHRoaXMg
b25lID8KPiA+ID4KPiA+ID4gWWVzLCBJIHRoaW5rIHNvLiBNYXliZSBkaWZmZXJlbnQgc2VyaWVz
IHdvdWxkIGJlIGJldHRlci4KPiA+Cj4gPiBTaW5jZSBib3RoIHdvdWxkIG5vdCBiZSB1c2FibGUg
d2l0aG91dCBlYWNoIG90aGVyLCBJIGJlbGlldmUgdGhleQo+ID4gc2hvdWxkIGJlIGhhbmRsZWQg
YnkgdGhlIHNhbWUgc2VyaWVzLCBhbHRob3VnaCBjYXJlIHNob3VsZCBiZSB0YWtlbiB0bwo+ID4g
aGF2ZSB0aGUgcGF0Y2hlcyBpbiB0aGUgc2VyaWVzIGNsZWFybHkgc2VwYXJhdGVkIGJldHdlZW4g
dGhlIHR3bwo+ID4gc3Vic3lzdGVtcy4KPgo+IE9uZSBzZXJpZXMgaXMgb2sgZm9yIG1lLiBGb3Ig
ZWFjaCBtYWludGFpbmVyLCB0aGV5IGNvdWxkIHBpY2sgd2hhdAo+IHRoZXkgd2FudCBmcm9tIHRo
aXMgc2VyaWVzLCBvciBnZXQgYWNrIGJ5IGFub3RoZXIgbWFpbnRhaW5lciBhbmQgcGljawo+IGFs
bCBwYXRjaGVzIGludG8gb25lIHRyZWUuCgpTb3VuZHMgZ29vZCB0byBtZS4KCkhvd2V2ZXIsIEkn
bSBjdXJyZW50bHkgcmV2aWV3aW5nIHRoZSBzZXJpZXMsIHNvIHdvdWxkIGFwcHJlY2lhdGUKaG9s
ZGluZyBvbiB3aXRoIHRoZSByZXNlbmQuCgpCZXN0IHJlZ2FyZHMsClRvbWFzegoKPgo+IFJlZ2Fy
ZHMsCj4gQ2h1bi1LdWFuZy4KPgo+ID4KPiA+IEJlc3QgcmVnYXJkcywKPiA+IFRvbWFzego+ID4K
PiA+ID4KPiA+ID4gUmVnYXJkcywKPiA+ID4gQ2h1bi1LdWFuZy4KPiA+ID4KPiA+ID4gPgo+ID4g
PiA+IEJScwo+ID4gPiA+IExvdWlzCj4gPiA+ID4KPiA+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQo+ID4gPiA+IEZyb206IENodW4tS3VhbmcgSHUgW21haWx0bzpjaHVua3VhbmcuaHVA
a2VybmVsLm9yZ10KPiA+ID4gPiBTZW50OiBUaHVyc2RheSwgSnVseSA5LCAyMDIwIDk6MTMgUE0K
PiA+ID4gPiBUbzogTG91aXMgS3VvICjpg63lvrflr6cpCj4gPiA+ID4gQ2M6IGhhbnMudmVya3Vp
bEBjaXNjby5jb207IGxhdXJlbnQucGluY2hhcnQrcmVuZXNhc0BpZGVhc29uYm9hcmQuY29tOyBU
b21hc3ogRmlnYTsga2VpaWNoaXdAY2hyb21pdW0ub3JnOyBNYXR0aGlhcyBCcnVnZ2VyOyBNYXVy
byBDYXJ2YWxobyBDaGVoYWI7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBTZWFuIENoZW5n
ICjphK3mmIflvJgpOyBzcnZfaGV1cHN0cmVhbTsgSmVycnktY2ggQ2hlbiAo6Zmz5pWs5oayKTsg
SnVuZ28gTGluICjmnpfmmI7kv4opOyBTaiBIdWFuZyAo6buD5L+h55KLKTsgeXV6aGFvQGNocm9t
aXVtLm9yZzsgbW9kZXJhdGVkIGxpc3Q6QVJNL01lZGlhdGVrIFNvQyBzdXBwb3J0OyB6d2lzbGVy
QGNocm9taXVtLm9yZzsgQ2hyaXN0aWUgWXUgKOa4uOmbheaDoCk7IEZyZWRlcmljIENoZW4gKOmZ
s+S/iuWFgyk7IExpbnV4IEFSTTsgbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCj4gPiA+ID4g
U3ViamVjdDogUmU6IFtSRkMgUEFUQ0ggVjcgMS8zXSBtZWRpYTogcGxhdGZvcm06IG10ay1pc3A6
IEFkZCBNZWRpYXRlayBzZW5zb3IgaW50ZXJmYWNlIGRyaXZlcgo+ID4gPiA+Cj4gPiA+ID4gSGks
IExvdWlzOgo+ID4gPiA+Cj4gPiA+ID4gTG91aXMgS3VvIDxsb3Vpcy5rdW9AbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMOW5tDfmnIg45pelIOmAseS4iSDkuIvljYg2OjQx5a+r6YGT77yaCj4gPiA+ID4g
Pgo+ID4gPiA+ID4gVGhpcyBwYXRjaCBhZGRzIE1lZGlhdGVrJ3Mgc2Vuc29yIGludGVyZmFjZSBk
cml2ZXIuIFNlbnNvciBpbnRlcmZhY2UKPiA+ID4gPiA+IGRyaXZlciBpcyBhIE1JUEktQ1NJMiBo
b3N0IGRyaXZlciwgbmFtZWx5LCBhIEhXIGNhbWVyYSBpbnRlcmZhY2UgY29udHJvbGxlci4KPiA+
ID4gPiA+IEl0IHN1cHBvcnQgYSB3aWRlbHkgYWRvcHRlZCwgc2ltcGxlLCBoaWdoLXNwZWVkIHBy
b3RvY29sIHByaW1hcmlseQo+ID4gPiA+ID4gaW50ZW5kZWQgZm9yIHBvaW50LXRvLXBvaW50IGlt
YWdlIGFuZCB2aWRlbyB0cmFuc21pc3Npb24gYmV0d2Vlbgo+ID4gPiA+ID4gY2FtZXJhcyBhbmQg
aG9zdCBkZXZpY2VzLiBUaGUgbXRrLWlzcCBkaXJlY3Rvcnkgd2lsbCBjb250YWluIGRyaXZlcnMK
PiA+ID4gPiA+IGZvciBtdWx0aXBsZSBJUCBibG9ja3MgZm91bmQgaW4gTWVkaWF0ZWsgSVNQIHN5
c3RlbS4gSXQgd2lsbCBpbmNsdWRlCj4gPiA+ID4gPiBJU1AgUGFzcyAxIGRyaXZlciwgc2Vuc29y
IGludGVyZmFjZSBkcml2ZXIsIERJUCBkcml2ZXIgYW5kIGZhY2UgZGV0ZWN0aW9uIGRyaXZlci4K
PiA+ID4gPiA+Cj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBMb3VpcyBLdW8gPGxvdWlzLmt1b0Bt
ZWRpYXRlay5jb20+Cj4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+ICBkcml2ZXJzL21lZGlhL3BsYXRm
b3JtL01ha2VmaWxlICAgICAgICAgICAgICAgfCAgICAxICsKPiA+ID4gPiA+ICBkcml2ZXJzL21l
ZGlhL3BsYXRmb3JtL210ay1pc3AvS2NvbmZpZyAgICAgICAgfCAgIDE4ICsKPiA+ID4gPiA+ICBk
cml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1pc3AvTWFrZWZpbGUgICAgICAgfCAgICAzICsKPiA+
ID4gPiA+ICAuLi4vbWVkaWEvcGxhdGZvcm0vbXRrLWlzcC9zZW5pbmYvTWFrZWZpbGUgICAgfCAg
ICA3ICsKPiA+ID4gPiA+ICAuLi4vcGxhdGZvcm0vbXRrLWlzcC9zZW5pbmYvbXRrX3NlbmluZi5j
ICAgICAgfCAgOTc0ICsrKysrKysrKysrCj4gPiA+ID4gPiAgLi4uL3BsYXRmb3JtL210ay1pc3Av
c2VuaW5mL210a19zZW5pbmZfZHBoeS5jIHwgIDM1MyArKysrCj4gPiA+ID4KPiA+ID4gPiBJIHRo
aW5rIHBoeSBkcml2ZXIgc2hvdWxkIGJlIHBsYWNlZCBpbiBkcml2ZXJzL3BoeS9tZWRpYXRlayBh
bmQgc2VwYXJhdGUgcGh5IGRyaXZlciB0byBhbiBpbmRlcGVuZGVudCBwYXRjaC4KPiA+ID4gPgo+
ID4gPiA+ID4gIC4uLi9wbGF0Zm9ybS9tdGstaXNwL3NlbmluZi9tdGtfc2VuaW5mX3JlZy5oICB8
IDE0OTEgKysrKysrKysrKysrKysrKysKPiA+ID4gPiA+ICAuLi4vbXRrLWlzcC9zZW5pbmYvbXRr
X3NlbmluZl9yeF9yZWcuaCAgICAgICAgfCAgNTE1ICsrKysrKwo+ID4gPiA+ID4gIDggZmlsZXMg
Y2hhbmdlZCwgMzM2MiBpbnNlcnRpb25zKCspCj4gPiA+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWlzcC9LY29uZmlnCj4gPiA+ID4gPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWlzcC9NYWtlZmlsZQo+ID4g
PiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1pc3Av
c2VuaW5mL01ha2VmaWxlCj4gPiA+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWVk
aWEvcGxhdGZvcm0vbXRrLWlzcC9zZW5pbmYvbXRrX3NlbmluZi5jCj4gPiA+ID4gPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0Cj4gPiA+ID4gPiBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1pc3Avc2Vu
aW5mL210a19zZW5pbmZfZHBoeS5jCj4gPiA+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0Cj4gPiA+
ID4gPiBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1pc3Avc2VuaW5mL210a19zZW5pbmZfcmVn
LmgKPiA+ID4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQKPiA+ID4gPiA+IGRyaXZlcnMvbWVkaWEv
cGxhdGZvcm0vbXRrLWlzcC9zZW5pbmYvbXRrX3NlbmluZl9yeF9yZWcuaAo+ID4gPiA+ID4KPiA+
ID4gPgo+ID4gPiA+IFtzbmlwXQo+ID4gPiA+Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArI2luY2x1
ZGUgPGxpbnV4L2Nsay5oPgo+ID4gPiA+ID4gKyNpbmNsdWRlIDxsaW51eC9kZWxheS5oPgo+ID4g
PiA+ID4gKyNpbmNsdWRlIDxsaW51eC9pbnRlcnJ1cHQuaD4KPiA+ID4gPiA+ICsjaW5jbHVkZSA8
bGludXgvbW9kdWxlLmg+Cj4gPiA+ID4gPiArI2luY2x1ZGUgPGxpbnV4L29mX2dyYXBoLmg+Cj4g
PiA+ID4gPiArI2luY2x1ZGUgPGxpbnV4L29mX2lycS5oPgo+ID4gPiA+Cj4gPiA+ID4gTm8gaXJx
IGhhbmRsZXIsIHNvIHJlbW92ZSB0aGlzLgo+ID4gPiA+Cj4gPiA+ID4gPiArI2luY2x1ZGUgPGxp
bnV4L3BsYXRmb3JtX2RldmljZS5oPgo+ID4gPiA+ID4gKyNpbmNsdWRlIDxsaW51eC9wbV9ydW50
aW1lLmg+Cj4gPiA+ID4gPiArI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KPiA+ID4gPiA+ICsjaW5j
bHVkZSA8bGludXgvdmlkZW9kZXYyLmg+Cj4gPiA+ID4gPiArI2luY2x1ZGUgPG1lZGlhL3Y0bDIt
YXN5bmMuaD4KPiA+ID4gPiA+ICsjaW5jbHVkZSA8bWVkaWEvdjRsMi1jdHJscy5oPgo+ID4gPiA+
ID4gKyNpbmNsdWRlIDxtZWRpYS92NGwyLWV2ZW50Lmg+Cj4gPiA+ID4gPiArI2luY2x1ZGUgPG1l
ZGlhL3Y0bDItZndub2RlLmg+Cj4gPiA+ID4gPiArI2luY2x1ZGUgPG1lZGlhL3Y0bDItc3ViZGV2
Lmg+Cj4gPiA+ID4gPiArI2luY2x1ZGUgPGxpbnV4L3BoeS9waHkuaD4KPiA+ID4gPiA+ICsjaW5j
bHVkZSAibXRrX3NlbmluZl9yZWcuaCIKPiA+ID4gPiA+ICsKPiA+ID4gPgo+ID4gPiA+IFtzbmlw
XQo+ID4gPiA+Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArc3RhdGljIGludCBzZW5pbmZfc2V0X2N0
cmwoc3RydWN0IHY0bDJfY3RybCAqY3RybCkgewo+ID4gPiA+ID4gKyAgICAgICBzdHJ1Y3QgbXRr
X3NlbmluZiAqcHJpdiA9IGNvbnRhaW5lcl9vZihjdHJsLT5oYW5kbGVyLAo+ID4gPiA+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IG10a19zZW5p
bmYsCj4gPiA+ID4gPiArY3RybF9oYW5kbGVyKTsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsgICAg
ICAgc3dpdGNoIChjdHJsLT5pZCkgewo+ID4gPiA+ID4gKyAgICAgICBjYXNlIFY0TDJfQ0lEX1RF
U1RfUEFUVEVSTjoKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBpZiAoY3RybC0+dmFsID09IFRF
U1RfR0VOX1BBVFRFUk4pCj4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4g
c2VuaW5mX2VuYWJsZV90ZXN0X3BhdHRlcm4ocHJpdik7Cj4gPiA+ID4KPiA+ID4gPiBXaXRob3V0
IHRoaXMsIHRoaXMgZHJpdmVyIHN0aWxsIHdvcmtzLCBzbyBtb3ZlIHRoaXMgdG8gYW4gaW5kZXBl
bmRlbnQgcGF0Y2guCj4gPiA+ID4KPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBlbHNlIGlmIChj
dHJsLT52YWwgPT0gVEVTVF9EVU1QX0RFQlVHX0lORk8pCj4gPiA+ID4gPiArICAgICAgICAgICAg
ICAgICAgICAgICByZXR1cm4gc2VuaW5mX2R1bXBfZGVidWdfaW5mbyhwcml2KTsKPiA+ID4gPgo+
ID4gPiA+IERpdHRvLgo+ID4gPiA+Cj4gPiA+ID4gPiArICAgICAgICAgICAgICAgZWxzZQo+ID4g
PiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gPiA+ID4gPiAr
ICAgICAgIH0KPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsgICAgICAgcmV0dXJuIDA7Cj4gPiA+ID4g
PiArfQo+ID4gPiA+ID4gKwo+ID4gPiA+Cj4gPiA+ID4gW3NuaXBdCj4gPiA+ID4KPiA+ID4gPiA+
ICsKPiA+ID4gPiA+ICsjaWZkZWYgQ09ORklHX09GCj4gPiA+ID4gPiArc3RhdGljIGNvbnN0IHN0
cnVjdCBvZl9kZXZpY2VfaWQgbXRrX21pcGlfZHBoeV9vZl9tYXRjaFtdID0gewo+ID4gPiA+ID4g
KyAgICAgICB7LmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTgzLW1pcGlfZHBoeSJ9LAo+ID4g
PiA+Cj4gPiA+ID4gV2hlcmUgaXMgdGhlIGRlZmluaXRpb24gb2YgIm1lZGlhdGVrLG10ODE4My1t
aXBpX2RwaHkiPwo+ID4gPiA+Cj4gPiA+ID4gUmVnYXJkcywKPiA+ID4gPiBDaHVuLUt1YW5nLgo+
ID4gPiA+Cj4gPiA+ID4gPiArICAgICAgIHt9LAo+ID4gPiA+ID4gK307Cj4gPiA+ID4gPiArTU9E
VUxFX0RFVklDRV9UQUJMRShvZiwgbXRrX21pcGlfZHBoeV9vZl9tYXRjaCk7ICNlbmRpZgo+ID4g
PiA+ID4gKwo+ID4gPiA+ID4gK3N0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIG1pcGlfZHBo
eV9wZHJ2ID0gewo+ID4gPiA+ID4gKyAgICAgICAucHJvYmUgID0gbWlwaV9kcGh5X3Byb2JlLAo+
ID4gPiA+ID4gKyAgICAgICAuZHJpdmVyID0gewo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIC5u
YW1lICAgPSAibWlwaV9kcGh5IiwKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAub2ZfbWF0Y2hf
dGFibGUgPSBvZl9tYXRjaF9wdHIobXRrX21pcGlfZHBoeV9vZl9tYXRjaCksCj4gPiA+ID4gPiAr
ICAgICAgIH0sCj4gPiA+ID4gPiArfTsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICttb2R1bGVfcGxh
dGZvcm1fZHJpdmVyKG1pcGlfZHBoeV9wZHJ2KTsKPiA+ID4gPiA+ICsKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcg
bGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
