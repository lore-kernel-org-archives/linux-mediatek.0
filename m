Return-Path: <SRS0=RXgq=A4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14964C433E3
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2020 14:40:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDC3C22B4D
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2020 14:40:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="td7M3yOx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="i1OkWVYz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDC3C22B4D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KYmmMf6PRb7fkPoQdXSayAEm6RE5SDiWivLlZMY4qD8=; b=td7M3yOxqiiV4hELZBWEbhYOp
	lYoiq2Pm+SpAf7cHY7fxYorCXFzKXTVvKjDsnuwJfL34/S7wDcMNqTqJu61zqLpvqFUHNEMLYlKFt
	RZ7ja/KllzoW2BgMNpTQuvta37bat/269gNU0/KHP5tGn12IkzvocCfEqlqZpn3RR0M6LxBw0xRoE
	iGW0N/vBcLspzhk/wxmFLFOzv4GVP09MIC9fnBmeTqDs+hwNhnwhJ3h1zGtU32XT60MhsNV5OdDuR
	SduOPbDrf9dL0aiOqGg5a+CG+sMyc/wt2YcJ4t80BN/uo+3cuIYxiaOMc339DwyP9uuZWR6fkf4u6
	Jn9DJ/MyQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwRXW-0004KE-96; Fri, 17 Jul 2020 14:40:42 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwRXU-0004JZ-8X
 for linux-mediatek@lists.infradead.org; Fri, 17 Jul 2020 14:40:41 +0000
Received: by mail-ed1-x544.google.com with SMTP id z17so7900033edr.9
 for <linux-mediatek@lists.infradead.org>; Fri, 17 Jul 2020 07:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MI//z+nQVKSMCnCL0tY+ktwSFvhQ7QWboFw14FVGkkE=;
 b=i1OkWVYzB2WghwJJHDrzvX0zxv3Gcb+kO02lITUQxrrlYU4pn0VrL+v99feSDMsZdL
 1zR+MGDoCZogLyJ/B/qJcD53g5CCnC7vxSaRDqplXhPmGeSRO+TFHNh3xr2NMvYFwPs9
 TxQUG8HlPvc0KFR6ce0t+ap4LEqD+E+JRUSTk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MI//z+nQVKSMCnCL0tY+ktwSFvhQ7QWboFw14FVGkkE=;
 b=oVLS/dRIBtJA42BB22E3bj5hhabejfMRLKlfShXR60W7TdKZ3ThIRIvmp+B9aJjcBB
 zviOHYYjP/pAPLur1mAojasC43huJEWw0ki8EHGGADVESRigLdIsbEBqVqDeejOw20w0
 lqaIZf8A9EQZDDmJG2CLAq8zio4fmLXGED7EBXBkR/AEb5JGIyIkR/c7hProvll7TRuB
 SeNe1//ugjRWCz9NQlxS+yukZYuizFNpxr+IkTkbif1e5fTtW4HJ3UMnNYyOSR4dKtMU
 w2liCrU8Ipz7VTyOkNPOlVTw1WzmNKPQPIMqavp1CfAXUEHH99Dcldj96eYQLSdgU1Tk
 5PjA==
X-Gm-Message-State: AOAM531CWhcOJNe9Z5CAtQJw5n7YD7FXMpN9NELmPUUtHPoo0nxVdIgL
 evCMG4z8rg+/N031uV3acAnMp+2jHAo=
X-Google-Smtp-Source: ABdhPJzeiRrhHGXygc8s+TZaIbv6hJF73tit7wSAzegsEqyan5yAlXyG0zOBD6bisVM6+bgQUGiIlQ==
X-Received: by 2002:a50:ec8b:: with SMTP id e11mr9364998edr.344.1594996838277; 
 Fri, 17 Jul 2020 07:40:38 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com.
 [209.85.128.46])
 by smtp.gmail.com with ESMTPSA id c9sm8460524edv.8.2020.07.17.07.40.37
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jul 2020 07:40:38 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id j18so15175014wmi.3
 for <linux-mediatek@lists.infradead.org>; Fri, 17 Jul 2020 07:40:37 -0700 (PDT)
