Return-Path: <SRS0=4IUA=KW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 001BBC47089
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 May 2021 15:31:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9ADC611C2
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 May 2021 15:31:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9ADC611C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=13b0Ki1VLPWOPNm/vQraqAwjwSoPWJLEAmmeioipmUA=; b=d1L4SI5IcXy6Mm
	XnTox48PZazqVhizDC89kWl+93v+xWxjaJAPnbL0MsJE/ZrddgBEPwz+ewB5VD7Q5KzlCts0n5s08
	re9uWBuRw7m+nXHD8HbQLls5TtGnnR6SfzT2+ADkVNdJn60pvAz0ILsQ3XgW8LAfog9WB7LsY6T0K
	aKsWTKtSRALEmXRPllViL7esYQxJRe6VYjimQ/mdi8UOPRQecwIE6F1U6MPLaR5qsj/yi2YWEAoPd
	2Ib/0j9A3lnqEcFqmVauG/89K6ip8EaCMz/dsAWnoihQd8Qp9HV/HRZfB/cL02djLckGmq/tmAfXD
	Vm7e1MqXOvaICxouysQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmHz3-007Eh6-6m; Thu, 27 May 2021 15:31:41 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmHNM-006wMR-GB
 for linux-mediatek@lists.infradead.org; Thu, 27 May 2021 14:52:45 +0000
Received: by mail-lj1-x230.google.com with SMTP id v5so1153737ljg.12
 for <linux-mediatek@lists.infradead.org>; Thu, 27 May 2021 07:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gbLxZVInwYy3qEUPV3OX+LQ3zzJzdzfdzUhZD/Ue/bg=;
 b=IXaIB0Nni2fs5B9gNNEfAvL6rmSOEETjRJ/6oEyfVHXghb3kgUg5GcpBXZZ5o+QqOb
 BpYowFocYox4Dq6gQqpolGYEgPeDGD4jrOSe0QOLHDyAV4kDhyfhux5IrYQR/3p5pdou
 a7EIH9Yl/4mrlSnTAoRB+GkwaCFAc0hZyOr1XCIIpjv8ki7NI5biYt7unOV5aZD4J6AE
 GUDpKQZVA1zZutLCkh2ESBMk5MbJz1w8dAMr+VWqPAAYVFPlKHwXu4Hk4xQizJXbrKwB
 gRQ2ILP4/A8czIxl+WoMxXeqvspc+DZTiol3sw7MQvPNITxf4Mch+I3XKX7NNkNuqQaS
 8ydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gbLxZVInwYy3qEUPV3OX+LQ3zzJzdzfdzUhZD/Ue/bg=;
 b=mexYq1N5eLj8JDbmgoisQmpULMqMMXUAEm60GvOgmyj+2sRkqD5K26QQMLUZ0ROX7Y
 fCz+9qcUIs3pid0jShVH93Eiljl8aGAkxrDXzjHvJyo48lAhJp2xX+XOBOvRJzooX7Lq
 iuOviAT9NNOs79NSBHmym5zrKRNFq7LAqeTBSPuJlrCbyGLbUjJX5tVljgQwsU0XxfRv
 Jei8li79bzD4F050vRK6zGKyvnB74L8/6kpL73rTf8xWUkRQe4F4zorHg2TarxJWeuHQ
 rcNRM5myHI0LWED9tdxOKL6ABIAfznj8ylv/R40a/o/MtCPSOiwU5XzQ9AcsmYpONARv
 IwOw==
X-Gm-Message-State: AOAM532hOpSoWjVoLBVUH7aUxJZv8C+ghNQuTmPVjudDcyZFRmfgRxE5
 hRhzaG/Q1OHy1X2GTcIiIaVf3KuSjj6g1E5CPSVf8A==
X-Google-Smtp-Source: ABdhPJyOpPFO04F64d5pjW8QNYZ4e/HRx7gpPeHxd/mRVrxX7uKsLF7S1bM0/fx10bKuhTzUYcQo7VOPcuN/I7RO4+w=
X-Received: by 2002:a2e:22c3:: with SMTP id i186mr2978367lji.273.1622127163004; 
 Thu, 27 May 2021 07:52:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210519162409.3755679-1-fparent@baylibre.com>
 <20210519162409.3755679-3-fparent@baylibre.com>
In-Reply-To: <20210519162409.3755679-3-fparent@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 27 May 2021 16:52:32 +0200
Message-ID: <CACRpkdbQtBYMU80dXB3n179QQqpD5Cp7_q0MgEX264EeP_G-8A@mail.gmail.com>
Subject: Re: [PATCH 3/3] pinctrl: mediatek: add support for mt8365 SoC
To: Fabien Parent <fparent@baylibre.com>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 mkorpershoek@baylibre.com, linux-kernel <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_075244_596072_FFA7D3BE 
X-CRM114-Status: UNSURE (   8.43  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, May 19, 2021 at 6:24 PM Fabien Parent <fparent@baylibre.com> wrote:

> Add pinctrl driver for MT8365 SoC.
>
> Signed-off-by: Fabien Parent <fparent@baylibre.com>

Patch applied.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
