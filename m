Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE610C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Feb 2023 09:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gUiV/qw4JVOOcTovWw+xyQ31ogBLTJYuBUEOiv2Lb9U=; b=h7t2ud6Vfsm3um+6osP+P0qbdO
	A5bL6RhNEpHHjOoW/X712nvPl6n78yVu6YRYPRlP1jwzi8YRB9Twpvsmy7hZXp3KdA4M3vPW4e02r
	eLoEPObq3hRvLKPWA/DivmeOCYiZyNbS2a8/eU1spZIO1XBdAU+d7ZXs6mObsnyjUjZXy5ys9Y8eS
	oreYpAxgu2nk9LbVSJyWZxMewMMLt/GL/eXfMIGcYBl3LGRcK2bYu7MO3fwpp1sYj3CeWwPqjF2t7
	2lEOuA4VRNn5u5O4V09GcF7KANHL4jeYuI9xrK4+iRZxG2mf8oWTlP8ht8LjqjHTfPIwGhRDBgCBz
	0RVXbv9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ2ws-000gKI-Ou; Thu, 09 Feb 2023 09:10:34 +0000
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ2wn-000gH5-BY
	for linux-mediatek@lists.infradead.org; Thu, 09 Feb 2023 09:10:32 +0000
Received: by mail-ua1-x933.google.com with SMTP id x21so252294uaf.8
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Feb 2023 01:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gUiV/qw4JVOOcTovWw+xyQ31ogBLTJYuBUEOiv2Lb9U=;
        b=QIIdel1hmP8z81Hism+qg1TEwzk5Q4RapO0/kQvbT2plytwESYSceZGMKXLlsMHLnJ
         aQwTjjAYJQpFz0W0Q9oBoHZAVdYNXekXiEQ69PeqGwM/y6MTkxHOr539NoK1u1ne5tJs
         YzOWq9vDJkLexZVnCS4T9l4rHtNeFWP6KBsT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gUiV/qw4JVOOcTovWw+xyQ31ogBLTJYuBUEOiv2Lb9U=;
        b=vY6OZpbNJIXNLtad6AqtwNni8W2aaamdxCbkWrclp/mCzwFU3L9fOl+bcuYLdK8tFE
         zJFWM8iGS2aSvkOSrFQIvVSvqQyCBk17HgLlYIxN3U4EdX/vPx5A80X7/Qx+k2BT8zkY
         EvAXMAV0KYm1K34y3A8GHvvfCLdGEhRSCLyCrPVq/zexxEakNoIWMCmLSazgDrKOFEjB
         OBM/d6vIEEVnR9F4vilxT9sgF+mlSzBwQS939Va+76bFolimku1JF8F3HI3KPCPEE7xd
         9vkGdQ5mlnrmqqK9FVs/Egf/r1onbrQXctqlKyNDG9yeYYdiD7NW5AiWD/JXO1L6XF7E
         7LUQ==
X-Gm-Message-State: AO0yUKW5hh7nMl5GadsdNhjcAv8cTEMuBbThhIjID7xcetneigxLi+nU
	Ej/8waHZ3hQPOJZS8D/Ro8rUfw2pMHhKyVU7tJGJ9g==
X-Google-Smtp-Source: AK7set9iFbENJrUNl+hKyQ+MIZq2ziVgQa1lldvrUJbRi6mBlcQ3E1DlqRIz/5dmXyM5bWmpsndHSjVSmc3EWCSsyvc=
X-Received: by 2002:ab0:2bd5:0:b0:5e6:3536:22e4 with SMTP id
 s21-20020ab02bd5000000b005e6353622e4mr2456477uar.55.1675933826994; Thu, 09
 Feb 2023 01:10:26 -0800 (PST)
MIME-Version: 1.0
References: <20230208103709.116896-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230208103709.116896-1-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 9 Feb 2023 17:10:15 +0800
Message-ID: <CAGXv+5HkdWUWmq0Jk5F2ZuFVHN5T07CYwBdzSWR7Z0=pmkJ5Mw@mail.gmail.com>
Subject: Re: [PATCH 0/9] Panfrost: Improve and add MediaTek SoCs support
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: airlied@gmail.com, tomeu.vizoso@collabora.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	steven.price@arm.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org, 
	alyssa.rosenzweig@collabora.com, krzysztof.kozlowski+dt@linaro.org, 
	matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_011029_435390_51155840 
X-CRM114-Status: GOOD (  13.63  )
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

On Wed, Feb 8, 2023 at 6:37 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> This series adds support for new MediaTek SoCs (MT8186/MT8192/MT8195)
> and improves MT8183 support: since the mtk-regulator-coupler driver
> was picked, it is now useless for Panfrost to look for, and manage,
> two regulators (GPU Vcore and GPU SRAM) on MediaTek;
>
> The aforementioned driver will take care of keeping the voltage
> relation (/constraints) of the two regulators on its own when a
> voltage change request is sent to the Vcore, solving the old time
> issue with not working DVFS on Panfrost+MediaTek (due to devfreq
> supporting only single regulator).
>
> In the specific case of MT8183, in order to not break the ABI, it
> was necessary to add a new compatible for enabling DVFS.

Tested on MT8183 Juniper (Kukui-based device), MT8192 Hayato (Asurada-based),
and MT8195 Tomato (Cherry-based).

GPU probed. When running glmark-es2-drm, observed state transitions in
/sys/class/devfreq/13040000.gpu/trans_stat , as well as actual changes to
values for regulators and clocks.

Tested-by: Chen-Yu Tsai <wenst@chromium.org>

Also observed that sometimes when glmark terminated, the GPU would not be
brought down to the lowest OPP.

