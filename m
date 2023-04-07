Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA2BC77B61
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 14:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9cH7jELgJCXu/RRISlpcug386tFiALgZQ6ITifiCmrQ=; b=0ctM0zVdPBKjL8SGhXd2/S+U0A
	XKTNO9B3ZE4ta0SZByk4YteJiqmlK2P+zdNY8O0zHjErMAXfSNfbqb0AtMDLqPk5TRHPlP13LE0nQ
	uQxKpyjVeW2fhc1Nw5PVqyFd453HXuhpGmOZIh/1YCNE9htl3oZfl02afnasvJi9af/4/qhAA/jvo
	KIg1ebhEbqrSYvfNIe9tjDomFv6heAgggGphGKqqOgZlD3g6GqiC91hlTyyFkcJmtIKVLlxI1ib57
	uMtLKdj7kKpyDW8vy6hW+nK3OTqWgQvRqceQCRxLpfC0FjF7I9nokGhJjSQxKP7NCmutpMlbbzRPa
	M5qp3aTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pknGJ-00AW8Q-1H;
	Fri, 07 Apr 2023 14:40:23 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pknGG-00AW7Z-23
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Apr 2023 14:40:22 +0000
Received: by mail-wm1-x32f.google.com with SMTP id gw11-20020a05600c850b00b003f07d305b32so542497wmb.4
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Apr 2023 07:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680878418; x=1683470418;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9cH7jELgJCXu/RRISlpcug386tFiALgZQ6ITifiCmrQ=;
        b=aj+RfnVjkR+cWy1ftcRXiKAugpLJS2h680OOCRjrq3gkvR91QYKptTzamm76EWbj5d
         FGfGD1bLI84Yl07AE5os/1N8Ximz7b8wKpZi3Pyh7AERMwZQyvC8VQSmYlHOgUsjhH38
         nBteZRn3WKC6h8ds9NBYKUJzUkqFO6dmKe3sryaVBZhJk3qjzfq/TtpdKGkrgYJxvK/7
         V6WhOeoLxSxxTymTL1Eq/HoI02fsDhhupGCVtfop3YqeraRFeOmC4Xlim+D+B4HgXfY9
         1PusmjanfwHSPXWjR58/Js5lHxbr4LyhhDjuW8Z5/Lf58j+3BQyB2ltQX1D5d6s345hd
         n36A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680878418; x=1683470418;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9cH7jELgJCXu/RRISlpcug386tFiALgZQ6ITifiCmrQ=;
        b=x2RAxUUtImb0JlCk0GLa75B+LKzIlDGFqkFB0HMnpqlVHNDWzs7KxYWSZM/N3ExdDc
         ik6Ifs1rWpEgf5/co8dyX2h5rL6RbcgjAmD3oAlxlGYO93iAI9IRBQyyAtB/NvXxVUkJ
         BoGECMw2td+tkJTRt2C8ZQnaH1lPDuWIr6gGRg8pVd3MFtgqhDr4kHl6bMwIKijJpD+8
         758pLSJQ1ADdZncR9al7n0i6iIAeR8vVMhuKckF6xeSq9n1rI1Ken6og0R+KJlO955Y4
         RAhHihw43DIyrvhSjTApVMneLgWy5crV6eCkpooqn1D8CXNT/GTN6OtWdZ2euHcgMDgg
         W1wg==
X-Gm-Message-State: AAQBX9flj+7M1E+A7zqIelamtQHSP8uGJw1fSvP+sXppbwvQZhGOAmPs
	qkwDn7zmu8vTYYBgx228htrChg==
X-Google-Smtp-Source: AKy350aHDxXpozWYR420g8dzLnTqXcG9nzS5zG/r1/ISiuBOsA4YBwyK7Ojw0m7k4W7g+0ZVwpZDLw==
X-Received: by 2002:a7b:ce10:0:b0:3ef:6ae7:8994 with SMTP id m16-20020a7bce10000000b003ef6ae78994mr1583180wmc.22.1680878417896;
        Fri, 07 Apr 2023 07:40:17 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id g6-20020a05600c4ec600b003edc4788fa0sm8784116wmq.2.2023.04.07.07.40.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Apr 2023 07:40:17 -0700 (PDT)
Message-ID: <7eb4c0b9-a00e-8de5-65dd-7a44c0ec2c3a@baylibre.com>
Date: Fri, 7 Apr 2023 16:40:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] soc: mediatek: Kconfig: Add MTK_CMDQ dependency to
 MTK_MMSYS
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 matthias.bgg@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com
References: <20230403093304.276418-1-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230403093304.276418-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_074020_677395_4672C7E3 
X-CRM114-Status: GOOD (  19.81  )
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

On 03/04/2023 11:33, AngeloGioacchino Del Regno wrote:
> The mtk-mmsys and mutex drivers do have a dependency on MTK_CMDQ,
> even though both can work with *or* without it: since CMDQ support
> can be enabled either as module or as built-in, it is necessary to
> add a depends rule in Kconfig, so that we disallow building both
> mtk-mmsys and mtk-mutex as built-in if mtk-cmdq-helper is built as
> a module, otherwise obvious linker issues appear.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
> 
> This has no Fixes tag because the commit that can produce the issue that gets
> prevented in this commit is already in the maintainer's tree.
> 
>   drivers/soc/mediatek/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
> index d6b83a5508ca..a88cf04fc803 100644
> --- a/drivers/soc/mediatek/Kconfig
> +++ b/drivers/soc/mediatek/Kconfig
> @@ -76,6 +76,7 @@ config MTK_MMSYS
>   	tristate "MediaTek MMSYS Support"
>   	default ARCH_MEDIATEK
>   	depends on HAS_IOMEM
> +	depends on MTK_CMDQ || MTK_CMDQ=n
>   	help
>   	  Say yes here to add support for the MediaTek Multimedia
>   	  Subsystem (MMSYS).

Hi Angelo

I guess it should also be done for DRM_MEDIATEK, if I refer to the lsmod 
result:

Module                  Size  Used by
mtk_cmdq_helper        20480  1 mediatek_drm
mtk_cmdq_mailbox       20480  1 mtk_cmdq_helper

Or is it maybe enough to protect the call of the dependent driver with 
IS_REACHABLE or IS_ENABLED helpers ?

What do you think ?

Regards,
Alexandre


