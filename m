Return-Path: <SRS0=M7U7=AV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89777C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 14:21:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53B4A207D0
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 14:21:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aguyhpef";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="UL1+SyxR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53B4A207D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rZ66UqaYFQEQqFJ4HVXvEYkm0OBemerdKgQO+FQCPSQ=; b=aguyhpefzBcNnUbTCoEaE9kg+
	Xk/PuuI5vMYZBe6tbQ1PDg0qqYtB5n/Ojo/JnE4NSIT2HFXk9lbvbzKNMHcsgVmVJUqIcysCHxxUS
	LnTECHciSbAsri3fajZ1SZp0i/5ODkS/8c6hmiqlxGzVxE+A4yFQ7w9BokJA2L1niRQJxkisYDycU
	CweVUXcOqti2prfAZZIAxKgDQvS91IG7QV/2gBvX4Fi0HtVaAoJblzgaGB0b5oOr16TZQ9ZM01LC4
	/0x30JrLGAEz9Y/J9bEqotPgDUugFdWUJIP97QEDs88TeUiNmx5EGtnESqmsgL3DzYKjujz6s/+nw
	b2jtxGKfQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jttu3-0001NV-Uj; Fri, 10 Jul 2020 14:21:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jttty-0001M9-T4; Fri, 10 Jul 2020 14:21:23 +0000
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4FC84207D0;
 Fri, 10 Jul 2020 14:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594390881;
 bh=vnGCAMdU16YbGd612Tww4xROob47vhq+nuKzE0R1u7U=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=UL1+SyxRjmBzD1Du9SkUt3YtH0lBuwH0PEX9ZDvSM5OoR0zGw89VSy2bQLYGbBR1X
 wJP1GkU/519jLzUmsp2y99R4E9uTbM9dtnaXzLFM8zTj23nE8ggopTyyqtbeEgtOpb
 KbvFWnAXw9gyJvVfGu2kM6CwFpPdGvNdjAh3eTp4=
Received: by mail-ej1-f44.google.com with SMTP id l12so6232985ejn.10;
 Fri, 10 Jul 2020 07:21:21 -0700 (PDT)
X-Gm-Message-State: AOAM532nsoQ341qTi/HFYmX/C2Jze3RSZETA6RJeJCgjqDoOtKVNUuhb
 RjrNaRUrhdGetJXT065yihr7G34IUYUcM79FTg==
X-Google-Smtp-Source: ABdhPJyaOgx0v3QQp9UUwrSQOCQPxGwcRXu/+A6Vt4C8xtVhE2RGpU6+mdFimeAQ0LhXaQwMIK3DZflaHHnDmySR8Gs=
X-Received: by 2002:a17:906:9354:: with SMTP id
 p20mr13236833ejw.187.1594390879813; 
 Fri, 10 Jul 2020 07:21:19 -0700 (PDT)
MIME-Version: 1.0
References: <1594285927-1840-1-git-send-email-neal.liu@mediatek.com>
 <1594285927-1840-3-git-send-email-neal.liu@mediatek.com>
 <CAAOTY_-7PwoPG_0ce2p4BCNQ3rundg40Bsni14XSmVETExkKkw@mail.gmail.com>
 <1594351423.4670.18.camel@mtkswgap22>
