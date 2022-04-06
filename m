Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23084C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 14:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q+tUJzCv7pkZOCHNON2OseeTzpicj4S6gUa5JVCs8JA=; b=sfmXmVkIefyXy1
	TvTOcX+5OjW54WXDCNBDCfDpVjsIVLZxWCWapRL68vT+2IkF1GZsuBYSVDpVAxg79ULUfCqlAAD4p
	F12PDKFLolvgkcQIfmae5YmH8nUgiLUKqb1EeQSwn89dDj6Y+c0vsDa6GcCKjc17/tg1F+Nyact0G
	OO8/lSqKx+cqPrl445KLKxOSa1P20k/N/URHU9m/qzY74BxCDHfh2483Z92NqYLEYQtQNTxKszLBH
	jwJuzcn5MEZbGiIAf7Mw/g59QHL2xTC2d9ASbcql9S//JEJklc3xZppOf9l0pbpV20p5xryGGPl9l
	3jYvZoCMgb2BJ2xmFACQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc6uC-006cZp-7i; Wed, 06 Apr 2022 14:45:08 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc6tT-006cCr-46
 for linux-mediatek@lists.infradead.org; Wed, 06 Apr 2022 14:44:25 +0000
Received: by mail-ej1-x632.google.com with SMTP id dr20so4723310ejc.6
 for <linux-mediatek@lists.infradead.org>; Wed, 06 Apr 2022 07:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=UNqM0LlACzUWebKPb32nAc46OxRJa6ogRvRpwiXpenY=;
 b=whpZ3f6EBitVqq0rstJxB66VMYokK6P1XsHnHCPNRzkc24btGAatngLwzN3FrEmk+X
 nXT4tCx7EzcaMXTxngfAU80wkPN1yAVsJZzSkSehSs2BXtRZcANCt6m93GX/BihIB+RY
 V7oYXx4CRRS7J6miGCAMWSNwRF8g+2l++6BEPLe7nzBKUOC+V2vfMI/s7CSmVp/9jdHg
 2/Olc5oty19Vow4Sg9OXhlXGsSwaVffLD3aYy1+qWIQMaUVmQfNqM4kQlZSdQ670kpqP
 vXJHa0sJFTiCf0/nKh9/Le5EEfDWZiiBQuOkp6OsMtfLFinyDWYCxFlQdT5cQN3FFnwh
 nmVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UNqM0LlACzUWebKPb32nAc46OxRJa6ogRvRpwiXpenY=;
 b=zOGkKBR6qHztCtVJX6fiWTSpSIUUVLz48tI882UwkN4yHML6ePbNG2jJFufhWUB154
 GqupRcSDt7w0+tdoku6G92KAim8ZrI21m5Hn4vvYoMybAZYElKCBKFz02OXOuqbfxTuk
 RGrWzmuI8AhXiD1e40rQQmd8YLojiJOtYb8qO/+yYD8EIFXzRDW1qSpcujTmpD7uIVwI
 eTYOO+/gLkaCqYGD7GWRjw1GVwZe9MVFVrNOluU9Eh8MLXXISIljP6UIO3Iht8xUmY3e
 TPIsxuxuPgX4hulxzODx2+Bgx+Stg5qF4bBhUCGMMw6h0UfY2jd3s3KjKQWUezAhK6FW
 bTRQ==
X-Gm-Message-State: AOAM533fyPVIR+WlXDiBUBQP+42YSriiNTYBIv94I/2q3IisIpfDitZw
 UOnsV4p5f1vo3IiSIAMIc6lOXlvNczVB4vnL
X-Google-Smtp-Source: ABdhPJweVGzt2UYsW0wgC1QYNfzk/buFhSRGS7vEy/Lzgm2Wxo+7xzpzsQtReauuNt8ndDaCKGNT3A==
X-Received: by 2002:a17:907:3d93:b0:6e7:4d22:75c8 with SMTP id
 he19-20020a1709073d9300b006e74d2275c8mr8656814ejc.330.1649256258352; 
 Wed, 06 Apr 2022 07:44:18 -0700 (PDT)
Received: from [192.168.0.185] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 h30-20020a056402095e00b00412b81dd96esm7858108edz.29.2022.04.06.07.44.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Apr 2022 07:44:17 -0700 (PDT)
Message-ID: <397e30c2-18c3-93d6-16f5-b113be77f51a@linaro.org>
Date: Wed, 6 Apr 2022 16:44:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/3] dt-bindings: display: mediatek: Correct disp_aal
 binding for MT8183
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org
Cc: matthias.bgg@gmail.com, p.zabel@pengutronix.de, airlied@linux.ie,
 yongqiang.niu@mediatek.com, jason-jh.lin@mediatek.com,
 nancy.lin@mediatek.com, allen-kh.cheng@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220406094654.29722-1-rex-bc.chen@mediatek.com>
 <20220406094654.29722-2-rex-bc.chen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220406094654.29722-2-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_074423_201535_EDFAF896 
X-CRM114-Status: UNSURE (   9.90  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 06/04/2022 11:46, Rex-BC Chen wrote:
> The driver data of MT8183 and MT8173 are different.
> The value of has_gamma for MT8173 is true while the value of MT8183 is
> false. Therefore, the compatible of disp_aal for MT8183 is not suitable
> for the compatible for MT8173.

Just because one feature is not supported, it does not mean they are
incompatible, which you claim in the patch below. Are you sure they are
really incompatible and MT8173 fallback cannot be used?


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
