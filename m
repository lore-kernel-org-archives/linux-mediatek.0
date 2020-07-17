Return-Path: <SRS0=RXgq=A4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1938BC433E4
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2020 15:47:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF5392076A
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2020 15:47:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iI4mQGHI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="B/lG7yUp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF5392076A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jtDrQ0H7mDJSQ4HfejcusjM9/sleXVQUC9/OM1eG0ew=; b=iI4mQGHIvKRO1hCGUlSjDBETj
	hX4MH7YySrjZdyHeFzhOx83X/PTT9nk9/ayLgdgE9WH2Th6KHbZccnPql0YAChK7sbOhLUjSmCh14
	rt3X8Y1yk+AGGXDj4MWErrEPZIeCYLRQarP5CEgzuexRBQ2BiUMavr0WfWx7WZXcuafkCFk22/59f
	aWgl/4v+307cGdCWWK4aGcefuQTmozCU/nmKsKepyWtgkc/+ByPT8QSc/uCsyVKInTNaoqXKjsQ/N
	AjokrKtsAfO6Kl2MNrMp8gNU9QPN5xumqzZ36jPFqrVFkMhZiWqcFEKNXROamzIRaftpCb/psHEew
	r7dzL8fOw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwSaP-0004qb-0y; Fri, 17 Jul 2020 15:47:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwSaK-0004pO-R5; Fri, 17 Jul 2020 15:47:42 +0000
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AA3332076A;
 Fri, 17 Jul 2020 15:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595000860;
 bh=Fof+n+5hn6BzRDXK6CPJ8CJWNj+z8iIWexUs4lUfoZY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=B/lG7yUpsYSHhcLDkbf6n/OGZQFazKaUBz2LMZKDVRB0nyz5925DDcYcaoBUaa2Gr
 wHw/fXaB/tpnZk9YfiG3N5PqcIZnUZCFyNf6Lun0QkZ/5P+BMX8kNByJWXAz0Xa+Hs
 6bbOaixpE+tI/+J26gXY5ciY4wAKCHo0RSgonnJ8=
Received: by mail-ej1-f47.google.com with SMTP id n22so8412797ejy.3;
 Fri, 17 Jul 2020 08:47:39 -0700 (PDT)
X-Gm-Message-State: AOAM5300luO6nyzOmZafKwClgQdKXxo4zXxWfwIjMdBauIY9HvlT9k6M
 vvruY9veNSLUHsDvB+MoRZCOZJAc6Q37ABuW0Q==
X-Google-Smtp-Source: ABdhPJzDeDgv5D7Zl1JAFCUFZG4a/Pkl/2ReMrKIV4794UgMVW9A5Gyq4enR4dvbVIvw5mgdvhC9glzmlay9nZIbSqE=
X-Received: by 2002:a17:906:6959:: with SMTP id
 c25mr8891917ejs.375.1595000858260; 
 Fri, 17 Jul 2020 08:47:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200708104023.3225-1-louis.kuo@mediatek.com>
 <20200708104023.3225-2-louis.kuo@mediatek.com>
 <CAAOTY_-+v_t3Vv-Ms7k9jCxJ+0B9qb93tBkL=3OmpMLeyAdV-g@mail.gmail.com>
 <b7b77606aa3e476aa68b2fa116329f84@mtkmbs02n2.mediatek.inc>
 <CAAOTY__Jeu67-jajV5jysoTTXPoKXuXpvbGzHFYsUKG=j44sQg@mail.gmail.com>
 <CAAFQd5B=e6bcmeO5LBd7eqOWaVvbzPKEv2nJHUfpUVJ3ruFqRg@mail.gmail.com>
