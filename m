Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC0CCC77B61
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Apr 2023 12:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JKDpCHN/kgo2iQp2g4qhoxMVcmKDMoJPQnBxMP1+5vM=; b=fEMC+tWYwXuK2KZw+cCo7k/hYO
	wUAjqjRw/jCi+Y9P4bRq5Qiy+/d0S3cRADLN5v4GjqGZFSeFJTviIVgWGiJ5tzsKgXGb7elrqbHE/
	uMbEMvOkIA5ZYRQeXbSfyh9YoF2cym1fzjgDou9yp0zDSnW7/+eEsG1R2Ajvg0c1BzdoyS6T9UPEH
	GtQJPX+g8D18mGzXDYmHw8aED8+LuJSJ623BkVoVTb8/K8WqrRnAlOKQXPEzluJEBofSZ8rtqLO7i
	lGG3WjZLNGMgpLqCH5eg/14uNGlwjps/rdnVmO+gLjSShaHtooAUsUo6Xd5WuoC4nh2BCdl0LzreY
	thQgHXNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmwUP-006BqE-1h;
	Thu, 13 Apr 2023 12:55:49 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmwUM-006BoK-2C
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Apr 2023 12:55:48 +0000
Received: by mail-ej1-x62f.google.com with SMTP id qb20so36754508ejc.6
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Apr 2023 05:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681390544; x=1683982544;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JKDpCHN/kgo2iQp2g4qhoxMVcmKDMoJPQnBxMP1+5vM=;
        b=Ke1Rh1M2Q+Qi9I+j1GbmlcgZ1DefGCk8QFxo1zlZ8zmeiI75OWilUELEnZ/d7wbbMp
         jPsXSaAB+VuZRFKLQUU/EQy9b3pQjg3E6Kjk9rsI+t4w21KI+EwKS3tmKC/MyBDY96+9
         xU1/n5RCVLcl0emlCFV0JEp7WL89LABLevv9X7Xa//OWGwD2cgsbUI5YhBNkAO330c+O
         2tKEtEo2J5oiyUc0iPriiKjjsV7ymH4rtXUye5k8WYrTsN0qJp3DU+mGAgXib2F/BUft
         qiHKtjY5V8nM8ix0m8pzNbpAg7xpvrvJurIq4crceDF1kv+GXlXzlrid51b8u7lmJ8pS
         DVPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681390544; x=1683982544;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JKDpCHN/kgo2iQp2g4qhoxMVcmKDMoJPQnBxMP1+5vM=;
        b=eicJtFD2P+l55DfxdvUGbZgYysM/7IIuhi30Y+qEAGjFJCdQBB7bkdioR+Q0/gOF+j
         8ReobcWgkqrY1BoBlj/41jU9ZvLFlXvecAB3KN0PSs4muXY69uLW6+/v7caM9szXMfHg
         5r8hRHMt7JzRGoYqKBHUl7dtgrx0euT3H0whLOF8ja8aalPUA1E1nak7kug2EjhdKHh9
         1wXBlzRBnCn1oj96qsBduTJe5nD1KB8IkDJeu4IMuQ+SqJm/aNSXfGsRfXTvdJaALkU6
         ciTM3BP0UGwLQTb7AdWnOfYmwx5J7e0Q6M7eNXtNg53bHEQ8qjYWdd33yHiWhrRCLF9G
         iE0Q==
X-Gm-Message-State: AAQBX9dinBtf83iZPmmNUYu7o6WSNZldf3y9LI+ZkVmIYUc7YmwX6ZYs
	5SbX3/K5r8JC4XiqdiXLSFf8Ag==
X-Google-Smtp-Source: AKy350Z0+dflVnjZ0jpKTbNMgeagHtwdUE6J25Gnvam5A3Tg8zMrKQnUkwAZug3p4UoCkhg/vaTq9w==
X-Received: by 2002:a17:907:8b06:b0:93f:2256:fc05 with SMTP id sz6-20020a1709078b0600b0093f2256fc05mr2615430ejc.55.1681390544511;
        Thu, 13 Apr 2023 05:55:44 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5032:d2d4:ece5:b035? ([2a02:810d:15c0:828:5032:d2d4:ece5:b035])
        by smtp.gmail.com with ESMTPSA id jw18-20020a17090776b200b0094a8b47d360sm958812ejc.177.2023.04.13.05.55.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Apr 2023 05:55:44 -0700 (PDT)
Message-ID: <1aa701cc-92ca-71be-0663-df4bfae66c2f@linaro.org>
Date: Thu, 13 Apr 2023 14:55:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v1 3/6] soc: mediatek: virt: geniezone: Introduce
 GenieZone hypervisor support
Content-Language: en-US
To: Yi-De Wu <yi-de.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yingshiuan Pan <yingshiuan.pan@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Jades Shih <jades.shih@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, Ivan Tseng <ivan.tseng@mediatek.com>,
 My Chuang <my.chuang@mediatek.com>, Shawn Hsiao <shawn.hsiao@mediatek.com>,
 PeiLun Suei <peilun.suei@mediatek.com>, Ze-Yu Wang
 <ze-yu.wang@mediatek.com>, Liju Chen <liju-clr.chen@mediatek.com>
References: <20230413090735.4182-1-yi-de.wu@mediatek.com>
 <20230413090735.4182-4-yi-de.wu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230413090735.4182-4-yi-de.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_055546_727795_98F50097 
X-CRM114-Status: GOOD (  11.22  )
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

On 13/04/2023 11:07, Yi-De Wu wrote:
> From: "Yingshiuan Pan" <yingshiuan.pan@mediatek.com>
> 
> GenieZone is MediaTek proprietary hypervisor solution, and it is running
> in EL2 stand alone as a type-I hypervisor. This patch exports a set of
> ioctl interfaces for userspace VMM (e.g., crosvm) to operate guest VMs
> lifecycle (creation, running, and destroy) on GenieZone.
> 
> Signed-off-by: Yingshiuan Pan <yingshiuan.pan@mediatek.com>
> Signed-off-by: Yi-De Wu <yi-de.wu@mediatek.com>
> ---
>  arch/arm64/include/uapi/asm/gzvm_arch.h       |  79 ++++
>  drivers/soc/mediatek/Kconfig                  |   2 +
>  drivers/soc/mediatek/Makefile                 |   1 +
>  drivers/soc/mediatek/virt/geniezone/Kconfig   |  17 +

Hypervisor drivers do not go to soc. Stop shoving there everything from
your downstream. Find appropriate directory, e.g. maybe drivers/virt.
See:
https://lore.kernel.org/all/20230304010632.2127470-1-quic_eberman@quicinc.com/

You should follow that discussion as well and be sure that all concerns
raised for Gunyah are solved also here.

Best regards,
Krzysztof


