Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC7FC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 13:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SHM+FXMgqVVpjzeeMU/xsYxz6DnODSDCRBJnsjuEKUA=; b=NoNCUwjHo04F1v
	0urgmXQMhNFxuOyXTCjGF1Qyr3jxmKNpkjHpmSUwQS5gJqG4qbbrH3DJuxgokzSa9J8OZTh4Np54k
	MQp72hVqTDVZIcD0rZ08dDs3hS3oP51yJeCUyPXEIw/vOXLo/crI/1JttsA9fSVoWlB3WSJZtlDw3
	JSaO1HeojRqnhRn487lF94MdUbVT66gCCd0Sjl//1uGQvro5S38aOW+4ZQU1wz0BygHLays8SF5Ul
	WUz3507IOuQIZlIvGlGOQlbskFm5jWkUsNCYatXzND9LBCL4g5sq0PYfSQ3EBfrDzk+uDSHZ3k6Ld
	z6tXM44bYDdcpz9EUTbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqxXy-00E39a-LT; Tue, 17 May 2022 13:47:34 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqxQg-00DzMO-1r; Tue, 17 May 2022 13:40:03 +0000
Received: by mail-wr1-x42e.google.com with SMTP id r30so7106701wra.13;
 Tue, 17 May 2022 06:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=DsBS2/0Li2RTw7178mLULg48Zs19XBetfneW5cg8piM=;
 b=JzTtfBTPN6klmcyWZvGAuDo41K7gC3NRB/ZnLbSQve78vTlIPseVgWEwQcbngEAnsm
 Ev9YEst0Skd9z8uUrnTWNhZry7G9ms9XoMIx54ZkTxjSge7JYwYf2rspETUsoRlw5n8+
 mRJnGORLr27OoArd3j3oE3EBFZZhCsAOvsGtL71RJOnnSweBs3QiHQxEjiKIqtAxkEFb
 ybUIJEerOjiltVv7mrnm7UTqneqDuZUFOnXnaB1Uvg+wxEd7H87R3s434KY7eVQSE/4X
 VTsJvAJnaxRgu7VoMnFkjaKLPeu1dwItjJwdThTLn0S37zO/owu/gxr5Uz6iaOCJi5bA
 ibTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DsBS2/0Li2RTw7178mLULg48Zs19XBetfneW5cg8piM=;
 b=D5byxJHhlDtXgmFOcbvOnCFkl9N38r5M/2TDKW2z+0b0TPgNWb26Lx4WUYh6wK5jWz
 HcH6VmTrM0Z4mLsGrByp6SGlftdPitlCr+KplRGzJLXDcc/GcYTOllo/Guq6AmZZf+cE
 S85+sP0D+ndBu1ohXRRCVHqBSvZigiSO3jbDl/iY1euOKnJcoZfruL9nh1m4K7JtHFV2
 U1Q1uMHdsra3vrcp6RxSm4tdf0tp1cSqNNWAOj5zwPN4z0sjzuvbCPzhsVbb8JehPEgy
 YtsygtRk5lsFaMkpuygcH7tqoco6vOmAS/9wpPxxg6nUGQY9JZgdPVdFuqcFELRtthYA
 DGxA==
X-Gm-Message-State: AOAM531nZHr/uhMrfNslJWSpqgbmlLfLegqcupltnB+ZJu+yxhzHtAnf
 yyXk5fnV327mHpq0cE8hngQ=
X-Google-Smtp-Source: ABdhPJxWrjm2QUO2A8gYNnTZ7koN2aGc20TGB2/o9TVputiWZLQC99N41GyCU4zmF5peUzLsT4aYdw==
X-Received: by 2002:a5d:4649:0:b0:20a:e17e:56de with SMTP id
 j9-20020a5d4649000000b0020ae17e56demr18783120wrs.450.1652794798225; 
 Tue, 17 May 2022 06:39:58 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 d7-20020adfc807000000b0020c5253d8e4sm12056061wrh.48.2022.05.17.06.39.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 06:39:57 -0700 (PDT)
Message-ID: <21581440-a65c-ee8c-95e4-0e179c2838dd@gmail.com>
Date: Tue, 17 May 2022 15:39:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 0/6] dt-bindings: arm: MediaTek: Fix clock bindings
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, sboyd@kernel.org,
 chun-jie.chen@mediatek.com, rex-bc.chen@mediatek.com, wenst@chromium.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220517101514.21639-1-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220517101514.21639-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_064002_208035_7C5512FA 
X-CRM114-Status: GOOD (  13.51  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 17/05/2022 12:15, AngeloGioacchino Del Regno wrote:
> As per Rob Herring's review [1] on my mt6795 clocks bindings patches, for
> which I've used the already upstreamed ones as a base, it was found that
> these bindings have some issues.
> This series is addressing the issues that were found by Rob on my series,
> which are present on all of the already merged bindings.
> 
> [1]: https://patchwork.kernel.org/project/linux-mediatek/patch/20220513165050.500831-5-angelogioacchino.delregno@collabora.com/#24859953

I would say we could squash patches here and make it 3 instead of 6.
In any case for the whole series:

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> 
> AngeloGioacchino Del Regno (6):
>    dt-bindings: arm: mt8186-clock: Remove unnecessary 'items' and fix
>      formatting
>    dt-bindings: arm: mt8186: Set #clock-cells as required property
>    dt-bindings: arm: mt8195-clock: Remove unnecessary 'items' and fix
>      formatting
>    dt-bindings: arm: mt8195: Set #clock-cells as required property
>    dt-bindings: arm: mt8192-clock: Remove unnecessary 'items'
>    dt-bindings: arm: mt8192: Set #clock-cells as required property
> 
>   .../arm/mediatek/mediatek,mt8186-clock.yaml   | 29 ++++-----
>   .../mediatek/mediatek,mt8186-sys-clock.yaml   |  1 +
>   .../arm/mediatek/mediatek,mt8192-clock.yaml   | 46 +++++++--------
>   .../mediatek/mediatek,mt8192-sys-clock.yaml   |  1 +
>   .../arm/mediatek/mediatek,mt8195-clock.yaml   | 59 ++++++++++---------
>   .../mediatek/mediatek,mt8195-sys-clock.yaml   |  1 +
>   6 files changed, 71 insertions(+), 66 deletions(-)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
