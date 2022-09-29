Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B673C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Sep 2022 12:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Wu49/9oCmVJqWjYHFvdZgUkugLJmnwyVSJYmbaTsak=; b=DukcWPlIe471wCfETA8va4bzNW
	ErvjQJxOnQb9VtYJ7Tmhuhw8bRfg/+EZeg19w9KnMNQDBzhcUOZ7JBVbx8ijcgl296ckm+BdTFEVm
	7pcRlcAoQnjdHEq5AfMbrTvfaWOtIzKWCwEeDLUBUZ8Yt3AKOCLIUQPS/wQ/UdCGjVlnIHNzI2MoR
	e3EAR6bt5Yc2+RuqZQrffBAR6fYZhNox61SP3UFNpLEqqfUm5UVIyUnm0wAjTOdTWdlMZR4QI4xhR
	jQ3Iuxd0n8uftkMy5LAHnj/HERAv9zbA5Pn98rXBUDil+xUBPY4Xsil16wRBKLqoNUBpO5hGVGbIV
	dmHlRUVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odsnA-0031bE-5y; Thu, 29 Sep 2022 12:37:28 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odsn4-0031W9-3l
	for linux-mediatek@lists.infradead.org; Thu, 29 Sep 2022 12:37:23 +0000
Received: by mail-wr1-x434.google.com with SMTP id x18so1984977wrm.7
        for <linux-mediatek@lists.infradead.org>; Thu, 29 Sep 2022 05:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=6Wu49/9oCmVJqWjYHFvdZgUkugLJmnwyVSJYmbaTsak=;
        b=h6X2gpN/qqak2l9MaA5Wwjk1FX/cZ65M4lTsmyeyL4pd7ptt3a38nLWeXPCbqHOTdo
         113Mfcy8wqBL7LDYV9O3izk/Z+b3W0NOglKRBIoihov03gx/9ACd9BD2DiLeHKNjfj4o
         pPLnAkAczGoHjZ4BUHInuINSAxarDQ0l/1M2CTHzqJ8TSTl6kBlbLsBaYRM9hsqryjJ+
         78Z+mzgrL/xz5csMSrK0MVg1eRH2EfxHbl4QZOgxFZlP6f0yhhnFk/vYCHUHaO0uB362
         C7HV9n5u2LZAgfQsnlPQG0xBC5wxPk3mJ0cmA2dKRM7dHKBtxkFGj/kiCVM5Obl4UTG2
         7ASg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=6Wu49/9oCmVJqWjYHFvdZgUkugLJmnwyVSJYmbaTsak=;
        b=V0Xy4YxBPstgma9Jx1STNaxT+of5oq+B54lSJXihoAJwuglkdAodSf9uVPRDukSDl3
         FsgYisQN392kbRV4SgBwTOnHymFE6uxjCrz+8t0TbBVYqvV2CWd8onMgwJ1O7EBXGf/D
         +84sU/iAKBCPeZsfcOcG29QlKQXGBjScVV768+UFPjbJjNHwFuuT35NGNwP3YU1e1lLE
         EMmMHCsUn4bm3Qc+2ijQX+GyeRm7OBmh+n0JgV3izzn5NzGtZbYXfL6F+/V9sExC+ZVq
         2xI82ew+RD8omqpcYZmouHPZKMCKw77I5B5A5kZRd5plk98Lc1kY35tccBzw9vqBseE2
         r6vw==
X-Gm-Message-State: ACrzQf0aNdhrsdb8baNfItPGeNDOizZHqyPs5Ss4Daq3f9ziinNdwhLg
	4PZuSc0CX/Yz/fuSmKb1adw=
X-Google-Smtp-Source: AMsMyM6npaeOsc2MEuSPEwbp4GF99lIRn/lRvFdzFxWdNs9dbc2dPgyYlu1ChjODxsT78YunWammtQ==
X-Received: by 2002:a5d:59a5:0:b0:22b:52:1c9f with SMTP id p5-20020a5d59a5000000b0022b00521c9fmr2179232wrr.576.1664455035335;
        Thu, 29 Sep 2022 05:37:15 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id bi16-20020a05600c3d9000b003b4de550e34sm4097629wmb.40.2022.09.29.05.37.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Sep 2022 05:37:13 -0700 (PDT)
Message-ID: <5b9e5ac9-b05b-b039-4aac-387b9f24a73d@gmail.com>
Date: Thu, 29 Sep 2022 14:37:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH,v2] dt-bindings: pwm: Add compatible for Mediatek MT8188
Content-Language: en-US
To: xinlei.lee@mediatek.com, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, jitao.shi@mediatek.com
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@list.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <1663915394-30091-1-git-send-email-xinlei.lee@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <1663915394-30091-1-git-send-email-xinlei.lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_053722_218146_461DDE48 
X-CRM114-Status: GOOD (  11.72  )
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



On 23/09/2022 08:43, xinlei.lee@mediatek.com wrote:
> From: xinlei lee <xinlei.lee@mediatek.com>
> 
> Add dt-binding documentation of pwm for MediaTek MT8188 SoC.
> 
> Signed-off-by: xinlei lee <xinlei.lee@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> index e4fe2d1..2dd93e8 100644
> --- a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> +++ b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
> @@ -27,6 +27,7 @@ properties:
>         - items:
>             - enum:
>                 - mediatek,mt8186-disp-pwm
> +              - mediatek,mt8188-disp-pwm
>                 - mediatek,mt8192-disp-pwm
>                 - mediatek,mt8195-disp-pwm
>             - const: mediatek,mt8183-disp-pwm

