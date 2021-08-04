Return-Path: <SRS0=9YCi=M3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8C03C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 16:59:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7952360F22
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 16:59:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7952360F22
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=YTjfd9Z0B75U3CZCI1pNNXOaWt9PGrqx4t+k4TfPIno=; b=BFiOpsizcZzf6Izn1RKwrl24wT
	yPnZ8oesGlXtfJGrks63ykTbdMQugA/V7AUuTYvjF4vE5uFbK8yiMJe5sxQpblb7iuDKG18lYkPI4
	8ASGEJoAZ0CPGrdtNA2gIWqz/KCnPZYMJpxVmz7FseJWQKBeNGfo03qpg2+OUuNiCLZIYkuwuPBJd
	GOUmCLJ+crhqrpJUKp3Jt8HTzhSQcYxa5jQOp10ko/SChqLTkBRx96qEPsnKJO7MkkD6tHIdLKElG
	anfxWSljtfg+7N5UU7pUb/1pZ0olE6C1466LyKeox7yucy+jmENebdkow0/w4gu1fWk7jH1vJRAhe
	7qcnH0WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBKEP-006q33-4l; Wed, 04 Aug 2021 16:59:01 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBKED-006q1R-Mg; Wed, 04 Aug 2021 16:58:51 +0000
Received: by mail-wm1-x32c.google.com with SMTP id
 o7-20020a05600c5107b0290257f956e02dso4391046wms.1; 
 Wed, 04 Aug 2021 09:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3Ssyrr/LekuqyfoFP6rWy6sS/bB/kXsH0XIHqq6qrRA=;
 b=d6yEoAllZGCIiIueIGkiRtizcnZJvJZz/7grSWi60dtuThwbzCP0txQSI6PW24vBof
 ujuku+sbZ68B5JTfrq6BT3/8UTDqIur4gqE10o6M4zIOLKbvrhAg1h7wozS5Wkd1Fwpq
 oKkBNOOG780dSz0LDPznyhNlqAbwM9xh7fX+dLqS6F8FaEs88//3x20aubIhfqHYVneQ
 fJq0dPwibQlpflo6yKIVqaqRAXWgVxlgMLj3mICKTVxcFq19v8K8uAdgAwmL+DWD3WMX
 W4WhBAE/PhnqjBMDHkCsPVbaFJB7FHjHfHCPIVHud4TGPFAKiOqPzyKXKEwA53BHJgYB
 HKEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3Ssyrr/LekuqyfoFP6rWy6sS/bB/kXsH0XIHqq6qrRA=;
 b=WogLpmmMC/r4EdD+9ULFFynU1hqACioO1Pb+uhS2EgVblO3nv2CPji0ZexBw6QKdCk
 cet/W+ois2T0MRmFfeLxndwFXBWLECZmnpM+d1wEFcys2GgJWtHLELktYjlM1ab+zsjy
 EhzabvlaMUkEJ1lghouT2WcWmZsdUdY/qcpzsQLvfKo1l6HFGNXWgS0+Jxe9/bQuM0wW
 Npt6RgXvXZjxhmuflWr4xR/GBgLTMFl2p5mqaozu3suNt2eEqXmBqnXozuHTqHQGlVTQ
 ov8fyNU5gcTj6+Ea07xwjsB+BuK7lUpFF1eaXWUaYO4RgodBvghjBYLgjDbjdXDl0iWx
 ladQ==
X-Gm-Message-State: AOAM530z6odCBUXOFtLXfdRKxhCBX4XEWrGT4n9EmdSFawoBEgUn5dby
 nPL0lSwbP47ukr0kQDlJFxA=
X-Google-Smtp-Source: ABdhPJwafgMJoBvwzw0+RnBkoe8PPw1by0O0pbkbU82e5MFA8Z4ROKKfNhJh/lAx6gweEKQ7LWzKjA==
X-Received: by 2002:a05:600c:acd:: with SMTP id
 c13mr526867wmr.189.1628096328471; 
 Wed, 04 Aug 2021 09:58:48 -0700 (PDT)
Received: from ziggy.stardust (static-55-132-6-89.ipcom.comunitel.net.
 [89.6.132.55])
 by smtp.gmail.com with ESMTPSA id q5sm3428112wrx.33.2021.08.04.09.58.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Aug 2021 09:58:48 -0700 (PDT)
Subject: Re: [v15] dt-bindings: ARM: Mediatek: Add mmsys document binding for
 MT8192
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20210802025839.16763-1-chun-jie.chen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <aa0602cb-c4f3-53e0-7ce4-47e9eabe84ee@gmail.com>
Date: Wed, 4 Aug 2021 18:58:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210802025839.16763-1-chun-jie.chen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_095849_796981_0C58D069 
X-CRM114-Status: GOOD (  19.64  )
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

Hi Rob,

On 02/08/2021 04:58, Chun-Jie Chen wrote:
> This patch adds the mmsys document binding for MT8192 SoC.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
> This patch is based on 5.14-rc1 and [1].
> 
> Due to mmsys binding document has been converted to YAML format in [1],
> so resend the patch in [2].
> 
> [1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=485165
> [2] https://patchwork.kernel.org/project/linux-mediatek/patch/20210726105719.15793-3-chun-jie.chen@mediatek.com/
> ---
>  .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml         | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> index 2d4ff0ce387b..f9ffa5b703a5 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> @@ -29,6 +29,7 @@ properties:
>                - mediatek,mt8167-mmsys
>                - mediatek,mt8173-mmsys
>                - mediatek,mt8183-mmsys
> +              - mediatek,mt8192-mmsys
>                - mediatek,mt8365-mmsys
>            - const: syscon
>        - items:
> 

This patch has a dependency to [1] which you merged in your tree. Would you mind
to take this one as well?

Acked-by: Matthias Brugger <matthias.bgg@gmail.com>

Thanks,
Matthias

[1]
https://patchwork.kernel.org/project/linux-mediatek/patch/20210519161847.3747352-1-fparent@baylibre.com/

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
