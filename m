Return-Path: <SRS0=Gsgc=KQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DB1AC47076
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 14:46:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CE9C613E6
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 14:46:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CE9C613E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eRwZJP4oGO3/2aVZFUm81i1ehUZmPX6vbZxk6B5MesY=; b=p3oTlv33FTh/m8EbpSQkVm88X2
	t5d2Atb9nXJn3bdyc8PWh09BxOI4do7hAxqIAO1CJSfxZj2fEuXB2zPmW5OGQfVAX3nIJ+yzppl5N
	XOf/EWm2z4ip5d/3DjGaFwlvNkWOiBhh7V78OkWPMIzfakVY2+d4gmN59zu/3imrpO27Uc+b+Uic2
	2C+G8+s35WImq7sU2ShpNW/plWYXCCH/HwbtKA9E2FrxPtZr1Hy1S6uqtcYTNDsOTJrOt5WJdC6oE
	QMgaLe79/QrN3/byPnsj3QGSksEtvnnYosJHoMPWeWBjB7zyuS9iGWzidjsfBUvAblp1NnQF0dovw
	1f0y491A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lk6Pf-005oGk-HR; Fri, 21 May 2021 14:46:07 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lk6PO-005oCq-Tx
 for linux-mediatek@desiato.infradead.org; Fri, 21 May 2021 14:45:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=uOsFDhv1c3rYeM/biOU1mt6E1GzqKW1CDuSDPJ87gBg=; b=KYeVi08jYGVdSU0R3rohdfIcCx
 LI/r7VbS+QVl0ueWBNN4oFruRU5ju0J7lMaFdO0HiuvsGUWyvTSiEe4sz64nGFee2FgboDPG8rNUd
 Ol9gpetHdcDkkqAemmz4h0pwZlntQmfehHBq04US0Z6k7PBYpMAVKRBiNT6PcA6W2hjp4pcGpeMWo
 ue3L7YESkVm/LZ5r03qUuRvQB28tmSMkysTW7BsWckl5zRQnJWq1dX/j+8j1qBcNo4mqg225xKERT
 N09divWL0in6wqJneQ6AQcgpI8Ruis2Hah4kPv3lnRqGx111lr/8OWuqt3kz6Ho3+O4XP+a9hmMGJ
 hEHkGmhA==;
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lk6PM-00HCbX-8I
 for linux-mediatek@lists.infradead.org; Fri, 21 May 2021 14:45:49 +0000
Received: by mail-lj1-x229.google.com with SMTP id f12so24249555ljp.2
 for <linux-mediatek@lists.infradead.org>; Fri, 21 May 2021 07:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uOsFDhv1c3rYeM/biOU1mt6E1GzqKW1CDuSDPJ87gBg=;
 b=n2qwyuP1LnEDqSwud8bOvkR68TEYaKqXc8oI/yr+qYo1V/9Y7mIX2FSlKzA192fIGi
 6R9nTLo1mKi0Z4iB8pCvyOf2RZBFi0wFr/Gg1P73WEDCGXJHPLuCTa2fs3wBjmGZ7oF6
 FyjzcW9iyakYrXjWjqP9cRvwkkjeloZ2tUrQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uOsFDhv1c3rYeM/biOU1mt6E1GzqKW1CDuSDPJ87gBg=;
 b=gKlBLDeZiG0whcgvSEwbeeJ10AkgvqvoDTpYk1ECRJZlAlBw93vgVVocU/JT8uYPDU
 X/NrRXn02eNjNc9bBLskxPWhDeKycXBl29fj8kosiIWwgJvm0Zz0agGodAc7nk4knAK6
 MpxbKc6Uo5ULJ4sguNp/zIYZbLr6mc+nZgMc86+CNGs2SoEG/68Ihj1hGDfXG4rQZ19F
 wWvk564ApaEFew371Msa6AHkYacRVgCFpiOfT6Cficod94xEYZy8D5ITV7J6nLib3+p/
 TfFJyusYDaAut9mAzFHd8Xs1ig7TaQD9acPhL6dc9Pmt4WOF3aK/0r45Hp4V8OLjO+x8
 cGDg==
X-Gm-Message-State: AOAM530UR/S39wZ+j4HqQtBgWCfaXbVrF4iOgvo+DxrYiZLUv83Tr8gl
 0pV+u71T4obdJlV9Xm3GjfZoZmiGJLuLCPA1ICoOjA==
X-Google-Smtp-Source: ABdhPJxANzTqCdHdUqkIIdiznQKltNQSijCrMEhvOw7yhFmeXbFanluhc0vMVcUKNnP3g3gOLA7OjrpUhlHnmL9o4SY=
X-Received: by 2002:a2e:a554:: with SMTP id e20mr6930274ljn.23.1621608342766; 
 Fri, 21 May 2021 07:45:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210521200038.v14.1.I9f45f5c1f975422d58b5904d11546349e9ccdc94@changeid>
In-Reply-To: <20210521200038.v14.1.I9f45f5c1f975422d58b5904d11546349e9ccdc94@changeid>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 21 May 2021 22:45:31 +0800
Message-ID: <CAGXv+5HX+Hw-S=8SQOy5hjMUxFM-oBFFESzh3LQTEVpy=54Aeg@mail.gmail.com>
Subject: Re: [PATCH v14] arm64: dts: mt8183: Add node for the Mali GPU
To: Nicolas Boichat <drinkcat@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
 Ezequiel Garcia <ezequiel@collabora.com>,
 Steven Price <steven.price@arm.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, hoegsberg@chromium.org, 
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, boris.brezillon@collabora.com, 
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, fshao@chromium.org,
 hsinyi@chromium.org, 
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210521_074548_329396_E6914288 
X-CRM114-Status: GOOD (  16.10  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

(Resent to all recipients)

On Fri, May 21, 2021 at 8:01 PM Nicolas Boichat <drinkcat@chromium.org> wrote:
>
> Add a basic GPU node for mt8183, as well as OPP table.
>
> Note that with the current panfrost driver, devfreq is not
> actually functional, as the we do not have platform-specific
> support for >1 supplies. Also, we are missing code to handle
> frequency change, as the GPU frequency needs to be switched
> away to a stable 26Mhz clock during the transition.
>
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> ---
> The binding we use with out-of-tree Mali drivers includes more
> clocks, this is used for devfreq: the out-of-tree driver switches
> clk_mux to clk_sub_parent (26Mhz), adjusts clk_main_parent, then
> switches clk_mux back to clk_main_parent:
> (see https://chromium.googlesource.com/chromiumos/third_party/kernel/+/chromeos-4.19/drivers/gpu/arm/midgard/platform/mediatek/mali_kbase_runtime_pm.c#423)
> clocks =
>         <&topckgen CLK_TOP_MFGPLL_CK>,
>         <&topckgen CLK_TOP_MUX_MFG>,
>         <&clk26m>,
>         <&mfgcfg CLK_MFG_BG3D>;
> clock-names =
>         "clk_main_parent",
>         "clk_mux",
>         "clk_sub_parent",
>         "subsys_mfg_cg";
> (based on discussions, this probably belongs in the clock core)
>
> This only matters for devfreq, that is disabled anyway as we don't
> have platform-specific code to handle >1 supplies.

Yes. This can be done with clk_notifiers. See

    https://elixir.bootlin.com/linux/latest/source/drivers/clk/sunxi-ng/ccu_mux.c#L261

for such an example.


ChenYu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
