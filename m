Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E4CC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 18:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g4jO4kLxJPS2LSAbfRyUzjZc+CFb2okF2AprEhXBWMg=; b=J7EpPaWEUN/WXYBHy3OtzqLiCt
	JXsU6OcuA8GlWMwu/vOVmCfhX+TVbZMpDsqRRRby5O3hi0PrvWB8zoMD+ZXgDmy9oN1KKikvqP2Km
	n3IBBloqZr2ebj4X4tCmnZfjJSTmidryfDFS75sVmuFiAkS8Y0OcWHjxJsjuV19xEUR/Gxt/Lj0Vx
	I856VUFmzb/WFis9C54VPnrYr3AGNzIWzc2wrO3hzZFf2oPCsRGkgoeNmXUsrWrwWcSm6zstPREHG
	zINL6fh0OPaHRwrXM6CMMrO4HGmS5JOUMS/CvfjCTQsXhpI1zBpE5Gow7ukSAXFCxnjBLu3AHwmcy
	DtGkIUnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncWiA-00DWTo-Dz; Thu, 07 Apr 2022 18:18:26 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncWhy-00DWOU-KB; Thu, 07 Apr 2022 18:18:15 +0000
Received: by mail-pj1-x1035.google.com with SMTP id
 a16-20020a17090a6d9000b001c7d6c1bb13so7092028pjk.4; 
 Thu, 07 Apr 2022 11:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=xQii1eP+D129OOmmEFUPFi+428VvVe2npW0nOtHi0v8=;
 b=WBsYEqJ7FltBHsC6oK/iY4SdWSX6yl+D4SwDFOBtZLxKw67+b4LuB50h908ertO7zg
 Dcthrade36ld2as5TY3PkMw329X2qDnHvylK/N1Cm7ykcJ0GqY14WgfySksy1AbU3YEg
 MIUV5fDNgM+qHqrcjk2DAQGR8aK8ykfQAnzRzMNSi5lB12PEpl88ZQQ+9+EYRgR0RRu2
 h6S2Nsb+l9LAz89Ti8lc3kVHcyaGi+ODPZc3kby0R1R2bWeyY4ARzw3DPTQwAZdDDmPD
 ZVzK3JEOi1ZtBUoP+TnwA5n6kS5WJNPYPbZJo11rKNyviTip8uEfe7fgqm5v/JQhYF1J
 A4Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xQii1eP+D129OOmmEFUPFi+428VvVe2npW0nOtHi0v8=;
 b=T4DuO1opW7OMDH6lPF6nWs+b/YlDCGRjgYiSytvmsr0yEI63KR8GPyVpX01iWQvpbE
 248YhSdGP6DaGRCiXAoc2aO3AeTzubMoYmWEnNW9K8nN+JN+a4dXRNRkV+gAAqwdjwx3
 qxVqLEaV/HQc+OaSdq3caGvgyVx/D6+w9yNp9viMWQbFK6DJcphS5IcwIQ/w0Wqs3Ign
 3ldKIz+0UL7knJtXfz4ZhJe/TZAE5dqX093BzmQ9/iAQJJA4UqJARs+LP2k311j0nLxF
 5YaZx+HPz5eff1zriCOJq5VbDtzlHXfqw8WOwYM08RxMJuh+3O4G9MaTlh85e7WhCOxN
 BriA==
X-Gm-Message-State: AOAM531WEvWbv5KI9Uh/aznbmTbkzyKZ7VS8XNNKrFmJ7RKregdER+n+
 S/GGVqDsCZGQZ6CZEeUUWzQ=
X-Google-Smtp-Source: ABdhPJyXdHfHZMxDow5pG2bx+mSyl30fIzwXdgKyuiWLg9v6EURe8ej5jtVSOTdU4b4I9EDVWhfFEg==
X-Received: by 2002:a17:903:41c3:b0:157:1e3b:ee66 with SMTP id
 u3-20020a17090341c300b001571e3bee66mr867050ple.41.1649355490155; 
 Thu, 07 Apr 2022 11:18:10 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id
 j13-20020a056a00130d00b004f1025a4361sm24726271pfu.202.2022.04.07.11.18.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Apr 2022 11:18:09 -0700 (PDT)
Message-ID: <55800b61-bdb7-9e93-7d2c-b5a34c1e5cd0@gmail.com>
Date: Thu, 7 Apr 2022 11:18:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] MIPS: dts: align SPI NOR node name with dtschema
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?=
 <arinc.unal@arinc9.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220407143328.295762-1-krzysztof.kozlowski@linaro.org>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220407143328.295762-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_111814_693749_515F7A33 
X-CRM114-Status: UNSURE (   9.38  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 4/7/22 07:33, Krzysztof Kozlowski wrote:
> The node names should be generic and SPI NOR dtschema expects "flash".
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/mips/boot/dts/brcm/bcm97358svmb.dts                   | 2 +-
>   arch/mips/boot/dts/brcm/bcm97360svmb.dts                   | 2 +-
>   arch/mips/boot/dts/brcm/bcm97425svmb.dts                   | 2 +-

For the above:

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
