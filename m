Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E93C27C5E
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jun 2024 08:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xaQ5c2kG2ytdMjulncJeOQcMPePJzL39OYVmshUn2sU=; b=3Gk5kz5Z3LZubmLWzUYvgMgMau
	e7dOPzo62KskSsUJfyAfGAbmfn6eA5ZnF0rbkQpsbHXGf/Y9tcWDdtB7W3aKRffaAqJCx/ndPZHTH
	kV+wf+DMlpOuzREWFMKMXGmLOJ+xgeccptVJO+vNbcUeaZNekJdN8Yjh7MHTnV+eA+BZHqil29Ct1
	UATuQPbE7TUZ/XHUyDT5G6B9I7QtRmFJPg0nLXte3hluItCHmPPxXWhO+G62O5DLvSCiYibM7vyPk
	uRBUfflL3NcHFyxVke3K0G95PLoLMySu8txJJFAQ1vlHhORpQ5iyVGfZ2Dbzoojgz1PIMtO71tqkH
	uvVEyUQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGwT0-00000007xl2-375p;
	Tue, 11 Jun 2024 08:02:54 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGwSo-00000007xeb-1Uzp
	for linux-mediatek@lists.infradead.org;
	Tue, 11 Jun 2024 08:02:52 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4217f2e3450so24009905e9.1
        for <linux-mediatek@lists.infradead.org>; Tue, 11 Jun 2024 01:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718092960; x=1718697760; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xaQ5c2kG2ytdMjulncJeOQcMPePJzL39OYVmshUn2sU=;
        b=DpztOwVoLyaXZKm4dW9dGez8TyG7Vc8WyryhdNGq2tvbVgZSLeBccaTyucn6M/9kZ3
         8Qetqjy9FLFgmjb3+FOuN1FYgI3I2Ge6bHo00R1TghZlq8MUG7l6U8k9N9ZVUarMPPQB
         utUrWLZAPUbCrZty9un4ZuDVuTEHtAslkyTzX8KPcPT1ZamiTQHNVjko6bVogZIihy6f
         dlPKTY2XqGROb6vIlNmcoTzUk4sfzIL04UNbBOuGbTUej8DLrgAk+dgXOEIWbH4xnTNv
         sj3EYKGXyPqWq5W9QMginCLXKZZIubKdOPJPXgf7SzOh032OC6ASfZhPAULelqokHa+a
         TtDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718092960; x=1718697760;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xaQ5c2kG2ytdMjulncJeOQcMPePJzL39OYVmshUn2sU=;
        b=t23Ar2+JeRr0lNgI5Eswbic5IvFKSBVbdG+xn+pzw8rc4zmxznFos7LmaEnLKQjcci
         u/j2qupb6dRBQEYyBFc/zEGJ5VabaCEEWoWePdTBHl+2f+TS6luO4Oyn8bbl/fA0Ay38
         llMYKyaIJY951ZuWJCUORTb5BG1+xGOghEMThfpvCv5QiZOUiEFcIrK5ee+u9k4u66iV
         HlRr7APjPJTeslZIw/E0WyPZ0skTWWUU8F5JN0lZqrFaC5HCsSNtOV22Ixt/HUIri7yM
         Rqo5Wta/S9qVuorqdRx4G5l1f5GeaBDMNDMEqsjWfd2osA7Td3vcz7TlA4ZLprMaZsjD
         j/yA==
X-Forwarded-Encrypted: i=1; AJvYcCWJEqXEDmbL9x0dGyRZnD2WMRNQ1gL9pDGGiVPihRj+ktGoksE9oweXP5Z721mMOr8BcBXopZHW+6xagQOvlVdJjgYM+xguw4VwyDrRLDRr5VQu
X-Gm-Message-State: AOJu0YzdE8U/TVlOe1dkuEWd33d+ythR6EMJ6UJSrA6HHquQYtzTL25l
	j7WW4KnTLKsPTeBT3fGAmPB+0ZhFnfgI0AfhWWzBaoKfA4iKmwsa5kfBczrCrJs=
X-Google-Smtp-Source: AGHT+IGN24Aa+RfBIcyXuUKjwh6U0g7ybW6UT5cPP0P3069MO/9Je7HQzSudTLcIQu+deT23iTKWJA==
X-Received: by 2002:a05:600c:45c4:b0:421:29cd:5c95 with SMTP id 5b1f17b1804b1-421649fba60mr129661095e9.10.1718092958704;
        Tue, 11 Jun 2024 01:02:38 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421727aac08sm126706925e9.43.2024.06.11.01.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 01:02:38 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Douglas Anderson <dianders@chromium.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
 Chris Morgan <macromorgan@hotmail.com>, 
 Yuran Pereira <yuran.pereira@hotmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Jonathan Corbet <corbet@lwn.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Robert Chiras <robert.chiras@nxp.com>, Stefan Mavrodiev <stefan@olimex.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20240605002401.2848541-1-dianders@chromium.org>
