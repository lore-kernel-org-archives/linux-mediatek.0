Return-Path: <SRS0=fB7w=DM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58985C4363A
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2020 15:12:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E576D20774
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2020 15:12:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yI99TKYk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="nM7wmTlT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E576D20774
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TCAkux38vY6f0odsyiQYqKLWwrHXNDe8Y2T5a1VIZps=; b=yI99TKYkGjIlILkcrRTcS/5+i
	vwv7aDWdy3zvcXWKZhV9/ds+udssvLGieS0utf2gFsJEGe4FvN8BGqAhzeKo0XfTn9Kqh1SNwiNKQ
	TZs6TrE7edw8YpN8X+4PWk/gMHXMsvyg6aymsgcS73GuyfCGtmnQicOfnQfoVmAr44ZCWHkmkuPsB
	yY4w6G0JwIWOJPUY+G9uRYYyUvdcaCyMg89tmk4FvMO+B4DpkvD0pn/I992wqSzBAJn28ASy8J9M7
	jRNotlRMxppp05iIByW54S+VlMhaCRPcvRXBc2tF6NheWJcwuaOdFYYC9EgNElWYS3HCbu65ieYRQ
	FFsSiHTaA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPSAF-0000R7-II; Mon, 05 Oct 2020 15:12:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPSAB-0000Q9-Nf; Mon, 05 Oct 2020 15:12:32 +0000
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E246120774;
 Mon,  5 Oct 2020 15:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601910750;
 bh=OTdYwMEyL+J44FhDFfQgzJZxz6q76bc6Lh6jwKmwS5g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=nM7wmTlTuX8R6hHGqmal6NH3CaoOeFSQp8Aib7IWXtH2mBaqcaLd++9AwOC4SH3K8
 4fgb3X0TKzhJsFs+FrE50DinNtT/KbsYnShjJxhWAigmLKLS+BgGuAMzOgodQ7NX84
 dIAQsN+xG4L2W75I1bwD6AmzaOtU/KNMD28jjDI4=
Received: by mail-ej1-f46.google.com with SMTP id ly6so11235137ejb.8;
 Mon, 05 Oct 2020 08:12:29 -0700 (PDT)
X-Gm-Message-State: AOAM532/6oFbT/8qQnYGa41gWADFDjDhllotvNSEHH1d0SXN9F410jC5
 Bp+148cSbEGlkkBn9JNK7YPUdXmEEKmvO4K1cQ==
X-Google-Smtp-Source: ABdhPJxHcaGDOyyyIo/bjLD+yrWmGhwiaOGN1qPppcdcHTNE1w5AmntLhaCL61aXtfLjtQNitBu+7/fe7jtt0Cj46XE=
X-Received: by 2002:a17:906:3b8e:: with SMTP id
 u14mr162034ejf.127.1601910748378; 
 Mon, 05 Oct 2020 08:12:28 -0700 (PDT)
MIME-Version: 1.0
References: <20201004055024.23542-1-phil.chang@mediatek.com>
 <CAL_JsqJ4rTChMpn7F--fh1A6bOTZxR4rEM9bbA1rdetXmPDeVA@mail.gmail.com>
In-Reply-To: <CAL_JsqJ4rTChMpn7F--fh1A6bOTZxR4rEM9bbA1rdetXmPDeVA@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 5 Oct 2020 23:12:17 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-5M77vVXuSJiWJK5KVUFXg8m6u054z-CiwVhc1fheDtg@mail.gmail.com>
Message-ID: <CAAOTY_-5M77vVXuSJiWJK5KVUFXg8m6u054z-CiwVhc1fheDtg@mail.gmail.com>
Subject: Re: [PATCH] [PATCH] of_reserved_mem: Increase the number of reserved
 regions
To: Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_111232_011908_FD2152ED 
X-CRM114-Status: GOOD (  22.47  )
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
Cc: DTML <devicetree@vger.kernel.org>, Alix Wu <alix.wu@mediatek.com>,
 YJ Chiang <yj.chiang@mediatek.com>, Phil Chang <phil.chang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Joe Liu <joe.liu@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Frank Rowand <frowand.list@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIFJvYjoKClJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+IOaWvCAyMDIw5bm0MTDm
