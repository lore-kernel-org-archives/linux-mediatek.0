Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 138FDEE57DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 08:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EbUzjiy4o1vK6+eGTRCo3FmI8I3JuBmYotzF+QEDbUg=; b=ZGWGVyomcVW8vOjSFkmL73x3h+
	RJ7w/7jt3cOZi2TI3VY48RKf64ZImnuSFcISPKCXjfd4YP7f/QHHFQT/MFrqzMs5R35PPs7Eza22O
	dtTjA0uRthi+U8mSH4x030eV5CcAgbOetV1s0ViVb0xSIip02oQzsokAiy08Tj5fzeQt/45k1Lvgz
	LHyPmEFAFscwCKT01nUcK53LFqJYvZVBOarlxUeNRcVPVVU24jpVVnuZrgPgDLm8CeM5uKBk6NOVv
	WxXyX2x+e+LuvguMansWp9p82a28QjsKcreQuyCXhUloYhPj4Z/Q+dxOrGxsIAN0kGF9ZlUfzX6ji
	G03RgbTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfbyw-00HVfq-38;
	Mon, 11 Sep 2023 08:09:18 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfbyu-00HVe9-1v
	for linux-mediatek@lists.infradead.org;
	Mon, 11 Sep 2023 08:09:17 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-401da71b83cso47036615e9.2
        for <linux-mediatek@lists.infradead.org>; Mon, 11 Sep 2023 01:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694419750; x=1695024550; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EbUzjiy4o1vK6+eGTRCo3FmI8I3JuBmYotzF+QEDbUg=;
        b=JscQM95JqPHe25TtGpe5F6lCgEoRVVaUQErljAKjNolstEexaH4kOqeqDwD/wktYxJ
         6Tl0wIGB828KgEUfWkX19hCffV3/Joz3EAYSiF6HGUerhFLfooIBUhDWPQ6X/nlhIbCU
         ty2HGa06/2q0flTbjxt/VMnLcKxcha4+HfJGmU2Gl6B/6s1MWjsgxHaAQRyD5EQWJpm3
         Dd7wqozKiyp1vN97/6H+ylEPzs+V/V7TDayFeVs7sVDVg45FC5CH1B+gJeClbwN2Gy9D
         eFPIjGIkemID6+JwksMVa9Jf+enMFzUAmd8A//vqKQSStMKU4hR4p1+HsPO2UDh30Cyd
         2OqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694419750; x=1695024550;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EbUzjiy4o1vK6+eGTRCo3FmI8I3JuBmYotzF+QEDbUg=;
        b=KZJzHYUf3kdPmtImEnsU47fRjrl8oJA91zoXKBw3U/jwgYFcTR0HhjgbptWbZq5ste
         l+T+bj6mwVSQsqKf3nAjzY/MAxbAQb4WYLCRAms5G3sVJg5iy7HFlGsOtc4YrOx2HupA
         h6e9ZCP9xKQ6MZ71rxz+ZZL+fU5ojHXxfKfKPaoqRSFWo5QHZBd6vlt0zJc9+fA/ePug
         6HQwSHVHLKUMVggm6JiEtkmtxofXsEjFsoasS5igi+lKaE8vMSvGky50SzTdFrHC8etn
         elkx6A73Spx4vI5hyCsRJnwwKBxA57tqvO8mgMIDiEOxKMXp+lf6HsgBU76quudvI5Sr
         Ct2A==
X-Gm-Message-State: AOJu0YyDNi/EbAHZpuIVhSM81W8bSIrZ35g06fI+R7uQozyuMQUHg51u
	blb8gunPEabDWm4ktUdsuoG8BA==
X-Google-Smtp-Source: AGHT+IH17NjBNGmOzEesnEW9tcv/zDzsg0kaDQGZfVp6yr4OvabsTsarBsJUqtBSDTS43yE6uYtPtQ==
X-Received: by 2002:a05:600c:b5a:b0:3fe:15f0:dfbc with SMTP id k26-20020a05600c0b5a00b003fe15f0dfbcmr7767575wmr.12.1694419750151;
        Mon, 11 Sep 2023 01:09:10 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id w18-20020a5d6092000000b0031c52e81490sm9359869wrt.72.2023.09.11.01.09.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 01:09:09 -0700 (PDT)
Message-ID: <9476d20e-a0f2-e8cf-db4f-d07dda86bb28@linaro.org>
Date: Mon, 11 Sep 2023 10:09:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3 2/9] arm64: dts: qcom: apq8016-sbc: Add overlay for usb
 host mode
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
 <20230908152225.432139-3-vignesh.raman@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230908152225.432139-3-vignesh.raman@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_010916_633653_2A383640 
X-CRM114-Status: GOOD (  16.53  )
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
> Due to the presence of the fastboot micro cable in the CI farm,
> it causes the hardware to remain in gadget mode instead of host mode.
> So it doesn't find the network, which results in failure to mount root
> fs via NFS.
> 
> Add an overlay dtso file that sets the dr_mode to host, allowing
> the USB controllers to work in host mode. This dtso file will be used
> in drm-ci, mesa-ci.
> 
> Overlay DT file uses the sugar syntax [suggested by Dmitry Baryshkov and Maxime Ripard]
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Helen Koike <helen.koike@collabora.com>
> Signed-off-by: David Heidelberg <david.heidelberg@collabora.com>
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> v3:
>   - New patch in the series to add device tree overlay in arch/arm64/boot/dts/qcom
> 
> ---
>  arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtso | 8 ++++++++
>  1 file changed, 8 insertions(+)

Split unrelated patches to separate patchsets. This has nothing to do
with DRM CI system.

Best regards,
Krzysztof


