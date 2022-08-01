Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE739C00144
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Aug 2022 09:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=obTtYKen62thne/B0uGj9je/51gZFs6diILR5ElHHDY=; b=BApDqxnLdEztEuHH3zkeL4WfXu
	e58YSrG0NszUDUQcm2hgKIy/KwjjraXU59tajYu7bFCis7F2BUGxN8+ZNXQiRHTidkOIhihRXCqR0
	6DVLKNAGpXHjAk3GwvSlZZbw6SnyCoycwcoGN1c8pfLJ0sR3aBaFpH5hikUT9fgi+fzNyfpv2SBJT
	BXhCL7JiVha5b3E06u1t5dH/Jf5XKIrsjBtisCLuqqjFUowcEiDvDYKxTOsIEt2vLQvv+TkZzLGgA
	XUdKT8107h4XAEtSwBRo8wHnIDYXepWOhbXyyy25C4u4/Zwi0u8TsqDnteqHJ5T0kWrbr/HM9Rt9h
	vtj9Pkjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIRk1-004UN0-P5; Mon, 01 Aug 2022 09:29:37 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIRjl-004UGI-Rq
	for linux-mediatek@lists.infradead.org; Mon, 01 Aug 2022 09:29:23 +0000
Received: by mail-ed1-x52c.google.com with SMTP id m8so12925475edd.9
        for <linux-mediatek@lists.infradead.org>; Mon, 01 Aug 2022 02:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=obTtYKen62thne/B0uGj9je/51gZFs6diILR5ElHHDY=;
        b=hsWLa4BrC0o0QXd6SkiuRmKS5roYPCvtJuVmU/ICM2nMQxkoAzQFQ06Dc/+OAsnWg+
         zC7LXjv5ZoNPQH09XJoFSg3XQU/yea67tSXJoaD/8BnfdSAwnMw2XDnHfX0ITFaml8Fd
         A9Ogarcyhhe6c6+/OQDQ2CigICMfPtOKR1NK8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=obTtYKen62thne/B0uGj9je/51gZFs6diILR5ElHHDY=;
        b=6Z3xeFN9PD/qX56c46eBWd5KiJwXQYtG3Hj+yUSNxGFbDEbdDBBxW3SKfq6WJRo7Z3
         7MTPgN62pdrwhFJ/Dx8fYDd1OlXwGUJYFxfSCq5JURu/tNbZjHWCExMDmXtkqYYbRH+H
         2vypQHpubLd8+xAe/KvqlecFmglFpTBurPR90isHSsKL92dn0BPZwVF1zK449BOHV3dU
         d9UMLLL/5ihJGhTj999WauY9MAmKJwjQiVjhi3KBt0ktjiZoaRs+O9EFijH5gFS8XLfR
         17O5p4ifoHXZf+wtaD/zZUzHIA/sp01IFyDyobz0pjfpO4tGYwojweNH4W48h7PTmfy/
         nGfg==
X-Gm-Message-State: AJIora+/pksfjcLIEQ+BtW+qFwvrVxVothM4S69t86h/UqVeLjHEOBDv
	mXGtKwukNkOJ1TLKHT4G9+avfJwqRujFwdLxYMcTuA==
X-Google-Smtp-Source: AGRyM1tRH4RzrfzNVoO0RpBTUEIib7rIt1ZOlTCzF7HaSBEwbGmu9ZFb9JEy+ezMdtCPlSTh4FFkAMTlPmHhLDRdr00=
X-Received: by 2002:a05:6402:5513:b0:43a:b866:b9ab with SMTP id
 fi19-20020a056402551300b0043ab866b9abmr15337086edb.290.1659346157810; Mon, 01
 Aug 2022 02:29:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220721014845.19044-1-allen-kh.cheng@mediatek.com> <20220721014845.19044-2-allen-kh.cheng@mediatek.com>
