Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 267E4C28D13
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 14:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bKqxJIBDaoN4leoGC948rXDy4btWZwIIKEVGbDwuJbM=; b=spAT2YPPF2LBGi0rrU6e390YkR
	I2xOAbNB3JcATeZygQ7NdSE+wx90ZuhyjjvcqQIkYMHyd56gVTD+s9DqUCsf/d7p9CRB4ZUJK9nsq
	ZPWtkbLhPrXxfpKMnEOM/KVR+zYUK0uB4Uf2y1eny5ckGvPxAFCO2gh4lajNRUqAr39OzVFN1KMgA
	1Mq5K0sPQ50HmGs416z6myLngLjkCFYpuiwdAhRnkzKeDlrCnY+jMC0whKbQtu/PbVVHFvOgiXD8U
	RRs2kT8E+cJJ0/ZbclveMks41/gur5cjO5zwAcAX58AVNmHxNiqYCrTyeceoY70JU0DYDY//sVACl
	TBKWvPPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oREJ8-00FT7x-Ud; Thu, 25 Aug 2022 14:58:10 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oREIv-00FT1J-UQ; Thu, 25 Aug 2022 14:57:59 +0000
Received: by mail-wm1-x32a.google.com with SMTP id m17-20020a7bce11000000b003a5bedec07bso2862389wmc.0;
        Thu, 25 Aug 2022 07:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=bKqxJIBDaoN4leoGC948rXDy4btWZwIIKEVGbDwuJbM=;
        b=niwLkKWApxiZ9LaQP6x2ZLxlpmxSFUjIjBrJm4WXIOlbAS6k3JphAY/ug4U7/qDzZr
         1BCAnDAPUB96BFamev8xVvVo/rtd5+HhoGPBKJEGXhjkrtGtZlGbICR7qdNqqbOCL9V/
         PdJhXg+5FI0mnSBK+yS8l6n8Qb5RD8hMP6yHXJu2Bbk09B91YpjiIbOIra7NK8F9+uXS
         Ghdppms8BAgMaJkmk4oH05DX9DaJWvlh51FshpMIZBf5iM7eTvpGzNGa6nDdjtHWvBZz
         99iLZjHEgqQp8O4vLf6oqCXffSuB+c0pV4PsiV1WOXQK4GSy8w3ypP447AXKQZWWP+s3
         HjAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=bKqxJIBDaoN4leoGC948rXDy4btWZwIIKEVGbDwuJbM=;
        b=hCn48b4b/G65XB6oCYvuyPNRVg3Z7dnOs0dgST+NEsGs8uiilhhGI7cd7/exUIUjnq
         RzIgi4P0TKGPkoH/+wdGCKLe1elFzgn9xeM7B4Gp2PI1MHadtP0rGrlr/ClgYLupsgVO
         faQJ/wHw6qigFfwxfby/t6SQfnI+1UKD+NNqaYp6utwH0idUV2X9DL0AE/O0bGZHHeij
         tqmNpbxJdI2AG+ApYuZvDqvkuX/RH6Tet1VRPFRTKyuE36dCdL8+pkfRlGrXGY0lXLsx
         l1vq61XxWpoCZ6/LFmBEtpvUrqeaMxfC8Y4w9m4q7+q2f9LfPrD/QZkeSemAR3Sofq27
         zNYg==
X-Gm-Message-State: ACgBeo2yVePwiMoNc6O8eSFL/wYVnoUW1Ku/XQUNoL4juc3AAVqmUHem
	W+MH1auipGjCB+Wg28mLh/4=
X-Google-Smtp-Source: AA6agR7DjigTUF9DSPLsJPn+n8QozB6Xr2ap0MfMSl098vyNmB/BNSxC6kMjQVy++uy2E6Cq9djLOQ==
X-Received: by 2002:a05:600c:657:b0:3a5:e4e6:ee24 with SMTP id p23-20020a05600c065700b003a5e4e6ee24mr8225959wmm.68.1661439474250;
        Thu, 25 Aug 2022 07:57:54 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id s1-20020a7bc381000000b003a35ec4bf4fsm5403928wmj.20.2022.08.25.07.57.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 07:57:53 -0700 (PDT)
Message-ID: <3ed3d73a-1671-708e-7c42-498cca6aaf1d@gmail.com>
Date: Thu, 25 Aug 2022 16:57:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v2] dt-bindings: arm: mediatek: mmsys: change compatible
 for MT8195
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Cc: jason-jh.lin@mediatek.com, nancy.lin@mediatek.com, ck.hu@mediatek.com,
 chunkuang.hu@kernel.org, angelogioacchino.delregno@collabora.com,
 hsinyi@google.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220825091448.14008-1-rex-bc.chen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220825091448.14008-1-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_075758_013012_9A1E2CE8 
X-CRM114-Status: GOOD (  22.93  )
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



On 25/08/2022 11:14, Bo-Chen Chen wrote:
> From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
> 
> For previous MediaTek SoCs, such as MT8173, there are 2 display HW
> pipelines binding to 1 mmsys with the same power domain, the same
> clock driver and the same mediatek-drm driver.
> 
> For MT8195, VDOSYS0 and VDOSYS1 are 2 display HW pipelines binding to
> 2 different power domains, different clock drivers and different
> mediatek-drm drivers.
> 
> Moreover, Hardware pipeline of VDOSYS0 has these components: COLOR,
> CCORR, AAL, GAMMA, DITHER. They are related to the PQ (Picture Quality)
> and they makes VDOSYS0 supports PQ function while they are not
> including in VDOSYS1.
> 
> Hardware pipeline of VDOSYS1 has the component ETHDR (HDR related
> component). It makes VDOSYS1 supports the HDR function while it's not
> including in VDOSYS0.
> 
> To summarize0:
> Only VDOSYS0 can support PQ adjustment.
> Only VDOSYS1 can support HDR adjustment.
> 
> Therefore, we need to separate these two different mmsys hardwares to
> 2 different compatibles for MT8195.
> 
> Fixes: 81c5a41d10b9 ("dt-bindings: arm: mediatek: mmsys: add mt8195 SoC binding")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
> Changes for v2:
> 1. Add hardware difference for VDOSYS0 and VDOSYS1 in commit message.
> ---
>   .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml       | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> index 6ad023eec193..bfbdd30d2092 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> @@ -31,7 +31,8 @@ properties:
>                 - mediatek,mt8183-mmsys
>                 - mediatek,mt8186-mmsys
>                 - mediatek,mt8192-mmsys
> -              - mediatek,mt8195-mmsys
> +              - mediatek,mt8195-vdosys0

Thanks for you patch. As I mentioned on v1, I propose to set 
mediatek,mt8195-mmsys as fallback for mediatek,mt8195-vdosys0 to not break 
backwards compatibility.

Apart from that, the binding change will need some changes to support the new 
binding. Please provide these together with this patch.

Regards,
Matthias

> +              - mediatek,mt8195-vdosys >                 - mediatek,mt8365-mmsys
>             - const: syscon
>         - items:

