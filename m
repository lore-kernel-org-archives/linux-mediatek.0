Return-Path: <SRS0=TVmU=BN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5BB6C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 16:05:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4A1D206DA
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 16:05:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mAdFjhSO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Aex1PHJJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4A1D206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+e77NXP1xHDqt2bbduCVeSWgNrirlfIrc/bNF0q6Oo0=; b=mAdFjhSOIscRaH1cQ7o3qg/TZ
	z0RPExRcTEIpX9880s7b8jQ2Id48Wvgsp9WdMLl82LEaXwHTrOVDc67d7DKRYlaEuPYj5NMsvE7j5
	ithqdGDgHbu3V+5Ux8cEel999CB3WZNcSIBwA6dM4trKy48utvLfLdy0NfuT2Qo8oFyQz9awKD1wk
	HUs6RXSO5k5EFa8azQoNLtj612COLSeMfZbJODcdCXY/d/GamM4Bqx7id38es+zyj4LfEa1atRrc7
	eFZsf80UvmWQ3Q0fOnjjjEULvOlFDg/wdhpBLsefE+5Yf+xMo19rXj4BOTQmfotTJcp8svxvgbrnG
	4H10jilLQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2cxH-0006jQ-UX; Mon, 03 Aug 2020 16:04:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2cxC-0006h5-Va; Mon, 03 Aug 2020 16:04:48 +0000
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0FD8A2083B;
 Mon,  3 Aug 2020 16:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596470685;
 bh=/UX1OU9tHTJm7VObpjM87RBY5SlTmYFqwKSYlfihuqs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Aex1PHJJaysd09vlU+np1whABVJWYO/wgGVEovV9wOg6cLl2CSU719BxSEiosliwK
 wHInjDZVIy8Mkb2GSxlkHKBZx23l5uhEGcX56SdQsqnYYjVkxSXdgN5xk9ZV3BAO+u
 ZiLZxLktesZol9ClUnGepKSVXZxgvYc2LulD6qic=
Received: by mail-ej1-f52.google.com with SMTP id g19so25373730ejc.9;
 Mon, 03 Aug 2020 09:04:45 -0700 (PDT)
X-Gm-Message-State: AOAM5328zeOGhmsy5iPYGqOgZEnkhKf+7b5wkpxcGy0pG/IjNyeH6W7E
 ImJkOX4Hfdf/LXrWUc7lTWDBMmrc+0+CQh5gMw==
X-Google-Smtp-Source: ABdhPJwRrgFwRW06WGSZvbtle0QlHRJDgbphx4LdcrD/9UInwK+e+ZsDqq23da9XgbPticp6xo1sUinxOUHtS7ayNBw=
X-Received: by 2002:a17:906:7492:: with SMTP id
 e18mr16973100ejl.375.1596470684579; 
 Mon, 03 Aug 2020 09:04:44 -0700 (PDT)
MIME-Version: 1.0
References: <1596010690-13178-1-git-send-email-neal.liu@mediatek.com>
 <1596010690-13178-3-git-send-email-neal.liu@mediatek.com>
 <CAAOTY_8aw=6E7bMJwz5jDLXUxYHpy9_Avbwc90osQGckzANNcg@mail.gmail.com>
 <1596427295.22971.20.camel@mtkswgap22>
In-Reply-To: <1596427295.22971.20.camel@mtkswgap22>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 4 Aug 2020 00:04:30 +0800
X-Gmail-Original-Message-ID: <CAAOTY__VPXMGcR9w8EdnGbJyVbxbLQY+SRAqLbOcTy0D_WLM0w@mail.gmail.com>
Message-ID: <CAAOTY__VPXMGcR9w8EdnGbJyVbxbLQY+SRAqLbOcTy0D_WLM0w@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] soc: mediatek: add mtk-devapc driver
To: Neal Liu <neal.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_120447_171510_FA1885FD 
X-CRM114-Status: GOOD (  28.42  )
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
 wsd_upstream <wsd_upstream@mediatek.com>, devicetree@vger.kernel.org,
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIE5lYWw6CgpOZWFsIExpdSA8bmVhbC5saXVAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMOW5tDjm
nIgz5pelIOmAseS4gCDkuIvljYgxMjowMeWvq+mBk++8mgo+Cj4gSGkgQ2h1bi1LdWFuZywKPgo+
IE9uIFNhdCwgMjAyMC0wOC0wMSBhdCAwODoxMiArMDgwMCwgQ2h1bi1LdWFuZyBIdSB3cm90ZToK
PiA+IEhpLCBOZWFsOgo+ID4KPiA+IFRoaXMgcGF0Y2ggaXMgZm9yICJtZWRpYXRlayxtdDY3Nzkt
ZGV2YXBjIiwgc28gSSB0aGluayBjb21taXQgdGl0bGUKPiA+IHNob3VsZCBzaG93IHRoZSBTb0Mg
SUQuCj4KPiBPa2F5LCBJJ2xsIGNoYW5nZSB0aXRsZSB0byAnc29jOm1lZGlhdGVrOiBhZGQgbXQ2
Nzc5IGRldmFwYyBkcml2ZXInLgo+Cj4gPgo+ID4gTmVhbCBMaXUgPG5lYWwubGl1QG1lZGlhdGVr
LmNvbT4g5pa8IDIwMjDlubQ35pyIMjnml6Ug6YCx5LiJIOS4i+WNiDQ6Mjnlr6vpgZPvvJoKPiA+
ID4KPiA+ID4gTWVkaWFUZWsgYnVzIGZhYnJpYyBwcm92aWRlcyBUcnVzdFpvbmUgc2VjdXJpdHkg
c3VwcG9ydCBhbmQgZGF0YQo+ID4gPiBwcm90ZWN0aW9uIHRvIHByZXZlbnQgc2xhdmVzIGZyb20g
YmVpbmcgYWNjZXNzZWQgYnkgdW5leHBlY3RlZAo+ID4gPiBtYXN0ZXJzLgo+ID4gPiBUaGUgc2Vj
dXJpdHkgdmlvbGF0aW9uIGlzIGxvZ2dlZCBhbmQgc2VudCB0byB0aGUgcHJvY2Vzc29yIGZvcgo+
ID4gPiBmdXJ0aGVyIGFuYWx5c2lzIG9yIGNvdW50ZXJtZWFzdXJlcy4KPiA+ID4KPiA+ID4gQW55
IG9jY3VycmVuY2Ugb2Ygc2VjdXJpdHkgdmlvbGF0aW9uIHdvdWxkIHJhaXNlIGFuIGludGVycnVw
dCwgYW5kCj4gPiA+IGl0IHdpbGwgYmUgaGFuZGxlZCBieSBtdGstZGV2YXBjIGRyaXZlci4gVGhl
IHZpb2xhdGlvbgo+ID4gPiBpbmZvcm1hdGlvbiBpcyBwcmludGVkIGluIG9yZGVyIHRvIGZpbmQg
dGhlIG11cmRlcmVyLgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBOZWFsIExpdSA8bmVhbC5s
aXVAbWVkaWF0ZWsuY29tPgo+ID4gPiAtLS0KPiA+Cj4gPiBbc25pcF0KPiA+Cj4gPiA+ICsKPiA+
ID4gK3N0cnVjdCBtdGtfZGV2YXBjX2NvbnRleHQgewo+ID4gPiArICAgICAgIHN0cnVjdCBkZXZp
Y2UgKmRldjsKPiA+ID4gKyAgICAgICB1MzIgdmlvX2lkeF9udW07Cj4gPiA+ICsgICAgICAgdm9p
ZCBfX2lvbWVtICpkZXZhcGNfcGRfYmFzZTsKPiA+ID4gKyAgICAgICBzdHJ1Y3QgbXRrX2RldmFw
Y192aW9faW5mbyAqdmlvX2luZm87Cj4gPiA+ICsgICAgICAgY29uc3Qgc3RydWN0IG10a19kZXZh
cGNfcGRfb2Zmc2V0ICpvZmZzZXQ7Cj4gPiA+ICsgICAgICAgY29uc3Qgc3RydWN0IG10a19kZXZh
cGNfdmlvX2RiZ3MgKnZpb19kYmdzOwo+ID4gPiArfTsKPiA+Cj4gPiBJIHRoaW5rIHRoaXMgc3Ry
dWN0dXJlIHNob3VsZCBzZXBhcmF0ZSB0aGUgY29uc3RhbnQgcGFydC4gVGhlIGNvbnN0YW50IHBh
cnQgaXM6Cj4gPgo+ID4gc3RydWN0IG10a19kZXZhcGNfZGF0YSB7Cj4gPiAgICAgY29uc3QgdTMy
IHZpb19pZHhfbnVtOwo+ID4gICAgIGNvbnN0IHN0cnVjdCBtdGtfZGV2YXBjX3BkX29mZnNldCAq
b2Zmc2V0OyAvKiBJIHdvdWxkIGxpa2UgdG8KPiA+IHJlbW92ZSBzdHJ1Y3QgbXRrX2RldmFwY19w
ZF9vZmZzZXQgYW5kIGRpcmVjdGx5IHB1dCBpdHMgbWVtYmVyIGludG8KPiA+IHRoaXMgc3RydWN0
dXJlICovCj4gPiAgICAgY29uc3Qgc3RydWN0IG10a19kZXZhcGNfdmlvX2RiZ3MgKnZpb19kYmdz
OyAvKiBUaGlzIG1heSBkaXNhcHBlYXIgKi8KPiA+IH07Cj4gPgo+ID4gQW5kIHRoZSBjb250ZXh0
IGlzOgo+ID4KPiA+IHN0cnVjdCBtdGtfZGV2YXBjX2NvbnRleHQgewo+ID4gICAgIHN0cnVjdCBk
ZXZpY2UgKmRldjsKPiA+ICAgICB2b2lkIF9faW9tZW0gKmRldmFwY19wZF9iYXNlOwo+ID4gICAg
IGNvbnN0IHN0cnVjdCBtdGtfZGV2YXBjX2RhdGEgKmRhdGE7Cj4gPiB9Owo+ID4KPiA+IFNvIHdo
ZW4geW91IGRlZmluZSB0aGlzLCB5b3Ugd291bGQgbm90IHdhc3RlIG1lbW9yeSB0byBzdG9yZSBu
b24tY29uc3RhbnQgZGF0YS4KPiA+Cj4gPiBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19kZXZhcGNf
ZGF0YSBkZXZhcGNfbXQ2Nzc5ID0gewo+ID4gIC52aW9faWR4X251bSA9IDUxMCwKPiA+ICAub2Zm
c2V0ID0gJm10Njc3OV9wZF9vZmZzZXQsCj4gPiAgLnZpb19kYmdzID0gJm10Njc3OV92aW9fZGJn
cywKPiA+IH07Cj4gPgo+Cj4gU29ycnksIEkgc3RpbGwgZG9uJ3QgdW5kZXJzdGFuZCB3aHkgdGhp
cyByZWZhY3RvcmluZyB3aWxsIG5vdCB3YXN0ZQo+IG1lbW9yeSB0byBzdG9yZSBub24tY29uc3Rh
bnQgZGF0YS4gQ291bGQgeW91IGV4cGxhaW4gbW9yZSBkZXRhaWxzPwo+IFRvIG15IHVuZGVyc3Rh
bmRpbmcsIHdlIHN0aWxsIGFsc28gaGF2ZSB0byBhbGxvY2F0ZSBtZW1vcnkgdG8gc3RvcmUgZGV2
Cj4gJiBkZXZhcGNfcGRfYmFzZS4KCkluIHNvbWUgc2l0dWF0aW9uLCBpdCBpcy4gWW91IG1ha2Ug
dGhlIG5vbi1jb25zdGFudCBkYXRhIGEgZ2xvYmFsCnZhcmlhYmxlLiBJIHRoaW5rIHRoZSBjb250
ZXh0IGRhdGEgc2hvdWxkIGJlIGR5bmFtaWMgYWxsb2NhdGVkLiBJZgp0aGlzIGRyaXZlciBpcyBu
b3QgcHJvYmVkLCB0aGUgbm9uLWNvbnN0YW50IGRhdGEgb2NjdXB5IHRoZSBtZW1vcnkuCgpSZWdh
cmRzLApDaHVuLUt1YW5nLgoKPgo+ID4gUmVnYXJkcywKPiA+IENodW4tS3VhbmcuCj4gPgo+ID4g
PiArCj4gPiA+ICsjZW5kaWYgLyogX19NVEtfREVWQVBDX0hfXyAqLwo+ID4gPiAtLQo+ID4gPiAx
LjcuOS41Cj4gPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gPiA+IExpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdAo+ID4gPiBMaW51eC1tZWRpYXRl
a0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsKPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4
LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
