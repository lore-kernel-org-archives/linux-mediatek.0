Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8D7EC433E3
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 15:30:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AC742075E
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 15:30:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bgK5dd2D";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jAREpFEf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AC742075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Dg10EXo6CnZDTePg0xGUE4+DUd8EwG8ZPx4IXC4YAVM=; b=bgK5dd2DzRxSIJHJxfdnZR3V4
	W40DPZRYBe2cICqATy6KpTtedyn5Fo6exZgdLIXNRh7iPaKIURRhTMkq6AA/dZiR4S4AjUL9fccGw
	ApoII7qoKvQhpXLTHNnGBvbUVGlFg52tUKrsTG2diIVws3t+xHuX8BXuSJdblhxsEdLQTY43aV74s
	V5kP1sRn8uVquMxGdhD6DYL/ncwrz1ju8mMP9369MN0eAQGukie+uI1K9pf77VV+PA/ZALkjV06eE
	/2qNkremZL9qlZAzdztwRntb83EAGeODVOcHRt5xMdDqp4TNxRL1E++b/JTiDqfGkT8GHSXdv6sRu
	jBaUeYltQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8mVt-00018y-St; Thu, 20 Aug 2020 15:30:01 +0000
Received: from mail-oo1-xc41.google.com ([2607:f8b0:4864:20::c41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8mVr-000187-9o
 for linux-mediatek@lists.infradead.org; Thu, 20 Aug 2020 15:29:59 +0000
Received: by mail-oo1-xc41.google.com with SMTP id j16so500608ooc.7
 for <linux-mediatek@lists.infradead.org>; Thu, 20 Aug 2020 08:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/yqtf65S11ELAIVx4R8BLKLmTH1tLbD9UCR/sZvZEKk=;
 b=jAREpFEfMNb5oMhUoixf9Jrq/aReeZ/sSfs28vPtfXPSYU1MYT+K+Nde2CULpqkNpj
 THiYVv2o6OD/4P7lv1orzBjsicb0qiPftVJoPHBDYui8yt0j8Mv3yn58S6D5xhoJXqg7
 8/JVclUjjbAhwYPUJVQ4Wqx0s3YQSB0qpgbWVUOxQsGYEIlLZyeGWkkdUTeH/bWm+SMm
 7n+ebZZ+8HiU3VOPBvJr387CbM111pee6L5SV2vKj/z4Ho1KVcpF7ZUpU3x3JZMyvory
 aDtb/RKXr4WVLql96R1kjBQzp8NNdxcart33YdGOqn4vo+LbH1AgMh82C/c3ZrVpRD9k
 PFyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/yqtf65S11ELAIVx4R8BLKLmTH1tLbD9UCR/sZvZEKk=;
 b=qVmU75IWGcOqDgxqpUt9PMAxfb2pd5pa7SrbOFRWixvk6lZ0STk3V8YZmY0qr/niBl
 TVqdS5SnNjXr2xKYPMopgvM/EayRTm9pkkuTGurcqjHs0G8kQ2/Mc+JATOgBBThqGeY6
 KcSUTkqeNOktrmYVgX79UWWz1hXayzAIKQswpfqQfaf2RBJECWGZFfAaVJRqHlzb6z+Y
 b9Sk1cfHvAfvIOS4LbUPkbj7prmRGk175jaZFPa5s+FsV/PqwwP2igYTq08/f/Rtm96Q
 Na1Dkwb4abUS2D26kj8AuAEHH4Nx3LzQxYuq6VG6mJGOGcq84qu9JjZPMjQYUElx8Cc2
 uyNA==
X-Gm-Message-State: AOAM533UefviQHa4R2CXuOeR5543XbJGidcm/a5g4lIS8XHI65BO78Kr
 g8WPn9vw9YNj4sb/TpC/NXTDjiW+1vinp9A6Zeg=
X-Google-Smtp-Source: ABdhPJxWEBD7BQ8Ieo+CZJgYeO9KHw8pYzlife4uFB1RQS86vDTUEY2rg1dPJWpT9qsuSO51bDK9tpHPXb1spqDhOQo=
X-Received: by 2002:a4a:4594:: with SMTP id y142mr2797689ooa.24.1597937396316; 
 Thu, 20 Aug 2020 08:29:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1597729692.git.landen.chao@mediatek.com>
 <e980fda45e0fb478f55e72765643bb641f352c65.1597729692.git.landen.chao@mediatek.com>
 <20200818160901.GF2330298@lunn.ch> <1597830248.31846.78.camel@mtksdccf07>
 <20200819234613.Horde.oQiJhMCnUINwnQP-5_MyHh-@www.vdorst.com>
In-Reply-To: <20200819234613.Horde.oQiJhMCnUINwnQP-5_MyHh-@www.vdorst.com>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Thu, 20 Aug 2020 23:29:45 +0800
Message-ID: <CAJsYDVJM3A_5Fpp8ube-gOi-Nn-itf0MW6ePL0wM16_k67+x6g@mail.gmail.com>
Subject: Re: [PATCH net-next v2 5/7] net: dsa: mt7530: Add the support of
 MT7531 switch
To: =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_112959_379626_45362BC8 
X-CRM114-Status: GOOD (  14.38  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>,
 Landen Chao <landen.chao@mediatek.com>,
 Florian Fainelli <f.fainelli@gmail.com>, vivien.didelot@savoirfairelinux.com,
 netdev <netdev@vger.kernel.org>, Sean Wang <Sean.Wang@mediatek.com>,
 open list <linux-kernel@vger.kernel.org>, frank-w@public-files.de,
 DENG Qingfang <dqfext@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkhCgpPbiBUaHUsIEF1ZyAyMCwgMjAyMCBhdCA3OjU1IEFNIFJlbsOpIHZhbiBEb3JzdCA8b3Bl
bnNvdXJjZUB2ZG9yc3QuY29tPiB3cm90ZToKPgo+IFdpdGggdGhlIGN1cnJlbnQgbWFpbmxpbmUg
Y29kZSBbMV0sIHRoZSBkc2EgY29kZSB0cmllcyB0byBkZXRlY3QgaG93IHRoZSBNQUM1Cj4gaXMg
dXNlZC4gQWxsIHRoZSB0aHJlZSBtb2RlcyBhcmUgc3VwcG9ydGVkLiBNQUM1IC0+IFBIWTAsIE1B
QzUgLT4KPiBQSFk0LCBNQUM1IC0+Cj4gRVhURVJOQUwgUEhZIGFuZCBNQUM1IHRvIGV4dGVybmFs
IE1BQy4KPgo+IFdoZW4gTUFDNSBpcyBhIERTQSBwb3J0IGl0IHNraXBzIHNldHRpbmdzIHRoZSBk
ZWxheSBzZXR0aW5ncy4gU2VlIFsyXS4KPgo+IE1heWJlIHlvdSBjYW4gdXNlIGEgc2ltaWxhciBj
b25jZXB0LgoKQ3VycmVudCBkZXRlY3Rpb24gcmVsaWVzIG9uIGFuIGluY29ycmVjdCBhc3N1bXB0
aW9uIHRoYXQgbXQ3NTN4IHN3aXRjaAppcyBhbHdheXMgdXNlZCB3aXRoIG10a19ldGhfc29jLiBJ
dCdzIGEgcmVhbGx5IGhhY2t5IHNvbHV0aW9uIHRvIHVzZQpkdCBwcm9wZXJ0aWVzIHRoYXQgZG9u
J3QgYmVsb25nIHRvIHRoaXMgc3dpdGNoIGF0IGFsbCBhbmQgSSB0aGluayB0aGlzCmFwcHJvYWNo
IHNob3VsZCBub3QgYmUgZm9sbG93ZWQgZnVydGhlciBieSBmdXR1cmUgY29kZS4KVGhlIHVzYWdl
IG9mIG1hYzUgc2hvdWxkIGJlIGV4cGxpY2l0bHkgZGVmaW5lZCBhcyBhIGR0IHByb3BlcnR5CnVu
ZGVyIG10NzUzeCBub2RlLgotLSAKUmVnYXJkcywKQ2h1YW5ob25nIEd1bwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
