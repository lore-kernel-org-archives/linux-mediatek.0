Return-Path: <SRS0=ooiB=MA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BAE4C07E9C
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jul 2021 09:34:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7B3461A14
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jul 2021 09:34:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7B3461A14
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=r9aJOZZ8gdyJ8NoMsGYan7ZNFDHkVwCQwAJ6x3wXDmk=; b=MuSfkprN4kZiBRje5SfjZdlxuJ
	9DSHqOkZ0xahA87KjGtemBiK22y1qqYXH8LypAfCG4Jyxwh4O4ZGmx+xOwtP2TDJIq30PJDA/P0Ki
	1X2aonDffcbEi9E2nsMolwKnuhCkoJwYgDCeHmEFIucsPbu7arMe7gIiiVkkl5vwQ3U7bA8psdQFU
	s2BPBAOKP7SbcEiSNVXgf3v/KwyE4YnqZ2/3/mHGBWFmdmp7NRJPPu4/11LENsuOpc6tmIJA53oZq
	xaM8IA8Ag+VK9MZFvTdWbWyjT507P4dcsh/i23kfiZO+laSYgUlOQSoqExcNdndnB5oRQRiMVVWLF
	+ZAwYTWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1QQ8-00GTIg-Be; Thu, 08 Jul 2021 09:34:12 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1QQ4-00GTGV-VU
 for linux-mediatek@lists.infradead.org; Thu, 08 Jul 2021 09:34:10 +0000
Received: from mail-wr1-f69.google.com ([209.85.221.69])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1m1QQ3-0006ca-9w
 for linux-mediatek@lists.infradead.org; Thu, 08 Jul 2021 09:34:07 +0000
Received: by mail-wr1-f69.google.com with SMTP id
 l21-20020a0560000235b029013564642c78so1699944wrz.9
 for <linux-mediatek@lists.infradead.org>; Thu, 08 Jul 2021 02:34:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=E0C7nCPw9ngmgHYShx7ewbeQGAOF1fcpotAi0fhHmT0=;
 b=q7kqYxSG0XpKN62R8kbRm7EpW7ofIE7Fp+4yAsv36/S4OW1e/wNc/dSbB6jxPnpYLF
 /0Hz+J/7o2KnYA7Q+SGk4LWKur6xJx5NABn17SE+y2phZiHdG+8PNfpTmmcg30gZBXx0
 siyHgFNhZwIgJxTAlK0O6ftGO5aKpA40LPccxBGbiQL/LPlXzTob6DUm7A0A+QJweNl0
 aCuuYrSOlyziBBpsTAV/v2kQdulfIetbT5GostmvTm/GZvBo0tXQ34mYF4PqQ8lzhAPA
 owlsMGNwTFgvLcRNwuKJJzh2HmDTN6Cpik8ZFx9JwnBnd2eQyWJmUmI/J6SRWsXklifH
 2jWw==
X-Gm-Message-State: AOAM5324LWK9mzz7ltgJxr7XkMJFSc3Pp1dP+nzDos8MbR+/sAQ1glxj
 9MuYjW7xvwgUaM0fRACD5qhDFDodo4vlxt/C7k57OEHfzcVj8HPG9D03crDtRjs8PrwY9YhU+Ev
 Tvp6fUbjNT6mtvNJtbmSkE5VAyFrtXVen+x2Hky9nEetZrjc6qA==
X-Received: by 2002:a05:6000:12c7:: with SMTP id
 l7mr32033332wrx.177.1625736846963; 
 Thu, 08 Jul 2021 02:34:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6b2RvxjwXvMJgFoy20i+dUp4HtIQ58rbfVrXOuRcq9Ho/OovvbcDwRF9C+0n3tuxHzLL9uQ==
X-Received: by 2002:a05:6000:12c7:: with SMTP id
 l7mr32033308wrx.177.1625736846800; 
 Thu, 08 Jul 2021 02:34:06 -0700 (PDT)
Received: from [192.168.3.211] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id p7sm1637544wrr.21.2021.07.08.02.34.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 02:34:06 -0700 (PDT)
Subject: Re: [PATCH 4/9] memory: mtk-smi: Rename smi_gen to smi_type
To: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org,
 youlin.pei@mediatek.com, anan.sun@mediatek.com, ming-fan.chen@mediatek.com,
 yi.kuo@mediatek.com, anthony.huang@mediatek.com
References: <20210616114346.18812-1-yong.wu@mediatek.com>
 <20210616114346.18812-5-yong.wu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <a3abe400-4172-4f62-1548-b78b9ec4c157@canonical.com>
Date: Thu, 8 Jul 2021 11:34:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210616114346.18812-5-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210708_023409_101667_8E05022F 
X-CRM114-Status: GOOD (  14.16  )
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

On 16/06/2021 13:43, Yong Wu wrote:
> This is a preparing patch for adding smi sub common.

Don't write "This patch". Use simple imperative:
"Prepare for adding smi sub common."

https://elixir.bootlin.com/linux/v5.13/source/Documentation/process/submitting-patches.rst#L89
 
> About the previou smi_gen, we have gen1/gen2 that stand for the generation
> number for HW. I plan to add a new type(sub_common), then the "gen" is not
> prober. this patch only change it to "type", No functional change.

Same.

> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/memory/mtk-smi.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
