Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4123BC54EE9
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Sep 2022 10:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ca7URV85yKrxkToGpu5yTV2JozZM+SddjYQgSu2cPE=; b=1f6JW7ixsfP6FOsRxT6Zau9uLt
	QwOuPwW0zT8MvU89y9UPhU6ZfkSyMW7i6VCsoqSDmiWI/tXdUH1F8zlrdndhxv1p/f6Ejnzc+DDT6
	pNI2SWk6rhrre+B+P2tRoRkeJdQ6H5mvP+alqjSDbNxBbKAkYz/xspzWfkjwTpijQGTS4CXIqi++T
	Zf0IBcJRNzdb6txHF4eCSu4t5eT3A0qhAk8St26P2eqpSO8/i4Vvw0qUqxFFvaQfVUdsRLctmtTqP
	pO2V7s8nHgv8pLdISUK0TAFBE4sPBfqSEL/uvJkgaW9acdh0DcL3NFlVSXBrmqxwD2IzBKC+EukSj
	pNI4lt5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZr5j-00EawO-DT; Sun, 18 Sep 2022 09:59:59 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZr5R-00Eai6-Pk
	for linux-mediatek@lists.infradead.org; Sun, 18 Sep 2022 09:59:43 +0000
Received: by mail-lj1-x231.google.com with SMTP id l12so30628931ljg.9
        for <linux-mediatek@lists.infradead.org>; Sun, 18 Sep 2022 02:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=3ca7URV85yKrxkToGpu5yTV2JozZM+SddjYQgSu2cPE=;
        b=NOcdK9y/IjxvLB4AlRNbhchnxrCLfR6JPe46yDdIinRSWhtPe2DIGR+jViOuIdF9JM
         7Y82F9iTQixXrvZE1Gb8a3LYZMV2kSA76NMRrQRrdgR9CtYdHDv09+Z9FHoekSHSshHl
         V+0hh/FwUDRiuV/pCrfPWXWrxOxScvQj4+ACgX4p1+VmJCtM3Pf7QdVcC9uDf196BYld
         SvW9UxigPwEKACj833dwq8FgRAPr8ieQKqnL3dteFivX4taQIGE8vTNniNKK5pWKUd/0
         Z30zxc6cPQCdAgsZKNL+6X4ZQB1ko9AxFL4CbZ6pn2KQNRmvpNOPqmTZlK2eDTPQBcTz
         Zk6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=3ca7URV85yKrxkToGpu5yTV2JozZM+SddjYQgSu2cPE=;
        b=tWc830RF1j2n7Ddq4QBYNWX0YExwlpOky40umi2BvIQSQ6kJqKdEFAfzYvp3lvyuGN
         v0h0s71vY8p6gmKnJD/vsojdn/4QD3rz20UgoSTUUukMqu1mh4HEyXwihbn0BABrmFly
         0/0TK/wpUsmIXWRB/ENokvQD2/1MpKgWHPD+jMAgBy9sLfaou8gt7jGERduP/CAvimVT
         xCmdCUgk88wABlXkfLcrJjoP1C6jdDNqXBIeFtMcqCAywG5hup0ShTb0lrTrEhRK2Y8D
         qQ/eWwJ+OQrOwmPQWhldtbMv6txsT4eBHotLRryTIbHX1X8uX3RMbIlsxK29R6sF8JhU
         2Gvw==
X-Gm-Message-State: ACrzQf1F3joXEUpnI7NZSCVUYusCshzisSD4ssK5vu9wYAzKWM57CjTG
	UtIgB9kcBT1psKJ/F1VRzcG9zQ==
X-Google-Smtp-Source: AMsMyM6wA7xiTfhm8VgutQ4QQLmSyc5iFV5KfVuxKLS87itQMc+B2x5hO48lsJyXLMZ9mMrxMnGLAQ==
X-Received: by 2002:a2e:bf23:0:b0:26c:83e:b4d3 with SMTP id c35-20020a2ebf23000000b0026c083eb4d3mr3666235ljr.282.1663495179307;
        Sun, 18 Sep 2022 02:59:39 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id du7-20020a056512298700b00498f67cbfa9sm4580438lfb.22.2022.09.18.02.59.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Sep 2022 02:59:38 -0700 (PDT)
Message-ID: <e88739bc-b799-bb5f-cd5d-73e9e689cbba@linaro.org>
Date: Sun, 18 Sep 2022 10:59:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH RESEND v3 2/9] dt-bindings: mediatek: Add gamma compatible
 for mt8195
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: CK Hu <ck.hu@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "zheng-yan.chen" <zheng-yan.chen@mediatek.com>
References: <20220912013006.27541-1-jason-jh.lin@mediatek.com>
 <20220912013006.27541-3-jason-jh.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220912013006.27541-3-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220918_025941_847310_4111D209 
X-CRM114-Status: GOOD (  10.99  )
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

On 12/09/2022 02:29, Jason-JH.Lin wrote:
> From: "zheng-yan.chen" <zheng-yan.chen@mediatek.com>
> 
> mt8195 uses 10bit-to-12bit gamma-LUT, which is not compatible with
> current 9bit-to-10bit gamma-LUT.
> 
> This patch thus add constant compatible for mt8195, which means that
> mt8195 should only use specified mt8195 gamma driver data.
> 
> Also, delete related compatible from enum, to ensure that
> mt8195 will not accidentally get others' gamma driver data and thus
> cause fatal error.
> 
> Signed-off-by: zheng-yan.chen <zheng-yan.chen@mediatek.com>
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

