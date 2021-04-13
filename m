Return-Path: <SRS0=dZqu=JK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4842C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Apr 2021 15:01:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CBAD613BB
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Apr 2021 15:01:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CBAD613BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rbk2p6K/RQjqLKoiJ0Bvc24fkWcq+Nls3Qaq8B4r0pE=; b=WcTG5iqjTYABH7dU+hw4/F31j
	LsjgRo8lGJPdhasUS2d5jN/zL6mBh2imzpF1GjQfiPDvaop/TwE6+AgKP5f1unNBQ3EeAL96vNXuB
	ROPeMGE8llRxwzjXsC7Fapcqn/v9w2zfiPWzlxpdEPqK6CL4AWdZaHmCk471x6pSmygQHbOq038zu
	qSekytWCJEG8ZPCbrOZTChWPduGe/Tsb6fkYKcVPF+xk8DxLQiprQD7PCCSJ/u7A8QC/L+8V9gT6a
	dtHx8ug8GTzJIuLYj6pAzinX8y1c7ecHeMFE34qd1diFR1Bz7qSriurJAOYhfi3vzmzICyK3Gb2Q5
	Mh0YHMJug==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWKXU-009ZxP-B5; Tue, 13 Apr 2021 15:01:17 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWKUs-009ZjJ-Ux
 for linux-mediatek@desiato.infradead.org; Tue, 13 Apr 2021 14:59:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=Ph9+/mYhqHgYa9Fj9YRroZ2f7XAlKgwCaPOsxelpWRE=; b=D88mGdjTR+id1LXX6h5V/hUzbh
 uBSl20OvqEOBZi3QLZaFa/o0ji+8pqMxqbSEjMxXhEuwE5arXZS2nCH7OD1ORjh9N1obRhJ22EwSF
 pdYUDPI2uiqRhJAfumZ0LWZE70Q6X6OqTbTF/LxGT36Tri7k71hotzOyRnaASUOMfnLnnMkIRlGeu
 YWN+izTXXKcZJTElk+716wimHXW3pmFL7I1tjhL2yszkbGjMa/fc7b0IauywkvB53Gva2sbODifAp
 pvh28eR/M8N2oEsadZPH5elul5IBdBRquAsAAv+pICJFslZ9bNjR6WIFhXhKTH//Wl5i7GaKlATZw
 vNBjKyrQ==;
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWKUq-0077i7-J7
 for linux-mediatek@lists.infradead.org; Tue, 13 Apr 2021 14:58:33 +0000
Received: from mail-ed1-f70.google.com ([209.85.208.70])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lWKUo-0005Ec-V3
 for linux-mediatek@lists.infradead.org; Tue, 13 Apr 2021 14:58:31 +0000
Received: by mail-ed1-f70.google.com with SMTP id
 i5-20020aa7dd050000b02903830cafa575so6851edv.6
 for <linux-mediatek@lists.infradead.org>; Tue, 13 Apr 2021 07:58:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ph9+/mYhqHgYa9Fj9YRroZ2f7XAlKgwCaPOsxelpWRE=;
 b=IUWQUb/ncdPncB23nvIoynxvwR+0zTJXSsLSPu/Tv16SV6M0hp3TQS2IjzojObVVKZ
 wSLRhCz0KSOsfKeYnyG+UGQwChZAjbo6gVIQBTF4cgZV77AqOksVXL0DO+OLeAytkaV/
 6yz3N+J8RUna9NaWUPbZ4hOFkZ5Ut6dO7Y6RFtBHToTCJBlYLjdDwMIiMmgTRHozUb0y
 nfsN9C01eigQE/7WbesWRHWiPq6CvZmXjov/wkkRM5JmVhyFaAeCXFCmTAa5lSL32CRZ
 uxnsxHk1MBF/EZD6H+3onbuJTwKAw7YRHaX6q/2yCNxpvqtnS3EtcjvJEfCDIctNB2uv
 TNCA==
X-Gm-Message-State: AOAM5339x1c825ionYgnnTxOKZkhwtdsonG9fXqTFLkT0deJ7m/r+0Ss
 793PD+0+9gQw+EPSub2GKp3MxNm17UgdKdhyBA1QHAbFwqRtNxXQ6GBx9Ycle8PSyfIMWJRgG7Q
 lowQnxolp335CKepLR8pt0EquQ2mnqspEi77emwhDL4ea9gHKIw==
X-Received: by 2002:a17:906:c7ca:: with SMTP id
 dc10mr13614380ejb.294.1618325910747; 
 Tue, 13 Apr 2021 07:58:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwgRCGqwTKY1uXNFzYOC/YmWaq5iHZG/z/5N5f+QW5qWm9hQs1h7yWI+1JNCO0I2BVghLszFQ==
X-Received: by 2002:a17:906:c7ca:: with SMTP id
 dc10mr13614363ejb.294.1618325910652; 
 Tue, 13 Apr 2021 07:58:30 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-192-147.adslplus.ch.
 [188.155.192.147])
 by smtp.gmail.com with ESMTPSA id p3sm4395217ejd.65.2021.04.13.07.58.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 07:58:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Tomasz Figa <tfiga@chromium.org>, youlin.pei@mediatek.com,
 acourbot@chromium.org, iommu@lists.linux-foundation.org,
 eizan@chromium.org, linux-mediatek@lists.infradead.org,
 yi.kuo@mediatek.com, anan.sun@mediatek.com, chao.hao@mediatek.com,
 Evan Green <evgreen@chromium.org>, Matthias Kaehlcke <mka@chromium.org>,
 Will Deacon <will.deacon@arm.com>, linux-arm-kernel@lists.infradead.org,
 srv_heupstream@mediatek.com, ming-fan.chen@mediatek.com,
 linux-kernel@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
 Nicolas Boichat <drinkcat@chromium.org>, devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v5 00/16] Clean up "mediatek,larb"
Date: Tue, 13 Apr 2021 16:58:24 +0200
Message-Id: <161832589345.71964.1780926932144222450.b4-ty@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210410091128.31823-1-yong.wu@mediatek.com>
References: <20210410091128.31823-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_075832_777514_C8C44C14 
X-CRM114-Status: UNSURE (   9.46  )
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

On Sat, 10 Apr 2021 17:11:12 +0800, Yong Wu wrote:
> MediaTek IOMMU block diagram always like below:
> 
>         M4U
>          |
>     smi-common
>          |
>   -------------
>   |         |  ...
>   |         |
> larb1     larb2
>   |         |
> vdec       venc
> 
> [...]

Applied, thanks!

[04/16] memory: mtk-smi: Add device-link between smi-larb and smi-common
        commit: 6ce2c05b21189eb17b3aa26720cc5841acf9dce8

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
