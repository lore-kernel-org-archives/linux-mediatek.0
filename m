Return-Path: <SRS0=xa7l=EO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 960FDC388F9
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Nov 2020 01:54:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10E4720704
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Nov 2020 01:54:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L3r3K1w4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="cdVBU0e2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10E4720704
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XqpWArO7/maC7r7YArB+iJ58zGrbyrOWiU14t1DuA+8=; b=L3r3K1w4pEbKDXh7BOF1hLBX6
	SkHwm6xvBfkdIqgxZWaDl8SvzmKEquWbN18JFlc2Nmg9hoifQRRpNsUaVWmtvsa6KZN2cnqGxkvl9
	zLNheetxNpknbnZPMuXM0xlVpjlqIYvB1JgMaSecWUnAeJzQBa7qCZpaZYkUhlf+cxUxjWzYvwmYK
	OuMGwgKCEUTVrHZbMxmkJMoyIc/FeL6D63Ql0k+J76t57/XL04wQ0aJHa+gJ0oaWXGqB1NVTFadmb
	P5cUIzGuDQYW0t6FzRHl+nfriUZ5Kjh7Ds4KtPFE2LSwjlSThMY1XK/vNRatpXdung4K+CpXravUe
	ducYy6Ohg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbZu0-0000SZ-3q; Sun, 08 Nov 2020 01:53:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbZtu-0000RE-C9; Sun, 08 Nov 2020 01:53:51 +0000
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CF154207C3;
 Sun,  8 Nov 2020 01:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604800428;
 bh=Gig2SIDrt7cb+ATUHWOVvdgio0+3OMp/2fZUD1joO84=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cdVBU0e2I4Ed0XKksB5eDB0tzB3II0mmnjw10uFt7lv1lc3pFe46KCHonZnxvvaDc
 /i0eXcxbTCUrvG5hxSbXsdQeqVozcJagfUSIRqLXak+ZsDqXvTZP+Y47LHFx1SAW4Y
 ptL7fc3qvGxSIhIgk7IXsq9Gnf67/O9RP4vEXkKM=
Received: by mail-ej1-f41.google.com with SMTP id za3so7307515ejb.5;
 Sat, 07 Nov 2020 17:53:47 -0800 (PST)
X-Gm-Message-State: AOAM532LfUfFivU0wMObBYWK1v6NNdr1b5hGvOTtx8VYl1TDji0+YYi2
 Mrf9S9jlPkBlznKh1tv8Amh5Wo69fdpJoGpUlw==
X-Google-Smtp-Source: ABdhPJw+JMkdcxFi2E62CLyHrr1EHcjqGBZXOrhKRS2LNp5+RUTgSOC9eBSIEnz/5eF5WsZ+Jh1CBEJHez0gc15GkMQ=
X-Received: by 2002:a17:906:cc4f:: with SMTP id
 mm15mr8912480ejb.267.1604800426455; 
 Sat, 07 Nov 2020 17:53:46 -0800 (PST)
MIME-Version: 1.0
References: <20201023133130.194140-1-fparent@baylibre.com>
 <20201023133130.194140-2-fparent@baylibre.com>
 <20201030154944.GA3905431@bogus>
In-Reply-To: <20201030154944.GA3905431@bogus>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 8 Nov 2020 09:53:36 +0800
X-Gmail-Original-Message-ID: <CAAOTY__vuGYRi+_8Aokko9JmPN1-nvrsWSdBW3Tij6raKe-cHg@mail.gmail.com>
Message-ID: <CAAOTY__vuGYRi+_8Aokko9JmPN1-nvrsWSdBW3Tij6raKe-cHg@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: display: mediatek: disp: add
 documentation for MT8167 SoC
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201107_205350_488960_446E43CC 
X-CRM114-Status: GOOD (  15.51  )
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
Cc: DTML <devicetree@vger.kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEZhYmllbjoKClJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+IOaWvCAyMDIw5bm0MTDm
nIgzMOaXpSDpgLHkupQg5LiL5Y2IMTE6NDnlr6vpgZPvvJoKPgo+IE9uIEZyaSwgMjMgT2N0IDIw
MjAgMTU6MzE6MjYgKzAyMDAsIEZhYmllbiBQYXJlbnQgd3JvdGU6Cj4gPiBBZGQgYmluZGluZyBk
b2N1bWVudGF0aW9uIGZvciB0aGUgTVQ4MTY3IFNvQwoKRm9yIHRoaXMgcGF0Y2gsIGFwcGxpZWQg
dG8gbWVkaWF0ZWstZHJtLW5leHQgWzFdLCB0aGFua3MuCgpbMV0gaHR0cHM6Ly9naXQua2VybmVs
Lm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvY2h1bmt1YW5nLmh1L2xpbnV4LmdpdC9sb2cv
P2g9bWVkaWF0ZWstZHJtLW5leHQKClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+ID4KPiA+IFNpZ25l
ZC1vZmYtYnk6IEZhYmllbiBQYXJlbnQgPGZwYXJlbnRAYmF5bGlicmUuY29tPgo+ID4gUmV2aWV3
ZWQtYnk6IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgo+ID4gLS0tCj4g
Pgo+ID4gQ2hhbmdlbG9nOgo+ID4KPiA+IFYyOiBObyBjaGFuZ2UKPiA+Cj4gPiAgLi4uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dCAgICB8IDQg
KystLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
Cj4gPgo+Cj4gQWNrZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBt
YWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
