Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E8B2C77B73
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jun 2023 14:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jLJFbQYmxrTDG5LviuU11MzRe1assIVdj7KuflZnNpY=; b=t30htl5r73RP16Cf0u8Pns6q7h
	rPqQKmVrMOsiGhDax0j9tonhzkJuJcm9Q6APYiACNcSHQVStUFHcS1zurpCFQ8183RzTNPBLDoCL+
	E45A7trRQBOwSOY7KxFsoKM01OeB84Op1wVUGD+fHEAU23A5cNWfqsV04KVC5k6NsjXzEoZ+TgijD
	Kaz0fgb8rUTKBt/50g2cL0tPUXy+KFxECPajglo+BTILlfLGDLI9DPLtbLrwPlsTJhdPirzycuZht
	Vr/+RaxhoP7868uFwNBNr1ihtJfpeJwzzhX/KfyK650o3ch9hXDILnQ628DF0HXk7X1vl6xeYuANj
	+5BPhF7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6XWv-001zHx-1D;
	Tue, 06 Jun 2023 14:19:25 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6XWs-001zEk-19
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Jun 2023 14:19:23 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3f6dfc4dffaso53313925e9.0
        for <linux-mediatek@lists.infradead.org>; Tue, 06 Jun 2023 07:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1686061158; x=1688653158;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jLJFbQYmxrTDG5LviuU11MzRe1assIVdj7KuflZnNpY=;
        b=d8pNyDvcbPPK3+UQuLCrl1UfrOPi3S135bTZSRUrILBjQTiKVUcA1SiYN+5fnX4gBE
         qoxxa/gItEoI9UlBr956sauyXrVJ1ILJLjrId6VvZPKpLK/b9sPll9GWY70qjkgtcPr9
         fZMwzmyClilRGb2X8g4eYarNaODaDsgc/fsfZZ92DlwiwAkzUankwrSrNe9IY2Op6T3v
         JLVQ95QkqsGVjxF7Pt1DZWsCO/R+OVf415IvCr4Ze78BRObScUjwAhby4HTdycy8VQoH
         S660ICJva1urzKd4hpb9lBjxahzMw64pWuMFQD7uSQaL7EBXKTA01jvEUyzWHAnupqGp
         C9Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686061158; x=1688653158;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jLJFbQYmxrTDG5LviuU11MzRe1assIVdj7KuflZnNpY=;
        b=Zh2zkhA0LeO8liJwVzPcQUI3sQ83HLHKN696Sok+AEaYMfrIPgGYcO8ts8bozxhe0d
         slgIREBnlQskTdTmLcj3taWkxp4VI8kSRmH3/h+tXO61UBMGU3Zcmf/AhnG7xJ7qpkn5
         NtUURYp56tR1M8yjpuHLPCDbxcxvYzVy28V4ejIIjaVhTzkOvaLAzX2XRCfS8sLZ009V
         KDB40TkjBxj2Mg+rZzyUIhZURicBkFAUC+C/XVmXQU6DSOpLrkSwRtG9EOAyKFyrk/mK
         tQ/luT3uhswHvrkrXqgVrjmEYjt3shaL/bfI35oafcE2GTD77wqeW4KGZ2UQWWpQdTL8
         VZag==
X-Gm-Message-State: AC+VfDwtljSPsaqLPXyC2dmo+Pd9QcZSuP3eD7SssLJrlBJ7g55Lvqz8
	n6k5L3vWVfsRJbIvEYPHAbEO1g==
X-Google-Smtp-Source: ACHHUZ7tMz1e7peVOgjwE3ohW3F0yZCcAJE40qZ3YvbzRfKex+sTAxn9BgF5iKNHfpSa9OMAMW9GGw==
X-Received: by 2002:a7b:ce09:0:b0:3f7:b1dd:954b with SMTP id m9-20020a7bce09000000b003f7b1dd954bmr2207090wmc.31.1686061157879;
        Tue, 06 Jun 2023 07:19:17 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id n2-20020a05600c294200b003f727764b10sm13928677wmd.4.2023.06.06.07.19.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 07:19:17 -0700 (PDT)
Message-ID: <c8cde297-d713-cb18-eccc-18d6d486c5a1@baylibre.com>
Date: Tue, 6 Jun 2023 16:19:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v12 6/7] iommu/mediatek: mt8188: Add iova_region_larb_msk
Content-Language: en-US
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, mingyuan.ma@mediatek.com,
 yf.wang@mediatek.com, jianjiao.zeng@mediatek.com, chengci.xu@mediatek.com
References: <20230602090227.7264-1-yong.wu@mediatek.com>
 <20230602090227.7264-7-yong.wu@mediatek.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230602090227.7264-7-yong.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_071922_393265_61E4B59E 
X-CRM114-Status: UNSURE (   8.61  )
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

On 02/06/2023 11:02, Yong Wu wrote:
> Add iova_region_larb_msk for mt8188. We separate the 16GB iova regions
> by each device's larbid/portid.
> Refer to include/dt-bindings/memory/mediatek,mt8188-memory-port.h
> 
> As commented in the code, larb19(21) means it's larb19 while its SW index
> is 21.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre


