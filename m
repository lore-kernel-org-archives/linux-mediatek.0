Return-Path: <SRS0=TL3J=AY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C66BC433E5
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 14:20:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD9A22065F
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 14:20:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b/sPr0Ue";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="UgzykC6i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD9A22065F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HcNN3k5zUAuRU18gvWMhJTSXBvChTgikp6P8hzf2XZE=; b=b/sPr0UeBPK+/q5bbwo1OM4nq
	8g0mnoIRdA7mhACh3vGt3sFSGcI2WCIp6Ta55Q//BMaFcUd0UxRCeIswmVln1by8AUbzWqae1fMPE
	WHPr28klWcz8rRLHH+hVcd4X7uRh6xPnFtizeGoRBrpUkBE/0BPcuC8xE4gwG6ZkB1egQ8cHGQqQK
	mHoCi137nJfdA1rA27iAaCD6SoM6vaDJJPLENc/V4rCy5HoOaGOmmYoycWyMkWfffWy0Y966m1h1O
	PZokCYGu9LWAgP+nvEErn9xbdsjKHY9JiyXsUmmj3sFCU7Ma8jjyRyBwPt5BAHxwRAwYvp5KPq1wF
	ISlCxCbaw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1juzJv-0000yB-6H; Mon, 13 Jul 2020 14:20:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1juzJo-0000wK-KG; Mon, 13 Jul 2020 14:20:33 +0000
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 626462075B;
 Mon, 13 Jul 2020 14:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594650031;
 bh=IId5QOPSndJUPoyL6HRFHM12/PWNCAUkWspegEMSuao=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=UgzykC6i9N+z0nSmXMWOymDt2Cx6HKGWcjiOYgYy+M6NzekoA6tlmHJoOIPHBTgxH
 N6HG8hPskZ87or/KSnwcQrymvJy7t5Ixdl6dlb4vqMgzjGfMyppy7nxppV8ZeI3EqN
 bkJVkOCCCnms/roc45ldTplkcLEat6yE8SxOBSUo=
Received: by mail-ej1-f52.google.com with SMTP id a1so17384067ejg.12;
 Mon, 13 Jul 2020 07:20:31 -0700 (PDT)
X-Gm-Message-State: AOAM532RpC3hqzOZXVimaCfAyr30xZshQ/N+Hw/09icBp1nAxvMfNa9e
 Tl9Zh4qq90fzmJ/sRenhg1ZpPIJCd8Gc+wzcvA==
X-Google-Smtp-Source: ABdhPJwLnqjJ0wxwFlHWN/oUCrOqvGtPrVpDTTnYynyk+47sF5GTmGIZzs40cnkDwqbJAuOxHTRSVMgpuvN6MpVAGVc=
X-Received: by 2002:a17:906:9354:: with SMTP id
 p20mr25576593ejw.187.1594650029915; 
 Mon, 13 Jul 2020 07:20:29 -0700 (PDT)
MIME-Version: 1.0
References: <1594285927-1840-1-git-send-email-neal.liu@mediatek.com>
 <1594285927-1840-3-git-send-email-neal.liu@mediatek.com>
 <CAAOTY_-7PwoPG_0ce2p4BCNQ3rundg40Bsni14XSmVETExkKkw@mail.gmail.com>
 <1594351423.4670.18.camel@mtkswgap22>
 <CAAOTY_9MPYi=FAisE50UzT=eceSykN+Z8HnfFLLg_uRDhPAkpg@mail.gmail.com>
 <1594628844.22730.48.camel@mtkswgap22>
