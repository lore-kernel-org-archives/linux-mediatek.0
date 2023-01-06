Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53ABEC3DA7A
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Jan 2023 12:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nTsgZ28jw0QdfrpJIONpqgGy2v8hslyq6OA+g4F+h4g=; b=Ld0uM6/QHAbNmejfAuD0uXRofC
	emyaG9w5MwJSZ1XGA1DRGeoVLWoTEqHm/adGVAfdDl9piu6hi7BhQxA1h3sYH4aDBpLIq7SAtl/ji
	3SoyfXHZw+KoUxqAd/teyTDSyXz/Js0IOCH5YZ4d13YNZ+Zup2xlLLI/sFCcSxvqqVVCjfmX8/jg8
	sWsWBb9nGs3XSWoBsp9ZSM4uoe7B+7aNGWB+Z8NfhIemR6JKqWvHo9zpZ1rAtzG9ncTqK2BGL3CCT
	d7o4iviOF8TrSbawvZBwjIGPT0Uvb0J4yz/WTSZDu9TMHRVUz+7+fewheBIAfUXcfgXe5ilHH6vEo
	PuMiK1ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDmCc-008Bx4-0a; Fri, 06 Jan 2023 12:52:06 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDmCT-008Bsr-T1
	for linux-mediatek@lists.infradead.org; Fri, 06 Jan 2023 12:51:59 +0000
Received: by mail-wm1-x32a.google.com with SMTP id bi26-20020a05600c3d9a00b003d3404a89faso3657958wmb.1
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Jan 2023 04:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nTsgZ28jw0QdfrpJIONpqgGy2v8hslyq6OA+g4F+h4g=;
        b=QKz4eUtWJGIN6xx+hgENT3rYclWDWorckUkLY2b6epk5NAQyzG/2rigaT0TizpLUFE
         ALfsOB35gYpVVqt8Cgv+z3AwMavRkDwXbC+d4dZX1C1HRDGNX6r7dVmJ/qKgxXV95Iac
         nMSElVESL61gXwbisyFgmoMVcEB2mPNhbI+b5xq9MqtbexFZx8cHvT2xQKsgfikuiM9f
         n7f+g/lF1f1IhWUw5u0lK9k49scLWs/vjIVbnP0Rx4wm5tZLQDtuapQm6jUbd9/i5Oei
         1QHcxS2O1V2xYPkOIlXuV26SsofQhFl+QD82RzOt7q4V3wnH/9H3fZNgVsn89IeQ9loW
         E8YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nTsgZ28jw0QdfrpJIONpqgGy2v8hslyq6OA+g4F+h4g=;
        b=ERSDD9ZV7UBdWG9ciocE9bQrsmcLS36jgEuJ1CDuymlXKGu1oTMZvWALZrx8VKV8Oq
         WnLpqEMlBalFDQj5ci6USCKYheshi07bQftdpetiFkmQvKFUsOhAoaPE3lA09E+yjVLu
         YQwKKvTN6nIp1R8iYMrSFXOkA9zESzAnRzlydMXQog7eTHFPzIuriPlW8XJyesPSonlt
         Ns83PwJShqKoL/2DUl+7fmhYRiVqC5GmZ/BrJCBp86zT5kD9A3DU3Mb2eShGzMeerS96
         x7ppFAUy4BXdeuufVOBOpJrkrZDJO4QzFlYUD1zbqvgmj3ZCqV9wJc8CsnBg4BtWnfrA
         1slA==
X-Gm-Message-State: AFqh2kqWnKOH2yh6pvTKoO00haUdpXAa+2tV61a9SWarbxt2H4b80lvF
	wI7n4Tbehu73p61VMMV1bPbpbA==
X-Google-Smtp-Source: AMrXdXt5ojTkfrGJboYK1DOEsuCMBlujKf37GSSKrlMZUfz9L62/8O1IxRWaAJjnDohiyFLrZq9ilw==
X-Received: by 2002:a7b:cd99:0:b0:3d3:5506:1bac with SMTP id y25-20020a7bcd99000000b003d355061bacmr39829602wmj.30.1673009513375;
        Fri, 06 Jan 2023 04:51:53 -0800 (PST)
Received: from [192.168.1.102] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id p9-20020a05600c1d8900b003d9d23ab449sm1659288wms.29.2023.01.06.04.51.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jan 2023 04:51:52 -0800 (PST)
Message-ID: <3b4fba35-c34d-b8d5-99e7-e44456b67803@linaro.org>
Date: Fri, 6 Jan 2023 13:51:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 10/13] ASoC: dt-bindings: mediatek,mt8188-afe: add
 audio afe document
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 p.zabel@pengutronix.de
Cc: angelogioacchino.delregno@collabora.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20230105081606.6582-1-trevor.wu@mediatek.com>
 <20230105081606.6582-11-trevor.wu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230105081606.6582-11-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_045157_957855_61445AA9 
X-CRM114-Status: UNSURE (   7.92  )
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

On 05/01/2023 09:16, Trevor Wu wrote:
> Add mt8188 audio afe document.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>  .../bindings/sound/mediatek,mt8188-afe.yaml   | 208 ++++++++++++++++++
>  1 file changed, 208 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8188-afe.yaml
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


