Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C87C43334
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jul 2022 14:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oBjTfdSvT6+YtSeTRdHKnKoOw+XuKEMSvxYcA1ivcKQ=; b=3/XBf8ps0ZeUc6lJUlxnIL+dZH
	o4pMoSXlNGQeQKYBFfRtIY21hi6UJes6/SXhLbnMvHS8R/ekfZnLbRhYlfDFWPm0j93HWyluXULp7
	NhPJbwxfgZD7J2TVap8tzQHkpvw+pFPYgiNoJTKvlGrEwMrQlFaQSrK9GT81reSfNWUUwJlLHPmvk
	LHNXIHEweQYoxQi+eZ9cqsbzE9LfEi6hWnYH25rLIojJFB+FVhwFou27cJfRBoJkYfzY8ihwddFpN
	2NGuyGXYU6JI8w6TnTMeGGvBGbdLYeVK4pLzQRGCqDAM4b+OfVxNGBrLMF32MdUhfzd5iR2eOSYMx
	FerOC9Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o95qY-00Aa9h-QU; Wed, 06 Jul 2022 14:17:42 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o95qN-00AZyS-07; Wed, 06 Jul 2022 14:17:32 +0000
Received: by mail-wr1-x42d.google.com with SMTP id cl1so22302791wrb.4;
        Wed, 06 Jul 2022 07:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=oBjTfdSvT6+YtSeTRdHKnKoOw+XuKEMSvxYcA1ivcKQ=;
        b=ScNTSzTZ43bEjkZfE92oTcQAP6gXZbZLcCw7IIVhNgSGDkhW8Sik3t4w/nHqscG+FM
         7H8zQnOXlPsQ7lFH/yIccetqoYONxKapCHHn16FOOOJ0Ll6v1muH0WtOSEse6oxl4rR/
         SIi57+De/Zzyg5wcXUk/zJCruld/3z6qNsog3EQJxTtm9N6JZoTClLIIgQHZz9EKKtLU
         4UVXKXIFiwWrxYi+z3IFgb6Njvhx3WfXEWEdu9wveYxl2YX6ucrSn090gKWim4fnedki
         WrJyZMB1rJeJ5B61+2pZA97RszQ2JnMU7fhWx2PtcmNHpGKmqnyLYPuc3+Bsgc2eOvWl
         vEVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=oBjTfdSvT6+YtSeTRdHKnKoOw+XuKEMSvxYcA1ivcKQ=;
        b=imlZTkjAmE76NaL6N1tdtLZuqBmctgTd9PC1rGyiTDz2djBbzfLnDqteJIeeeMgj6V
         Q1Bwabo7pGB+VsLEsXdQ11ulsAer1pKxTtMrL6HdXoDPGVguUsCPheb0rq9kECoOGNSG
         oL+//FiiDTc6LM5Qi2jiMbVTWx61H8QBToBY/Zhql4RX4zxump0XG4PgLPLtHgshyjAj
         QE3qLAtXlaEX1Hv3TuIIIJK3u8u7juWcLmRTkuL0/6X1S2TrfvT9dNi99fApOKSk2Hgo
         MCWjOo9q2j/YpE3iI/lB3+NJhKvy94HqLDoBKAW/mnWlMoeUKZfGeI8CGhDe0V3goVgi
         A+Ag==
X-Gm-Message-State: AJIora9bfFUn3+cs45lMj38UdzJpigdpJDyDigXLJ9Uj2iusKDgLZakS
	cTkG1hCswCtXKwJmNhL2jEo=
X-Google-Smtp-Source: AGRyM1tVJy2MpNcYGjr+fAf+4MEWqrwAuT7nsZz4knx9ascE2+u/ba0RqCbDeLBIC0OuklmJHVMfrw==
X-Received: by 2002:a5d:6504:0:b0:21d:7376:6411 with SMTP id x4-20020a5d6504000000b0021d73766411mr8697884wru.512.1657117048804;
        Wed, 06 Jul 2022 07:17:28 -0700 (PDT)
Received: from [192.168.0.14] ([37.223.147.254])
        by smtp.gmail.com with ESMTPSA id h4-20020a5d4304000000b0021b829d111csm36607497wrq.112.2022.07.06.07.17.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 07:17:27 -0700 (PDT)
Message-ID: <8b70f376-5f83-a713-c5de-ed5bba68c937@gmail.com>
Date: Wed, 6 Jul 2022 16:17:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/2] Add mt8186 mutex support for mdp3
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220705122627.2273-1-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220705122627.2273-1-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_071731_112142_0951CCED 
X-CRM114-Status: GOOD (  11.07  )
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



On 05/07/2022 14:26, Allen-KH Cheng wrote:
> This series are based on matthias.bgg/linux.git, for-next and provide
> mt8186 mutex support for Media Data Path 3 (MDP3).
> 
> Allen-KH Cheng (2):
>    dt-bindings: soc: mediatek: add mdp3 mutex support for mt8186
>    soc: mediatek: mutex: add mt8186 mutex mod settings for mdp3

Whole series applied to v5.19-next/soc

Thanks

> 
>   .../bindings/soc/mediatek/mediatek,mutex.yaml |  1 +
>   drivers/soc/mediatek/mtk-mutex.c              | 23 +++++++++++++++++++
>   include/linux/soc/mediatek/mtk-mutex.h        |  2 ++
>   3 files changed, 26 insertions(+)
> 

