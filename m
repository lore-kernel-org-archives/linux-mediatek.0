Return-Path: <SRS0=zgIi=NR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2C49C432BE
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Aug 2021 00:33:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98F826108D
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Aug 2021 00:33:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 98F826108D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=48OEeGkW3/+Suf87jgNsbxIrOJXCqrgkVhpZTWdeFQk=; b=lanounJ/TUHXuF
	vwVz9GMHk4dc6g6vCHMg9MzYP9xGm1BBn9I/MipjBpUQGDpv3rXSnFnJLQdTxL0wScPGuD4WCaLl2
	GnyhmbWLEVSGDpUxZPKYME7zZKdtKZfpa6NgZE68uu+LSc6PDI5bRpHufNqYzXVSTO3ww7w7IrdZj
	9V5cy03xjw736xUJ9b59RWgUqBs3lwdHYHSPImArvjpRTaWVQgOiTxTuWgeB9tIZJrez5xiKaWcWT
	5qIbEvpJk1KhVp1dglF4utD+uUhtmUorWtMFHUvwVjHUs/+7Q258Uqsb/ED5s+ttoV3lMAdJYyrhi
	DEDfqCHYEbANm9ZBTJug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJ3Km-008nJc-Lq; Thu, 26 Aug 2021 00:33:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJ3KZ-008nHN-0A; Thu, 26 Aug 2021 00:33:20 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 16EAF610CE;
 Thu, 26 Aug 2021 00:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629937995;
 bh=SbycQ9kZqssax3PP+kHq0IDJta79FNerEMDO87wY3QM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=n9GhZ42ev+K3L8aZKa5NSttM7oT98wtFhKL2i5OgqQy7x2QJADHrUhgisvMKEb8Da
 006maSkL7oNvIaxWdePEmBp37JAZ/RUTm+d2r++UGsCe1lg1V0DFUCU/T5VM9tH5Yt
 Uy3l13oK2R1CmSmOWUF8KZ2/9INRPgvyug8zTaWkn5FaytsG/854/A0ub6wzs+RXto
 Oa4VFBwJVlABrDUvn2gyhKl/L95HSttYDW8gQTm/VX4YQGrO3e93zyJ/9uzc2FDhuq
 VCEAHbZomI+c0xNM3ied2ceWgM5qs7HULhNYG9DAaI+4xinD27aB6EYoLRnqIKuORN
 uYzEqBcDmFwmw==
Received: by mail-ed1-f45.google.com with SMTP id z19so1779257edi.9;
 Wed, 25 Aug 2021 17:33:14 -0700 (PDT)
X-Gm-Message-State: AOAM5326mrmQSa0h8DTCjQQfEo4sYFPaKlxcSN4Lr+86tywuziIPB+ix
 4KPDvnCEgsETWVhrE+fYoLOqJ7Fen/v9elFYIA==
X-Google-Smtp-Source: ABdhPJyBPuQaGp8lfnXeBg0U5q3Cqp6INUxGUp0eCq4GNnGDtFawyemhfYjZTPeZHt4IH5oA9wNJxuhramUAwgIbgtc=
X-Received: by 2002:aa7:d351:: with SMTP id m17mr1303182edr.72.1629937993715; 
 Wed, 25 Aug 2021 17:33:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210825102632.601614-1-enric.balletbo@collabora.com>
 <20210825122613.v3.6.I15e2419141a69b2e5c7e700c34d92a69df47e04d@changeid>
 <ebbe37cb0188a7ea23608569ab083e65e0f95df6.camel@pengutronix.de>
In-Reply-To: <ebbe37cb0188a7ea23608569ab083e65e0f95df6.camel@pengutronix.de>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 26 Aug 2021 08:33:02 +0800
X-Gmail-Original-Message-ID: <CAAOTY__wg+dWi-4v4evyuWp1EVfj2bap3xtsHZdGET4Jf-MgEw@mail.gmail.com>
Message-ID: <CAAOTY__wg+dWi-4v4evyuWp1EVfj2bap3xtsHZdGET4Jf-MgEw@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] soc: mediatek: mmsys: Add reset controller support
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>, 
 linux-kernel <linux-kernel@vger.kernel.org>,
 "Nancy.Lin" <nancy.lin@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Jitao Shi <jitao.shi@mediatek.com>, 
 Eizan Miyamoto <eizan@chromium.org>, Nicolas Boichat <drinkcat@chromium.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Collabora Kernel ML <kernel@collabora.com>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_173319_108268_E16264BB 
X-CRM114-Status: GOOD (  11.22  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

UGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4g5pa8IDIwMjHlubQ45pyIMjXm
l6Ug6YCx5LiJIOS4i+WNiDY6NDblr6vpgZPvvJoKPgo+IE9uIFdlZCwgMjAyMS0wOC0yNSBhdCAx
MjoyNiArMDIwMCwgRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSB3cm90ZToKPiA+IEFtb25nIG90aGVy
IGZlYXR1cmVzIHRoZSBtbXN5cyBkcml2ZXIgc2hvdWxkIGltcGxlbWVudCBhIHJlc2V0Cj4gPiBj
b250cm9sbGVyIHRvIGJlIGFibGUgdG8gcmVzZXQgZGlmZmVyZW50IGJpdHMgZnJvbSB0aGVpciBz
cGFjZS4KPiA+Cj4gPiBDYzogSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0ZWsuY29tPgo+ID4g
U3VnZ2VzdGVkLWJ5OiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KPiA+
IFNpZ25lZC1vZmYtYnk6IEVucmljIEJhbGxldGJvIGkgU2VycmEgPGVucmljLmJhbGxldGJvQGNv
bGxhYm9yYS5jb20+Cj4gPiBSZXZpZXdlZC1ieTogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5n
dXRyb25peC5kZT4KPiA+IC0tLQo+ID4KPiA+IChubyBjaGFuZ2VzIHNpbmNlIHYxKQo+ID4KPiA+
ICBkcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstbW1zeXMuYyB8IDY5ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrCj4gPiAgZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmggfCAg
MiArCj4KPiBDYzogTmFuY3kgLSB0aGlzIHBhdGNoIGNsYXNoZXMgd2l0aCBbMV0sIHBsZWFzZSBj
b29yZGluYXRlLgo+Cj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWFybS1rZXJu
ZWwvMjAyMTA4MjUxMDA1MzEuNTY1My0xMS1uYW5jeS5saW5AbWVkaWF0ZWsuY29tLwoKRW5yaWMn
cyBzZXJpZXMgaXMgYWxsIHJldmlld2VkIG9yIGFja2VkLCBzbyBJIHRoaW5rIE5hbmN5J3Mgc2Vy
aWVzCnNob3VsZCBiYXNlIG9uIEVucmljJ3Mgc2VyaWVzLgoKUmVnYXJkcywKQ2h1bi1LdWFuZy4K
Cj4KPiByZWdhcmRzCj4gUGhpbGlwcAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVr
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tZWRpYXRlawo=
