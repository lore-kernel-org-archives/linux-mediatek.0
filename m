Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 543FDC433EC
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 16:32:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20BA420771
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 16:32:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wAgNJMLB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ll9vJgyb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20BA420771
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nKH+QoQ8P5jpe/74rI9O6xvRX0607VmfTQK9XKTy+6g=; b=wAgNJMLBaxULbHM6XINdCslsg
	/Xr+6Zm4MAVBQKGz2stFZxM73lu3SyLD/EqDbbSlMMlbaWuYcRxqx1QOK4rSDA5FIvtM82n/3zpdu
	35jIw/lFp4LmzKVATTbrqZIWypjnA7aVZJiLchSOV+l/S/DirGTzg4d4ar/DU4nsakklxk6TZiScc
	EDerSKsIxt+O5CUIteuIC740+t0zqrXjBY9+tIZxdaFxlumszkjYIArotHe+bDqykHCajcrAPpjbM
	SkS8/y4ujxdiIfRMpIRZq+E9h73yYXooV7T4k8DN+PkpWgYn0bQ/4qSYfiiisAhf7Iqa9qarqAEGb
	kkQpkjZUQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jye8p-0005Cl-5E; Thu, 23 Jul 2020 16:32:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jye8m-0005Bm-0c; Thu, 23 Jul 2020 16:32:16 +0000
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A821020792;
 Thu, 23 Jul 2020 16:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595521935;
 bh=UsE0AfyyH9ASPhZTnv7rHkKV2A1QkqMr7Pj3l5isRpU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ll9vJgybdQWVnp62gg5r7LQzMnJAxBOt6LuJ/suS3kDsSMsGENcyAiyhdP8j0p5up
 01UrD+vevM8ahtii4UyYDHdlK3afSnIi4yMptohc9AE8aXFZweEa47k9MwcRrcbuKo
 QstIhlqLUhjsoAu6NQSpCBOrXN/9b1k4gTp5polw=
Received: by mail-ed1-f47.google.com with SMTP id b13so2592034edz.7;
 Thu, 23 Jul 2020 09:32:14 -0700 (PDT)
X-Gm-Message-State: AOAM5312xNJcjX8GdzGsaikMOi5Qi8m7Cr6M/F4mtuuGs6ufqovVgFrq
 /opm30qSEj3gDgWN6oZ/q9uVGAAUdBry4T7JYA==
X-Google-Smtp-Source: ABdhPJyRm/l9dPj0W+dfDKiakdRmDJRlB3h26Hb6zg+r04P5orwxjTD/vSWsiavEJACFhMP/gwvhQEf/i1OLYSZOpWs=
X-Received: by 2002:a50:e617:: with SMTP id y23mr4915055edm.47.1595521933191; 
 Thu, 23 Jul 2020 09:32:13 -0700 (PDT)
MIME-Version: 1.0
References: <1595303971-8793-1-git-send-email-neal.liu@mediatek.com>
 <1595303971-8793-3-git-send-email-neal.liu@mediatek.com>
 <CAAOTY_8T=DCntU8x5YEo+Pcs2J0Y4YvDaHUBdGiqEFRxghOd_Q@mail.gmail.com>
 <1595389756.20193.12.camel@mtkswgap22>
 <CAAOTY_9k7rM=Pf43DwJR_bkQvxVtpWYTjVoNSZLVE2N0Y_DBmA@mail.gmail.com>
 <1595484707.26237.12.camel@mtkswgap22>
In-Reply-To: <1595484707.26237.12.camel@mtkswgap22>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 24 Jul 2020 00:32:02 +0800
X-Gmail-Original-Message-ID: <CAAOTY__V3zwux7UP7p4SUbreGrPBbwRqi=E1WVsA58tYNmri1A@mail.gmail.com>
Message-ID: <CAAOTY__V3zwux7UP7p4SUbreGrPBbwRqi=E1WVsA58tYNmri1A@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] soc: mediatek: add mtk-devapc driver
To: Neal Liu <neal.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_123216_196244_077899BC 
X-CRM114-Status: GOOD (  28.50  )
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
 wsd_upstream <wsd_upstream@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIE5lYWw6CgpOZWFsIExpdSA8bmVhbC5saXVAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMOW5tDfm
