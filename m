Return-Path: <SRS0=CkUm=G7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3993C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 10:24:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3222660235
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 10:24:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3222660235
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WlufXsAfD8UmXbhiTlfUQbmTlJvKVSeh739jQPgeTvQ=; b=nzN59bT30+A/1MIBiHfTVdpHQ
	/eEnYQsYwkmllrMtpow67lLwCM4yDfPpyNazM6dUKV4oKqKMiu1p/Rw41aDOlHpuIRRbJbSMv4IB7
	DkXZHM96ajZNvqcm4GCQIlG4yv/SVR1GR9NpbcugBCV1NPBzGrx3lKc4QhpbeYH16IFcdrfAf701N
	HwcQYSWkVyzIyr0so6vS+IGFU6AWFakByMHczo5b52wa0eRSMcsNkT4QqkZzhdShsgnhCkUGMS4uF
	rtN65i3o9CJqa6a3x43SQ/V0E0bTiAdAc4I3ICSVnoh7Dk3r2wcWzyBIeeB8x+Ptzy/GnQYY0boLu
	6wppTZj6w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l54Tl-0001xX-SD; Thu, 28 Jan 2021 10:24:45 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l54Tj-0001wd-BN; Thu, 28 Jan 2021 10:24:44 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id y72so1288573ooa.5;
 Thu, 28 Jan 2021 02:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m1z+Yu2fiQlavDIbv9fPx1NNOziGtX2cOyoTwpCpWQI=;
 b=MHD1CdFnmK00kxSnxryGxN7EuOz28GXa8gDugIWWKqB4bu29sYsgdBEO20Ik3ibTu6
 gy+vUfGHbC5IPeFzxq7DYJ8L1D4135+ZURvRtmdhllV/LSUxYO8kh4jZ5frnnFLBLS6z
 xXWAHil0XKu/RsMmMkRt0t+pRJoBfNe8/AyGWL8gHgBkrVFF4y8Rqkgd/KP9OAnZT1d4
 0j7oJi4cy74V4OhUvokWxX2xCM8RLtCnwwr3JdEecW//Vk56o3L3qFbRrLT1zAOjSlxY
 giq687DnX05W3NvZAbdLwIkAEPoClsexV3FsvPdT06rY/N5FU87xDPBL08j1o2G3Yk98
 A3UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m1z+Yu2fiQlavDIbv9fPx1NNOziGtX2cOyoTwpCpWQI=;
 b=Zm9mlePF0Lt1XnpiW+opWFY+SFtbpsGsWgEqb4nv+WSeJBZE21MWnT8f6SrLht8ox6
 pyNp6LV36D3icShbiPXRI6pfl+LGhrj9Jd9VLbptFSs2tdkPNQKaycs4AgoZe2rhqqBn
 UzkrRzfNpiDhvuMY8UcmUZCgjsQT3GGCggfPckKaATBWcSaQN8jNtmTbRFFJK+XlCFcE
 LE+jlwy/vVWNH9MlpVjAC3vRmBvcpob0DuiNLZaee/k4hd4qKXdSy834b5xx0teyxNDP
 +Eq5cHOavlyFqChu1A/sXxtKs4KWWGZFOxqFf5N1+5awfdGux0THarlNVTWbtjzN5uim
 pJ4Q==
X-Gm-Message-State: AOAM533Srbold00F/9ZUNPF1d2nO53bjI8BJqiCHqc+VckXly538qPkj
 HkKUGsQswUuGKvJNV+oSw6vxmafrt3LvcZQa8i0=
X-Google-Smtp-Source: ABdhPJwUsgdluUwC0izmBpnoRmX0hPl6NAxZbuWCF3shpvrYsv4fn9VmR+tzaw+Uf6ovgJbADeSOCErOYZJGoRFA9H8=
X-Received: by 2002:a4a:9c01:: with SMTP id y1mr10870225ooj.15.1611829481208; 
 Thu, 28 Jan 2021 02:24:41 -0800 (PST)
MIME-Version: 1.0
References: <20210128072802.830971-1-hsinyi@chromium.org>
 <20210128072802.830971-2-hsinyi@chromium.org>
In-Reply-To: <20210128072802.830971-2-hsinyi@chromium.org>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Thu, 28 Jan 2021 11:24:29 +0100
Message-ID: <CAFqH_52xmsSsxqxkBO8d93Jezy4YZFxtpJ0BX9TVrCy6qao02A@mail.gmail.com>
Subject: Re: [PATCH v11 1/9] arm64: dts: mt8183: rename rdma fifo size
To: Hsin-Yi Wang <hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_052443_422227_0C3BE21F 
X-CRM114-Status: GOOD (  18.63  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Hsin-Yi,

Thank you for the patch.

Missatge de Hsin-Yi Wang <hsinyi@chromium.org> del dia dj., 28 de gen.
2021 a les 8:28:
>
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
>
> property name must include only lowercase and '-'
>

This is a leftover while I forward ported the patch, the
rdma_fifo_size only existed on the downstream kernels, in mainline it
is with '-', so we should probably add the fixes tag here.

Fixes: 91f9c963ce79 ("arm64: dts: mt8183: Add display nodes for MT8183")

> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

> ---
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 5b782a4769e7e..6c84ccb709af6 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -1011,7 +1011,7 @@ rdma0: rdma@1400b000 {
>                         clocks = <&mmsys CLK_MM_DISP_RDMA0>;
>                         iommus = <&iommu M4U_PORT_DISP_RDMA0>;
>                         mediatek,larb = <&larb0>;
> -                       mediatek,rdma_fifo_size = <5120>;
> +                       mediatek,rdma-fifo-size = <5120>;
>                         mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xb000 0x1000>;
>                 };
>
> @@ -1023,7 +1023,7 @@ rdma1: rdma@1400c000 {
>                         clocks = <&mmsys CLK_MM_DISP_RDMA1>;
>                         iommus = <&iommu M4U_PORT_DISP_RDMA1>;
>                         mediatek,larb = <&larb0>;
> -                       mediatek,rdma_fifo_size = <2048>;
> +                       mediatek,rdma-fifo-size = <2048>;
>                         mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xc000 0x1000>;
>                 };
>
> --
> 2.30.0.280.ga3ce27912f-goog
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
