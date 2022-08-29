Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E056FECAAD2
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Aug 2022 14:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=145gOx86toxQClz74kJe2cl51jbo56v2bZWCBfLvedQ=; b=MnPDvJRO83eA7jRXWdT8yIZ4Ob
	7LacmK8K0u2TKuLA2LsZDcE1gMKmZjttXx/I56Cfc7umhMiGwLncbXDGewcHmUk+6vWFFqJ3R5NTI
	eNKT9azOf6f2ltPCaRMy8cLjGlc+vLhbEm/dxig5qTBsIZEwuB8BITzBEquyzZOu0aagvxHVtahVW
	C6UzFGaoOI+1Waoz/slU5P2sMUGo67NC2YjbtL+9z350rmJpF1422k3e5aG54K1OHRs0eIdoHdFLG
	RCufOqS2Nu2Xc0bagS34PLstxIBdioboco8JmO2pQfA1vvY5/jocaWR/6/DM576C2BGXAxlNmhx3u
	fmZb89Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSg6X-00BBXc-N0; Mon, 29 Aug 2022 14:51:09 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSg6K-00BBSH-9F; Mon, 29 Aug 2022 14:50:57 +0000
Received: by mail-wr1-x429.google.com with SMTP id bs25so10523958wrb.2;
        Mon, 29 Aug 2022 07:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=145gOx86toxQClz74kJe2cl51jbo56v2bZWCBfLvedQ=;
        b=B5he0l1NJFsAgePzHNhCVPDO2fy1g3NhcfJGseemre59ndFS6y61LR6DcTjGcrgmdo
         ECBwnGuLuzwBTtq3IZ28HPY4s0dTrIk21F8ZYQPsHabpRhzbPhdKtUwSsMXgXbN6JYUv
         ScNzIlKtaVKsItAVP04255Lx3W8Zqqc58MywaWSYNRv0pcOMiEONyRwE0pRBsXU7q2YC
         jKg+hri79GrV8N2uQFutbuhUy4HhCJZq4UcrVWlLHalo6slkhKTNE6Hovk+AkjMvQaa8
         5zLQhWcvLOMSf9HMOdpdQEaOrhQmOLYYvFWcETi/eogaptjlhmkWQflMW96IbPUDKTnV
         F36Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=145gOx86toxQClz74kJe2cl51jbo56v2bZWCBfLvedQ=;
        b=u2fmSgdd8agYORJsGmSe4GykkvufGdVz/ppyhyxqypsdaItTBH/qe5bKswXWO7DRaH
         WgnySM6sYK7ncPKh59iY3CekT3Am1IHoaCxxyLesA6jNkaJlx63BklJhAidsfArHP8g/
         /3xdoqjdso9c1Ophmz6hCDQqIvbb5MQGvZ7/Kucq4BhXY2f8j+wOQSzylygTIGPftzCE
         1fuQskGUtVqt+p/FLKkY+yq7aYZnBiRvA8ekVxBQ3mJy9PfjPAlqKV1sl7O0sggTRZCX
         Ln55fvYRWxhsQ4dyz18HxfpwVy+wlUJgcdSp6tdCgmWwHInMkCMObUEnIqJwYNtBG7El
         MLzQ==
X-Gm-Message-State: ACgBeo0qqg85HEiQQCHz1h1f7VN5hXPTLEcBUoSRWSg5iWrGFo6ySIiw
	zEtRU2b1uhguN029tsjP3g4=
X-Google-Smtp-Source: AA6agR72nddPfdDk/RdTmQ8R/2eOxuvH8F7fe3aQN3rrRmg8l2imUWwdU7Z5hPjZ73Uy8vf5OGQdBQ==
X-Received: by 2002:a05:6000:1863:b0:225:8a83:fbea with SMTP id d3-20020a056000186300b002258a83fbeamr6698535wri.277.1661784654126;
        Mon, 29 Aug 2022 07:50:54 -0700 (PDT)
Received: from [192.168.0.30] ([47.62.125.55])
        by smtp.gmail.com with ESMTPSA id b2-20020adff902000000b00226dfac0149sm1036095wrr.114.2022.08.29.07.50.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Aug 2022 07:50:53 -0700 (PDT)
Message-ID: <cd178f8c-76f0-4494-71c4-a658ee517b70@gmail.com>
Date: Mon, 29 Aug 2022 16:50:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v3 0/5] Complete driver nodes for MT8192 SoC
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>
References: <20220712114046.15574-1-allen-kh.cheng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220712114046.15574-1-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_075056_385143_0D5E376B 
X-CRM114-Status: GOOD (  14.71  )
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

Whole series applied.
Thanks!

On 12/07/2022 13:40, Allen-KH Cheng wrote:
> This series are based on matthias.bgg/linux.git, for-next.
> 
> I remove vcodec lat and core nodes PATCH from series and will comfirm
> clocks usage then resend PATCH.
> 
> Also should reference below PATCH for dsi in chunkuang.hu/linux.git
> dt-bindings: display: mediatek: dsi: Convert dsi_dtbinding to .yaml
> 
> changes since v2:
>   - add mmsys #reset-cells PATCH
>   - add missing fallback compatible
>   - add display aliases
>   - remove vcodec lat and core nodes PATCH
> 
> changes since v1:
>   - add Reviewed-by Tag
>   - rename dsi-phy from dsi-dphy
>   - add missing power-domains in disp mutex
>   - Add remove mt8192 display rdma compatible PATCH in series
>   - use "mediatek,mt8183-disp-rdma" as fallback
>   - remove mediatek,larb from rdma node
>   - remove syscon-dsi and add power-domains in dsi
>   - add reset property in dsi and mt8192-resets.h
>   - correct Typo: s/ndoe/node in commit message
> 
> Allen-KH Cheng (5):
>    arm64: dts: mt8192: Add pwm node
>    arm64: dts: mt8192: Add mipi_tx node
>    arm64: dts: mediatek: Add mmsys #reset-cells property for mt8192
>    arm64: dts: mt8192: Add display nodes
>    arm64: dts: mt8192: Add dsi node
> 
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 188 +++++++++++++++++++++++
>   1 file changed, 188 insertions(+)
> 