In-Reply-To: <1594628844.22730.48.camel@mtkswgap22>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 13 Jul 2020 22:20:18 +0800
X-Gmail-Original-Message-ID: <CAAOTY_931nJb2Ove5NzfAWX=xy0D3oj6y5d0ThRsvhANFf1_BQ@mail.gmail.com>
Message-ID: <CAAOTY_931nJb2Ove5NzfAWX=xy0D3oj6y5d0ThRsvhANFf1_BQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] soc: mediatek: add mtk-devapc driver
To: Neal Liu <neal.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_102032_785949_AB4086C8 
X-CRM114-Status: GOOD (  41.82  )
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
nIgxM+aXpSDpgLHkuIAg5LiL5Y2INDoyN+Wvq+mBk++8mgo+Cj4gSGkgQ2h1bi1LdWFuZywKPgo+
IFRoYW5rcyBmb3IgeW91ciByZXZpZXcuCj4KPiBPbiBGcmksIDIwMjAtMDctMTAgYXQgMjI6MjEg
KzA4MDAsIENodW4tS3VhbmcgSHUgd3JvdGU6Cj4gPiBIaSwgTmVhbDoKPiA+Cj4gPiBOZWFsIExp
dSA8bmVhbC5saXVAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMOW5tDfmnIgxMOaXpSDpgLHkupQg5LiK
5Y2IMTE6MjPlr6vpgZPvvJoKPiA+ID4KPiA+ID4gSGkgQ2h1bi1LdWFuZywKPiA+ID4KPiA+ID4g
VGhhbmtzIGZvciB5b3VyIHJldmlldy4KPiA+ID4KPiA+ID4gT24gVGh1LCAyMDIwLTA3LTA5IGF0
IDIxOjAxICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOgo+ID4gPiA+IEhpLCBOZWFsOgo+ID4g
PiA+Cj4gPiA+ID4gTmVhbCBMaXUgPG5lYWwubGl1QG1lZGlhdGVrLmNvbT4g5pa8IDIwMjDlubQ3
5pyIOeaXpSDpgLHlm5sg5LiL5Y2INToxM+Wvq+mBk++8mgo+ID4gPiA+ID4KPiA+ID4gPiA+IE1l
ZGlhVGVrIGJ1cyBmYWJyaWMgcHJvdmlkZXMgVHJ1c3Rab25lIHNlY3VyaXR5IHN1cHBvcnQgYW5k
IGRhdGEKPiA+ID4gPiA+IHByb3RlY3Rpb24gdG8gcHJldmVudCBzbGF2ZXMgZnJvbSBiZWluZyBh
Y2Nlc3NlZCBieSB1bmV4cGVjdGVkCj4gPiA+ID4gPiBtYXN0ZXJzLgo+ID4gPiA+ID4gVGhlIHNl
Y3VyaXR5IHZpb2xhdGlvbiBpcyBsb2dnZWQgYW5kIHNlbnQgdG8gdGhlIHByb2Nlc3NvciBmb3IK
PiA+ID4gPiA+IGZ1cnRoZXIgYW5hbHlzaXMgb3IgY291bnRlcm1lYXN1cmVzLgo+ID4gPiA+ID4K
PiA+ID4gPiA+IEFueSBvY2N1cnJlbmNlIG9mIHNlY3VyaXR5IHZpb2xhdGlvbiB3b3VsZCByYWlz
ZSBhbiBpbnRlcnJ1cHQsIGFuZAo+ID4gPiA+ID4gaXQgd2lsbCBiZSBoYW5kbGVkIGJ5IG10ay1k
ZXZhcGMgZHJpdmVyLiBUaGUgdmlvbGF0aW9uCj4gPiA+ID4gPiBpbmZvcm1hdGlvbiBpcyBwcmlu
dGVkIGluIG9yZGVyIHRvIGZpbmQgdGhlIG11cmRlcmVyLgo+ID4gPiA+ID4KPiA+ID4gPiA+IFNp
Z25lZC1vZmYtYnk6IE5lYWwgTGl1IDxuZWFsLmxpdUBtZWRpYXRlay5jb20+Cj4gPiA+ID4KPiA+
ID4gPiBbc25pcF0KPiA+ID4gPgo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gK3N0YXRpYyB1MzIgZ2V0
X3NoaWZ0X2dyb3VwKHN0cnVjdCBtdGtfZGV2YXBjX2NvbnRleHQgKmRldmFwY19jdHgsCj4gPiA+
ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgc2xhdmVfdHlwZSwgaW50IHZpb19p
ZHgpCj4gPiA+ID4KPiA+ID4gPiB2aW9faWR4ICBpcyB1c2VsZXNzLCBzbyByZW1vdmUgaXQuCj4g
PiA+ID4KPiA+ID4KPiA+ID4geWVzLCBteSBtaXN0YWtlLiBJJ2xsIHJlbW92ZSBpdCBvbiBuZXh0
IHBhdGNoLgo+ID4gPgo+ID4gPiA+ID4gK3sKPiA+ID4gPiA+ICsgICAgICAgdTMyIHZpb19zaGlm
dF9zdGE7Cj4gPiA+ID4gPiArICAgICAgIHZvaWQgX19pb21lbSAqcmVnOwo+ID4gPiA+ID4gKyAg
ICAgICBpbnQgYml0Owo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKyAgICAgICByZWcgPSBtdGtfZGV2
YXBjX3BkX2dldChkZXZhcGNfY3R4LCBzbGF2ZV90eXBlLCBWSU9fU0hJRlRfU1RBLCAwKTsKPiA+
ID4gPiA+ICsgICAgICAgdmlvX3NoaWZ0X3N0YSA9IHJlYWRsKHJlZyk7Cj4gPiA+ID4gPiArCj4g
PiA+ID4gPiArICAgICAgIGZvciAoYml0ID0gMDsgYml0IDwgMzI7IGJpdCsrKSB7Cj4gPiA+ID4g
PiArICAgICAgICAgICAgICAgaWYgKCh2aW9fc2hpZnRfc3RhID4+IGJpdCkgJiAweDEpCj4gPiA+
ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiA+ID4gPiA+ICsgICAgICAgfQo+
ID4gPiA+ID4gKwo+ID4gPiA+ID4gKyAgICAgICByZXR1cm4gYml0Owo+ID4gPiA+ID4gK30KPiA+
ID4gPiA+ICsKPiA+ID4gPgo+ID4gPiA+IFtzbmlwXQo+ID4gPiA+Cj4gPiA+ID4gPiArCj4gPiA+
ID4gPiArLyoKPiA+ID4gPiA+ICsgKiBkZXZhcGNfdmlvbGF0aW9uX2lycSAtIHRoZSBkZXZhcGMg
SW50ZXJydXB0IFNlcnZpY2UgUm91dGluZSAoSVNSKSB3aWxsIGR1bXAKPiA+ID4gPiA+ICsgKiAg
ICAgICAgICAgICAgICAgICAgICAgdmlvbGF0aW9uIGluZm9ybWF0aW9uIGluY2x1ZGluZyB3aGlj
aCBtYXN0ZXIgdmlvbGF0ZXMKPiA+ID4gPiA+ICsgKiAgICAgICAgICAgICAgICAgICAgICAgYWNj
ZXNzIHNsYXZlLgo+ID4gPiA+ID4gKyAqLwo+ID4gPiA+ID4gK3N0YXRpYyBpcnFyZXR1cm5fdCBk
ZXZhcGNfdmlvbGF0aW9uX2lycShpbnQgaXJxX251bWJlciwKPiA+ID4gPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgbXRrX2RldmFwY19jb250ZXh0ICpk
ZXZhcGNfY3R4KQo+ID4gPiA+ID4gK3sKPiA+ID4gPiA+ICsgICAgICAgY29uc3Qgc3RydWN0IG10
a19kZXZpY2VfaW5mbyAqKmRldmljZV9pbmZvOwo+ID4gPiA+ID4gKyAgICAgICBpbnQgc2xhdmVf
dHlwZV9udW07Cj4gPiA+ID4gPiArICAgICAgIGludCB2aW9faWR4ID0gLTE7Cj4gPiA+ID4gPiAr
ICAgICAgIGludCBzbGF2ZV90eXBlOwo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKyAgICAgICBzbGF2
ZV90eXBlX251bSA9IGRldmFwY19jdHgtPnNsYXZlX3R5cGVfbnVtOwo+ID4gPiA+ID4gKyAgICAg
ICBkZXZpY2VfaW5mbyA9IGRldmFwY19jdHgtPmRldmljZV9pbmZvOwo+ID4gPiA+ID4gKwo+ID4g
PiA+ID4gKyAgICAgICBmb3IgKHNsYXZlX3R5cGUgPSAwOyBzbGF2ZV90eXBlIDwgc2xhdmVfdHlw
ZV9udW07IHNsYXZlX3R5cGUrKykgewo+ID4gPiA+Cj4gPiA+ID4gSWYgc2xhdmVfdHlwZV9udW0g
aXMgMSwgSSB0aGluayB0aGUgY29kZSBzaG91bGQgYmUgc2ltcGxlci4KPiA+ID4KPiA+ID4gc2xh
dmVfdHlwZV9udW0gaXMgZGVwZW5kcyBvbiBEVCBkYXRhLCBpdCdzIG5vdCBhbHdheXMgMS4KPiA+
Cj4gPiBQbGVhc2UgY2hhbmdlIGNvbW1pdCB0aXRsZSB0byAiYWRkIG10Njc3OSBtdGstZGV2YXBj
IGRyaXZlciIuIFRoaXMKPiA+IHBhdGNoIGlzIGp1c3QgZm9yIG10Njc3OS4gSWYgc2xhdmVfdHlw
ZV9udW0gPSAxIGluIG10Njc3OSwgdGhlcmUgaXMKPiA+IG9ubHkgb25lIHNsYXZlIGFuZCB3ZSBk
b24ndCBuZWVkIGEgc2xhdmVfdHlwZSB2YXJpYWJsZS4gQWRkCj4gPiBzbGF2ZV90eXBlX251bSBp
biB0aGUgcGF0Y2ggb2YgYWRkaW5nIG9uZSBTb0Mgd2hpY2ggaGFzIG11bHRpcGxlCj4gPiBzbGF2
ZXMuCj4KPiBJZiBzbGF2ZV90eXBlX251bSB2YWx1ZSBpcyBwYXNzZWQgZnJvbSBEVCBkYXRhLCBj
b3VsZCB3ZSBzdGlsbCBhc3N1bWUKPiBpdHMgdmFsdWU/IERvZXMgaXQgbWFrZSBzZW5zZSB0byBo
YXZlIHRoaXMgc3Ryb25nIGFzc3VtcHRpb24/CgpNYWludGFpbmVyIGhhcyBhc2tlZCB5b3UgdG8g
bW92ZSB0aGlzIGRhdGEgZnJvbSBkZXZpY2UgdHJlZSB0byBkcml2ZXIKWzFdLCBJIGRvdWJ0IHlv
dSBjb3VsZCBnZXQgdGhpcyBkYXRhIGZyb20gZGV2aWNlIHRyZWUuIEV2ZW4gdGhvdWdoCmRldmlj
ZSB0cmVlIGhhcyB0aGlzIHByb3BlcnR5LCB0aGlzIGRyaXZlciBzdXBwb3J0IG9ubHkgbXQ2Nzc5
IG5vdywgc28KaXQncyBub3QgbmVjZXNzYXJ5IHRvIGhhdmUgc2xhdmVfdHlwZV9udW0gYmVjYXVz
ZSBzbGF2ZSB0eXBlIGlzIG9ubHkKMS4gSSB0aGluayB3ZSBzaG91bGQgbm90IGNvbnNpZGVyIHN1
cHBvcnQgbXVsdGlwbGUgU29DIGluIHRoaXMgcGF0Y2guCgpbMV0gaHR0cHM6Ly9wYXRjaHdvcmsu
a2VybmVsLm9yZy9wYXRjaC8xMTY1MzkxMS8KCj4KPiBJJ20gZ29pbmcgdG8gcmVtb3ZlIG10a19k
ZXZpY2VfaW5mbyBzdHJ1Y3QgYXJyYXksIGFuZCBwYXNzIGFsbCBTb0MKPiBzcGVjaWZpYyBkYXRh
IGZyb20gRFQuCj4gSXMgaXQgb2theSB0byBrZWVwIHNsYXZlX3R5cGVfbnVtIGFzIGEgdmFyaWFu
Y2U/Cj4KPiA+Cj4gPiA+Cj4gPiA+ID4KPiA+ID4gPiA+ICsgICAgICAgICAgICAgICBpZiAoIW10
a19kZXZhcGNfZHVtcF92aW9fZGJnKGRldmFwY19jdHgsIHNsYXZlX3R5cGUsICZ2aW9faWR4KSkK
PiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+ID4gPiA+ID4gKwo+
ID4gPiA+ID4gKyAgICAgICAgICAgICAgIC8qIEVuc3VyZSB0aGF0IHZpb2xhdGlvbiBpbmZvIGFy
ZSB3cml0dGVuIGJlZm9yZQo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAqIGZ1cnRoZXIgb3Bl
cmF0aW9ucwo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAqLwo+ID4gPiA+ID4gKyAgICAgICAg
ICAgICAgIHNtcF9tYigpOwo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIG1h
c2tfbW9kdWxlX2lycShkZXZhcGNfY3R4LCBzbGF2ZV90eXBlLCB2aW9faWR4LCB0cnVlKTsKPiA+
ID4gPgo+ID4gPiA+IFdoeSBkbyB5b3UgbWFzayBpcnE/Cj4gPiA+Cj4gPiA+IEl0IGhhcyB0byBt
YXNrIHNsYXZlJ3MgaXJxIGJlZm9yZSBjbGVhciB2aW9sYXRpb24gc3RhdHVzLgo+ID4gPiBJdCdz
IG9uZSBvZiBoYXJkd2FyZSBkZXNpZ24uCj4gPgo+ID4gSWYgZG9uJ3QgZG8gdGhpcyBiZWZvcmUg
Y2xlYXJfdmlvX3N0YXR1cywgd2hhdCB3b3VsZCBoYXBwZW4/IFRoZSBjbGVhcgo+ID4gd291bGQg
ZmFpbD8KPgo+IElmIHdlIGRvbid0IG1hc2sgc2xhdmUncyBpcnEgYmVmb3JlIGNsZWFyIHZpbyBz
dGF0dXMsIEl0IG1pZ2h0IHRyaWdnZXIKPiBhbm90aGVyIGludGVycnVwdCBiZWZvcmUgY3VycmVu
dCBJU1IgZmluaXNoZWQuIFRoZSBuZXN0ZWQgaW50ZXJydXB0IHdpbGwKPiBoYXZlIHVuZXhwZWN0
ZWQgYmVoYXZpb3IgYW5kIGhhcmR3YXJlIHN0YXRlIG1hY2hpbmUgZ29lcyB3cm9uZy4KClRoaXMg
aGFyZHdhcmUgaXMgc28gc3BlY2lhbC4gRm9yIGdlbmVyYWwgaGFyZHdhcmUsIG9ubHkgY2xlYXIg
c3RhdHVzCndvdWxkIGxldCBoYXJkd2FyZSBzdG9wIGludGVycnVwdC4gUGxlYXNlIGFkZCBhIGNv
bW1lbnQgYWJvdXQgdGhpcwpzcGVjaWFsIGhhcmR3YXJlIGJlaGF2aW9yLgoKPgo+ID4KPiA+ID4K
PiA+ID4gPgo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIGNsZWFyX3Zpb19z
dGF0dXMoZGV2YXBjX2N0eCwgc2xhdmVfdHlwZSwgdmlvX2lkeCk7Cj4gPiA+ID4gPiArCj4gPiA+
ID4gPiArICAgICAgICAgICAgICAgbWFza19tb2R1bGVfaXJxKGRldmFwY19jdHgsIHNsYXZlX3R5
cGUsIHZpb19pZHgsIGZhbHNlKTsKPiA+ID4gPiA+ICsgICAgICAgfQo+ID4gPiA+ID4gKwo+ID4g
PiA+ID4gKyAgICAgICByZXR1cm4gSVJRX0hBTkRMRUQ7Cj4gPiA+ID4gPiArfQo+ID4gPiA+ID4g
Kwo+ID4gPiA+ID4gKy8qCj4gPiA+ID4gPiArICogc3RhcnRfZGV2YXBjIC0gaW5pdGlhbGl6ZSBk
ZXZhcGMgc3RhdHVzIGFuZCBzdGFydCByZWNlaXZpbmcgaW50ZXJydXB0Cj4gPiA+ID4gPiArICog
ICAgICAgICAgICAgICB3aGlsZSBkZXZhcGMgdmlvbGF0aW9uIGlzIHRyaWdnZXJlZC4KPiA+ID4g
PiA+ICsgKi8KPiA+ID4gPgo+ID4gPiA+IFtzbmlwXQo+ID4gPiA+Cj4gPiA+ID4gPiArCj4gPiA+
ID4gPiArc3RydWN0IG10a19kZXZpY2VfaW5mbyB7Cj4gPiA+ID4gPiArICAgICAgIGludCBzeXNf
aW5kZXg7Cj4gPiA+ID4KPiA+ID4gPiBVc2VsZXNzLCBzbyByZW1vdmUgaXQuCj4gPiA+Cj4gPiA+
IFdlIG5lZWQgdG8gcHJpbnQgaXQgYXMgb3VyIGRlYnVnIGluZm9ybWF0aW9uLgo+ID4gPiBCdXQg
SSBkaWQgbm90IGFwcGx5IGl0IG9uIHRoaXMgcGF0Y2gsIEknbGwgYWRkIGl0IG9uIG5leHQgcGF0
Y2guCj4gPgo+ID4gSSB0aGluayB2aW8gYWRkcmVzcyBpcyBlbm91Z2ggdG8gZmluZCBvdXQgdGhl
IG11cmRlciwgc28gcmVtb3ZlIGl0IGluCj4gPiB0aGlzIHBhdGNoLiBJZiBpdCBwcm92aWRlIGFu
b3RoZXIgaW5mb3JtYXRpb24sIGFkZCBpdCBpbiBhbm90aGVyIHBhdGNoCj4gPiBhbmQgZGVzY3Jp
YmUgY2xlYXIgYWJvdXQgd2hhdCBpcyB0aGlzIGFuZCBob3cgdG8gdXNlIHRoaXMgaW5mb3JtYXRp
b24uCj4gPgo+Cj4gT2theSwgaXQgbWFrZSBzZW5zZS4gSSdsbCByZW1vdmUgaXQgaW4gbmV4dCBw
YXRjaGVzLgo+Cj4gPiA+Cj4gPiA+ID4KPiA+ID4gPiA+ICsgICAgICAgaW50IGN0cmxfaW5kZXg7
Cj4gPiA+ID4KPiA+ID4gPiBEaXR0by4KPiA+ID4gPgo+ID4gPiA+IFJlZ2FyZHMsCj4gPiA+ID4g
Q2h1bi1LdWFuZy4KPiA+ID4gPgo+ID4gPiA+ID4gKyAgICAgICBpbnQgdmlvX2luZGV4Owo+ID4g
PiA+ID4gK307Cj4gPiA+ID4gPiArCj4gPiA+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1t
ZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
