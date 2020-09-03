Return-Path: <SRS0=sr8Z=CM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F651C43461
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2020 22:54:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C553220716
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2020 22:54:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W/pPa9Iz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="EmXfwBYt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C553220716
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gqJymvtp3oYeJapnSCXeh0oL9dow14bd8jJRu29n5KQ=; b=W/pPa9IzzCEHFTABrjzJGWEj6
	9iFR4DRZ6nkhn39eq2P4YYXTex393BvJmlNaIjAbANQY6JrR6BBliZ76jI9Ibrm+dYgyLBobKt2fV
	mYtPh3MrTkXQMvpSHoRGxqTnNG35jYW7enlWiOI+15WaBfm/KehYV3RnrnKeAOdZ8G7Kl5NtfEs2t
	peXr+adsC/SF6DOGHBgplpuFGSbUkYrYnrD7dNevdV8rWaGl7AGzL7ET18xeepraL0rVmYG86MzCk
	iCd0ZRY3SMXeD7HwKoH7aGnWFdY7RdpGYnWljPPNn5kUjJGnsX2TCTEhcS427MC8SNi8bUSbR0aky
	6DisP7Gjw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDy81-0005dy-BP; Thu, 03 Sep 2020 22:54:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDy7x-0005cf-9N; Thu, 03 Sep 2020 22:54:46 +0000
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8C6B020716;
 Thu,  3 Sep 2020 22:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599173683;
 bh=UXKo8kyys7Jj/KQr45tWL3zKiNH9QtHrNfzW2RvKWt0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=EmXfwBYt3D5p90EF4QL4KaB9rOBoRovhKKBkFVE8uGA5dui+0P8hxZrd3FY69Wliu
 TTk9c/A0IjU+NziYUsCaN76rxm3L/o0iaout5mKVSD5nkUgrmwzBBpATVKe/S5ftGP
 8y9pRGpGCh2RjzS9I/QpFRr1OIiFLmH8uoXa9OuQ=
Received: by mail-ed1-f54.google.com with SMTP id l21so4279847eds.7;
 Thu, 03 Sep 2020 15:54:43 -0700 (PDT)
X-Gm-Message-State: AOAM5313xNnyXIxOWfrh0pIevA4rumOj3FtYphlbbUVB337HM260hmND
 Tnbovcx92g3z282l/gFpGbRWL6YmLwuB1WLb3w==
X-Google-Smtp-Source: ABdhPJxV4e9JXF8pl9lR06Tx6AQ3q1ACWUDkZvY2hawRP5jIfK2LoCgaT7r5tM+Hy5bnYViKitxKW+Li7urVLN9lTTw=
X-Received: by 2002:aa7:dcd2:: with SMTP id w18mr5713705edu.288.1599173682230; 
 Thu, 03 Sep 2020 15:54:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200819081752.4805-1-linux@fw-web.de>
 <3B754053-BA89-4DB7-A089-665C5B6B34CC@public-files.de>
In-Reply-To: <3B754053-BA89-4DB7-A089-665C5B6B34CC@public-files.de>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 4 Sep 2020 06:54:30 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9TYUWWNg+1zT4LwomrabBsiZQKXAS9jTHCFKiAmCm4PA@mail.gmail.com>
Message-ID: <CAAOTY_9TYUWWNg+1zT4LwomrabBsiZQKXAS9jTHCFKiAmCm4PA@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] make hdmi work on bananapi-r2
To: Frank Wunderlich <frank-w@public-files.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200903_185445_397629_B90F5CAC 
X-CRM114-Status: GOOD (  10.16  )
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
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Frank Wunderlich <linux@fw-web.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

RnJhbmsgV3VuZGVybGljaCA8ZnJhbmstd0BwdWJsaWMtZmlsZXMuZGU+IOaWvCAyMDIw5bm0Oeac
iDPml6Ug6YCx5ZubIOS4i+WNiDExOjA35a+r6YGT77yaCj4KPiBIaQo+Cj4gQW55IG9waW5pb24g
YWJvdXQgRFRTIFBhdGNoZXM/IFdoaWNoIG1haW50YWluZXIgd2lsbCBpbmNsdWRlIGl0IGluIHRy
ZWU/IElzIGFueSBhY2svcmV2aWV3IG5lZWRlZD8KCkFjY29yZGluZyB0byBtYWludGFpbmVyIGxp
c3QgWzFdLCB0aGUgbWFpbnRhaW5lciBpcwoKQVJNL01lZGlhdGVrIFNvQyBzdXBwb3J0Ck06IE1h
dHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFpbC5jb20+Ckw6IGxpbnV4LWFybS1rZXJu
ZWxAbGlzdHMuaW5mcmFkZWFkLm9yZyAobW9kZXJhdGVkIGZvciBub24tc3Vic2NyaWJlcnMpCkw6
IGxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcgKG1vZGVyYXRlZCBmb3Igbm9uLXN1
YnNjcmliZXJzKQpTOiBNYWludGFpbmVkClc6IGh0dHBzOi8vbXRrLmJjbmZzLm9yZy8KQzogaXJj
Oi8vY2hhdC5mcmVlbm9kZS5uZXQvbGludXgtbWVkaWF0ZWsKRjogYXJjaC9hcm0vYm9vdC9kdHMv
bXQ2KgpGOiBhcmNoL2FybS9ib290L2R0cy9tdDcqCkY6IGFyY2gvYXJtL2Jvb3QvZHRzL210OCoK
RjogYXJjaC9hcm0vbWFjaC1tZWRpYXRlay8KRjogYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRl
ay8KRjogZHJpdmVycy9zb2MvbWVkaWF0ZWsvCk46IG10awpOOiBtdFs2NzhdCks6IG1lZGlhdGVr
CgoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KClsxXSBodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9s
aW51eC9NQUlOVEFJTkVSUwoKPiByZWdhcmRzIEZyYW5rCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGlu
dXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
