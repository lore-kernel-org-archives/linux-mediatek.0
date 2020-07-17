Return-Path: <SRS0=RXgq=A4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21632C433E6
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2020 14:21:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2B362070E
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2020 14:21:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I5NPBBxE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="fpdB3sBb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2B362070E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=e+XQ4cLgPSWBgSJVCC0KMJLKcayFB4wSyS9CL1f1vBk=; b=I5NPBBxE3eNGgwF38fQC9WNpN
	8ihLgfOUdSn3ngJspHZtqckz0UTzKXZRrCZ1a0dTb0kGfBeaD9kGAzWvmrBTOFB6HdCDe6UltZtXm
	5TE2acBXuUjzyj6VFVrCglUm76ZF2/2QjMjmQsNayrxptd1vrI3p0+S2rDILRopQ5tip4lCqtnuvy
	90oTHPgclgcc/t54kHr/353cD8gIvf7UO+MEGrVHiYVtr3UJM23EKUbD2MId93qgZPWE/3wsVHIne
	nbQrNzMssjxJjvUni6eaOynBDSd2Vo3xpHtSMv2NUAfDjv8NsLqy+kg33/n8Xgq1FYDVEJphOdB3b
	GkqWIZG5g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwREu-0001xN-M8; Fri, 17 Jul 2020 14:21:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwREp-0001w7-MG; Fri, 17 Jul 2020 14:21:24 +0000
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 039E52083B;
 Fri, 17 Jul 2020 14:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594995682;
 bh=RcpLy8J4bl07xVJ0zXLtCtRK/EhczDNe0K167CZPt/A=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fpdB3sBbuxusN53ZpvVUK5KmvMcsg8UeiIj1wp7lsEPwkY7FO/tkWGZL0bceyRW79
 rJFOiifOeJzI2gomMYnvi/zoAyObDzjDAVIXwM+2d2lFc76dkAREocxu0Nqdu7tL0i
 TevBH41qbsn/OXnevMfdU/rUZt+/UA1JzICWNz74=
Received: by mail-ed1-f51.google.com with SMTP id z17so7841189edr.9;
 Fri, 17 Jul 2020 07:21:21 -0700 (PDT)
X-Gm-Message-State: AOAM531+AOelo0XqKNuqz5X6sv8EEuecG/p/8fyDcyEVHDLFcdbpa5dx
 yYCCH7pcXKIefngfdflOMenCikjg8bPCNkW7SQ==
X-Google-Smtp-Source: ABdhPJypK8/gj81SObcfYbHcv/2/xqPlnz6c4kxhoX/3Ss5+cqqNsG1o7oRzbu6X5rt88zAlmjh/AdI6PIrQ+RDZURI=
X-Received: by 2002:a05:6402:1766:: with SMTP id
 da6mr9274173edb.48.1594995680480; 
 Fri, 17 Jul 2020 07:21:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200708104023.3225-1-louis.kuo@mediatek.com>
 <20200708104023.3225-2-louis.kuo@mediatek.com>
 <CAAOTY_-+v_t3Vv-Ms7k9jCxJ+0B9qb93tBkL=3OmpMLeyAdV-g@mail.gmail.com>
 <b7b77606aa3e476aa68b2fa116329f84@mtkmbs02n2.mediatek.inc>
In-Reply-To: <b7b77606aa3e476aa68b2fa116329f84@mtkmbs02n2.mediatek.inc>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 17 Jul 2020 22:21:09 +0800
X-Gmail-Original-Message-ID: <CAAOTY__Jeu67-jajV5jysoTTXPoKXuXpvbGzHFYsUKG=j44sQg@mail.gmail.com>
Message-ID: <CAAOTY__Jeu67-jajV5jysoTTXPoKXuXpvbGzHFYsUKG=j44sQg@mail.gmail.com>
Subject: Re: [RFC PATCH V7 1/3] media: platform: mtk-isp: Add Mediatek sensor
 interface driver
