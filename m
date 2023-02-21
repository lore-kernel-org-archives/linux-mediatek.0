Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BAF9C636D6
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 03:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ULibvphzro1D/98vWvfLMdiA81XUXKtqF+j4eYxfmic=; b=hl8S+6VnpsrZ24m8c3a6SgwwNB
	X2jQ9oRJsWpa/ZCdLLLrBluc7Poe40VIaBjo2lKd7gHPxhZwZoDnXYxWGt9Dv742Tp5b8FUbW0Zq6
	63fURjvv3l8nix853h5IBZguhzjCBR36II5Zc6/Z1ViGMXCpH169zM57KJNGhfUkftmWHE4kvUGLm
	mjN1BmhwTd6B6QUNkXJgGVIJYpq7sonR+NN4CtXbJFt/toKxsBINCZkKEyV/myK1Qak9MfsGQTvBA
	yEgcZQsBQNfg/Xcausr58Lu29g/WqcStLXF9zWfLK1XXOorwRTABAuZTxDzmhh6nSf1I6B1PDrvgU
	j3V4dGmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUJIF-006QqV-Vu; Tue, 21 Feb 2023 03:26:15 +0000
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUJI6-006QnW-8u
	for linux-mediatek@lists.infradead.org; Tue, 21 Feb 2023 03:26:07 +0000
Received: by mail-ua1-x92d.google.com with SMTP id d12so206500uak.10
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Feb 2023 19:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ULibvphzro1D/98vWvfLMdiA81XUXKtqF+j4eYxfmic=;
        b=RrKZTF1jnLdV3a0kGJHaExjDHfO20XWEcPPkfAhXPb2Vk02cA7AfXQDSNzMx7JMS6B
         Uo5GVpZuNhRm/1SzVdI3tCMfZpZBvFKsNt3d3OBy+AhdIoDfcMPu16K4z8LfvvhmrveN
         wXw0WewUMcbD7nsvM9PKjAAJvwI6UplrjSS4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ULibvphzro1D/98vWvfLMdiA81XUXKtqF+j4eYxfmic=;
        b=daqQWLvmGyhrhY3kXerAaT9APjBdRftJcOC4xIn3yX693nVg3Ztlcaiumx+19bctmQ
         PB0b9ly3vO4ID8s6Q0rrQqYzzeg5rtz76ypLNCSStF34fEoqQ5TxWoTKRQvgYzAYog6d
         qokVmk0sOKexcpBklUJtdvNWgUN3TbaYtYF0jq6SoKw4OD2OzwHIAAEJF77LOznihYV8
         m6+5LzIvUJbieVJROc7AR3E6bBm1+hrgtP22x5Q1y1gS2+1qNz9N6Nb/hISvpa2aWILr
         WJ6Yhb8ouEe3RyjRRLA9OL19ADzGlP0eaRZaoAOhkCUG3CfU4p+EAUGp6lvIl7mEX+dZ
         lsQQ==
X-Gm-Message-State: AO0yUKXeS8aE9FLNiyP79wqWxh522pCCaOwD5JG3PrN1Lw4zMZV+vTf6
	AhbAmVTZYUocmlFMw5zTzshDditSb1jovT8Zywrb+g==
X-Google-Smtp-Source: AK7set8xWP4VDK1zpzVf35dhRjpPCPCvPMYTxP1UoLD3FNmbqHdbOhuvm16GTBZ9oS4Ysc0oQtkHPSJYnmTdH4nHLSs=
X-Received: by 2002:ab0:53d5:0:b0:68a:5c52:7f2b with SMTP id
 l21-20020ab053d5000000b0068a5c527f2bmr531329uaa.1.1676949964782; Mon, 20 Feb
 2023 19:26:04 -0800 (PST)
MIME-Version: 1.0
References: <20230220150111.77897-1-angelogioacchino.delregno@collabora.com> <20230220150111.77897-10-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230220150111.77897-10-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 21 Feb 2023 11:25:53 +0800
Message-ID: <CAGXv+5GJqu_xE4EOTFmeNJxLPM7zL-z3Cg22t9mFd=-Yp8B9mw@mail.gmail.com>
Subject: Re: [PATCH v3 09/55] clk: mediatek: mt2712-apmixedsys: Add .remove()
 callback for module build
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
	johnson.wang@mediatek.com, miles.chen@mediatek.com, 
	chun-jie.chen@mediatek.com, daniel@makrotopia.org, fparent@baylibre.com, 
	msp@baylibre.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com, 
	zhaojh329@gmail.com, sam.shih@mediatek.com, edward-jw.yang@mediatek.com, 
	yangyingliang@huawei.com, granquet@baylibre.com, pablo.sun@mediatek.com, 
	sean.wang@mediatek.com, chen.zhong@mediatek.com, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_192606_333243_3C91393E 
X-CRM114-Status: UNSURE (   8.36  )
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

On Mon, Feb 20, 2023 at 11:01 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add a .remove() callback to the apmixedsys driver to allow full module
> build; while at it, also change the usage of builtin_platform_driver()
> to module_platform_driver() to actually make use of the new callback.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

