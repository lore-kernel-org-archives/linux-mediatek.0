Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B05BEE4993
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Aug 2023 19:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dzZ3X8T6ZFCLMeUjvF7612/5hsqzJ6gogDeFMMXF540=; b=2XT7fFmhkrEsmDAxlYrXHjs2wm
	uWXLAHRHWpY/c+ooNQexTt2J/Fq5xIjWjoDKsdYie4yMtvKWWWQcBgx5LXuoVhYBPECumHph5+diF
	kwkvl6AUqmKPpa0rwwbovxIRG3mp9dL74lQK925xAaJ+1cWi3Of7PB43/dqMsCdT6hBibKL54KCte
	hW9MnAQfNXRGUB9pWxH5OU9vlIYzpiyT37UQdodLlKJIuuuUfAtXLcSSHrVaT1l4dMaXfnaNmsUbs
	YS7Sew1Sc/fKUua4osBtAnGHSVIPNgVL5Z9AS7onAlwbxVg7kjNHU6ur7NPI0v0ueUYBDIuL7u9UT
	QjlwJcOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYXAJ-00GiP3-0J;
	Tue, 22 Aug 2023 19:35:47 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYXAG-00GiNq-1l
	for linux-mediatek@lists.infradead.org;
	Tue, 22 Aug 2023 19:35:45 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-523b066d7ceso5904785a12.2
        for <linux-mediatek@lists.infradead.org>; Tue, 22 Aug 2023 12:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692732943; x=1693337743;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dzZ3X8T6ZFCLMeUjvF7612/5hsqzJ6gogDeFMMXF540=;
        b=yq1WQle4CCQ/YhFz4PYdRp+uPdawPD8YwMOqyB3TccoeRYVf8f7wiKXk35qmCWOOfy
         YoGNa0sREWi11JyEK2OkIrlj0r6/RCrXtwzflwos3Ex0hnutVjTpSoeAJJ2RJvi7O6bF
         4XysSs1iUnV8Domu/vIHsui/AoBmeyVp0y0igFbvE33g0nWyPyBf/F6nK1yB9bJSq8Ds
         2T0KTOyec7WaQqr2LZdBqosSQREDPloFRkmNlhQt+5mFN0leHIq3r74IA63bMq3dfKzq
         EASC3GBpG+2SwFVtUkc3RTBKIIrbjjlf71O9ntnyH93BffeDptX2JUFZkR0mnIe21mAq
         7N1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692732943; x=1693337743;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dzZ3X8T6ZFCLMeUjvF7612/5hsqzJ6gogDeFMMXF540=;
        b=V0A1x+f77OLxif+QYsESd5pjP3Uv1dBYWxyPktrXlDBZEnBmbTC6XyHdr4Kr6vGT+O
         tat1R0DbYB3oIIPmWK3FgX4ncmz9pIVAtrpvddTm0jqOcpAFLEwJGkurrPUXMnU7FxPQ
         htyyuH0KmUfnwOcNh2Nuk8SD1qvDsNHP7Jr4JNTWpceDbTrD5+pbLh6Qsw7FzARXkgce
         U5iGwS4RjvWlg506hTyrgohEGLIxbnQl+83+E3xBv5Q0T4H5QCeWNbVTgn7XMGaOCbaq
         1/i/mPsHqUb0B1oiUldNzJMELbJM5jhUb206Gg+rIU4qZp2j4W9mWelvamKcKD2VrIuz
         M++w==
X-Gm-Message-State: AOJu0YxRHDXVYw7W0UYSDXeMHToU78kRrbUnADzMosVJxOghm/X6yc4u
	W6BHUg0UMwp1uqTCkZgf64nkwA==
X-Google-Smtp-Source: AGHT+IGP/JccbWhRnfBuRaU+wbcMwiIFtV6ls46Kia79H135jPfCC3U1PwUpdFlXToKAieWl6J/bEg==
X-Received: by 2002:aa7:c48d:0:b0:525:440a:616a with SMTP id m13-20020aa7c48d000000b00525440a616amr8469545edq.20.1692732943196;
        Tue, 22 Aug 2023 12:35:43 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id t8-20020aa7d4c8000000b0052a1d98618bsm755238edr.54.2023.08.22.12.35.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Aug 2023 12:35:42 -0700 (PDT)
Message-ID: <19d01c38-53a9-37f9-5170-6461562cdd36@linaro.org>
Date: Tue, 22 Aug 2023 21:35:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 01/11] dt-bindings: mfd: mt6397: Split out compatible
 for MediaTek MT6366 PMIC
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Mark Brown <broonie@kernel.org>
Cc: Zhiyong Tao <zhiyong.tao@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230822084520.564937-1-wenst@chromium.org>
 <20230822084520.564937-2-wenst@chromium.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230822084520.564937-2-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_123544_581512_E700A905 
X-CRM114-Status: GOOD (  12.56  )
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

On 22/08/2023 10:45, Chen-Yu Tsai wrote:
> The MT6366 PMIC is mostly, but not fully, compatible with MT6358. It has
> a different set of regulators. Specifically, it lacks the camera related
> VCAM* LDOs and VLDO28, but has additional VM18, VMDDR, and VSRAM_CORE LDOs.
> 
> The PMICs contain a chip ID register that can be used to detect which
> exact model is preset, so it is possible to share a common base
> compatible string.
> 
> Add a separate compatible for the MT6366 PMIC, with a fallback to the
> MT6358 PMIC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


