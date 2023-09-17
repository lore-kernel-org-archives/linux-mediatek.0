Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28544CD37B4
	for <linux-mediatek@archiver.kernel.org>; Sun, 17 Sep 2023 08:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=drDjgL0hgos/meU0CMqnv5ge6VNpucOKs27UgCJcW4o=; b=sjZS9JpV9yY9uvB9j+lfAG9I2L
	Z6XSBPZJr+jh3ZB45hKME1zwR+0f6hnxREfeRWJ/o47JxKwfW/O94mbGL+uxazaJoaRl9SURwFUmd
	E2BJ2C2q5mu0I0ijJ4PeG3HtMckxjSIkAYnylwuAegT4UMpkE2s3MBVdcTNO0xY/fk1o5uGnw9ua1
	dHExfDsLRIiJWqZ6padskCR6Ja01BVKiObARaJEKeao1weN532KhHRqlr6R5kI9fJCDdX2tABqCh5
	wioNDbHi4mdOfcAfsbHN9pjl750xkYQfwMwuP1RyXIAUeUcfZo1i9R5L3OHQZvGERydKh3VykVqAi
	RUyYY7Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhnBk-00DKGf-37;
	Sun, 17 Sep 2023 08:31:32 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhnBh-00DKFs-2C
	for linux-mediatek@lists.infradead.org;
	Sun, 17 Sep 2023 08:31:30 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-501bd6f7d11so5792504e87.1
        for <linux-mediatek@lists.infradead.org>; Sun, 17 Sep 2023 01:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694939487; x=1695544287; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=drDjgL0hgos/meU0CMqnv5ge6VNpucOKs27UgCJcW4o=;
        b=Dh6vW4uSRC68m3TUMrzYLrV+j47Lhnz1bYZp+cNifmqJUufXRddP2Fp+KcxmYfi0Dj
         MKDUr8yqnbZAE2NgtFIx7/I5ey6Xd/1iviqBXBx/RqQmHNYdzIkxjzvBdYRnJz1D7z9W
         lEgSb6dPKSFwAI/oLcNe8nFGvMLpLSl3Ty/QN7kTP9raA3TKoMb/ivtE10ERgy32y/Kl
         59wMh0SDqrEaYxe9SuLDwdPQy89V7ja4nHikVD8kCCpFD5BEatWNlMrZ36Q2TFxd8y2G
         DNMfm7dKS7X9UHGkFrvPym/OIX42K99GibjjJZGKherwRUXwoJUzA5maHYtZi+v/rmVb
         E+fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694939487; x=1695544287;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=drDjgL0hgos/meU0CMqnv5ge6VNpucOKs27UgCJcW4o=;
        b=MCKEcbldwJ5FOWKy1RoXHZLd2Kh74W+opqy3sKhtc0n2XlWQ+O6tBND88TPRBn2y+t
         g+iZuMgKnQAozouDvm9hu09gR6cgU63ZATQk+FZKQUfzLxq5cVzAAyGFZu7CGDdHYQPH
         vD6ObxwXgnlDJlZwwbIqSto+kGsGVSkb7ZLyXPIrANBfvsGzjNBg00oa7AhIsZ4IW80M
         CEFC6U3aLbg9TEwj1OH/qDH38iEFAxtPrXiQZnr81KcO0UFYM7tEOFzh5DRleQx7m0iO
         vYf6EL84+/3jbHJ7aUwRt7eKBWxleOEZJg7iY/SzGpFWF9RB2CBNhtPivxGJjDPvirkE
         B2gg==
X-Gm-Message-State: AOJu0YzPpswbG65EJSG/ngL9JEG+qPteaVwbagW/xp2iBdOb/DjBYKcg
	YSY3mxiO2o9DHdvSOKooia6ovg==
X-Google-Smtp-Source: AGHT+IHFmHHrwMXcnFf/9Ysu9VlD73MTmqu/TrOJBBdfu+3YjbX5GvgssgHy0T7TnBmG+oi1KuCbqw==
X-Received: by 2002:ac2:54a5:0:b0:4fd:d08c:fa3e with SMTP id w5-20020ac254a5000000b004fdd08cfa3emr4659614lfk.42.1694939487357;
        Sun, 17 Sep 2023 01:31:27 -0700 (PDT)
Received: from [192.168.1.77] (150-140-187-31.ftth.glasoperator.nl. [31.187.140.150])
        by smtp.gmail.com with ESMTPSA id i8-20020a0564020f0800b005309eb7544fsm2672737eda.45.2023.09.17.01.31.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Sep 2023 01:31:26 -0700 (PDT)
Message-ID: <3dbff750-c430-04a7-1c53-f2e327e54f2e@linaro.org>
Date: Sun, 17 Sep 2023 10:31:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2 0/3] mtk-socinfo driver implementation
Content-Language: en-US
To: William-tw Lin <william-tw.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Kevin Hilman <khilman@kernel.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20230915152607.18116-1-william-tw.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230915152607.18116-1-william-tw.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230917_013129_732160_E58C3E65 
X-CRM114-Status: GOOD (  10.16  )
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

On 15/09/2023 17:26, William-tw Lin wrote:
> This purpose of the patches is for soc-related information retrival.
> Such information includes manufacturer information, SoC name, SoC 
> segment name, and SoC marketing name.
> 
> Based on tag: next-20230915, linux-next/master
> 
> Changes in v2:
> - Remove mtk-socinfo.h
> - Consolidate different compatibles into mediatek,socinfo
> - Move socinfo node out of MMIO bus
> - Move mtk-socinfo.yaml to hwinfo
> - Fix reviewer's comments

This is way to vague, especially that you did not fix them. You need to
list all of them. Then we will nicely see what you ignored.


Best regards,
Krzysztof


