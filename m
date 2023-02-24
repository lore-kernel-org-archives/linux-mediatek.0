Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E79C64ED8
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 09:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RAHZ9cKBBV2LwSn9/zPRVzPfKfg4x4dSAZBG8sLVBgU=; b=MQlwm7STSCUxCa0PxZvlJhe834
	UbI5ddGEDHeK1R6/A9PcuRJeweXJImwmzwf/fYpMBYCyW02h69AyEemvrhQPs5grJ0fFJnb0J7Wi4
	HfN2Yk4nV5i0dOi4gBGridPm7jOKXFz9FnQzp6FVG51KGjYezC0q9Oh6IkXewi8EQt0/UZ2Ht+UQG
	TPsmIokV5WktUiCqRJpUroCxZ5NMLJjkoYtNT9W5sNEvcSmkveEmQ+U0kDqFBCv1cFxvwaD/mlA19
	Pjzi/lQQwUkzLisbs2qRk59fZDxd7HwqEG90QiSeF1UUb7nD52zSlQVaGqJf4dbmiAdEbLI9GtvFX
	hUKkUUFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVUpd-001nQt-8I; Fri, 24 Feb 2023 09:57:37 +0000
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVUpL-001nJw-FE
	for linux-mediatek@lists.infradead.org; Fri, 24 Feb 2023 09:57:20 +0000
Received: by mail-vs1-xe29.google.com with SMTP id m10so18757091vso.4
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Feb 2023 01:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RAHZ9cKBBV2LwSn9/zPRVzPfKfg4x4dSAZBG8sLVBgU=;
        b=iG9gidYfEVf9lxEdJHr/frmoYwz96LKdV2a4nqaaSWwF7OAasL5tAC1qGO+XGxQIBU
         GpLhfPk32QpTpgKqcMAo4o89quE8p+AA8WiHfxN3F6SOgdegUwE+tfHY2zusxsIET18r
         +J1VsSao3s8H/A2fIS2ZpjIEkbrlaNL/VIltA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RAHZ9cKBBV2LwSn9/zPRVzPfKfg4x4dSAZBG8sLVBgU=;
        b=oq4gH8bo3FMaa9MIUvCRlR+6g0fSMiP/7QGW7QEZmh9hTiEYcQpqEydxOO0QwGGd7K
         ygtNkb6q1lmzgmQI0hQVz/NJkzjMe0arN1WG1uwJjqOFUiLaDLpzlYPO3sIYrjuXKOsv
         AHv+sYAhuKQuEjoGJkE5Kd5lw9r7hYuJ9U2Ow76QSiInRXFY4VAfGmRCznKa3Q5eVuHS
         sv9fvaltdaiSoCqjKvQmu08rsdmoPj1PvLWBXrDJeFLWCNnImuzCEFf8rGH4QaktOdEt
         ikc51UWvjmH9igPPEFFL3uLHJk5tQhI8mPR981hVLDSxZjcU62Tb4Sq2cvYPp40HY0do
         kz8Q==
X-Gm-Message-State: AO0yUKV4Lc3sl5qv9TORkEFWfa8NJmxumliE9APWdBOUW9bO1YpZ5eFM
	HC2OWfSXFEnUOlaxagVNbfBvAV+nprj+wVMiP+eLKQ==
X-Google-Smtp-Source: AK7set9ECBliwTz1U7da3oEuel1KUAA2o9DoZllUvIWerjx85dWw1VIVGKL8RMLtOdq6HBuz2XEj78CKkrhSFUhaBcQ=
X-Received: by 2002:a67:d28b:0:b0:412:2f46:4073 with SMTP id
 z11-20020a67d28b000000b004122f464073mr2145977vsi.3.1677232638508; Fri, 24 Feb
 2023 01:57:18 -0800 (PST)
MIME-Version: 1.0
References: <20230223134345.82625-1-angelogioacchino.delregno@collabora.com> <20230223134345.82625-9-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230223134345.82625-9-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 24 Feb 2023 17:57:07 +0800
Message-ID: <CAGXv+5GECpvXB3qoPr0TwrJP-tOaPULd8uiMOcTKWX5f4zvWWw@mail.gmail.com>
Subject: Re: [PATCH v2 08/16] arm64: dts: mediatek: mt8192: Add mfg_ref_sel
 clock to MFG0 domain
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_015719_545377_022A3427 
X-CRM114-Status: GOOD (  10.70  )
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

On Thu, Feb 23, 2023 at 9:44 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The mfg_ref_sel clock is a mux used to switch between different "safe"
> (and slower) clock sources for the GPU: this is used during MFGPLL
> reconfiguration and eventually during idling at very low frequencies.
>
> This clock getting turned off means that the GPU will occasionally be
> unclocked, producing obvious consequences such as system crash or
> unpredictable behavior: assigning it to the top level MFG power domain
> will make sure that this stays on at all times during any operation on
> the MFG domain (only GPU-related transactions).
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

