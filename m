Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7286DC64EC4
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 03:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rHr1GGsOjXLcWLjsmH/gUiANtjkEwqYh6mSdD4znyFE=; b=O0uTxhakhQlh1qdUl2OM3tWPtK
	CUGdp84pquuTnsKmpcitK95KO+NgRUgoTFuHU5j72z7l410QVuvdgek5vpjbqiWrLV22GfDS7a0lt
	iQA2b2CPLjxnooIRmcVLfPRrdbrfcotsdtoF5EFd/jwxPccha299r5WT812zXDxKYExRImjkSCmzt
	Xf8zEITRW8suTBXiAYYH+vuUprXODyx/mEBmcOkdMNBS+fUNfhzwd9uvhqD5bKQ8vgQhU37bJObQj
	lXp29TWKaPvD84gbjhcrkITAAaT36zX9hE+eUJf16mjFmxUBasgbXJH1hv9xaCcKTd2W1SdRuf1HU
	kXSsTTHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paTKz-00CrT3-Ng; Fri, 10 Mar 2023 03:22:33 +0000
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paTKw-00CrQ9-HU
	for linux-mediatek@lists.infradead.org; Fri, 10 Mar 2023 03:22:31 +0000
Received: by mail-ua1-x92c.google.com with SMTP id bx14so2679146uab.0
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Mar 2023 19:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678418541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rHr1GGsOjXLcWLjsmH/gUiANtjkEwqYh6mSdD4znyFE=;
        b=B90+ToIXUteCBlMGv/h+HRTmHi/Hj5vUhO45dJWlo/KFuWBFEtCuLw1vHQRdVj3a9l
         XPRRun4yKYYLVGrsnB03glAgEX+m4GKLQfT3MSfs01SXEVIWrC0H3Gj2lcuEtRZVmraP
         Q1uW2Rqv+LQH3B2szv8EsVhwNW4VRyLMAquH4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678418541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rHr1GGsOjXLcWLjsmH/gUiANtjkEwqYh6mSdD4znyFE=;
        b=Fq2w56hUvrvNoujwIZSLBX2CarjKe/6ooy13bIzJtWZRuJw4MnL4StrLIaORXdVQ/3
         1wVuFvesjkSgpSqUBxIwGHeWrAol/OCefV0jOeDGxgj9oBKyfwXZWfiRKscRVtKCG4JX
         xoxwZydG6bsNgvlecdfDFc/56XrSx5SggCz7zNBmXdet3pY2zEVf1IKJChXLaq9sVlZq
         dyZW4C26Fg+fS2l4hzmDQNXExAwrnV+q95Dgns9MAxwyB3ydqkVYRLscNhSjqAbDgG9R
         Mm96ZQRWZ3SuSvNz0a7FdlLsJpodcdbR72B8ZFGCxHWNYCg2kjuX4d7L5gsqimYMJSJA
         Ywaw==
X-Gm-Message-State: AO0yUKWm0oK2nMScnWrLI9VNB9XCeXNiSpoWviAbVOBVmwPMiQ/q6Q+q
	hs0NOpCoh3cCwKK0QA4flyeN3s53zSkdnqcSofJbFA==
X-Google-Smtp-Source: AK7set8faFGJ+bOZYGnxseavaFiHmTnrgryhuZbd0Hj/FWE/b7datWYPM+PvMM7obIRbTIYTrtYMG7ouTbxFDjo/zDE=
X-Received: by 2002:a1f:c507:0:b0:401:2297:b2e0 with SMTP id
 v7-20020a1fc507000000b004012297b2e0mr14336398vkf.0.1678418541550; Thu, 09 Mar
 2023 19:22:21 -0800 (PST)
MIME-Version: 1.0
References: <20230307154524.118541-1-bchihi@baylibre.com>
In-Reply-To: <20230307154524.118541-1-bchihi@baylibre.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 10 Mar 2023 11:22:10 +0800
Message-ID: <CAGXv+5F6yFk+VMUe50YfV11Bx3qnQ=FHymeAM=dgfrqwLGrG7Q@mail.gmail.com>
Subject: Re: [PATCH 0/4] Add LVTS's AP thermal domain support for mt8195
To: bchihi@baylibre.com
Cc: daniel.lezcano@linaro.org, angelogioacchino.delregno@collabora.com, 
	rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com, 
	matthias.bgg@gmail.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	rdunlap@infradead.org, ye.xingchen@zte.com.cn, p.zabel@pengutronix.de, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, khilman@baylibre.com, james.lo@mediatek.com, 
	rex-bc.chen@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_192230_601959_308CFA41 
X-CRM114-Status: GOOD (  10.31  )
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

On Tue, Mar 7, 2023 at 11:45=E2=80=AFPM <bchihi@baylibre.com> wrote:
>
> From: Balsam CHIHI <bchihi@baylibre.com>
>
> Add AP thermal domain support to LVTS Driver for MediaTek MT8195 SoC.
>
> This series is a continuation of the original series "Add LVTS Thermal Ar=
chitecture" v14 :
>     https://patchwork.kernel.org/project/linux-pm/cover/20230209105628.50=
294-1-bchihi@baylibre.com/
>
> Based on top of thermal/linux-next :
>     base-commit: 6828e402d06f7c574430b61c05db784cd847b19f
>
> Depends on these patches as they are not yet applyied to thermal/linux-ne=
xt branch :
>     [v14,3/6] arm64: dts: mt8195: Add efuse node to mt8195 (already inclu=
ded in linux master branch)
>     https://patchwork.kernel.org/project/linux-pm/patch/20230209105628.50=
294-4-bchihi@baylibre.com/
>     [v14,5/6] arm64: dts: mediatek: mt8195: Add thermal zones and thermal=
 nodes
>     https://patchwork.kernel.org/project/linux-pm/patch/20230209105628.50=
294-6-bchihi@baylibre.com/
>     [v14,6/6] arm64: dts: mediatek: mt8195: Add temperature mitigation th=
reshold
>     https://patchwork.kernel.org/project/linux-pm/patch/20230209105628.50=
294-7-bchihi@baylibre.com/
>
> Balsam CHIHI (4):
>   dt-bindings: thermal: mediatek: Add AP domain to LVTS thermal
>     controllers for mt8195
>   thermal/drivers/mediatek/lvts_thermal: Add AP domain for mt8195
>   arm64: dts: mediatek: mt8195: Add AP domain thermal zones
>   arm64: dts: mediatek: mt8195: Add AP domain temperature thresholds

Whole series is

Tested-by: Chen-Yu Tsai <wenst@chromium.org>

on MT8195 Tomato Chromebook.

