Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C02ECAAD1
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Aug 2022 19:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xEkvTPxCYEtbgyuc7AbrC31XxwpwG8/Jsc4DJQ0nSZc=; b=EEbSn5xDKSqxh3RZFugbRD8BCX
	XpuhZYwGRs4KuX1mHiITp8Tv080Opn+oFzztZXZWNE3S859+geyGSHz0DrEei8Xwu5iyD+r4rcK2g
	4DDpfgYlCixf113DTTd+B6N4jAjyfPzKuQYyae3t1FbglEXjj6nHwiZ/SDD15vrma2dTfCBtiYxqF
	WY63MaW8yhlVF8X9V8XYk0bWpv0oYv2xk4r2pmkuc+ypZZc1kdLLl+P68OxHvz0lBz1zBnDBCcBXt
	ZjzNeUqiRZpcosy5Vf55MQReApFAIUeoGOdTZMh/bZSPBjVUrv9fS3Ak1gC7jNJ+02lavYhzzHIJK
	N1zJU9Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTTOd-007st3-5d; Wed, 31 Aug 2022 19:29:07 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTTOS-007sjf-6l; Wed, 31 Aug 2022 19:28:57 +0000
Received: by mail-wm1-x333.google.com with SMTP id z14-20020a7bc7ce000000b003a5db0388a8so2242858wmk.1;
        Wed, 31 Aug 2022 12:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=xEkvTPxCYEtbgyuc7AbrC31XxwpwG8/Jsc4DJQ0nSZc=;
        b=l+SYHrC0WOx05Lw+vAl31uevKBK60EfzJn925WLGi1a9q6NUzLy5TZJfJGCnY8iR2M
         GZ7kf128ka27jrSwY1C+G2Hvia5CWcprJ2giqVxC3V2+Tio6nDSxKw+6zB5VCF5QPpML
         h2GckzEO+aGEWQHHqrai4cod9XE/PRBdt+HGMDjgcRv4XnHyjAGSVErhV0L75kiuOTx/
         mehc+Wv//EQEdW+LZEOdPFlasR3Raxygvx3+e3ei4DCNNluMFWGjSViEgYKX4XtGmnJa
         OH9+mfBe3lNoP5FBOvOM4c2O1deTFaI5vW8F7uYbNGg4tMyYvJSh0CJvsMZfBEB+aUpU
         T/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=xEkvTPxCYEtbgyuc7AbrC31XxwpwG8/Jsc4DJQ0nSZc=;
        b=JD7pSC8YTxSfw2rspuhFXtEY+iJQYf8tenXaSstK86MfFDM2wWnC+gsQnRwXLoebKZ
         4ZNdtyG06jpwGlm7V9cvgMES8Nvdi/VVBm05kvR/3Kq54NDmls+d2HI+CtPFHDhwbu82
         W8N34wlLvWp/gEiHnwwnnqE3rkiwrzDE6LFxB+EMU4T7D9k8bh6bpHg1Puf/tdp2xXFh
         jgB32RVWMI1xCS0LepgYC4tn1kxvbnN/rBo+phWyAgBhYnh1Uj0KH1hY3o72/sOFJScr
         f2n0w9p2D9DaEuaOAz/Clg32K08XDMfhuCFZpxYpk8kmdEHnRdqXpfF0TJmavQRVz/dv
         1BRQ==
X-Gm-Message-State: ACgBeo3m24fvBsuiaartmuPIuxd6qraLajt2yCqGZcmyss+F8t/dpWZ5
	PuZ9kY/cwSKgI6fEwFjS+dE=
X-Google-Smtp-Source: AA6agR57+4W6XctCTACADhF7v56bAvACdqKSkgF5zPBGOHbQHeodwXcH0QJKrJxOT94Yf1jS+D2Obw==
X-Received: by 2002:a1c:7916:0:b0:3a6:3540:5b3c with SMTP id l22-20020a1c7916000000b003a635405b3cmr2855528wme.178.1661974128760;
        Wed, 31 Aug 2022 12:28:48 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id f6-20020a7bc8c6000000b003a35ec4bf4fsm2928680wml.20.2022.08.31.12.28.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Aug 2022 12:28:47 -0700 (PDT)
Message-ID: <afb33bb9-206e-fe7c-7c6e-b42d87e79dc2@gmail.com>
Date: Wed, 31 Aug 2022 21:28:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v3 0/2] Add mt8186 mutex support for mdp3
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220831172151.10215-1-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220831172151.10215-1-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_122856_315673_66280DDB 
X-CRM114-Status: GOOD (  13.22  )
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

Series applied, thanks!

On 31/08/2022 19:21, Allen-KH Cheng wrote:
> This series are based on matthias.bgg/linux.git, for-next and provide
> mt8186 mutex support for Media Data Path 3 (MDP3).
> 
> As discussed, we add data field (mt8186_mdp_mutex_driver_data) for
> mt8186 mdp3 mutex support instead of adding mutex_table_mod into mt8186
> disp mutex data.
> 
> changes since v2:
>   - rebase to matthias.bgg/linux.git
>   - add C-d-b, R-b and A-b tags
> 
> changes since v1:
>   - add mt8186_mdp_mutex_table_mod
>   - add mt8186_mdp_mutex_driver_data for mt8186-mdp3-mutex
> 
> Allen-KH Cheng (2):
>    dt-bindings: soc: mediatek: Add mdp3 mutex support for mt8186
>    soc: mediatek: mutex: Add mt8186 mutex mod settings for mdp3
> 
>   .../bindings/soc/mediatek/mediatek,mutex.yaml |  1 +
>   drivers/soc/mediatek/mtk-mutex.c              | 28 +++++++++++++++++++
>   include/linux/soc/mediatek/mtk-mutex.h        |  2 ++
>   3 files changed, 31 insertions(+)
> 

