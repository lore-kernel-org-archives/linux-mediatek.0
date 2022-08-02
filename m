Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A757BC00140
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Aug 2022 08:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ziFYm8rk88alkwyI6DGKeiYYXv8dOfZWiNNEBAzbbUs=; b=uDDGIv0l8UvxNSuGp7R0A/pkUK
	R4QpukMCeQiYaMv1R/+HnkExY+H0N18qIbObv7T3D8sZM0MX0YcM9qGuEjYEW9jqU9Y+v0CULtdHe
	YidtqkJ5W2a137HQvULXvzMa4LkmUjYIgPAws/PD66DQbXqEO4mNhnoVtgi68AqIlK3MVVIewMjjF
	ALWoGfWDaK3rYUF7GS8G5fxoMBKi7VcqErysNHt0Q/W2PT2TR3qWSfLWMRk51x6Bt8xr6Td8lEu5E
	O9qKdD7TYk/ZUsjVtVd47PQYF2cEVZiNieO5EtvesTGU54DVr/B9Ss0Hz0MepBclK8iCq3pNBJiPN
	trwAKRDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oImvV-00BfHI-Rm; Tue, 02 Aug 2022 08:06:53 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oImvI-00Bf79-0W
	for linux-mediatek@lists.infradead.org; Tue, 02 Aug 2022 08:06:41 +0000
Received: by mail-lf1-x12f.google.com with SMTP id t1so20822106lft.8
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Aug 2022 01:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ziFYm8rk88alkwyI6DGKeiYYXv8dOfZWiNNEBAzbbUs=;
        b=Q8FM7seRKFOLqDs9pbGjh7O9ypmYDNdS02O44fr0uDaD+Ekvix2C28Eu0YTnz4un9E
         zjZb0kmjzXhhxF2hA2MeGBEhZUMa2/QJ7merfkAYx+/6MBHNZg1vx8bdYF97YjDHoVTq
         LgeRNFA3ZxvbVMGhNzLcWi3AowWv9gQfOIN9VEPdRqbavEwLcWYz2pkHXeG3wsK20CUp
         tpChIa1AGzm/UKVSMhOsfVWVx+62gtQHTdGyf6F4anBWut49KD7kwKERKPGjulXz/zwU
         Zcu1mgRS0QCNWOsHRL3PcYpZM4sPoC0AwrgM3PyBQNCoCpSrp8xPLrt98yJI5L5agObH
         Tsnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ziFYm8rk88alkwyI6DGKeiYYXv8dOfZWiNNEBAzbbUs=;
        b=34AmbOC7EGoif5qoWyEAJ/kkd93pN/RoS+kg6lnOfJXJhxZHBYm6qg+b0QXHh6jKC4
         BH/Q0H+AlJppVMwFMOfbJ8NUbPIFBGFt2CeS9Y8Hwl90aYewQ7hkzly6qU+kOnLpjoFy
         tfMaXFuBFUykf/u8eYi9v/PIFX7jtUQA6xHy8xfFGdxyDknoDT3bbr5syw8SsxY3JaXE
         Z4BgFRoI6dZCDEhsnDJmDNAtrVgsqcwvysKFmCIW0cSUKeOneaAn2NsU5WWSddGJtbPi
         3hHNq1R6MKE/ih/S0xb/5ZUNoUMoXC6ux3NnKMf6MuDR0gHXQB3blyCnvl6fi6QoV9bB
         8j8A==
X-Gm-Message-State: ACgBeo0WyEn7psootSCD57gwE+bhzoyZTiLF7vSuKB2SuiUMJnX9xyX/
	n+jYkTVmOGVuInpshNDx3tmouQ==
X-Google-Smtp-Source: AA6agR6XdqW2PkasC+a1MlQwwoq1vcDKjruY6HOg87UsjC6E5gXtnZmjIUf2X1MMpMjvcyj6YFh0jw==
X-Received: by 2002:ac2:4e07:0:b0:48a:f6f2:8555 with SMTP id e7-20020ac24e07000000b0048af6f28555mr3101742lfr.200.1659427597773;
        Tue, 02 Aug 2022 01:06:37 -0700 (PDT)
Received: from [192.168.1.6] ([213.161.169.44])
        by smtp.gmail.com with ESMTPSA id o3-20020a2e9b43000000b0025e2cb58c6esm1842316ljj.37.2022.08.02.01.06.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Aug 2022 01:06:37 -0700 (PDT)
Message-ID: <341b4627-d729-0941-2c35-08c16ac68f3c@linaro.org>
Date: Tue, 2 Aug 2022 10:06:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/2] dt-bindings: mailbox: add definition for mt8188
Content-Language: en-US
To: Elvis Wang <Elvis.Wang@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220729084319.6880-1-Elvis.Wang@mediatek.com>
 <20220729084319.6880-2-Elvis.Wang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220729084319.6880-2-Elvis.Wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220802_010640_257144_087DCFFA 
X-CRM114-Status: UNSURE (   7.17  )
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

On 29/07/2022 10:43, Elvis Wang wrote:
> Add dt-binding header for mt8188.
> 

Use subject prefix matching the device.


Best regards,
Krzysztof

