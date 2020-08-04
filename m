Return-Path: <SRS0=p2pa=BO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6380C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 15:28:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 931662086A
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 15:28:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ron3N5Cl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="nPRx8iVY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 931662086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ikw5vXqYE18iw+vL/61sCgfa3pJ9okxYFP9kt71U/Ko=; b=ron3N5ClBxSr/yJ9+bBqpmyLQ
	CgZ/jiQ1GkvAcIumVZ8qZJ5VsILTbMPm7lU5+Te/ILBTA0ZfVOQCb1DtwvZiw4n7VGMg1p2FEjKFY
	ayJwBkNwhhV7Wt7nXOEOUtBjRoLOPopLqZUmlX6DaIo+FPhMvfpNCZ874N1ZiAJnACGqJcaS8rWRe
	wWpPRJ9fCT7NVBeC2aYnjyiS7jfDmrUhOGCJezoiuYHg77DmVcXNyJqdEs7Ug9OMdVab6K46zKcI2
	grsx1OyBliX29343O2JGf9zYy3cj4hHPZlvDGObjKcwnkjfh0fz27P5vSunm8Uc4H/bFYNjuhBBJb
	MI9i7ZctQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2yrO-0006U7-OS; Tue, 04 Aug 2020 15:28:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2yrK-0006T9-3z; Tue, 04 Aug 2020 15:28:10 +0000
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 268EA22B42;
 Tue,  4 Aug 2020 15:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596554889;
 bh=GrEWQJQGOl4cRu/UhU8uTIUnxBntWt33e91g5LKhI0I=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=nPRx8iVY++kqpG4JDyL1ugJ8/dPRM/1CePHwuMe6djgeGx/H47CQvGe8BxoDCcvTB
 +xnKxXz0q/mQsWogVoyUU8Nh1lisdIbXVuFzZvsCKxPeZ9zgnQAokq3MDRCJvXynF8
 EV4KlR/0/hX43DjjgGRnOv62JW6Wup4tHovWHpek=
Received: by mail-ed1-f43.google.com with SMTP id l23so16475547edv.11;
 Tue, 04 Aug 2020 08:28:09 -0700 (PDT)
X-Gm-Message-State: AOAM530EUvF1cqNxAO2rp2IuLAFwoFc3gR+GgEzu+t2/3oEJGXTejhuE
 v9QOe8GsmTTx8UH3lcAGXQ971GlsHnz72buvVQ==
X-Google-Smtp-Source: ABdhPJz4owQRFlNIZk3qrbGz+1xbIMmNTB4wOXaF6pJDPcefYmGuIWtd4ZfGJJqDp76Dh2VsG/aOI8Et1XcOKW06Fao=
X-Received: by 2002:a50:e109:: with SMTP id h9mr7679015edl.47.1596554887579;
 Tue, 04 Aug 2020 08:28:07 -0700 (PDT)
MIME-Version: 1.0
References: <1596010690-13178-1-git-send-email-neal.liu@mediatek.com>
 <1596010690-13178-3-git-send-email-neal.liu@mediatek.com>
 <CAAOTY_8bE8Qo5-0MA9J1gcEbN4DP=Wf2O6vOUVos=VkoODeayA@mail.gmail.com>
 <1596163478.3932.17.camel@mtkswgap22>
 <CAAOTY_9kS+jrCOpZtOs+L8gBzvkewi+cSN7XWGNxuiMQocedFA@mail.gmail.com>
 <1596425521.22971.13.camel@mtkswgap22>
 <CAAOTY_9UcnSDTaVPDPyPLsWEYcrcq5MY=z520MWtFdeLw_FqGQ@mail.gmail.com>
 <1596507531.17917.10.camel@mtkswgap22>
