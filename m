Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90192EE7FF4
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 08:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BQAVKqReSVnSI4Ydt6YoC8xFDTISY4VfD72WdfhWLqk=; b=Tj9D9HH4ZsVrp5sVCZ7zcE7Knw
	x/+yif+F6FzrD6vWLZZxs8NnSO3dQDQKfJZM/9bE2HZwn2ZN2y4etqQb8JnFsBLToYS2s2gZoMl9J
	B86v0kZjVxwyDLXbbCEgT5B+mpr/cEPbjfj+CK4N8cHDlntPf5akcMMUDw8fKGSKIpxntjUeMnqiC
	q64p1xWfUeVaM+KRVNwA7Z0GSruIUyj1bISbxs7Ga7JccRwChGOLf5Tba+sk65tvbyHlVEuWMfkBB
	aOE13lrKKxXMDX6YEXJwM/WX1BIt37lJlk8BYd1l7YSJ39TAOAXdeUq4xyWUiI8iNT7tQgtnZoqGK
	qyyeHBMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfbwh-00HVKu-0y;
	Mon, 11 Sep 2023 08:06:59 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfbwf-00HVIo-08
	for linux-mediatek@lists.infradead.org;
	Mon, 11 Sep 2023 08:06:58 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-31427ddd3fbso3833160f8f.0
        for <linux-mediatek@lists.infradead.org>; Mon, 11 Sep 2023 01:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694419613; x=1695024413; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BQAVKqReSVnSI4Ydt6YoC8xFDTISY4VfD72WdfhWLqk=;
        b=BVdg3gByY8pLtBOl/0QIcCEZxa98nP8w1pZ7qPZb5/DrGZsnq8nXR96UPdtJVep1ct
         rflyRt1WoA5HsGBr40iUv1T5fJQijOCVdrZNAuZjIRO+47JN/ysC0t2cqO5vjDYXzN7a
         bon9D7PcuFjEphB3TucrCxPACNeMeZ6k429QVoRmjhGRgwapCnbJdRiKbYzgAvIMJ1Pt
         s5byD2yXdGHLpS2xRCpwEk39BNh0O+VO4h4be/Uc6mECTZMS8+wjyHz81tWZtN6/p91z
         4RHmJOmdlhDZfGsi/EUB62YRwDYROJH+pY7mm7rzsQdwp2kSsp90NNAONmtbow+1O9EJ
         8qOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694419613; x=1695024413;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BQAVKqReSVnSI4Ydt6YoC8xFDTISY4VfD72WdfhWLqk=;
        b=XUl9hoxsEWIVAV3C2Yx3tFXyCN74eaMrbeHV/9A4f9f3SWjr4F3vfOMnDFgO95betZ
         91JJWhhJ4xvbGGHHwzwecyT3onCQVUuhF7PFwkCWZ0vFqstBAd5FHYf983sxjVtyUNIR
         cdmJUWGtsjQVlWdwxUXzpJqfPz/HNwePofEb7z1WU9ZmrBQLMUR3tbLO0thAFS9OittW
         hnHLvy2Epa8siQ4C51wP+2c5aq/VcjwtVlQDJGh9mBwr+jB1jk8nZU8sNC2VfKz9SjtV
         A6YoPMdzaG+HpQ07O7LWEJ4T/Fe8nYabbxPVGGYXLt8Z2dXh0NFHmOucIL0tBT9uOPpK
         0fww==
X-Gm-Message-State: AOJu0YxBO+22L19hFwpEN2JwOMpXYLo3pyKqqJtljVaX3gxuv+9yghv6
	6aCRvjkObxGvVaEwhQgNaW855Q==
X-Google-Smtp-Source: AGHT+IEftHwy4siFn4uU6kwdtQfQwwzQkqPdTFYx+b5Hws8/3fiLDhgz05H5RrbONLPKhHuEKen7EA==
X-Received: by 2002:a5d:624d:0:b0:316:efb9:ffa with SMTP id m13-20020a5d624d000000b00316efb90ffamr6497563wrv.35.1694419613045;
        Mon, 11 Sep 2023 01:06:53 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id b13-20020a5d634d000000b0031c5e9c2ed7sm9318751wrw.92.2023.09.11.01.06.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 01:06:52 -0700 (PDT)
Message-ID: <9ba6da84-6ef9-1f28-75f6-bbdda571771d@linaro.org>
Date: Mon, 11 Sep 2023 10:06:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3 0/9] drm: ci: fixes
Content-Language: en-US
To: Vignesh Raman <vignesh.raman@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: helen.koike@collabora.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, david.heidelberg@collabora.com,
 daniels@collabora.com, gustavo.padovan@collabora.com,
 angelogioacchino.delregno@collabora.com, emma@anholt.net,
 robclark@freedesktop.org, robdclark@google.com, anholt@google.com,
 robdclark@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 jani.nikula@linux.intel.com, mripard@kernel.org,
 dmitry.baryshkov@linaro.org, matthias.bgg@gmail.com, agross@kernel.org,
 andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-arm-msm@vger.kernel.org
References: <20230908152225.432139-1-vignesh.raman@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230908152225.432139-1-vignesh.raman@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_010657_101471_13AA31FD 
X-CRM114-Status: UNSURE (   7.75  )
X-CRM114-Notice: Please train this message.
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

On 08/09/2023 17:22, Vignesh Raman wrote:
> The patch series contains improvements, enabling new ci jobs which
> enables testing for Mediatek MT8173, Qualcomm APQ 8016 and VirtIO GPU,
> fixing issues with the ci jobs and updating the expectation files.
> This series is intended for drm branch topic/drm-ci.

Please send DTS and defconfig separately. These patches should go via
subsystem maintainer, not drm.

Best regards,
Krzysztof


