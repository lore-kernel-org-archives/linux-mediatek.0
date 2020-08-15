Return-Path: <SRS0=5o2P=BZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1413C433E1
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Aug 2020 03:04:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9350D22DBF
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Aug 2020 03:04:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TxKXVGaS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="aPLmc5XI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9350D22DBF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iKwnQVUBMY7uQFlGO4tAnQR2TGsw4YyCo1+pJ5bppGQ=; b=TxKXVGaSxmlFh/Gzpt0ridwxj
	DihbxW91OX9iEVDVS6ybj50pD8E64g7YKSc9K7BPqYupDPaYa0Xn2tjBGLWMvU7ccQj308gkX8vQF
	gLrSKavxYK2rbmSY/m8lQgUfx+7Owjb4H3Jr+X7bBHx8hoZAej5RQR0o2/TF5ChMxqIsZEcW1ejFl
	2V9pR1V1kryr+zWC+sg0Xf3iqZ8XzC/fcLN8X2m+i+j0s4hLayOWPqdwO4eNE0QkGaBIQB6MCJEW0
	lsMCwbv55tYeuXi8QzA4mhIXcK2zTr6VqBz0kWPgN70rsLJ6nmhLrA+2p9seG0j+XlI2r97Wxi+uq
	zAGl9nl/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6mTy-00022Y-NO; Sat, 15 Aug 2020 03:03:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6mTr-00021j-Mz; Sat, 15 Aug 2020 03:03:40 +0000
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2E34B22E01;
 Sat, 15 Aug 2020 03:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597460618;
 bh=LWZ3gG05lyWwHbQNUP3ksCUHLVF4wFzI8rRKV3uiNak=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=aPLmc5XIVhNgOz/dUkmBwJHhTub2jfiFdCUnXPgEVZvsfdM60xwqSPiHXUjZo/gZg
 W13nLli/i5dcL9+RLLKwoyKEj/1rS4pFIGP+81I7TUivDsE3PPl0LwR+oPRQbUf2eR
 Zq7320V1UEnYBmGlW09/3R0ltEf9DMa1/eUQy5SE=
Received: by mail-ej1-f47.google.com with SMTP id g19so11865604ejc.9;
 Fri, 14 Aug 2020 20:03:38 -0700 (PDT)
X-Gm-Message-State: AOAM531q/5KktA61CmktY9OInoIeo33Y5Ah1mQghf9IOw7V/lURR9erG
 d17A9SGaFhfpQgcdPDDUDSEx2FqdZrzJL8rvJw==
X-Google-Smtp-Source: ABdhPJyt/63tP7h7Rcip1YksjvsGO7WzFuUVEIVYhoFntsd6TkK7JtmalTJjkuyszotatOlhPqyFfaDNHeccHlw5oaU=
X-Received: by 2002:a17:906:7492:: with SMTP id
 e18mr5232063ejl.375.1597460616714; 
 Fri, 14 Aug 2020 20:03:36 -0700 (PDT)
MIME-Version: 1.0
References: <1597289564-17030-1-git-send-email-neal.liu@mediatek.com>
 <1597289564-17030-3-git-send-email-neal.liu@mediatek.com>