In-Reply-To: <1596507531.17917.10.camel@mtkswgap22>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 4 Aug 2020 23:27:56 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-fsAXAO0rVMBdL+MLpFUx6w8EUCNoZG=qNvG+UuEDkGA@mail.gmail.com>
Message-ID: <CAAOTY_-fsAXAO0rVMBdL+MLpFUx6w8EUCNoZG=qNvG+UuEDkGA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] soc: mediatek: add mtk-devapc driver
To: Neal Liu <neal.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_112810_297653_54F181CB 
X-CRM114-Status: GOOD (  38.61  )
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
uowg5LiK5Y2IMTA6MTnlr6vpgZPvvJoKPgo+Cj4gT24gVHVlLCAyMDIwLTA4LTA0IGF0IDAwOjEz
ICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOgo+ID4gSGksIE5lYWw6Cj4gPgo+ID4gTmVhbCBM
aXUgPG5lYWwubGl1QG1lZGlhdGVrLmNvbT4g5pa8IDIwMjDlubQ45pyIM+aXpSDpgLHkuIAg5LiK
5Y2IMTE6MzLlr6vpgZPvvJoKPiA+ID4KPiA+ID4gSGkgQ2h1bi1LdWFuZywKPiA+ID4KPiA+ID4g
T24gRnJpLCAyMDIwLTA3LTMxIGF0IDIzOjAzICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOgo+
ID4gPiA+IEhpLCBOZWFsOgo+ID4gPiA+Cj4gPiA+ID4gTmVhbCBMaXUgPG5lYWwubGl1QG1lZGlh
dGVrLmNvbT4g5pa8IDIwMjDlubQ35pyIMzHml6Ug6YCx5LqUIOS4iuWNiDEwOjQ05a+r6YGT77ya
Cj4gPiA+ID4gPgo+ID4gPiA+ID4gSGkgQ2h1bi1LdWFuZywKPiA+ID4gPiA+Cj4gPiA+ID4gPgo+
ID4gPiA+ID4gT24gVGh1LCAyMDIwLTA3LTMwIGF0IDAwOjM4ICswODAwLCBDaHVuLUt1YW5nIEh1
IHdyb3RlOgo+ID4gPiA+ID4gPiBIaSwgTmVhbDoKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gTmVh
bCBMaXUgPG5lYWwubGl1QG1lZGlhdGVrLmNvbT4g5pa8IDIwMjDlubQ35pyIMjnml6Ug6YCx5LiJ
IOS4i+WNiDQ6Mjnlr6vpgZPvvJoKPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IE1lZGlhVGVr
IGJ1cyBmYWJyaWMgcHJvdmlkZXMgVHJ1c3Rab25lIHNlY3VyaXR5IHN1cHBvcnQgYW5kIGRhdGEK
PiA+ID4gPiA+ID4gPiBwcm90ZWN0aW9uIHRvIHByZXZlbnQgc2xhdmVzIGZyb20gYmVpbmcgYWNj
ZXNzZWQgYnkgdW5leHBlY3RlZAo+ID4gPiA+ID4gPiA+IG1hc3RlcnMuCj4gPiA+ID4gPiA+ID4g
VGhlIHNlY3VyaXR5IHZpb2xhdGlvbiBpcyBsb2dnZWQgYW5kIHNlbnQgdG8gdGhlIHByb2Nlc3Nv
ciBmb3IKPiA+ID4gPiA+ID4gPiBmdXJ0aGVyIGFuYWx5c2lzIG9yIGNvdW50ZXJtZWFzdXJlcy4K
PiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IEFueSBvY2N1cnJlbmNlIG9mIHNlY3VyaXR5IHZp
b2xhdGlvbiB3b3VsZCByYWlzZSBhbiBpbnRlcnJ1cHQsIGFuZAo+ID4gPiA+ID4gPiA+IGl0IHdp
bGwgYmUgaGFuZGxlZCBieSBtdGstZGV2YXBjIGRyaXZlci4gVGhlIHZpb2xhdGlvbgo+ID4gPiA+
ID4gPiA+IGluZm9ybWF0aW9uIGlzIHByaW50ZWQgaW4gb3JkZXIgdG8gZmluZCB0aGUgbXVyZGVy
ZXIuCj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBOZWFsIExpdSA8
bmVhbC5saXVAbWVkaWF0ZWsuY29tPgo+ID4gPiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4gPgo+ID4g
PiA+ID4gPiBbc25pcF0KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ID4g
Ky8qCj4gPiA+ID4gPiA+ID4gKyAqIGRldmFwY19leHRyYWN0X3Zpb19kYmcgLSBleHRyYWN0IGZ1
bGwgdmlvbGF0aW9uIGluZm9ybWF0aW9uIGFmdGVyIGRvaW5nCj4gPiA+ID4gPiA+ID4gKyAqICAg
ICAgICAgICAgICAgICAgICAgICAgICBzaGlmdCBtZWNoYW5pc20uCj4gPiA+ID4gPiA+ID4gKyAq
Lwo+ID4gPiA+ID4gPiA+ICtzdGF0aWMgdm9pZCBkZXZhcGNfZXh0cmFjdF92aW9fZGJnKHN0cnVj
dCBtdGtfZGV2YXBjX2NvbnRleHQgKmN0eCkKPiA+ID4gPiA+ID4gPiArewo+ID4gPiA+ID4gPiA+
ICsgICAgICAgY29uc3Qgc3RydWN0IG10a19kZXZhcGNfdmlvX2RiZ3MgKnZpb19kYmdzOwo+ID4g
PiA+ID4gPiA+ICsgICAgICAgc3RydWN0IG10a19kZXZhcGNfdmlvX2luZm8gKnZpb19pbmZvOwo+
ID4gPiA+ID4gPiA+ICsgICAgICAgdm9pZCBfX2lvbWVtICp2aW9fZGJnMF9yZWc7Cj4gPiA+ID4g
PiA+ID4gKyAgICAgICB2b2lkIF9faW9tZW0gKnZpb19kYmcxX3JlZzsKPiA+ID4gPiA+ID4gPiAr
ICAgICAgIHUzMiBkYmcwOwo+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiArICAgICAgIHZp
b19kYmcwX3JlZyA9IGN0eC0+ZGV2YXBjX3BkX2Jhc2UgKyBjdHgtPm9mZnNldC0+dmlvX2RiZzA7
Cj4gPiA+ID4gPiA+ID4gKyAgICAgICB2aW9fZGJnMV9yZWcgPSBjdHgtPmRldmFwY19wZF9iYXNl
ICsgY3R4LT5vZmZzZXQtPnZpb19kYmcxOwo+ID4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gPiAr
ICAgICAgIHZpb19kYmdzID0gY3R4LT52aW9fZGJnczsKPiA+ID4gPiA+ID4gPiArICAgICAgIHZp
b19pbmZvID0gY3R4LT52aW9faW5mbzsKPiA+ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+ID4gKyAg
ICAgICAvKiBTdGFydHMgdG8gZXh0cmFjdCB2aW9sYXRpb24gaW5mb3JtYXRpb24gKi8KPiA+ID4g
PiA+ID4gPiArICAgICAgIGRiZzAgPSByZWFkbCh2aW9fZGJnMF9yZWcpOwo+ID4gPiA+ID4gPiA+
ICsgICAgICAgdmlvX2luZm8tPnZpb19hZGRyID0gcmVhZGwodmlvX2RiZzFfcmVnKTsKPiA+ID4g
PiA+ID4gPiArCj4gPiA+ID4gPiA+ID4gKyAgICAgICB2aW9faW5mby0+bWFzdGVyX2lkID0gKGRi
ZzAgJiB2aW9fZGJncy0+bXN0aWQubWFzaykgPj4KPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB2aW9fZGJncy0+bXN0aWQuc3RhcnQ7Cj4gPiA+ID4gPiA+Cj4gPiA+
ID4gPiA+IFdoYXQgaXMgbWFzdGVyX2lkPyBIb3cgY291bGQgd2UgdXNlIGl0IHRvIGRlYnVnPyBG
b3IgZXhhbXBsZSwgaWYgd2UKPiA+ID4gPiA+ID4gZ2V0IGEgbWFzdGVyX2lkID0gMSwgd2hhdCBz
aG91bGQgd2UgZG8gZm9yIHRoaXM/Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gKyAgICAgICB2
aW9faW5mby0+ZG9tYWluX2lkID0gKGRiZzAgJiB2aW9fZGJncy0+ZG1uaWQubWFzaykgPj4KPiA+
ID4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2aW9fZGJncy0+ZG1uaWQu
c3RhcnQ7Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFdoYXQgaXMgZG9tYWluX2lkPyBIb3cgY291
bGQgd2UgdXNlIGl0IHRvIGRlYnVnPyBGb3IgZXhhbXBsZSwgaWYgd2UKPiA+ID4gPiA+ID4gZ2V0
IGEgZG9tYWluX2lkID0gMiwgd2hhdCBzaG91bGQgd2UgZG8gZm9yIHRoaXM/Cj4gPiA+ID4gPiA+
Cj4gPiA+ID4gPgo+ID4gPiA+ID4gbWFzdGVyX2lkIGFuZCBkb21haW5faWQgYmVsb25ncyBvdXIg
YnVzIHNpZGUtYmFuZCBzaWduYWwgaW5mby4gSXQgY2FuCj4gPiA+ID4gPiBoZWxwIHVzIHRvIGZp
bmQgdGhlIHZpb2xhdGlvbiBtYXN0ZXIuCj4gPiA+ID4KPiA+ID4gPiBEb2VzICd2aW9sYXRpb24g
bWFzdGVyJyBtZWFucyB0aGUgaGFyZHdhcmUgY291bGQgYWNjZXNzIHRoZSBwcm90ZWN0ZWQKPiA+
ID4gPiByZWdpc3Rlcj8gKGV4LiBDUFUsIEdDRSwgLi4uKSBJZiBzbywgSSB0aGluayBpdCdzIGJl
dHRlciB0byBhZGQKPiA+ID4gPiBjb21tZW50IHRvIGV4cGxhaW4gaG93IHRvIG1hcCAobWFzdGVy
X2lkLCBkb21haW5faWQpIHRvIGEgaGFyZHdhcmUKPiA+ID4gPiAobWF5YmUgdGhlIGRldmljZSBp
biBkZXZpY2UgdHJlZSkgYmVjYXVzZSBldmVyeSBib2R5IGRvZXMgbm90IGtub3cKPiA+ID4gPiB3
aGF0IHRoZSBudW1iZXIgbWVhbnMuIERvbid0IHRyeSB0byB0cmFuc2xhdGUgdGhlIG51bWJlciB0
byBhIHN0cmluZwo+ID4gPiA+IGJlY2F1c2UgdGhpcyB3b3VsZCBjb3N0IG11Y2ggdGltZSB0byBk
byB0aGlzLiBKdXN0IHByaW50IGEgbnVtYmVyIGFuZAo+ID4gPiA+IHdlIGNvdWxkIGZpbmQgb3V0
IHRoZSBtYXN0ZXIgYnkgdGhlIGNvbW1lbnQuCj4gPiA+Cj4gPiA+ICd2aW9sYXRpb24gbWFzdGVy
JyBtZWFucyB0aGUgbWFzdGVyIHdoaWNoIHZpb2xhdGVzIHRoZSBwZXJtaXNzaW9uCj4gPiA+IGNv
bnRyb2wuIEZvciBleGFtcGxlLCBpZiB3ZSBzZXQgcGVybWlzc2lvbiAnU2VjdXJlIFIvVyBvbmx5
JyBhcyBDUFUgdG8KPiA+ID4gc3BpIHJlZ2lzdGVyLiBXaGVuIHZpb2xhdGlvbiBpcyB0cmlnZ2Vy
ZWQsIGl0IG1lYW5zIENQVSBhY2Nlc3Mgc3BpCj4gPiA+IHJlZ2lzdGVyIHRocm91Z2ggbm9ybWFs
IHdvcmxkIGluc3RlYWQgb2Ygc2VjdXJlIHdvcmxkLCB3aGljaCBpcyBub3QKPiA+ID4gYWxsb3dl
ZC4KPiA+ID4KPiA+ID4gJ21hc3Rlcl9pZCcgY2Fubm90IHVzZSB0aGUgc2ltcGxlIGNvbW1lbnRz
IHRvIGRlc2NyaWJlIHdoaWNoIG1hc3RlciBpdAo+ID4gPiBpcy4gSXQgZGVwZW5kcyBvbiB2aW9s
YXRpb24gc2xhdmVzLiBGb3IgZXhhbXBsZSwgaWYgdGhlcmUgYXJlIHR3bwo+ID4gPiB2aW9sYXRp
b25zOgo+ID4gPiAxLiBDUFUgYWNjZXNzIHNwaSByZWcKPiA+ID4gMi4gQ1BVIGFjY2VzcyB0aW1l
ciByZWcKPiA+ID4gSXQgbWlnaHQgYmUgZGlmZmVyZW50ICdtYXN0ZXJfaWQnIGZvciBDUFUgb24g
dGhlc2UgdHdvIGNhc2VzLgo+ID4gPiBJIHdvdWxkIHByZWZlciB0byByZW1haW4gdGhlIGlkIG51
bWJlciBpZiB0cmFuc2xhdGUgdG8gYSBzdHJpbmcgaXMgYSBiYWQKPiA+ID4gaWRlYS4KPiA+ID4g
VGhhbmtzICEKPiA+Cj4gPiBJdCBzZWFtcyB0aGF0IG1hc3Rlcl9pZCBhbmQgZG9tYWluX2lkIGRv
ZXMgbm90IGhlbHAgZm9yIGRlYnVnLiBXaGVuIHdlCj4gPiBnZXQgbWFzdGVyX2lkID0gMSBhbmQg
ZG9tYWluX2lkID0gMiwgd2UgZG9uJ3Qga25vdyB3aGF0IGl0IG1lYW4uIEkKPiA+IHRoaW5rIHdl
IGp1c3QgbmVlZCB2aW9sYXRpb24gYWRkcmVzcyBiZWNhdXNlIHdlIGNvdWxkIGZpbmQgdGhlIGRy
aXZlcgo+ID4gdGhhdCB3cml0ZSB0aGlzIGFkZHJlc3MgYW5kIHRoZSBidWcgd291bGQgYmUgaW5z
aWRlIHRoaXMgZHJpdmVyLiBTbwo+ID4gbmVlZCBub3QgdG8gcHJvY2VzcyBtYXN0ZXJfaWQgYW5k
IGRvbWFpbl9pZC4KPiA+Cj4KPiBBY3R1YWxseSwgaXQgZG9lcyBoZWxwIHVzIGZvciBkZWJ1Zy4g
dmlvbGF0aW9uIG1hc3RlciBpcyBub3QgQ1BVIG9ubHkuCj4gSXQgbWlnaHQgYmUgYW55IG90aGVy
IG1hc3RlciBpbiBvdXIgU29DLiBTbyB0aGUgYnVnIG1pZ2h0IG5vdCBiZSBpbnNpZGUKPiB0aGUg
a2VybmVsIGRyaXZlci4KPiBJJ2xsIHByZWZlciB0byByZW1haW4gdGhpcyBpbmZvcm1hdGlvbi4K
PiBUaGFua3MgIQoKTGV0IG1haW50YWluZXIgdG8gbWFrZSBkZWNpc2lvbi4gTWF5YmUgaGUgbGlr
ZSB0byBwcmludCBtYWdpYyBudW1iZXIKYW5kIHdhaXQgZm9yIHNvbWVvbmUgdG8gaGFjayBpdC4K
Cj4KPiA+IFJlZ2FyZHMsCj4gPiBDaHVuLUt1YW5nLgo+ID4KPiA+ID4KPiA+ID4gPgo+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gPiArICAgICAgIHZpb19pbmZvLT53cml0ZSA9ICgoZGJnMCAmIHZpb19k
YmdzLT52aW9fdy5tYXNrKSA+Pgo+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICB2aW9fZGJncy0+dmlvX3cuc3RhcnQpID09IDE7Cj4gPiA+ID4gPiA+ID4gKyAgICAgICB2
aW9faW5mby0+cmVhZCA9ICgoZGJnMCAmIHZpb19kYmdzLT52aW9fci5tYXNrKSA+Pgo+ID4gPiA+
ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgdmlvX2RiZ3MtPnZpb19yLnN0YXJ0KSA9
PSAxOwo+ID4gPiA+ID4gPiA+ICsgICAgICAgdmlvX2luZm8tPnZpb19hZGRyX2hpZ2ggPSAoZGJn
MCAmIHZpb19kYmdzLT5hZGRyX2gubWFzaykgPj4KPiA+ID4gPiA+ID4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgdmlvX2RiZ3MtPmFkZHJfaC5zdGFydDsKPiA+ID4gPiA+ID4K
PiA+ID4gPiA+ID4gV2hhdCBpcyB2aW9fYWRkcl9oaWdoPyBBcyBJIGtub3cgYWxsIHJlZ2lzdGVy
IGFkZHJlc3MgYXJlIDMyIGJpdHMsIGlzCj4gPiA+ID4gPiA+IHZpb19hZGRyX2hpZ2ggdGhlIGFk
ZHJlc3MgYWJvdmUgMzIgYml0cz8KPiA+ID4gPiA+Cj4gPiA+ID4gPiBZZXMsIHlvdSBhcmUgcmln
aHQuIEluIE1UNjc3OSwgYWxsIHJlZ2lzdGVyIGJhc2UgYXJlIDMyIGJpdHMuIFdlIGNhbgo+ID4g
PiA+ID4gaWdub3JlIHRoaXMgaW5mbyBmb3IgY3VycmVudCBkcml2ZXIuIEknbGwgdXBkYXRlIG9u
IG5leHQgcGF0Y2guCj4gPiA+ID4gPiBUaGFua3MgIQo+ID4gPiA+Cj4gPiA+ID4gU3VjaCBhIHN0
cmFuZ2UgaGFyZHdhcmUsIGFsbCByZWdpc3RlciBpcyAzMiBiaXRzIGJ1dCBpdCBoYXMgYQo+ID4g
PiA+IHZpb19hZGRyX2hpZ2ggaW4gaXRzIHJlZ2lzdGVyLiBPSywganVzdCBkcm9wIHRoaXMuCj4g
PiA+ID4KPiA+ID4gPiA+Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiA+
ICsgICAgICAgZGV2YXBjX3Zpb19pbmZvX3ByaW50KGN0eCk7Cj4gPiA+ID4gPiA+ID4gK30KPiA+
ID4gPiA+ID4gPiArCj4gPiA+ID4gPiA+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRp
YXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
