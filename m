Return-Path: <SRS0=+aVJ=JH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53CEBC433ED
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Apr 2021 12:40:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9A4D610CC
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Apr 2021 12:40:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9A4D610CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=He3wUdOSvbSShL9PJGkQF2eFPofCKRFjFSygwj99wSY=; b=dsCTpa6M3uPBglXbS9zB53RM7
	3cAJp0rAEjokX0fhQMArmuN4b91y4qm2Tdkn8PI91YGLt0n8jKH0DRlFMYAsXQP7DY5KNt1kMPGw0
	YKmW9yYKZ38Zp7kDdpezLeRUf66SkUlJ5K+PSzDCgbRg582dYHFFBQ4l/oBTJbvU/gZj+MA1+dv9Q
	PGlg4Ms/b81abTVDY0FHpqFqitkIDEEeMJzTY3aVycTWf3KnWg2MaerUiXA/55CfijCM7keOIGM4r
	RLkaHwixAYVell9TIpQ8KtOyM1+G8FCwcfRQk3T6oBt+64Q2dzbR6EG8X8/P/xr2yi4ntK6AhY2/8
	JKrL43J0A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVCud-002pGf-Lr; Sat, 10 Apr 2021 12:40:31 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVCuS-002pEY-Py
 for linux-mediatek@desiato.infradead.org; Sat, 10 Apr 2021 12:40:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=k8kbv7tLUPin7vEZz6Y8S8Ho2i9EHLVgMoQhgUpPZTc=; b=sH7AU7kTTfj1TUN270Sr97+awl
 fDLCdVPXFw8XfOUdrfNXt8Rz59P+W2j2PcHTeYW8CvNuVr5aFpC7FbwZMCixVioLlBFth9TXf5IPx
 JOHwOpe9vwMoYrcCiW0GsGRWIZemzpxIzRzqsfV/fZgZ1I299L6iAyr9+to5EInKAXGbkEZT7T1M3
 7ajQIEoAZG7xhmcZ64GYqPIKu/GIyP3yNZ+LoMLo4YdhQx74yE8mvgxcYl7jl8Q9wDbuOW/eqsblQ
 QgWJZe0ZX4HZmS52UYrAgIbpmXEGcA8/lI8f33p3tgU9llAXXu6LlZKCX4BDBErtb7HV2nt3wdYS7
 DyPH9xIg==;
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVCuQ-0055uH-0M
 for linux-mediatek@lists.infradead.org; Sat, 10 Apr 2021 12:40:19 +0000
Received: from mail-ed1-f69.google.com ([209.85.208.69])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lVCuL-0002YU-BG
 for linux-mediatek@lists.infradead.org; Sat, 10 Apr 2021 12:40:13 +0000
Received: by mail-ed1-f69.google.com with SMTP id h5so579359edf.17
 for <linux-mediatek@lists.infradead.org>; Sat, 10 Apr 2021 05:40:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=k8kbv7tLUPin7vEZz6Y8S8Ho2i9EHLVgMoQhgUpPZTc=;
 b=MWALYQ78L2b1wh/8R9oinGirCXJ03A5pHr1NB+Pvb7y3yIAVSYnkCDGtsT5lrc0mxa
 84CEfk13hJZG8wzoh0x7HooAdZcgHivSZDDZGsOIYnTWsuSi49YViR+VkhZHk/dTCrmJ
 MSh39Pv1RLeIJsg9hIOXAVng83PvEueY/yDuM2zgYVi4stGhXkfW/FbmIiO/DP9HFWT1
 kB3JD/RyzuFlpBBzseGDpRVLL4HdOMMVAJlcNv/asE7s3Z40VfNf7j3Zj0byo6tqdOJu
 XJMWdXJaSIz3reofWLPVcwKtn7p23evnrxafyUUt5Xf9vByLBEGYP1tOyDlvz1dVL+nE
 nEaQ==
X-Gm-Message-State: AOAM532RLeAoUZkfdf8z8GgC+0/6C06hyqZP+TRkj4yUfOc09ZOip+0f
 RJkWo7HXXCmVCb9+CqQ3+4llV+/vMqDZHHp4qqdWqAqukea3x+Xqf1v/pw5XDC64I1Vm5X6xcfE
 YVcqpaeU8Qey7J09ps/sTyaT//TQ8YTVjNbehm+DbyHPbUiZE8w==
X-Received: by 2002:a05:6402:148a:: with SMTP id
 e10mr21482436edv.377.1618058413094; 
 Sat, 10 Apr 2021 05:40:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnEqzqI9N9YfHRefBuhHMer8IAZFUeA1p/w31AAx1VON2hHKiqTW68RFjQfE3PCZ9Bpj9RyA==
X-Received: by 2002:a05:6402:148a:: with SMTP id
 e10mr21482422edv.377.1618058412954; 
 Sat, 10 Apr 2021 05:40:12 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-192-147.adslplus.ch.
 [188.155.192.147])
 by smtp.gmail.com with ESMTPSA id d6sm3149960edr.21.2021.04.10.05.40.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Apr 2021 05:40:12 -0700 (PDT)
Subject: Re: [PATCH v5 04/16] memory: mtk-smi: Add device-link between
 smi-larb and smi-common
To: Yong Wu <yong.wu@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Evan Green <evgreen@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, Will Deacon <will.deacon@arm.com>,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org,
 youlin.pei@mediatek.com, Nicolas Boichat <drinkcat@chromium.org>,
 Matthias Kaehlcke <mka@chromium.org>, anan.sun@mediatek.com,
 chao.hao@mediatek.com, ming-fan.chen@mediatek.com, yi.kuo@mediatek.com,
 eizan@chromium.org, acourbot@chromium.org
References: <20210410091128.31823-1-yong.wu@mediatek.com>
 <20210410091128.31823-5-yong.wu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <ea7ed30f-050d-2d38-7c61-1e0c192f6ded@canonical.com>
Date: Sat, 10 Apr 2021 14:40:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210410091128.31823-5-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210410_054018_231080_84A33E35 
X-CRM114-Status: GOOD (  14.50  )
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

On 10/04/2021 11:11, Yong Wu wrote:
> Normally, If the smi-larb HW need work, we should enable the smi-common
> HW power and clock firstly.
> This patch adds device-link between the smi-larb dev and the smi-common
> dev. then If pm_runtime_get_sync(smi-larb-dev), the pm_runtime_get_sync
> (smi-common-dev) will be called automatically.
> 
> Also, Add DL_FLAG_STATELESS to avoid the smi-common clocks be gated when
> probe.
> 
> CC: Matthias Brugger <matthias.bgg@gmail.com>
> Suggested-by: Tomasz Figa <tfiga@chromium.org>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/memory/mtk-smi.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)

I understood this is a dependency for other patches, so:
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

If I am wrong and I can take it via memory tree, let me know.

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
