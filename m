Return-Path: <SRS0=fB7w=DM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D127C4363A
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2020 23:17:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CF4720674
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Oct 2020 23:17:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VUhRVvIz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="H+b6kenM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CF4720674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iM5yslIkf0C36Mjbj53fspadIwp9b7tUei+dWkhTDrc=; b=VUhRVvIzIJHvn1aVUYmgSXNlu
	ACASPOKpnwi5dLan+yVUsBcfAGc8UGkTvQ4kMM8D/T37S8mXmwv5CJRp/BsDnu6dL/XEu98jeJGVz
	wHTPdPyCMJRGlssThzpBfUTd/iN4efpG9tRsb1CzTl4fUX8+bXwArtCATZVnVF+rEHWB8qI09YnvL
	NAR3ESbqVtS4/VbclgLohDOtj4Ke62LDQ+t/6I2/OAjz4sT+3fDNlw3EDHqbvOsHLXjR752I5PEhL
	WjPOtIfS46b3Cclu44RL2/ugLTzw6TiyuK4TyHFSq/Upm9vxFAgA3klJ9q/yV43T19637/29kUtC4
	FPbZBAzWw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPZiw-0002tP-7h; Mon, 05 Oct 2020 23:16:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPZiq-0002s0-Ev; Mon, 05 Oct 2020 23:16:49 +0000
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D98F020665;
 Mon,  5 Oct 2020 23:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601939807;
 bh=6DMPlpHNHe4zYX2cCxmqu0FZ0HVxYMhqiIb/DWSRMTI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=H+b6kenMeWsX9eq+4bPl2RCSDUICLwxdkRcGYM/TXz4OOuu1uD9NgoRzZIlFj5t0g
 gpu3fAOxggZHgfW5CRKUgDcavU8OJAeSsZnlHfeWDd51fiRlYIacqvMd3XebH5z4Lh
 ErQL7BIX8FSUiKiUFArd5+sy+lTGLB8TK3H5LiIM=
Received: by mail-ej1-f44.google.com with SMTP id c22so13316747ejx.0;
 Mon, 05 Oct 2020 16:16:46 -0700 (PDT)
X-Gm-Message-State: AOAM533ZAvGZ7Lj1lJxoqYbuTf5ccg7GwHAy+PpzUVz1KRUl0gdsSjeM
 VX1CNyWho743+as9cNcolKWA7G9/HcTh0mU4XQ==
X-Google-Smtp-Source: ABdhPJz+Lh5Br5zMq2O8/0TV2SM0C8V3geQcrgh1DjX05SgjXPF8trpetHJx9SOXrPdjPK+KRKeszl906LIvVUbBr4I=
X-Received: by 2002:a17:906:158f:: with SMTP id
 k15mr2114998ejd.310.1601939805305; 
 Mon, 05 Oct 2020 16:16:45 -0700 (PDT)
MIME-Version: 1.0
References: <20201004055024.23542-1-phil.chang@mediatek.com>
 <CAAOTY_8vCb-adkbpdmbTWLeOFt-+dHjr4HVonHX7XPkLkzy1yA@mail.gmail.com>
 <1601918237.17256.3.camel@mtksdccf07>
 <CAL_JsqJQcWsguwfehAoaRf4o-2VqXxSzKzTqg7s4+N1bp=6V5Q@mail.gmail.com>
In-Reply-To: <CAL_JsqJQcWsguwfehAoaRf4o-2VqXxSzKzTqg7s4+N1bp=6V5Q@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 6 Oct 2020 07:16:33 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8iGY_-_6iOxgigjbQc8k6iD38BAQiMi9vWEkddCGPJ9g@mail.gmail.com>
Message-ID: <CAAOTY_8iGY_-_6iOxgigjbQc8k6iD38BAQiMi9vWEkddCGPJ9g@mail.gmail.com>
Subject: Re: [PATCH] [PATCH] of_reserved_mem: Increase the number of reserved
 regions
