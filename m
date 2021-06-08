Return-Path: <SRS0=WQwL=LC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DEA5C47082
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 15:38:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0B656128E
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 15:38:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0B656128E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=IsktZBgfWNAt7JEDAN39iozpxGDMKd3ZjM25W0il1mM=; b=3Ipa+ULTWzuHKOC6IKYAof+2I6
	459zpDi6wO1mBHRZXGqYEPQ7kGNCw0DTABfmCQiZ4v+MvD1+stJyfkk4EOQA4TCjVSAOFSseUnXll
	HjXX4OG3mrihpsYh2UxiNYwAnNPd5yR+1h8ENYHh6MALaWMjNIx6/RcljcosWUfts64WdqEPs48v3
	uHNrojQlWU8HSqQY0e2LyutqwXqI32HgrzTn7+joW+i/Qj4nsUer8+SfV+QSuWvP4/V0HJf9WSr9a
	5rukgRp4RyGOdymKTuRTyIV3zo6XO6jcGlgkbZ2KdWnYnx9z/KuAJDk9r21ZiR0AaazdpVmb0B4L2
	Wx0lkG1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqdnp-009GtT-2q; Tue, 08 Jun 2021 15:38:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqdnn-009GrM-Fs; Tue, 08 Jun 2021 15:38:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=rtkVCqFclfnOcLFY42eNuHtMCdPaEEdnvA/5RSK3Neo=; b=a3O3X0pgIeU+bsl4sO4woy9/er
 RBq3ITK/1+84DjqNJ//RpwqhSdPSLzqqyZbe7ByaB2TuTL8vk2E7PwQe/8GEFzHg2SBCzzDkGvMPt
 iFggPElAeuJvrVN7OrdOfbd+LEdm7c+l7lJekxi8LjF4I22kGXxMC4aos4u/RmyTuOlYREaRCTrEn
 CxrNdnqmResXM3hwvCq2h4cTycGxZwYLW7WFCrir4ieUHfhr+WmviNIhrerjKWR1z2pexmPwMdu3+
 tFWf+4FB+IjSaIfk+RYwGEcgtvsb6MEKVyVl9nKJBM9HczstXzOMVRG4/9AwLRQS/MZypBJd+iDaG
 Wpv6Vb9g==;
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqcym-004mRj-Jh; Tue, 08 Jun 2021 14:45:29 +0000
Received: by mail-wr1-x435.google.com with SMTP id m18so21894265wrv.2;
 Tue, 08 Jun 2021 07:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rtkVCqFclfnOcLFY42eNuHtMCdPaEEdnvA/5RSK3Neo=;
 b=OUBXvCeD9OYornl3soOahgtmJcOzVqmQiEVx8GLNnhQuBh2bwNzCaqw8RBb/k6zO3D
 CuYPShloxujbXmPALdD+GCxeavHtP17oyXahd/gGrQVldj/uumS09uDAhWm89qQZ+dHX
 nBzE0JIpC+zEowOd8QhzXELVmkxc9/Pp9gr93zSGv4A4d9c5BJJLZCgIgS4Re1cEi1dp
 hAyxW0WKBZ6N3fMC9Y2P4+ql7VUzQsje0PzORNy3R794+lb8j/5vpGRd8GK47ti/ve7N
 2FEYq1uQDhFbuJT3H7MX/+vpVG+zsB7Eu+2w2YsvJ9AsCQQd5mdKwwQQKGiK39qZsR8f
 SPrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rtkVCqFclfnOcLFY42eNuHtMCdPaEEdnvA/5RSK3Neo=;
 b=m1noAO5GMypINm6qJ8zivAJZU+rJVV3b9Jc9qNyx0AnNIOV7E8azTEgPb2eXrrvxQN
 nP5EK2Xkdv8tA09jukJlEQ/GTlc6gHSI1xTePaxMWzyCOvM1fQDd0Nyoe+xba/nDI5n8
 1QS0xsOAh5HSwElnipLnJdL6SWI0PWbD6jz+b3FDth2Imc+x0IE81ZkfVRCANFVrjSgT
 sBOt8yMxlbdo7fFY5BvyQf+Ux2/6YxjfyBhm5X6gT+XaxRRDJI4RBnCrqRY2VWTNDksU
 oh4+Telq34kOdbJJ6KfNGc5oSQcYfp8G8eX60cYy08MUzY5kJ0ZtjJK0WCEgd9xqGDs4
 4mmQ==
X-Gm-Message-State: AOAM533GarPxTz66AU6dBLLhHuGak82h4JtQtLo671o61ilCNmdAsnJk
 RdDlHMdtCkp9HbknBnX4Xgk=
X-Google-Smtp-Source: ABdhPJxTX/UEWVJz18ubogTqfMHuCm7GF5j5zRHG8OHa8ANdDbrg50wM2tHe4ZD5CIkI91tVAv1Vnw==
X-Received: by 2002:adf:e8c1:: with SMTP id k1mr23839945wrn.413.1623163466265; 
 Tue, 08 Jun 2021 07:44:26 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id j1sm17886775wmi.44.2021.06.08.07.44.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 07:44:25 -0700 (PDT)
Subject: Re: [PATCH v9 18/22] clk: mediatek: Add MT8192 mmsys clock support
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Stephen Boyd <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Weiyi Lu <weiyi.lu@mediatek.com>
References: <20210524122053.17155-1-chun-jie.chen@mediatek.com>
 <20210524122053.17155-19-chun-jie.chen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <7520a10b-b362-03d4-e41b-e2098ae26621@gmail.com>
Date: Tue, 8 Jun 2021 16:44:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210524122053.17155-19-chun-jie.chen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_154527_523095_3CF000CD 
X-CRM114-Status: GOOD (  19.50  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 24/05/2021 14:20, Chun-Jie Chen wrote:
> Add MT8192 mmsys clock provider
> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: chun-jie.chen <chun-jie.chen@mediatek.com>
> ---
>  drivers/clk/mediatek/Kconfig         |   6 ++
>  drivers/clk/mediatek/Makefile        |   1 +
>  drivers/clk/mediatek/clk-mt8192-mm.c | 108 +++++++++++++++++++++++++++
>  3 files changed, 115 insertions(+)
>  create mode 100644 drivers/clk/mediatek/clk-mt8192-mm.c
> 
[...]
> +
> +static int clk_mt8192_mm_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *node = dev->parent->of_node;
> +	struct clk_onecell_data *clk_data;
> +	int r;
> +
> +	clk_data = mtk_alloc_clk_data(CLK_MM_NR_CLK);
> +	if (!clk_data)
> +		return -ENOMEM;
> +
> +	r = mtk_clk_register_gates(node, mm_clks, ARRAY_SIZE(mm_clks), clk_data);
> +	if (r)
> +		return r;
> +
> +	return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> +}
> +
> +static struct platform_driver clk_mt8192_mm_drv = {
> +	.probe = clk_mt8192_mm_probe,
> +	.driver = {
> +		.name = "clk-mt8192-mm",
> +	},
> +};

Did you had a look at drivers/soc/mediatek/mtk-mmsys.c? How is the MMSYS
different from all the other SoCs? I suppose it is not. Please don't just
implement the clock drivers, but check in existing code how they play together
with the HW they are for. MediaTek unfortunately has the design to add the clock
registers in the address space of the IP block that needs this registers. Which
makes it more complicated to implement clock driver in the first place.

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
