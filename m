Return-Path: <SRS0=76sT=BB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52B80C433E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 15:22:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EB252071A
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 15:22:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hUzj7bHe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FtSpJ5Cf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EB252071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7tEV/44XfuwE4Cw309dDL7l4i1QgI4QxAvmQqlIlTnc=; b=hUzj7bHelRN1doiXbRtsYqSd2
	g09wVY63hOvo58zBiOZwHkj9QXc27t64K1eCWnYVVqgUpi/XnNtkfqJPhRq1Msh7YgiuKVuUvGLp/
	rNMNbqIIpZXs+ccVkIvfC8kTMlgncJcqNAkQ5zLIFMDFEidTSGRP/nMIn30jQegYu25jExI48FWw5
	sWfcI88v6oLrNacmXxILPLw90Rm6Uy5bQfBY6axfLnDpv+4JtxOa3XVQ399f2thmICIciaKTcG6dG
	j6KA8n0EPqsGu4y+3sTPhS5xt/EYBXsJ78fyOa/EVWk6J+xVj7QZGAaH5Wq03fpc89zc6vh6nIZ0V
	ln7xfEHmA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyGZr-0005W0-AK; Wed, 22 Jul 2020 15:22:39 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyGZo-0005UZ-1D; Wed, 22 Jul 2020 15:22:37 +0000
Received: by mail-wr1-x443.google.com with SMTP id a14so2303369wra.5;
 Wed, 22 Jul 2020 08:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=p46aNpFOGjdCmJUYCpOTrNt8oHQJcuNdSnoUklPY2KU=;
 b=FtSpJ5Cf7uEsr3PCdVXu/ThzroZELAAgxI5XSHKoHhPqICq8j7jJm57MTCQt/FoVJR
 tOUXhYlpE7K4qq8ptOgZWxa1KAKeUT3SXzUgFVP443/7qmqQdjIGNGUeDopmMejdHKdm
 Ss8ULTkAr23R77WM2EMkEF/XKwgOcxJaUs80MTlL2h0028lTEleLHa3fHziIFjmR+kxm
 FYF75ivaIGSyjuGNbKfC5o1axi14RdPHy49kY/7213SQC7skXYE2SpWmY4CcG9LwAnGj
 Kj0Fk1dsl+5hlk9VTa6ksYbSZRWbFZRZ3SIEl2RzvkmVkJ1nxWJQBV1oGNMBM8XvBN8V
 wW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=p46aNpFOGjdCmJUYCpOTrNt8oHQJcuNdSnoUklPY2KU=;
 b=pKn5MM+opaCUhz1V7hSf68s/NJ0DrH/VcJObm+nDyqdwQgQwq1Df+jJNonCvKFHZtO
 eS357lrSc3ofX1mio4cUBe6HVpkTxVjfY5vTJc3VvCcjt68Xl9kJh06tkLkocLgyL4Na
 BRLrg6jtlsJ+46mca/lNn+UB/lHPw7l6g6kIqCKIrI9tA20lntw4v295ac0qC2BEFrr3
 JnTS5kEecfMcfGfqsoaAXrL+Xaa3sxeSgB/doSgml/9SW2u4un4DR0z+YREmdRPWDa6Y
 eOjOnTHC14Ro24gXF9wD60hV9FhXM1acMw3fVM74BTH/fNvgqinM2WLLvq2opjMFgSo/
 AaAQ==
X-Gm-Message-State: AOAM531tZSVPjRuO2i71P2lL474TdTvEi8WxPlv/21Jk+0pV/XSDcEDw
 6l78XlAHDFARTR7kyOOBu7ubwZbg
X-Google-Smtp-Source: ABdhPJzfk+sntvb8MTYNW0SLffM4YqzF4Kt2Pn9rPi7wN6oH604KA4hfxmQUs1CCPXdjrb/zEQoDHA==
X-Received: by 2002:adf:d084:: with SMTP id y4mr69504wrh.161.1595431355050;
 Wed, 22 Jul 2020 08:22:35 -0700 (PDT)
Received: from ziggy.stardust ([213.195.122.158])
 by smtp.gmail.com with ESMTPSA id y11sm271524wrs.80.2020.07.22.08.22.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jul 2020 08:22:34 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] clk: mediatek: remove UART3 clock support
To: Hanks Chen <hanks.chen@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>
References: <1595387397-13110-1-git-send-email-hanks.chen@mediatek.com>
 <1595387397-13110-3-git-send-email-hanks.chen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <3f326326-ca93-1d4d-3a5c-0821aa97fd71@gmail.com>
Date: Wed, 22 Jul 2020 17:22:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1595387397-13110-3-git-send-email-hanks.chen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_112236_153331_ED317BA8 
X-CRM114-Status: GOOD (  16.23  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: CC Hwang <cc.hwang@mediatek.com>, wsd_upstream@mediatek.com,
 YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 mtk01761 <wendell.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 22/07/2020 05:09, Hanks Chen wrote:
> CLK_INFRA_UART3 is a dummy clk interface,
> it has no effect on the operation of the read/write instruction.
> 
> Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/clk/mediatek/clk-mt6779.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mt6779.c b/drivers/clk/mediatek/clk-mt6779.c
> index 9766cccf5844..75f2235486be 100644
> --- a/drivers/clk/mediatek/clk-mt6779.c
> +++ b/drivers/clk/mediatek/clk-mt6779.c
> @@ -923,8 +923,6 @@ static const struct mtk_gate infra_clks[] = {
>   		    "uart_sel", 23),
>   	GATE_INFRA0(CLK_INFRA_UART2, "infra_uart2",
>   		    "uart_sel", 24),
> -	GATE_INFRA0(CLK_INFRA_UART3, "infra_uart3",
> -		    "uart_sel", 25),
>   	GATE_INFRA0(CLK_INFRA_GCE_26M, "infra_gce_26m",
>   		    "axi_sel", 27),
>   	GATE_INFRA0(CLK_INFRA_CQ_DMA_FPC, "infra_cqdma_fpc",
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
