Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70528C7618A
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Mar 2023 12:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3GQ0kuX+CANTyKsciGzMU4Vb8Jeilt6T7QwH/C5HtcI=; b=lfCccwt+pThNHBo6JwiRW4ax2t
	7XDU3HLgK5fKO0P+CeG0lXImKzeMdBKiAT7L4e58fPoA53ThWFEt8u4d/ISS+ArZwfSfghvNC4moc
	hKF3inngBkvjt3ktnDv12ibS/EeyFLg7NRWHLnfz/d7YUvX5uv2xoj6iLaQfb8ra7Sh9Ksumof/GQ
	hY6YnQGrsqJSUJkOCUS3V9g0Jdtdjd1UtIv4iGTqO8pjcnzYi/shTC/wY9+9ackFxOlcVV1Xr79cv
	k5CEFSVFVuwCUNNIELRINdZNl1Ii0voW6xvqhU/KW2u4EeTiQWQe36Doktivx/M1a1wP+gfcLiFar
	PCzI5lvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdrsZ-006e20-38;
	Sun, 19 Mar 2023 12:11:15 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdrsX-006e10-02
	for linux-mediatek@lists.infradead.org;
	Sun, 19 Mar 2023 12:11:14 +0000
Received: by mail-ed1-x529.google.com with SMTP id y4so36875049edo.2
        for <linux-mediatek@lists.infradead.org>; Sun, 19 Mar 2023 05:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679227871;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3GQ0kuX+CANTyKsciGzMU4Vb8Jeilt6T7QwH/C5HtcI=;
        b=YPJ23GJS68bHBKG4Lbftaa433ttaZ0fmgXWZavsD06SmvrkmP2bgMH4ZLnBwl6VCnL
         VyqUN1h/aFU66uitwhc7mmIJwVl1V75JwDTO8aWroziQidAPSGwK94ygGgVmHq1Myeez
         ZZPLV9PPMLY8vKzjNR/X/+SWIqceYA8uh5KCRcmfFxAGXC2f64yUD0YHdQtZ31BBIslc
         LVot5ds9HxvFApvkrRoBdHJV6vUKdtrZWckT/jbsbKs8aMmuWIStZoADGI7l2/Gs9Dz+
         L68xZXQ0avUn82L8p9Wnyc4n9eCRVwIc2cSR56TIcx+BbgUm/abMIMtcRSh88kd5yGP/
         x24A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679227871;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3GQ0kuX+CANTyKsciGzMU4Vb8Jeilt6T7QwH/C5HtcI=;
        b=IVpe/CWBj3lg5wUYvdGzEQo/pW4rVPwplqjN+XkJBTj0w5vIjJgIB2wzzNZawBZGaZ
         BEhjBN/nTA7LiBBCvzypZUvPf09cUPZ3FlKCExcFRqfXhhZKkFb8EI58mOhreHTbSrwi
         2evdCKHGJ2rL5wm94WeePeDxDFCFwjq+3X70KmNpfApVc/qZm8f9t8IeQ8wEMpElJ+3e
         S2Xix/LMukWTkyK8bVaq+Dg33TvuBEKZIU2iqI6RhVxhA/37QeuKcSfey4QLw34mBYRE
         XTZCuq9/u+BRA8rRlMemVZfwC12UIUmTsiGfMr2p+05Dizha7xJqn47j/o/z4QkB91Vs
         7cng==
X-Gm-Message-State: AO0yUKVJBLvR3Dkz0DC+MAkOy8Kf5FjfsgpKTAB4+QvD2arrrxYAHd9w
	x7U9X867dck5tHLoxs+E/Ym47A==
X-Google-Smtp-Source: AK7set9WzyI1z5lQWWxZo0wQXPTsHSNQOCCESkzp15F0cQQ58oHgw0u/pfpIMQ8+fDIp4WxeSPrUEQ==
X-Received: by 2002:aa7:cac8:0:b0:500:4c0e:cb8d with SMTP id l8-20020aa7cac8000000b005004c0ecb8dmr6350943edt.5.1679227871464;
        Sun, 19 Mar 2023 05:11:11 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5b5f:f22b:a0b:559d? ([2a02:810d:15c0:828:5b5f:f22b:a0b:559d])
        by smtp.gmail.com with ESMTPSA id k2-20020a50c082000000b005002daeb27asm3423673edf.37.2023.03.19.05.11.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 05:11:10 -0700 (PDT)
Message-ID: <bee7bd83-1d49-199f-de6d-d43e089e4c01@linaro.org>
Date: Sun, 19 Mar 2023 13:11:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] ASoC: dt-bindings: Drop unneeded quotes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Fabio Estevam
 <festevam@gmail.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20230317233612.3967849-1-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230317233612.3967849-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230319_051113_050326_B5D2C4D4 
X-CRM114-Status: UNSURE (   8.78  )
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


