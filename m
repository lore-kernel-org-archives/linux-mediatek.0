Return-Path: <SRS0=pZ6D=MU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E62D5C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jul 2021 06:14:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA91160EB9
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jul 2021 06:14:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AA91160EB9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IamWN1OOIyDtwNunJxJj67PpldWXyaxrSNyr0GAT1z8=; b=AAGVkMRZR+CSyp
	FbIk1Gz6oiDozl5ZYXYyx6DM02fLpyFmZvoLp+FIbr6FKXmEJhLSE9E2uEaLeJF2CR3pvBcCC92+C
	Mv5hJnj73Cy/KTHU2c/kPPIp9CPKKWYLMGgbW4WiCYWGpeyLuWlvyeU4MFcjrLl25jfA1EP+8u08y
	Laa8BNQ0ZRokfF/II8hHwe8oyU235lKZJYUQx+Wc7qufqQr6JdrATgVUD9CcWxnxeZudoAeU0M/NV
	Nd37diVfydKbICKFlVpibRzAY2o7pMsd88z18yGR+rIcdvaP5xJki8FMTLZGzxLKzCpua9rRQwMAF
	NRjzCydUlIe2JWFW/t9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8cq4-00HEnX-55; Wed, 28 Jul 2021 06:14:44 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8cpp-00HEjf-IR
 for linux-mediatek@lists.infradead.org; Wed, 28 Jul 2021 06:14:31 +0000
Received: by mail-pl1-x62e.google.com with SMTP id n10so1427471plf.4
 for <linux-mediatek@lists.infradead.org>; Tue, 27 Jul 2021 23:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+eCPJolnjFD6s7o/D7/wCD8S3LJbNwZNkFAhDgmHNdg=;
 b=mR4Tt7DzUQaHNxHJQDGkFhLLLljZDCuHSLxVhBOpom3iS+QI99MjDfopHJ9XmURL/i
 bCugbreHHQ0xBU095vg6uHwXTSdQsTKtVFGvhxCtiLbvzN8yaKuepp0M9CeZxG8Nr3Zq
 /Qe7l6ARfY6A59sOduR69WOdWo96M4zLL4GRU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+eCPJolnjFD6s7o/D7/wCD8S3LJbNwZNkFAhDgmHNdg=;
 b=mn4YXGaQ19Sc4xqKF8mkN1vf36p7oBOpHkwd4eSZF6w3OkWEQ+n/zX+u2lk78aGt5r
 Uzg8ZBQIpJgodc94YpLvZh491Jpxg/B6AdzDTfcfMsp2xq25zpcB/MbDNcQ96CWswpvQ
 9WNFHXjGpRPMwMv6KFcRzPnV7X0b+9JbuDuiiyOeKSB/xrES5N8NIbQI9RvtzpEIvRAh
 XTy9jNquGT7tBlPV2acpdC8B30b2SZ6zmobrg0/r7aNse2Q64UUF6hNrGxwlTKKkY5iZ
 jVKm5QkXV+oGokhju52yXtVH/t4wE4UMjYlLGSYUy2hGadNrXdjH22oJ7BicPUP3ANeZ
 z43Q==
X-Gm-Message-State: AOAM533vHYzhy68a2LfncYl7nEEidtp7MIQbGhQubb4Wn7vCxcW8GjUF
 0VzlgTbyBs8IBKDfAPbQ2QJwEzSIInlPG9IA+dzy+w==
X-Google-Smtp-Source: ABdhPJzmByxKqYRSbuErkA4p8ANUorSkgXNNWkdhJmCqT7YsTx5hk209/4gRAztv7igdNUaEYtPZLsDig5mlURlglKQ=
X-Received: by 2002:a63:8f04:: with SMTP id n4mr26845226pgd.317.1627452868772; 
 Tue, 27 Jul 2021 23:14:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210727023205.20319-1-chun-jie.chen@mediatek.com>
 <20210727023205.20319-3-chun-jie.chen@mediatek.com>
In-Reply-To: <20210727023205.20319-3-chun-jie.chen@mediatek.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Wed, 28 Jul 2021 14:14:17 +0800
Message-ID: <CAATdQgC-X6pijkgTBsWJJKp__J6N=7JNKHQJmOMvTAjivwPM5w@mail.gmail.com>
Subject: Re: [v6 2/2] arm64: dts: mediatek: Correct UART0 bus clock of MT8192
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 open list <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_231429_656677_744716A0 
X-CRM114-Status: GOOD (  16.81  )
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

Hi,

On Tue, Jul 27, 2021 at 10:43 AM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> infra_uart0 clock is the real one what uart0 uses as bus clock.
>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index c7c7d4e017ae..9810f1d441da 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -327,7 +327,7 @@
>                                      "mediatek,mt6577-uart";
>                         reg = <0 0x11002000 0 0x1000>;
>                         interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH 0>;
> -                       clocks = <&clk26m>, <&clk26m>;
> +                       clocks = <&clk26m>, <&infracfg CLK_INFRA_UART0>;
>                         clock-names = "baud", "bus";
>                         status = "disabled";
>                 };

There're many other nodes still having only clk26m. Will you update them too?

> --
> 2.18.0
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
