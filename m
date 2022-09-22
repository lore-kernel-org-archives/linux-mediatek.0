Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 689CDECAAD8
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Sep 2022 19:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NWcgMuOu/DRb30hVDSf+gjGKztVe28VznYCH2jRwr2w=; b=nvvLzbdeoICHr9WHVtIzMG7WQL
	sZf07xB072ndwdwE79cL5NtlO740tGFdbctXirs1t+0wJ0CWBOLxAetTGr4tSXcWRRWQ9OukMs+95
	gwMq6cINYgHDyLokfB6Ko3NF63cI+YcyOQ1JPwmmuvcSfnU7U2Xgsgu5aJ56ssqVYX/nCfuTlHLOr
	QPvXsBAsiCidEnCg8zd4dP8mE5rVsYPUNOvV1FBByLbEPE7hzp1Ih8oi9q/s83NTS/0oxY0ggjcd1
	KebuXq+NeGSwsxTlR2y3JMVMOjLvocDro7y7KXaJ1df/QWh0gDZGYA3alkVHttcezVIfiqJyshgFJ
	groFkKlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obRui-00HZK5-HF; Thu, 22 Sep 2022 19:31:12 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obRug-00HZJJ-6G
	for linux-mediatek@lists.infradead.org; Thu, 22 Sep 2022 19:31:11 +0000
Received: by mail-qt1-x835.google.com with SMTP id s18so7046135qtx.6
        for <linux-mediatek@lists.infradead.org>; Thu, 22 Sep 2022 12:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=NWcgMuOu/DRb30hVDSf+gjGKztVe28VznYCH2jRwr2w=;
        b=Uv1U0RJbEpqFZrbA9uyr91kswnGSB3cjK6Aj9EXiOeZ7e0XWQub4bxwG+sbRw5QAA4
         44JMp1BuOrUDUJ0uP0C6KSA8VHC/IuXF6Kqv6lVLWrpR8Nw200fkrYzWK0LLM3GfbgbA
         NCqH1+i21BykwSS/x2OqgxCdNhFdsFfsXRuCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=NWcgMuOu/DRb30hVDSf+gjGKztVe28VznYCH2jRwr2w=;
        b=BwOc43iHF+nwq1v4oWSkByEQaSFmHUoIDGhzadAhquggvi1KtYQL2IMr4KV//OJDEW
         Scn5YomirZEC8yf6AKE2pZoIO8y6D1lC9k/2ar5y/3QqcoNJz85yvmcaaNwQV3E+dIGs
         wICIBPmcSeVSaMknRUmGCEmkK3FKAWad/10BcNhN1O+qJevnz4K48ROImbU08hOzqdu/
         kl0ghWdHd8ksq5eSNySIbbtucjToNN+tPLZygU2ohkgqo7y78HQN244/mIgYLmvPispv
         bDFBIetNsUZZr44IVEz+bT8I1jkcnUkFF9VKAfFUe+Mm+MQTXNoxdC8VZ2fyivtO5qy+
         7Axw==
X-Gm-Message-State: ACrzQf3hXNUzwPh0ebEm5OgFvO7WtdlUtgQnB26wbQx0LlqlH1BT5PWs
	K2cqjM53tx3q454hQKj863DC6Q==
X-Google-Smtp-Source: AMsMyM5X3spJySOGhlhXn9TKeJ1vUC4PQaWa4xgYswhH4zjD3fT+v5idDUvkA6X33EHtGeHu/7U0ag==
X-Received: by 2002:ac8:5c0b:0:b0:35c:e066:998d with SMTP id i11-20020ac85c0b000000b0035ce066998dmr4195776qti.336.1663875067117;
        Thu, 22 Sep 2022 12:31:07 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id i12-20020a05620a404c00b006b8d1914504sm5393430qko.22.2022.09.22.12.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 12:31:06 -0700 (PDT)
Date: Thu, 22 Sep 2022 15:31:04 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Guillaume Ranquet <granquet@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Vinod Koul <vkoul@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Daniel Vetter <daniel@ffwll.ch>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	Bo-Chen Chen <rex-bc.chen@mediatek.com>,
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
	Pablo Sun <pablo.sun@mediatek.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mattijs Korpershoek <mkorpershoek@baylibre.com>,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v1 01/17] dt-bindings: clk: mediatek: Add MT8195 DPI
 clocks
Message-ID: <20220922193104.4qminv6adrajkhw2@meerkat.local>
References: <20220919-v1-0-4844816c9808@baylibre.com>
 <20220919-v1-1-4844816c9808@baylibre.com>
 <d01e4a03-1d6d-9616-45ca-1c927f2d8237@linaro.org>
 <CABnWg9uZ=FrumgUzyUoUiS6T51nZTEf5JZ-1KF0-Ra9Ood5ufA@mail.gmail.com>
 <6b24be8f-94d7-6973-6f35-18cb15fc8cd4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6b24be8f-94d7-6973-6f35-18cb15fc8cd4@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_123110_235573_E0FFFCA4 
X-CRM114-Status: UNSURE (   8.46  )
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

On Thu, Sep 22, 2022 at 02:51:00PM +0200, Krzysztof Kozlowski wrote:
> Thanks for explanation! Probably your patches are perfectly fine and
> should apply, although I must admit diffstat is often useful.

Krzysztof:

The patches should indeed apply without problems and there's a fix for the
missing diffstat already in place.

Best regards,
Konstantin

