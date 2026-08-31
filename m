Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C85C61DD3
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Aug 2026 09:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0QBclJz4ZjOwafIIGP9vesiqXcHQH7lAQx5p2rWrCkA=; b=h43XM3JSJqsn3UUrmjC7KuKvW5
	GGVdhENwQ2D//yjhQPkBhlESVlZSNsg8OyOUy1IjG01ExMzvotA5IKLOBM9TC3bN2ohjKSJrNfivB
	s1WZpeIum8ZbjDhJN+43EaUTkuDUXi/fwYbNr/yJOZreOuL9oJ+oWuRJzk/MjI1hkdq9nA6+S7094
	NapYXr0b4phulGLEVxuUE/MWsom+avpSU2swipDauIhtHItVWd2JN1rIlNDM3y8vaBgzFxziaF1QE
	+0LcUfEHk2TMVxtpe4MN7JT53wkNSbsWg5/BmLpYRUc0zrmYZp43n49Ztz1ECxWgbGWSbeBdpGD2Q
	VIlF9fwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0xyL-00000008ymO-0sXt;
	Mon, 31 Aug 2026 09:06:33 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0xyJ-00000008ylg-1vSS
	for linux-mediatek@lists.infradead.org;
	Mon, 31 Aug 2026 09:06:32 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-84864086bfeso3369461b3a.1
        for <linux-mediatek@lists.infradead.org>; Mon, 31 Aug 2026 02:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788167190; x=1788771990; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0QBclJz4ZjOwafIIGP9vesiqXcHQH7lAQx5p2rWrCkA=;
        b=d4ynnbCllSByEPPpGj9JbMvWaFaezl8uQ02SdyLqYoiDGBpLlSqq7W8ifmlM/Ib50S
         ehHAVi/21w6VjFnEJTuLYu66V89LSwGC7ADhehHqeXVTdGI2PyPol2lC6HoMzLUQ1x26
         iFIO6qws32W9/O8jt59gBWySUl33nyGxcmodk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788167190; x=1788771990;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0QBclJz4ZjOwafIIGP9vesiqXcHQH7lAQx5p2rWrCkA=;
        b=WocUMcbmzIOwsEmUl2HgPqnmRT6eti5gdOcqt+qIsI1NDxTZiRb8McZ4OrXcYR7TCo
         8gnpkTo/DTRmEnIfdC65y3CZ0DhFSdVuxxjJDhMVA4aCbOoaasmwiKb3xSkFWaZeEcAh
         F6SWZvKtdV/gYt/9T52UQEmDu849aS3XuT5eOo+mEWJBVCdgEToCp4Nd9FOYffiB23KY
         qL8qMbem+t4zN1XjTw8mLEF3YpsDoNPq5xpXXHKAlM7P/FJE7GldLMh4WgqYL6PwfVjG
         922iYmXdDAI+/QTL/I8d/xlB7YKbBf5SN1acLpY6Pxr/G6MlhmZlrqaJJQuxykzdmmzN
         lUNA==
X-Forwarded-Encrypted: i=1; AHgh+RoziiSujuohyjo8rW+jhF/zwRFuXFNv8UtcPNy5XWhe3fAMniSM4vPFuy623bZy2cNUexuK6l4N3wg/RvVRaA==@lists.infradead.org
X-Gm-Message-State: AFuF++mahW7OqInb8hxBhV1Coa1Zeky4DFVMJxK5WlkKD1UQ65f/b/bt
	x9cxQRG/OxzhV/BZdGUQ0DIkJ/UmcqnVA9C2xro2Nr/0n75xM1YRARiHwS6P/S9K6uVM2aaXszv
	OliGdcmTP