nIgyM+aXpSDpgLHlm5sg5LiL5Y2IMjoxMeWvq+mBk++8mgo+Cj4gSGkgQ2h1bi1LdWFuZywKPgo+
IE9uIFdlZCwgMjAyMC0wNy0yMiBhdCAyMjoyNSArMDgwMCwgQ2h1bi1LdWFuZyBIdSB3cm90ZToK
PiA+IEhpLCBOZWFsOgo+ID4KPiA+IE5lYWwgTGl1IDxuZWFsLmxpdUBtZWRpYXRlay5jb20+IOaW
vCAyMDIw5bm0N+aciDIy5pelIOmAseS4iSDkuIrljYgxMTo0OeWvq+mBk++8mgo+ID4gPgo+ID4g
PiBIaSBDaHVuLUt1YW5nLAo+ID4gPgo+ID4gPiBPbiBXZWQsIDIwMjAtMDctMjIgYXQgMDc6MjEg
KzA4MDAsIENodW4tS3VhbmcgSHUgd3JvdGU6Cj4gPiA+ID4gSGksIE5lYWw6Cj4gPiA+ID4KPiA+
ID4gPiBOZWFsIExpdSA8bmVhbC5saXVAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMOW5tDfmnIgyMeaX
pSDpgLHkuowg5LiL5Y2IMTI6MDDlr6vpgZPvvJoKPiA+ID4gPiA+Cj4gPiA+ID4KPiA+ID4gPiA+
ICsKPiA+ID4gPiA+ICsvKgo+ID4gPiA+ID4gKyAqIG10a19kZXZhcGNfZHVtcF92aW9fZGJnIC0g
Z2V0IHRoZSB2aW9sYXRpb24gaW5kZXggYW5kIGR1bXAgdGhlIGZ1bGwgdmlvbGF0aW9uCj4gPiA+
ID4gPiArICogICAgICAgICAgICAgICAgICAgICAgICAgICBkZWJ1ZyBpbmZvcm1hdGlvbi4KPiA+
ID4gPiA+ICsgKi8KPiA+ID4gPiA+ICtzdGF0aWMgYm9vbCBtdGtfZGV2YXBjX2R1bXBfdmlvX2Ri
ZyhzdHJ1Y3QgbXRrX2RldmFwY19jb250ZXh0ICpjdHgsIHUzMiB2aW9faWR4KQo+ID4gPiA+ID4g
K3sKPiA+ID4gPiA+ICsgICAgICAgdTMyIHNoaWZ0X2JpdDsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+
ICsgICAgICAgaWYgKGNoZWNrX3Zpb19tYXNrKGN0eCwgdmlvX2lkeCkpCj4gPiA+ID4gPiArICAg
ICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKyAgICAgICBp
ZiAoIWNoZWNrX3Zpb19zdGF0dXMoY3R4LCB2aW9faWR4KSkKPiA+ID4gPiA+ICsgICAgICAgICAg
ICAgICByZXR1cm4gZmFsc2U7Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArICAgICAgIHNoaWZ0X2Jp
dCA9IGdldF9zaGlmdF9ncm91cChjdHgsIHZpb19pZHgpOwo+ID4gPiA+ID4gKwo+ID4gPiA+ID4g
KyAgICAgICBpZiAoc3luY192aW9fZGJnKGN0eCwgc2hpZnRfYml0KSkKPiA+ID4gPiA+ICsgICAg
ICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArICAgICAgIGRl
dmFwY19leHRyYWN0X3Zpb19kYmcoY3R4KTsKPiA+ID4gPgo+ID4gPiA+IEkgdGhpbmsgZ2V0X3No
aWZ0X2dyb3VwKCksIHN5bmNfdmlvX2RiZygpLCBhbmQKPiA+ID4gPiBkZXZhcGNfZXh0cmFjdF92
aW9fZGJnKCkgc2hvdWxkIGJlIG1vdmVkIG91dCBvZiB2aW9faWR4IGZvci1sb29wICh0aGUKPiA+
ID4gPiBsb29wIGluIGRldmFwY192aW9sYXRpb25faXJxKCkpIGJlY2F1c2UgdGhlc2UgdGhyZWUg
ZnVuY3Rpb24gaXMgbm90Cj4gPiA+ID4gcmVsYXRlZCB0byB2aW9faWR4Lgo+ID4gPiA+IEFub3Ro
ZXIgcXVlc3Rpb246IHdoZW4gbXVsdGlwbGUgdmlvX2lkeCB2aW9sYXRpb24gb2NjdXIsIHZpb19h
ZGRyIGlzCj4gPiA+ID4gcmVsYXRlZCB0byB3aGljaCBvbmUgdmlvX2lkeD8gVGhlIGxhdGVzdCBo
YXBwZW5lZCBvbmU/Cj4gPiA+ID4KPiA+ID4KPiA+ID4gQWN0dWFsbHksIGl0J3MgcmVsYXRlZCB0
byB2aW9faWR4LiBCdXQgd2UgZG9uJ3QgdXNlIGl0IGRpcmVjdGx5IG9uIHRoZXNlCj4gPiA+IGZ1
bmN0aW9uLiBJIHRoaW5rIGJlbG93IHNuaXAgY29kZSBtaWdodCBiZSBiZXR0ZXIgd2F5IHRvIHVu
ZGVyc3RhbmQgaXQuCj4gPiA+Cj4gPiA+IGZvciAoLi4uKQo+ID4gPiB7Cj4gPiA+ICAgICAgICAg
Y2hlY2tfdmlvX21hc2soKQo+ID4gPiAgICAgICAgIGNoZWNrX3Zpb19zdGF0dXMoKQo+ID4gPgo+
ID4gPiAgICAgICAgIC8vIGlmIGdldCB2aW9faWR4LCBtYXNrIGl0IHRlbXBvcmFyaWx5Cj4gPiA+
ICAgICAgICAgbWFza19tb2R1bGVfaXJxKHRydWUpCj4gPiA+ICAgICAgICAgY2xlYXJfdmlvX3N0
YXR1cygpCj4gPiA+Cj4gPiA+ICAgICAgICAgLy8gZHVtcCB2aW9sYXRpb24gaW5mbwo+ID4gPiAg
ICAgICAgIGdldF9zaGlmdF9ncm91cCgpCj4gPiA+ICAgICAgICAgc3luY192aW9fZGJnKCkKPiA+
ID4gICAgICAgICBkZXZhcGNfZXh0cmFjdF92aW9fZGJnKCkKPiA+ID4KPiA+ID4gICAgICAgICAv
LyB1bm1hc2sKPiA+ID4gICAgICAgICBtYXNrX21vZHVsZV9pcnEoZmFsc2UpCj4gPiA+IH0KPiA+
Cj4gPiBUaGlzIHNuaXAgY29kZSBkb2VzIG5vdCBleHBsYWluIGFueSB0aGluZy4gSSBjb3VsZCBy
ZXdyaXRlIHRoaXMgY29kZSBhczoKPiA+Cj4gPiBmb3IgKC4uLikKPiA+IHsKPiA+ICAgICBjaGVj
a192aW9fbWFzaygpCj4gPiAgICAgY2hlY2tfdmlvX3N0YXR1cygpCj4gPgo+ID4gICAgIC8vIGlm
IGdldCB2aW9faWR4LCBtYXNrIGl0IHRlbXBvcmFyaWx5Cj4gPiAgICAgbWFza19tb2R1bGVfaXJx
KHRydWUpCj4gPiAgICAgY2xlYXJfdmlvX3N0YXR1cygpCj4gPiAgICAgLy8gdW5tYXNrCj4gPiAg
ICAgbWFza19tb2R1bGVfaXJxKGZhbHNlKQo+ID4gfQo+ID4KPiA+IC8vIGR1bXAgdmlvbGF0aW9u
IGluZm8KPiA+IGdldF9zaGlmdF9ncm91cCgpCj4gPiBzeW5jX3Zpb19kYmcoKQo+ID4gZGV2YXBj
X2V4dHJhY3RfdmlvX2RiZygpCj4gPgo+ID4gQW5kIG15IHZlcnNpb24gaXMgaWRlbnRpY2FsIHdp
dGggeW91ciB2ZXJzaW9uLCBpc24ndCBpdD8KPgo+IFNvcnJ5LCBJIGRpZCBub3QgZXhwbGFpbiBp
dCBjbGVhcmx5LiBMZXQncyBtZSB0cnkgYWdhaW4uCj4gVGhlIHJlYXNvbiB3aHkgSSBwdXQgImR1
bXAgdmlvbGF0aW9uIGluZm8iIGJldHdlZW4gbWFzayAmIHVubWFzayBjb250ZXh0Cj4gaXMgYmVj
YXVzZSBpdCBoYXMgdG8gc3RvcCBpbnRlcnJ1cHQgZmlyc3QgYmVmb3JlIGR1bXAgdmlvbGF0aW9u
IGluZm8sCj4gYW5kIHRoZW4gdW5tYXNrIGl0IHRvIHByZXBhcmUgbmV4dCB2aW9sYXRpb24uCj4g
VGhlc2Ugc2VxdWVuY2UgZ3VhcmFudGVlIHRoYXQgaWYgbXVsdGlwbGUgdmlvbGF0aW9uIGlzIHRy
aWdnZXJlZCwgd2UKPiBzdGlsbCBoYXZlIGluZm9ybWF0aW9uIHRvIGRlYnVnLgo+IElmIHRoZSBj
b2RlIHNlcXVlbmNlIGluIHlvdXIgdmVyc2lvbiBhbmQgbXVsdGlwbGUgdmlvbGF0aW9uIGlzCj4g
dHJpZ2dlcmVkLCB0aGVyZSBtaWdodCBiZSBubyBhbnkgaW5mb3JtYXRpb24gYnV0IGtlZXBzIGVu
dGVyaW5nIElTUi4KPiBGaW5hbGx5LCBzeXN0ZW0gbWlnaHQgYmUgYWJub3JtYWwgYW5kIHdhdGNo
ZG9nIHRpbWVvdXQuCj4gSW4gdGhpcyBjYXNlLCB3ZSBzdGlsbCBkb24ndCBoYXZlIGFueSBpbmZv
cm1hdGlvbiB0byBkZWJ1Zy4KCkkgc3RpbGwgZG9uJ3QgdW5kZXJzdGFuZCB3aHkgbm8gaW5mb3Jt
YXRpb24gdG8gZGVidWcuIEZvciBleGFtcGxlIHdoZW4KdmlvX2lkeCA1LCAxMCwgMTUgaGFzIHZp
b2xhdGlvbiwKWW91IHdvdWxkIG1hc2sgdmlvX2lkeCA1IHRvIGdldCBpbmZvcm1hdGlvbiwgYnV0
IHZpb19pZHggMTAsIDE1IGRvZXMKbm90IG1hc2sgeWV0LgpJbiB5b3VyIHdvcmRzLCB3aGVuIHZp
b19pZHggMTAsIDE1IG5vdCBtYXNrLCB5b3Ugd291bGQgbm90IGdldCBhbnkKZGVidWcgaW5mb3Jt
YXRpb24gd2hlbiB5b3UgcHJvY2VzcyB2aW9faWR4IDUuCgpJbiBteSB2ZXJzaW9uLCBJIHdvdWxk
IGNsZWFyIGFsbCBzdGF0dXMsIHdoeSBrZWVwcyBlbnRlcmluZyBJU1I/Cgo+Cj4gPgo+ID4gPgo+
ID4gPiBBYm91dCB5b3VyIHF1ZXN0aW9uLCB2aW9fYWRkciB3b3VsZCBiZSB0aGUgZmlyc3Qgb25l
Lgo+ID4KPiA+IFNvIG90aGVyIHZpb19hZGRyIHdvdWxkIGJlIGRyb3BwZWQ/IE9yIGhhcmR3YXJl
IHdvdWxkIGtlZXAgYWxsCj4gPiB2aW9fYWRkciBhbmQgeW91IGhhdmUgc29tZSB3YXkgdG8gZ2V0
IGFsbCB2aW9fYWRkcj8KPiA+Cj4KPiBJbiB0aGlzIGNhc2UsIGhhcmR3YXJlIHdpbGwgZHJvcCBv
dGhlciB2aW9sYXRpb24gaW5mbyBhbmQga2VlcCB0aGUgZmlyc3QKPiBvbmUgdW50aWwgaXQgYmVl
biBoYW5kbGVkLgoKRG9lcyAnaGFuZGxlZCcgbWVhbiBzdGF0dXMgaXMgY2xlYXJlZD8KClJlZ2Fy
ZHMsCkNodW4tS3VhbmcuCgo+Cj4gPiA+Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArICAgICAgIHJl
dHVybiB0cnVlOwo+ID4gPiA+ID4gK30KPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsvKgo+ID4gPiA+
ID4gKyAqIGRldmFwY192aW9sYXRpb25faXJxIC0gdGhlIGRldmFwYyBJbnRlcnJ1cHQgU2Vydmlj
ZSBSb3V0aW5lIChJU1IpIHdpbGwgZHVtcAo+ID4gPiA+ID4gKyAqICAgICAgICAgICAgICAgICAg
ICAgICAgdmlvbGF0aW9uIGluZm9ybWF0aW9uIGluY2x1ZGluZyB3aGljaCBtYXN0ZXIgdmlvbGF0
ZXMKPiA+ID4gPiA+ICsgKiAgICAgICAgICAgICAgICAgICAgICAgIGFjY2VzcyBzbGF2ZS4KPiA+
ID4gPiA+ICsgKi8KPiA+ID4gPiA+ICtzdGF0aWMgaXJxcmV0dXJuX3QgZGV2YXBjX3Zpb2xhdGlv
bl9pcnEoaW50IGlycV9udW1iZXIsCj4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgc3RydWN0IG10a19kZXZhcGNfY29udGV4dCAqY3R4KQo+ID4gPiA+ID4g
K3sKPiA+ID4gPiA+ICsgICAgICAgdTMyIHZpb19pZHg7Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiAr
ICAgICAgIGZvciAodmlvX2lkeCA9IDA7IHZpb19pZHggPCBjdHgtPnZpb19pZHhfbnVtOyB2aW9f
aWR4KyspIHsKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBpZiAoIW10a19kZXZhcGNfZHVtcF92
aW9fZGJnKGN0eCwgdmlvX2lkeCkpCj4gPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBj
b250aW51ZTsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAvKiBFbnN1cmUg
dGhhdCB2aW9sYXRpb24gaW5mbyBhcmUgd3JpdHRlbiBiZWZvcmUKPiA+ID4gPiA+ICsgICAgICAg
ICAgICAgICAgKiBmdXJ0aGVyIG9wZXJhdGlvbnMKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAg
Ki8KPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBzbXBfbWIoKTsKPiA+ID4gPiA+ICsKPiA+ID4g
PiA+ICsgICAgICAgICAgICAgICAvKgo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAqIE1hc2sg
c2xhdmUncyBpcnEgYmVmb3JlIGNsZWFyaW5nIHZpbyBzdGF0dXMuCj4gPiA+ID4gPiArICAgICAg
ICAgICAgICAgICogTXVzdCBkbyBpdCB0byBhdm9pZCBuZXN0ZWQgaW50ZXJydXB0IGFuZCBwcmV2
ZW50Cj4gPiA+ID4gPiArICAgICAgICAgICAgICAgICogdW5leHBlY3RlZCBiZWhhdmlvci4KPiA+
ID4gPiA+ICsgICAgICAgICAgICAgICAgKi8KPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBtYXNr
X21vZHVsZV9pcnEoY3R4LCB2aW9faWR4LCB0cnVlKTsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsg
ICAgICAgICAgICAgICBjbGVhcl92aW9fc3RhdHVzKGN0eCwgdmlvX2lkeCk7Cj4gPiA+ID4gPiAr
Cj4gPiA+ID4gPiArICAgICAgICAgICAgICAgbWFza19tb2R1bGVfaXJxKGN0eCwgdmlvX2lkeCwg
ZmFsc2UpOwo+ID4gPiA+ID4gKyAgICAgICB9Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArICAgICAg
IHJldHVybiBJUlFfSEFORExFRDsKPiA+ID4gPiA+ICt9Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiAr
LyoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0
ZWsK