To: =?UTF-8?B?TG91aXMgS3VvICjpg63lvrflr6cp?= <louis.kuo@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200717_102123_880671_F5EFEB67 
X-CRM114-Status: GOOD (  23.28  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 =?UTF-8?B?U2VhbiBDaGVuZyAo6YSt5piH5byYKQ==?= <Sean.Cheng@mediatek.com>,
 "laurent.pinchart+renesas@ideasonboard.com"
 <laurent.pinchart+renesas@ideasonboard.com>,
 =?UTF-8?B?Q2hyaXN0aWUgWXUgKOa4uOmbheaDoCk=?= <christie.yu@mediatek.com>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?SmVycnktY2ggQ2hlbiAo6Zmz5pWs5oayKQ==?= <Jerry-ch.Chen@mediatek.com>,
 Tomasz Figa <tfiga@chromium.org>,
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

SGksIExvdWlzOgoKTG91aXMgS3VvICjpg63lvrflr6cpIDxsb3Vpcy5rdW9AbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMOW5tDfmnIgxN+aXpSDpgLHkupQg5LiK5Y2IMTA6NTblr6vpgZPvvJoKPgo+IEhp
IENodW4tS3VhbmcsCj4KPiBTaW5jZSBwaHkgZHJpdmVyIGlzIG5vdCBiZWxvbmcgdG8gVjRMMiBz
Y29wZQo+Cj4gU2hvdWxkIEkgbmVlZCB0byB1cHN0ZWFtIDgxODMgbWlwaSBwaHkgZHJpdmVyIHdp
dGggbmV3IGEgcGF0Y2ggb3RoZXIgdGhhbiB0aGlzIG9uZSA/CgpZZXMsIEkgdGhpbmsgc28uIE1h
eWJlIGRpZmZlcmVudCBzZXJpZXMgd291bGQgYmUgYmV0dGVyLgoKUmVnYXJkcywKQ2h1bi1LdWFu
Zy4KCj4KPiBCUnMKPiBMb3Vpcwo+Cj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiBGcm9t
OiBDaHVuLUt1YW5nIEh1IFttYWlsdG86Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmddCj4gU2VudDog
VGh1cnNkYXksIEp1bHkgOSwgMjAyMCA5OjEzIFBNCj4gVG86IExvdWlzIEt1byAo6YOt5b635a+n
KQo+IENjOiBoYW5zLnZlcmt1aWxAY2lzY28uY29tOyBsYXVyZW50LnBpbmNoYXJ0K3JlbmVzYXNA
aWRlYXNvbmJvYXJkLmNvbTsgVG9tYXN6IEZpZ2E7IGtlaWljaGl3QGNocm9taXVtLm9yZzsgTWF0
dGhpYXMgQnJ1Z2dlcjsgTWF1cm8gQ2FydmFsaG8gQ2hlaGFiOyBkZXZpY2V0cmVlQHZnZXIua2Vy
bmVsLm9yZzsgU2VhbiBDaGVuZyAo6YSt5piH5byYKTsgc3J2X2hldXBzdHJlYW07IEplcnJ5LWNo
IENoZW4gKOmZs+aVrOaGsik7IEp1bmdvIExpbiAo5p6X5piO5L+KKTsgU2ogSHVhbmcgKOm7g+S/
oeeSiyk7IHl1emhhb0BjaHJvbWl1bS5vcmc7IG1vZGVyYXRlZCBsaXN0OkFSTS9NZWRpYXRlayBT
b0Mgc3VwcG9ydDsgendpc2xlckBjaHJvbWl1bS5vcmc7IENocmlzdGllIFl1ICjmuLjpm4Xmg6Ap
OyBGcmVkZXJpYyBDaGVuICjpmbPkv4rlhYMpOyBMaW51eCBBUk07IGxpbnV4LW1lZGlhQHZnZXIu
a2VybmVsLm9yZwo+IFN1YmplY3Q6IFJlOiBbUkZDIFBBVENIIFY3IDEvM10gbWVkaWE6IHBsYXRm
b3JtOiBtdGstaXNwOiBBZGQgTWVkaWF0ZWsgc2Vuc29yIGludGVyZmFjZSBkcml2ZXIKPgo+IEhp
LCBMb3VpczoKPgo+IExvdWlzIEt1byA8bG91aXMua3VvQG1lZGlhdGVrLmNvbT4g5pa8IDIwMjDl
ubQ35pyIOOaXpSDpgLHkuIkg5LiL5Y2INjo0MeWvq+mBk++8mgo+ID4KPiA+IFRoaXMgcGF0Y2gg
YWRkcyBNZWRpYXRlaydzIHNlbnNvciBpbnRlcmZhY2UgZHJpdmVyLiBTZW5zb3IgaW50ZXJmYWNl
Cj4gPiBkcml2ZXIgaXMgYSBNSVBJLUNTSTIgaG9zdCBkcml2ZXIsIG5hbWVseSwgYSBIVyBjYW1l
cmEgaW50ZXJmYWNlIGNvbnRyb2xsZXIuCj4gPiBJdCBzdXBwb3J0IGEgd2lkZWx5IGFkb3B0ZWQs
IHNpbXBsZSwgaGlnaC1zcGVlZCBwcm90b2NvbCBwcmltYXJpbHkKPiA+IGludGVuZGVkIGZvciBw
b2ludC10by1wb2ludCBpbWFnZSBhbmQgdmlkZW8gdHJhbnNtaXNzaW9uIGJldHdlZW4KPiA+IGNh
bWVyYXMgYW5kIGhvc3QgZGV2aWNlcy4gVGhlIG10ay1pc3AgZGlyZWN0b3J5IHdpbGwgY29udGFp
biBkcml2ZXJzCj4gPiBmb3IgbXVsdGlwbGUgSVAgYmxvY2tzIGZvdW5kIGluIE1lZGlhdGVrIElT
UCBzeXN0ZW0uIEl0IHdpbGwgaW5jbHVkZQo+ID4gSVNQIFBhc3MgMSBkcml2ZXIsIHNlbnNvciBp
bnRlcmZhY2UgZHJpdmVyLCBESVAgZHJpdmVyIGFuZCBmYWNlIGRldGVjdGlvbiBkcml2ZXIuCj4g
Pgo+ID4gU2lnbmVkLW9mZi1ieTogTG91aXMgS3VvIDxsb3Vpcy5rdW9AbWVkaWF0ZWsuY29tPgo+
ID4gLS0tCj4gPiAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9NYWtlZmlsZSAgICAgICAgICAgICAg
IHwgICAgMSArCj4gPiAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstaXNwL0tjb25maWcgICAg
ICAgIHwgICAxOCArCj4gPiAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstaXNwL01ha2VmaWxl
ICAgICAgIHwgICAgMyArCj4gPiAgLi4uL21lZGlhL3BsYXRmb3JtL210ay1pc3Avc2VuaW5mL01h
a2VmaWxlICAgIHwgICAgNyArCj4gPiAgLi4uL3BsYXRmb3JtL210ay1pc3Avc2VuaW5mL210a19z
ZW5pbmYuYyAgICAgIHwgIDk3NCArKysrKysrKysrKwo+ID4gIC4uLi9wbGF0Zm9ybS9tdGstaXNw
L3NlbmluZi9tdGtfc2VuaW5mX2RwaHkuYyB8ICAzNTMgKysrKwo+Cj4gSSB0aGluayBwaHkgZHJp
dmVyIHNob3VsZCBiZSBwbGFjZWQgaW4gZHJpdmVycy9waHkvbWVkaWF0ZWsgYW5kIHNlcGFyYXRl
IHBoeSBkcml2ZXIgdG8gYW4gaW5kZXBlbmRlbnQgcGF0Y2guCj4KPiA+ICAuLi4vcGxhdGZvcm0v
bXRrLWlzcC9zZW5pbmYvbXRrX3NlbmluZl9yZWcuaCAgfCAxNDkxICsrKysrKysrKysrKysrKysr
Cj4gPiAgLi4uL210ay1pc3Avc2VuaW5mL210a19zZW5pbmZfcnhfcmVnLmggICAgICAgIHwgIDUx
NSArKysrKysKPiA+ICA4IGZpbGVzIGNoYW5nZWQsIDMzNjIgaW5zZXJ0aW9ucygrKQo+ID4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1pc3AvS2NvbmZpZwo+
ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1pc3AvTWFr
ZWZpbGUKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGst
aXNwL3NlbmluZi9NYWtlZmlsZQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21lZGlh
L3BsYXRmb3JtL210ay1pc3Avc2VuaW5mL210a19zZW5pbmYuYwo+ID4gIGNyZWF0ZSBtb2RlIDEw
MDY0NAo+ID4gZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstaXNwL3NlbmluZi9tdGtfc2VuaW5m
X2RwaHkuYwo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NAo+ID4gZHJpdmVycy9tZWRpYS9wbGF0Zm9y
bS9tdGstaXNwL3NlbmluZi9tdGtfc2VuaW5mX3JlZy5oCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
Cj4gPiBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1pc3Avc2VuaW5mL210a19zZW5pbmZfcnhf
cmVnLmgKPiA+Cj4KPiBbc25pcF0KPgo+ID4gKwo+ID4gKyNpbmNsdWRlIDxsaW51eC9jbGsuaD4K
PiA+ICsjaW5jbHVkZSA8bGludXgvZGVsYXkuaD4KPiA+ICsjaW5jbHVkZSA8bGludXgvaW50ZXJy
dXB0Lmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgo+ID4gKyNpbmNsdWRlIDxsaW51
eC9vZl9ncmFwaC5oPgo+ID4gKyNpbmNsdWRlIDxsaW51eC9vZl9pcnEuaD4KPgo+IE5vIGlycSBo
YW5kbGVyLCBzbyByZW1vdmUgdGhpcy4KPgo+ID4gKyNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9k
ZXZpY2UuaD4KPiA+ICsjaW5jbHVkZSA8bGludXgvcG1fcnVudGltZS5oPgo+ID4gKyNpbmNsdWRl
IDxsaW51eC9zbGFiLmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4L3ZpZGVvZGV2Mi5oPgo+ID4gKyNp
bmNsdWRlIDxtZWRpYS92NGwyLWFzeW5jLmg+Cj4gPiArI2luY2x1ZGUgPG1lZGlhL3Y0bDItY3Ry
bHMuaD4KPiA+ICsjaW5jbHVkZSA8bWVkaWEvdjRsMi1ldmVudC5oPgo+ID4gKyNpbmNsdWRlIDxt
ZWRpYS92NGwyLWZ3bm9kZS5oPgo+ID4gKyNpbmNsdWRlIDxtZWRpYS92NGwyLXN1YmRldi5oPgo+
ID4gKyNpbmNsdWRlIDxsaW51eC9waHkvcGh5Lmg+Cj4gPiArI2luY2x1ZGUgIm10a19zZW5pbmZf
cmVnLmgiCj4gPiArCj4KPiBbc25pcF0KPgo+ID4gKwo+ID4gK3N0YXRpYyBpbnQgc2VuaW5mX3Nl
dF9jdHJsKHN0cnVjdCB2NGwyX2N0cmwgKmN0cmwpIHsKPiA+ICsgICAgICAgc3RydWN0IG10a19z
ZW5pbmYgKnByaXYgPSBjb250YWluZXJfb2YoY3RybC0+aGFuZGxlciwKPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBtdGtfc2VuaW5mLAo+ID4g
K2N0cmxfaGFuZGxlcik7Cj4gPiArCj4gPiArICAgICAgIHN3aXRjaCAoY3RybC0+aWQpIHsKPiA+
ICsgICAgICAgY2FzZSBWNEwyX0NJRF9URVNUX1BBVFRFUk46Cj4gPiArICAgICAgICAgICAgICAg
aWYgKGN0cmwtPnZhbCA9PSBURVNUX0dFTl9QQVRURVJOKQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgcmV0dXJuIHNlbmluZl9lbmFibGVfdGVzdF9wYXR0ZXJuKHByaXYpOwo+Cj4gV2l0aG91
dCB0aGlzLCB0aGlzIGRyaXZlciBzdGlsbCB3b3Jrcywgc28gbW92ZSB0aGlzIHRvIGFuIGluZGVw
ZW5kZW50IHBhdGNoLgo+Cj4gPiArICAgICAgICAgICAgICAgZWxzZSBpZiAoY3RybC0+dmFsID09
IFRFU1RfRFVNUF9ERUJVR19JTkZPKQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJu
IHNlbmluZl9kdW1wX2RlYnVnX2luZm8ocHJpdik7Cj4KPiBEaXR0by4KPgo+ID4gKyAgICAgICAg
ICAgICAgIGVsc2UKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+
ID4gKyAgICAgICB9Cj4gPiArCj4gPiArICAgICAgIHJldHVybiAwOwo+ID4gK30KPiA+ICsKPgo+
IFtzbmlwXQo+Cj4gPiArCj4gPiArI2lmZGVmIENPTkZJR19PRgo+ID4gK3N0YXRpYyBjb25zdCBz
dHJ1Y3Qgb2ZfZGV2aWNlX2lkIG10a19taXBpX2RwaHlfb2ZfbWF0Y2hbXSA9IHsKPiA+ICsgICAg
ICAgey5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE4My1taXBpX2RwaHkifSwKPgo+IFdoZXJl
IGlzIHRoZSBkZWZpbml0aW9uIG9mICJtZWRpYXRlayxtdDgxODMtbWlwaV9kcGh5Ij8KPgo+IFJl
Z2FyZHMsCj4gQ2h1bi1LdWFuZy4KPgo+ID4gKyAgICAgICB7fSwKPiA+ICt9Owo+ID4gK01PRFVM
RV9ERVZJQ0VfVEFCTEUob2YsIG10a19taXBpX2RwaHlfb2ZfbWF0Y2gpOyAjZW5kaWYKPiA+ICsK
PiA+ICtzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBtaXBpX2RwaHlfcGRydiA9IHsKPiA+
ICsgICAgICAgLnByb2JlICA9IG1pcGlfZHBoeV9wcm9iZSwKPiA+ICsgICAgICAgLmRyaXZlciA9
IHsKPiA+ICsgICAgICAgICAgICAgICAubmFtZSAgID0gIm1pcGlfZHBoeSIsCj4gPiArICAgICAg
ICAgICAgICAgLm9mX21hdGNoX3RhYmxlID0gb2ZfbWF0Y2hfcHRyKG10a19taXBpX2RwaHlfb2Zf
bWF0Y2gpLAo+ID4gKyAgICAgICB9LAo+ID4gK307Cj4gPiArCj4gPiArbW9kdWxlX3BsYXRmb3Jt
X2RyaXZlcihtaXBpX2RwaHlfcGRydik7Cj4gPiArCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgt
bWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
