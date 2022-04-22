Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C5FAC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 15:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A/TCFUwPCvaFqScYPGJRFpzjllld/a0iW7PbfUZ7su0=; b=pANaYlJtWNE0fq
	PV2YRqdpz3C5k72N8av1DZjgcGjygN29Nvlk/h6Gtii1+nOCxa8U597CGpRvMBs3NWcSlWYOemeVx
	xT71dAEluNDN3Wga902NSzHtDedayqetP/CjpXujajuwk8CtbmL4CRxQd4nfwL5GhCgueo9s6+Xd9
	g0SWsy3YVgDZ3jeaxFyDHv7dFiCNy/w+q/cBJNJyz2NwrVlwJX8Ya7ZYuN403Km1j8cbRNTTpksUw
	zwqo/BEZJFz3DmMk5enms9TwN5736/b4rSKnNy3wOEWk8+23T04K4NVefKIzWgaCicuYZX93Lk8qz
	Nu28U0C86KfuSM0mNESQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhvWe-001DOa-3O; Fri, 22 Apr 2022 15:48:52 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhvTc-001CBy-Kq
 for linux-mediatek@lists.infradead.org; Fri, 22 Apr 2022 15:45:46 +0000
Received: by mail-ej1-x62f.google.com with SMTP id y20so17164538eju.7
 for <linux-mediatek@lists.infradead.org>; Fri, 22 Apr 2022 08:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ykyOXYnTInWbRVW2tdNR9tYlZEHvOUFoYyQMhJhxCCQ=;
 b=UZT91yu5GBIwEX2J3y2E8rHkqeYKICR4njyNjt1hbS/JpiJ51pt8mq1tsxhKcBGuJJ
 IPtbCAHRrudZXd+XXlaHlRgmLP6KlRMEwtqycRaIzWD31OB+VZivBgADRzcu9V6w+As8
 Fc3IUVBBtrd82t1uYd/yWjJmo9PkjNtqPvr7boVFJ4wgSGexX+g1jxUi5GZSfgWMvqdt
 W1bI10XiQ+duKmP95SGJnsf6H6L4IklxnSep3tbYUV76z00NF3zrHoYMaot5GAhtszNV
 Ai30I+YVCvN6m8nbU51cMHppdiMwAyu8uYgHwCijUYATmubtJ0J4rX5hDzwuw602D2AV
 V3/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ykyOXYnTInWbRVW2tdNR9tYlZEHvOUFoYyQMhJhxCCQ=;
 b=eYXKuux4tThXeWjnwbMs7mrb4/JXUPXky20vYta6dNiU+rptkuOf7lu/3D1itT9PDS
 F20meTin8WwXx6LnLArA1L7PGrWY4148YMoR4n5TzLbZUG9MnD+ZuVr0CPfxGD2hcLHY
 WwBlEWscJRHAL1HO2FkFItis6XOxjfbNgk0NKChX6Kw6Azjd3Na00gbCXYm2dAROh4Ss
 q3UeeGEXZ+fEmZ+2WL5vSy+ABc6jK6gacVP9/ctV6H1vcdeb1AVCum2MQmfwdpKZkZG9
 hOo1rrTDFi3lzuyEs4r/Uh6t1fPC755FQCCicRn1C72UtoD1/w5jrlLmA9T5iTDtOTRS
 xNjA==
X-Gm-Message-State: AOAM532AMnojYD+qjmeznkSJJ5ZgZFnF4XOZE6G8Ez9GFoXjK2ygACpp
 IQLp1Fm53hehDQBby7Sz5h27Iw==
X-Google-Smtp-Source: ABdhPJwS9MbT9FvnOnbCC52CKU9LT+qeVhCDl7sfPE7OYMzTTUvU37W5sV5B7y2mMHvxZdNrWzKn8A==
X-Received: by 2002:a17:906:94ce:b0:6ef:8553:aa40 with SMTP id
 d14-20020a17090694ce00b006ef8553aa40mr4600515ejy.60.1650642340986; 
 Fri, 22 Apr 2022 08:45:40 -0700 (PDT)
Received: from [192.168.0.232] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 d3-20020a1709064c4300b006ef606fe5easm846715ejw.121.2022.04.22.08.45.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 08:45:40 -0700 (PDT)
Message-ID: <7cd7d785-0401-fa58-8308-74e16fb677e0@linaro.org>
Date: Fri, 22 Apr 2022 17:45:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] arm64: dts: mt8516: align watchdog node name with
 dtschema
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 nfraprado@collabora.com
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, Chen-Yu Tsai <wenst@chromium.org>,
 Ryder Lee <ryder.lee@kernel.org>
References: <20220422121017.23920-1-allen-kh.cheng@mediatek.com>
 <20220422121017.23920-2-allen-kh.cheng@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220422121017.23920-2-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_084544_778635_18644C5A 
X-CRM114-Status: UNSURE (   7.79  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 22/04/2022 14:10, Allen-KH Cheng wrote:
> Based on watchdog.yaml, the node names should be "watchdog".
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
