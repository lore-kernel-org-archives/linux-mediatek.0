Return-Path: <SRS0=UCxl=BK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C5B2C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 15:55:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBC2621744
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 15:55:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Sut8cPMU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="dGIUQu1j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBC2621744
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dRw486VIRqcrCtNetzk1jdtG/fablsqHbj3MxuF1030=; b=Sut8cPMUdZUcRRJsL14QBHZ39
	9SFS8sgP6TbAig7PCFXjVpW68fIbonvL2OHxNmpVvhy/C4fD3CosB2/Ix9aG8wzSc7kRocUUt5CkH
	PPATdvbdW21VjyYCHa6r//8LXtv/9YZiG/65Ri5Cvyq6/aTFi7Ms0oSSUKFgkhPsdvNGq1DvMAJhG
	S+9C3lGaQKR1GxZrhDhz+HgIZVXnnkbHgGkk3qLtGIy6WaJUhoY4TBIj2GqggKzL0sLiO5i5fhuqN
	5KlSOJ8ybiHKlvUKbHo4dzEqqyrYop9Qv8ey4PxJSArGgMjgywoR+2vm06NXzF/ot4i/vXDhp2JMM
	Mi+wNKuDQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1XNl-0006O9-Vu; Fri, 31 Jul 2020 15:55:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1XNh-0006NK-TW; Fri, 31 Jul 2020 15:55:38 +0000
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6959F21744;
 Fri, 31 Jul 2020 15:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596210936;
 bh=J9+siusKNMgqbpz/tIFkjD2Z8De5SqX8GkR1C4h8230=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=dGIUQu1jbUUxwH5rNXVUSew0VW7xzb9z6seOM7jOMSR8GUvwf7QuYFyTKi8qefnzh
 dcfB3/3KbfK0b4Y0V+NZDUf6Kvcrin+hg9mdRhQ/vYzVpaAp3uw0Ww0nO+KcUMKbBo
 TNm9aew2dfnUY0dckAe9MYp/u3on5mWvf7WNbII8=
Received: by mail-ed1-f54.google.com with SMTP id di22so15509995edb.12;
 Fri, 31 Jul 2020 08:55:36 -0700 (PDT)
X-Gm-Message-State: AOAM532xkOwGH4kGHixUQT4Dj7TDyFaqYm9X6YTM9p3pt0JqSFsAKqQh
 Erouw25Swvnkk5sBuC8qRc3yjpriisizKW7ROA==
X-Google-Smtp-Source: ABdhPJyvCgp3yv2IchWxBuw3fUcmJODItQC77/XdI2+/aZn3y49etTW8MtFbnkKPj7yQQ025yPQkWTWNgUEveNWJWTw=
X-Received: by 2002:a50:9e6f:: with SMTP id z102mr4608208ede.300.1596210935010; 
 Fri, 31 Jul 2020 08:55:35 -0700 (PDT)
MIME-Version: 1.0
References: <1596010690-13178-1-git-send-email-neal.liu@mediatek.com>
 <1596010690-13178-3-git-send-email-neal.liu@mediatek.com>
 <CAAOTY_9HXv+OsSRF7P9=cRy9AYZ0vwffgo3Kc8V=qQ6ce90uJw@mail.gmail.com>
 <1596163970.3932.24.camel@mtkswgap22>
In-Reply-To: <1596163970.3932.24.camel@mtkswgap22>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 31 Jul 2020 23:55:23 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-3vs9VdAs3RHc_-MQJ7HbmqXKgULC_H0grr3q7oNDxMQ@mail.gmail.com>
Message-ID: <CAAOTY_-3vs9VdAs3RHc_-MQJ7HbmqXKgULC_H0grr3q7oNDxMQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] soc: mediatek: add mtk-devapc driver
To: Neal Liu <neal.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200731_115538_197490_9AE612B9 
X-CRM114-Status: GOOD (  28.96  )
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