In-Reply-To: <CAAFQd5B=e6bcmeO5LBd7eqOWaVvbzPKEv2nJHUfpUVJ3ruFqRg@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 17 Jul 2020 23:47:27 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9S9Jq=+Na7JRmhEaJyFaVnvuVn2HSRa8mChuxtqGiGKg@mail.gmail.com>
Message-ID: <CAAOTY_9S9Jq=+Na7JRmhEaJyFaVnvuVn2HSRa8mChuxtqGiGKg@mail.gmail.com>
Subject: Re: [RFC PATCH V7 1/3] media: platform: mtk-isp: Add Mediatek sensor
 interface driver
To: Tomasz Figa <tfiga@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200717_114741_042468_3789852E 
X-CRM114-Status: GOOD (  28.69  )
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
 =?UTF-8?B?SnVuZ28gTGluICjmnpfmmI7kv4op?= <jungo.lin@mediatek.com>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?Q2hyaXN0aWUgWXUgKOa4uOmbheaDoCk=?= <christie.yu@mediatek.com>,
 =?UTF-8?B?SmVycnktY2ggQ2hlbiAo6Zmz5pWs5oayKQ==?= <Jerry-ch.Chen@mediatek.com>,
 "keiichiw@chromium.org" <keiichiw@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?B?U2ogSHVhbmcgKOm7g+S/oeeSiyk=?= <sj.huang@mediatek.com>,
 "yuzhao@chromium.org" <yuzhao@chromium.org>,
 "hans.verkuil@cisco.com" <hans.verkuil@cisco.com>,
 "zwisler@chromium.org" <zwisler@chromium.org>,
 =?UTF-8?B?RnJlZGVyaWMgQ2hlbiAo6Zmz5L+K5YWDKQ==?= <Frederic.Chen@mediatek.com>,
 =?UTF-8?B?TG91aXMgS3VvICjpg63lvrflr6cp?= <louis.kuo@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

