Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E579C6FA82
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Sep 2022 14:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YTIg1OEXQ1/dcwcVxi+ZGuAdkeMfYekXYmzBim0nPwo=; b=C912wqzyhKHF12XBu/NY1aS/HS
	z8c2UKf+raG/F2f4tdIlQHv1G841dbr4QtFI0FKbyAVLCFEhCRBxoXvKW2F0/CDZUJ1k3c0XrnKxH
	YRBK7H7u2FF76+T8BYzZ6q3/USLEd4bJtd1zqY/K49WW6T0uHGm99wuQcVprnEOlBjKwWLhCMRg69
	yu+tBnJh2kAMT8W2rly7yD+Q3q/d8yA/VNMJHHh3ERZhKyLt1veKdWZSOd/D4rFneN1PGKpEQUMgA
	k8owpz3uV99N+DA5Mkx2B5VsWWPty76U4hIq4SWn6VjgG/IdVTP7ttXgujrnOB4MiifxeaF2Yf0i0
	Au4NE8Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY6T6-00B9y3-3y; Tue, 13 Sep 2022 14:00:52 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY6So-00B98q-EU
	for linux-mediatek@lists.infradead.org; Tue, 13 Sep 2022 14:00:35 +0000
Received: by mail-wm1-x333.google.com with SMTP id l8so4161293wmi.2
        for <linux-mediatek@lists.infradead.org>; Tue, 13 Sep 2022 07:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=YTIg1OEXQ1/dcwcVxi+ZGuAdkeMfYekXYmzBim0nPwo=;
        b=hrDCYLEP1zzGWYMHHDLGYWIigPeQSwQMzhJFuPFlSGf/ZedgoAtZUQ67l9GsBD10oq
         LQ61+//hDPef+UROY1UFHL/IOKC/t1jMkimOMibMBfwcZBes9tc6Ob6qRVGzPVanIcBI
         OnmMgK6IwI1Dr2T4JN8Ws4DTyPkEBvP7DFYGYHnS+NYHZbiZfNkxeWDaO5RVgG9ytyJD
         2tGLX4UxKzZHQCifoq23qSC4Awc828J+PUfR7b7l7yFgAzVzE0urmluDMBkLWwrqUKNY
         yHrlr+dJ/gaeIefR5sn07jQualrsm48m9IFNGNHrAs0f8WqdV/XWQHvIMC1LXKnU33W1
         fdCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=YTIg1OEXQ1/dcwcVxi+ZGuAdkeMfYekXYmzBim0nPwo=;
        b=Oso9YiryBLW7FSt17DnRxj+a21aAi60hm3s+jtxrCctnkMAARibVB+jZI1pis2beSy
         btvnlRyF+rTdgGPinlOFLMk2aY9e4V0oIbrfNScfUNoRwbXE4fr0IVYflFFHLr9u/OvF
         dqrebngWmPwRd9Oz5THZhPfqvhefD9esCA853MWvNrghGpf+9iPfSX6mEohZQ2TWvbR7
         KfZ/Jexg4/25E9gi4QeWjl4SZTUaMPs3ueNN0QXNctT/vy84P6IrU9Jr9liyIcZkUZ/p
         u/vz5MLf3GY3JW67s+Sg1wripKIDGhb7YZv57vCM/KpNvsSAS89hDfofoIK3QVej2tBY
         1I7A==
X-Gm-Message-State: ACgBeo0i9cWYtHxVY73YoA6D7S6Bd7JTcjfEwqm/oCIzWJKcqLuRnp7p
	PqD5UzJ5h+SecMyuiGmnji691w==
X-Google-Smtp-Source: AA6agR6eb5yCW6EoZ0KxQRuBsKpwheJjnMgMzi9W9LXmWNAhnASIkVMi98VWdxKNTTbBTWXhTT3Usg==
X-Received: by 2002:a05:600c:1e10:b0:3a5:4f31:3064 with SMTP id ay16-20020a05600c1e1000b003a54f313064mr2490080wmb.136.1663077630890;
        Tue, 13 Sep 2022 07:00:30 -0700 (PDT)
Received: from [10.119.22.201] ([89.101.193.67])
        by smtp.gmail.com with ESMTPSA id c1-20020a7bc001000000b003a5ffec0b91sm13123005wmb.30.2022.09.13.07.00.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Sep 2022 07:00:30 -0700 (PDT)
Message-ID: <affc47aa-a11f-d18b-7c6c-a3698d97b3b4@linaro.org>
Date: Tue, 13 Sep 2022 16:00:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v5 1/3] dt-bindings: mediatek: Add bindings for MT6795 M4U
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 joro@8bytes.org
Cc: yong.wu@mediatek.com, will@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, konrad.dybcio@somainline.org,
 marijn.suijten@somainline.org, martin.botka@somainline.org,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 paul.bouchara@somainline.org, Rob Herring <robh@kernel.org>
References: <20220913122428.374280-1-angelogioacchino.delregno@collabora.com>
 <20220913122428.374280-2-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220913122428.374280-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_070034_552855_6E217AAC 
X-CRM114-Status: UNSURE (   7.03  )
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

On 13/09/2022 14:24, AngeloGioacchino Del Regno wrote:
> Add bindings for the MediaTek Helio X10 (MT6795) IOMMU/M4U.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Acked-by: Rob Herring <robh@kernel.org>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

