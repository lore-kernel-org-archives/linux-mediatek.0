Return-Path: <SRS0=p2pa=BO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E286C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 15:56:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37F10208A9
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 15:56:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2YqYQGg4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gn27xIYB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37F10208A9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1cLk6oWAhmcwb5JiOQqbeAaY1igjkImOAfDOORbgkZA=; b=2YqYQGg4yacTiW7qWrnKQyXfA
	vJQbsYVuVykxNSSguXiE90HO7jZJuAqmZRWujOgj16nDiZwnCNYJF2IHsQHRFShJTXRKpBLXPcS4u
	hDAIgA+yjDMTvSflfWnFkJPm98Nw96mg5Pg783cCBetWtC+Yy5h4A50v0u5SNSy48P/6DwbeAjCkH
	8HP/EHvkn57dMd8iW0akimU6HVQEj2bUx//lxrkt4TXADt+2IKgX8eMULV/yy2X74+Rloezmg6Yl1
	V+w27Jzc3gKHTjiX4p/IpX+e1mKZkcQmexo7Xx34xiCieTkGsqNvs3t9MJjXx9uYJ+9gNLS/yBS75
	ZyYbxUUTA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2zIX-0002aE-MQ; Tue, 04 Aug 2020 15:56:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2zIS-0002YY-JX; Tue, 04 Aug 2020 15:56:13 +0000
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D2E9622B40;
 Tue,  4 Aug 2020 15:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596556571;
 bh=r9szaxcb0fGCAe0HMLSnjnkiEt8lN82rikVx3Wzyc8k=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Gn27xIYBRAdQ0HUbjrU0tl+T1HMHIOKi4NVP/JyyaE6gJ7Bdx/AQ+UqqHhNAgPxHU
 i+QHBYY/kYwJXZ29c9+zCWHKfuN+QTEA/tURLegO5jnKftEtEvMU94Y8SwrVDTH9kO
 7j9BEUqKjSaLkvJZ+eelyokQWgMscR0UTF6YnBWA=
Received: by mail-ed1-f50.google.com with SMTP id bs17so11504592edb.1;
 Tue, 04 Aug 2020 08:56:10 -0700 (PDT)
X-Gm-Message-State: AOAM531xAy9Uh1DMrRriCc/izyTL714ZffB88fVjLWssqMahgdBulXOm
 qxDaEDt2Pk/GE5l+wCEi/jMPMjHyuchzxERKmg==
X-Google-Smtp-Source: ABdhPJw6PbsNIUkr8bnNDmHBfLq9tqqzI0fjOv2L1LAiywI4YCnZbHGEMCWLZ++QY9tilg2ZojDUiq6jFGbXXUGQAss=
X-Received: by 2002:a50:e109:: with SMTP id h9mr7783463edl.47.1596556569352;
 Tue, 04 Aug 2020 08:56:09 -0700 (PDT)
MIME-Version: 1.0
References: <1596010690-13178-1-git-send-email-neal.liu@mediatek.com>
 <1596010690-13178-3-git-send-email-neal.liu@mediatek.com>
 <CAAOTY_8aw=6E7bMJwz5jDLXUxYHpy9_Avbwc90osQGckzANNcg@mail.gmail.com>
 <1596427295.22971.20.camel@mtkswgap22>
 <CAAOTY__VPXMGcR9w8EdnGbJyVbxbLQY+SRAqLbOcTy0D_WLM0w@mail.gmail.com>
 <1596506892.17917.2.camel@mtkswgap22>
In-Reply-To: <1596506892.17917.2.camel@mtkswgap22>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 4 Aug 2020 23:55:57 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-ndxjR1UQ4NQvxN3tVgT8t-cZb27j0U9Y7Q9CufUDc8Q@mail.gmail.com>
Message-ID: <CAAOTY_-ndxjR1UQ4NQvxN3tVgT8t-cZb27j0U9Y7Q9CufUDc8Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] soc: mediatek: add mtk-devapc driver
To: Neal Liu <neal.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_115612_793464_43D2B36E 
X-CRM114-Status: GOOD (  30.95  )
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

