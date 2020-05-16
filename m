Return-Path: <SRS0=ODC1=66=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0B3BC433E0
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 May 2020 09:13:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C30C20709
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 May 2020 09:13:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MIm72XiJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="RGWW1cJr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C30C20709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u0Yh4LuqtNn81j5od9AHjbsElRs6e3FLYqGj50M4EKo=; b=MIm72XiJLt8meD
	Kzbe6nGjbpDLZ/6cSMJ8kR+Uc5XLVohJL6VZ8MowmzgaqfGy37S+8O5iZ5g1AFdv5GTj+mj3v4KqE
	LGqndPjE/ay3GzaQJbybk7pPhosynyxqF7W+ueqaWtTS8Bf6U6tNckikNB1OlX0eWevslJOylE6JU
	/gvWb4MAvEpJuXPIoOXXw1sy7Ed4+WnVTbN3RnsuIhN4EKAb1Ly3IUQsiVNavMahhN7p9wqT15K9g
	yLPTIK4sQSj2EN2eegJ6vurgJ4QZUgVSh4OnhEeJjpiOhBwQhp2y3b29hAEdmKj+zpCcedrzve/aE
	8+MQKC8aRCkcjn5RbzIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZssW-0000k3-5P; Sat, 16 May 2020 09:13:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZssK-0000Qw-LX; Sat, 16 May 2020 09:12:58 +0000
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A9D822075F;
 Sat, 16 May 2020 09:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589620373;
 bh=nImC5Lqhf3m2EzWrtneElBAhRDJ15TlDvFtmSiX6f7A=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=RGWW1cJr2LvrfH09qMjVWsx8mNmCA5lXbW0QSHs1KdZsbmeH4TE50jQOM+gAkWV9A
 omL750r+TYwA39nB7PeG4t838ZbdCw4GuAR8wLBh7xGMDjeXgFrngjACBhvInxNe5w
 2WduJotZ51M1UhTHYAAxHdj6qip3Ebv5VGdGgpv8=
Received: by mail-ej1-f51.google.com with SMTP id l21so4345793eji.4;
 Sat, 16 May 2020 02:12:53 -0700 (PDT)
X-Gm-Message-State: AOAM531NQH7cs90bKeoxHDotlv6LOn16sqYTn/bR5LsBeLqhMQDQNRSe
 PkuBknfUqP9tRY5gNqLgrXZPyt8c+aoFAlKXOw==
X-Google-Smtp-Source: ABdhPJxqXiBmi+YOlaHROm44eIZV54f3axqEuGxo7+ttRmcSCa8fZsoluwuiSKiAlI4IsRpaXMHAB1+wPGTuO+pbJpk=
X-Received: by 2002:a17:906:924a:: with SMTP id
 c10mr2519194ejx.360.1589620372129; 
 Sat, 16 May 2020 02:12:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200504141408.60877-1-enric.balletbo@collabora.com>
 <CAAOTY_8vMG1k86V+qBhs0YH5QHELmgtJ0PNOAzWTHoTy2j=R2Q@mail.gmail.com>