X-Gm-Gg: AR+sD11lIqyf2p64JtsWD96wLgJAlPCSh/V4y7eqUXlQiOX0ZqaZYbPi999Kma/iE7l
	aJmy0sLGTXQEh8MO5iqbvU6mIPJyqr0V7NsjdCDD1nyfQ6znHFAmjZB4AGgfmsvQ9bTIMJhQLl5
	bS5kSMQmi1r2h3KsDAuuL8VEeiyeoiHQJaFpwIbmJg/scjqomEWQ/wbrZeOR9EpRoVwnr2VWW0b
	2NQ+FHYPmSpBnyV03cNgIoUQmm6ei34C0BJrIavfeREGoHF/7Iy1u+9PY9+yljIFQiQGwnWnetS
	y+NCL8fIS1i4cq3x6ZftuQ+GggvY4maxUqWWKn3J1BO5I0v70wmVk+r9FFzvLaCVqQkM191cw7b
	QC2W9CNOCoOP4YP0dYF7oE1is6u+TjgpuopSBN63H4LeA0Fr9kO5sFTb9/yMolfn3WuqrfP/8JL
	SQ18fb9uQnQgdAPikNtdFVed9Hxhhoyu8BNBsM0H1ngoBMeb0oH4KUCzMB/bolNqziW3oKckU67
	LX8Y0tATmO2Vt4oF1nkt4s30nd/pOyNdVVW
X-Received: by 2002:a05:6a00:3319:b0:851:fb36:a701 with SMTP id d2e1a72fcca58-8562879115cmr42751720b3a.7.1788167188295;
        Mon, 31 Aug 2026 02:06:28 -0700 (PDT)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com. [209.85.216.41])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8569cc4bba4sm3331103b3a.0.2026.08.31.02.06.27
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 02:06:28 -0700 (PDT)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38511175ad3so3291021a91.2
        for <linux-mediatek@lists.infradead.org>; Mon, 31 Aug 2026 02:06:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxGwxCITlQ1+49BgjNu30/DI/WO+/bS2hslEV821URdwrYYjq8NOrpzbfTNhswnBCbBER6pktQWfTTrb79ykQ==@lists.infradead.org
X-Received: by 2002:a17:90b:5905:b0:381:a766:efcb with SMTP id
 98e67ed59e1d1-396d0d7b94bmr39842739a91.4.1788167185477; Mon, 31 Aug 2026
 02:06:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260831-common_clk_mt8173-v1-1-2d7241f70379@chromium.org> <CAGXv+5HaxFCfe4FkPih4z_kPKc_k9=uighfoxjpD1r+KJ=PZ6A@mail.gmail.com>
In-Reply-To: <CAGXv+5HaxFCfe4FkPih4z_kPKc_k9=uighfoxjpD1r+KJ=PZ6A@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 31 Aug 2026 11:06:12 +0200
X-Gmail-Original-Message-ID: <CANiDSCsaQGe9cHCF=oYpWDHm8yP-S5qBnxP43k9YkWmW-iSH7g@mail.gmail.com>
X-Gm-Features: AcwNN1XQTqww76phd4AsllCU6mg1cRdglEfcZzeuamdPB_miugwlSSd3Y9nMY_k
Message-ID: <CANiDSCsaQGe9cHCF=oYpWDHm8yP-S5qBnxP43k9YkWmW-iSH7g@mail.gmail.com>
Subject: Re: [PATCH] clk: mediatek: Add missing depend for COMMON_CLK_MT8173
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Brian Masney <bmasney@redhat.com>, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_020631_504002_F847F2B1 
X-CRM114-Status: GOOD (  16.26  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Chen-Yu

On Mon, 31 Aug 2026 at 11:03, Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> On Mon, Aug 31, 2026 at 4:50=E2=80=AFPM Ricardo Ribalda <ribalda@chromium=
.org> wrote:
> >
> > PM_GENERIC_DOMAINS_OF depends on OF, by adding a select to it without
> > adding a depend on OF, the following warning is triggered:
> >
> > WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS_OF
> >   Depends on [n]: PM_GENERIC_DOMAINS [=3Dy] && OF [=3Dn]
> >   Selected by [y]:
> >   - COMMON_CLK_MT8173_MFGTOP [=3Dy] && COMMON_CLK [=3Dy] && (ARCH_MEDIA=
TEK || COMPILE_TEST [=3Dy]) && COMMON_CLK_MT8173 [=3Dy] && PM [=3Dy]
>
> I guess this happens on COMPILE_TEST=3Dy with !OF architectures.

It was triggered by media-ci.
https://gitlab.freedesktop.org/linux-media/users/hverkuil/-/pipelines/17368=
35/test_report?job_name=3Dconfigs

A way to repro is:
make allyesconfig
scripts/config -d OF
make olddefconfig

>
> > This patch explicitly adds a dependency on OF to solve this issue.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: ebd0b73d2137 ("clk: mediatek: Add mt8173-mfgtop driver")
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
>
> Thanks!



--=20
Ricardo Ribalda