In-Reply-To: <20220721014845.19044-2-allen-kh.cheng@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 1 Aug 2022 17:29:06 +0800
Message-ID: <CAGXv+5HXwVpaJPV-4Z6qw14xZzEkx_E7dVks6-GBa7bQyN8hCg@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: mediatek: watchdog: Fix compatible
 fallbacks and example
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, nfraprado@collabora.com, 
	angelogioacchino.delregno@collabora.com, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220801_022921_914585_F4BC873C 
X-CRM114-Status: GOOD (  24.27  )
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

On Thu, Jul 21, 2022 at 10:50 AM Allen-KH Cheng
<allen-kh.cheng@mediatek.com> wrote:
>
> The watchdog timer of mt8186. mt8195 and mt7986 have their DT data.
> We should not use 'mediatek,mt6589-wdt' as fallback.
>
> For mediatek,wdt example of mt8183, We remove mediatek,mt6589-wdt fallback.

I think this needs some more information.

Right now on the kernel side, mt6589-wdt provides just watchdog support.
The SoC-specific compatibles that are touched by this patch provide reset
controls in addition to the standard watchdog, which remains the same.

If that is the case, then the fallback compatibles are correct. A fallback
says that the new hardware is compatible with some older hardware, and
can be run with the driver supporting that older hardware, likely with
reduced functionality.

As an example, if mt8195-wdt is backward compatible with mt6589-wdt,
then it should run as mt6589-wdt, and would just be missing new
functionality, in this case the reset controls.

So either mt6589-wdt also contains a reset control that is not the same
as the other newer chips, or has some other functionality that the other
chips contain, and justifies the removal of the fallback, or this patch
is incorrect. Note that mt2701-wdt and mt762*-wdt are still listed as
compatible with mt6589-wdt. So I think a better explanation is required.


Regards
ChenYu


> Fixes:a45b408a020b("dt-bindings: watchdog: Add compatible for MediaTek MT8186")
> Fixes:b326f2c85f3d("dt-bindings: watchdog: Add compatible for Mediatek MT8195")
> Fixes:41e73feb1024("dt-bindings: watchdog: Add compatible for Mediatek MT7986")
> Fixes:f43f97a0fc0e("dt-bindings: mediatek: mt8183: Add #reset-cells")
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> index 762c62e428ef..67ef991ec4cf 100644
> --- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> @@ -14,12 +14,12 @@ Required properties:
>         "mediatek,mt7622-wdt", "mediatek,mt6589-wdt": for MT7622
>         "mediatek,mt7623-wdt", "mediatek,mt6589-wdt": for MT7623
>         "mediatek,mt7629-wdt", "mediatek,mt6589-wdt": for MT7629
> -       "mediatek,mt7986-wdt", "mediatek,mt6589-wdt": for MT7986
> +       "mediatek,mt7986-wdt": for MT7986
>         "mediatek,mt8183-wdt": for MT8183
> -       "mediatek,mt8186-wdt", "mediatek,mt6589-wdt": for MT8186
> +       "mediatek,mt8186-wdt": for MT8186
>         "mediatek,mt8516-wdt", "mediatek,mt6589-wdt": for MT8516
>         "mediatek,mt8192-wdt": for MT8192
> -       "mediatek,mt8195-wdt", "mediatek,mt6589-wdt": for MT8195
> +       "mediatek,mt8195-wdt": for MT8195
>
>  - reg : Specifies base physical address and size of the registers.
>
> @@ -32,8 +32,7 @@ Optional properties:
>  Example:
>
>  watchdog: watchdog@10007000 {
> -       compatible = "mediatek,mt8183-wdt",
> -                    "mediatek,mt6589-wdt";
> +       compatible = "mediatek,mt8183-wdt";
>         mediatek,disable-extrst;
>         reg = <0 0x10007000 0 0x100>;
>         interrupts = <GIC_SPI 139 IRQ_TYPE_NONE>;
> --
> 2.18.0
>
>

