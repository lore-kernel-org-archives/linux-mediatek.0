Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9427CC7EE24
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jun 2023 13:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AAVo5XJBmcZ1CILHNv8SMdAaagpninriUMxTg11Co/E=; b=haJN7QaQQELJYQD1qjtd/rvpOu
	S7aw3sqH7Ijoob+UNd5WGjIPQigr6fbSFK2Lw/w8eNvO/QFANePtFMS//tWP44hfC482KuhLbmiHj
	bNpRazRrl2CIXq7Q9gpJ5tUnw2G7HkBPDloYwHE5zPPlXhdl+fFcBU3Ud4ctw5EJt7DcYYJv2cTGI
	0BdseeuAX5t9icFetcG3Ior3cjxX4KoIRbJeBWheKGbkq6DWXtKfbmVi/MFvGVr4O+0aM0h3Wn5uq
	n1TtdXorFwc6YgcFt5Sd1Zsyudhb7ZlLluhgRG8N1PUViC//gGc36X8PB5YPjqaaOda2oyI7bBOdx
	mak0iCVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6A9o-00Faws-1q;
	Mon, 05 Jun 2023 13:22:00 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6A9l-00Fav5-16
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Jun 2023 13:21:59 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4f619c2ba18so2609341e87.1
        for <linux-mediatek@lists.infradead.org>; Mon, 05 Jun 2023 06:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685971315; x=1688563315;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AAVo5XJBmcZ1CILHNv8SMdAaagpninriUMxTg11Co/E=;
        b=3l13dOF1IYsdmxWjy4gVBxm9mP0dSRgkbeDydZj89p6KSERrNBrlgUF9ZiLQsu8ZMO
         98veLuKCuihN2OluBxFYHCZOrQHvFcmSWlsu4AI2agA1zTprkYPIrXNNbnXtSsaWkLxH
         O3/l2/5D6iYmYs0L4o5wHlW3ohDgh9t+BqY3w1Hh1fKtmmPh9L791z7SKtOZ74tKd40P
         zxDFG+1ww5fWag616iq03kZ+TIre346llSOCOoHDNPjqa0HsCL1EzkpiszzgoLcIpuiB
         nCJvRpf26t/XE2dsdWozdG/uHYPfL1zXYJbUvG1qNMH2BmuOdX6D5spT+3/m81kMlgoX
         ys7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685971315; x=1688563315;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AAVo5XJBmcZ1CILHNv8SMdAaagpninriUMxTg11Co/E=;
        b=Y6Mbl6Y+wzxzJ5YpAGvF+PQgeciFRNR1pDEZnAMJXGelBnKYl31cS1cisn+qvsWL2h
         D66409VD1LwwzWVaClJ34T2/xPhCBNJqrs53ydXt6J/DquPbUJOzT1anItKBlTso0JHs
         8lchM8P1sE7xlZSGLy+rbU8Zp4iutclvDqu3mQK0k9+1RkcCRQErb6ngn2qwP0QdvHGU
         MN0I9HM5Ip26kHOQMty2L/VfoemNvkDIBaIoqHBwMaw9GD3MXacxjQf839xFHNw2EZHD
         m4JZdr8uh4uEUVPVI9WUEg+5m8xx4BXz+K8YTzWlwbdktUpljOrOPxtkCypNhdBRx8Gv
         CxEA==
X-Gm-Message-State: AC+VfDyOhrtwBufpIkbtRNwX+cYQKD892xmq51cqrSUdNsjLroHm+qkD
	3Qs/ZqBlKKNp73YVT/9hoIjPQg==
X-Google-Smtp-Source: ACHHUZ7Cp/Uhp6/Wpl9DeYjd1vvYra/v50oGeZW7mP1XrLzgq01OEH+9/gZgXDUd67xf7/rarGL7pw==
X-Received: by 2002:a19:7609:0:b0:4f4:ca61:82ba with SMTP id c9-20020a197609000000b004f4ca6182bamr5030485lff.67.1685971315388;
        Mon, 05 Jun 2023 06:21:55 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id l17-20020a1ced11000000b003f4266965fbsm14439285wmh.5.2023.06.05.06.21.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 06:21:54 -0700 (PDT)
Message-ID: <d94b5f07-aa37-f4ec-252b-ff1a96b89326@baylibre.com>
Date: Mon, 5 Jun 2023 15:21:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/2] ASoC: mediatek: mt8188: fix use-after-free in
 driver remove path
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Cc: dianders@chromium.org, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230601033318.10408-1-trevor.wu@mediatek.com>
 <20230601033318.10408-2-trevor.wu@mediatek.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230601033318.10408-2-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_062157_590267_CDA8C38D 
X-CRM114-Status: GOOD (  10.20  )
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

On 01/06/2023 05:33, Trevor Wu wrote:
> During mt8188_afe_init_clock(), mt8188_audsys_clk_register() was called
> followed by several other devm functions. The caller of
> mt8188_afe_init_clock() utilized devm_add_action_or_reset() to call
> mt8188_afe_deinit_clock(). However, the order was incorrect, causing a
> use-after-free issue during remove time.
> 
> At probe time, the order of calls was:
> 1. mt8188_audsys_clk_register
> 2. afe_priv->clk = devm_kcalloc
> 3. afe_priv->clk[i] = devm_clk_get
> 
> At remove time, the order of calls was:
> 1. mt8188_audsys_clk_unregister
> 3. free afe_priv->clk[i]
> 2. free afe_priv->clk
> 
> To resolve the problem, it's necessary to move devm_add_action_or_reset()
> to the appropriate position so that the remove order can be 3->2->1.

Sounds good

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre


