Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81565C5B56A
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Aug 2026 14:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=td3YrX4BitSFsJcuxTTJfNltqJvU+UzIl6ht+wT0AfE=; b=tIM54UBDVBDuRCvXBz/bBxGWFs
	PeqSfX0Sek1CceTg3OOTSGVpjTz9f2Ck65AiPXjt5Q2obvARVp7rL5XJmaQcUNl6CtRdm+538epcT
	ts5j7POmqgkGlexXgRsSTEOiJjMfBU4Fv6lfhECEoA9Ybs6Lxnd/FoA6ILxX6nMiLAoW5Wka4KsbD
	dm+Xgl1MVywMu856P2SJBLmyPdAkKMGjhyNAn5XHjtGg3chUNEO1MDYgW4wB9qeijLCLQZJ25tW1s
	8xyuA5UKPUT6KLT1wUnTtqRtxLL57HIjUbAwt7hyN6/LwGJdcULLASxqAN/nlbZAt0HI35OUr8vz6
	nJ+vQOuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtnLA-0000000ECXu-1tY8;
	Tue, 11 Aug 2026 14:20:28 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtnL7-0000000ECWR-2EYc
	for linux-mediatek@lists.infradead.org;
	Tue, 11 Aug 2026 14:20:27 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-c20e70a0962so73063166b.2
        for <linux-mediatek@lists.infradead.org>; Tue, 11 Aug 2026 07:20:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786458023; cv=none;
        d=google.com; s=arc-20260327;
        b=dKTA9Y32m4ewBOwVcK8TAUJlD179ZQwF3MpvA/++YKDJlkwBRuB/DMHC8jknGt/UZX
         MCIG8qdaUUedAJTYr1Bi5t3QtEqWoz7XSfuF1Ivx94KNLib0PljwQfAmOKEkG/6juzPi
         QryxVAPPTD0KqmRs9XOqy7FTpfjdbPu6qQ724m6VE9on8iFxpBsRTbPzXjRmzopm8GeG
         kXeUOa5sfVg/GNEzfUzwswwGsDAsiInAxW5HcmsU1NDCBaA4UZvcgknWOEhFLS+9sKqe
         bujnE8HHyHmaaHC+i2kCfWWuFicbvF7sScz83kSH9FonicVZhAZM4eY+X8TggE2DAR+n
         iEeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=td3YrX4BitSFsJcuxTTJfNltqJvU+UzIl6ht+wT0AfE=;
        fh=FGCOzqW4oK7K8xS5EwKwlW8qFzyVhVsDXrbSpirq1u0=;
        b=UQQErw0jlaVduPk5GDZdayss5SP2h/uSJWHORM4M6a+A59Yh36Jqj0uhuYU5Sc85TA
         UNwkND/i5k7wN0l5E1TyERQwzTv87nPqM3lzsoV0VDnvlC0oumT4Y47kq9Ud4OqmRhKN
         hoOhriW7xZN5SbWHLmeyxwAjnblgI1ms1msdW2feVbLWmogq5E7v0/ayAtnHyFDXyMCO
         MwPVSAx5K7r8hPoSq25n54JYet4gdrUEXdS0CQEzUuAPH/uPV61lcRzvAmzSlh25a7aj
         XscdCA/WCIzzwzqxOGtso/VXxmdVNQ4VgPjmRbB1mqBlMBUTbPpXJLRKOPzhSL3Bd5d0
         Bkfw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786458023; x=1787062823; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=td3YrX4BitSFsJcuxTTJfNltqJvU+UzIl6ht+wT0AfE=;
        b=g07IQO4Vl2jIIHAxVOlin2xvQDKnDd7w65SwH5BfGDXWNQUI2ZAwKlj3WL81MeecLO
         kmuIX7AmVkuGvYDEVOeXLJNXnPQgeba7Hn63gueeErcmKFFGqj9l+lKT7S/l9cwbfKIS
         3DA1YJPrsKm/351GC7LlTk0TaQOMq51qJxEbp9o2s5C+6XfacZxH2bFlv8FodGg+3HIl
         IJU4sb8YJVKHU5soKMkrAq6qw3fAmnV2lcWGyyUYvilP9XxYDefdyWQAmT8BAV6YapQQ
         gsk0Zrv6IxQcCoMv51/LTkkXlwZDkU2zj4bD29V3MlQ/cwO922694D8ykftvbgKh7Pzs
         v74g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786458023; x=1787062823;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=td3YrX4BitSFsJcuxTTJfNltqJvU+UzIl6ht+wT0AfE=;
        b=eRWZlJkyl0/OvbEblvicBZsRQ3qSiz+s91ijNRiMDqygg/4wFOdnzMLJ3M6znf6oKy
         AQYBXos0uBTvbNR9zHCD7505Xy7ZPdU/I3RvxpT554dXvaht3ompmCdSFeKd/n7Deo0H
         N49BxkyECZvTqqvYujmDkZHNf1DiZBoPuDSTcAXsmfYdB/UCs/epuORE2gH5wtEMxJ/w
         GZBP9OSLVJfMFTUy/S9uETiqnlWikGBq4uXFmQydtjmUSkQuf70qGparG2nfztzgl16l
         utDp8DTEDnuFbSJki04zNzj7qBuoc/iQ3aP5DxFvU4ynWXQD4FIScX1wLqVhMcI8xhm8
         w0/Q==
X-Gm-Message-State: AOJu0Yw4MiPIyhEK5DM6bD0Kk24WPpdEQPhi21hchy0+P9/gab2T0xFf
	Al1+nHmubkJXla1aE1/h5vBWd42EgcRV7XH5zh/+tij4hQk4Ix4eLV4ZNxXMF7Lfege/bep8dwq
	tmtCnth6BFHdYo24KOVEh2op8QM45Ohg=
X-Gm-Gg: AR+sD11uLZykCdGauBAX1tN/14YMFO+OJW/hOFdkgs/VzipaggVfxdU8TbLYwBgv+j7
	bGNKZ1xX6UC3VG/5Sg335cjjds1RYL+D23wNerscz9QIvIbqpNGwNfYe/p/U9m8lY89LHFccoPc
	fjhxQr6qJz/WvZayaY2zJT+4Oke+gl73j/nNEAkms1XLO2FbGvRy777dROlWAq1mF06Y24LJCmD
	mISn7oVqXpPUeXkkY+02vkD62IVExDCY7kXZIBVpD9HNxmFdKpJVieo4jzTZLOH0D9ntcILhTRJ
	dVPck0lit9ZwP1d2zOOnvraB+l3ERqBIEf+a+ueQAoM=
X-Received: by 2002:a17:907:3d11:b0:c15:d4f8:dade with SMTP id
 a640c23a62f3a-c20ec8ee1e6mr50072366b.2.1786458022732; Tue, 11 Aug 2026
 07:20:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260809160643.33991-1-l.scorcia@gmail.com> <20260809160643.33991-2-l.scorcia@gmail.com>
 <20260811-amethyst-seriema-of-gallantry-ca9c7f@quoll>
In-Reply-To: <20260811-amethyst-seriema-of-gallantry-ca9c7f@quoll>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Tue, 11 Aug 2026 16:20:11 +0200
X-Gm-Features: AUfX_mzTu9IARagHp5y3Lhufa5MQ0ahYW_Bpy7_ilNA0FNARMUxNWXd9eRk54e0
Message-ID: <CAORyz2KXJf4gU46649w1ncb7TAOErdoGmfOMzwKr8b+eGdAgVA@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: reset: Add mt6589 toprgu reset IDs
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_072025_631051_278BA9C9 
X-CRM114-Status: GOOD (  16.72  )
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

Hello Krzystof,
thank you for your patience, I really appreciate it.
I think that a lot of my confusion comes from the fact that I'm trying
to follow the structure that is already upstream, but the whole driver
and bindings could probably be refactored in a more straightforward
way.

> So binding already has reset-cells or not?

The watchdog binding at mediatek,mtk-wdt.yaml [1] already declares the
reset-cells property (optional).
Inside this document the various SoC compatibles are divided into two
lists - one that falls back onto "mediatek,mt6589-wdt" and another one
of explicitly declared devices.

If I am not grossly mistaken, looking at the mtk_wdt.c [2] driver that
handles all these compatibles there aren't really any different
behaviors between any of those watchdogs/reset generators.
In every one of them the .data object only provides the total number
of reset bits in each SoC toprgu, plus a single "has_swsysrst_en" flag
for mt7988 only.
For mt6589 the number of resets is missing, which means its reset
controller isn't enabled (and therefore it's not enabled in any of the
"compatible" devices). We know that this SoC supports watchdog resets,
so there really is no difference between all the SoCs. Both the total
number of resets and the "has_swsysrst_en" flag could become
properties in the binding document and be added to device trees.

This change would avoid lots of redundant compatibles, but it would
break existing dtbs and I don't see a way to keep compatibility. Maybe
an entire new binding+driver and deprecating the current one...?
Still I'd feel more comfortable hearing the voice of experts before
proceeding in this direction.

> We do not take bits, but identifiers of resets.

Currently the existing mtk_wdt.c driver does not use a reset table
that binds identifiers to bits for any of the existing devices. There
are a bunch of mediatek,mt*.h files under dt-bindings/reset [3] that
point directly to reset bits instead of being indexes.
I can introduce a reset table in the driver, but it would break
existing devices as those bits are referred in device trees and they
are often non-contiguous (e.g. [4]). As before, it could be done by
creating a new driver and deprecating the current one, but maybe I
completely misunderstood your point, in which case I apologize.

Thank you for your help,

[1] https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/watchdog/mediatek%2Cmtk-wdt.yaml
[2] https://github.com/torvalds/linux/blob/master/drivers/watchdog/mtk_wdt.c
[3] https://github.com/torvalds/linux/tree/master/include/dt-bindings/reset
[4] https://github.com/torvalds/linux/blob/master/include/dt-bindings/reset/mt8195-resets.h
--
Luca Leonardo Scorcia
l.scorcia@gmail.com