SGksIE5lYWw6CgpOZWFsIExpdSA8bmVhbC5saXVAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMOW5tDfm
nIgzMeaXpSDpgLHkupQg5LiK5Y2IMTA6NTLlr6vpgZPvvJoKPgo+IEhpIENodW4tS3VhbmcsCj4K
PiBPbiBGcmksIDIwMjAtMDctMzEgYXQgMDA6MTQgKzA4MDAsIENodW4tS3VhbmcgSHUgd3JvdGU6
Cj4gPiBIaSwgTmVhbDoKPiA+Cj4gPiBOZWFsIExpdSA8bmVhbC5saXVAbWVkaWF0ZWsuY29tPiDm
lrwgMjAyMOW5tDfmnIgyOeaXpSDpgLHkuIkg5LiL5Y2INDoyOeWvq+mBk++8mgo+ID4gPgo+ID4g
PiBNZWRpYVRlayBidXMgZmFicmljIHByb3ZpZGVzIFRydXN0Wm9uZSBzZWN1cml0eSBzdXBwb3J0
IGFuZCBkYXRhCj4gPiA+IHByb3RlY3Rpb24gdG8gcHJldmVudCBzbGF2ZXMgZnJvbSBiZWluZyBh
Y2Nlc3NlZCBieSB1bmV4cGVjdGVkCj4gPiA+IG1hc3RlcnMuCj4gPiA+IFRoZSBzZWN1cml0eSB2
aW9sYXRpb24gaXMgbG9nZ2VkIGFuZCBzZW50IHRvIHRoZSBwcm9jZXNzb3IgZm9yCj4gPiA+IGZ1
cnRoZXIgYW5hbHlzaXMgb3IgY291bnRlcm1lYXN1cmVzLgo+ID4gPgo+ID4gPiBBbnkgb2NjdXJy
ZW5jZSBvZiBzZWN1cml0eSB2aW9sYXRpb24gd291bGQgcmFpc2UgYW4gaW50ZXJydXB0LCBhbmQK
PiA+ID4gaXQgd2lsbCBiZSBoYW5kbGVkIGJ5IG10ay1kZXZhcGMgZHJpdmVyLiBUaGUgdmlvbGF0
aW9uCj4gPiA+IGluZm9ybWF0aW9uIGlzIHByaW50ZWQgaW4gb3JkZXIgdG8gZmluZCB0aGUgbXVy
ZGVyZXIuCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IE5lYWwgTGl1IDxuZWFsLmxpdUBtZWRp
YXRlay5jb20+Cj4gPiA+IC0tLQo+ID4KPiA+IFtzbmlwXQo+ID4KPiA+ID4gKwo+ID4gPiArLyoK
PiA+ID4gKyAqIGRldmFwY19leHRyYWN0X3Zpb19kYmcgLSBleHRyYWN0IGZ1bGwgdmlvbGF0aW9u
IGluZm9ybWF0aW9uIGFmdGVyIGRvaW5nCj4gPiA+ICsgKiAgICAgICAgICAgICAgICAgICAgICAg
ICAgc2hpZnQgbWVjaGFuaXNtLgo+ID4gPiArICovCj4gPiA+ICtzdGF0aWMgdm9pZCBkZXZhcGNf
ZXh0cmFjdF92aW9fZGJnKHN0cnVjdCBtdGtfZGV2YXBjX2NvbnRleHQgKmN0eCkKPiA+ID4gK3sK
PiA+ID4gKyAgICAgICBjb25zdCBzdHJ1Y3QgbXRrX2RldmFwY192aW9fZGJncyAqdmlvX2RiZ3M7
Cj4gPiA+ICsgICAgICAgc3RydWN0IG10a19kZXZhcGNfdmlvX2luZm8gKnZpb19pbmZvOwo+ID4g
PiArICAgICAgIHZvaWQgX19pb21lbSAqdmlvX2RiZzBfcmVnOwo+ID4gPiArICAgICAgIHZvaWQg
X19pb21lbSAqdmlvX2RiZzFfcmVnOwo+ID4gPiArICAgICAgIHUzMiBkYmcwOwo+ID4gPiArCj4g
PiA+ICsgICAgICAgdmlvX2RiZzBfcmVnID0gY3R4LT5kZXZhcGNfcGRfYmFzZSArIGN0eC0+b2Zm
c2V0LT52aW9fZGJnMDsKPiA+ID4gKyAgICAgICB2aW9fZGJnMV9yZWcgPSBjdHgtPmRldmFwY19w
ZF9iYXNlICsgY3R4LT5vZmZzZXQtPnZpb19kYmcxOwo+ID4gPiArCj4gPiA+ICsgICAgICAgdmlv
X2RiZ3MgPSBjdHgtPnZpb19kYmdzOwo+ID4gPiArICAgICAgIHZpb19pbmZvID0gY3R4LT52aW9f
aW5mbzsKPiA+ID4gKwo+ID4gPiArICAgICAgIC8qIFN0YXJ0cyB0byBleHRyYWN0IHZpb2xhdGlv
biBpbmZvcm1hdGlvbiAqLwo+ID4gPiArICAgICAgIGRiZzAgPSByZWFkbCh2aW9fZGJnMF9yZWcp
Owo+ID4gPiArICAgICAgIHZpb19pbmZvLT52aW9fYWRkciA9IHJlYWRsKHZpb19kYmcxX3JlZyk7
Cj4gPiA+ICsKPiA+ID4gKyAgICAgICB2aW9faW5mby0+bWFzdGVyX2lkID0gKGRiZzAgJiB2aW9f
ZGJncy0+bXN0aWQubWFzaykgPj4KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dmlvX2RiZ3MtPm1zdGlkLnN0YXJ0Owo+ID4gPiArICAgICAgIHZpb19pbmZvLT5kb21haW5faWQg
PSAoZGJnMCAmIHZpb19kYmdzLT5kbW5pZC5tYXNrKSA+Pgo+ID4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB2aW9fZGJncy0+ZG1uaWQuc3RhcnQ7Cj4gPiA+ICsgICAgICAgdmlvX2lu
Zm8tPndyaXRlID0gKChkYmcwICYgdmlvX2RiZ3MtPnZpb193Lm1hc2spID4+Cj4gPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICB2aW9fZGJncy0+dmlvX3cuc3RhcnQpID09IDE7Cj4gPiA+
ICsgICAgICAgdmlvX2luZm8tPnJlYWQgPSAoKGRiZzAgJiB2aW9fZGJncy0+dmlvX3IubWFzaykg
Pj4KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICB2aW9fZGJncy0+dmlvX3Iuc3RhcnQp
ID09IDE7Cj4gPiA+ICsgICAgICAgdmlvX2luZm8tPnZpb19hZGRyX2hpZ2ggPSAoZGJnMCAmIHZp
b19kYmdzLT5hZGRyX2gubWFzaykgPj4KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHZpb19kYmdzLT5hZGRyX2guc3RhcnQ7Cj4gPgo+ID4KPiA+IEkgd291bGQgbGlrZSB0
byBkZWZpbmUgdGhlIHR5cGUgb2YgY3R4LT52aW9faW5mbyB0byBiZQo+ID4KPiA+IHN0cnVjdCBt
dGtfZGV2YXBjX3Zpb19kYmdzIHsKPiA+ICAgICB1MzIgbXN0aWQ6MTY7Cj4gPiAgICAgdTMyIGRt
bmlkOjY7Cj4gPiAgICAgdTMyIHZpb193OjE7Cj4gPiAgICAgdTMyIHZpb19yOjE7Cj4gPiAgICAg
dTMyIGFkZHJfaDo0Owo+ID4gICAgIHUzMiByZXN2OjQ7Cj4gPiB9Owo+ID4KPiA+IHNvIHRoZSBj
b2RlIHdvdWxkIGxpa2UgdGhlIHNpbXBsZSB3YXkKPiA+Cj4gPiBjdHgtPnZpb19pbmZvID0gKHN0
cnVjdCBtdGtfZGV2YXBjX3Zpb19kYmdzKXJlYWRsKHZpb19kYmcxX3JlZyk7Cj4gPgo+Cj4gVGhp
cyBpZGVhIGxvb2tzIGdyZWF0ISBJcyB0aGVyZSBhbnkgcG9zc2libGUgdG8gcGFzcyB0aGUgYml0
IGxheW91dCBieQo+IERUIGRhdGEsIGFuZCBzdGlsbCBtYWtlIHRoaXMgb3BlcmF0aW9uIHNpbXBs
ZT8KPiBXaHkgYW0gSSBhc2tpbmcgdGhpcyBxdWVzdGlvbiBpcyBiZWNhdXNlIHRoaXMgYml0IGxh
eW91dCBpcyBwbGF0Zm9ybQo+IGRlcGVuZGVudC4KCkkgZG91YnQgdGhlc2UgaW5mbyB3b3VsZCBi
ZSBpbiBhIHNpbmdsZSAzMi1iaXRzIHJlZ2lzdGVyIGZvciBhbGwKZnV0dXJlIFNvQy4gSWYgdGhl
eSBhcmUgbm90IGluIHNpbmdsZSAzMi1iaXRzIHJlZ2lzdGVyLCB5b3UgbWF5IGNyZWF0ZQphIHZp
b19kYmdzX3R5cGUgaW4gRFQgZGF0YSwgYW5kIHRoZSBjb2RlIG1heSBiZQoKaWYgKGN0eC0+dmlv
X2RiZ3NfdHlwZSA9PSBWSU9fREJHU19UWVBFX01UeHh4eCkgewogICAgY3R4LT52aW9faW5mbyA9
IChzdHJ1Y3QgbXRrX2RldmFwY192aW9fZGJncylyZWFkbCh2aW9fZGJnMV9yZWcpOwp9IGVsc2Ug
aWYgKGN0eC0+dmlvX2RiZ3NfdHlwZSA9PSBWSU9fREJHU19UWVBFX01UeXl5eSkgewogICAgY3R4
LT52aW9faW5mby0+bXN0aWQgPSByZWFkbCh2aW9fbXN0aWRfcmVnKTsKICAgIGN0eC0+dmlvX2lu
Zm8tPmRtbmlkID0gcmVhZGwodmlvX2RtbmlkX3JlZyk7CiAgICBjdHgtPnZpb19pbmZvLT52aW9f
dyA9IHJlYWRsKHZpb192aW9fd19yZWcpOwogICAgY3R4LT52aW9faW5mby0+dmlvX3IgPSByZWFk
bCh2aW9fdmlvX3JfcmVnKTsKfQoKSSB0aGluayB3ZSBuZWVkIG5vdCB0byBjb25zaWRlciBob3cg
dGhlIGZ1dHVyZSB3b3VsZCBiZS4gT25jZSB0aGUKc2Vjb25kIFNvQyBkcml2ZXIgaXMgdXBzdHJl
YW1pbmcsIHdlIGNvdWxkIGZpbmQgb3V0IHRoZSBiZXN0IHNvbHV0aW9uCmZvciBpdC4KClJlZ2Fy
ZHMsCkNodW4tS3VhbmcuCgo+Cj4gPiBSZWdhcmRzLAo+ID4gQ2h1bi1LdWFuZy4KPiA+Cj4gPiA+
ICsKPiA+ID4gKyAgICAgICBkZXZhcGNfdmlvX2luZm9fcHJpbnQoY3R4KTsKPiA+ID4gK30KPiA+
ID4gKwo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1l
ZGlhdGVrCg==