nIg15pelIOmAseS4gCDkuIvljYg5OjQ15a+r6YGT77yaCj4KPiBPbiBTdW4sIE9jdCA0LCAyMDIw
IGF0IDEyOjUwIEFNIFBoaWwgQ2hhbmcgPHBoaWwuY2hhbmdAbWVkaWF0ZWsuY29tPiB3cm90ZToK
PiA+Cj4gPiBDZXJ0YWluIFNvQ3MgbmVlZCB0byBzdXBwb3J0IGxhcmdlIGFtb3VudCBvZiByZXNl
cnZlZCBtZW1vcnkKPiA+IHJlZ2lvbnMsIGVzcGVjaWFsbHkgdG8gZm9sbG93IHRoZSBHS0kgcnVs
ZXMgZnJvbSBHb29nbGUuCj4gPiBJbiBNVEsgbmV3IFNvQyByZXF1aXJlcyBtb3JlIHRoYW4gNjgg
cmVnaW9ucyBvZiByZXNlcnZlZCBtZW1vcnkKPiA+IGZvciBlYWNoIElQJ3MgdXNhZ2UsIHN1Y2gg
YXMgbG9hZCBmaXJtd2FyZSB0byBzcGVjaWZpYyBzYXBjZSwKPgo+IHR5cG8KPgo+ID4gc28gdGhh
dCBuZWVkIHRvIHJlc2VydmUgbW9yZSByZWdpc2lvbnMKPgo+IHR5cG8uIE1pc3NpbmcgcHVuY3R1
YXRpb24uCj4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKb2UgTGl1IDxqb2UubGl1QG1lZGlhdGVr
LmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IFlKIENoaWFuZyA8eWouY2hpYW5nQG1lZGlhdGVrLmNv
bT4KPiA+IFNpZ25lZC1vZmYtYnk6IEFsaXggV3UgPGFsaXgud3VAbWVkaWF0ZWsuY29tPgo+ID4g
U2lnbmVkLW9mZi1ieTogUGhpbCBDaGFuZyA8cGhpbC5jaGFuZ0BtZWRpYXRlay5jb20+Cj4gPiAt
LS0KPiA+ICBkcml2ZXJzL29mL29mX3Jlc2VydmVkX21lbS5jIHwgMiArLQo+ID4gIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL29mL29mX3Jlc2VydmVkX21lbS5jIGIvZHJpdmVycy9vZi9vZl9yZXNlcnZlZF9t
ZW0uYwo+ID4gaW5kZXggNDZiOTM3MWM4YTMzLi41OTVmMDc0MWRjZWYgMTAwNjQ0Cj4gPiAtLS0g
YS9kcml2ZXJzL29mL29mX3Jlc2VydmVkX21lbS5jCj4gPiArKysgYi9kcml2ZXJzL29mL29mX3Jl
c2VydmVkX21lbS5jCj4gPiBAQCAtMjIsNyArMjIsNyBAQAo+ID4gICNpbmNsdWRlIDxsaW51eC9z
bGFiLmg+Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L21lbWJsb2NrLmg+Cj4gPgo+ID4gLSNkZWZpbmUg
TUFYX1JFU0VSVkVEX1JFR0lPTlMgICA2NAo+ID4gKyNkZWZpbmUgTUFYX1JFU0VSVkVEX1JFR0lP
TlMgICAxMjgKPgo+IEF0IHNvbWUgcG9pbnQsIHRoaXMgc3RhcnRzIHRvIGZlZWwgbGlrZSBhYnVz
ZSBvZiByZXNlcnZlZCByZWdpb25zLgo+IFBsZWFzZSBwcm92aWRlIGRldGFpbHMgb24gd2hhdCB0
aGUgcmVnaW9ucyBhcmUuCj4KPiBBbHNvLCB0aGlzIHByb2JhYmx5IGp1c3QgbmVlZHMgdG8gYmUg
ZHluYW1pYy4gSSB0aGluayB3ZSdyZSBhdCB0aGF0IHBvaW50LgoKSG93IGFib3V0IHVzaW5nIGEg
Y29uZmlnIGxpa2UgRFJNX0ZCREVWX09WRVJBTExPQyBbMV0gPwoKWzFdIGh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVl
L2RyaXZlcnMvZ3B1L2RybS9LY29uZmlnP2g9djUuOS1yYzgjbjEyNQoKUmVnYXJkcywKQ2h1bi1L
dWFuZy4KCj4KPiBSb2IKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Cj4gTGludXgtbWVkaWF0ZWtA
bGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbWVkaWF0ZWsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRl
a0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