In-Reply-To: <1597289564-17030-3-git-send-email-neal.liu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 15 Aug 2020 11:03:24 +0800
X-Gmail-Original-Message-ID: <CAAOTY_88YSHOvDEHm+rM1=fTv_y25nUh1tuLUH8YSxH5UD1bug@mail.gmail.com>
Message-ID: <CAAOTY_88YSHOvDEHm+rM1=fTv_y25nUh1tuLUH8YSxH5UD1bug@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] soc: mediatek: add mt6779 devapc driver
To: Neal Liu <neal.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200814_230339_888241_050D6339 
X-CRM114-Status: GOOD (  19.65  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream <wsd_upstream@mediatek.com>,
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIE5lYWw6CgpOZWFsIExpdSA8bmVhbC5saXVAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMOW5tDjm
nIgxM+aXpSDpgLHlm5sg5LiK5Y2IMTE6MzPlr6vpgZPvvJoKPgo+IE1lZGlhVGVrIGJ1cyBmYWJy
aWMgcHJvdmlkZXMgVHJ1c3Rab25lIHNlY3VyaXR5IHN1cHBvcnQgYW5kIGRhdGEKPiBwcm90ZWN0
aW9uIHRvIHByZXZlbnQgc2xhdmVzIGZyb20gYmVpbmcgYWNjZXNzZWQgYnkgdW5leHBlY3RlZAo+
IG1hc3RlcnMuCj4gVGhlIHNlY3VyaXR5IHZpb2xhdGlvbiBpcyBsb2dnZWQgYW5kIHNlbnQgdG8g
dGhlIHByb2Nlc3NvciBmb3IKPiBmdXJ0aGVyIGFuYWx5c2lzIG9yIGNvdW50ZXJtZWFzdXJlcy4K
Pgo+IEFueSBvY2N1cnJlbmNlIG9mIHNlY3VyaXR5IHZpb2xhdGlvbiB3b3VsZCByYWlzZSBhbiBp
bnRlcnJ1cHQsIGFuZAo+IGl0IHdpbGwgYmUgaGFuZGxlZCBieSBtdGstZGV2YXBjIGRyaXZlci4g
VGhlIHZpb2xhdGlvbgo+IGluZm9ybWF0aW9uIGlzIHByaW50ZWQgaW4gb3JkZXIgdG8gZmluZCB0
aGUgbXVyZGVyZXIuCj4KPiBTaWduZWQtb2ZmLWJ5OiBOZWFsIExpdSA8bmVhbC5saXVAbWVkaWF0
ZWsuY29tPgo+IC0tLQoKW3NuaXBdCgo+ICsvKgo+ICsgKiBkZXZhcGNfdmlvbGF0aW9uX2lycSAt
IHRoZSBkZXZhcGMgSW50ZXJydXB0IFNlcnZpY2UgUm91dGluZSAoSVNSKSB3aWxsIGR1bXAKPiAr
ICogICAgICAgICAgICAgICAgICAgICAgICB2aW9sYXRpb24gaW5mb3JtYXRpb24gaW5jbHVkaW5n
IHdoaWNoIG1hc3RlciB2aW9sYXRlcwo+ICsgKiAgICAgICAgICAgICAgICAgICAgICAgIGFjY2Vz
cyBzbGF2ZS4KPiArICovCj4gK3N0YXRpYyBpcnFyZXR1cm5fdCBkZXZhcGNfdmlvbGF0aW9uX2ly
cShpbnQgaXJxX251bWJlciwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgc3RydWN0IG10a19kZXZhcGNfY29udGV4dCAqY3R4KQo+ICt7Cj4gKyAgICAgICAvKgo+ICsg
ICAgICAgICogTWFzayBzbGF2ZSdzIGlycSBiZWZvcmUgY2xlYXJpbmcgdmlvIHN0YXR1cy4KPiAr
ICAgICAgICAqIE11c3QgZG8gaXQgdG8gYXZvaWQgbmVzdGVkIGludGVycnVwdCBhbmQgcHJldmVu
dAo+ICsgICAgICAgICogdW5leHBlY3RlZCBiZWhhdmlvci4KPiArICAgICAgICAqLwo+ICsgICAg
ICAgbWFza19tb2R1bGVfaXJxKGN0eCwgdHJ1ZSk7CgpJIHN0aWxsIGRvbid0IHVuZGVyc3RhbmQg
d2h5IG5lc3RlZCBpbnRlcnJ1cHQgaGFwcGVuLiBJZiB0d28gQ1BVCnByb2Nlc3MgZGlmZmVyZW50
IGRldmFwYyBpbnRlcnJ1cHQgYXQgdGhlIHNhbWUgdGltZSwgbWFzayBpbnRlcnJ1cHQKY291bGQg
bm90IHByZXZlbnQgdGhlc2UgdHdvIENQVSB0byBzeW5jIHZpbyBkYmcgYXQgdGhlIHNhbWUgdGlt
ZS4gQXMgSQprbm93LCBpbiBBUk0gQ1BVLCBvbmx5IENQVTAgcHJvY2VzcyBpcnEgaGFuZGxlciwg
YW5kIGFsbCBkZXZhcGMKaW50ZXJydXB0IGhhcyB0aGUgc2FtZSBwcmlvcml0eSwgc28gd2h5IG5l
c3RlZCBpbnRlcnJ1cHQgaGFwcGVuPyBDb3VsZAp5b3UgZXhwbGFpbiBtb3JlIGRldGFpbCBhYm91
dCBob3cgbmVzdGVkIGludGVycnVwdCBoYXBwZW4/Cgo+ICsKPiArICAgICAgIHdoaWxlIChkZXZh
cGNfc3luY192aW9fZGJnKGN0eCkpCj4gKyAgICAgICAgICAgICAgIGRldmFwY19leHRyYWN0X3Zp
b19kYmcoY3R4KTsKPiArCj4gKyAgICAgICAvKgo+ICsgICAgICAgICogRW5zdXJlIHRoYXQgdmlv
bGF0aW9uIGluZm8gYXJlIHdyaXR0ZW4KPiArICAgICAgICAqIGJlZm9yZSBmdXJ0aGVyIG9wZXJh
dGlvbnMKPiArICAgICAgICAqLwo+ICsgICAgICAgc21wX21iKCk7Cj4gKwo+ICsgICAgICAgY2xl
YXJfdmlvX3N0YXR1cyhjdHgpOwo+ICsgICAgICAgbWFza19tb2R1bGVfaXJxKGN0eCwgZmFsc2Up
Owo+ICsKPiArICAgICAgIHJldHVybiBJUlFfSEFORExFRDsKPiArfQo+ICsKCltzbmlwXQoKPiAr
Cj4gK3N0YXRpYyBpbnQgbXRrX2RldmFwY19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKPiArewo+ICsgICAgICAgc3RydWN0IG10a19kZXZhcGNfY29udGV4dCAqY3R4ID0gcGxh
dGZvcm1fZ2V0X2RydmRhdGEocGRldik7Cj4gKwo+ICsgICAgICAgc3RvcF9kZXZhcGMoY3R4KTsK
PiArCj4gKyAgICAgICBpZiAoY3R4LT5pbmZyYV9jbGspCgpUaGlzIGFsd2F5cyB0cnVlLgoKUmVn
YXJkcywKQ2h1bi1LdWFuZy4KCj4gKyAgICAgICAgICAgICAgIGNsa19kaXNhYmxlX3VucHJlcGFy
ZShjdHgtPmluZnJhX2Nsayk7Cj4gKwo+ICsgICAgICAgcmV0dXJuIDA7Cj4gK30KPiArCj4gK3N0
YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIG10a19kZXZhcGNfZHJpdmVyID0gewo+ICsgICAg
ICAgLnByb2JlID0gbXRrX2RldmFwY19wcm9iZSwKPiArICAgICAgIC5yZW1vdmUgPSBtdGtfZGV2
YXBjX3JlbW92ZSwKPiArICAgICAgIC5kcml2ZXIgPSB7Cj4gKyAgICAgICAgICAgICAgIC5uYW1l
ID0gS0JVSUxEX01PRE5BTUUsCj4gKyAgICAgICAgICAgICAgIC5vZl9tYXRjaF90YWJsZSA9IG10
a19kZXZhcGNfZHRfbWF0Y2gsCj4gKyAgICAgICB9LAo+ICt9Owo+ICsKPiArbW9kdWxlX3BsYXRm
b3JtX2RyaXZlcihtdGtfZGV2YXBjX2RyaXZlcik7Cj4gKwo+ICtNT0RVTEVfREVTQ1JJUFRJT04o
Ik1lZGlhdGVrIERldmljZSBBUEMgRHJpdmVyIik7Cj4gK01PRFVMRV9BVVRIT1IoIk5lYWwgTGl1
IDxuZWFsLmxpdUBtZWRpYXRlay5jb20+Iik7Cj4gK01PRFVMRV9MSUNFTlNFKCJHUEwiKTsKPiAt
LQo+IDEuNy45LjUKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IExpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdAo+IExpbnV4LW1lZGlhdGVrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW1lZGlhdGVrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW1lZGlhdGVrCg==
