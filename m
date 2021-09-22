Return-Path: <SRS0=6VVk=OM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A10A9C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Sep 2021 06:49:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 643E5611C6
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Sep 2021 06:49:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 643E5611C6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qw8hsj+2PlEvQhNvVyoaWKM0t5Q1zF/GEISuXAZM+7U=; b=CPnsu35tlyiVK8
	jEGtP5f2mosmr2VGWJjZY0FEUPWm/XsA/6wEoEvN71ahD0YWm7dfUop9+bqTkB7frOCDigU2jxJCo
	pwhWs3kWJ0iQ/M+Xi2Dst8pqJAPleB3j22kwmxHNZXiD5VD6Cpgp/0hEk6zUVSVnOOrnoUYRMyYnz
	PofxW/q7i0EoqvNhfc3Yfb8vS2vIxxWWTRFnhxe+Wj02dEXczno3rzhFozY9WR83NuNoAGpa71c/L
	vZ4/m+2423ljwetPGWNKOw4xvew/4zwDX361X/C3WhmIFa8cZWchcGRicdQdfb11iB2wq2Mw8/kGC
	nFajF/Dueb6zSwTR4KyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSw4A-0079N1-E8; Wed, 22 Sep 2021 06:49:14 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSvzr-007852-M0
 for linux-mediatek@lists.infradead.org; Wed, 22 Sep 2021 06:44:49 +0000
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7D454402DC
 for <linux-mediatek@lists.infradead.org>; Wed, 22 Sep 2021 06:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632293079;
 bh=PHpWlL5286L9Vy7vwwtJJDOqUvt0lVJtNPWSRo8nnkI=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=X2tPR+GdMJEYpgN/lUT3nmnkcPVIYTt3aKblh1AYZR++NEA0fisxxTNEBo/xlggv+
 lPbS2lVmNuPPzXA/hLNj1pLCfhqLSAeyJYBmz3WuBPZ3SAmTsSnOH2MzVdiCljIlVc
 6zwToe9Mb4hckB429xPBWIJQY3MzGhteM3SXMY33sz8I9COX1AYafL6xHVCCY55aow
 qXGpoakfdhJ3D4t55/vo83PSgyq9QnhPZ+AEeI5u/NKWmfyBLNPu60LQySzYml9uXK
 jmkJstHdpkgSf9koyCKB6GqJvaZ02RAiSXaTF1SfNjgd5o3PHEneyLKBSl3EfoEgLJ
 3tEGlHxEbvTUA==
Received: by mail-wr1-f71.google.com with SMTP id
 r15-20020adfce8f000000b0015df1098ccbso1193182wrn.4
 for <linux-mediatek@lists.infradead.org>; Tue, 21 Sep 2021 23:44:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PHpWlL5286L9Vy7vwwtJJDOqUvt0lVJtNPWSRo8nnkI=;
 b=gYW4O7iuvez7Qu/ZnuqMB7umOMtSJ7vmzW1PEx/rsKC0NrQ2YLsghkatKOoEzb7TK/
 ftgnQZznVDyWAqoApWP/H3mxvc7VDafA0z0H3NYFeZUvX9d1wlZ7aUXBnRm+oUismsU9
 5I7ISZrIjV1QYO66Yh97DRUyioutvKMILC6ceapPYsfUJd1eRazF51qSxmgRlnG3DwUR
 aFjUiYR44Z59WG/J0F7C5AQIWpc+F+rkaqyxNg2N48E46Y68rviMZchZ3JKqJ90gvO83
 MRVAWxbLjaaD0GTruSnmpwtxaR3me0m9khxN0BRfvu4m55bch8Dt0fAuIr4MXn2zJy5l
 OuoA==
X-Gm-Message-State: AOAM5323CwxzW8xbT3WZWPR3hUCSuMNpIlzLCtRgipY7447Vy5f75eIG
 cejaP6OeZGLekcyl9rTUVkQy3jp+dMXysfYv/rmM/87iFol3Vzryqoxcy/HY46jy5FFFvfbSR+H
 Lj+5xmvlQbhrJcEHLTXN1xG8cOg3roYDhcuEMypdLFe9o67v+Hg==
