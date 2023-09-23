Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E89ACE7A89
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Sep 2023 16:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ehvNyN1e8AcFsIaExWpUQQDC3O+XNhpuGUxABDsT1k=; b=sGta19R1zGOnpYMGe7kupxwolJ
	TwUA2Ex+TkWSC+AEhYkd2109ty+LJQL1uzHAwXiZEN/gTM1w2VEWPs/z4CxXSxeVSgcr60saqU6ko
	xgQBlAURaRqBgQ4tzipu+6RGOoj5XfoyJ+SQJqotTRE/7J5z8pgitauD7s8Mg0NjCmsiKYxAU62dm
	YI1tL+rlgZw34BiPQ6+PYvov3vLfKd6PsOCQJAB0Wcdc/Zum+uw40aoIkC4lKr0VHvqzozGMheYQX
	1osjesg33abanWC7J1uayFGYLRlw0/kuihc4O3ol3A3JdxS/WZsRSCuOixzL3MIWraTm2QHs9ilv/
	K+RC0rpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qk5ii-00BDVt-1M;
	Sat, 23 Sep 2023 16:43:04 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qk5if-00BDVC-1r
	for linux-mediatek@lists.infradead.org;
	Sat, 23 Sep 2023 16:43:02 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-31fa15f4cc6so3717381f8f.2
        for <linux-mediatek@lists.infradead.org>; Sat, 23 Sep 2023 09:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695487379; x=1696092179; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+ehvNyN1e8AcFsIaExWpUQQDC3O+XNhpuGUxABDsT1k=;
        b=tv4FwP72y8u4Ny0y8atHAHov4uwo0OLMQVJ+65CoVthfy9HCNssyJegm8Dgdx0Atym
         Je2c/X8xfTk9pF763LJtMpboKdbvFGQ2oQaHedqT8VpHOOEIqd/7dz77q/nqXVK2fXjn
         C0anNJ4yBRkZD4cERGVkFXqH3vbtnDwk5WiJkd7T85kxu4sHk+NSs1cvfkQO1DDAmgSh
         tPcmz1UsEgMFxN9kJyUQq1SeCkH9RqvroaA93Mc4qwb6rYBgauHgdDcvBD/YgDF/TTi7
         uIyNc3JhPQf1ZjzKS1lafT5zPRMIEqWxoWcLTq4XrjbjPEYnZXo8Cg7Wec/6Sqb0mnCK
         wQTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695487379; x=1696092179;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ehvNyN1e8AcFsIaExWpUQQDC3O+XNhpuGUxABDsT1k=;
        b=sv03vYRERKQ91iGby6gm/EitOPPdzJumPd5WXeSKPc/vDJeNTzEWeMiMzt5GYQ79XM
         0f26QPnIJf7cznPi4w6Yw+fepqhnjRYRuQVsnz1NI4bJLRGtKFT6CFvrm11D7A6L51Es
         /MPuwPd2YVR4WGNjjKtuE+SwVhPvrANLv+gIVIeY/WMq/ijaa/cF6eNNowhH56HSLNb0
         OcAchA0HDvnQA/RmpvIrPUlKY3EUl2ujku4A2ayijoQvMD/q4Gd6q5oPm6DCiy10AJzU
         y+cFc1uQ9n0yM1WUpoGlcUAIdpcUMrHfaMzP1Fi5t1H2iM22Agh1cOSh4eYJ3PdW09Ec
         HNtg==
X-Gm-Message-State: AOJu0Yx0SU/pUEAvl64DL1Y1I8pmynxL5JZaUc+hfS75IXxozEFuks/7
	5ndu8AiPDlfpNUMnykfSVXkh8g==
X-Google-Smtp-Source: AGHT+IHeYkcu/RtMUX5lf2uTUiwk5whv3Kim5HQRxv8v4Wkt6ThO4w/ApV1UJK2BVwSR7UZ8q2JpuQ==
X-Received: by 2002:adf:ea84:0:b0:319:6327:6adb with SMTP id s4-20020adfea84000000b0031963276adbmr2170369wrm.70.1695487378995;
        Sat, 23 Sep 2023 09:42:58 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.100])
        by smtp.gmail.com with ESMTPSA id x10-20020a05600c21ca00b004051b994014sm10434968wmj.19.2023.09.23.09.42.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Sep 2023 09:42:58 -0700 (PDT)
Message-ID: <4fdfe29b-aea7-8180-d2e3-5caa1beb7232@linaro.org>
Date: Sat, 23 Sep 2023 18:42:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 02/16] dt-bindings: media: mediatek: mdp3: split out
 general properties
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230922072116.11009-1-moudy.ho@mediatek.com>
 <20230922072116.11009-3-moudy.ho@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230922072116.11009-3-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230923_094301_620171_C4C85DBC 
X-CRM114-Status: UNSURE (   9.87  )
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

On 22/09/2023 09:21, Moudy Ho wrote:
> In order to minimize duplication and standardize the document style,
> it is necessary to separate the general properties specific to
> MediaTek MDP3 RDMA.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>  .../media/mediatek,mdp3-rdma-common.yaml      | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)

I don't understand why this is a separate patch. It's not used, not
effective and not visible for us how it extracts common parts.

Best regards,
Krzysztof


