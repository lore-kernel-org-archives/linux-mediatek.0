Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF8A1C4828F
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Feb 2024 07:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pdG3hSNGGNzr2pOTIyIMpLiclcO5pq5s1cnkvilc9io=; b=uGHjWRaKo3bqVZles2m236WbwU
	8I9MGktk+siUGWdjPRaOqP43U0T1CK1VEzkDm0+FtnXA2+dxgSOsVqkA5/Dz9yUGo4vtfF4XFHoKF
	IKow+N7KNYLloVf74EeCYMwJ9ewPBwrswBSyK/is/UlyFQX2e8iKM8EGsET+pQRb6v2DayMsGE2nO
	lgK8GTZh3LUTX56tEFiKeouuJzEeHj99GOx/1LHzBJF7ph3YxDEZuGfqr1y/FRWP3y2MoqbQjc/Rs
	trDAww2DSoWgjn/MgY//gWbbDXqJJCf1E0E4xJsWJrlJn1SU+8tf5Sy7hykDXYTV2gt+9SObDObLu
	Lhssfvjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYLG0-0000000GKX3-0PoE;
	Fri, 09 Feb 2024 07:25:08 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYLFs-0000000GKT2-2RMN;
	Fri, 09 Feb 2024 07:25:05 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-511531f03f6so688679e87.0;
        Thu, 08 Feb 2024 23:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707463498; x=1708068298; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pdG3hSNGGNzr2pOTIyIMpLiclcO5pq5s1cnkvilc9io=;
        b=T9iTWDCCcY7WF9RPHiQhNpPVg6XuN5o00PYrVZ2xfuEqmhcjuFHMaJg+bNZKN7tsWt
         2d9cBfg14Er8K6rEBzNppl1H+aX4fZjY6DKsJWRXJ9QH+jFNHMinDqAGYnCVS41l55Zp
         rk1r2NmW+t0s9qWS6wdOiFjX14OQU62nICrnzbJ0wDq+L55foiIdAoe1viKwVeAQmIp8
         o2eGUPfGkih9MbosLkbeNxh4lnW7qGvPd9/dJw9Of8YS/CtG5P2LOAx2aS6v4ndDJPa9
         XW5nYcnt+Ltgs5p5DspqKglLwpVUx6fclEZaW6gakNnez+aLU6+doFvwyM94zr453nc+
         D0ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707463498; x=1708068298;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pdG3hSNGGNzr2pOTIyIMpLiclcO5pq5s1cnkvilc9io=;
        b=avL9DqgLvlwUFriffHPmnEceFwH/5cNqyAP/fSo3TyDcBdyYu8rc+0fdwFUTt1a8fx
         i8oiJ8qcVNkWbjHKv3OuJ3swtFUnGRpQcwyXGb3dL6trWTPcQlT8WCE064eVelZB6JZ2
         k+3Z3Nm+qjyz9Xb7+RK9jXvLvzMTpxWuonQf1HE65pKC+Fe7aRg2j4tArF1Sx/Dy9Vba
         U62WM3Sl40UKkUGGRbOr+QQPSgJNkLXHxKtsDH74Z5uRwrvY2UwnHroPoEG7UcRALcMN
         BqBp+HtyMiXcTAzPMHQorIjwIEL9fqOSjZVlxI5/WP0yr2nJXkgx1An1Ekad00EBPMi0
         cRkg==
X-Gm-Message-State: AOJu0Ywwbxr1l7Ai2tDRsbYJNGvW/oIzqG+hileyDULRZL3oOMjHT2pv
	KndTvgJM6WAcZanNBYdzhxAS/fmOD+75tXCOyyQFiAYUd802YU/0
X-Google-Smtp-Source: AGHT+IFb0xkO87iajvnu/RbrVAPg0isliEel8BvJnRkKJGUPpTxcrJm/nJ0DjzFAmMTSwgwn4ZHkXw==
X-Received: by 2002:ac2:5382:0:b0:511:4e6a:52fd with SMTP id g2-20020ac25382000000b005114e6a52fdmr423108lfh.3.1707463498323;
        Thu, 08 Feb 2024 23:24:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVmi3o04Mdh3bqS+nHOZJmxKHpty+1hF0QEis1iuO4IqPlOp4kP98t7IUFwkPEa7qgTROukdKO5UVrwk0cWNyAqh6wShS8HW9ZFd+T8IlacrnFkWPK8ttTuvwUIzCeaNiCvS3qHXJ5jXwv5MUFKF+LGXlQhWaTswrb4P50bqtWeagCAu/IbDeY29Ey7f2fz9d9BP5Ko26GY5Oq3kn/DeSqNV7YLRzjzlVN8M5ESVphOl9V0FUmx1YTsZhbiMVcQt4F9aTcjfUv5h0K3rqhDIrs4trxuWjVyE9eCxg/LydWXan7RDD1MSCHc6RObeAKMkCNEWVwhLrMt0nQ11aLpAicm9R28EqPeoHNBe5+xRKnQxyy7bpG5po1SkpNLXoyIDtE8lr4MQDt6Of+0wPAnrX1F5tUNnuKSiidhBp3grKSIKHcEDTJwyutHhtMrhDADr3GCvxKJVS3v++U=
Received: from [192.168.26.149] (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.googlemail.com with ESMTPSA id z13-20020a170906714d00b00a370e130fc0sm478163ejj.59.2024.02.08.23.24.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Feb 2024 23:24:57 -0800 (PST)
Message-ID: <6012ec99-4246-41b6-adb2-1bcd4dd159ac@gmail.com>
Date: Fri, 9 Feb 2024 08:24:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: media: convert Mediatek consumer IR to the
 json-schema
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240124095230.25704-1-zajec5@gmail.com>
 <62fca33c-eb1a-42ad-b7f7-31b14f0aa446@collabora.com>
Content-Language: en-US
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <62fca33c-eb1a-42ad-b7f7-31b14f0aa446@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_232500_731676_2C839B3A 
X-CRM114-Status: GOOD (  12.41  )
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

On 24.01.2024 13:33, AngeloGioacchino Del Regno wrote:
> The driver says:
> 
>      ir->bus = devm_clk_get(dev, "bus");
>      if (IS_ERR(ir->bus)) {
>          /*
>           * For compatibility with older device trees try unnamed
>           * ir->bus uses the same clock as ir->clock.
>           */
>          ir->bus = ir->clk;
>      }
> 
> This makes me think that requiring *one* clock on MT7623 would be a mistake
> and the devicetree should use clk, bus - CLK_INFRA_IRRX_PD, CLK_TOP_F10M_REF_SEL.

Looking at mt2701-clk.h I can see CLK_INFRA_IRRX (which I guess you
meant above).

I can't find CLK_TOP_F10M_REF_SEL however. This seems to be available on
MT7622 and MT7629 only.
Could you take another look at it, please? Can you somehow verify what
clock should be used by IR on MT7623?

