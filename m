Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C339C54EBE
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Jan 2023 11:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UVemH/+n0aJ7yrCrT3xpnKXM2hgC6V4Q+8fb69hwAOk=; b=RTt+af49RxngLGry2x6B5VROVw
	c7bnXZE94Ak8qunOZOMgvF8Rn8yzJo418d2KAYE8d0L8lGA93SJrs+uNtpNiEypYvzGbRbNnOJlPF
	2QGH1KsSf6YH6V58R/8LAtcImCmflssxrDmxD6MFWOjOKgPHYWAaLibnX2q92EHwH9f+4dwRKGKLF
	W0APp+BCygnfaq8d7wY7u9VOhJYfRnJV+r7Q1sfic+NT2Si5vHLz93uwmjS9VUenBmTsY3VA7e//i
	ixAJ049jFKAbv3vaX4la4lqZDTrkm4EOi3TK0S9D/axfRKzZp6mh3154RaJvowQPN4iL9bHEGpTyl
	BVn7zs6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGILx-002EKt-O2; Fri, 13 Jan 2023 11:36:09 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGI6M-0026i5-Qb
	for linux-mediatek@lists.infradead.org; Fri, 13 Jan 2023 11:20:04 +0000
Received: by mail-ej1-x62b.google.com with SMTP id tz12so51579079ejc.9
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Jan 2023 03:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UVemH/+n0aJ7yrCrT3xpnKXM2hgC6V4Q+8fb69hwAOk=;
        b=HN33jyjNY76i+LmfFBLXwMrJnAzRKg4pfO2NpJJS1nn6PmfyMNwshrXZx9YqEjRVYU
         jAxgiZUHuZX+hj9PxL8Q265xOrOVw6Lt9h0Ii9YvBxYnGvt1UpW115w7DFNFDF2KmvWo
         aP/GvHAjt5Q0w6Ay24UpdYig+C0+cAPhXG2ud4EdeYYRRbpe7YIF+8BDiNJiudCdNx2O
         JMKT1pF0kHr0WGSn6n0oruAJqA+gan1xxHoZNg/ap7PjxyMZ97HHy0Ct+l1+JIdr64F3
         //ir3yRDNNDlRnCvRBdR5c9dmhnAo/k31psfuedl+viz/MS0gHRMYjCzcC2Lf6896ytL
         GRag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UVemH/+n0aJ7yrCrT3xpnKXM2hgC6V4Q+8fb69hwAOk=;
        b=TTZW4DT5KSllCrppV7HbTe2QyAI/WhcwI0/EHNWjSDuOmJBY5KOWFAoakNYhWsFZsb
         bsqNhlweQUyE8Rw3TVuFsaMV8WQ0TxY3AURXosusNEASuU77UiYYmDV3y6jZi2sDgL/p
         2R+pa4mOTu7q15KBwx2N6rvE+4jZPsizc7U55mqX283KczB20ThkVnu6osvYgwC3DFTR
         bbNguyNIGPshs27EZYA3VDG9H16H/+ZhPe4H2Og41/ep1v20yZI8aBKS1vyr+ldHdo8B
         5Lrj5LaeIX50Tt1z5NI7K/DoqtFcMPZbQ7F60+xctiIk+PSXInH0BahxFtZ+BODHCYDe
         oXSA==
X-Gm-Message-State: AFqh2kpllMd+cn+NRg5xwDYliiqnU+HUnDPxA8wmKLNb4O3w3stn5oW/
	AegdaGUSElIpQzkejz+5KmGYpg==
X-Google-Smtp-Source: AMrXdXuBDV8ne84njqmvaISRnt4bQg7QL0cfZ+DV1EG8StSnyW43wySSBQBImvGeW9CNIaH+VYgy3Q==
X-Received: by 2002:a17:907:8b11:b0:81b:fbff:a7cc with SMTP id sz17-20020a1709078b1100b0081bfbffa7ccmr69306280ejc.18.1673608799052;
        Fri, 13 Jan 2023 03:19:59 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id k8-20020a1709062a4800b0083ffb81f01esm8397495eje.136.2023.01.13.03.19.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 03:19:58 -0800 (PST)
Message-ID: <72b30123-300d-0751-9725-6cd8e2a18f4d@linaro.org>
Date: Fri, 13 Jan 2023 12:19:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v30 01/11] dt-bindings: arm: mediatek: mmsys: add vdosys1
 compatible for MT8195
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Nathan Lu <nathan.lu@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Xinlei Lee <xinlei.lee@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, llvm@lists.linux.dev,
 singo.chang@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230113104434.28023-1-nancy.lin@mediatek.com>
 <20230113104434.28023-2-nancy.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230113104434.28023-2-nancy.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_032002_910249_AF9D054E 
X-CRM114-Status: UNSURE (   7.05  )
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

On 13/01/2023 11:44, Nancy.Lin wrote:
> Add vdosys1 mmsys compatible for MT8195 platform.
> 
> For MT8195, VDOSYS0 and VDOSYS1 are 2 display HW pipelines binding to
> 2 different power domains, different clock drivers and different
> mediatek-drm drivers.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


