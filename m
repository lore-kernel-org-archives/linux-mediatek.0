Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A60BBC61DB9
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Aug 2026 18:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SSi+4NmtMxNkZmxsfuesKYnZ20ScCmyOkzMthR0BMj0=; b=03nc/vZzSbxu1eLpwKIx/dq9S8
	JM3QA72PDAb7DlxHG84wr2ZhHcjGdltEMfAJMtDv8nMwGcJMHhgSDZPbomCUm/LIpoOZ2VXXUqhCR
	5/cr0VbLFnLlOYkEXDKVg8Yq/uYeE6eevAYB7mLROcdu1o7W4DC292Tl4uaFCBEq1cWzWeYz6MxTt
	oRvxEcmB3tEIXoWCCBaKSuFCbvagr5qMUt5mJzNvnjDxCkLM+8Qz+R0BRYfcT+fWs/kICNHP1DlnG
	C56xMgJeKMnnW+HSk3ZiGx3FzVYvgwUjAjnXl96bn2ZYXbhqr2s4p9tq8+brF5h6rBw+VtotUjGqX
	TQF//rtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyw45-00000001KV8-1uFP;
	Tue, 25 Aug 2026 18:40:05 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyw41-00000001KT1-39Hn
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Aug 2026 18:40:03 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-448b69cfc6dso189424fac.3
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Aug 2026 11:40:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787683200; cv=none;
        d=google.com; s=arc-20260327;
        b=sBq5lU4LwKsJASLGZW4oylVXA+Vy7LOVfnQ9K3ZFnPEApWjANqWCJomlIne0w3QSov
         VYe9BEcsW5R21rTIqOZNW9+qmTi/FOw6GYt3ePbUWp4C8YSLfbbsFqOM0VVJAozdsB92
         gqHCFI4EUzhuWi7LUdn4MEES9iKp85xPiIffhXcmteBHgG+K1qMCFUveK+NX++12bv7h
         wHG9QdfWab3yWkF7vKnbq8hRFG57s++Rso/MkSVQlEE19VTytKjh0faV3JuB9cVWRBwy
         GecegDe3UjDwNcw0q7aGPn7uBKNmkY9oL9dPe/gvmRZDcBoJaLKlQ3grAwJnxFLInx/+
         GFMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SSi+4NmtMxNkZmxsfuesKYnZ20ScCmyOkzMthR0BMj0=;
        fh=+vPiA73UB3IOYmNCoFVdf+FdtGJ04tZBy0Dg+rBbZEU=;
        b=X9CBtJEBbbD7wAqalZ0d58VlLJceRAgW31o45rm9hgOSOanso/rYti4bo8zMiEdo9h
         KxCevvJ8Aotx6ChCH2n/uTWFzkJi7NnvpERklRyifvgalCOxFGD7IFPUgXsn1I8cwG+t
         nLRlRT2v7/aYoS3LyA4HxKhDxsG4eFaNK0D0GRT+aQ/KO9EwzM0hbKp5AMjXttmRtK8k
         +9Mvpl/5ZG3MOMjs64UX5Yi8p1QtSMKA6MePVFVqKHG/uQfUV9AZ9Rn23iqDO9t6z0c8
         WUZgchVQ+qUE8vRYhiAr+g6/nFxjuDxZP/DKt3BlUSfN2HKdzJ87MWEamObVndjKeUsF
         FqLQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787683200; x=1788288000; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SSi+4NmtMxNkZmxsfuesKYnZ20ScCmyOkzMthR0BMj0=;
        b=Hgv3MCJroC3X2w0NerLyt75GDLMwGPPoAvDJl7fucXnddmyv3Xg878pPY9grsSIXwR
         IkZ59n+jVdsHgdX51mWiSRh6EkfsKkYetkR6iXSyjjv3czdR20kl100Nn2uhPovx1s1x
         j3+e8cIO4JsUYk6mkBrCsCFBsD6F7K3HjN/mlxGvkn2RRocc6EuBhgWqKVKDuoe6qePt
         3AP5uF+rQq3AfS6ots9t00vyXq9N003ca6bd6eYbWbrAxNDjspmJH+8j/4lDSNksMtDH
         CEaq/mfu530VQttFDkSl23yuGRJfiA8FyG/K2FKai9NwrCpoKYFHEbH03li9+zDLnGJO
         F/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787683200; x=1788288000;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SSi+4NmtMxNkZmxsfuesKYnZ20ScCmyOkzMthR0BMj0=;
        b=U/vZtc1z7z7+qaVRohqIoLIdSdhT7C2vSHI91A06Rpf9aZl7rA8Qo+c/e/ZhwPYCho
         MaK6XpNGg28HKM3ymhIYmxv79M1RZQQEdaJqheScP0dZROzgA8m3BC3cv/ePEWPRtLRc
         Bmgc73fagsHpqF38hoPEDdyHeZtDpGKWbu3ypcYXg/mY6LXEu/MzCw5Xn9gJFRZq0Nlh
         R0hjnetQO1HpYERsVFP3qUMOumtJoSKmuiGiDR4xC3xbVgINgErZraPC4DPn8uqtfd80
         NoVtjY3oVRUH9tpWu7UnqdjSb9yoOQhiqjgbWYdI9CEMghrckXKX/nC6C13aIp5k8d9L
         1Xdg==
