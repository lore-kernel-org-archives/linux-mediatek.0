Return-Path: <SRS0=xkEi=CF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF6D7C433E6
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 23:46:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAEB1207F7
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 23:46:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l5CMqXc5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="tBi+YX5J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAEB1207F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qV6OndjoiEKJRw4DsObUeCOgKoSdgCUaa61OcVHg3zc=; b=l5CMqXc52kidBWUtsk3M9AmOl
	INKVSN5+1gGCU2b/gwMhCCMaWaZl1tF9VeuJVQ/mcpSSp/BNs4i3ZU3HjRfY5hiO4adrkwJB89o1H
	QR7nrUNkyiSqJna8z7gEcr9RbLwjRc/IBhVlb7uJvQKC1njZTpZFTtg5i1k0kGAV7qw56sVUpIgJS
	smR2V3WtRqOwP+yv9Faya4OJOsCJoopOC0htUuNSc97lLqb0qf6RiTcoAZaKq6ZB1+9NaV0+0uusG
	I4OKgxs8cLMVGBzgXFfRNtoki6XtE5tlRR3/66D7NnKOu18llzje6djNaSmHS/Phdj11FJeki15MM
	uR9X6IX7A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBRb9-0007Aa-1j; Thu, 27 Aug 2020 23:46:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBRb4-00078k-5n; Thu, 27 Aug 2020 23:46:22 +0000
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2700620B80;
 Thu, 27 Aug 2020 23:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598571981;
 bh=WuN9B34LzV+WTdN5AAx7tMjnWGBPJVTM+zsy0W61vqI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tBi+YX5JtPQczBiO05W9F5ZP739Ts1GRyM8mvOvl/GR8Cm7ZQmsuGKUPaSTzAdU05
 wSGs1hpiFVtz1EpSoDjhL5S6gs1D3esyPeMTuMdkbpn1Dmjg60I3T79rJmgGVRtAJz
 un3M6jy9tqRSbFPbQJasWRxguUndBWATe52iDdts=
Received: by mail-ej1-f53.google.com with SMTP id si26so9950435ejb.12;
 Thu, 27 Aug 2020 16:46:21 -0700 (PDT)
X-Gm-Message-State: AOAM533M5Nl2zA46XZGgexD5Dwa+8uBDoztj0hxOb1Q58uql4J8Addci
 hnJ0BbfoGZkSh3Xj+7V46H8uUiKmeq6oPpJwEg==
X-Google-Smtp-Source: ABdhPJwOl/tRuPJoLPgbirz4Djn6rAAeOTWUMMwHZS2nr/HOlGX4LL/IA2S6rKrQkxqp557HPNIsWsEIZg6W73JHyf8=
X-Received: by 2002:a17:906:15cc:: with SMTP id
 l12mr24340249ejd.7.1598571979711; 
 Thu, 27 Aug 2020 16:46:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200819081752.4805-1-linux@fw-web.de>
 <20200819081752.4805-4-linux@fw-web.de>
 <trinity-14a1b182-38ab-4f84-bb72-94d448b05fd5-1597994235320@3c-app-gmx-bs37>
 <81276d4c-8883-8bfd-d7d0-9b9ac025ed97@gmail.com>
 <trinity-ddd51146-41eb-49ae-9456-4588450d31aa-1598535710011@3c-app-gmx-bap26>
 <e0edfd9f-5916-80ee-3bef-92d7050f97db@gmail.com>
In-Reply-To: <e0edfd9f-5916-80ee-3bef-92d7050f97db@gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 28 Aug 2020 07:46:07 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9R24-tcAMSfDhxLEXDFPAbMd5fYm8EwGODDMpULq-UZA@mail.gmail.com>
Message-ID: <CAAOTY_9R24-tcAMSfDhxLEXDFPAbMd5fYm8EwGODDMpULq-UZA@mail.gmail.com>
Subject: Re: Aw: Re: [PATCH v5 3/7] drm/mediatek: disable tmds on mt2701
To: Matthias Brugger <matthias.bgg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_194622_304744_15BB3D7A 
X-CRM114-Status: GOOD (  14.05  )
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
Cc: chunkuang Hu <chunkuang.hu@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Frank Wunderlich <frank-w@public-files.de>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Wunderlich <linux@fw-web.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEZyYW5rOgoKTWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT4g5pa8
IDIwMjDlubQ45pyIMjfml6Ug6YCx5ZubIOS4i+WNiDEwOjI45a+r6YGT77yaCj4KPgo+Cj4gT24g
MjcvMDgvMjAyMCAxNTo0MSwgRnJhbmsgV3VuZGVybGljaCB3cm90ZToKPiA+IEhpIE1hdHRoaWFz
LAo+ID4KPiA+IGFueSBvcGluaW9ucyBhYm91dCB0aGUgZHRzLWNoYW5nZXM/Cj4gPgo+Cj4gdGhl
eSBsb29rIGdvb2QgdG8gbWUuCj4KPiA+IG1heWJlIHNlcmllcyBleGNlcHQgdGhlIHRtZHMtUGF0
Y2ggZ2V0IG1lcmdlZC4uLnNvIGkgYWRkIGl0IG9ubHkgdG8gbXkgb3duIHJlcG8gdGlsbCB3ZSBm
aW5kIGEgYmV0dGVyIHdheT8KPiA+IGN1cnJlbnRseSBtYWlubGluZSBkb2VzIG5vdCBzdXBwb3J0
IGhkbWkgYXQgYWxsIGZvciB0aGUgYm9hcmQuIHRoZSB0bWRzLXBhdGNoIGlzIG9ubHkgYSBmaXgg
Zm9yIHNwZWNpZmljIHJlc29sdXRpb25zIHdoaWNoIGhhdmUgYSAiZmxpY2tlcmluZyIgd2l0aG91
dCB0aGlzIFBhdGNoLgo+ID4KPgo+IFdlbGwgbGV0J3Mgc2VlIHdoYXQgQ0sncyBvcGluaW9uLgo+
CgpCZWNhdXNlIG5vIG9uZSBoYXMgY29tbWVudCBvbiB0aGlzIHBhdGNoLCBJIGNvdWxkIGFwcGx5
IHRoaXMgcGF0Y2ggYnV0CkkgbmVlZCB5b3UgdG8gYWRkIG1vcmUgZXhwZXJpbWVudCBpbmZvcm1h
dGlvbiBzbyBpZiBzb21lb25lIG1lZXRzCmFub3RoZXIgYnVnLCBoZSBjb3VsZCBmaXggaGlzIGJ1
ZyBhbmQgY29uc2lkZXIgeW91ciBwcm9ibGVtLgoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4gUmVn
YXJkcywKPiBNYXR0aGlhcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tZWRpYXRlawo=
