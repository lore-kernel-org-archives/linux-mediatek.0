Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 643ACEE6433
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Sep 2023 07:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1DmNveiP8xHX58IAf7GJRRnmwEbVvFnwIttOiAgQ004=; b=JaO3kC+Uwhp8kNzVmcSTCdLUG0
	i2nA0dcEv+4nQsnsGBte4YtfVqovAN5Vz3M1yPvIC98dPx8HsSJCOmIjGsyB8zYjtZa7iyO9Un1WQ
	DDlVAWUpeMFHxnUA/hEauPQB4sIVEKxS5cRmZdI8CH2NNJPLohJLYLNsaXNTnEWyGDW3nElY2v7B8
	kSA+FooAssilxbOcewN49aPidtIvOACxnEstocOPQb0LbMt5UUIlmLp8vcgOedE+kHhp9CfqpEN/3
	pOM6+rwCaDa5gfWE5g9TSkLYpb44kMWQEaUfrAzLpOBX0gZyfLgy8qH3mSbtp6A+Zce5u23ZZwolh
	hAwKq4Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh3d1-00A5Pw-1X;
	Fri, 15 Sep 2023 07:52:39 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh3cz-00A5P4-0L
	for linux-mediatek@lists.infradead.org;
	Fri, 15 Sep 2023 07:52:38 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-52a40cf952dso2151576a12.2
        for <linux-mediatek@lists.infradead.org>; Fri, 15 Sep 2023 00:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694764355; x=1695369155; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1DmNveiP8xHX58IAf7GJRRnmwEbVvFnwIttOiAgQ004=;
        b=ZYqbl5gNMsXu4IwsK0Aaa6r5y9R5jupx7GMtJ2/0EjpHnzWkljpUs8nGYaJ8XUW1UN
         SvKBpiZN8KbVtDowOdCmYzoE0eCX7mfIyCM/PaW+H2WMEPNsFDM34hwCQiGU4mWhqwlo
         ux2gTTdPCd/ULFTo7ThiTryuo0rBcgQ912B9GvlYLc0m7ZepMu0HYNnluVnoSYj2Y61b
         WG+lfSZCsEFFNeNsaiWo6W3uHdO+SdGvjBg6ffsPSxzotkiJvtgzGjECr5yzNisJ0qeK
         aWIJj19DLzqmeii/6yKGI0cYlzpmuVroCGhGggu81en9YFeSMtlgEoZBcl2bTLS7Rfce
         MakA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694764355; x=1695369155;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1DmNveiP8xHX58IAf7GJRRnmwEbVvFnwIttOiAgQ004=;
        b=CAdErIO8RBDRNtzx2SLIp3hervnKwJz5arbJmDJeHC/UQxsLVQYrSBJD8uKPpdkw0G
         ahR9hNmZ0T4KbuT2HkVOreH9pWflQMboOCYOsQLhe8x3tJPlEi4ZXkrTskXVPhDSISq7
         g0lTKqPu74VPv6ic26lA3DtpXFuYfcaIvwcEuXjAjZWwwHcKiNJB/NWGovZjgmkqeHrX
         /1CPm/sRW1y0GZyw/3BN0yjWZKIexoSlqIlylwvvsFCJgAVs7GqdWKTvHPr4s0zwKcW8
         S2ODeuI9/l5MDdmzvl0E4o03NcK3zyyjqSpUWP3PBJJbSQ5yPpYxODnVkxO1QD0L0R0Z
         s/dA==
X-Gm-Message-State: AOJu0YwpKOCy3FM+7Y/sHg29GlC4erBnNcK46fEyoXGMhT+lTlutHirT
	2U8TwSXmV5dHl2oolOHC6HGfAg==
X-Google-Smtp-Source: AGHT+IG3viMjTUAP25MuwtYIdv3N1ev0u+/SYqVBSVH0BOrYl2RsGa4IaFywaU+81yE3KsWBeGeP+A==
X-Received: by 2002:a05:6402:14c4:b0:52a:1c3c:2ecc with SMTP id f4-20020a05640214c400b0052a1c3c2eccmr687838edx.25.1694764355070;
        Fri, 15 Sep 2023 00:52:35 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id dm6-20020a05640222c600b0053090e2afafsm328735edb.22.2023.09.15.00.52.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Sep 2023 00:52:34 -0700 (PDT)
Message-ID: <83142b6a-90da-b705-5170-5468175cf23d@linaro.org>
Date: Fri, 15 Sep 2023 09:52:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v1 1/2] dt-bindings: soc: mediatek: add mt8188 svs
 dt-bindings
Content-Language: en-US
To: Mark Tseng <chun-jen.tseng@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Roger Lu <roger.lu@mediatek.com>, Kevin Hilman <khilman@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230915075003.1552-1-chun-jen.tseng@mediatek.com>
 <20230915075003.1552-2-chun-jen.tseng@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230915075003.1552-2-chun-jen.tseng@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_005237_211013_93C2C05E 
X-CRM114-Status: UNSURE (   7.27  )
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

On 15/09/2023 09:50, Mark Tseng wrote:
> Add mt8188 svs compatible in dt-bindings.
> 
> Signed-off-by: Mark Tseng <chun-jen.tseng@mediatek.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


