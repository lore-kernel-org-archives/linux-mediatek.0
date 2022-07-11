Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08868C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jul 2022 23:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NbY/7Z18T3rfQ5ngeaYSTuxGg4aJvX0MObLvYqlXd7s=; b=ehWRRrByxAeHbUucOeUehWrMum
	1Z1p/cCkb5kYfq8hmncyeGNwkMYEfrD1vHU4z5gj3CfoPvdQpupG4iVFWG+vMbasVJ3GRi6l25m+8
	H/ySKmfqLIzS/5s5fcjBT6K68F/XoXS1F6IEqITfwopVhOFUTdDCUnCIgWEl3EHkwDoTJgbgpV34H
	V/zUqaa5EyzSevoNE+sNcVFZ1BiCp6/hkJGVIqa0xONtw+9mfA5NWbzfQdDMo63KEA0fy8NsRPvTj
	sQ7RxfVa6NqohXYIXFcuin7GBM9US18o8UvQzoMhQsmM7U16e+g1gGLBHvWRU/yBK98Ch+kk7+2dl
	rYdZy00A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oB2S6-005TQE-B0; Mon, 11 Jul 2022 23:04:30 +0000
Received: from mail-il1-f182.google.com ([209.85.166.182])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oB2Ru-005TJG-BV; Mon, 11 Jul 2022 23:04:19 +0000
Received: by mail-il1-f182.google.com with SMTP id m14so3888414iln.10;
        Mon, 11 Jul 2022 16:04:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NbY/7Z18T3rfQ5ngeaYSTuxGg4aJvX0MObLvYqlXd7s=;
        b=iJ1gycrI08AeyNCJDgrhID3h8kdCz0zkQZ/DJok/RK/HzbOTZxtof9zkwTukmt1nNS
         pAUwQMuCrDv8FZBY1dRh9/QqAmJaRaziCR8RKwX12yWD/XJ1bXPutoO0t+t24AL5NYg5
         NKlRy5lHiLVgFk8F1qB0uQc9/26lmYs9vg82rpSD3DNyuo6PQ2ZgnF20xA7eqL8/IzOW
         Xk9rRa+VS8CZqfbgKkpOwg67QyAVIv8GszFB/MCDdvypnPtCYwZ7EP+88mO9rQeMsuGV
         nnkptDu5W5tEhhXYy6Y+ECQfQplCigA8o3BldWZ8uU8/wkWU7Oe0EnFOAMtO1LlDorZy
         LLtA==
X-Gm-Message-State: AJIora83gk/9qnW4eQbdq9rGWOUCIak9O26ntpv5DywbBCeHE5MxYkZz
	VqW6elMgbFSdQf8mEmYMFA==
X-Google-Smtp-Source: AGRyM1uMoeWR7PzsRDrBvUEqy0bblpLHVg5sWj7o26/ynW/mXtmz0uMxRbw9bbdMhZS09TsefyKoDQ==
X-Received: by 2002:a92:cc05:0:b0:2dc:51f5:f6cd with SMTP id s5-20020a92cc05000000b002dc51f5f6cdmr11108584ilp.175.1657580654473;
        Mon, 11 Jul 2022 16:04:14 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id l9-20020a92d8c9000000b002dc100ab6fdsm3166725ilo.35.2022.07.11.16.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 16:04:14 -0700 (PDT)
Received: (nullmailer pid 434848 invoked by uid 1000);
	Mon, 11 Jul 2022 23:04:12 -0000
Date: Mon, 11 Jul 2022 17:04:12 -0600
From: Rob Herring <robh@kernel.org>
To: Johnson Wang <johnson.wang@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, ulf.hansson@linaro.org, krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-mmc@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2] dt-bindings: mmc: Add compatible for MediaTek MT8188
Message-ID: <20220711230412.GA434794-robh@kernel.org>
References: <20220708114747.13878-1-johnson.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220708114747.13878-1-johnson.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_160418_414187_CF3C0597 
X-CRM114-Status: GOOD (  10.22  )
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

On Fri, 08 Jul 2022 19:47:47 +0800, Johnson Wang wrote:
> This commit adds dt-binding documentation of mmc for MediaTek MT8188 SoC
> platform.
> 
> Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

