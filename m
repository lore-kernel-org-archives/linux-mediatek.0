Return-Path: <SRS0=BaWb=QE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A70D9C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 18:00:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DBB961AFF
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 18:00:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6DBB961AFF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MhKQ0aM2kYt11qtszrou0THcZYl/E0Fq6VNmM8MaFoU=; b=ffkvTXzTkRNmEi
	J8nmFmOSbXXQh4JOAvbQE8XK1CFzfm1OsROqjT3S3WGQSQ6TaljX4vH2YoDbWbVmD4s8aesOApPvt
	VPejFJ6mFyBGEszTwPDF/X4SXwbRvPgpdH4f3f6oVRPJHWkdrRq2veMnGtwnZezVGT0LAG74ic2xC
	ffuOiWRFijbNG9iVlMT0uabcbawlHIZijFc08LfRC2S3r5cJC007TkSOvvdSUl6gbN3y/ReYCEZkF
	tb7DJoU9TexCj9rEeWXOKRFR6/7nuk5Vjf+DmPpQk3Jpqt0yYXriTIdYQFuo4BYFxhVSMLimgheMB
	Q++dcTo/l0vD8XI+rw6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnPEf-0060p6-AR; Wed, 17 Nov 2021 18:00:41 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnP6l-005xaX-2i; Wed, 17 Nov 2021 17:52:32 +0000
Received: by mail-wm1-x335.google.com with SMTP id
 p3-20020a05600c1d8300b003334fab53afso5474275wms.3; 
 Wed, 17 Nov 2021 09:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=z9za700pXbi8AMr9eE4TSbmK4A+KefuoY1pDTMXIcrQ=;
 b=nmbPe2Y0/coc222QpoJ+jvdrxN/ZhL/lFYj98mtK5uXOSapgn3k6Ry3tCUN0JEv6gh
 KQAWqpqIpzHnmCfSrjpTxzcJdzq1tlCZAjOXPYYOsTckofiU0fEQvKLUK5pRUAwH/3+Q
 EoE2X0mseuWDZxlmIDpC10/blauzr+QXvg463/5b3FiyOIjC1ewxCKOibWuhQMnf+izZ
 Y71kw+6SxLMMxCD2G/onQkXFWUtcBea7sX56YbjoBt51AE9NeuNzsc4Ut0ZzNWKTBH5D
 XQoxs5rHWYDxDw1Cef5x6EsdF96V/DKn53RNmm9GrAeEcxkw01j3JvtDy598TDi3VYqN
 +3Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=z9za700pXbi8AMr9eE4TSbmK4A+KefuoY1pDTMXIcrQ=;
 b=Gy96UT6XnPu2besGqAuJ+0BLyLSxOnssr1HeUjGqOVKfjNQDyuVshg6lDiIChohzCx
 X1hQGxUJ9co8izs/gUMHNtduYsAOdjbsJUD4+FodG/KOYk2pHHBM3b6Whybk/9jOmO+F
 gAdYk90Pjg0ArvOLZNqaOz3nmRf/fMydvOt1zpbwsRP7lkgi3vceE/9x3ZS2DwF/etGL
 UzVjUyrjp8h4V0ClIjoQrxFK2wjfr1YV92jn3d/Rf2QWuDm9P8uOvG3cw1rTTfGZa7fL
 iX2+rAIqIvYwAmqeZ4L/nzhrez8Q3kTbs6O0CxxTanm5HwaPiKYdQtmwmwEFqZKE5zaR
 0NNQ==
X-Gm-Message-State: AOAM533pC0AtCXjGKBVXdQJb5CwTpMmQai8Vmtm6xkxbMj3jxYw4ViKO
 cTlvyNURYM5bMHsV401Xp3o=
X-Google-Smtp-Source: ABdhPJwynQ5d4Q4cF6u/F26+njYaHAAlkx2vAct0EWKN2lUdmV8TDsrgmWiB/HBK0BwpLfksgHp6FA==
X-Received: by 2002:a05:600c:24d:: with SMTP id
 13mr1768515wmj.156.1637171549639; 
 Wed, 17 Nov 2021 09:52:29 -0800 (PST)
Received: from [192.168.0.18] (static-160-219-86-188.ipcom.comunitel.net.
 [188.86.219.160])
 by smtp.gmail.com with ESMTPSA id h17sm6099017wmb.44.2021.11.17.09.52.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 09:52:29 -0800 (PST)
Message-ID: <52c99fae-1c66-271c-f91d-89dc058585bd@gmail.com>
Date: Wed, 17 Nov 2021 18:52:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2] dt-bindings: mfd: change naming of mediatek rpmsg
 property
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, robh+dt@kernel.org,
 groeck@chromium.org, lee.jones@linaro.org,
 angelogioacchino.delregno@collabora.com, bleung@chromium.org,
 Enric Balletbo Serra <eballetbo@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20211103103952.12535-1-tinghan.shen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20211103103952.12535-1-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_095231_190383_265B707A 
X-CRM114-Status: GOOD (  17.43  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 03/11/2021 11:39, Tinghan Shen wrote:
> Change from "mtk,rpmsg-name" to "mediatek,rpmsg-name" to sync with the
> vendor name defined in vendor-prefixes.yaml.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> Reviewed-By: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
> This patch is based on [1].
> [1] arm64: dts: mt8183: change rpmsg property name
>      - https://patchwork.kernel.org/project/linux-mediatek/patch/20210924033935.2127-7-tinghan.shen@mediatek.com/
> 
> Changes since v1:
> - No change. Add dependency information.
> ---
>   Documentation/devicetree/bindings/mfd/google,cros-ec.yaml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> index d793dd0316b7..0faa4da6c7c8 100644
> --- a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> +++ b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> @@ -59,7 +59,7 @@ properties:
>         whether this nvram is present or not.
>       type: boolean
>   
> -  mtk,rpmsg-name:
> +  mediatek,rpmsg-name:
>       description:
>         Must be defined if the cros-ec is a rpmsg device for a Mediatek
>         ARM Cortex M4 Co-processor. Contains the name pf the rpmsg
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
