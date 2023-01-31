Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE95C38142
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Jan 2023 11:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jbuaZt7lhM/9Ln5zNse1ilA+2En9FQ3goK6JMsF3RXU=; b=snmC7GLtVfiKiZORRqqxaGUYfX
	K2nsUFFoqvaGDi2ip9BAmeuakae1jGCgDxcMwICPjA8nfguW5O3GS4fMuORFAOuN5OgBntqmC0iV2
	/EcOcB4hn8oziV6TveYB+BsqjaVGzSMCDGE23Y0lBHusrIsZnsZM52lt0xAKNUqH5pSED/oSZ2H+X
	24LU3n38SuLGxR6DN8mbgFkZ7j39KoKjFgwE+w1cKG6yP1TPPlhKzvrON5Pqgs+v+VWcOx8OwMM63
	7YpJPTm2K9NB7yxJ8QZjsbFrt+dye3sZCRe69XbM8YcLXt795wWDPVTBpLEhj/YTYLmt5nBsB30T1
	7aBK2HOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMp2K-007jur-P0; Tue, 31 Jan 2023 11:42:52 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMp29-007jpp-CK; Tue, 31 Jan 2023 11:42:42 +0000
Received: by mail-wr1-x42e.google.com with SMTP id y1so13944493wru.2;
        Tue, 31 Jan 2023 03:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jbuaZt7lhM/9Ln5zNse1ilA+2En9FQ3goK6JMsF3RXU=;
        b=iBJRXcXOfNlS/bNMALXBSUsoDCg0SbyFWLXapD05y0OOSL874mHMqfAuh5vd3VO45r
         79VWiPhfRAG9Eofp5QQRhQ/UZycsbplEOhl4uVpMf0wt4dJyeACIBclsRv+d37nKitcE
         uc4pAYt2yyiNb2quuXfViTLCPU2RaLPvSjmfL0ho+O90QmI3CA/2zdHYXYWRvsoZqjuO
         JAr09yk0QaYpF1xzZ1D8A4wnJBKVaCVdlrhzoAf3BtIlIXpV5GxIAxxMqYEdIHlBTb0h
         I07gxQ3kMf0GeBlKEYRX+h/xc3KVTsSiyczyehePJnrWBhn4oEJpRHM0OZCHpPsxPo7n
         +4PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jbuaZt7lhM/9Ln5zNse1ilA+2En9FQ3goK6JMsF3RXU=;
        b=xtf5xVxKDFiH5SN31Rz8pY0WEjLvZCGT2h1s2hAuVEPar9A+E5YSVDBErWBvRujblg
         OUHmMv0yB6tffG8boteEZkFBybDryoKuIUv6FPUbjesJxaAUocVM6pOik3KjqP4T1EEL
         R721qbXlp0qwAcRtyQsiZZLpmtEFkmPRXTBTu9G3ZeXxixoMuNiR8ImQNLMOrg1QFtNy
         /H30zgp/+IKN3la0WaI5zDbFpFT/QqiDl9o9WrZpNZgy/Fz78FYADzETGtXygndgTG18
         3M8tfUjcNfsCMz2ecy0bV0ZI4xwSHdOi8a/DnJrCQYEdVm7d3aADJKHdVHH8ceYj+Cmx
         2hCQ==
X-Gm-Message-State: AO0yUKWRZ/QajA4VTdelBuWXULcIulnQnUIY1+cnRxIpdwigrcTiTyml
	eKjor6OywfsTakBRktCm9Yc=
X-Google-Smtp-Source: AK7set9v+XGRdhbhRoauvb60itN4l43MujdWvSVRCtJ9jAJS7r5kiHvWKLHYDuoX5hwD0pmfNEG/hQ==
X-Received: by 2002:a5d:5e93:0:b0:2bf:cba5:6add with SMTP id ck19-20020a5d5e93000000b002bfcba56addmr2898145wrb.58.1675165358589;
        Tue, 31 Jan 2023 03:42:38 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id z14-20020a5d4d0e000000b002bde537721dsm14408352wrt.20.2023.01.31.03.42.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 03:42:38 -0800 (PST)
Message-ID: <2a091926-653c-6deb-12b9-85ae5ecef8cc@gmail.com>
Date: Tue, 31 Jan 2023 12:42:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 0/6] Fix MT8186/92/95 topology and idle state names
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 seiya.wang@mediatek.com, tinghan.shen@mediatek.com,
 allen-kh.cheng@mediatek.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230126103526.417039-1-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230126103526.417039-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_034241_446050_BBDDFE0E 
X-CRM114-Status: GOOD (  13.83  )
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



On 26/01/2023 11:35, AngeloGioacchino Del Regno wrote:
> MT8186, MT8192 and MT8195 use ARM DynamIQ, which combines big and
> LITTLE cores in one single cluster! A two cluster topology is simply
> wrong in this case.
> 
> While at it, after some research, I've also noticed that the names
> assigned to the idle states are misleading, so I went on changing
> them to reflect the actual function.
> 
> The names change commits, unlike the CPU map ones, didn't get any
> Fixes tag, as naming changes aren't fixing anything that would be
> meaningful for functionality (it's cosmetic, nothing else).
> 
> AngeloGioacchino Del Regno (6):
>    arm64: dts: mt8195: Fix CPU map for single-cluster SoC
>    arm64: dts: mt8192: Fix CPU map for single-cluster SoC
>    arm64: dts: mt8186: Fix CPU map for single-cluster SoC
>    arm64: dts: mt8195: Change idle states names to reflect actual
>      function
>    arm64: dts: mt8186: Change idle states names to reflect actual
>      function
>    arm64: dts: mt8192: Change idle states names to reflect actual
>      function
> 

Whole series applied, thanks!
Matthias

>   arch/arm64/boot/dts/mediatek/mt8186.dtsi | 30 ++++++++++----------
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 35 +++++++++++-------------
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 34 +++++++++++------------
>   3 files changed, 46 insertions(+), 53 deletions(-)
> 

