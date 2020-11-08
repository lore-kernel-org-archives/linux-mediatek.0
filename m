Return-Path: <SRS0=xa7l=EO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74DA9C388F9
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Nov 2020 03:05:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C74520874
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Nov 2020 03:05:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UmQs/lxQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="zew6Y5tg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C74520874
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=I9IN5xsFnPPa6hSpr4w3BOVdUknSyHfPTrYTOxQBrGk=; b=UmQs/lxQgy51JOxIDMRyX2n11
	fcpRv2plXEVyfbXGM/XUGtP+Q8AVFU4hA6VQDShzwvtRIDmSVGhh8BqhFDSyr6aEJSciAY/u4GYR8
	qqVxeIK63M8vPkSmRm0PhZXBMSXATqQ+0Xs7ihce8bv4+1sbxbXMr5x2GjslWRL3ykkSgELmLjbR6
	T0I3yOjhuXPhjzq9nrlOpsBucAMXFf/76pyp/Lgndpkk66uRcYcLcf4lCPbnn8dp5kJ1RViJER8Sa
	QJH9htdbzxubN1lAm1Dhg+TGOTzjQIeOTW6poCLobj4Ny7jomY7ljG20ul6WgiSUdF5sC1WtXBV4N
	EEcoIXoFw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbb11-0004d0-2k; Sun, 08 Nov 2020 03:05:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbb0y-0004cR-Lu
 for linux-mediatek@lists.infradead.org; Sun, 08 Nov 2020 03:05:13 +0000
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 37B74206D4
 for <linux-mediatek@lists.infradead.org>; Sun,  8 Nov 2020 03:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604804711;
 bh=HwITghqppKFjK26HFNkFvXzdMOfxOTH9bRWvBg0QmDA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=zew6Y5tgnmqimVGmhjui7F7w76KEAdyNu1Za/9t6I8gjZdqmAfTRoPh9BQvwRd2po
 yJBMALuqPFJQq4IejLTs6CIemdiI0+NiWHGJrsSyBjBFZq+AxlZDYivbjT/6BG9QfJ
 wt7WfgSnjIiVG7oFEV59dfnvP1IEeXVLiri1HdoQ=
Received: by mail-ej1-f48.google.com with SMTP id o21so7416090ejb.3
 for <linux-mediatek@lists.infradead.org>; Sat, 07 Nov 2020 19:05:11 -0800 (PST)
X-Gm-Message-State: AOAM532pJftZuE5JwfTI8LOrEEwkp6JamsnMnrzuJ4FKl7sILlgxMMrm
 aCos/GBq4Vru4HbysSC3AvujuLDWasnMG+nNdg==
X-Google-Smtp-Source: ABdhPJzbNJEGNS5slZvCdTXT5PYfqc0qF0yuXh8J6e6Kixynl26cfxzASzgrH63HJNSCBrDaCRKHuQZqNbURrIa1gHw=
X-Received: by 2002:a17:906:6d0:: with SMTP id
 v16mr8726811ejb.310.1604804709851; 
 Sat, 07 Nov 2020 19:05:09 -0800 (PST)
MIME-Version: 1.0
References: <20201029152702.533-1-chunkuang.hu@kernel.org>
 <20201029152702.533-4-chunkuang.hu@kernel.org>
In-Reply-To: <20201029152702.533-4-chunkuang.hu@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 8 Nov 2020 11:04:59 +0800
X-Gmail-Original-Message-ID: <CAAOTY__ZRLubBfNtMFMax8SubM9f9iKLXGzS+bXseXcd9V0Smg@mail.gmail.com>
Message-ID: <CAAOTY__ZRLubBfNtMFMax8SubM9f9iKLXGzS+bXseXcd9V0Smg@mail.gmail.com>
Subject: Re: [PATCH 3/3] MAINTAINERS: add files for Mediatek DRM drivers
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201107_220512_781514_E1B415C4 
X-CRM114-Status: GOOD (  17.55  )
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
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

KyBWaW5vZDoKCkhpLCBDaHVuZmVuZzoKCkNodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJu
ZWwub3JnPiDmlrwgMjAyMOW5tDEw5pyIMjnml6Ug6YCx5ZubIOS4i+WNiDExOjI45a+r6YGT77ya
Cj4KPiBNZWRpYXRlayBNSVBJIERTSSBwaHkgZHJpdmVyIGlzIG1vdmVkIGZyb20gZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrIHRvCj4gZHJpdmVycy9waHkvbWVkaWF0ZWssIHNvIGFkZCB0aGUgbmV3
IGZvbGRlciB0byB0aGUgTWVkaWF0ZWsgRFJNIGRyaXZlcnMnCj4gaW5mb3JtYXRpb24uCgpXb3Vs
ZCB5b3UgbGlrZSB0aGlzIHBhdGNoPyBJZiBzbywgeW91IGNvdWxkIGdpdmUgYW4gYWNrZWQtYnkg
dGFnIG9uCnRoaXMgcGF0Y2gsIHNvIEkgY291bGQgYXBwbGllZCB0aGUgd2hvbGUgc2VyaWVzIGlu
dG8gbXkgdHJlZS4KClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2h1
bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cj4gLS0tCj4gIE1BSU5UQUlORVJT
IHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Cj4gZGlmZiAtLWdpdCBh
L01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKPiBpbmRleCBlNzM2MzZiNzVmMjkuLjE0ZjUwMThj
MDFiNiAxMDA2NDQKPiAtLS0gYS9NQUlOVEFJTkVSUwo+ICsrKyBiL01BSU5UQUlORVJTCj4gQEAg
LTU4NjcsNiArNTg2Nyw3IEBAIFM6ICAgICAgICBTdXBwb3J0ZWQKPiAgRjogICAgIERvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrLwo+ICBGOiAgICAgZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrLwo+ICBGOiAgICAgZHJpdmVycy9waHkvbWVkaWF0ZWsvcGh5
LW10ay1oZG1pKgo+ICtGOiAgICAgZHJpdmVycy9waHkvbWVkaWF0ZWsvcGh5LW10ay1taXBpKgo+
Cj4gIERSTSBEUklWRVJTIEZPUiBOVklESUEgVEVHUkEKPiAgTTogICAgIFRoaWVycnkgUmVkaW5n
IDx0aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20+Cj4gLS0KPiAyLjE3LjEKPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
