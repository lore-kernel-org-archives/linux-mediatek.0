Return-Path: <SRS0=o4uA=FA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F8A4C56202
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2020 16:06:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A791B21D40
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2020 16:06:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V8aXpXLU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A791B21D40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Z2RkY/WdXBgX+qPnkOveV55CTmAbju74H6SuV8GC2Hs=; b=V8aXpXLUPh5RsZ9qt74e9Jf+G
	BeuOvYaBdLLXmiXo93ww+i3+sqJt7HqsvfFAOoV6+ECrIvwq2g6CGE6DI7+ShRQ3wS/r7yMU1EUar
	9ze52dMzLnAGH7TsbjNZpqDPwQGgKnf61oMtY4GMY3GKU0l+1N70sOMsR+ZbY5+pvsw+AP3Bpa3NY
	jiNjarye+zHyjLjM1qT97gaDHHp0s5BGcUr8/PnW2ZV8BezakeRt8BsQbMWRJdzTBE7Zqj2W+cFUu
	p6WGp72/1kgU2mmZ4JaQwGFIzhwydjjcagIzu8U/VDQtl6YTKdj2JxVQWyzYxm+Suml0kzDPaNoyu
	D7Z0bETEA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiJmK-0004K5-Eu; Thu, 26 Nov 2020 16:05:52 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiJkT-0003Xo-5J; Thu, 26 Nov 2020 16:04:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3DFA631B;
 Thu, 26 Nov 2020 08:03:55 -0800 (PST)
Received: from [10.57.59.159] (unknown [10.57.59.159])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 67D063F23F;
 Thu, 26 Nov 2020 08:03:50 -0800 (PST)
Subject: Re: [PATCH v4 09/24] iommu/io-pgtable-arm-v7s: Clear LVL_SHIFT/BITS
 macro instead of the formula
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Will Deacon <will@kernel.org>
References: <20201111123838.15682-1-yong.wu@mediatek.com>
 <20201111123838.15682-10-yong.wu@mediatek.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <13599074-25d5-721f-ea7b-1ea6badfd14f@arm.com>
Date: Thu, 26 Nov 2020 16:03:49 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201111123838.15682-10-yong.wu@mediatek.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_110357_574550_78D74859 
X-CRM114-Status: GOOD (  21.29  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 Tomasz Figa <tfiga@google.com>, Greg Kroah-Hartman <gregkh@google.com>,
 linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>,
 chao.hao@mediatek.com, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 anan.sun@mediatek.com, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-11-11 12:38, Yong Wu wrote:
> The current _ARM_V7S_LVL_BITS/ARM_V7S_LVL_SHIFT use a formula to calculate
> the corresponding value for level1 and level2 to pretend the code sane.
> Actually their level1 and level2 values are different from each other.
> This patch only clear the two macro. No functional change.

Grammar nit: to "clear" the macro sounds like you're making it empty or 
removing it entirely; I think you mean to say "clarify" here. English is 
the worst language sometimes... :)

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Suggested-by: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>   drivers/iommu/io-pgtable-arm-v7s.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
> index 4d0aa079470f..58cc201c10a3 100644
> --- a/drivers/iommu/io-pgtable-arm-v7s.c
> +++ b/drivers/iommu/io-pgtable-arm-v7s.c
> @@ -44,13 +44,11 @@
>   
>   /*
>    * We have 32 bits total; 12 bits resolved at level 1, 8 bits at level 2,
> - * and 12 bits in a page. With some carefully-chosen coefficients we can
> - * hide the ugly inconsistencies behind these macros and at least let the
> - * rest of the code pretend to be somewhat sane.
> + * and 12 bits in a page.
>    */
>   #define ARM_V7S_ADDR_BITS		32
> -#define _ARM_V7S_LVL_BITS(lvl)		(16 - (lvl) * 4)
> -#define ARM_V7S_LVL_SHIFT(lvl)		(ARM_V7S_ADDR_BITS - (4 + 8 * (lvl)))
> +#define _ARM_V7S_LVL_BITS(lvl)		((lvl) == 1 ? 12 : 8)
> +#define ARM_V7S_LVL_SHIFT(lvl)		((lvl) == 1 ? 20 : 12)
>   #define ARM_V7S_TABLE_SHIFT		10
>   
>   #define ARM_V7S_PTES_PER_LVL(lvl)	(1 << _ARM_V7S_LVL_BITS(lvl))
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
