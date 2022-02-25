Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A48C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 16:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ku1XQqP9d6SEy/lgqpE0eSxHrd7siWLGS3yNT9SnAL8=; b=METp6w+9UWgfHi
	nhL8U+UPaidHY0M8qX1KoHZ9aPdUvsWw0O9qJe7lGLeUVlHsyehW1LlB2+ajfp8BMAYK/SJMMLW5B
	+HI5cPClLsFMq1HJidfCRP1XRzG9REnSjNIox9fHJBnpmNjq092UBEIXKTeAI3AYLbCrE1yXMNsL2
	ouyUaOhJrNsdcTSwlln8yjiSMnhs7IpSO9v1cOBYrfaARNgnBhFi2acxCN5Zp0KgEv1m3De6dzO6y
	1lNpKaVWH4QSTBBacxeuTaJzrtxRrlUsp4jy4lQkl48V4f2sjkQV6YE0gFgtP4tj8dDyafn3yV1Ry
	iUnwhvNCOFSBJH9FgCjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNdad-005xYj-2B; Fri, 25 Feb 2022 16:37:07 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNdaE-005xNl-14; Fri, 25 Feb 2022 16:36:43 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id
 y15-20020a4a650f000000b0031c19e9fe9dso6820225ooc.12; 
 Fri, 25 Feb 2022 08:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Dec347SrLgLC0WzRa99gVMTjXKUpk4Dvu/3QxlLX+o8=;
 b=nvww4HMzNa6UycY1GsxwFWPWcM8UpfXCl2UfRTrLIhK88PagqbSGkxKg+8i77qgZZZ
 xeWoZjKtihIEhJaLW4InwiPD7yaniXPiF6Dg3mcOSTRkVA9kKC24v2IwMfPNiWwUgs5F
 xjStS4WqjZy4xo1NGL11Z8kZlbK9EJM6rBvB5WypPGCKD78ATM65zcoEX4LNu42t5OV+
 TQtPqz/Uhe7lCandWDzCXTywQytdQVv2Ae+irpuovJVVi/76MKUPtu9duX7C4W6UYNdy
 dVd65bg3aeFjIHpflgAWayYB0MOeVYc2FRRPFtW3uk31IsLv3+J26tj0aCo7mVU0DM6/
 SrZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Dec347SrLgLC0WzRa99gVMTjXKUpk4Dvu/3QxlLX+o8=;
 b=eURcQDoxJcVjDofys1R083Lg4zskYkq7BiHva6kWESN6d42v1eGvvCKBhOyaEO3+PF
 LIfmiQ9VdoHxtxlcthpFVefrYyJHAyA0h65rmcCkRNVpiIlc6FqENtvt1RndEEFQOWOI
 ZyJd9emuIZXgqkHDyEdUYXvqvvaQ8RV1q3nehcw2QKwT2S2s80oIHgdLuDPxCYdZz5VZ
 5dz/LY1XMaP55/xAj+6hYGVxve0nQKipf0qs+uNibZHZVI33tKp8FiNazzPihPSGI90u
 F8PHGmRcRxh4wW1dqtrdHYQnEPbi/HvH15eETHpRCKCfslS+67v9B9tDUsxLKpgE+ApZ
 ApIw==
X-Gm-Message-State: AOAM531AKXpIejPv+Qf52iybsWHHjv6MjcV+tbHTsVmMsRxjIHWBe1TJ
 koo2NWkVrfchMUOHc0uo6yE=
X-Google-Smtp-Source: ABdhPJyxqhDz+2w1gzC/91KjRDvnzqhF1bQndLV6JOsMPUvDBDCfL5o+OiSGr/Y56tpLQ++UJpUE4A==
X-Received: by 2002:a05:6870:971f:b0:d6:c8bf:43fe with SMTP id
 n31-20020a056870971f00b000d6c8bf43femr1648758oaq.258.1645807000840; 
 Fri, 25 Feb 2022 08:36:40 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 t7-20020a9d5907000000b005afa4058a4csm1384070oth.1.2022.02.25.08.36.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 08:36:40 -0800 (PST)
Message-ID: <6e3a67fc-6030-540d-ff97-13ce0a147992@roeck-us.net>
Date: Fri, 25 Feb 2022 08:36:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/4] dt-bindings: watchdog: Add compatible for MediaTek
 MT8186
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, wim@linux-watchdog.org,
 matthias.bgg@gmail.com, robh+dt@kernel.org, p.zabel@pengutronix.de
Cc: runyang.chen@mediatek.com, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220216014505.28428-1-rex-bc.chen@mediatek.com>
 <20220216014505.28428-2-rex-bc.chen@mediatek.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220216014505.28428-2-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_083642_111209_03756357 
X-CRM114-Status: GOOD (  11.74  )
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

On 2/15/22 17:45, Rex-BC Chen wrote:
> Add dt-binding documentation of watchdog for MediaTek MT8186 SoC.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> index 0114871f887a..74db01e3658b 100644
> --- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> @@ -15,6 +15,7 @@ Required properties:
>   	"mediatek,mt7629-wdt", "mediatek,mt6589-wdt": for MT7629
>   	"mediatek,mt7986-wdt", "mediatek,mt6589-wdt": for MT7986
>   	"mediatek,mt8183-wdt": for MT8183
> +	"mediatek,mt8186-wdt", "mediatek,mt6589-wdt": for MT8186
>   	"mediatek,mt8516-wdt", "mediatek,mt6589-wdt": for MT8516
>   	"mediatek,mt8192-wdt": for MT8192
>   	"mediatek,mt8195-wdt", "mediatek,mt6589-wdt": for MT8195


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
