Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F0A3EE7FF4
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 11:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ww454ABm0e8trsLnc33ejqXe5wnztAS93RgRcAuT70E=; b=JBzdEt/UKfB8Lu4pOBp+HcUf9D
	k5EErPHhCP0Jum8bMnt9Lt53kXWQlvNQFeva/+ZHxph5SycwODW1dfQT+iKx2ax/u5cvo92xPoWl+
	Oyj1JV4zUvl9ShaTOwXlyOh7m9H+tIwCovOtDmxRoIp7CRad+PRzVrhofZVV/KK5MKnSsheCwj27+
	K6JP3T3TxWCS9a7GW3dlsdVH5F1W2lW5cTRDHQJIdtu0lWdYVcrBVRNUVXJQoQucbi9+HML+qAp5U
	/Q9oUZtc4aHeL9lPvgWBVLtDA6VabbP5ANmHHBZ3XAEbEVl5PscCvvr0Mo8IoRkkCc0G0cfzrXLuK
	cqCDtchg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qffRr-000Pqb-1g;
	Mon, 11 Sep 2023 11:51:23 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qffRo-000Pp5-2a
	for linux-mediatek@lists.infradead.org;
	Mon, 11 Sep 2023 11:51:21 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-401b0d97850so48333945e9.2
        for <linux-mediatek@lists.infradead.org>; Mon, 11 Sep 2023 04:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694433077; x=1695037877; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ww454ABm0e8trsLnc33ejqXe5wnztAS93RgRcAuT70E=;
        b=brH3397Aa0eRvD9ZYNuf9GMzZKs/jNkVUujgoe9QMyqVUtbnBrg29gCk9CFPGCw9rg
         9Ilk66EPKeUBgGOYs2+DKQWFGIwo9VEmx77RMOhKFUVdYWkNO13SntQFsAUwcFt9LaQ5
         VOcxqY1BMkZROFf/QNKF9TtutNH0QVEPJvC5os2cpl/JNVplAG70masgP46rmlgclJ0F
         /JIeWwHF1vY+8gp5keVLcqpM6w330+drQ/V62fSeg98x6/fskJENFOYjGmYmBV0DDOSq
         I0ph2mAenoFltGb3MLakWTucD8OeAq+BY6TZE+r6AXCxVg+LSCzLhrZ+6fmuI03klOeX
         0/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694433077; x=1695037877;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ww454ABm0e8trsLnc33ejqXe5wnztAS93RgRcAuT70E=;
        b=sMB4mtIhO41RdFvm7JlcFfHjjwPlWDzU3vnF+0p4B3AMqkKbh3kklSLUPpAIjVUaIL
         57iw6+VJB1uB9eTWk4mBsCrzNmGu86bqRUjuQvieGq+RGBgAWnc6n19Ya/h/t39Ao6H4
         YHSZWgx9gm32UQii+vqP6eIpFqhaj6CX6R1NjEs1UqrB6EOvSOpCGepUWC43Q6cWruo8
         ueMQSyCByzeXYQrFwksumqjZmEzh4l9N+MHvzQ9EIAiMJwoC9hdNX/z5ameiwjKOViRQ
         rLAO2xhCQtqqWSr2MbtH6OAJilolxE4VUs/HRYRm39rgQQGMvj02BpDRSMkrD4camso6
         7h6Q==
X-Gm-Message-State: AOJu0YxPn+PaoHcehZSilZl/V0h1CcbZ0+W5DaiceTNPVWbxAdK9pMiR
	DRY29iglVdHKZ6I6njw9uj7p6g==
X-Google-Smtp-Source: AGHT+IEC51HEOzB8YLu5pRlRlfDq6GnSU+STLPmLRPMCzXSUm1O2JEARrpIN5nbrnIAngXmVrT+ruA==
X-Received: by 2002:a7b:c7c6:0:b0:3fe:f726:4a94 with SMTP id z6-20020a7bc7c6000000b003fef7264a94mr8824039wmk.14.1694433077663;
        Mon, 11 Sep 2023 04:51:17 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id s14-20020a05600c044e00b003feff926fc5sm9750210wmb.17.2023.09.11.04.51.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 04:51:16 -0700 (PDT)
Message-ID: <a5321150-4ace-9bd2-fc5b-462a4ccc130c@linaro.org>
Date: Mon, 11 Sep 2023 13:51:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] arm64: defconfig: Enable DA9211 regulator
Content-Language: en-US
To: Vignesh Raman <vignesh.raman@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Cc: angelogioacchino.delregno@collabora.com, helen.koike@collabora.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 david.heidelberg@collabora.com, daniels@collabora.com,
 gustavo.padovan@collabora.com, emma@anholt.net, robclark@freedesktop.org,
 robdclark@google.com, anholt@google.com, robdclark@gmail.com,
 airlied@gmail.com, daniel@ffwll.ch, jani.nikula@linux.intel.com,
 mripard@kernel.org, dmitry.baryshkov@linaro.org, matthias.bgg@gmail.com,
 catalin.marinas@arm.com, will@kernel.org, quic_bjorande@quicinc.com,
 geert+renesas@glider.be, arnd@arndb.de, konrad.dybcio@linaro.org,
 neil.armstrong@linaro.org, nfraprado@collabora.com, rafal@milecki.pl,
 peng.fan@nxp.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20230911104139.617448-1-vignesh.raman@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230911104139.617448-1-vignesh.raman@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_045120_835095_462606A4 
X-CRM114-Status: UNSURE (   8.94  )
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

On 11/09/2023 12:41, Vignesh Raman wrote:
> Mediatek mt8173 board fails to boot with DA9211 regulator disabled.
> Enabling CONFIG_REGULATOR_DA9211=y in drm-ci fixes the issue.
> 
> So enable it in the defconfig since kernel-ci also requires it.
> 
> Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>


Your CC list is a bit too big... Just Cc Mediatek SoC maintainers and
that's it.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


