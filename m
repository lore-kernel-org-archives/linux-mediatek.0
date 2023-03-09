Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79179C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 04:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ieOsjAqyzpAajCGC1a5mZjRKapEj1/IVvZ5C1bjX/7o=; b=I4m7bttM7Rp0VaRNj3zFG9vbjn
	5ixS4cOCKfcjXuVUVHSytk3PpD0m9LJI6qtEh+WhvQKrSjR3jgpK7F6sZGvlnszB2hZyykNUtNs4s
	MUCHfeYxehyIGU4+w7SslvWqbbvwCTM0xzNw26++CjRbQjrcZWHBm6DXa/Ix18Bu9sVC/sV7m02G2
	8qKD890rg/BXgco6cuWLz6+HW4YaLHpXc0/Az9Agc29wpd6SUMYXMh1gYX9sti76JeNiLc7FGE1MU
	vm7ib0JbxNOOvs8DiyoibrvIPzF99SWsgpri1Ei6zweUNrQWtRgPtifSR9MX7QbYGnXEEm5VRIakI
	Zh3IQ+Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa7sA-007n5f-D0; Thu, 09 Mar 2023 04:27:22 +0000
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa7s0-007n1s-3o
	for linux-mediatek@lists.infradead.org; Thu, 09 Mar 2023 04:27:15 +0000
Received: by mail-ua1-x92d.google.com with SMTP id l24so307832uac.12
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Mar 2023 20:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678336029;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ieOsjAqyzpAajCGC1a5mZjRKapEj1/IVvZ5C1bjX/7o=;
        b=SmHOlIfvlICUpOY6DbOtEod/qcZ4atqdL5fcjKjl7+LbbYwTZjl5ZED7Dq4SEk59ap
         ankUrwYHpFYkcIDvrBYd6LSIYXprJmtmR1CmFWk+oK01IPAe5jvSAteb1V3ZThU85Udw
         qmtUiHOlBORl27jOCtUK6kvLCmwL1IRiHgksc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678336029;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ieOsjAqyzpAajCGC1a5mZjRKapEj1/IVvZ5C1bjX/7o=;
        b=ZHfj7GheDi0qkfxsC/E2FneE4ibuZ5pAAM0tEBJvxToX5ifAO54ySB3uxefmfjSxll
         qvDI2qdqAABnvivO9ZjzTtpdMDIiPa6dwzg8+Vq5MTV04I/23Vkzq9IxzJEVEMH3n+ov
         m/oob6ozeZuo8NcFaJGVtLem8U3MoL6oS8b7sGGJbnPNdJvUMAvSDv/q+7/W2HyHowFu
         nBBVMTRevs+2eIxIyRzOVL7/MJLJ8rGaBo0Mkg3YP6VT5R3Egxav8fd9/upGukRH7lYv
         3Y3zSrt2/0nV4i+HTpmhWKsRw9g8c15gfVjpg4yGToEY10EY80jsvKosgjXlYWFMtQBw
         ARIg==
X-Gm-Message-State: AO0yUKXrcBB48mV9LYb7cCO46kwwTWt5AlzORZ7gjKlCLWY8SmiCybsp
	nmRjBwuSFWC/LJTDAJ4QUDBjpvcmFIp/edjzuRbraQ==
X-Google-Smtp-Source: AK7set/gee51c9AlWy0aEk/2rrxCvuyAgRAg2qGcJMrG0xU2avrdZyZgYSTGxy1emfR/hwcrDnyE7ZFHD9JuLjx4uVg=
X-Received: by 2002:ab0:470b:0:b0:688:c23f:c22f with SMTP id
 h11-20020ab0470b000000b00688c23fc22fmr7754413uac.1.1678336029680; Wed, 08 Mar
 2023 20:27:09 -0800 (PST)
MIME-Version: 1.0
References: <20230206100105.861720-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230206100105.861720-1-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 9 Mar 2023 12:26:58 +0800
Message-ID: <CAGXv+5H6jdWc0zKnW8LjsPYACoG1vRJHtTJUMHzY_8VYdX7g6g@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] MediaTek Frequency Hopping: MT6795/8173/92/95
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, 
	edward-jw.yang@mediatek.com, johnson.wang@mediatek.com, 
	miles.chen@mediatek.com, chun-jie.chen@mediatek.com, rex-bc.chen@mediatek.com, 
	jose.exposito89@gmail.com, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_202712_224939_7145EE39 
X-CRM114-Status: GOOD (  16.63  )
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

On Mon, Feb 6, 2023 at 6:01=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Changes in v3:
>  - Added commit to export register/unregister/parse FHCTL functions
>    to allow building clock drivers using FHCTL as modules
>
> Changes in v2:
>  - Rebased over v4 of my clock drivers cleanups series [1]
>
> This series adds support for Frequency Hopping (FHCTL) on more MediaTek
> SoCs, specifically, MT6795, MT8173, MT8192 and MT8195.
>
> In order to support older platforms like MT6795 and MT8173 it was
> necessary to add a new register layout that is ever-so-slightly
> different from the one that was previously introduced for MT8186.
>
> Since the new layout refers to older SoCs, the one valid for MT8186
> and newer SoCs was renamed to be a "v2" layout, while the new one
> for older chips gets the "v1" name.
>
> Note: These commits won't change any behavior unless FHCTL gets
>       explicitly enabled and configured in devicetrees.
>
> [1]: https://patchwork.kernel.org/project/linux-mediatek/list/?series=3D7=
14059
> AngeloGioacchino Del Regno (7):
>   clk: mediatek: fhctl: Add support for older fhctl register layout
>   clk: mediatek: clk-pllfh: Export register/unregister/parse functions
>   dt-bindings: clock: mediatek,mt8186-fhctl: Support MT6795,
>     MT8173/92/95
>   clk: mediatek: mt6795: Add support for frequency hopping through FHCTL
>   clk: mediatek: mt8173: Add support for frequency hopping through FHCTL
>   clk: mediatek: mt8192: Add support for frequency hopping through FHCTL
>   clk: mediatek: mt8195: Add support for frequency hopping through FHCTL

The changes look good to me overall. I've asked MediaTek to take a look
at the various parameters used is this series, as I don't have the register
definitions for the old version, and from what I've been told, the slope
and other parameters depend on the chip design as well as manufacturing
process used.

So, code wise this series is

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

