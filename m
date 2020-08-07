Return-Path: <SRS0=9FsO=BR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFD1CC433DF
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2020 10:16:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACF1720748
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2020 10:16:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ayNfKW4D";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z1dacVuD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACF1720748
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=r5Gw6S6/UfkJ+Fkc3rDm20aGU6Ri0iHj61T3MwiQUFc=; b=ayNfKW4DMClHfUBmMIsraCfD7
	qDJrJQ1egIKXdlaBKjaWNhOvyeoA0uTzolyGpiBa/bZt4O37hSwKnR7Vp6GSUhC5hPZXOMfHHJ7gj
	DbuVQNHEWolqhZlsNakHr5ugW6idxwBGUTOwZt5/ZUDuXzPOL1Oa4+6oKM80HTLt41AXu1BAQZgyH
	bS/F1x+l0izRCs/zAzFbvVpR0bebc9JWQg8GlT2CGGKp9+9vIWgdcGL/+uFmtUAMIGJF5kyaSEoSB
	uVN2Nfavus1UsiI2T1nOvJ7JXpO86GlYMnx8Boa3NPmIMkoV/8AY9pSxPgfEwmL6NnMM0gsykdkeL
	NkoYbGIqw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3zQH-0002Af-UP; Fri, 07 Aug 2020 10:16:26 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3zQD-00029F-Tq; Fri, 07 Aug 2020 10:16:22 +0000
Received: by mail-io1-xd41.google.com with SMTP id z6so1357348iow.6;
 Fri, 07 Aug 2020 03:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4f8OQgzuz+LDRnj85cC5d/U7jDFEqbHAdZ2qh7RY1sE=;
 b=Z1dacVuDCDo1gA3yUPlpW/LbuFZJcYNg+aJDk2w4/De7ZXN7/G5RDsXBsZF7PBD63g
 FOdXb6jZFwbKD9NzFDRXUGHI5OtBii6Yc5csOQzqJFWgTIZfho4A3mBkhRTXmquSsGqX
 do1nFqWajSwCs2xrA7dLDZrqb8Pfx0s+rP/c5zi4NOG5OffLBV9V+8ukkVbgSpToQTnP
 fIUNXF/YqOx3/fQXxlxp6QQSnVu2fQoC+0oTDAqOP7PqnhzZRtBfXL9kEQeU+GlFgkxG
 vdEgwbpg8vMx54H4ICkHGh/mx4/yrc75EPs7MWRCJhkADRivNQGeKlTwUqeXvZYXC4Mj
 hENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4f8OQgzuz+LDRnj85cC5d/U7jDFEqbHAdZ2qh7RY1sE=;
 b=alrS5tOY7hXubpmVeujaHjfL3XcxDo+jZrD7zuKcSD2DEmfBDNMUNh3hgw594Qxs50
 VqS+heLNEye/0a+dlWGaID12UfLu9QjwJWXzaWy5IPMX6IzcIh7C+dEKKAKhOnjiGS82
 TQlk4E4cTcd7YT4LnSz2hKvmBDWA6v1QnqlXa/VxDszoTx27XUXpwdj0EeeMWMlR/3f7
 0P0JYs5RkDcbmoAmR/bT0j3r9hujKWg1I07zz8TwaAOWvU6LFHIT/dhO8Pfz0xOVS7Wk
 9DZrnOMN/EoWjAQMsoXmF2kYkIAgcTbhseJa4BTs0Z70JGt0BZOEduRUIXx2TR4+yTGs
 pa+Q==
X-Gm-Message-State: AOAM530ZnMRpZvgrX5MA4fY1+7W4R8VNIaDuM60byPtZWurD2gC9Nzoz
 zwyj5FCaHaf+BJhQlN1CEWVZwilcIT9BRtBkrJ0=