X-Forwarded-Encrypted: i=1; AHgh+RpR1ln0M5jprQB2dt1tpPfHc3SKO5wZ6Fwm21o2/ZtxKptD5rPwe4210YDPhADM2YzX9IQb5Moh+5fqma/8VQ==@lists.infradead.org
X-Gm-Message-State: AFuF++mcq/xJ6vhzc5/Uv293VpsPLwn9vvDmw4oPsZMvTcngEOtxjmex
	nzum5eRk1zqQp3A+hkB8eUFM/UAmGZQETySQFcrYhX4eRd/YkW+5k3+MH1DpgUoCWrQCmWU2Fen
	ktXf4FGhhsdVlddKsailNq7Q2mMwjGuM=
X-Gm-Gg: AR+sD1119v4NMfSidUZ3lFsvGlz0iqh19RYW0oAaxrSZpii5/wC+KDCf02pWQsmHNkA
	C2JNqMevQJsCGEwOw2ge9cEiVNNgVWmJlTFrI3GcOw93nM6TPNoPQbCDyUbg/seakuY4aYxf+90
	yhnPkiojt1AONwMK8AbOkvXfwTTVeh6FwuG9yBY+3z8KC0RSCKRIzWvKQCEBNLu1XVbNiD3pFAH
	siLtYfqxMkKBQ7LS0ODBzd1BMHqDsuWAZ5N1XKKj8IxidE2yS+MaxMnD17akyKkOZnNSxBtSoO7
	zvLqNXTMIrgTEStfAyqbd64aB0KT5Uwi5jPKfLasF/Le1A==
X-Received: by 2002:a05:6870:f623:b0:435:16e9:f288 with SMTP id
 586e51a60fabf-4659bb24b93mr1602806fac.20.1787683200126; Tue, 25 Aug 2026
 11:40:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260720-drm_simple_encoder_init-v2-0-5020b630668a@gmail.com> <e393996a-3ef1-4c43-b762-af8cd0f2a4b6@suse.de>
In-Reply-To: <e393996a-3ef1-4c43-b762-af8cd0f2a4b6@suse.de>
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Tue, 25 Aug 2026 20:39:49 +0200
X-Gm-Features: AcwNN1Va3aTr02pKhzBqoinFUkwxjfSbh2WQ-EpZwUvKwCIdS5rdnwq9NOj-ZWw
Message-ID: <CAJpoHp56yo+eQAYjvR3ez=HTSzapCd3dYppo=MdPx-Lm4J4DQg@mail.gmail.com>
Subject: Re: [PATCH v2 00/15] drm/drm_simple: remove drm_simple_encoder_init
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Thierry Reding <thierry.reding@kernel.org>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
	Anitha Chrisanthus <anitha.chrisanthus@intel.com>, David Airlie <airlied@redhat.com>, 
	Gerd Hoffmann <kraxel@redhat.com>, Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
	Jyri Sarha <jyri.sarha@iki.fi>, Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Xinliang Liu <xinliang.liu@linaro.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Yongqin Liu <yongqin.liu@linaro.org>, 
	John Stultz <jstultz@google.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	virtualization@lists.linux.dev, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_114001_788317_691C6501 
X-CRM114-Status: UNSURE (   7.85  )
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

Hey,

> Diogo, do you want to send out another revision? Otherwise it's time to
> get these patches merged.

I would keep them as is, unless you see anything that should really be
improved before merging.

Best regards,
Diogo

