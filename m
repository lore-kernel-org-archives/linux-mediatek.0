Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A25ABC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Dec 2022 10:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b8Y42xIXgL1eMkrgLpvrHsYvzuZh55E8nXO8bqFw93M=; b=rKgvRdkqHMWLKldkF74IpEPoUq
	/WTYmpVfamnfNbGtuyRB9Tx94mBjlwBA75zYrOQBNnIEOkLDX15Ieii6iTa5nHr5uCwmySxTCwiLB
	O/qSILU7thci86bmrmUXFvqtdT/2/zX5AmMI2r64SRxrfjM3JizzDR/8rLAhTGpNzilbUYlx2c2du
	gPZONvDZBBv9bHyBrqY4CcGIdtjgSZpMwkZ5awghhdzGbc24efPJ0S4l7SpJA+LhI/REz8Q6Cmwee
	kqvhhhNpsmBYBcIEMS+kfXmcawp693Akq/ADDoW1PPysrkxWwGlMxxSW7yEbMMuBUVZSNJRF/4krG
	qmHJWXWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAqIR-00ElMd-TE; Thu, 29 Dec 2022 10:38:00 +0000
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAqIL-00ElJI-Tk
	for linux-mediatek@lists.infradead.org; Thu, 29 Dec 2022 10:37:55 +0000
Received: by mail-vs1-xe34.google.com with SMTP id h27so4332614vsq.3
        for <linux-mediatek@lists.infradead.org>; Thu, 29 Dec 2022 02:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b8Y42xIXgL1eMkrgLpvrHsYvzuZh55E8nXO8bqFw93M=;
        b=n+1rGnKC54+rbc4cgQix6MlqAvLsOt+mxxCIvHqRujHtqOBdnTa21rRtnbRJeRS9C8
         ET7G5Cv5S0SiyXRAkPQ6x4aHcSt/MR2F0W2INwqkgkHIJ1ODE1omptcwDMPkxBQp3qFo
         FeI9BsYoYgtYllUyGD5PdfmRjS/iBH+1AJPb0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b8Y42xIXgL1eMkrgLpvrHsYvzuZh55E8nXO8bqFw93M=;
        b=NUk/OI/QmZqcza9ErDYPLmF6MPZRPHuIt9mLvLuvRBtibx4fKKc2LkLwxQaA95DXOj
         QPwPO6N0Vso1oRtAEYfDsL9wem7Zwxz2/hVm0c68S8lc+tTSoxH3wY76Ax4vk0ykgk8V
         DYSxdqKVsSTNkkJ+7tIqdMxVLEtmed9Zh2/kB2sLnKordYJJtCGCZ0MrcJtQEGryXXIs
         C0BUyqVXwmXRuAcqxXaYGZ6Q6YBRzh5LiDrfa309oPM8v6cTm3XFBy+shbEoyzdHLg3L
         BwxT6vO2WKCowK87HTmrzKal+nhYh/ggaqxwbkkh1HIR+AmWcv6S2XilZwhu1jZvLZxq
         cqIg==
X-Gm-Message-State: AFqh2kqIySejFj0fKUq6bjgGdone1psC0fWDq17161rx46SH/ROq87G2
	8zGTZnwbLx/2iwZd4yhORSNXoE1nAZk6pc4/VWXeLw==
X-Google-Smtp-Source: AMrXdXuGd+euo/Y/QzF70Wh9yJgo9zt/cVIVFVgu/E4UIEn36ysnrttGlo14HEh6kgdeVcojyAcKK885ahyhQcOCVdg=
X-Received: by 2002:a05:6102:74b:b0:3ad:3d65:22b with SMTP id
 v11-20020a056102074b00b003ad3d65022bmr3992771vsg.65.1672310272757; Thu, 29
 Dec 2022 02:37:52 -0800 (PST)
MIME-Version: 1.0
References: <20221108033209.22751-1-allen-kh.cheng@mediatek.com>
In-Reply-To: <20221108033209.22751-1-allen-kh.cheng@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 29 Dec 2022 18:37:41 +0800
Message-ID: <CAGXv+5EkPWF77ATVRhxygVOyYmxXgdTNPmOefP7jGeOMeZw_MA@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] MediaTek watchdog: Convert mtk-wdt.txt to dt-schema
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: nfraprado@collabora.com, angelogioacchino.delregno@collabora.com, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, 
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_023754_020998_0E69F25A 
X-CRM114-Status: GOOD (  15.42  )
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

On Tue, Nov 8, 2022 at 12:03 PM Allen-KH Cheng
<allen-kh.cheng@mediatek.com> wrote:
>
> Based on git/groeck/linux-staging.git, watchdog-next.
> We use [1] and [2] as references to send a new series.
>
> This series converts mtk-wdt.txt to dt-schema and contains
> - Fix watchdog compatibles for MT7986, MT8186, MT8188 and MT8195,
> - Fix the watchdog name of mt8516
> - Add mt6795 and MT8173 watchdog compatible
>
> Changes since v4:
>  - Drop label for watchdog node in mt8516
>
> Changes since v3:
>  - Drop label for watchdog example in yaml
>
> Changes since v2:
>  - Drop merged patch from series
>  - Rebase to watchdog-next (for mt8188)
>
> Changes since v1:
>  - Drop "items" for a single enum=C2=B7
>
> Changes since [1]:
>   - Update the commit message with some details
>  - Drop "timeout-sec: true" and use unevaluatedProperties
> [1] https://lore.kernel.org/all/20221005113517.70628-1-angelogioacchino.d=
elregno@collabora.com/
> [2] https://lore.kernel.org/all/20220422121017.23920-3-allen-kh.cheng@med=
iatek.com/
>
> Allen-KH Cheng (3):
>   arm64: dts: mediatek: mt7986: Fix watchdog compatible
>   arm64: dts: mediatek: mt8516: Fix the watchdog node name
>   dt-bindings: watchdog: mediatek,mtk-wdt: Add compatible for MT8173
>
> AngeloGioacchino Del Regno (4):
>   arm64: dts: mediatek: mt8186: Fix watchdog compatible
>   arm64: dts: mediatek: mt8195: Fix watchdog compatible

Looks like the dt-bindings have been merged, but the dts fixes haven't.

Matthias, could you queue them up?


Thanks
ChenYu

>   dt-bindings: watchdog: mediatek: Convert mtk-wdt to json-schema
>   dt-bindings: watchdog: mediatek,mtk-wdt: Add compatible for MT6795
>
>  .../bindings/watchdog/mediatek,mtk-wdt.yaml   | 80 +++++++++++++++++++
>  .../devicetree/bindings/watchdog/mtk-wdt.txt  | 43 ----------
>  arch/arm64/boot/dts/mediatek/mt7986a.dtsi     |  3 +-
>  arch/arm64/boot/dts/mediatek/mt8186.dtsi      |  3 +-
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi      |  3 +-
>  arch/arm64/boot/dts/mediatek/mt8516.dtsi      |  2 +-
>  6 files changed, 84 insertions(+), 50 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/watchdog/mediatek,m=
tk-wdt.yaml
>  delete mode 100644 Documentation/devicetree/bindings/watchdog/mtk-wdt.tx=
t
>
> --
> 2.18.0
>
>