X-Received: by 2002:a1c:9a81:: with SMTP id c123mr9386168wme.46.1594996396079; 
 Fri, 17 Jul 2020 07:33:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200708104023.3225-1-louis.kuo@mediatek.com>
 <20200708104023.3225-2-louis.kuo@mediatek.com>
 <CAAOTY_-+v_t3Vv-Ms7k9jCxJ+0B9qb93tBkL=3OmpMLeyAdV-g@mail.gmail.com>
 <b7b77606aa3e476aa68b2fa116329f84@mtkmbs02n2.mediatek.inc>
 <CAAOTY__Jeu67-jajV5jysoTTXPoKXuXpvbGzHFYsUKG=j44sQg@mail.gmail.com>
In-Reply-To: <CAAOTY__Jeu67-jajV5jysoTTXPoKXuXpvbGzHFYsUKG=j44sQg@mail.gmail.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Fri, 17 Jul 2020 16:33:05 +0200
X-Gmail-Original-Message-ID: <CAAFQd5B=e6bcmeO5LBd7eqOWaVvbzPKEv2nJHUfpUVJ3ruFqRg@mail.gmail.com>
Message-ID: <CAAFQd5B=e6bcmeO5LBd7eqOWaVvbzPKEv2nJHUfpUVJ3ruFqRg@mail.gmail.com>
Subject: Re: [RFC PATCH V7 1/3] media: platform: mtk-isp: Add Mediatek sensor
 interface driver
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200717_104040_373486_A353C79E 
X-CRM114-Status: GOOD (  25.44  )
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
 =?UTF-8?B?SnVuZ28gTGluICjmnpfmmI7kv4op?= <jungo.lin@mediatek.com>,
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