TmVhbCBMaXUgPG5lYWwubGl1QG1lZGlhdGVrLmNvbT4g5pa8IDIwMjDlubQ45pyINOaXpSDpgLHk
uowg5LiK5Y2IMTA6MDjlr6vpgZPvvJoKPgo+IE9uIFR1ZSwgMjAyMC0wOC0wNCBhdCAwMDowNCAr
MDgwMCwgQ2h1bi1LdWFuZyBIdSB3cm90ZToKPiA+IEhpLCBOZWFsOgo+ID4KPiA+IE5lYWwgTGl1
IDxuZWFsLmxpdUBtZWRpYXRlay5jb20+IOaWvCAyMDIw5bm0OOaciDPml6Ug6YCx5LiAIOS4i+WN
iDEyOjAx5a+r6YGT77yaCj4gPiA+Cj4gPiA+IEhpIENodW4tS3VhbmcsCj4gPiA+Cj4gPiA+IE9u
IFNhdCwgMjAyMC0wOC0wMSBhdCAwODoxMiArMDgwMCwgQ2h1bi1LdWFuZyBIdSB3cm90ZToKPiA+
ID4gPiBIaSwgTmVhbDoKPiA+ID4gPgo+ID4gPiA+IFRoaXMgcGF0Y2ggaXMgZm9yICJtZWRpYXRl
ayxtdDY3NzktZGV2YXBjIiwgc28gSSB0aGluayBjb21taXQgdGl0bGUKPiA+ID4gPiBzaG91bGQg
c2hvdyB0aGUgU29DIElELgo+ID4gPgo+ID4gPiBPa2F5LCBJJ2xsIGNoYW5nZSB0aXRsZSB0byAn
c29jOm1lZGlhdGVrOiBhZGQgbXQ2Nzc5IGRldmFwYyBkcml2ZXInLgo+ID4gPgo+ID4gPiA+Cj4g
PiA+ID4gTmVhbCBMaXUgPG5lYWwubGl1QG1lZGlhdGVrLmNvbT4g5pa8IDIwMjDlubQ35pyIMjnm
l6Ug6YCx5LiJIOS4i+WNiDQ6Mjnlr6vpgZPvvJoKPiA+ID4gPiA+Cj4gPiA+ID4gPiBNZWRpYVRl
ayBidXMgZmFicmljIHByb3ZpZGVzIFRydXN0Wm9uZSBzZWN1cml0eSBzdXBwb3J0IGFuZCBkYXRh
Cj4gPiA+ID4gPiBwcm90ZWN0aW9uIHRvIHByZXZlbnQgc2xhdmVzIGZyb20gYmVpbmcgYWNjZXNz
ZWQgYnkgdW5leHBlY3RlZAo+ID4gPiA+ID4gbWFzdGVycy4KPiA+ID4gPiA+IFRoZSBzZWN1cml0
eSB2aW9sYXRpb24gaXMgbG9nZ2VkIGFuZCBzZW50IHRvIHRoZSBwcm9jZXNzb3IgZm9yCj4gPiA+
ID4gPiBmdXJ0aGVyIGFuYWx5c2lzIG9yIGNvdW50ZXJtZWFzdXJlcy4KPiA+ID4gPiA+Cj4gPiA+
ID4gPiBBbnkgb2NjdXJyZW5jZSBvZiBzZWN1cml0eSB2aW9sYXRpb24gd291bGQgcmFpc2UgYW4g
aW50ZXJydXB0LCBhbmQKPiA+ID4gPiA+IGl0IHdpbGwgYmUgaGFuZGxlZCBieSBtdGstZGV2YXBj
IGRyaXZlci4gVGhlIHZpb2xhdGlvbgo+ID4gPiA+ID4gaW5mb3JtYXRpb24gaXMgcHJpbnRlZCBp
biBvcmRlciB0byBmaW5kIHRoZSBtdXJkZXJlci4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBOZWFsIExpdSA8bmVhbC5saXVAbWVkaWF0ZWsuY29tPgo+ID4gPiA+ID4gLS0tCj4g
PiA+ID4KPiA+ID4gPiBbc25pcF0KPiA+ID4gPgo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gK3N0cnVj
dCBtdGtfZGV2YXBjX2NvbnRleHQgewo+ID4gPiA+ID4gKyAgICAgICBzdHJ1Y3QgZGV2aWNlICpk
ZXY7Cj4gPiA+ID4gPiArICAgICAgIHUzMiB2aW9faWR4X251bTsKPiA+ID4gPiA+ICsgICAgICAg
dm9pZCBfX2lvbWVtICpkZXZhcGNfcGRfYmFzZTsKPiA+ID4gPiA+ICsgICAgICAgc3RydWN0IG10
a19kZXZhcGNfdmlvX2luZm8gKnZpb19pbmZvOwo+ID4gPiA+ID4gKyAgICAgICBjb25zdCBzdHJ1
Y3QgbXRrX2RldmFwY19wZF9vZmZzZXQgKm9mZnNldDsKPiA+ID4gPiA+ICsgICAgICAgY29uc3Qg
c3RydWN0IG10a19kZXZhcGNfdmlvX2RiZ3MgKnZpb19kYmdzOwo+ID4gPiA+ID4gK307Cj4gPiA+
ID4KPiA+ID4gPiBJIHRoaW5rIHRoaXMgc3RydWN0dXJlIHNob3VsZCBzZXBhcmF0ZSB0aGUgY29u
c3RhbnQgcGFydC4gVGhlIGNvbnN0YW50IHBhcnQgaXM6Cj4gPiA+ID4KPiA+ID4gPiBzdHJ1Y3Qg
bXRrX2RldmFwY19kYXRhIHsKPiA+ID4gPiAgICAgY29uc3QgdTMyIHZpb19pZHhfbnVtOwo+ID4g
PiA+ICAgICBjb25zdCBzdHJ1Y3QgbXRrX2RldmFwY19wZF9vZmZzZXQgKm9mZnNldDsgLyogSSB3
b3VsZCBsaWtlIHRvCj4gPiA+ID4gcmVtb3ZlIHN0cnVjdCBtdGtfZGV2YXBjX3BkX29mZnNldCBh
bmQgZGlyZWN0bHkgcHV0IGl0cyBtZW1iZXIgaW50bwo+ID4gPiA+IHRoaXMgc3RydWN0dXJlICov
Cj4gPiA+ID4gICAgIGNvbnN0IHN0cnVjdCBtdGtfZGV2YXBjX3Zpb19kYmdzICp2aW9fZGJnczsg
LyogVGhpcyBtYXkgZGlzYXBwZWFyICovCj4gPiA+ID4gfTsKPiA+ID4gPgo+ID4gPiA+IEFuZCB0
aGUgY29udGV4dCBpczoKPiA+ID4gPgo+ID4gPiA+IHN0cnVjdCBtdGtfZGV2YXBjX2NvbnRleHQg
ewo+ID4gPiA+ICAgICBzdHJ1Y3QgZGV2aWNlICpkZXY7Cj4gPiA+ID4gICAgIHZvaWQgX19pb21l
bSAqZGV2YXBjX3BkX2Jhc2U7Cj4gPiA+ID4gICAgIGNvbnN0IHN0cnVjdCBtdGtfZGV2YXBjX2Rh
dGEgKmRhdGE7Cj4gPiA+ID4gfTsKPiA+ID4gPgo+ID4gPiA+IFNvIHdoZW4geW91IGRlZmluZSB0
aGlzLCB5b3Ugd291bGQgbm90IHdhc3RlIG1lbW9yeSB0byBzdG9yZSBub24tY29uc3RhbnQgZGF0
YS4KPiA+ID4gPgo+ID4gPiA+IHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2RldmFwY19kYXRhIGRl
dmFwY19tdDY3NzkgPSB7Cj4gPiA+ID4gIC52aW9faWR4X251bSA9IDUxMCwKPiA+ID4gPiAgLm9m
ZnNldCA9ICZtdDY3NzlfcGRfb2Zmc2V0LAo+ID4gPiA+ICAudmlvX2RiZ3MgPSAmbXQ2Nzc5X3Zp
b19kYmdzLAo+ID4gPiA+IH07Cj4gPiA+ID4KPiA+ID4KPiA+ID4gU29ycnksIEkgc3RpbGwgZG9u
J3QgdW5kZXJzdGFuZCB3aHkgdGhpcyByZWZhY3RvcmluZyB3aWxsIG5vdCB3YXN0ZQo+ID4gPiBt
ZW1vcnkgdG8gc3RvcmUgbm9uLWNvbnN0YW50IGRhdGEuIENvdWxkIHlvdSBleHBsYWluIG1vcmUg
ZGV0YWlscz8KPiA+ID4gVG8gbXkgdW5kZXJzdGFuZGluZywgd2Ugc3RpbGwgYWxzbyBoYXZlIHRv
IGFsbG9jYXRlIG1lbW9yeSB0byBzdG9yZSBkZXYKPiA+ID4gJiBkZXZhcGNfcGRfYmFzZS4KPiA+
Cj4gPiBJbiBzb21lIHNpdHVhdGlvbiwgaXQgaXMuIFlvdSBtYWtlIHRoZSBub24tY29uc3RhbnQg
ZGF0YSBhIGdsb2JhbAo+ID4gdmFyaWFibGUuIEkgdGhpbmsgdGhlIGNvbnRleHQgZGF0YSBzaG91
bGQgYmUgZHluYW1pYyBhbGxvY2F0ZWQuIElmCj4gPiB0aGlzIGRyaXZlciBpcyBub3QgcHJvYmVk
LCB0aGUgbm9uLWNvbnN0YW50IGRhdGEgb2NjdXB5IHRoZSBtZW1vcnkuCj4gPgo+Cj4gSSBnb3Qg
eW91ciBwb2ludCEgSW4gdGhpcyBjYXNlLCB3ZSBjYW4gc2F2ZSB0aGVzZSAyIGRhdGEgc3RydWN0
dXJlCj4gc3BhY2UsIHJpZ2h0Pwo+Cj4gc3RydWN0IGRldmljZSAqZGV2Owo+IHZvaWQgX19pb21l
bSAqZGV2YXBjX3BkX2Jhc2U7CgpSaWdodC4KCj4KPiBJJ2xsIHJlZmFjdG9yaW5nIHRoaXMgZGF0
YSBzdHJ1Y3R1cmVzIG9uIG5leHQgcGF0Y2guIFRoYW5rcyAhCj4KPiA+IFJlZ2FyZHMsCj4gPiBD
aHVuLUt1YW5nLgo+ID4KPiA+ID4KPiA+ID4gPiBSZWdhcmRzLAo+ID4gPiA+IENodW4tS3Vhbmcu
Cj4gPiA+ID4KPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsjZW5kaWYgLyogX19NVEtfREVWQVBDX0hf
XyAqLwo+ID4gPiA+ID4gLS0KPiA+ID4gPiA+IDEuNy45LjUKPiA+ID4gPiA+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiA+ID4gPiBMaW51eC1tZWRp
YXRlayBtYWlsaW5nIGxpc3QKPiA+ID4gPiA+IExpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVh
ZC5vcmcKPiA+ID4gPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbWVkaWF0ZWsKPiA+ID4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlh
dGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