X-Received: by 2002:adf:a3c3:: with SMTP id m3mr40411571wrb.237.1632293079012; 
 Tue, 21 Sep 2021 23:44:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7X/xE8BOJMFBcSLMZa3NNLNdKake1etQzDd7PnPQEF6xSjGfjlZkAQpczOFislXeA7hs9uQ==
X-Received: by 2002:adf:a3c3:: with SMTP id m3mr40411555wrb.237.1632293078867; 
 Tue, 21 Sep 2021 23:44:38 -0700 (PDT)
Received: from localhost.localdomain
 (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
 by smtp.gmail.com with ESMTPSA id g2sm1244554wrb.20.2021.09.21.23.44.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 23:44:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Yong Wu <yong.wu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Joerg Roedel <joro@8bytes.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 youlin.pei@mediatek.com, srv_heupstream@mediatek.com,
 linux-arm-kernel@lists.infradead.org, Tomasz Figa <tfiga@chromium.org>,
 anan.sun@mediatek.com, devicetree@vger.kernel.org, yi.kuo@mediatek.com,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 ming-fan.chen@mediatek.com, iommu@lists.linux-foundation.org,
 Ikjoon Jang <ikjn@chromium.org>, anthony.huang@mediatek.com
Subject: Re: [PATCH v4 00/13] MT8195 SMI support
Date: Wed, 22 Sep 2021 08:44:01 +0200
Message-Id: <163229303729.7874.4095337797772755570.b4-ty@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210914113703.31466-1-yong.wu@mediatek.com>
References: <20210914113703.31466-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_234447_972479_4D288EED 
X-CRM114-Status: GOOD (  14.36  )
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

On Tue, 14 Sep 2021 19:36:50 +0800, Yong Wu wrote:
> This patchset mainly adds SMI support for mt8195.
> 
> Comparing with the previous version, add two new functions:
> a) add smi sub common
> b) add initial setting for smi-common and smi-larb.
> 
> Change note:
> v4:1) base on v5.15-rc1
>    2) In the dt-binding:
>       a. add "else mediatek,smi: false." in the yaml.
>       b. Remove mediatek,smi_sub_common. since we have only 2 level currently,
>       It should be smi-sub-common if that node has "mediatek,smi". otherwise,
>       it is smi-common.
> 
> [...]

Applied, thanks!

[01/13] dt-bindings: memory: mediatek: Add mt8195 smi binding
        commit: b01065eee432b3ae91a2c0aaab66c2cae2e9812d
[02/13] dt-bindings: memory: mediatek: Add mt8195 smi sub common
        commit: 599e681a31a2dfa7359b8e420a1157ed015f840b
[03/13] memory: mtk-smi: Use clk_bulk clock ops
        commit: 0e14917c57f9d8b9b7d4f41813849a29659447b3
[04/13] memory: mtk-smi: Rename smi_gen to smi_type
        commit: a5c18986f404206fdbc27f208620dc13bffb5657
[05/13] memory: mtk-smi: Adjust some code position
        commit: 534e0ad2ed4f9296a8c7ccb1a393bc4d5000dbad
[06/13] memory: mtk-smi: Add error handle for smi_probe
        commit: 30b869e77a1c626190bbbe6b4e5f5382b0102ac3
[07/13] memory: mtk-smi: Add device link for smi-sub-common
        commit: 47404757702ec8aa5c8310cdf58a267081f0ce6c
[08/13] memory: mtk-smi: Add clocks for smi-sub-common
        commit: 3e4f74e0ea5a6a6d6d825fd7afd8a10afbd1152c
[09/13] memory: mtk-smi: Use devm_platform_ioremap_resource
        commit: 912fea8bf8d854aef967c82a279ffd20be0326d7
[10/13] memory: mtk-smi: mt8195: Add smi support
        commit: cc4f9dcd9c1543394d6ee0d635551a2bd96bcacb
[11/13] memory: mtk-smi: mt8195: Add initial setting for smi-common
        commit: 431e9cab7097b5d5eb3cf2b04d4b12d272df85e0
[12/13] memory: mtk-smi: mt8195: Add initial setting for smi-larb
        commit: fe6dd2a4017d3dfbf4a530d95270a1d498a16a4c
[13/13] MAINTAINERS: Add entry for MediaTek SMI
        commit: 93403ede5aa4edeec2c63541b185d9c4fc9ae1e4

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