T24gRnJpLCBKdWwgMTcsIDIwMjAgYXQgNDoyMSBQTSBDaHVuLUt1YW5nIEh1IDxjaHVua3Vhbmcu
aHVAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBIaSwgTG91aXM6Cj4KPiBMb3VpcyBLdW8gKOmDreW+
t+WvpykgPGxvdWlzLmt1b0BtZWRpYXRlay5jb20+IOaWvCAyMDIw5bm0N+aciDE35pelIOmAseS6
lCDkuIrljYgxMDo1NuWvq+mBk++8mgo+ID4KPiA+IEhpIENodW4tS3VhbmcsCj4gPgo+ID4gU2lu
Y2UgcGh5IGRyaXZlciBpcyBub3QgYmVsb25nIHRvIFY0TDIgc2NvcGUKPiA+Cj4gPiBTaG91bGQg
SSBuZWVkIHRvIHVwc3RlYW0gODE4MyBtaXBpIHBoeSBkcml2ZXIgd2l0aCBuZXcgYSBwYXRjaCBv
dGhlciB0aGFuIHRoaXMgb25lID8KPgo+IFllcywgSSB0aGluayBzby4gTWF5YmUgZGlmZmVyZW50
IHNlcmllcyB3b3VsZCBiZSBiZXR0ZXIuCgpTaW5jZSBib3RoIHdvdWxkIG5vdCBiZSB1c2FibGUg
d2l0aG91dCBlYWNoIG90aGVyLCBJIGJlbGlldmUgdGhleQpzaG91bGQgYmUgaGFuZGxlZCBieSB0
aGUgc2FtZSBzZXJpZXMsIGFsdGhvdWdoIGNhcmUgc2hvdWxkIGJlIHRha2VuIHRvCmhhdmUgdGhl
IHBhdGNoZXMgaW4gdGhlIHNlcmllcyBjbGVhcmx5IHNlcGFyYXRlZCBiZXR3ZWVuIHRoZSB0d28K
c3Vic3lzdGVtcy4KCkJlc3QgcmVnYXJkcywKVG9tYXN6Cgo+Cj4gUmVnYXJkcywKPiBDaHVuLUt1
YW5nLgo+Cj4gPgo+ID4gQlJzCj4gPiBMb3Vpcwo+ID4KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tCj4gPiBGcm9tOiBDaHVuLUt1YW5nIEh1IFttYWlsdG86Y2h1bmt1YW5nLmh1QGtlcm5l
bC5vcmddCj4gPiBTZW50OiBUaHVyc2RheSwgSnVseSA5LCAyMDIwIDk6MTMgUE0KPiA+IFRvOiBM
b3VpcyBLdW8gKOmDreW+t+WvpykKPiA+IENjOiBoYW5zLnZlcmt1aWxAY2lzY28uY29tOyBsYXVy
ZW50LnBpbmNoYXJ0K3JlbmVzYXNAaWRlYXNvbmJvYXJkLmNvbTsgVG9tYXN6IEZpZ2E7IGtlaWlj
aGl3QGNocm9taXVtLm9yZzsgTWF0dGhpYXMgQnJ1Z2dlcjsgTWF1cm8gQ2FydmFsaG8gQ2hlaGFi
OyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgU2VhbiBDaGVuZyAo6YSt5piH5byYKTsgc3J2
X2hldXBzdHJlYW07IEplcnJ5LWNoIENoZW4gKOmZs+aVrOaGsik7IEp1bmdvIExpbiAo5p6X5piO
5L+KKTsgU2ogSHVhbmcgKOm7g+S/oeeSiyk7IHl1emhhb0BjaHJvbWl1bS5vcmc7IG1vZGVyYXRl
ZCBsaXN0OkFSTS9NZWRpYXRlayBTb0Mgc3VwcG9ydDsgendpc2xlckBjaHJvbWl1bS5vcmc7IENo
cmlzdGllIFl1ICjmuLjpm4Xmg6ApOyBGcmVkZXJpYyBDaGVuICjpmbPkv4rlhYMpOyBMaW51eCBB
Uk07IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwo+ID4gU3ViamVjdDogUmU6IFtSRkMgUEFU
Q0ggVjcgMS8zXSBtZWRpYTogcGxhdGZvcm06IG10ay1pc3A6IEFkZCBNZWRpYXRlayBzZW5zb3Ig
aW50ZXJmYWNlIGRyaXZlcgo+ID4KPiA+IEhpLCBMb3VpczoKPiA+Cj4gPiBMb3VpcyBLdW8gPGxv
dWlzLmt1b0BtZWRpYXRlay5jb20+IOaWvCAyMDIw5bm0N+aciDjml6Ug6YCx5LiJIOS4i+WNiDY6
NDHlr6vpgZPvvJoKPiA+ID4KPiA+ID4gVGhpcyBwYXRjaCBhZGRzIE1lZGlhdGVrJ3Mgc2Vuc29y
IGludGVyZmFjZSBkcml2ZXIuIFNlbnNvciBpbnRlcmZhY2UKPiA+ID4gZHJpdmVyIGlzIGEgTUlQ
SS1DU0kyIGhvc3QgZHJpdmVyLCBuYW1lbHksIGEgSFcgY2FtZXJhIGludGVyZmFjZSBjb250cm9s
bGVyLgo+ID4gPiBJdCBzdXBwb3J0IGEgd2lkZWx5IGFkb3B0ZWQsIHNpbXBsZSwgaGlnaC1zcGVl
ZCBwcm90b2NvbCBwcmltYXJpbHkKPiA+ID4gaW50ZW5kZWQgZm9yIHBvaW50LXRvLXBvaW50IGlt
YWdlIGFuZCB2aWRlbyB0cmFuc21pc3Npb24gYmV0d2Vlbgo+ID4gPiBjYW1lcmFzIGFuZCBob3N0
IGRldmljZXMuIFRoZSBtdGstaXNwIGRpcmVjdG9yeSB3aWxsIGNvbnRhaW4gZHJpdmVycwo+ID4g
PiBmb3IgbXVsdGlwbGUgSVAgYmxvY2tzIGZvdW5kIGluIE1lZGlhdGVrIElTUCBzeXN0ZW0uIEl0
IHdpbGwgaW5jbHVkZQo+ID4gPiBJU1AgUGFzcyAxIGRyaXZlciwgc2Vuc29yIGludGVyZmFjZSBk
cml2ZXIsIERJUCBkcml2ZXIgYW5kIGZhY2UgZGV0ZWN0aW9uIGRyaXZlci4KPiA+ID4KPiA+ID4g
U2lnbmVkLW9mZi1ieTogTG91aXMgS3VvIDxsb3Vpcy5rdW9AbWVkaWF0ZWsuY29tPgo+ID4gPiAt
LS0KPiA+ID4gIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vTWFrZWZpbGUgICAgICAgICAgICAgICB8
ICAgIDEgKwo+ID4gPiAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstaXNwL0tjb25maWcgICAg
ICAgIHwgICAxOCArCj4gPiA+ICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1pc3AvTWFrZWZp
bGUgICAgICAgfCAgICAzICsKPiA+ID4gIC4uLi9tZWRpYS9wbGF0Zm9ybS9tdGstaXNwL3Nlbmlu
Zi9NYWtlZmlsZSAgICB8ICAgIDcgKwo+ID4gPiAgLi4uL3BsYXRmb3JtL210ay1pc3Avc2VuaW5m
L210a19zZW5pbmYuYyAgICAgIHwgIDk3NCArKysrKysrKysrKwo+ID4gPiAgLi4uL3BsYXRmb3Jt
L210ay1pc3Avc2VuaW5mL210a19zZW5pbmZfZHBoeS5jIHwgIDM1MyArKysrCj4gPgo+ID4gSSB0
aGluayBwaHkgZHJpdmVyIHNob3VsZCBiZSBwbGFjZWQgaW4gZHJpdmVycy9waHkvbWVkaWF0ZWsg
YW5kIHNlcGFyYXRlIHBoeSBkcml2ZXIgdG8gYW4gaW5kZXBlbmRlbnQgcGF0Y2guCj4gPgo+ID4g
PiAgLi4uL3BsYXRmb3JtL210ay1pc3Avc2VuaW5mL210a19zZW5pbmZfcmVnLmggIHwgMTQ5MSAr
KysrKysrKysrKysrKysrKwo+ID4gPiAgLi4uL210ay1pc3Avc2VuaW5mL210a19zZW5pbmZfcnhf
cmVnLmggICAgICAgIHwgIDUxNSArKysrKysKPiA+ID4gIDggZmlsZXMgY2hhbmdlZCwgMzM2MiBp
bnNlcnRpb25zKCspCj4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tZWRpYS9wbGF0
Zm9ybS9tdGstaXNwL0tjb25maWcKPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21l
ZGlhL3BsYXRmb3JtL210ay1pc3AvTWFrZWZpbGUKPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBk
cml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1pc3Avc2VuaW5mL01ha2VmaWxlCj4gPiA+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstaXNwL3NlbmluZi9tdGtf
c2VuaW5mLmMKPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NAo+ID4gPiBkcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL210ay1pc3Avc2VuaW5mL210a19zZW5pbmZfZHBoeS5jCj4gPiA+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQKPiA+ID4gZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstaXNwL3NlbmluZi9tdGtf
c2VuaW5mX3JlZy5oCj4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQKPiA+ID4gZHJpdmVycy9tZWRp
YS9wbGF0Zm9ybS9tdGstaXNwL3NlbmluZi9tdGtfc2VuaW5mX3J4X3JlZy5oCj4gPiA+Cj4gPgo+
ID4gW3NuaXBdCj4gPgo+ID4gPiArCj4gPiA+ICsjaW5jbHVkZSA8bGludXgvY2xrLmg+Cj4gPiA+
ICsjaW5jbHVkZSA8bGludXgvZGVsYXkuaD4KPiA+ID4gKyNpbmNsdWRlIDxsaW51eC9pbnRlcnJ1
cHQuaD4KPiA+ID4gKyNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KPiA+ID4gKyNpbmNsdWRlIDxs
aW51eC9vZl9ncmFwaC5oPgo+ID4gPiArI2luY2x1ZGUgPGxpbnV4L29mX2lycS5oPgo+ID4KPiA+
IE5vIGlycSBoYW5kbGVyLCBzbyByZW1vdmUgdGhpcy4KPiA+Cj4gPiA+ICsjaW5jbHVkZSA8bGlu
dXgvcGxhdGZvcm1fZGV2aWNlLmg+Cj4gPiA+ICsjaW5jbHVkZSA8bGludXgvcG1fcnVudGltZS5o
Pgo+ID4gPiArI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KPiA+ID4gKyNpbmNsdWRlIDxsaW51eC92
aWRlb2RldjIuaD4KPiA+ID4gKyNpbmNsdWRlIDxtZWRpYS92NGwyLWFzeW5jLmg+Cj4gPiA+ICsj
aW5jbHVkZSA8bWVkaWEvdjRsMi1jdHJscy5oPgo+ID4gPiArI2luY2x1ZGUgPG1lZGlhL3Y0bDIt
ZXZlbnQuaD4KPiA+ID4gKyNpbmNsdWRlIDxtZWRpYS92NGwyLWZ3bm9kZS5oPgo+ID4gPiArI2lu
Y2x1ZGUgPG1lZGlhL3Y0bDItc3ViZGV2Lmg+Cj4gPiA+ICsjaW5jbHVkZSA8bGludXgvcGh5L3Bo
eS5oPgo+ID4gPiArI2luY2x1ZGUgIm10a19zZW5pbmZfcmVnLmgiCj4gPiA+ICsKPiA+Cj4gPiBb
c25pcF0KPiA+Cj4gPiA+ICsKPiA+ID4gK3N0YXRpYyBpbnQgc2VuaW5mX3NldF9jdHJsKHN0cnVj
dCB2NGwyX2N0cmwgKmN0cmwpIHsKPiA+ID4gKyAgICAgICBzdHJ1Y3QgbXRrX3NlbmluZiAqcHJp
diA9IGNvbnRhaW5lcl9vZihjdHJsLT5oYW5kbGVyLAo+ID4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgbXRrX3NlbmluZiwKPiA+ID4gK2N0cmxf
aGFuZGxlcik7Cj4gPiA+ICsKPiA+ID4gKyAgICAgICBzd2l0Y2ggKGN0cmwtPmlkKSB7Cj4gPiA+
ICsgICAgICAgY2FzZSBWNEwyX0NJRF9URVNUX1BBVFRFUk46Cj4gPiA+ICsgICAgICAgICAgICAg
ICBpZiAoY3RybC0+dmFsID09IFRFU1RfR0VOX1BBVFRFUk4pCj4gPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgIHJldHVybiBzZW5pbmZfZW5hYmxlX3Rlc3RfcGF0dGVybihwcml2KTsKPiA+Cj4g
PiBXaXRob3V0IHRoaXMsIHRoaXMgZHJpdmVyIHN0aWxsIHdvcmtzLCBzbyBtb3ZlIHRoaXMgdG8g
YW4gaW5kZXBlbmRlbnQgcGF0Y2guCj4gPgo+ID4gPiArICAgICAgICAgICAgICAgZWxzZSBpZiAo
Y3RybC0+dmFsID09IFRFU1RfRFVNUF9ERUJVR19JTkZPKQo+ID4gPiArICAgICAgICAgICAgICAg
ICAgICAgICByZXR1cm4gc2VuaW5mX2R1bXBfZGVidWdfaW5mbyhwcml2KTsKPiA+Cj4gPiBEaXR0
by4KPiA+Cj4gPiA+ICsgICAgICAgICAgICAgICBlbHNlCj4gPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgIHJldHVybiAtRUlOVkFMOwo+ID4gPiArICAgICAgIH0KPiA+ID4gKwo+ID4gPiArICAg
ICAgIHJldHVybiAwOwo+ID4gPiArfQo+ID4gPiArCj4gPgo+ID4gW3NuaXBdCj4gPgo+ID4gPiAr
Cj4gPiA+ICsjaWZkZWYgQ09ORklHX09GCj4gPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rl
dmljZV9pZCBtdGtfbWlwaV9kcGh5X29mX21hdGNoW10gPSB7Cj4gPiA+ICsgICAgICAgey5jb21w
YXRpYmxlID0gIm1lZGlhdGVrLG10ODE4My1taXBpX2RwaHkifSwKPiA+Cj4gPiBXaGVyZSBpcyB0
aGUgZGVmaW5pdGlvbiBvZiAibWVkaWF0ZWssbXQ4MTgzLW1pcGlfZHBoeSI/Cj4gPgo+ID4gUmVn
YXJkcywKPiA+IENodW4tS3VhbmcuCj4gPgo+ID4gPiArICAgICAgIHt9LAo+ID4gPiArfTsKPiA+
ID4gK01PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIG10a19taXBpX2RwaHlfb2ZfbWF0Y2gpOyAjZW5k
aWYKPiA+ID4gKwo+ID4gPiArc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgbWlwaV9kcGh5
X3BkcnYgPSB7Cj4gPiA+ICsgICAgICAgLnByb2JlICA9IG1pcGlfZHBoeV9wcm9iZSwKPiA+ID4g
KyAgICAgICAuZHJpdmVyID0gewo+ID4gPiArICAgICAgICAgICAgICAgLm5hbWUgICA9ICJtaXBp
X2RwaHkiLAo+ID4gPiArICAgICAgICAgICAgICAgLm9mX21hdGNoX3RhYmxlID0gb2ZfbWF0Y2hf
cHRyKG10a19taXBpX2RwaHlfb2ZfbWF0Y2gpLAo+ID4gPiArICAgICAgIH0sCj4gPiA+ICt9Owo+
ID4gPiArCj4gPiA+ICttb2R1bGVfcGxhdGZvcm1fZHJpdmVyKG1pcGlfZHBoeV9wZHJ2KTsKPiA+
ID4gKwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRp
YXRlawo=
