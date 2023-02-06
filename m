Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF60C05027
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Feb 2023 18:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TyC23soTfwOMq0a8LpZaJG0XUTHUqJMLxjJ6KOaCxeI=; b=0sWNYIt7RmRBM+mMRC+/BjLwq9
	/dHRxoJdYxM/vAXWGmaID7W8bjqxQpYlL0kcOiAB2ZRN5fMbUYlGWo06t6jhce+d7ZHTnVkandYko
	88MYqEjrcAb2RzmYDt/cFSA962MzyFYM38VMagWrBmh/efgjXtbCxaGRbF5377w2t47aw1xAtNPT1
	XMQFtFH0gSTkNyq+KhdUCDUBW9CooafFlO3+uUHKSNrz0hUp1VG34vmVIKwlD6mFGia4wOpGKyPd3
	wkufcku4rZRDoPxekIHDIlrrUCueb9BiWtZ7RbIoSL1lkOosVEvMONVTC5GqwqnHW66RTpX03tXPD
	yREziFEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP69j-009bls-JF; Mon, 06 Feb 2023 18:23:55 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP69Z-009big-Fv; Mon, 06 Feb 2023 18:23:47 +0000
Received: by mail-ed1-x530.google.com with SMTP id ee13so5997587edb.5;
        Mon, 06 Feb 2023 10:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TyC23soTfwOMq0a8LpZaJG0XUTHUqJMLxjJ6KOaCxeI=;
        b=aEqv+a6iAek+Mh7PCPESa9s+6SwMxQM+pTfGfFLfwpk3nSxF3eyyjqsR0IENA6Gd9i
         B7aupdYEeXz9avN23tbuoDGLWH/H+7zHGbI2GH6UGNjlwlUmkw92STPHWW96OBjX58io
         Atbo+MaHimPqLYKdgBLjNFjyedJwvaDGAV88mNZnDJtQ3vM9hsanYFFDXgE8nsD7HqK8
         4vHbCUSzBfSXpyQamGZm9kyQVIEQlJGT0hKPcgJYrnxQNO4ynGKEYe7+PnKpFwX1Evm6
         F1gIUzceEwhQwM/cCTcY6DPQD0yAgfBqe2RQbmfRsi76egKGkqWU8tfKvVXfwlNsmPfo
         6sEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TyC23soTfwOMq0a8LpZaJG0XUTHUqJMLxjJ6KOaCxeI=;
        b=LhO6TcjsIxV3aDqN7BHZfyPlem8Ojs79AT3BtAs8JXOOvFEXgRfwGnGlZneLBLs6Yo
         pEmne5QpRMZcB5aTjPwPI15SL14UW/pv1uR7RnfPL4RC/uw+Cf3t6P2Qv4nw0hLvMw+H
         2Xm9RkCmNpMLDmDgBKr66Vx+dzMjbynkZHvV46hBMmwdsm+P+3cMAuHVYorAHfSv6M6p
         Jp3yRQkvEvhws1G/mrwELkmZXoP+7Mq+HR/Ou7KRrETRlTgz5OOBQDHoxbBjuhQShDEu
         W9Pvvpvm7gSYxSC0vYSMH9b2lLOM0yNgj/XeZiuthVWoy3mIeQ6A9VHUOHVZTX/WaSWG
         FL+Q==
X-Gm-Message-State: AO0yUKVP6JkMaBeF1RqCubvJJwtPkiYJAnwtlD6RbyKM3BRt9M2GRedt
	BuGReoLSKbmlI6BAUJ1WnNY=
X-Google-Smtp-Source: AK7set/YLDaJsWv/fhKmEQXf6N5FPSdTQmFx20p81QkshxCM1jPONv6g7IJ9w1QtYiONvuux1hR6UA==
X-Received: by 2002:a50:9b1c:0:b0:4aa:a172:6616 with SMTP id o28-20020a509b1c000000b004aaa1726616mr502027edi.24.1675707821725;
        Mon, 06 Feb 2023 10:23:41 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id m19-20020a1709061ed300b0088ed7de4821sm5792684ejj.158.2023.02.06.10.23.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 10:23:41 -0800 (PST)
Message-ID: <a94c9b8c-d439-b633-d02a-09d36bc11ad9@gmail.com>
Date: Mon, 6 Feb 2023 19:23:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v7 0/6] add support for MT8195 VPPSYS on MMSYS and MUTEX
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230206091109.1324-1-moudy.ho@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230206091109.1324-1-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_102345_577590_9968EDAA 
X-CRM114-Status: GOOD (  17.80  )
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



Whole series queued, thanks!

Matthias

On 06/02/2023 10:11, Moudy Ho wrote:
> Changes since v6:
> - Rebase on linux-next.
> - For MMSYS api changes, fix corresponding functionality in [4/6] patch.
> 
> Changes since v5:
> - Depend on :
>    [1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=713031
> 
> Changes since v4:
> - Rebase on linux-next.
> - Remove MMSYS fallback compatible.
> - Migrate MT8195 VPPSYS0/1 from clock to mtk-mmsys driver.
> 
> Changes since v3:
> - Rebase on linux-next.
> 
> Changes since v2:
> - Depend on :
>    [1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=681097
> - Split dts settings into two patches based on belonging to MMSYS or MUTEX.
> 
> Changes since v1:
> - Depend on :
>    [1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=681097
> - Add compatible names to VPPSYS0 and VPPSYS1 in MMSYS binding file.
> - Fix VPPSYS's MMSYS and MUTEX dts to pass the dtsb_check.
> - Rename mtk_mmsys_merge_config() and mtk_mmsys_rsz_dcm_config() to
>    mtk_mmsys_vpp_rsz_merge_config() and mtk_mmsys_vpp_rsz_dcm_config().
> - Clean up mtk_mmsys_vpp_rsz_dcm_config().
> - Add a comment to mtk_mutex_write_mod() and clean it up for use in more
>    than 32 mods.
> 
> Hi,
> 
> This series add support for MT8195's two VPPSYS(Video Processor Pipe Subsystem),
> under which there will be corresponding MMSYS and MUTEX settings that
> need to be configured.
> 
> Moudy Ho (1):
>    arm64: dts: mediatek: mt8195: add MUTEX configuration for VPPSYS
> 
> Roy-CW.Yeh (5):
>    dt-bindings: soc: mediatek: Add support for MT8195 VPPSYS
>    arm64: dts: mediatek: mt8195: add MMSYS configuration for VPPSYS
>    soc: mediatek: mmsys: add config api for RSZ switching and DCM
>    soc: mediatek: mutex: Add mtk_mutex_set_mod support to set MOD1
>    soc: mediatek: mutex: support MT8195 VPPSYS
> 
>   .../bindings/soc/mediatek/mediatek,mutex.yaml |   1 +
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi      |  26 +++-
>   drivers/soc/mediatek/mt8195-mmsys.h           |  13 ++
>   drivers/soc/mediatek/mtk-mmsys.c              |  44 ++++++
>   drivers/soc/mediatek/mtk-mutex.c              | 135 +++++++++++++++++-
>   include/linux/soc/mediatek/mtk-mmsys.h        |   6 +
>   include/linux/soc/mediatek/mtk-mutex.h        |  35 +++++
>   7 files changed, 249 insertions(+), 11 deletions(-)
> 