References: <20240605002401.2848541-1-dianders@chromium.org>
Subject: Re: (subset) [PATCH v3 00/24] drm/panel: Remove most
 store/double-check of prepared/enabled state
Message-Id: <171809295768.4173405.17800575669800599285.b4-ty@linaro.org>
Date: Tue, 11 Jun 2024 10:02:37 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_010248_082854_701C537E 
X-CRM114-Status: UNSURE (   8.38  )
X-CRM114-Notice: Please train this message.
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

Hi,

On Tue, 04 Jun 2024 17:22:46 -0700, Douglas Anderson wrote:
> As talked about in commit d2aacaf07395 ("drm/panel: Check for already
> prepared/enabled in drm_panel"), we want to remove needless code from
> panel drivers that was storing and double-checking the
> prepared/enabled state. Even if someone was relying on the
> double-check before, that double-check is now in the core and not
> needed in individual drivers.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[01/24] drm/panel: boe-himax8279d: Stop tracking prepared/enabled
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/12866fdcfb9ebbe1b175804390195b99a234d5e7
[02/24] drm/panel: boe-himax8279d: Don't call unprepare+disable at shutdown/remove
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/2ccc698c68333256621abc1146de0d3fb0cc6ebd
[03/24] drm/panel: khadas-ts050: Stop tracking prepared/enabled
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/2469cb5c41b4774a6fb5ed799ae53ad16b407a9a
[04/24] drm/panel: khadas-ts050: Don't call unprepare+disable at shutdown/remove
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/6ac427c0cd21c7260d6b5133a70084aa35267a72
[05/24] drm/panel: olimex-lcd-olinuxino: Stop tracking prepared/enabled
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/db45a6991d9e33e852419f8bb0bb8d70b8d633ac
[06/24] drm/panel: olimex-lcd-olinuxino: Don't call unprepare+disable at remove
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/16661a0dd54168826edb2fe5a7b9a183cff0c69b
[07/24] drm/panel: osd-osd101t2587-53ts: Stop tracking prepared/enabled
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/9a3f7eb7811a4c5f36eee93b83bbd72bf6adeac8
[08/24] drm/panel: osd-osd101t2587-53ts: Don't call unprepare+disable at shutdown/remove
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/c99e387afed197c3f22d73d8649c54f7c8da30ec
[09/24] drm/panel: tdo-tl070wsh30: Stop tracking prepared
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/7c9526e58f74e9d725a9607b1ec24ba675f5b00b
[10/24] drm/panel: tdo-tl070wsh30: Don't call unprepare+disable at shutdown/remove
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/2098604605adf35c9a0936355252d676f4cbc38b
[11/24] drm/panel: jdi-lt070me05000: Stop tracking prepared/enabled
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/698acd40aee3ab2dfff4472ec3c16ce42e70e4f3
[12/24] drm/panel: jdi-lt070me05000: Don't call disable at shutdown/remove
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/c8f67cd1d931f2e61a3456d0122ffdeb90b699f7
[13/24] drm/panel: panasonic-vvx10f034n00: Stop tracking prepared/enabled
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/e9864996b44e8add09fd612cb7d00d9b54cd9ef1
[14/24] drm/panel: panasonic-vvx10f034n00: Don't call disable at shutdown/remove
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/f10b4577da3e8c8e457016c77ce2c2fb8d2d5023
[15/24] drm/panel: seiko-43wvf1g: Stop tracking prepared/enabled
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/155739579969d9653f9c2e69141129a824cbd6b8
[16/24] drm/panel: seiko-43wvf1g: Don't call disable at shutdown/remove
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/728290006afba80108b3ce9dd33018f05e454cf0
[17/24] drm/panel: sharp-lq101r1sx01: Stop tracking prepared/enabled
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/316bb1473c78f415a99a10d3c903ed70e0014ae3
[18/24] drm/panel: sharp-lq101r1sx01: Don't call disable at shutdown/remove
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/d7d473d8464e7b9931c0b19f68ea0df807e01b4c
[19/24] drm/panel: sharp-ls043t1le01: Stop tracking prepared
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/804c4d0a20437bca3f017aaf96416f3cec7951c9
[20/24] drm/panel: sharp-ls043t1le01: Don't call disable at shutdown/remove
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/b3494ccb04124ab3ae08fcd01f9571d209ce97f2
[21/24] drm/panel: raydium-rm67191: Stop tracking enabled
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/b7c906d68078f235c1d017a5a820fbeac5a53904
[22/24] drm/panel: raydium-rm67191: Don't call unprepare+disable at shutdown
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/78f15847bdb8fe04b1753b1fed4984c183661ef5
[23/24] drm/panel: Update TODO list item for cleaning up prepared/enabled tracking
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/8e11b23c96c694d4cb0fb6595b38d77ee5edb296

-- 
Neil