VG9tYXN6IEZpZ2EgPHRmaWdhQGNocm9taXVtLm9yZz4g5pa8IDIwMjDlubQ35pyIMTfml6Ug6YCx
5LqUIOS4i+WNiDEwOjMz5a+r6YGT77yaCj4KPiBPbiBGcmksIEp1bCAxNywgMjAyMCBhdCA0OjIx
IFBNIENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4g
PiBIaSwgTG91aXM6Cj4gPgo+ID4gTG91aXMgS3VvICjpg63lvrflr6cpIDxsb3Vpcy5rdW9AbWVk
aWF0ZWsuY29tPiDmlrwgMjAyMOW5tDfmnIgxN+aXpSDpgLHkupQg5LiK5Y2IMTA6NTblr6vpgZPv
vJoKPiA+ID4KPiA+ID4gSGkgQ2h1bi1LdWFuZywKPiA+ID4KPiA+ID4gU2luY2UgcGh5IGRyaXZl
ciBpcyBub3QgYmVsb25nIHRvIFY0TDIgc2NvcGUKPiA+ID4KPiA+ID4gU2hvdWxkIEkgbmVlZCB0
byB1cHN0ZWFtIDgxODMgbWlwaSBwaHkgZHJpdmVyIHdpdGggbmV3IGEgcGF0Y2ggb3RoZXIgdGhh
biB0aGlzIG9uZSA/Cj4gPgo+ID4gWWVzLCBJIHRoaW5rIHNvLiBNYXliZSBkaWZmZXJlbnQgc2Vy
aWVzIHdvdWxkIGJlIGJldHRlci4KPgo+IFNpbmNlIGJvdGggd291bGQgbm90IGJlIHVzYWJsZSB3
aXRob3V0IGVhY2ggb3RoZXIsIEkgYmVsaWV2ZSB0aGV5Cj4gc2hvdWxkIGJlIGhhbmRsZWQgYnkg
dGhlIHNhbWUgc2VyaWVzLCBhbHRob3VnaCBjYXJlIHNob3VsZCBiZSB0YWtlbiB0bwo+IGhhdmUg
dGhlIHBhdGNoZXMgaW4gdGhlIHNlcmllcyBjbGVhcmx5IHNlcGFyYXRlZCBiZXR3ZWVuIHRoZSB0
d28KPiBzdWJzeXN0ZW1zLgoKT25lIHNlcmllcyBpcyBvayBmb3IgbWUuIEZvciBlYWNoIG1haW50
YWluZXIsIHRoZXkgY291bGQgcGljayB3aGF0CnRoZXkgd2FudCBmcm9tIHRoaXMgc2VyaWVzLCBv
ciBnZXQgYWNrIGJ5IGFub3RoZXIgbWFpbnRhaW5lciBhbmQgcGljawphbGwgcGF0Y2hlcyBpbnRv
IG9uZSB0cmVlLgoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4KPiBCZXN0IHJlZ2FyZHMsCj4gVG9t
YXN6Cj4KPiA+Cj4gPiBSZWdhcmRzLAo+ID4gQ2h1bi1LdWFuZy4KPiA+Cj4gPiA+Cj4gPiA+IEJS
cwo+ID4gPiBMb3Vpcwo+ID4gPgo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4g
PiBGcm9tOiBDaHVuLUt1YW5nIEh1IFttYWlsdG86Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmddCj4g
PiA+IFNlbnQ6IFRodXJzZGF5LCBKdWx5IDksIDIwMjAgOToxMyBQTQo+ID4gPiBUbzogTG91aXMg
S3VvICjpg63lvrflr6cpCj4gPiA+IENjOiBoYW5zLnZlcmt1aWxAY2lzY28uY29tOyBsYXVyZW50
LnBpbmNoYXJ0K3JlbmVzYXNAaWRlYXNvbmJvYXJkLmNvbTsgVG9tYXN6IEZpZ2E7IGtlaWljaGl3
QGNocm9taXVtLm9yZzsgTWF0dGhpYXMgQnJ1Z2dlcjsgTWF1cm8gQ2FydmFsaG8gQ2hlaGFiOyBk
ZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgU2VhbiBDaGVuZyAo6YSt5piH5byYKTsgc3J2X2hl
dXBzdHJlYW07IEplcnJ5LWNoIENoZW4gKOmZs+aVrOaGsik7IEp1bmdvIExpbiAo5p6X5piO5L+K
KTsgU2ogSHVhbmcgKOm7g+S/oeeSiyk7IHl1emhhb0BjaHJvbWl1bS5vcmc7IG1vZGVyYXRlZCBs
aXN0OkFSTS9NZWRpYXRlayBTb0Mgc3VwcG9ydDsgendpc2xlckBjaHJvbWl1bS5vcmc7IENocmlz
dGllIFl1ICjmuLjpm4Xmg6ApOyBGcmVkZXJpYyBDaGVuICjpmbPkv4rlhYMpOyBMaW51eCBBUk07
IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwo+ID4gPiBTdWJqZWN0OiBSZTogW1JGQyBQQVRD
SCBWNyAxLzNdIG1lZGlhOiBwbGF0Zm9ybTogbXRrLWlzcDogQWRkIE1lZGlhdGVrIHNlbnNvciBp
bnRlcmZhY2UgZHJpdmVyCj4gPiA+Cj4gPiA+IEhpLCBMb3VpczoKPiA+ID4KPiA+ID4gTG91aXMg
S3VvIDxsb3Vpcy5rdW9AbWVkaWF0ZWsuY29tPiDmlrwgMjAyMOW5tDfmnIg45pelIOmAseS4iSDk
uIvljYg2OjQx5a+r6YGT77yaCj4gPiA+ID4KPiA+ID4gPiBUaGlzIHBhdGNoIGFkZHMgTWVkaWF0
ZWsncyBzZW5zb3IgaW50ZXJmYWNlIGRyaXZlci4gU2Vuc29yIGludGVyZmFjZQo+ID4gPiA+IGRy
aXZlciBpcyBhIE1JUEktQ1NJMiBob3N0IGRyaXZlciwgbmFtZWx5LCBhIEhXIGNhbWVyYSBpbnRl
cmZhY2UgY29udHJvbGxlci4KPiA+ID4gPiBJdCBzdXBwb3J0IGEgd2lkZWx5IGFkb3B0ZWQsIHNp
bXBsZSwgaGlnaC1zcGVlZCBwcm90b2NvbCBwcmltYXJpbHkKPiA+ID4gPiBpbnRlbmRlZCBmb3Ig
cG9pbnQtdG8tcG9pbnQgaW1hZ2UgYW5kIHZpZGVvIHRyYW5zbWlzc2lvbiBiZXR3ZWVuCj4gPiA+
ID4gY2FtZXJhcyBhbmQgaG9zdCBkZXZpY2VzLiBUaGUgbXRrLWlzcCBkaXJlY3Rvcnkgd2lsbCBj
b250YWluIGRyaXZlcnMKPiA+ID4gPiBmb3IgbXVsdGlwbGUgSVAgYmxvY2tzIGZvdW5kIGluIE1l
ZGlhdGVrIElTUCBzeXN0ZW0uIEl0IHdpbGwgaW5jbHVkZQo+ID4gPiA+IElTUCBQYXNzIDEgZHJp
dmVyLCBzZW5zb3IgaW50ZXJmYWNlIGRyaXZlciwgRElQIGRyaXZlciBhbmQgZmFjZSBkZXRlY3Rp
b24gZHJpdmVyLgo+ID4gPiA+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogTG91aXMgS3VvIDxsb3Vp
cy5rdW9AbWVkaWF0ZWsuY29tPgo+ID4gPiA+IC0tLQo+ID4gPiA+ICBkcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL01ha2VmaWxlICAgICAgICAgICAgICAgfCAgICAxICsKPiA+ID4gPiAgZHJpdmVycy9t
ZWRpYS9wbGF0Zm9ybS9tdGstaXNwL0tjb25maWcgICAgICAgIHwgICAxOCArCj4gPiA+ID4gIGRy
aXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWlzcC9NYWtlZmlsZSAgICAgICB8ICAgIDMgKwo+ID4g
PiA+ICAuLi4vbWVkaWEvcGxhdGZvcm0vbXRrLWlzcC9zZW5pbmYvTWFrZWZpbGUgICAgfCAgICA3
ICsKPiA+ID4gPiAgLi4uL3BsYXRmb3JtL210ay1pc3Avc2VuaW5mL210a19zZW5pbmYuYyAgICAg
IHwgIDk3NCArKysrKysrKysrKwo+ID4gPiA+ICAuLi4vcGxhdGZvcm0vbXRrLWlzcC9zZW5pbmYv
bXRrX3NlbmluZl9kcGh5LmMgfCAgMzUzICsrKysKPiA+ID4KPiA+ID4gSSB0aGluayBwaHkgZHJp
dmVyIHNob3VsZCBiZSBwbGFjZWQgaW4gZHJpdmVycy9waHkvbWVkaWF0ZWsgYW5kIHNlcGFyYXRl
IHBoeSBkcml2ZXIgdG8gYW4gaW5kZXBlbmRlbnQgcGF0Y2guCj4gPiA+Cj4gPiA+ID4gIC4uLi9w
bGF0Zm9ybS9tdGstaXNwL3NlbmluZi9tdGtfc2VuaW5mX3JlZy5oICB8IDE0OTEgKysrKysrKysr
KysrKysrKysKPiA+ID4gPiAgLi4uL210ay1pc3Avc2VuaW5mL210a19zZW5pbmZfcnhfcmVnLmgg
ICAgICAgIHwgIDUxNSArKysrKysKPiA+ID4gPiAgOCBmaWxlcyBjaGFuZ2VkLCAzMzYyIGluc2Vy
dGlvbnMoKykKPiA+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWVkaWEvcGxhdGZv
cm0vbXRrLWlzcC9LY29uZmlnCj4gPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21l
ZGlhL3BsYXRmb3JtL210ay1pc3AvTWFrZWZpbGUKPiA+ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWlzcC9zZW5pbmYvTWFrZWZpbGUKPiA+ID4gPiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWlzcC9zZW5pbmYv
bXRrX3NlbmluZi5jCj4gPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NAo+ID4gPiA+IGRyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vbXRrLWlzcC9zZW5pbmYvbXRrX3NlbmluZl9kcGh5LmMKPiA+ID4gPiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0Cj4gPiA+ID4gZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstaXNw
L3NlbmluZi9tdGtfc2VuaW5mX3JlZy5oCj4gPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NAo+ID4g
PiA+IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWlzcC9zZW5pbmYvbXRrX3NlbmluZl9yeF9y
ZWcuaAo+ID4gPiA+Cj4gPiA+Cj4gPiA+IFtzbmlwXQo+ID4gPgo+ID4gPiA+ICsKPiA+ID4gPiAr
I2luY2x1ZGUgPGxpbnV4L2Nsay5oPgo+ID4gPiA+ICsjaW5jbHVkZSA8bGludXgvZGVsYXkuaD4K
PiA+ID4gPiArI2luY2x1ZGUgPGxpbnV4L2ludGVycnVwdC5oPgo+ID4gPiA+ICsjaW5jbHVkZSA8
bGludXgvbW9kdWxlLmg+Cj4gPiA+ID4gKyNpbmNsdWRlIDxsaW51eC9vZl9ncmFwaC5oPgo+ID4g
PiA+ICsjaW5jbHVkZSA8bGludXgvb2ZfaXJxLmg+Cj4gPiA+Cj4gPiA+IE5vIGlycSBoYW5kbGVy
LCBzbyByZW1vdmUgdGhpcy4KPiA+ID4KPiA+ID4gPiArI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3Jt
X2RldmljZS5oPgo+ID4gPiA+ICsjaW5jbHVkZSA8bGludXgvcG1fcnVudGltZS5oPgo+ID4gPiA+
ICsjaW5jbHVkZSA8bGludXgvc2xhYi5oPgo+ID4gPiA+ICsjaW5jbHVkZSA8bGludXgvdmlkZW9k
ZXYyLmg+Cj4gPiA+ID4gKyNpbmNsdWRlIDxtZWRpYS92NGwyLWFzeW5jLmg+Cj4gPiA+ID4gKyNp
bmNsdWRlIDxtZWRpYS92NGwyLWN0cmxzLmg+Cj4gPiA+ID4gKyNpbmNsdWRlIDxtZWRpYS92NGwy
LWV2ZW50Lmg+Cj4gPiA+ID4gKyNpbmNsdWRlIDxtZWRpYS92NGwyLWZ3bm9kZS5oPgo+ID4gPiA+
ICsjaW5jbHVkZSA8bWVkaWEvdjRsMi1zdWJkZXYuaD4KPiA+ID4gPiArI2luY2x1ZGUgPGxpbnV4
L3BoeS9waHkuaD4KPiA+ID4gPiArI2luY2x1ZGUgIm10a19zZW5pbmZfcmVnLmgiCj4gPiA+ID4g
Kwo+ID4gPgo+ID4gPiBbc25pcF0KPiA+ID4KPiA+ID4gPiArCj4gPiA+ID4gK3N0YXRpYyBpbnQg
c2VuaW5mX3NldF9jdHJsKHN0cnVjdCB2NGwyX2N0cmwgKmN0cmwpIHsKPiA+ID4gPiArICAgICAg
IHN0cnVjdCBtdGtfc2VuaW5mICpwcml2ID0gY29udGFpbmVyX29mKGN0cmwtPmhhbmRsZXIsCj4g
PiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0
IG10a19zZW5pbmYsCj4gPiA+ID4gK2N0cmxfaGFuZGxlcik7Cj4gPiA+ID4gKwo+ID4gPiA+ICsg
ICAgICAgc3dpdGNoIChjdHJsLT5pZCkgewo+ID4gPiA+ICsgICAgICAgY2FzZSBWNEwyX0NJRF9U
RVNUX1BBVFRFUk46Cj4gPiA+ID4gKyAgICAgICAgICAgICAgIGlmIChjdHJsLT52YWwgPT0gVEVT
VF9HRU5fUEFUVEVSTikKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gc2Vu
aW5mX2VuYWJsZV90ZXN0X3BhdHRlcm4ocHJpdik7Cj4gPiA+Cj4gPiA+IFdpdGhvdXQgdGhpcywg
dGhpcyBkcml2ZXIgc3RpbGwgd29ya3MsIHNvIG1vdmUgdGhpcyB0byBhbiBpbmRlcGVuZGVudCBw
YXRjaC4KPiA+ID4KPiA+ID4gPiArICAgICAgICAgICAgICAgZWxzZSBpZiAoY3RybC0+dmFsID09
IFRFU1RfRFVNUF9ERUJVR19JTkZPKQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJl
dHVybiBzZW5pbmZfZHVtcF9kZWJ1Z19pbmZvKHByaXYpOwo+ID4gPgo+ID4gPiBEaXR0by4KPiA+
ID4KPiA+ID4gPiArICAgICAgICAgICAgICAgZWxzZQo+ID4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgIHJldHVybiAtRUlOVkFMOwo+ID4gPiA+ICsgICAgICAgfQo+ID4gPiA+ICsKPiA+ID4g
PiArICAgICAgIHJldHVybiAwOwo+ID4gPiA+ICt9Cj4gPiA+ID4gKwo+ID4gPgo+ID4gPiBbc25p
cF0KPiA+ID4KPiA+ID4gPiArCj4gPiA+ID4gKyNpZmRlZiBDT05GSUdfT0YKPiA+ID4gPiArc3Rh
dGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbXRrX21pcGlfZHBoeV9vZl9tYXRjaFtdID0g
ewo+ID4gPiA+ICsgICAgICAgey5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE4My1taXBpX2Rw
aHkifSwKPiA+ID4KPiA+ID4gV2hlcmUgaXMgdGhlIGRlZmluaXRpb24gb2YgIm1lZGlhdGVrLG10
ODE4My1taXBpX2RwaHkiPwo+ID4gPgo+ID4gPiBSZWdhcmRzLAo+ID4gPiBDaHVuLUt1YW5nLgo+
ID4gPgo+ID4gPiA+ICsgICAgICAge30sCj4gPiA+ID4gK307Cj4gPiA+ID4gK01PRFVMRV9ERVZJ
Q0VfVEFCTEUob2YsIG10a19taXBpX2RwaHlfb2ZfbWF0Y2gpOyAjZW5kaWYKPiA+ID4gPiArCj4g
PiA+ID4gK3N0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIG1pcGlfZHBoeV9wZHJ2ID0gewo+
ID4gPiA+ICsgICAgICAgLnByb2JlICA9IG1pcGlfZHBoeV9wcm9iZSwKPiA+ID4gPiArICAgICAg
IC5kcml2ZXIgPSB7Cj4gPiA+ID4gKyAgICAgICAgICAgICAgIC5uYW1lICAgPSAibWlwaV9kcGh5
IiwKPiA+ID4gPiArICAgICAgICAgICAgICAgLm9mX21hdGNoX3RhYmxlID0gb2ZfbWF0Y2hfcHRy
KG10a19taXBpX2RwaHlfb2ZfbWF0Y2gpLAo+ID4gPiA+ICsgICAgICAgfSwKPiA+ID4gPiArfTsK
PiA+ID4gPiArCj4gPiA+ID4gK21vZHVsZV9wbGF0Zm9ybV9kcml2ZXIobWlwaV9kcGh5X3BkcnYp
Owo+ID4gPiA+ICsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbWVkaWF0ZWsK
