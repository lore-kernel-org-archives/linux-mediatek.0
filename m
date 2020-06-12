Return-Path: <SRS0=I3u4=7Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F96EC433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jun 2020 13:10:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E23D20792
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jun 2020 13:10:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OvltA3M2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E23D20792
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sj4szvClG1Se8P6O7FmMUOKsDAl78cUljWuZmTxXaN0=; b=OvltA3M2V5+rJ1GYcf9eFYlaB
	ROBIADib88qVNgWog+LImiL0VKxOqFQ18eLelKuptSrmPM6qszg0iSeGAobd8dh4hbKKkaVXBDuGJ
	vKQaUnGcIDl7DpaIFdKiYdglHdfZAResG4LPhe5ezdgOQNZhW3NvBhrlGItBUaEvKUclQNoa2PU6v
	HOmS6g5Gxe3XpypQ26xctPKv4UKtmBy42c0ZnUas/rgTlDBGGFkopETn1woyvn6B40vd7ZGrvI7Yu
	vlTwG4I8fol7t3BAvB+ha3ZeW84BLtJffNwGAWhWZ2PLOG3ssBweTlpiTuqZQgfLYj+4AXwDe4sV9
	WEY7bHEfA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jjjRc-0002Xz-9Z; Fri, 12 Jun 2020 13:10:04 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjjQt-0002Dd-4f; Fri, 12 Jun 2020 13:09:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D93F61F1;
 Fri, 12 Jun 2020 06:09:15 -0700 (PDT)
Received: from [10.57.9.128] (unknown [10.57.9.128])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 197103F6CF;
 Fri, 12 Jun 2020 06:09:13 -0700 (PDT)
Subject: Re: [PATCH] drm/mediatek: remove unnecessary conversion to bool
To: Bernard Zhao <bernard@vivo.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20200612124007.4990-1-bernard@vivo.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <e070b38f-fa77-5872-ea59-13098cebbe56@arm.com>
Date: Fri, 12 Jun 2020 14:09:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200612124007.4990-1-bernard@vivo.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200612_060919_273466_C1EEC0B8 
X-CRM114-Status: GOOD (  18.57  )
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
Cc: opensource.kernel@vivo.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-06-12 13:40, Bernard Zhao wrote:
> In function mtk_dsi_clk_hs_state, remove unnecessary conversion
> to bool return, this change is to make the code a bit readable.
> 
> Signed-off-by: Bernard Zhao <bernard@vivo.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_dsi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index 270bf22c98fe..4491e64b3f06 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -319,7 +319,7 @@ static bool mtk_dsi_clk_hs_state(struct mtk_dsi *dsi)
>   	u32 tmp_reg1;
>   
>   	tmp_reg1 = readl(dsi->regs + DSI_PHY_LCCON);
> -	return ((tmp_reg1 & LC_HS_TX_EN) == 1) ? true : false;
> +	return ((tmp_reg1 & LC_HS_TX_EN) == 1);

FWIW the "== 1" is also redundant, not to mention a little confusing - 
unless you go and look up the definition of LC_HS_TX_EN, it looks like 
this is doing something more than simply testing if a single bit is set.

Robin.

>   }
>   
>   static void mtk_dsi_clk_hs_mode(struct mtk_dsi *dsi, bool enter)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
