Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C93ADC7618A
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Mar 2023 12:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3GQ0kuX+CANTyKsciGzMU4Vb8Jeilt6T7QwH/C5HtcI=; b=QICNuVJXFj5VJUafHZ0oNFtt5/
	SHiiBkbHr64JsRiagZYWMxXxpKhsFLSdyx4g7Oi+REGsrRA3DfiV7o+5B9hqNA2NxRa6Bv6gHpRDG
	NKXUhIADcUbK3tak/oc144vpV7zWUljbfIdIEqe+tkIU7mTgyLDXuT9b3yvONb+gwYVsqwkO/xQ+R
	gAwkwiLi5lM8CqPuYTXJH0HidLfqHvoC2OpXxuPS/v8apt3jIwrQYjXxOKjTX2MCYXkL6mfp3FOCO
	qLq+vEnhqdNOSxbd0Io3o5JH+YEc2oUbQ+lrfy7zleJzGgjy4xyyxgnDxMWFNkXFMmo+i/TQcYSwe
	fHe4oZ5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdrne-006cNR-16;
	Sun, 19 Mar 2023 12:06:10 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdrna-006cKy-2k
	for linux-mediatek@lists.infradead.org;
	Sun, 19 Mar 2023 12:06:08 +0000
Received: by mail-ed1-x534.google.com with SMTP id o12so36732190edb.9
        for <linux-mediatek@lists.infradead.org>; Sun, 19 Mar 2023 05:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679227564;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3GQ0kuX+CANTyKsciGzMU4Vb8Jeilt6T7QwH/C5HtcI=;
        b=pVE7uoVyhC7NdVaNDMAae95yljmhHJ/vy720gGm9Wcwipv7UjfXSfsHinpMhTLeopx
         cr5RClkReTYivfC2IY5U5wY572ezvC1yCkHd7LIEj1HuYvbps2jMciS1PvOubx3Phpzv
         lfp5ymplUDgbfL2kaHoUaSBUbvueNoyQOpkFwxacSddt2OvHyx9V1IRGsXLNxNuNI8tR
         pzgJjPJtO1SL+S6dW0blVTikGk2hVBMbyclcg2gesIeegLGn9Mb8DIqUUNj6OWGRux4X
         VlPpEjmVgeM8W8fsbY1qaNuRHoxHO642hfuMBJ5aK+5ziENTS4/JD82wADP8gHrLT7H4
         rITg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679227564;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3GQ0kuX+CANTyKsciGzMU4Vb8Jeilt6T7QwH/C5HtcI=;
        b=s9ilzG9JEMk8xm3LJ2T2+zpj3XPVpeReJFdEqMId98X8VHUhtuH+/5niIMy7C948je
         llwaJd2aEc8N/BGYTiM9CI3I4d+qzSVhA4BB/Iifr4LHQjONjwb2J4ymlQ7zsUHJ1kAe
         abtQO3E37Lj5qJ2ONg+SBgwBtr7sD96suQIRJTVRwuY8FYcN69RPXdfSvYElRlgKwEdl
         1eZ2lmvL8xQLebCgzpRPPFobMnh1niLldArz2G+H0q1kK1TlUJKOpfjinvkC7mMUA3o5
         vM0mgzedSCS85espmFuol977HpaYb06dn1gha8dzWC2Tvn0e4EKcb6U4TmfezwNSwFW8
         7h4Q==
X-Gm-Message-State: AO0yUKWvRkVQh19Xeo3r7Hvq8o9aqKO2bp2y9w+hY2aADxIQ+Nj+ntOT
	KSNvAR2lOFv9oJYykffxq+RfKA==
X-Google-Smtp-Source: AK7set+IUACGutO71vcC7FVNze5yyNjfDWDHleE0EpSa6MxZnLDTstSEjlod2kahf5dchF8sAdB/PA==
X-Received: by 2002:a17:906:6886:b0:924:d90a:6f97 with SMTP id n6-20020a170906688600b00924d90a6f97mr5311713ejr.13.1679227564671;
        Sun, 19 Mar 2023 05:06:04 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5b5f:f22b:a0b:559d? ([2a02:810d:15c0:828:5b5f:f22b:a0b:559d])
        by smtp.gmail.com with ESMTPSA id h5-20020a50c385000000b004f9e6495f94sm3473945edf.50.2023.03.19.05.06.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 05:06:04 -0700 (PDT)
Message-ID: <6d4dba0d-14eb-d9a4-0d16-b0c141b0c733@linaro.org>
Date: Sun, 19 Mar 2023 13:06:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: display: Drop unneeded quotes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Robin van der Gracht <robin@protonic.nl>,
 Miguel Ojeda <ojeda@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomba@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20230317233626.3968358-1-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230317233626.3968358-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230319_050606_889435_E9E5D9D6 
X-CRM114-Status: UNSURE (   8.66  )
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

On 18/03/2023 00:36, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


