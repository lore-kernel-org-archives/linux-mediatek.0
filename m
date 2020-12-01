Return-Path: <SRS0=+qQs=FF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18C8EC64E7A
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Dec 2020 14:31:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9172F20757
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Dec 2020 14:31:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s5/oE25r";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="oMsqBM0R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9172F20757
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Xuhs/Jbu+b/eWF7LOplRJZPrHkWkONZq4COzdr8qLw8=; b=s5/oE25rSf2TDakKrLqJXlVa1
	5CvDixCSl+lLtG7JsIdcLFkDJzP0PQlUAazOy01ZzNWGSAFGdLoSuwYMvYc9LEVY6bYk0ZC/T9Kpd
	5Dci95HVfNbiMCHBjpQutH0HyYPuyiJH5i/zRTMKiy2cgB34MtPlqPJXduhpm2u/Soxp1N803+lsi
	gs2KMGiJ4ooiH+RTF6ET1AgLe+juCK4xGP81Fkuovwmu7bsxWt14HAt5JVpZ20XtMObdYeFszkDnC
	XnRtiPjvuNBnYL3a+DvyBD3Od1Mh0Qjej+rxj/z89MgeE/BNk37GJ5E1gWbSMhevNTlkH7jwGpF2l
	nf8RG7ZSw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kk6gV-00020D-GF; Tue, 01 Dec 2020 14:31:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kk6gO-0001xE-Iz
 for linux-mediatek@lists.infradead.org; Tue, 01 Dec 2020 14:31:12 +0000
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4D8192085B
 for <linux-mediatek@lists.infradead.org>; Tue,  1 Dec 2020 14:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606833067;
 bh=iKyVt3ei4IjF6uUcpgpDuCr1OPzvs8ktfZvmbaiq0V4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=oMsqBM0RKejCzfstwlt6YyEpaxDWsKgOG+o0IPk82w9kBAgkGtQL6ftCiJ8ERMZ2u
 cgwTOds2N8B26XkSvBv5MlYgDUiE9ylwA2mJ0qy/1mmvH+QikgJwL40rAjTzcrQnRt
 8tIXOjHigZTfKj6SbWHaYT2ryjk+BGEnLXZ0qT3E=
Received: by mail-ej1-f44.google.com with SMTP id m19so4462435ejj.11
 for <linux-mediatek@lists.infradead.org>; Tue, 01 Dec 2020 06:31:07 -0800 (PST)
X-Gm-Message-State: AOAM532kQ5O2bVpPRxeSCOxlqmrMvSVcHKKDDxb5vJ2yFLwIJ2tOpDBN
 ISL4G4t24DsiTJUrUSuwnYtfewQBFDp7cRzMcA==
X-Google-Smtp-Source: ABdhPJzlHxdV4VGqzoWpb7rYlMAdgwMJ1nH13c0Yed4GR1AZ/tKtVHvegqEicS3dnzhWhT9kSKQM68aoJzZdQwO0v8w=
X-Received: by 2002:a17:906:af0a:: with SMTP id
 lx10mr3263894ejb.75.1606833065729; 
 Tue, 01 Dec 2020 06:31:05 -0800 (PST)
MIME-Version: 1.0
References: <20201116231407.94-1-chunkuang.hu@kernel.org>
 <20201116231407.94-3-chunkuang.hu@kernel.org>
 <20201130103411.GN8403@vkoul-mobl>
In-Reply-To: <20201130103411.GN8403@vkoul-mobl>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 1 Dec 2020 22:30:54 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-Dkn_cwb39+G3SHJZdKdiBk9fsUWJN8sfM2fhLbVT8tg@mail.gmail.com>
Message-ID: <CAAOTY_-Dkn_cwb39+G3SHJZdKdiBk9fsUWJN8sfM2fhLbVT8tg@mail.gmail.com>
Subject: Re: [RESEND PATCH 2/3] phy: mediatek: Move mtk_mipi_dsi_phy driver
 into drivers/phy/mediatek folder
To: Vinod Koul <vkoul@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_093108_731768_890A0D72 
X-CRM114-Status: GOOD (  11.94  )
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
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Chunfeng Yun <chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIFZpbm9kOgoKVmlub2QgS291bCA8dmtvdWxAa2VybmVsLm9yZz4g5pa8IDIwMjDlubQxMeac
iDMw5pelIOmAseS4gCDkuIvljYg2OjM05a+r6YGT77yaCj4KPiBPbiAxNy0xMS0yMCwgMDc6MTQs
IENodW4tS3VhbmcgSHUgd3JvdGU6Cj4gPiBtdGtfbWlwaV9kc2lfcGh5IGlzIGN1cnJlbnRseSBw
bGFjZWQgaW5zaWRlIG1lZGlhdGVrIGRybSBkcml2ZXIsIGJ1dCBpdCdzCj4gPiBtb3JlIHN1aXRh
YmxlIHRvIHBsYWNlIGEgcGh5IGRyaXZlciBpbnRvIHBoeSBkcml2ZXIgZm9sZGVyLCBzbyBtb3Zl
Cj4gPiBtdGtfbWlwaV9kc2lfcGh5IGRyaXZlciBpbnRvIHBoeSBkcml2ZXIgZm9sZGVyLgo+Cj4g
QWNrZWQtQnk6IFZpbm9kIEtvdWwgPHZrb3VsQGtlcm5lbC5vcmc+Cj4KPiBJIGFtIHRoaW5raW5n
IHRoaXMgd291bGQgZ28gdGhydSBkcm0tdHJlZSwgaWYgbm90IGxldCBtZSBrbm93IEkgd291bGQK
PiBhcHBseSB0aGlzCgpBcHBsaWVkIHRvIG1lZGlhdGVrLWRybS1uZXh0IFsxXSwgdGhhbmtzLgoK
WzFdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2NodW5r
dWFuZy5odS9saW51eC5naXQvbG9nLz9oPW1lZGlhdGVrLWRybS1uZXh0CgpSZWdhcmRzLApDaHVu
LUt1YW5nLgoKPgo+IC0tCj4gflZpbm9kCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0
ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
