Return-Path: <SRS0=DtK5=PE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 306C2C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Oct 2021 02:23:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1EEC61214
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Oct 2021 02:23:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E1EEC61214
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pqR1MhRIUcl93W11cmCMAWnJJXzNzBYX4uzP3+mBFWc=; b=FFmkhIWAxuMHls
	5vtEBYyiXUDW4t8FgLCpN8bNyCNZQk0QJfViBhXJU4ZS0qmuG/OU/7V8LDPy0Y0OG7WzGXwAnakDl
	FioFYdVBYitLj4u3PYg9uYrIX3UBl5WTHHrMOmNZ3QJrD8n8kBetHYLt8MVzbhLmlQaXh/2HScwii
	9OKRXzKuX7h7xYxHja3J54DkCWp8b5zpGM9wkEItonUdlw7OJ/fthxqS8fvGt4tNMO3d5ReWAdwLT
	4KVT4M36elwjWVfRPuxDypRbbm+jblQmG2oOf1uvte4DuBWVL+OFxzXXmG72clmg7IUVznfbeq9fj
	Cy76Rf79hIs2qXAaxNbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbZMF-009Xf0-IL; Sat, 16 Oct 2021 02:23:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbZMC-009XdP-Kz; Sat, 16 Oct 2021 02:23:34 +0000
X-UUID: b2e8b7e9d8054c69aa892f501b26a0b2-20211015
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ea7oQlIojI/CGgtbObieSmBoMcrvgHikxIPi+z+qGZo=; 
 b=CyyA9mgGRTtgLaaqSGtWXjHj02ijqysJmbrlSK677JNC3lw713X65BJFHeWIqygS4z7gVojbgQ4hXq7srZ/q5e5IIyLmccYsXXLvTnzAczpLTGtMWOKHTunznLmYkKAOruB8AaBFAfyaf14OMmUNS6vkYVfLXpY8XACF3KOVFu0=;
X-UUID: b2e8b7e9d8054c69aa892f501b26a0b2-20211015
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 196364567; Fri, 15 Oct 2021 19:23:25 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 15 Oct 2021 19:13:24 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sat, 16 Oct 2021 10:13:22 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 16 Oct 2021 10:13:21 +0800
Message-ID: <5e411c148ac44d5d970b6fba8861f63434f83ec5.camel@mediatek.com>
Subject: Re: [PATCH] memory: mtk-smi: Use ARRAY_SIZE to define
 MTK_SMI_CLK_NR_MAX
From: Yong Wu <yong.wu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <krzysztof.kozlowski@canonical.com>
CC: <matthias.bgg@gmail.com>, <linux-mediatek@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Date: Sat, 16 Oct 2021 10:13:21 +0800
In-Reply-To: <20211015151557.510726-1-angelogioacchino.delregno@collabora.com>
References: <20211015151557.510726-1-angelogioacchino.delregno@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_192332_868148_A7C193A4 
X-CRM114-Status: GOOD (  16.84  )
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

On Fri, 2021-10-15 at 17:15 +0200, AngeloGioacchino Del Regno wrote:
> This definition is tied to the number of SMI common clocks (the array
> mtk_smi_common_clks): improve the definition by using the ARRAY_SIZE
> macro instead. That will also reduce room for mistakes when updating
> the aforementioned array in the future.
> 
> Signed-off-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>

Reviewed-by: Yong Wu <yong.wu@mediatek.com>

Thanks for this patch.

> ---
>  drivers/memory/mtk-smi.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> index b883dcc0bbfa..6331422141e8 100644
> --- a/drivers/memory/mtk-smi.c
> +++ b/drivers/memory/mtk-smi.c
> @@ -94,8 +94,6 @@ enum mtk_smi_type {
>  	MTK_SMI_GEN2_SUB_COMM,	/* gen2 smi sub common */
>  };
>  
> -#define MTK_SMI_CLK_NR_MAX			4
> -
>  /* larbs: Require apb/smi clocks while gals is optional. */
>  static const char * const mtk_smi_larb_clks[] = {"apb", "smi",
> "gals"};
>  #define MTK_SMI_LARB_REQ_CLK_NR		2
> @@ -106,6 +104,7 @@ static const char * const mtk_smi_larb_clks[] =
> {"apb", "smi", "gals"};
>   * sub common: Require apb/smi/gals0 clocks in has_gals case.
> Otherwise, only apb/smi are required.
>   */
>  static const char * const mtk_smi_common_clks[] = {"apb", "smi",
> "gals0", "gals1"};
> +#define MTK_SMI_CLK_NR_MAX		ARRAY_SIZE(mtk_smi_common_clks)
>  #define MTK_SMI_COM_REQ_CLK_NR		2
>  #define MTK_SMI_COM_GALS_REQ_CLK_NR	MTK_SMI_CLK_NR_MAX
>  #define MTK_SMI_SUB_COM_GALS_REQ_CLK_NR 3
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
