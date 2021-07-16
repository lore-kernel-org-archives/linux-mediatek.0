Return-Path: <SRS0=t3QX=MI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C7E2C12002
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 16:30:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDA2C611AC
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 16:30:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DDA2C611AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=VcoMUCpnVPsd96QVw8/XhlNRk6jJJNhtUs8FUyFbrxU=; b=pcY3X7PDJVFF/F+CTvkbSjBGzk
	1UaKRjWrufHbgsVoPHEXGj63YN6gGWs3qFabwqqPs1AJqPSvMIkZiJ6TOm6hkxq1Ln0HMZ4QaLGc2
	avltnEX3KWTgb/dfHRieLeqMjluhVxxg0TyGlwU5dY974tz5FMD4MIYZmy8QAfukRFC8gBtVvj9yT
	moKCB1hTZ0TjCzvzfRoqYTsfGOjIc32ndAF/oiRR06VZyxsrS3GnB2OEaZMYFlUjYcfwrPDUDS4oJ
	urhYmS4RweXbGVSZflt7ynQUcqrFJXVa3YsHFY0M1T+NrY1MPix2tuH4ZnRcpH5VsGEpDqr9PfGSu
	3a4BB1rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4Qin-004rvl-Qv; Fri, 16 Jul 2021 16:29:53 +0000
Received: from [2601:1c0:6280:3f0::aefb]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4Qim-004rvN-A6; Fri, 16 Jul 2021 16:29:52 +0000
Subject: Re: [PATCH v6 0/3] power: supply: mt6360_charger: add MT6360 charger
 support
To: Gene Chen <gene.chen.richtek@gmail.com>, sre@kernel.org,
 matthias.bgg@gmail.com, matti.vaittinen@fi.rohmeurope.com
Cc: broonie@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, gene_chen@richtek.com, Wilma.Wu@mediatek.com,
 cy_huang@richtek.com, benjamin.chao@mediatek.com,
 Linux PM list <linux-pm@vger.kernel.org>
References: <20210716094353.140536-1-gene.chen.richtek@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <a01521d3-bd79-a813-554a-39a750775938@infradead.org>
Date: Fri, 16 Jul 2021 09:29:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210716094353.140536-1-gene.chen.richtek@gmail.com>
Content-Language: en-US
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

On 7/16/21 2:43 AM, Gene Chen wrote:
> 
> This patch series add MT6360 Charger support contains driver and binding
> document
> 
> Gene Chen (3)
>  lib: add linear range get selector within
>  dt-bindings: power: Add bindings document for Charger support on MT6360 PMIC
>  power: supply: mt6360_charger: add MT6360 charger support
> 
>  Documentation/devicetree/bindings/power/supply/mt6360_charger.yaml |   48 
>  drivers/power/supply/Kconfig                                       |   11 
>  drivers/power/supply/Makefile                                      |    1 
>  drivers/power/supply/mt6360_charger.c                              |  867 ++++++++++
>  include/linux/linear_range.h                                       |    2 
>  lib/linear_ranges.c                                                |   31 
>  6 files changed, 960 insertions(+)
> 


Hi Gene,

All patches in this series are addressed to "inux-pm@vger.kernel.org" (missing leading 'l'),
so I expect that you should resend the series.

-- 
~Randy


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
