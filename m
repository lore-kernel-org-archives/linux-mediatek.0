Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CDD7FF885E
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Apr 2026 13:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L7//5ece1DlWDMT1aLpKgGFyRfsm8Y+IqHoNcwNLtWg=; b=mlUt/D2pGQMGg6SN+bjE6L4NT6
	gei9UvSSChUNLLlKB/jVxGXRq+H0JlPI8g6A/sNxbQKf4uHpEEtLfKxCeRVnp7uSk5HqO0GDxemg9
	fgOB+bzYUdnPtccgKDqNrzqCfBFN6lDHyW42MbzF+Ahg0sp0NQvvYCgW3rippJ3B+XXHCu4EFq2ku
	wACEPav9l4cn9+4Rvi53O2wl3K87QACIau4/fHlN+WjXePfUfLe5r3w5tE/T1Akm5ZnX2IcDmdJQk
	pyON/n4Yvtn2T+0Ro046B5hBaQVR3dAwdEeCCwQRMgXkaJqjczeEcPX7zvQH+/3XoZd8+/7kANxh+
	mcx03/EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHLmd-0000000Gz8D-1ZfJ;
	Mon, 27 Apr 2026 13:13:55 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHLmZ-0000000Gz5s-1ibO
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Apr 2026 13:13:52 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5a2b5ea59a1so15433545e87.1
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Apr 2026 06:13:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777295629; cv=none;
        d=google.com; s=arc-20240605;
        b=kKmN7b/zaH2yWFXQrCKKcuJodiQMbEbLfKV8ge6aCbTgOGmnLOh7Kts2kUwSWD4Vof
         kF4PiTbRuFWj5KmTVrzBredOubsaUBwL4sQNMveANuu4UXSVa0Pj6oQRyWC9rgSbjXh6
         gym3FqdAxHiH1R6mFRcLvw1NgIrnIu75Cf6sIn/Wmkj2SxsLv9NYQea2IAq0LgppR98y
         uDpgABC9ybQIo/0RvCperMUau72DtEUrEsIyQVGcPmGUqItWYu2nFyfj8qTAC1x0LHh8
         leycHO6ResZNOq0MYkHYa0yUGlscEqwKU7plvFUi5PZhkykosJUWzPubCbNwMZjdJXRT
         5j0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=L7//5ece1DlWDMT1aLpKgGFyRfsm8Y+IqHoNcwNLtWg=;
        fh=+kmt29LGt9jqLJF2BSWqXjqdFOygzpxD9bHi8RwzsbM=;
        b=TQSWcfWZmWop8rclxzQZPK/wRffvbGwY8JEWHSRMXRqVSVJBqqdVH0/qGD/FnpyH+V
         1OcODBkS0kRpHZomWnuiSgPntp/O8IAGqfd3UoxnLrrOFZb51coKe1oL2gvPlNhuQMnJ
         Ys4oOF9OZ6IDfScWABN9VZtEtkLA83P3GBM0t2jYugIunOjy9FvGiY269fZ8KOP163Ze
         1Ru1DYhw25yJHz0e3HQaFukFZUmM9VGqTG8CT1kEZnLsBGVcNofPqyURhv0jDzDJRkA0
         DbMQd57iteluDMrfeE4jJHVvBJD9powsAZNX3nn2e6HAb1DQkrs4tzitXZK9g4TLE96L
         okQg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777295629; x=1777900429; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=L7//5ece1DlWDMT1aLpKgGFyRfsm8Y+IqHoNcwNLtWg=;
        b=V3HdL5ujHrahwb6LcApHXUMfbFDGgGRPtl/hG3jDYZa1dBln/ktelGF1qFzGcRLMmT
         R4JDhuN8C/Lg/6CTiXN+2xcKFXvbkwspo15s+7GM8VEMDYTrPN7qk1qWnYWnHh2qLuMR
         pPruKMnpzMc+IfeDwcjRSAnn2SniFeTWsDvoRT0NCiSktREK1EIBFKF6ycE2L4PllDe/
         7/IxRwc/0n6N3yAxATiHj8PlKumSC3vPC4TSrmu8B8q4itwCr3n9JFsuNATkmVRTwSJO
         5pLWPX8qiad6jgpVRunBQ79j4ZX2hFewk2rjYgjY+bASWDq4N5LZ/YA42T7a50lDmCkC
         cvBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777295629; x=1777900429;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L7//5ece1DlWDMT1aLpKgGFyRfsm8Y+IqHoNcwNLtWg=;
        b=jBJHhTdhj+EW98E+WCfHYNT029kJBtvYl4HZENfZbymeIfSj5vRoucBJr7SqlucUyX
         aKqRzSjUlq8y3Lz05iuPW7x1IWqxevoGl84rgRiJXj2ijDjHVBoOAcz2d2xIQnR+n1kc
         3Q9ZPNVBhgbvevnU3ZXTkuqoTqWMQXZxDn7xnJMR4xncPR2lfm6Uo3UVCR+INNb7kBAM
         CO7z5aYP2+S3MhAc+sttPHRugLOpQBctp2wkrX0R69wu9tFcKhpw+7UiW0hqBRwvI3bt
         L/+REqBaTQQRpT4Nnk8lD7hIt6yMlkA/n5y5/KwmgRj3ZDzkOd0uz6DzOlAuJhK6PQAL
         o20A==