To: Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_191648_645371_02F0F6C4 
X-CRM114-Status: GOOD (  32.95  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Alix Wu <alix.wu@mediatek.com>,
 DTML <devicetree@vger.kernel.org>, YJ Chiang <yj.chiang@mediatek.com>,
 Phil Chang <phil.chang@mediatek.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Joe Liu <joe.liu@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Frank Rowand <frowand.list@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Um9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz4g5pa8IDIwMjDlubQxMOaciDbml6Ug6YCx
5LqMIOS4iuWNiDI6NTflr6vpgZPvvJoKPgo+IE9uIE1vbiwgT2N0IDUsIDIwMjAgYXQgMTI6MTcg
UE0gUGhpbCBDaGFuZyA8cGhpbC5jaGFuZ0BtZWRpYXRlay5jb20+IHdyb3RlOgo+ID4KPiA+IEhp
IENodW4tS3VhbmcKPgo+IFBsZWFzZSBkb24ndCB0b3AgcG9zdCB0byB0aGUgbGlzdHMuCj4KPiA+
IFNvcnJ5IGZvciB0eXBvLiBJbiBmYWN0LCB0aGUgZHRzIG9mIG5ldyBTb0MgaXMgbm90IHVwc3Ry
ZWFtIHlldC4gSSdtIHNvCj4gPiBzb3JyeSBmb3IgY291bGRuJ3Qgc2hvdyB0aGUgZGV0YWlsIG5v
dy4KPgo+IERvbid0IGhhdmUgdG8gaGF2ZSB0aGUgZHRzIHVwc3RyZWFtLiBDYW4geW91IHBvaW50
IHRvIGEgZG93bnN0cmVhbSBkdHMKPiBvciBwb3N0IGEgc25pcHBldCBvZiB0aGUgcmVzZXJ2ZWQg
bWVtb3J5Pwo+Cj4gPiBIb3cgYWJvdXQgdGhlIGNvbmZpZ3VyYWJsZSBNQVhfUkVTRVJWRURfUkVH
SU9OUyBzaXplIGxpa2UgdGhpcyBwYXRjaD8KPiA+IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5v
cmcvcGF0Y2gvMTA2OTIxMDEvCj4KPiBObywgYXMgSSBhbHJlYWR5IHNhaWQgaW4gdGhhdCBwYXRj
aC4gQnV0IGdsYWQgeW91IGZvdW5kIHdoYXQncyBuZWVkZWQKPiB0byBtYWtlIGl0IGR5bmFtaWMu
IEJ1dCBldmVuIGZvciBkeW5hbWljLCBJIHdhbnQgdG8gdW5kZXJzdGFuZCB0aGUKPiB1c2UuCgpJ
IGdldCB0aGUgcG9pbnQuIFdlIHNob3VsZCBwcmV2ZW50IHRvbyBtYW55IGNvbmZpZy4gSWYgdGhp
cwppbmZvcm1hdGlvbiBjb3VsZCBiZSBnZXQgZnJvbSBkdHMsIHdlIHNob3VsZCBub3QgZ2V0IGl0
IGZyb20gY29uZmlnLgpBZ3JlZSB0aGF0IFdIWSBvZiB0aGlzIHBhdGNoIGlzIG1vcmUgaW1wb3J0
YW50IHRoYW4gSE9XIG9mIHRoaXMgcGF0Y2guCgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKPgo+IFJv
Ygo+Cj4gPgo+ID4KPiA+IE9uIFN1biwgMjAyMC0xMC0wNCBhdCAyMTowNSArMDgwMCwgQ2h1bi1L
dWFuZyBIdSB3cm90ZToKPiA+ID4gSGksIFBoaWw6Cj4gPiA+Cj4gPiA+IFBoaWwgQ2hhbmcgPHBo
aWwuY2hhbmdAbWVkaWF0ZWsuY29tPiDmlrwgMjAyMOW5tDEw5pyINOaXpSDpgLHml6Ug5LiL5Y2I
MTo1MeWvq+mBk++8mgo+ID4gPiA+Cj4gPiA+ID4gQ2VydGFpbiBTb0NzIG5lZWQgdG8gc3VwcG9y
dCBsYXJnZSBhbW91bnQgb2YgcmVzZXJ2ZWQgbWVtb3J5Cj4gPiA+ID4gcmVnaW9ucywgZXNwZWNp
YWxseSB0byBmb2xsb3cgdGhlIEdLSSBydWxlcyBmcm9tIEdvb2dsZS4KPiA+ID4gPiBJbiBNVEsg
bmV3IFNvQyByZXF1aXJlcyBtb3JlIHRoYW4gNjggcmVnaW9ucyBvZiByZXNlcnZlZCBtZW1vcnkK
PiA+ID4gPiBmb3IgZWFjaCBJUCdzIHVzYWdlLCBzdWNoIGFzIGxvYWQgZmlybXdhcmUgdG8gc3Bl
Y2lmaWMgc2FwY2UsCj4gPiA+Cj4gPiA+IHNwYWNlCj4gPiA+Cj4gPiA+ID4gc28gdGhhdCBuZWVk
IHRvIHJlc2VydmUgbW9yZSByZWdpc2lvbnMKPiA+ID4KPiA+ID4gcmVnaW9ucy4KPiA+ID4KPiA+
ID4gSSBndWVzcyB0aGlzIHJlcXVpcmVtZW50IGlzIGZyb20gTWVkaWF0ZWsgU29DLCBidXQgSSBm
aW5kIGJlbG93IGRldmljZQo+ID4gPiB0cmVlIGFuZCBqdXN0IGZpbmQgb25lIHJlc2VydmVkIG1l
bW9yeSByZWdpb24sCj4gPiA+Cj4gPiA+IGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ3
NjIyLmR0c2kKPiA+ID4gYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxNzMuZHRzaQo+
ID4gPiBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210ODUxNi5kdHNpCj4gPiA+Cj4gPiA+
IENvdWxkIHlvdSBzaG93IG1lIHRoZSA2OCByZWdpb25zPwo+ID4gPgo+ID4gPiBSZWdhcmRzLAo+
ID4gPiBDaHVuLUt1YW5nLgo+ID4gPgo+ID4gPiA+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogSm9l
IExpdSA8am9lLmxpdUBtZWRpYXRlay5jb20+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogWUogQ2hp
YW5nIDx5ai5jaGlhbmdAbWVkaWF0ZWsuY29tPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEFsaXgg
V3UgPGFsaXgud3VAbWVkaWF0ZWsuY29tPgo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFBoaWwgQ2hh
bmcgPHBoaWwuY2hhbmdAbWVkaWF0ZWsuY29tPgo+ID4gPiA+IC0tLQo+ID4gPiA+ICBkcml2ZXJz
L29mL29mX3Jlc2VydmVkX21lbS5jIHwgMiArLQo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+ID4gPgo+ID4gPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL29mL29mX3Jlc2VydmVkX21lbS5jIGIvZHJpdmVycy9vZi9vZl9yZXNlcnZlZF9tZW0u
Ywo+ID4gPiA+IGluZGV4IDQ2YjkzNzFjOGEzMy4uNTk1ZjA3NDFkY2VmIDEwMDY0NAo+ID4gPiA+
IC0tLSBhL2RyaXZlcnMvb2Yvb2ZfcmVzZXJ2ZWRfbWVtLmMKPiA+ID4gPiArKysgYi9kcml2ZXJz
L29mL29mX3Jlc2VydmVkX21lbS5jCj4gPiA+ID4gQEAgLTIyLDcgKzIyLDcgQEAKPiA+ID4gPiAg
I2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KPiA+ID4gPiAgI2luY2x1ZGUgPGxpbnV4L21lbWJsb2Nr
Lmg+Cj4gPiA+ID4KPiA+ID4gPiAtI2RlZmluZSBNQVhfUkVTRVJWRURfUkVHSU9OUyAgIDY0Cj4g
PiA+ID4gKyNkZWZpbmUgTUFYX1JFU0VSVkVEX1JFR0lPTlMgICAxMjgKPiA+ID4gPiAgc3RhdGlj
IHN0cnVjdCByZXNlcnZlZF9tZW0gcmVzZXJ2ZWRfbWVtW01BWF9SRVNFUlZFRF9SRUdJT05TXTsK
PiA+ID4gPiAgc3RhdGljIGludCByZXNlcnZlZF9tZW1fY291bnQ7Cj4gPiA+ID4KPiA+ID4gPiAt
LQo+ID4gPiA+IDIuMTguMAo+ID4gPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gPiA+ID4gTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Cj4gPiA+
ID4gTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4gPiA+IGh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsKPiA+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRl
ayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
