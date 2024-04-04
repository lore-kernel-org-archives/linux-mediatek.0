Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E33ECD1284
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Apr 2024 08:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tUkPXupaLm7fsLyPKoLu5BZRQ4nvoD4y4GxTbasq5fw=; b=LuKEr8zwF4renxDGYmxHkwcMEV
	DVkwArETXCDqCQyuygxoKMsgxknlnuZ4PCid5uVwjvzbyXAq7FYO/uC/XzPEg6NJMEpHfxnKlcy3m
	ivsTxlYfDvjwp1qSL6ruPA+D4QmYFVMNF1wfoWfFSM6BCEgJgvxJYcMifs4MpooAcsnhBu2TtOYJo
	ndaVtCYfgRTSAIhrkPqQYVTi+GbqJibelyJQyZkt+6mrDEU+AXjJntJotSnmgxB8lnMmLhWUPUjze
	k7dWMsrY6dD6ktLXlv8DHaLLkZniOGt5gPKlCEzFX+8Xjulu6nG7z8rrVXeQcLzsK+czkyPqC1FKX
	yz0Pysqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsINb-00000001pfK-44Jo;
	Thu, 04 Apr 2024 08:23:27 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsINZ-00000001peG-3S0h
	for linux-mediatek@lists.infradead.org;
	Thu, 04 Apr 2024 08:23:27 +0000
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-dcc84ae94c1so825401276.1
        for <linux-mediatek@lists.infradead.org>; Thu, 04 Apr 2024 01:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712219004; x=1712823804; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tUkPXupaLm7fsLyPKoLu5BZRQ4nvoD4y4GxTbasq5fw=;
        b=InalgFQY8YsJxVUfnex7MJ2qCVKg+OAMpkDw5cY/04j9RgaJXoVfKjiuJ+G30Smo9x
         yO4wSdhDCkw4BvTXTq8wm/j6M8yieF2KNvixJDV+souNIWNfFebddEtzeXYRiIkv3emU
         VhGPxHOMEc+yZ1eTIEP4T3YrPSO446FncwT1gjjgiWyC3i8ltY5932Zqba8enimEFs7J
         oiY9K1Aw/eme4/DGRgCrq1+M0+aZmyUI4Cu3zoEjThcavvPwEtflaaBoYFIa1b0wmgVt
         A2EfkCzF/aOh8KkV2sGBm1P0AhB2h+AX62UqPlhECEDBRRjEyk6ERByds/EF56zTMPIy
         eV5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712219004; x=1712823804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tUkPXupaLm7fsLyPKoLu5BZRQ4nvoD4y4GxTbasq5fw=;
        b=pK4VU5S6nhZc1ZxGab1kkoWxYWbcsaOA8C7qJG2KcY79bLgvSGBIrQsN87/xERsBRw
         RopAK2oXl3kJ0Msw9uqtVIiIXal4zkLAt/3PLIkRQ7ApVja1MMQ90IFJQ6UY3emT1TEl
         MosQaJcLVrZ0VTx4NMWXjMH3yDlh/WcoJWs4g5djMihI84OupbzGXOPOb+/PrI4Gcew2
         77kaUB4R8WcBNdMdYrOXvYjvSwrbg1ZMyZIygoOEUkW5lDepkE42Q+LyL5vrT+JTfS/K
         yIGz3clVidlOYY6BmcldDJA0cdfLRLekaJtF7gsUMSapIueOgTDYYMD/1NEi2C3PRvBH
         ro4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVMuFZlwniY9U8kDsqAHR09vL/ed9JLAn0J8Kv8AqIbpjZSJ45VrSU5DuKp0F+ylKbHk72ZzXfhtOch5I9AihGArkE7JKeVlIh2n4KXOQfNs8k1
X-Gm-Message-State: AOJu0YzTG3FYMQWFBMrP4nT/nBNyNuD5CTw7BbY9l0D+pKqq1e5cN+Wr
	5O3Hzwe7HPIcjfBiDNMGNNdteavxs56H0hJSmZLz7vUBr4fkWpsLOdLz9U1GzTNwAY0LOy1XN6O
	Jejwq0PxM7xhVm7BtKVrdb6WYGa33r2TibLpbuA==
X-Google-Smtp-Source: AGHT+IESU9WLa3h8aZDesnqNiyXJbZj+fNufrMd2QMdK0OU/9kP3JNABg1ywIrSqCK1qb7HDwP4jhkHml0tcg8LZkz4=
X-Received: by 2002:a05:6902:c09:b0:dcc:375:2257 with SMTP id
 fs9-20020a0569020c0900b00dcc03752257mr2023598ybb.0.1712219003651; Thu, 04 Apr
 2024 01:23:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240327091336.3434141-1-wenst@chromium.org>
In-Reply-To: <20240327091336.3434141-1-wenst@chromium.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 4 Apr 2024 10:23:11 +0200
Message-ID: <CACRpkdYi=3ZYVQGAAwJ5iYNX-WY1OPTX_xuP3H-xJj9Q+b+RRw@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: mediatek: paris: More pin config cleanups
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_012326_059773_FC914139 
X-CRM114-Status: GOOD (  12.58  )
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

On Wed, Mar 27, 2024 at 10:13=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> =
wrote:

> Here are a couple more pin config cleanups for the MediaTek paris
> pinctrl driver library.
>
> Patch 1 fixes readback of PIN_CONFIG_INPUT_SCHMITT_ENABLE. The function
> was passing back the disabled state incorrectly.
>
> Patch 2 reworks support for PIN_CONFIG_{INPUT,OUTPUT}_ENABLE, following
> discussions on the bcm2835/bcm2711 pinctrl drivers [1]. The driver is
> made to follow the definitions of each option as described in the DT
> bindings and pinctrl core.
>
> Please have a look and merge if possible.

Patches applied for fixes, it looks like pretty urgent stuff, yet no feedba=
ck
from maintainers for a week so I applied it.

Yours,
Linus Walleij

