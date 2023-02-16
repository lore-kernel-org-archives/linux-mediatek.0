Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94137C636CC
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Feb 2023 10:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OikyZqRmoD0C+GYQ1KT5tc2T2n1ELXXRZ8rYdWGUuJk=; b=STVTXE6NXHiX08VbG48dGEyLYh
	dbTufigwywhZc/PoyEjEc+XmkAwDytQjtlQj0fzWV2Bf9y9hIq1ReEjWlMN53GSlC5LsiJ9Cjz3tF
	mN6ixtuy+mJg6ueGJ21itVqzqYY31ohpmOHUhxkEYwPOQ3GW1rTAfmFF8dlzt9V+zj5KU6Tu8kTJ4
	acv2WPVFyFfuEVPPjiIsSV9y6Ij/eUwmFG5/h80Kui4GWPpns6dSmmu6mWiwKJt7ELM7OjEITujhb
	NKND4fZBlYVCh9mHmTWP/hsinZsZO+OGmBqTWenfIp+TmZY27r2O2us54rfUT6kMaFTNpEDKmHH2b
	iUkEuARw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSbqo-009iq0-CC; Thu, 16 Feb 2023 10:50:54 +0000
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSbll-009gM9-IK
	for linux-mediatek@lists.infradead.org; Thu, 16 Feb 2023 10:45:42 +0000
Received: by mail-vs1-xe32.google.com with SMTP id m1so1464260vst.7
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Feb 2023 02:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OikyZqRmoD0C+GYQ1KT5tc2T2n1ELXXRZ8rYdWGUuJk=;
        b=RrQPWJV+c8IYzi438eFajsT0qqU5972irIrlYlC+toscyWM63GRyvTL2iUyy2NnSmv
         8bNPm7/rdH8yqPmCLipD3iwwKr7YDXiLOYe08og59qJqL+hurOB73DB3AJqMqS0CTZX3
         BkwxDqvs7v7rYRkRl51UkdXSinlG7mblKQuLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OikyZqRmoD0C+GYQ1KT5tc2T2n1ELXXRZ8rYdWGUuJk=;
        b=CNTIZCQE7hAqupoJaA79d59i6qqnmoU3AJ+pRHuhP/TCKpzjsf4qc0wAJABJOwIPtn
         7UB9JiLyu9n+0rG2/LRoJdiXgdh2ktKYJ7NV+pp04+MaLn9QcMCa1CHzwnkaxRl7kSan
         Ufmpx4QsWag8gthddAyA+YDb0on4qr04YDSTmvGYbOaL++LjKoQa3kQZZeb6vmI4UOcw
         GHLiHv47zyQI9s/+Lx9iUlI54cclaRSEBST93yGt5RAlYRXsLXCzMDzhDp2B+BPE7PiL
         KuFgh02TNpcle+XeRLVGl3wU82QXLyvmNrrD5jV0kgmv6hwDgRZgoD/FClczOuGlNF4F
         bFrQ==
X-Gm-Message-State: AO0yUKXydFDRbdf2Z3fP/EE/AfN4fR3R66Dk3r9VrBOoJ8m2rjEIk9Xe
	IBDKYmyKS4nXpgM13TNtcPIZhM3fk9UBk2PsGZCjWg==
X-Google-Smtp-Source: AK7set9oX9ednFxOPyR1C2ACJClKhPaeGavzOb7y1NTEL3RKv/WKFcHuJe8veNw15alFWHK4vAigihyINbLkC/m5MLU=
X-Received: by 2002:a67:f749:0:b0:3fc:58d:f90f with SMTP id
 w9-20020a67f749000000b003fc058df90fmr1008836vso.60.1676544338052; Thu, 16 Feb
 2023 02:45:38 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-23-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-23-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 16 Feb 2023 18:45:27 +0800
Message-ID: <CAGXv+5FcBHur0sS7aS5TQ8jDLbAXKk36BC=GMQ6Y0-NmsQQ5wg@mail.gmail.com>
Subject: Re: [PATCH v2 22/47] clk: mediatek: mt7622: Properly use
 CLK_IS_CRITICAL flag
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
	johnson.wang@mediatek.com, miles.chen@mediatek.com, 
	chun-jie.chen@mediatek.com, daniel@makrotopia.org, fparent@baylibre.com, 
	msp@baylibre.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com, 
	zhaojh329@gmail.com, sam.shih@mediatek.com, edward-jw.yang@mediatek.com, 
	yangyingliang@huawei.com, granquet@baylibre.com, pablo.sun@mediatek.com, 
	sean.wang@mediatek.com, chen.zhong@mediatek.com, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_024541_644282_2D80DE7D 
X-CRM114-Status: UNSURE (   7.00  )
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

On Tue, Feb 14, 2023 at 9:42 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Instead of calling clk_prepare_enable() for clocks that shall stay
> enabled, use the CLK_IS_CRITICAL flag, which purpose is exactly that.
>
> Fixes: 2fc0a509e4ee ("clk: mediatek: add clock support for MT7622 SoC")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

