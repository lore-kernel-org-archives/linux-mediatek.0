Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 235EFC76196
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Apr 2023 15:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IBdfhAiuCEqD7RtTx8Ci52s2HURcnZu6d3ip+Anq2OE=; b=ZpG54/m4c4howKORJUX3O16rgZ
	DuTOZMlPp7ChiGFX/Q8gzKNnxgkLSoh+oEOTetPCNQ+NmbV1MF1oU0OgkhYTf2hql6Md+r7ZGiKfi
	FnE02QKn6mgiNpNLi7+NXgBZNUvNJo6qegp010miIZxOSed/DCBRI23IDy2lEVJwAN5HKftmAp5Ah
	qBIqYiCUi3AfB1ciFWUXKHDFi53GM4LKPrrS2plrGhJBC/plon0L/am/XdqoIGDcpgEy/8WRqLvLm
	+yskHI9IrdygUfdIIaO9Pk1VsLb/N78fEq++fomDk8FD89Y1k4Ppf6vlrrzHBY2B49K28wmlc0SfZ
	MvdyHtZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pltU8-00FRm6-1K;
	Mon, 10 Apr 2023 15:31:12 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pltU5-00FRko-2k
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Apr 2023 15:31:11 +0000
Received: by mail-ej1-x635.google.com with SMTP id qb20so12872249ejc.6
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Apr 2023 08:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681140666;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IBdfhAiuCEqD7RtTx8Ci52s2HURcnZu6d3ip+Anq2OE=;
        b=P0GdGNeiMWHlHtdDH9sRbF6cNkJ2IzbEXTzFv5b2eukJiSBZjwCwyQgrTq8JYy+zaz
         znD8Vl8cn3JY/F+scx1nzPxlm7RJU7ekeKesAD3i2b2JzVAFX2EnirPq/84SZ9gppmHd
         SiC0OZQyrjilj32CPrINCHCIA7DhcmQu7uPD9Yi9N79gaBmWSydNmwyXfs+590vnZVOR
         ftSTylYI0NNSG+CdT5BViFTJ1tLvhypAH6T1tXivxJq6D4nlFXlDRQL2v1BnmFXLDdR6
         f2GG1uT5pT9RODLOblIitxoM+5m57LULhegr31dfxYf9QHBMEc1xMEQiwd9HsKyfvo+2
         b/Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681140666;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IBdfhAiuCEqD7RtTx8Ci52s2HURcnZu6d3ip+Anq2OE=;
        b=Ioib1Rcscdm0hYcAcaeKNviG64WpWMxOSRZIxvH8MIiTYSAxj8fn0kc3cGzu9/Ocpn
         /TN3MW2kbsWnhLyEIwvO6Yg208zYZxKxofijw9idnkq1n4Les7n1651lDlCN6lZw4311
         u+QFu4reucu9SmRVCQFRanZbusTr+JdstffrCEkDXJnbNP1eTpAlEaL3t5I7UKGTEC1g
         uPDGTd76wG5leupBR8YVIl1Y0y9E/bVhWcZxGiLJ3da4D/nOLxK3KPNZPEEgp1LzB9FN
         2wEmYGWcJjl9XZeMTCYKksK/UEuDMsNAKyQ6eDVTeJ2s7O1bXOiPojji5GroRoN1Ce0D
         82OA==
X-Gm-Message-State: AAQBX9dhWOG720bzUgED8yDwPtT70arUG/W9A7OnW5cyAMKxrAadKNa4
	nawm1Ee7cYoUfk3YdykvF99BJQ==
X-Google-Smtp-Source: AKy350YzJjMIz0pn/8a10YREbTWl5he8HuqP0ckjnl5NSVi0xhbBIimcqLpyUlXGQva5k5cG3pl/Iw==
X-Received: by 2002:a17:906:2a48:b0:93b:1c78:5796 with SMTP id k8-20020a1709062a4800b0093b1c785796mr6165570eje.43.1681140666219;
        Mon, 10 Apr 2023 08:31:06 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:eacd:ffa4:1df7:3870? ([2a02:810d:15c0:828:eacd:ffa4:1df7:3870])
        by smtp.gmail.com with ESMTPSA id rk18-20020a170907215200b0094a77168584sm1474667ejb.125.2023.04.10.08.31.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Apr 2023 08:31:05 -0700 (PDT)
Message-ID: <874277fe-92a6-2bed-eccf-15fc90d8574a@linaro.org>
Date: Mon, 10 Apr 2023 17:31:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: mtk-xhci: add an optional frame
 count clock
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Tianping Fang <tianping.fang@mediatek.com>
References: <20230407062406.12575-1-chunfeng.yun@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230407062406.12575-1-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_083109_890601_89B19427 
X-CRM114-Status: UNSURE (   7.88  )
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

On 07/04/2023 08:24, Chunfeng Yun wrote:
> Add optional clock 'frmcnt_ck' used on 4nm or advanced process SoC
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2: based the patch:
>     https://patchwork.kernel.org/project/linux-mediatek/patch/20230403191850.374839-1-krzysztof.kozlowski@linaro.org/
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