X-Google-Smtp-Source: ABdhPJzL42pQp9UVI3P9+3/FhcnfKuTDlRv/YHFJ3dIcTa2PaRxJ1LUbsHUpGcm5Vh/p99rU8/3beFIAcRSrrLNaq+o=
X-Received: by 2002:a05:6638:1489:: with SMTP id
 j9mr4177977jak.22.1596795380033; 
 Fri, 07 Aug 2020 03:16:20 -0700 (PDT)
MIME-Version: 1.0
References: <1596558782-3415-1-git-send-email-gene.chen.richtek@gmail.com>
 <1596558782-3415-11-git-send-email-gene.chen.richtek@gmail.com>
 <20200805161021.GK5556@sirena.org.uk>
 <CAE+NS360iKLoGxiiz8NmQqCp2Uge98Eehe4g2sn_N0e-E3DgyQ@mail.gmail.com>
 <20200806121332.GB6442@sirena.org.uk>
In-Reply-To: <20200806121332.GB6442@sirena.org.uk>
From: Gene Chen <gene.chen.richtek@gmail.com>
Date: Fri, 7 Aug 2020 10:16:08 +0800
Message-ID: <CAE+NS37tr65GnTue89wJkPvJzddahKj__KPgzmjzwkOfWQnc8g@mail.gmail.com>
Subject: Re: [PATCH 9/9] mfd: mt6360: Merge different sub-devices I2C
 read/write
To: Mark Brown <broonie@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200807_061622_038647_364D98F5 
X-CRM114-Status: GOOD (  17.38  )
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
Cc: Gene Chen <gene_chen@richtek.com>, rafael@kernel.org,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 benjamin.chao@mediatek.com, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

TWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwub3JnPiDmlrwgMjAyMOW5tDjmnIg25pelIOmAseWb
myDkuIvljYg4OjEz5a+r6YGT77yaCj4KPiBPbiBUaHUsIEF1ZyAwNiwgMjAyMCBhdCAxMTozMDo1
NkFNICswODAwLCBHZW5lIENoZW4gd3JvdGU6Cj4gPiBNYXJrIEJyb3duIDxicm9vbmllQGtlcm5l
bC5vcmc+IOaWvCAyMDIw5bm0OOaciDbml6Ug6YCx5ZubIOS4iuWNiDEyOjEw5a+r6YGT77yaCj4K
PiA+ID4gSXQncyBub3QgY2xlYXIgd2h5IHRoaXMgaXNuJ3QganVzdCBkb25lIGluIHRoZSBkZXZp
Y2UgcmVnbWFwLCB0aGVyZSdzCj4gPiA+IGV4YWN0bHkgb25lIHVzZXI/Cj4KPiA+IGJlY2F1c2Ug
SSB1c2Ugb25lIHJlZ21hcCB0byBhY2Nlc3MgNCBJMkMgZGV2aWNlcywKPgo+IFRoZXJlIGFwcGVh
cnMgdG8gYmUgb25seSBvbmUgZGV2aWNlIGhlcmU/Cj4KPiA+IEkgbmVlZCBjaGFuZ2UgdGhlIHJl
Z21hcF9idXMgc3RydWN0IHRvIGZpdCBJMkMgcmVhZC93cml0ZSB3aXRoIENSQyBiaXQKPiA+IFRo
ZXJlZm9yZSwgTUZEIHJldmlld2VyIHN1Z2dlc3RzIEkgY2FuIG1vdmUgdGhlIHJlZ21hcCBhcGkg
dG8gcmVnbWFwCj4gPiBmb2xkZXIgc3VjaCBhcyByZWdtYXAtYWM5Ny5jCj4KPiBBQyc5NyBpcyBh
biBpbmR1c3RyeSBzdGFuZGFyZCBidXMgdXNlZCBieSBhIHJhbmdlIG9mIGRldmljZXMgaW4KPiBk
aWZmZXJlbnQgc3Vic3lzdGVtcy4gIFlvdSBjYW4gYWxyZWFkeSBoYXZlIGN1c3RvbSBvcGVyYXRp
b25zIGZvciBhCj4gZGV2aWNlIGp1c3QgaW4gYSByZWd1bGFyIHJlZ21hcCB1c2luZyB0aGUgcmVn
X3JlYWQoKSBhbmQgcmVnX3dyaXRlKCkKPiBvcGVyYXRpb25zIHdoaWNoIGFyZSB0aGVyZSBzbyBk
ZXZpY2VzIHRoYXQgaW5kaXZpZHVhbCBkZXZpY2Ugc3VwcG9ydAo+IGRvZXNuJ3QgbmVlZCB0byBi
ZSBhZGRlZCB0byB0aGUgcmVnbWFwIGNvcmUuCj4KCkkgbmVlZCB1c2UgcmVnbWFwX3Jhd19yZWFk
IHRvIGFjY2VzcyBNVDYzNjAgVFlQRUMgcGFydCwgc28gd2UgbmVlZAppbXBsZW1lbnQgYnVzIHJl
YWQgY29udHJvbAoKPiBZb3UgcmVhbGx5IGFsc28gbmVlZCB0byB3cml0ZSBhIG11Y2ggY2xlYXJl
ciBjaGFuZ2Vsb2csIEkgd291bGQgYmUgaGFyZAo+IHByZXNzZWQgdG8gdGVsbCBmcm9tIHRoZSBj
aGFuZ2Vsb2cgdGhhdCB0aGlzIHdhcyBtb3ZpbmcgdGhpbmdzIHRvIHRoZQo+IHJlZ21hcCBjb3Jl
IHJhdGhlciB0aGFuIHNodWZmbGluZyByZWdtYXBzIHdpdGhpbiB0aGUgZGV2aWNlLgoKTVQ2MzYw
IGhhcyA0IEkyQyB3b3JrZXIgZGV2aWNlcwpGaXJzdCwgSSBpbmNyZWFzZSByZWdfYml0cyBmcm9t
IDggdG8gMTYgYml0cy4KSGlnaGVyIDggYml0cywgYmFuaywgaW5kaWNhdGVkIHdoaWNoIHdvcmtl
ciBkZXZpY2UgSSB3YW50IGFjY2VzcwpUaGVuLCBpZiB3b3JrZXIgZGV2aWNlcyBpcyBQTUlDIG9y
IExETyBwYXJ0LCBJIG5lZWQgY2FsY3VsYXRlIG9yIGNoZWNrCkNSQzggYml0cyB3aGVuIHdlIHdy
aXRlIG9yIHJlYWQgZGF0YS4KQ1JDOCBiaXRzIGlzIGNhbGN1bGF0ZWQgYnkgMyBwYXJ0cy4KMSdz
dCBwYXJ0IGluY2x1ZGUgMSBieXRlIGlzIHdvcmtlciBhZGRyZXNzIGFuZCBSL1cgaW4gTFNCLgoy
J25kIHBhcnQgaW5jbHVkZSAxIGJ5dGUgaXMgcmVnaXN0ZXIgYWRkcmVzcwozJ25kIHBhcnQgaW5j
bHVkZSB3cml0dGVuIGRhdGEgb3IgcmVhZCBkYXRhIGZyb20gTVQ2MzYwCkkgYWxzbyBuZWVkIDEg
ZHVtbXkgYnl0ZSB3aGVuIHdyaXRlIGRhdGEKCkBMZWUgSm9uZXMsCkkgZm91bmQgb3V0IGRyaXZl
cnMvaWlvL2NoZW1pY2FsL2JtZTY4MF9zcGkuYyBpbXBsZW1lbnQgdGhlaXIgb3duCnJlZ21hcF9i
dXMgdG9vLgpDYW4gSSBtb3ZlIHJlZ21hcCBjb250cm9sIGJhY2sgdG8gbXQ2MzYwLWNvcmUuYz8K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1l
ZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