X-Forwarded-Encrypted: i=1; AFNElJ9tAO9oRf+IxekZDFayrujNXCOImyfntwMr1pycYCdDCEdl3BRzzr6TSthXSG8OpZy0KP1FCDe/OnUX/EYtJw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzhPM3q8aIzu9JWioI+HH8jUGHemkM75BfHepH5oQyZ67tUbLLV
	5ijY8o4tlttbhnedBCwVuy35jYJTPXWzWnLMUkWXmZJiyjDHrr4rPfkQTZxEJrgkFgyjOecgl3I
	nw0ZL9ZNWb12uWkeX2SG0k0DUpTLpMC5BhGuIOYuHxQ==
X-Gm-Gg: AeBDietVFOcazLSMduCRRhrky4uv6RQmihPtibSIshPSRJm49Fga/YsQxYI3chyWLx3
	/WWybvRCCeHgRc5kx/w3BZ8RD9iUdCOYh4jajR+xOPSJAU7O7sSyfKZyWshkMcjzDtxqfc0yXa3
	+6myUooEqECqVTRozzcfl55pU0sh6sCCjAfYzNXPqB82SMEmrqN66LHo+fqvRmOWkgoFPfUFQOQ
	OlLiJ5PKp+tVoG/YOVUf//3kr0Q/Ks2Rm5YcbwOJRleqqoI8pfZlYlveSj86IjskyiyWrOn5gI/
	5Z/m3jNi3X8+64Z3DWo=
X-Received: by 2002:a05:6512:3193:b0:5a4:1672:59e0 with SMTP id
 2adb3069b0e04-5a4172cd574mr14121153e87.19.1777295629037; Mon, 27 Apr 2026
 06:13:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260408141121.386522-1-vulab@iscas.ac.cn>
In-Reply-To: <20260408141121.386522-1-vulab@iscas.ac.cn>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 27 Apr 2026 15:13:12 +0200
X-Gm-Features: AVHnY4KIw0y71PHOTou49MhZ1vsAm_GUfrl6yfolmci7Zff-_TktbzdbSpL-x1c
Message-ID: <CAPDyKFrTG6tp9XbuiUYjgMYkHYQwVsyXBuggCc3Lp=J_NcKTyA@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: mediatek: fix use-after-free in scpsys_get_bus_protection_legacy()
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, nfraprado@collabora.com, 
	Macpaul Lin <macpaul.lin@mediatek.com>, Adam Ford <aford173@gmail.com>, 
	Chen-Yu Tsai <wenst@chromium.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_061351_543535_048A9688 
X-CRM114-Status: GOOD (  20.74  )
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

On Wed, 8 Apr 2026 at 16:11, Wentao Liang <vulab@iscas.ac.cn> wrote:
>
> In scpsys_get_bus_protection_legacy(), of_find_node_with_property()
> returns a device node with its reference count incremented. The function
> then calls of_node_put(node) before checking whether
> syscon_regmap_lookup_by_phandle() returns an error. If an error occurs,
> dev_err_probe() dereferences the node pointer to print diagnostic
> information, but the node memory may have already been freed due to the
> earlier of_node_put(), leading to a use-after-free vulnerability.
>
> Fix this by moving the of_node_put() call after the error check, ensuring
> the node is still valid when accessed in the error path.
>
> Fixes: c29345fa5f66 ("pmdomain: mediatek: Refactor bus protection regmaps retrieval")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/mediatek/mtk-pm-domains.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> index e2800aa1bc59..d3b36f32417c 100644
> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> @@ -993,6 +993,7 @@ static int scpsys_get_bus_protection_legacy(struct device *dev, struct scpsys *s
>         struct device_node *node, *smi_np;
>         int num_regmaps = 0, i, j;
>         struct regmap *regmap[3];
> +       int ret = 0;
>
>         /*
>          * Legacy code retrieves a maximum of three bus protection handles:
> @@ -1043,11 +1044,14 @@ static int scpsys_get_bus_protection_legacy(struct device *dev, struct scpsys *s
>         if (node) {
>                 regmap[2] = syscon_regmap_lookup_by_phandle(node, "mediatek,infracfg-nao");
>                 num_regmaps++;
> -               of_node_put(node);
> -               if (IS_ERR(regmap[2]))
> -                       return dev_err_probe(dev, PTR_ERR(regmap[2]),
> +               if (IS_ERR(regmap[2])) {
> +                       ret = dev_err_probe(dev, PTR_ERR(regmap[2]),
>                                              "%pOF: failed to get infracfg regmap\n",
>                                              node);
> +                       of_node_put(node);
> +                       return ret;
> +               }
> +               of_node_put(node);
>         } else {
>                 regmap[2] = NULL;
>         }
> --
> 2.34.1
>

