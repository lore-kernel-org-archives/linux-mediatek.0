Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A00C77B7F
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 May 2023 11:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yiqqflnIDT5zW02DCqAL89wuz3kC3M5MrYziUX0JLbc=; b=DgcPgVYM9SRvItDCO6wMYbpmTX
	5l55butSh0FEb7/TmAW3n7vS9JQZWimZ68l3VnYohuYrPPycEf4F08RtgV0OYXi4IhOS+02nAwWa+
	LplfdS0OtNfo1mx4KfmtNT55roT24Qp7knbjFMjuWP7yx2eXAS64f3hXh0id43ty7EHVKI4FI4/4B
	Tq+a6iSNYHYpNDUAgDkKAt1pauiCnLMc9Ss1kyyOejXEwcTuyAVlWBu92EM8OYj6RlyQjyOSdKF0C
	qLlfatLQrDlnqdpYu5A1ZluuD9z3/4BNXYSAUv+AGGqXgFF5O/P4w7ii0rCZUg6RyemB7lnqpuyXS
	1MDOre0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxR0O-00Bpa0-2S;
	Fri, 12 May 2023 11:32:12 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxR0M-00BpZD-1F;
	Fri, 12 May 2023 11:32:11 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3f42c865535so42695495e9.1;
        Fri, 12 May 2023 04:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683891125; x=1686483125;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yiqqflnIDT5zW02DCqAL89wuz3kC3M5MrYziUX0JLbc=;
        b=hmNW3GPWhcb3KKkcveW0KfRlmGKxwkNiv4RiebqLGQHxlFHuAZvvcJMIlJzc0ln4yU
         tzEKsFdAATSMBTgSx93OouI0hbp52mBHOPkE8K0ueyPFkocGEyf8KdHAwkrNJBVmhIT0
         3JzumVD6A5iBs3oI37Scg4/ZUONWJt7Dfs734CuQiXN8WcIkMBDWY/EJfGHTeKMCLkg1
         Ed+jEnRZIispEHySuZTvVy5rVosHhB0ULsjR2K1naB+H7bwjFpr8MT7SvxQJyCwcLffG
         HP4nU10Hd6xAlWtbn3s820JPdwG//mvOkpao/9HAbyGwikm7qPDadiBeJCwK8Lf4gAyL
         dCDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683891125; x=1686483125;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yiqqflnIDT5zW02DCqAL89wuz3kC3M5MrYziUX0JLbc=;
        b=X3TIbkIx+yLXYNF/hzCz+AhRbfnYV18CsivxNnTfRO6bdw1oWsjf97YwRu3wgHTrG0
         SJltcoGc7s8uHKt36y/DGsQ1cbNLP2u4kIA/H+dKrnFdVcpF6bX2/BhT7mUB6msENUO8
         0o3Ff6GluyK3ilg1XdnW4AfQGtquMlybhzSW9lVYAfLXDPrI2IBcHyNVh9+yEvTQfVzD
         9FOHhWrlKfqRf/Zfn4urL8hTznrqz7AECdjMrZhLQecwbLOu3Xx/CaR//M7m4zD18+rg
         OxgDkrF+VdqaJVOXKCyAmGA+8p1QmnVAsJVndvrwJtr/XVJGbTgDHxN30lu1jjCW/EJw
         ONkQ==
X-Gm-Message-State: AC+VfDwyJAMAr+IScG0lzHnX2EkkLHyAQTe/lKKgzQzpE7uWp5u7TBJi
	X/CfLAn7kdjBlzU0oPt4zxKop85QYTBjkA==
X-Google-Smtp-Source: ACHHUZ7+5L5xW9tJPCOpere/SZxgTKKOoJ8T0EuxolXCIbyUPaKaY9fkdLq1/SKO5pJZmkOp4ZrxLw==
X-Received: by 2002:a7b:ca51:0:b0:3f4:2174:b27d with SMTP id m17-20020a7bca51000000b003f42174b27dmr13085546wml.39.1683891124853;
        Fri, 12 May 2023 04:32:04 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id e19-20020a05600c219300b003f173419e7asm28079750wme.43.2023.05.12.04.32.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 May 2023 04:32:03 -0700 (PDT)
Message-ID: <cdcf000e-d1f4-d420-3151-0c8fe1b534d5@gmail.com>
Date: Fri, 12 May 2023 13:32:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/6] dt-bindings: interrupt-controller: arm,gic-v3: Add
 quirk for Mediatek SoCs w/ broken FW
Content-Language: en-US, ca-ES, es-ES
To: Julius Werner <jwerner@chromium.org>,
 Douglas Anderson <dianders@chromium.org>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 wenst@chromium.org, Eddie Huang <eddie.huang@mediatek.com>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>, Ben Ho <Ben.Ho@mediatek.com>,
 Weiyi Lu <weiyi.lu@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org,
 Tinghan Shen <tinghan.shen@mediatek.com>,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, yidilin@chromium.org,
 Seiya Wang <seiya.wang@mediatek.com>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org
References: <20230511150539.6.Ia0b6ebbaa351e3cd67e201355b9ae67783c7d718@changeid>
 <20230511150539.1.Iabe67a827e206496efec6beb5616d5a3b99c1e65@changeid>
 <CAODwPW8TqhArafCK3RvBdxyiav3WL=0MU6x=QyBOFP-h8bQrWw@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <CAODwPW8TqhArafCK3RvBdxyiav3WL=0MU6x=QyBOFP-h8bQrWw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_043210_425737_3F26C4D4 
X-CRM114-Status: UNSURE (   8.41  )
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

Hi Julius,

On 12/05/2023 00:37, Julius Werner wrote:
> Reviewed-by: Julius Werner <jwerner@chromium.org>

For the future please don't delete the patch itself if you give a tag, just 
leave it as it is (and don't top-post your tag :) )

Regards,
Matthias