In-Reply-To: <1594351423.4670.18.camel@mtkswgap22>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 10 Jul 2020 22:21:08 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9MPYi=FAisE50UzT=eceSykN+Z8HnfFLLg_uRDhPAkpg@mail.gmail.com>
Message-ID: <CAAOTY_9MPYi=FAisE50UzT=eceSykN+Z8HnfFLLg_uRDhPAkpg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] soc: mediatek: add mtk-devapc driver
To: Neal Liu <neal.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200710_102123_074447_4519AFB4 
X-CRM114-Status: GOOD (  30.73  )
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
nIgxMOaXpSDpgLHkupQg5LiK5Y2IMTE6MjPlr6vpgZPvvJoKPgo+IEhpIENodW4tS3VhbmcsCj4K
PiBUaGFua3MgZm9yIHlvdXIgcmV2aWV3Lgo+Cj4gT24gVGh1LCAyMDIwLTA3LTA5IGF0IDIxOjAx
ICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOgo+ID4gSGksIE5lYWw6Cj4gPgo+ID4gTmVhbCBM
aXUgPG5lYWwubGl1QG1lZGlhdGVrLmNvbT4g5pa8IDIwMjDlubQ35pyIOeaXpSDpgLHlm5sg5LiL
5Y2INToxM+Wvq+mBk++8mgo+ID4gPgo+ID4gPiBNZWRpYVRlayBidXMgZmFicmljIHByb3ZpZGVz
IFRydXN0Wm9uZSBzZWN1cml0eSBzdXBwb3J0IGFuZCBkYXRhCj4gPiA+IHByb3RlY3Rpb24gdG8g
cHJldmVudCBzbGF2ZXMgZnJvbSBiZWluZyBhY2Nlc3NlZCBieSB1bmV4cGVjdGVkCj4gPiA+IG1h
c3RlcnMuCj4gPiA+IFRoZSBzZWN1cml0eSB2aW9sYXRpb24gaXMgbG9nZ2VkIGFuZCBzZW50IHRv
IHRoZSBwcm9jZXNzb3IgZm9yCj4gPiA+IGZ1cnRoZXIgYW5hbHlzaXMgb3IgY291bnRlcm1lYXN1
cmVzLgo+ID4gPgo+ID4gPiBBbnkgb2NjdXJyZW5jZSBvZiBzZWN1cml0eSB2aW9sYXRpb24gd291
bGQgcmFpc2UgYW4gaW50ZXJydXB0LCBhbmQKPiA+ID4gaXQgd2lsbCBiZSBoYW5kbGVkIGJ5IG10
ay1kZXZhcGMgZHJpdmVyLiBUaGUgdmlvbGF0aW9uCj4gPiA+IGluZm9ybWF0aW9uIGlzIHByaW50
ZWQgaW4gb3JkZXIgdG8gZmluZCB0aGUgbXVyZGVyZXIuCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYt
Ynk6IE5lYWwgTGl1IDxuZWFsLmxpdUBtZWRpYXRlay5jb20+Cj4gPgo+ID4gW3NuaXBdCj4gPgo+
ID4gPiArCj4gPiA+ICtzdGF0aWMgdTMyIGdldF9zaGlmdF9ncm91cChzdHJ1Y3QgbXRrX2RldmFw
Y19jb250ZXh0ICpkZXZhcGNfY3R4LAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICBp
bnQgc2xhdmVfdHlwZSwgaW50IHZpb19pZHgpCj4gPgo+ID4gdmlvX2lkeCAgaXMgdXNlbGVzcywg
c28gcmVtb3ZlIGl0Lgo+ID4KPgo+IHllcywgbXkgbWlzdGFrZS4gSSdsbCByZW1vdmUgaXQgb24g
bmV4dCBwYXRjaC4KPgo+ID4gPiArewo+ID4gPiArICAgICAgIHUzMiB2aW9fc2hpZnRfc3RhOwo+
ID4gPiArICAgICAgIHZvaWQgX19pb21lbSAqcmVnOwo+ID4gPiArICAgICAgIGludCBiaXQ7Cj4g
PiA+ICsKPiA+ID4gKyAgICAgICByZWcgPSBtdGtfZGV2YXBjX3BkX2dldChkZXZhcGNfY3R4LCBz
bGF2ZV90eXBlLCBWSU9fU0hJRlRfU1RBLCAwKTsKPiA+ID4gKyAgICAgICB2aW9fc2hpZnRfc3Rh
ID0gcmVhZGwocmVnKTsKPiA+ID4gKwo+ID4gPiArICAgICAgIGZvciAoYml0ID0gMDsgYml0IDwg
MzI7IGJpdCsrKSB7Cj4gPiA+ICsgICAgICAgICAgICAgICBpZiAoKHZpb19zaGlmdF9zdGEgPj4g
Yml0KSAmIDB4MSkKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gPiA+ICsg
ICAgICAgfQo+ID4gPiArCj4gPiA+ICsgICAgICAgcmV0dXJuIGJpdDsKPiA+ID4gK30KPiA+ID4g
Kwo+ID4KPiA+IFtzbmlwXQo+ID4KPiA+ID4gKwo+ID4gPiArLyoKPiA+ID4gKyAqIGRldmFwY192
aW9sYXRpb25faXJxIC0gdGhlIGRldmFwYyBJbnRlcnJ1cHQgU2VydmljZSBSb3V0aW5lIChJU1Ip
IHdpbGwgZHVtcAo+ID4gPiArICogICAgICAgICAgICAgICAgICAgICAgIHZpb2xhdGlvbiBpbmZv
cm1hdGlvbiBpbmNsdWRpbmcgd2hpY2ggbWFzdGVyIHZpb2xhdGVzCj4gPiA+ICsgKiAgICAgICAg
ICAgICAgICAgICAgICAgYWNjZXNzIHNsYXZlLgo+ID4gPiArICovCj4gPiA+ICtzdGF0aWMgaXJx
cmV0dXJuX3QgZGV2YXBjX3Zpb2xhdGlvbl9pcnEoaW50IGlycV9udW1iZXIsCj4gPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgbXRrX2RldmFwY19jb250
ZXh0ICpkZXZhcGNfY3R4KQo+ID4gPiArewo+ID4gPiArICAgICAgIGNvbnN0IHN0cnVjdCBtdGtf
ZGV2aWNlX2luZm8gKipkZXZpY2VfaW5mbzsKPiA+ID4gKyAgICAgICBpbnQgc2xhdmVfdHlwZV9u
dW07Cj4gPiA+ICsgICAgICAgaW50IHZpb19pZHggPSAtMTsKPiA+ID4gKyAgICAgICBpbnQgc2xh
dmVfdHlwZTsKPiA+ID4gKwo+ID4gPiArICAgICAgIHNsYXZlX3R5cGVfbnVtID0gZGV2YXBjX2N0
eC0+c2xhdmVfdHlwZV9udW07Cj4gPiA+ICsgICAgICAgZGV2aWNlX2luZm8gPSBkZXZhcGNfY3R4
LT5kZXZpY2VfaW5mbzsKPiA+ID4gKwo+ID4gPiArICAgICAgIGZvciAoc2xhdmVfdHlwZSA9IDA7
IHNsYXZlX3R5cGUgPCBzbGF2ZV90eXBlX251bTsgc2xhdmVfdHlwZSsrKSB7Cj4gPgo+ID4gSWYg
c2xhdmVfdHlwZV9udW0gaXMgMSwgSSB0aGluayB0aGUgY29kZSBzaG91bGQgYmUgc2ltcGxlci4K
Pgo+IHNsYXZlX3R5cGVfbnVtIGlzIGRlcGVuZHMgb24gRFQgZGF0YSwgaXQncyBub3QgYWx3YXlz
IDEuCgpQbGVhc2UgY2hhbmdlIGNvbW1pdCB0aXRsZSB0byAiYWRkIG10Njc3OSBtdGstZGV2YXBj
IGRyaXZlciIuIFRoaXMKcGF0Y2ggaXMganVzdCBmb3IgbXQ2Nzc5LiBJZiBzbGF2ZV90eXBlX251
bSA9IDEgaW4gbXQ2Nzc5LCB0aGVyZSBpcwpvbmx5IG9uZSBzbGF2ZSBhbmQgd2UgZG9uJ3QgbmVl
ZCBhIHNsYXZlX3R5cGUgdmFyaWFibGUuIEFkZApzbGF2ZV90eXBlX251bSBpbiB0aGUgcGF0Y2gg
b2YgYWRkaW5nIG9uZSBTb0Mgd2hpY2ggaGFzIG11bHRpcGxlCnNsYXZlcy4KCj4KPiA+Cj4gPiA+
ICsgICAgICAgICAgICAgICBpZiAoIW10a19kZXZhcGNfZHVtcF92aW9fZGJnKGRldmFwY19jdHgs
IHNsYXZlX3R5cGUsICZ2aW9faWR4KSkKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY29u
dGludWU7Cj4gPiA+ICsKPiA+ID4gKyAgICAgICAgICAgICAgIC8qIEVuc3VyZSB0aGF0IHZpb2xh
dGlvbiBpbmZvIGFyZSB3cml0dGVuIGJlZm9yZQo+ID4gPiArICAgICAgICAgICAgICAgICogZnVy
dGhlciBvcGVyYXRpb25zCj4gPiA+ICsgICAgICAgICAgICAgICAgKi8KPiA+ID4gKyAgICAgICAg
ICAgICAgIHNtcF9tYigpOwo+ID4gPiArCj4gPiA+ICsgICAgICAgICAgICAgICBtYXNrX21vZHVs
ZV9pcnEoZGV2YXBjX2N0eCwgc2xhdmVfdHlwZSwgdmlvX2lkeCwgdHJ1ZSk7Cj4gPgo+ID4gV2h5
IGRvIHlvdSBtYXNrIGlycT8KPgo+IEl0IGhhcyB0byBtYXNrIHNsYXZlJ3MgaXJxIGJlZm9yZSBj
bGVhciB2aW9sYXRpb24gc3RhdHVzLgo+IEl0J3Mgb25lIG9mIGhhcmR3YXJlIGRlc2lnbi4KCklm
IGRvbid0IGRvIHRoaXMgYmVmb3JlIGNsZWFyX3Zpb19zdGF0dXMsIHdoYXQgd291bGQgaGFwcGVu
PyBUaGUgY2xlYXIKd291bGQgZmFpbD8KCj4KPiA+Cj4gPiA+ICsKPiA+ID4gKyAgICAgICAgICAg
ICAgIGNsZWFyX3Zpb19zdGF0dXMoZGV2YXBjX2N0eCwgc2xhdmVfdHlwZSwgdmlvX2lkeCk7Cj4g
PiA+ICsKPiA+ID4gKyAgICAgICAgICAgICAgIG1hc2tfbW9kdWxlX2lycShkZXZhcGNfY3R4LCBz
bGF2ZV90eXBlLCB2aW9faWR4LCBmYWxzZSk7Cj4gPiA+ICsgICAgICAgfQo+ID4gPiArCj4gPiA+
ICsgICAgICAgcmV0dXJuIElSUV9IQU5ETEVEOwo+ID4gPiArfQo+ID4gPiArCj4gPiA+ICsvKgo+
ID4gPiArICogc3RhcnRfZGV2YXBjIC0gaW5pdGlhbGl6ZSBkZXZhcGMgc3RhdHVzIGFuZCBzdGFy
dCByZWNlaXZpbmcgaW50ZXJydXB0Cj4gPiA+ICsgKiAgICAgICAgICAgICAgIHdoaWxlIGRldmFw
YyB2aW9sYXRpb24gaXMgdHJpZ2dlcmVkLgo+ID4gPiArICovCj4gPgo+ID4gW3NuaXBdCj4gPgo+
ID4gPiArCj4gPiA+ICtzdHJ1Y3QgbXRrX2RldmljZV9pbmZvIHsKPiA+ID4gKyAgICAgICBpbnQg
c3lzX2luZGV4Owo+ID4KPiA+IFVzZWxlc3MsIHNvIHJlbW92ZSBpdC4KPgo+IFdlIG5lZWQgdG8g
cHJpbnQgaXQgYXMgb3VyIGRlYnVnIGluZm9ybWF0aW9uLgo+IEJ1dCBJIGRpZCBub3QgYXBwbHkg
aXQgb24gdGhpcyBwYXRjaCwgSSdsbCBhZGQgaXQgb24gbmV4dCBwYXRjaC4KCkkgdGhpbmsgdmlv
IGFkZHJlc3MgaXMgZW5vdWdoIHRvIGZpbmQgb3V0IHRoZSBtdXJkZXIsIHNvIHJlbW92ZSBpdCBp
bgp0aGlzIHBhdGNoLiBJZiBpdCBwcm92aWRlIGFub3RoZXIgaW5mb3JtYXRpb24sIGFkZCBpdCBp
biBhbm90aGVyIHBhdGNoCmFuZCBkZXNjcmliZSBjbGVhciBhYm91dCB3aGF0IGlzIHRoaXMgYW5k
IGhvdyB0byB1c2UgdGhpcyBpbmZvcm1hdGlvbi4KCj4KPiA+Cj4gPiA+ICsgICAgICAgaW50IGN0
cmxfaW5kZXg7Cj4gPgo+ID4gRGl0dG8uCj4gPgo+ID4gUmVnYXJkcywKPiA+IENodW4tS3Vhbmcu
Cj4gPgo+ID4gPiArICAgICAgIGludCB2aW9faW5kZXg7Cj4gPiA+ICt9Owo+ID4gPiArCj4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlh
dGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
