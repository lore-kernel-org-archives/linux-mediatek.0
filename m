Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 652A3C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Apr 2022 13:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k6foyor6H9OjdFa5yk59ICM91fjqcVc7f/2xyob/3sE=; b=GvfegSmKtgOYCt
	JqcSTtBNQXuajW/iJUdTcWGg2XyA3KO+Ese54qKHv2T4kNlU4zxC5hE02dxlyKBTgJ2FjoKVQ7Dp/
	S8O3HD5XZglHd9ZMpXo2EUJ028+iVkAQD2nZveZzrw4Zf1XX6BA8sE8BeRdEU9Dj/fWt7DEUx8HI3
	tipcn1FvB0VojObM3ng4g5kWpsaO9DpoRE+WUr9L7ujmnyqKgOZhHsUU2T+L16882xw3vrTGaNVgz
	QHWGWDv+i7vTb9BlrdXlz8zx9shwmaAjkbgATv62vLAw0WsP0TMuV3D0/wJsnZt2lVOIYPd4H/H72
	QFr/RAFwhECxL+R3G51A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nji7E-001g5A-GP; Wed, 27 Apr 2022 13:54:00 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nji7B-001g2q-Tf
 for linux-mediatek@lists.infradead.org; Wed, 27 Apr 2022 13:53:59 +0000
Received: by mail-ej1-x634.google.com with SMTP id dk23so3547234ejb.8
 for <linux-mediatek@lists.infradead.org>; Wed, 27 Apr 2022 06:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/VHZPsVMAFIMi2pBbLfD5fKKNKqKbuM/A2SGKvxDgK4=;
 b=AwyCfjozdBWESOd/ALQolQKJzimk9604uiUm6wDtCOrm5sOppI0nnP7ziMhAz/f51o
 yUoGs5n7teJKcGbtpp4NaCK1/YbXG4P0YRKx0GchwQ9vgRF3UzfbEWkpW6xKyra3pN1l
 PnkWJfEI6GymVqL/stEHO/IxUCTYRc23BDHctj09QFj9iz4132J3vnRtPknCK5c+jcpX
 LqdBOHmvHmX3UBdujsR9oaGfVGw6exZ+FyeGxLo3un9Y9FzaEGgaGIPtXu3p+HBW1Ko4
 xhja6WXow4QKqlI9wX3Qd7Z0kLokBkl8Z0hIyMTDjmsUsMc8TcluX6xUkaT8/fgTZJOm
 AGTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/VHZPsVMAFIMi2pBbLfD5fKKNKqKbuM/A2SGKvxDgK4=;
 b=SGQv4DZW+zR3kXAhM8gt6P0VsjQGG2PNm5rmZ08K925MwvrgFfStMe0VE48u76KIuD
 7tsXmI1F8Z2kKwlfAFFE/r0Qa5KTHGYu1joYE9ww1p+Kta8DwcCCEdHwvk3LHIZOCuhN
 /Gh9eXqSedE7/s7XOSkY3fAuejT1hthYiE1oqmsKuLXVuzUtnewaaHzDKa9pfIofPiFz
 ZBcdQB4JjjgFVvC6VR3GHyq+QiL7PgQQZzPNFGHJ8DosHK25gAUuELWl9AE9y4WSUxv6
 UdKbd9E57A7ITkNMMyIZmZiivbqdmEGyMdxBwzg0YTi8VDNI1jfSZofkZIhGan/m29hb
 RpzA==
X-Gm-Message-State: AOAM533ylJ0Se79b2cVs9qMjxSWG3rfRSCf7Yg6A6OdsZwFgHCM0XvRw
 R6jhuS0PmECnUjv7Vz2OAoNMTQ==
X-Google-Smtp-Source: ABdhPJylNBSCvH5CoQ2choSP7+rTzl3z8DvUVHYaOOrw5yxaVm205jVSxTlZqO9OF2mULcAztWn0nw==
X-Received: by 2002:a17:907:7f0a:b0:6f3:9712:dfed with SMTP id
 qf10-20020a1709077f0a00b006f39712dfedmr14448010ejc.557.1651067634774; 
 Wed, 27 Apr 2022 06:53:54 -0700 (PDT)
Received: from [192.168.0.154] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 jt24-20020a170906ca1800b006ef606fe5f2sm6762723ejb.61.2022.04.27.06.53.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 06:53:53 -0700 (PDT)
Message-ID: <51be638b-e12d-b9ae-c14b-f51e33d2503e@linaro.org>
Date: Wed, 27 Apr 2022 15:53:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/1] dt-bindings: nvmem: mediatek: Convert mtk-efuse
 binding to YAML
Content-Language: en-US
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Lala Lin <lala.lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>
References: <20220425084800.2021-1-allen-kh.cheng@mediatek.com>
 <20220425084800.2021-2-allen-kh.cheng@mediatek.com>
 <e64bdca8-7b18-b450-830c-ca07946a73fb@linaro.org>
 <9d65b713e3ffdd34dcca532c4c97fa98b124bde4.camel@mediatek.com>
 <0169c4ac-fdce-29b7-553a-14dc7df532d1@linaro.org>
 <a8e212a0e0449e015a33e76b320266376d4b9be6.camel@mediatek.com>
 <89609af9-5feb-0553-5e39-c97c4750b5a1@linaro.org>
 <33c754a7b6e4cd631bb2aeef002d34a6c25d6689.camel@mediatek.com>
 <0c63c24a-8014-2491-095c-77893d2141d9@linaro.org>
 <daca88d63fa844179a3d44affee124584353bec9.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <daca88d63fa844179a3d44affee124584353bec9.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_065358_029625_763D7E94 
X-CRM114-Status: GOOD (  10.46  )
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

On 27/04/2022 12:00, allen-kh.cheng wrote:
> I think there are two cases in mediatek efuse dirver now.
> 
> Case 1, 
> const: mediatek,efuse is deprecated.
> const: mediatek,mt8173-efuse is remained. All mediatek chipsets will
> use mediatek,mt8173-efuse as fallback.
> 
> Case 2,
> const: mediatek,efuse is deprecated.
> const: mediatek,mt8173-efuse is deprecated.
> 
> All mediatek chipsets(include ediatek,mt8173-efuse) will use
> mediatek,efuse as fallback.
> 
> Which one do you think is better?

Indeed, I forgot that mt8173 would also fallback to generic efuse.
Indeed let's go with case 2, so your proposal before was correct.


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
