Return-Path: <SRS0=tvhu=GL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDB0FC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 01:48:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7805723380
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 01:48:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7805723380
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aHAryJxraCugKqQ8SwHWHJSbVrMfLEQK3amkroHwync=; b=vxOL5G+mvNC3/O2CaKSezel97W
	MYV2xSqI11FCXmN75STQn+evRsCtLEk3eBxaWjZ7ReZHi9gZGGqXq4mfQTXNUmtFIL7AhmX+ScG9Z
	0a/CjeIWbFL1IYl7nvVATPxRsQ49G3WPz39WKSWGwMT1nyrzrXu6bXUWnT9t4rpETD5NLgTdJQ30A
	nvo/YU8bMCnqNvaqOSlzRMbJKRGwhh7+rT79TCI7Q2Ormrl6E9RRy7aidZRJNuBBq5275a6JQJxNd
	kMssLXZM0DQ0TDv3qAwPXS3EkLmxFh3x+6uqoA88F+07UkQ2jW9NZyIu6b0lohRGuWlPXJTNuP14f
	dMXiL9Ww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxgsz-00032I-KB; Fri, 08 Jan 2021 01:48:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxgsw-00031n-77; Fri, 08 Jan 2021 01:48:16 +0000
X-UUID: 93772fedc67e4b1ab6981dcdb9b88470-20210107
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:Message-ID;
 bh=NPP5jpMnteAgsJpkoNqsMUTLM/8AlhOp/XPWd4WayzM=; 
 b=NnIqDoqCBW6k0ASGhfpyLv7K4K2NQSOy9yfwmRGy/qi/JF519rN7XfY5/EaXJKlxA6wvMoypcijilnc0oLF/jvIljlESnfTJ7zfiaUIw2t5jcqkgm4tzEzRqa8EzVVdlw8esR7ST1JjGh7ngavB1dG+EJq4UFQ7W3vOAmeMYJDc=;
X-UUID: 93772fedc67e4b1ab6981dcdb9b88470-20210107
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1242243831; Thu, 07 Jan 2021 17:48:11 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Jan 2021 17:48:09 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs08n2.mediatek.inc
 (172.21.101.56) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 8 Jan 2021 09:48:06 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 8 Jan 2021 09:48:05 +0800
Message-ID: <1610070485.1574.10.camel@mhfsdcap03>
Subject: Re: [PATCH v2] soc: mediatek: cmdq: add address shift in jump
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Jassi Brar <jassisinghbrar@gmail.com>
Date: Fri, 8 Jan 2021 09:48:05 +0800
In-Reply-To: <1608712499-24956-2-git-send-email-yongqiang.niu@mediatek.com>
References: <1608712499-24956-1-git-send-email-yongqiang.niu@mediatek.com>
 <1608712499-24956-2-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 68847612D0C798759DAC2DE39BDF7DDFAD4EDA6D3284292B08F310D98A8DC2A62000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_204815_383429_EE606889 
X-CRM114-Status: GOOD (  18.34  )
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
Reply-To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 dennis-yc.hsieh@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 damon.chu@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-12-23 at 16:34 +0800, Yongqiang Niu wrote:
> Add address shift when compose jump instruction
> to compatible with 35bit format.
> 
> Fixes: 0858fde496f8 ("mailbox: cmdq: variablize address shift in platform")
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>
> ---
>  drivers/mailbox/mtk-cmdq-mailbox.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
> index 5665b6e..75378e3 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -168,7 +168,8 @@ static void cmdq_task_insert_into_thread(struct cmdq_task *task)
>  	dma_sync_single_for_cpu(dev, prev_task->pa_base,
>  				prev_task->pkt->cmd_buf_size, DMA_TO_DEVICE);
>  	prev_task_base[CMDQ_NUM_CMD(prev_task->pkt) - 1] =
> -		(u64)CMDQ_JUMP_BY_PA << 32 | task->pa_base;
> +		(u64)CMDQ_JUMP_BY_PA << 32 |
> +		(task->pa_base >> task->cmdq->shift_pa);
>  	dma_sync_single_for_device(dev, prev_task->pa_base,
>  				   prev_task->pkt->cmd_buf_size, DMA_TO_DEVICE);
>  

hi jassi

please confirm is there any question about this patch.
if not, please apply this into next version, tks
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
