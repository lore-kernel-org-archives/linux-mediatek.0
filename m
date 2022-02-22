Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 164E3C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Feb 2022 15:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=222hWDiXxffv2hBDfFRkRYIZUiXV+pMhO+KsxsimwYE=; b=Fk383wG70NcWah
	uC/pWZlPDsDEhmQi2zxX9ceSaposqYDgII9ZenEXSabHVWcfQe/K/Z/HDQdyZTKJjUZNbLV5F9Yl0
	sqzlD7lO+czu7vXXJXLas8UUZU8wCalorbnsnxM4/1k7qhs17Q9MTDAxRatsWa2MJql0DOtszgZxo
	r5O0YBdB7ni7lJsdMHKA7xil2G3x+8ojy1yqipuGyf0Wz+trOziEuOxXg45mYxnaD5jgpDstQczmD
	gZ9XPzHU2CN9YO0vj2yN3li8fe1X/2trG0V+6WVkK1JtGurpyL2plhNgRwC9r66IvXr/nmEq2ZEMP
	RvhVG82uwUhYfTfoWZdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMWqJ-00A6ra-1c; Tue, 22 Feb 2022 15:12:43 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMWfl-00A1L3-Os
 for linux-mediatek@lists.infradead.org; Tue, 22 Feb 2022 15:01:51 +0000
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 449203F1D9
 for <linux-mediatek@lists.infradead.org>; Tue, 22 Feb 2022 15:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645542108;
 bh=HtdrJ3I4lOo9P+o7lWSeEHgMO5/UUG8VsgHgTsClLgE=;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:
 In-Reply-To:Content-Type;
 b=G+PMQ6V4Q5in6kK6rSduCkvGNHTtH+X25bfzi4EQKTEGYL2UaIAxtYU7TZnqBh49l
 v7Yt4WGFM5fBf038GUvq20EPjmfg4kG59j2HkCrisb9aV+f36+HXOrFrUdXkeQBD6D
 OuVyVGbdGwGATWXtS9bkM6DCW4oAvTptqzUxZz5ZWBTO2+CFASoT60Ng7EkwBVqwf2
 iaNnYpLLwionXg74HKRub/LqIfvP2BYMalwNZ593fuTbzA1TRbjy8mCkF+FWhrmHJa
 x/nBB7uWI2mBzw4KBqK8UK46vTIMBisnesHdKrMVC7VZ9r0+PttR8L6krPtv8pjlTs
 B/fy0EWWyZiqQ==
Received: by mail-ej1-f71.google.com with SMTP id
 v2-20020a170906292200b006a94a27f903so5897253ejd.8
 for <linux-mediatek@lists.infradead.org>; Tue, 22 Feb 2022 07:01:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HtdrJ3I4lOo9P+o7lWSeEHgMO5/UUG8VsgHgTsClLgE=;
 b=hH7pw9mrELxy7YgSLmzjwagO0VPIcGtGlh9E1RWAOkTYJs93kRwXBhqpyexvJUx9Yc
 /h8v6a84n0SjVzSwjS8yT2jy1e6IjqnJKBUZgJTuhc2/7pgmVRn+6yZXiQiZM0pzFOT7
 E6ebo3zy30DyLF94XG7Ww1DPSRb+TcSg3s0OtbZDWqwYtWgpn7FtcotTAAvno43qqxp3
 9KjV6suQjHr9XC2DmJZX2yyMK//PuWppGw+71QiLpd87a9cmCAf0NZM5FlkRuNCr46KE
 +bCPQKyBHrp0ssjYYN7KlQPAi+2e3+ZoYUte36IzS+M0oKJOwne3NicwxSBbV2c6EB+I
 lf9A==
X-Gm-Message-State: AOAM533pgcd4bieZ3AWn8olWKZLFfeFugoJwR9iDbtUMxTzNIeSeuxXc
 G2K2TYBIJNVQR0cOC+vXF98n+F4GeUre+VOd9XBWlcY1dy3QFjeSoYeAOBkGcAv6xH3B2Lhh4M/
 4oMUSkmP0iiFC55FGLasSD7xu1xeXFTDX1GMHJgWTnygybJ0DFQ==
X-Received: by 2002:a17:906:b005:b0:6b4:8861:597b with SMTP id
 v5-20020a170906b00500b006b48861597bmr19372056ejy.238.1645542107960; 
 Tue, 22 Feb 2022 07:01:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyl5ajALOLJhstZXNm4FFrBok2iV4kiyLbSmxL7nyMkd0sVGKDRLluG1qlnkwVf1Pl3ETi9Pw==
X-Received: by 2002:a17:906:b005:b0:6b4:8861:597b with SMTP id
 v5-20020a170906b00500b006b48861597bmr19372009ejy.238.1645542107580; 
 Tue, 22 Feb 2022 07:01:47 -0800 (PST)
Received: from [192.168.0.124] (xdsl-188-155-181-108.adslplus.ch.
 [188.155.181.108])
 by smtp.gmail.com with ESMTPSA id ci16sm6345629ejb.128.2022.02.22.07.01.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 07:01:47 -0800 (PST)
Message-ID: <4e459bbb-ca6c-4ca2-efe9-8ab4d4f3b648@canonical.com>
Date: Tue, 22 Feb 2022 16:01:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 05/15] dt-bindings: ufs: qcom,ufs: convert to dtschema
Content-Language: en-US
To: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
 Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Wei Xu <xuwei5@hisilicon.com>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tero Kristo <kristo@kernel.org>, "James E.J. Bottomley"
 <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>,
 Jan Kotas <jank@cadence.com>, Li Wei <liwei213@huawei.com>,
 Stanley Chu <stanley.chu@mediatek.com>, Yaniv Gardi <ygardi@codeaurora.org>,
 linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
 <20220222145854.358646-6-krzysztof.kozlowski@canonical.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220222145854.358646-6-krzysztof.kozlowski@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_070150_053034_37080BED 
X-CRM114-Status: GOOD (  15.44  )
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

On 22/02/2022 15:58, Krzysztof Kozlowski wrote:
> Convert the Qualcomm Universal Flash Storage (UFS) Controller to DT
> schema format.
> 
> Except the conversion, add also properties already present in DTS:
> iommus, interconnects and power-domains.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../devicetree/bindings/ufs/qcom,ufs.yaml     | 241 ++++++++++++++++++
>  .../devicetree/bindings/ufs/ufshcd-pltfrm.txt |  90 -------
>  2 files changed, 241 insertions(+), 90 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
>  delete mode 100644 Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
> 
> diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> new file mode 100644
> index 000000000000..356217124222
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> @@ -0,0 +1,241 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/ufs/qcom,ufs.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Universal Flash Storage (UFS) Controller
> +
> +maintainers:
> +  - Yaniv Gardi <ygardi@codeaurora.org>

This email bounces ("User doesn't exist: ygardi@codeaurora.org"), so
maintainer is needed for Qualcomm UFS bindings.

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