In-Reply-To: <CAAOTY_8vMG1k86V+qBhs0YH5QHELmgtJ0PNOAzWTHoTy2j=R2Q@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 16 May 2020 17:12:40 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9PdpKTwN46ZwpnRyOw-Ky758oxX11mLer6EksZgfsXSw@mail.gmail.com>
Message-ID: <CAAOTY_9PdpKTwN46ZwpnRyOw-Ky758oxX11mLer6EksZgfsXSw@mail.gmail.com>
Subject: Re: [PATCH 0/3] Convert mtk-dpi to drm_bridge API
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200516_021256_747840_B3961D68 
X-CRM114-Status: GOOD (  13.63  )
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEVucmljOgoKQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+IOaWvCAy
MDIw5bm0NeaciDEw5pelIOmAseaXpSDkuIrljYg5OjI05a+r6YGT77yaCj4KPiBIaSwgRW5yaWM6
Cj4KPiBFbnJpYyBCYWxsZXRibyBpIFNlcnJhIDxlbnJpYy5iYWxsZXRib0Bjb2xsYWJvcmEuY29t
PiDmlrwgMjAyMOW5tDXmnIg05pelIOmAseS4gCDkuIvljYgxMDoxNOWvq+mBk++8mgo+ID4KPiA+
IFRoZSBtdGstZHBpIGRyaXZlciBzdGlsbCB1c2VzIHRoZSBkcm1fZW5jb2RlciBBUEkgd2hpY2gg
aXMgbm93IHNvbWVob3cKPiA+IGRlcHJlY2F0ZWQuIFdlIHN0YXJ0ZWQgdG8gbW92ZSBhbGwgdGhl
IE1lZGlhdGVrIGRyaXZlcnMgdG8gdGhlIGRybV9icmlkZ2UgQVBJLAo+ID4gbGlrZSB3ZSBkaWQg
Zm9yIHRoZSBtdGstZHNpIGRyaXZlciBbMV0sIHRoaXMgaXMgYW5vdGhlciBzbWFsbCBzdGVwIHRv
IGJlIGFibGUgdG8KPiA+IGZ1bGx5IGNvbnZlcnQgdGhlIERSTSBNZWRpYXRlayBkcml2ZXJzIHRv
IHRoZSBkcm1fYnJpZGdlIEFQSS4gQSBkdW1teQo+ID4gZHJtX2VuY29kZXIgaXMgbWFpbnRhaW5l
ZCBpbiB0aGUgbXRrLWRwaSBkcml2ZXIgYnV0IHRoZSBlbmQgZ29hbCBpcyBtb3ZlIGFsbCB0aGUK
PiA+IGR1bW15IGRybV9lbmNvZGVyIChtdGstZHNpLCBtdGstZHBpLCBldGMpIHRvIHRoZSBtYWlu
IG10a19kcm1fZHJ2IGRyaXZlci4KPgo+IEZvciB0aGlzIHNlcmllcywgYXBwbGllZCB0byBtZWRp
YXRlay1kcm0tbmV4dCBbMV0sIHRoYW5rcy4KPgo+IFsxXSBodHRwczovL2dpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9jaHVua3VhbmcuaHUvbGludXguZ2l0L2xvZy8/aD1t
ZWRpYXRlay1kcm0tbmV4dAo+CgpJIHJlbW92ZSB0aGlzIHNlcmllcyBmcm9tIG1lZGlhdGVrLWRy
bS1uZXh0IGJlY2F1c2UgZHJtIGJyaWRnZSBkcml2ZXIKbmVlZCBhY2sgb2YgZHJtIGJyaWRnZSBt
YWludGFpbmVyLgoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4gUmVnYXJkcywKPiBDaHVuLUt1YW5n
Lgo+Cj4gPgo+ID4gQmVzdCByZWdhcmRzLAo+ID4gIEVucmljCj4gPgo+ID4gWzFdIGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL3BhdGNod29yay9wcm9qZWN0L2xrbWwvbGlzdC8/c2VyaWVzPTQ0MTU1
OQo+ID4KPiA+IEVucmljIEJhbGxldGJvIGkgU2VycmEgKDMpOgo+ID4gICBkcm0vbWVkaWF0ZWs6
IG10a19kcGk6IFJlbmFtZSBicmlkZ2UgdG8gbmV4dF9icmlkZ2UKPiA+ICAgZHJtL21lZGlhdGVr
OiBtdGtfZHBpOiBDb252ZXJ0IHRvIGJyaWRnZSBkcml2ZXIKPiA+ICAgZHJtL21lZGlhdGVrOiBt
dGtfZHBpOiBVc2Ugc2ltcGxlIGVuY29kZXIKPiA+Cj4gPiAgZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcGkuYyB8IDg0ICsrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLQo+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAzOSBpbnNlcnRpb25zKCspLCA0NSBkZWxldGlvbnMoLSkKPiA+Cj4gPiAt
LQo+ID4gMi4yNi4yCj4gPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tZWRpYXRlawo=
