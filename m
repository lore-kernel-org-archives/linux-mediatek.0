Return-Path: <SRS0=IR42=AN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 738C9C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 05:05:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 418DF207CD
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 05:05:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W6jx4Vej";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="D4Y7fZEl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 418DF207CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7gUNZODSYtTDo5KpUbeVQGaOBamqOFHMpyUu3NPIiOc=; b=W6jx4VejZtd8a5s7nI2WWmViy
	roSx1Dj2U0FNPzF2l3k4gO6zmNiA9fIzwjBoH//QKZ3FwnAcn+PkkHRX+ZoOYfFm91xkKMzovkbuJ
	HdSgzfsk3Gz0ZI+lXEtl1AV3ryyJUzovlQIcwckc0KG4DZMfmn8zZB0NnKRGUMWhhbBeKwnJQuiAz
	n+zeRgtoMab6Hkxt/wVvVx+UD+CXsVODiNNvhE5BqpfxLZMVqErkmkYRTIUsUlJbGSFIBnyT4fAzG
	uLssFCXyJ9vX9YzejirlgM0NBSDjYraTkHMmQQkPbxhmIxGF/YPSGo5UZLQpawE7JPNUmXuam0uIR
	TUIE5KXdw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqrPe-0003jV-2f; Thu, 02 Jul 2020 05:05:30 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqrPa-0003iV-FB
 for linux-mediatek@lists.infradead.org; Thu, 02 Jul 2020 05:05:27 +0000
Received: by mail-io1-xd41.google.com with SMTP id i25so27623446iog.0
 for <linux-mediatek@lists.infradead.org>; Wed, 01 Jul 2020 22:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ePm8K1YrKTYlTFOwBCRGn4xw8mI3+0R5ZwHfAbLgLak=;
 b=D4Y7fZElDuKkAbGQBTP7tnXJ9yxEYcJ1+lqoyHC2Q4j4RAG70CRzK84FdG5w43sSjw
 9IIsyPC8XLWKN4+EuqWpOq7nDJ9OrCSROZZ9x30dtGEgEwPw08WBGqZzPGLDzO+HM52/
 Ej5TSs+VoFSZkT1ZArqjX03JDC1rNspZXsfTA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ePm8K1YrKTYlTFOwBCRGn4xw8mI3+0R5ZwHfAbLgLak=;
 b=Lq03O9m5U3En10XrZfqp+TxNtQ5HX2shMyqfmnlOFR6jX6MCpYkpLKXhvK+MBb1maA
 h6eJX/B9+2+RQ79o46yZzMEeTS3UiSiCappG5M3yia4d3WZplHBuN11GnSLvYMS6pVJx
 6OgE/kPsCBhV0HjiTblndAzgUMvWbS6mTGj/qJg47ZA/jOr29UJ7KgHT1h6aqNCYDcOT
 GIYIZovzE+8WUIyrhk16uUhUIvDR3vd0FHokjKm83ysUBk31oLL+E9dKBQuUe++ykuii
 kj0fqkvC3UY/CF75KSJghQ3Lbm44FX6AnJtvEcXWcFHs9IM8SFQ1oGEc4u/p3EMOMHth
 CpcQ==
X-Gm-Message-State: AOAM531YqQj0yIeG5nxZKvcyU3VpuCE2tW9rClg1XgUNyczsMjjhtJfw
 lvP+Y68NZa4bA+neyM2r2Eu8jm8lA/bbj1je2zw3WQ==
X-Google-Smtp-Source: ABdhPJw2kPVQNy2tWis10zqAhHf5YpNiIQG11abVlOkUAhNPPsHAqxRbxQbJ1oKec7GIt0IdmyqCbGzt0U1S+2n9eq8=
X-Received: by 2002:a05:6602:2295:: with SMTP id
 d21mr5736965iod.0.1593666319420; 
 Wed, 01 Jul 2020 22:05:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200625101757.101775-1-enric.balletbo@collabora.com>
 <20200625101757.101775-3-enric.balletbo@collabora.com>
In-Reply-To: <20200625101757.101775-3-enric.balletbo@collabora.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 2 Jul 2020 13:04:53 +0800
Message-ID: <CAJMQK-hGg0QUjZsWN3rXzbZVD3DQEmOjkcoJixEn7YfKRMC==g@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] arm64: dts: mt6358: Add the compatible for the
 regulators
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200702_010526_536816_77E2274C 
X-CRM114-Status: GOOD (  13.36  )
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
Cc: erwanaliasr1@gmail.com, Nicolas Boichat <drinkcat@chromium.org>,
 Devicetree List <devicetree@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jun 25, 2020 at 6:18 PM Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:
>
> The regulators are expected to be instantiated with matching the
> device-tree compatible, so add the proper compatible name under the
> regulators node.
>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Tested-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>
> Changes in v2: None
>
>  arch/arm64/boot/dts/mediatek/mt6358.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt6358.dtsi b/arch/arm64/boot/dts/mediatek/mt6358.dtsi
> index 9361ada0c497e..fa159b20379e4 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6358.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6358.dtsi
> @@ -16,6 +16,8 @@ mt6358codec: mt6358codec {
>                 };
>
>                 mt6358regulator: mt6358regulator {
> +                       compatible = "mediatek,mt6358-regulator";
> +
>                         mt6358_vdram1_reg: buck_vdram1 {
>                                 regulator-name = "vdram1";
>                                 regulator-min-microvolt = <500000>;
> --
> 2.27.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
