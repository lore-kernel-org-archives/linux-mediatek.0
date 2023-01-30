Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3280DC54EAA
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Jan 2023 12:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oAiFVbIhL8pBpzXj74ThQPQ3uZWC/mGuF3NSlIBvnlc=; b=3WYy0hwFJKoFKNaZJkAa/F8qgn
	hSFPtS5UvZ6rsEOmyCSPmUt3jHyOh0UvNFCNnR5GOGYRqkGikbNsUz0OzBBn7CYIncuEljRjCRY0q
	nVlhnDn5uZLY0c8GPCbba00b2JI5O02mx9pZsYgngKtBNshkBvTYHRqs1985DT8PEbnX8MzP++KxK
	RSEiSpSA2UmWEqDDB3CV3GnRpKGSz0lPBfLKhWDRpqQ5tg9T9RtTAPnSYLy1Q/EoxotQnAuXShdBt
	KpIM1j48WRISDEVf7+BFQgdQZn38sEc3uVtaCA/S9RFuNbXrfWKwrD+nALGMrZnjEIC8OZQQxdgk1
	2noPkKFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMSv7-003Qcw-Fc; Mon, 30 Jan 2023 12:05:57 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMStl-003QOs-1w
	for linux-mediatek@lists.infradead.org; Mon, 30 Jan 2023 12:04:34 +0000
Received: by mail-wr1-x436.google.com with SMTP id m14so10364260wrg.13
        for <linux-mediatek@lists.infradead.org>; Mon, 30 Jan 2023 04:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oAiFVbIhL8pBpzXj74ThQPQ3uZWC/mGuF3NSlIBvnlc=;
        b=h/AWH6uICOrL3YXbnDeUDxX7BGfTyv9M2TjUZ2KopvdqMLKpSbM2AR1DEyTUoR7gX/
         LCmfKMQq902Byo67s8SbF54HfmBdXqvOavNgYdSMVM0QKVgQ02OrGSDbc7Wy9v0LHNeP
         gbgIvTmOyKvcgyLFlQPdomsHC/vbzgxhMKsl0fPRFNJ5wplsxkavrcm0MoRDcyDigzmj
         DJC4El+dxYR6bRO05SezJOr2v53RAZ1Ur0XPNGBa7aphMP5DCIWLTmLfuFM8I3n7noAs
         65n2G+sr6sCQusEtHKCIDHaEDmvx18oCntir+P/ZpINxDRkIBTWhPlEx8dzM05CbfSpu
         HvpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oAiFVbIhL8pBpzXj74ThQPQ3uZWC/mGuF3NSlIBvnlc=;
        b=DGS0aAhmIfGlrJvmFP84utnaBOPIVLZocaZVr4936hRtP4l2lnh0L1oatviS5ixoXL
         sDaOp9jePhniiU9egCF1E7k1EhbIdDKwcOs8IpaujXeihB6luulQsiEeFyFP3R7NE6Yn
         MsjvwyTZI8gUw8rcvXURvcXs3ssqjQR6AcgJelmS5kJeedUVifGXVTKmBr50fDzbJtS0
         sTXWu69fgu9LEj+mPmOlq0oAWiiXUZiZVMxurk361rY5NxvrizwXTtJJDrSt42kQ2+wa
         ctYZUP9eCcLppWOjRFUxI4gjK7xCJGVjufXTBLDtZQgTAdxpNK5W4bWYSAmc3Brphhv+
         8J7Q==
X-Gm-Message-State: AO0yUKWoJr61zMVxvCM+099lBKiJ2RyQTQWE8CnlFAZuQOKiiPV98a5S
	ogmlzF4nsrNWweHHLT2vJmkuKw==
X-Google-Smtp-Source: AK7set+HjgFg9eVMoCGF9nRtNIbwCr+z58262n9G4v5RdsFaXE6jeiu/4i9y1ZVHnuh2i6pbgt5Nug==
X-Received: by 2002:a5d:59a4:0:b0:2bf:ef3b:d072 with SMTP id p4-20020a5d59a4000000b002bfef3bd072mr2968016wrr.0.1675080271619;
        Mon, 30 Jan 2023 04:04:31 -0800 (PST)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id h12-20020a056000000c00b002bdd96d88b4sm11869268wrx.75.2023.01.30.04.04.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 04:04:31 -0800 (PST)
Message-ID: <ca32d9a1-8a1e-c65a-7e52-c065b31c0e4c@baylibre.com>
Date: Mon, 30 Jan 2023 13:04:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 3/3] dt-bindings: iommu: memory: Use unmanaged iommu
 domain for the APU
Content-Language: en-US
To: Alexandre Bailon <abailon@baylibre.com>, yong.wu@mediatek.com,
 joro@8bytes.org, will@kernel.org
Cc: robin.murphy@arm.com, matthias.bgg@gmail.com,
 krzysztof.kozlowski@linaro.org, robh+dt@kernel.org, iommu@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20230130102722.133271-1-abailon@baylibre.com>
 <20230130102722.133271-4-abailon@baylibre.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230130102722.133271-4-abailon@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_040433_130438_9B85D269 
X-CRM114-Status: UNSURE (   7.34  )
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

On 30/01/2023 11:27, Alexandre Bailon wrote:
> This updates the iommu id to use unmanaged iommu domain for the APU.
> This is required by remoteproc to use the iommu.
> 
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>


