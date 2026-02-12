Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0011AEDF052
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Feb 2026 08:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/bjVwokrZxKsldJsperXEzSS9XKywY388N/cfuXNnbI=; b=DErNriSC3dEnzXRFbTZt7lq5lK
	Wi5yvf9oUWVBSHCaS/o2Xfr+s3B1QPBMGG/ZOEFfmt7uuOSwvqbB/lyV6VtMXH/JsNgtWfm4dfj24
	lNUpk8Fzm4iJqe2xAVO3V0ED0Yzy5mk6rnnb3y4elb7Tn/33jjAppWbL/+veH6AtybakxvjOe7s9V
	M9XcojNwUpw9ourjKCXChGaNPe6uqFZYJZZJ74rds55amG5N8Rvk2RsOq4TgDWUm6z+1iwLKBFuxY
	cc32+2gncjbHk8eZxIykjU9HJPlx48BQNEre5hUZkPKbO6b5I9Z7IliFqo9yOImA4k1zZ50XbbkUO
	u61eISyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqRdn-00000001jkj-3sO6;
	Thu, 12 Feb 2026 08:01:35 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqRdg-00000001jja-3Lac
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Feb 2026 08:01:35 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b8f7a30515aso183492666b.0
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Feb 2026 00:01:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770883286; cv=none;
        d=google.com; s=arc-20240605;
        b=EguRUn1dHmUPBmOn7/gZXtRQunMs44YUrwu25kNGAQQIx4KN6H3hRQ6AkQPglh4/zq
         eck2Fvbvo3/H3O8+oKvAVSEy4etvugGcA1yiAZfdrNEHgjSL850xeyYGBhO7c9O8BXEm
         cL2sia2Ha3fwlHzI6YwBf2SwBClMqynTQKrBUfixq0cZRRYGuHJ0phZILClu4aattnaK
         vve8NqSx2vLy9W2s5NQYtYwGRR86NlndNIQZB+P4hxkbVyET7lqVr7i3KNOdyKuHyFGs
         KahBphWzdbz3/onglaKuxlgTerJrtV2ztGWHMNAwY20qoUHKUPfWYA4nImWw9rUBQlxm
         B48A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/bjVwokrZxKsldJsperXEzSS9XKywY388N/cfuXNnbI=;
        fh=JDEKlSTW8kodWggP6pvNYbntYr20JDDjQJXG2z7XOYc=;
        b=KSTMeST9btgbnjKzdP1mj8uLg/KAriZCNYVMygaAB4AjongOnCAbGL/qOA8YeqzmT2
         ViNyDTm2a4k383KmmL2QkY00mWzmmWxVQLgP/Z3M14aGncvVmparukul/q2+wW7nzwd6
         UjXnTUUMqO2gBJQpM4TpsVtbTDEzKq+2WzC8ANNHmPAlLl8Nrk6oso56Cyu6WO4w4HF/
         rRMTcw4oOi9Lu9fd3+lKOeg8pY9T8OVzhmyXbmzGTZKe/p4UcMihsqT+OjDne2+eJWlR
         aVPcgsAnb0H7ijDqDDC6X5owZpgEsiQ9unqfimtjFLxMetfuyyRJbWmQr3LR23AWnfUi
         1ciA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770883286; x=1771488086; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/bjVwokrZxKsldJsperXEzSS9XKywY388N/cfuXNnbI=;
        b=nqUjCAfwQ2u72aZw/w/FZ8+MRXHJKgAzrtBS2RZzctaEMzCZ1wCh6dSP/P3ZESbzgm
         Q+xGLyB5THsEcNcl4KekRhXJfM3EouiN/w7dB1okO5/v7X9WvlXEsfaXyJdKQC2To1HJ
         4kREBPdD+Vm1AHMibeJtB0BbY3RDfny3U0TTGH1C2YK+kRX6KmzoeYzftcDVU9P5wqBd
         sJVdea9YwjvvOjzJchFHPeytwJXiJvDrL1jl08R4zgNteGeFxvU4tKn52ycgCE/Fsnm3
         6JxMAAiVzRofu0aSFyPkZl8bnGxFkCtABoEvMgfjJoM0oiwVOxr+0PuIUCQOGeE3lBU8
         VTCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770883286; x=1771488086;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/bjVwokrZxKsldJsperXEzSS9XKywY388N/cfuXNnbI=;
        b=sOqKwFQH+Wss/1MTyiSUTXxx4HZJRSHhK3kRyWeVQgFsLTkyELt5gb2s/vqDz5UqRZ
         u4XwWdIKkfVjCTPEKma4OySX7+0kHes2sP8dflQVaiNkilrUOxkIPW6zK+eocv+fMnCp
         FNoGb1jB7UDGLS3UNsc2Xfri6Ux+2zYRq9sT916B2TrJuEVItW0zUZ7ouyiqZ41j7s1x
         vNlgbRt9rBvZQaPBK2F+fA7hzU/Dbl9UyP5jNuEwLxxit/CxLpY1vdSDtz2uwmengog8
         1glIH9j1DzasS37Io1ykYOspSFHVQS7xmclemXfmmTpz1OKG3G1KCGahg9U61Qpvt/T8
         dp0Q==
