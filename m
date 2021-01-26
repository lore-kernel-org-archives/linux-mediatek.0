Return-Path: <SRS0=aDjs=G5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 657D7C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jan 2021 19:50:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D98322B2C
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jan 2021 19:50:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D98322B2C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=z8p+4teeyFVN9P1rqetXgHYhnRAQXRNu/wl+RQ6E2XY=; b=FlpHeW+f6J3SPUJIKdOulVLTw
	j/LAsxohgrIkymMIR4Csk3rg+gK97f5q9NkstzfVkvpIPK9V7H6rPtuQbn1QnmB9rSLdG+2EkOsUU
	uSJncReCtEyFd5/EVO//58JIfwCFTm3T0rWq7WA2X9nOmFFiQp8ZF79zs2x02V7pJi8qD1P3qscWL
	abBjeJAozjvcf4rQP2ozGiHWCsJXp2eUoCrd7tkH9tEkEVlF+1UBHPiAF7a0oDbwQYG+fuKSoE6kz
	Cv2HieE8qY4cqd7nN2hM7wNHZQRgKHwm2v0V62seKLtcZageYGrTZIn+qRv0JNFgUgyEYXm46JqGy
	+XFRwf/2A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4ULY-0005Cu-7J; Tue, 26 Jan 2021 19:49:52 +0000
Received: from mail-ej1-f54.google.com ([209.85.218.54])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4ULV-0005CU-MF; Tue, 26 Jan 2021 19:49:50 +0000
Received: by mail-ej1-f54.google.com with SMTP id a10so24740795ejg.10;
 Tue, 26 Jan 2021 11:49:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=o/xNlPfGwnBKxfph+ywxuqzSguELReNCQiSKkwp5El8=;
 b=F2LUaR+MGKnmKXOczF3UkxN2aIw83AwU5dU2aai/v6S0ema/8t2FvB5aTvPZznqmEQ
 vxdI2Vw/C2ZHAEfrLsD4TW2z2vds1qr4X21ug67MgfgDf/g6muSfQ3JnZi0HsH2sTkdA
 cCNEC6QMTtUitDrb5Ynx/0MgyQXZaieedAmDEf0KepJmIKt0EqwONmLsbgZhV1yDVcA3
 z2yCCg0Crs6g7QFo+lTZP/rnWlVbqbkS5tjO+FtvNNZMbZIwaECcVX0m1si9VQp4MKvR
 J8lOmaiGzsU4TeqwMmzyPY2LcQsPvYXXRP3Ptq+3BbGxw7lMJ0NSaZ63gTlHPFiLDTBv
 3APw==
X-Gm-Message-State: AOAM5330xuKdY34UnZjtuer1Z2e0XugHhQtuaDyb3B+f/LUMPnzbiW3R
 7c+bUt+F649PR/Q9AtWJ6Zw=
X-Google-Smtp-Source: ABdhPJxK7hEpk5TYCend9Ub0Pc+g5IwKSV+LIkJ84QXUrE7AdhDzU/Qs2jCac4uMCvi4wSJ7Mt+SmQ==
X-Received: by 2002:a17:906:2e0d:: with SMTP id
 n13mr4302953eji.554.1611690586670; 
 Tue, 26 Jan 2021 11:49:46 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id dj25sm12801834edb.5.2021.01.26.11.49.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 11:49:45 -0800 (PST)
Date: Tue, 26 Jan 2021 20:49:43 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v2] memory: mtk-smi: Support SMI modular
Message-ID: <20210126194943.n7xtgoa5axd2zajz@kozik-lap>
References: <20210126060055.11050-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210126060055.11050-1-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210126_144949_732755_FE49D59E 
X-CRM114-Status: GOOD (  14.20  )
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
Cc: youlin.pei@mediatek.com, anan.sun@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 linux-kernel@vger.kernel.org, yi.kuo@mediatek.com,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jan 26, 2021 at 02:00:55PM +0800, Yong Wu wrote:
> This patch mainly support SMI modular. Switch MTK_SMI to tristate,
> and add module_exit/module_license.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
> This patch rebase on the clean v5.11-rc1.
> and this one: memory: mtk-smi: Use platform_register_drivers
> https://lore.kernel.org/linux-arm-kernel/20210121062429.26504-2-yong.wu@mediatek.com/
> 
> change note:
> a) squash the last two of v1 into one patch.
> b) Remove module_alias
> ---
>  drivers/memory/Kconfig     | 2 +-
>  drivers/memory/mtk-smi.c   | 9 +++++++++
>  include/soc/mediatek/smi.h | 2 +-
>  3 files changed, 11 insertions(+), 2 deletions(-)

Thanks, applied with slightly adjusted commit msg and subject.

Best regards,
Krzysztof


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