X-Gm-Message-State: AOJu0YzAz+85phNdk8jGZ6ELJK+U4u0UJcfQf/8w/qBz9GDBUf0JXVZc
	v9RCsyeY1rWaZHdCCyM+ThLr6pBLNTbG2ijUztykN4LUtaJ5Uy1JNvTu5FoIsyaXL52j9BReNM6
	QeDk7pT+kMhCz75J/unSiw9YbC5xxWayBg02ppWwzDg==
X-Gm-Gg: AZuq6aKs4ikR/RuopM0ql8lmAdfe1J4bXpogOR4gZf7zSolAR/P/41KpNuEaLq7pKc6
	Jxd/VYH8qSgOi6ldFLpQe34QVbjPQwDFcRnn+jUZbRU8SYRG5HUCN+8ZSPoovqjOfEdlkVDSCCJ
	stYlZcoI8kH+4c6z9nEFjzfW1WoSI585DQnLkXyuEZFaQZUSRmLwoTKhlGaI4IvctC8mcYWP7bb
	AJIMRkWEPE/s8lX5/Fy8duMrZ3nHSFQBqFUjQfVreISiu2vK0RX1FyWfU1V8ZO8SZ0er6T1ET9U
	2oHdeaYSbrSNdPPt
X-Received: by 2002:a17:907:5c6:b0:b87:728a:81ac with SMTP id
 a640c23a62f3a-b8f8f229912mr118971966b.12.1770883286087; Thu, 12 Feb 2026
 00:01:26 -0800 (PST)
MIME-Version: 1.0
References: <cover.1770836189.git.l.scorcia@gmail.com> <72dcec7fe8bfd8ee7e8ef58708690268f3c07d42.1770836190.git.l.scorcia@gmail.com>
In-Reply-To: <72dcec7fe8bfd8ee7e8ef58708690268f3c07d42.1770836190.git.l.scorcia@gmail.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Thu, 12 Feb 2026 09:01:14 +0100
X-Gm-Features: AZwV_Qh-kArDFbixo6RuZvbk22282A_FJyXPAiI4Zij2df0ii1VxnMVAlbiH_j4
Message-ID: <CAORyz2LRkVcOss3vFS3Y3FtZfn_s-Um8G9JLgedXEeySorr0=w@mail.gmail.com>
Subject: Re: [PATCH 6/7] arm64: dts: mt8167: Add the mmsys reset bit to reset dsi
To: linux-mediatek@lists.infradead.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_000132_404385_21C65EB1 
X-CRM114-Status: GOOD (  15.39  )
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

I apologize for the mistake, I did not notice that the dsi node is not
present upstream yet, so this specific patch won't apply. Any comments
are appreciated though!
I will send a separate patch to add the display nodes to the dts and
the required compatibles to the bindings.

Il giorno mer 11 feb 2026 alle ore 20:06 Luca Leonardo Scorcia
<l.scorcia@gmail.com> ha scritto:
>
> DSI hardware reset is needed to prevent different settings between
> the bootloader and the kernel.
>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8167.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
> index caf51f203dd3..ee2792d53b2c 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
> @@ -8,6 +8,7 @@
>  #include <dt-bindings/clock/mt8167-clk.h>
>  #include <dt-bindings/memory/mt8167-larb-port.h>
>  #include <dt-bindings/power/mt8167-power.h>
> +#include <dt-bindings/reset/mt8167-resets.h>
>
>  #include "mt8167-pinfunc.h"
>
> @@ -189,6 +190,7 @@ dsi: dsi@14012000 {
>                                  <&mmsys CLK_MM_DSI_DIGITAL>,
>                                  <&mipi_tx>;
>                         clock-names = "engine", "digital", "hs";
> +                       resets = <&mmsys MT8167_MMSYS_SW0_RST_B_DISP_DSI0>;
>                         phys = <&mipi_tx>;
>                         phy-names = "dphy";
>                         status = "disabled";
> @@ -295,6 +297,7 @@ mmsys: syscon@14000000 {
>                         compatible = "mediatek,mt8167-mmsys", "syscon";
>                         reg = <0 0x14000000 0 0x1000>;
>                         #clock-cells = <1>;
> +                       #reset-cells = <1>;
>                 };
>
>                 smi_common: smi@14017000 {
> --
> 2.43.0
>


-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com

