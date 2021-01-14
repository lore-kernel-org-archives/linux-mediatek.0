Return-Path: <SRS0=30Xp=GR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32F14C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jan 2021 02:11:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB4F42242A
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jan 2021 02:11:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB4F42242A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NUvUJhKuczFnnTNftOoip2q9M4FZEhgH5aiaCO+yHxc=; b=K1xmXyKPsV9vSQ8WnJ2qtGIUP
	3/t2ZSlg+YobxuebuzFnMc0fwNbvDsmyyo5yHPsNYtmTElrW6veZZ4zt0mLPD359PaDdVvKWhWNUb
	vjOZXcYXZdiIRIcG7w0UToSp4pjW6rVoMI6517H8vNF8QaWNCQuN3yk5knvLKMn0po7hsPQvbEi/C
	IIdLh/8NDyi6ui/tqNDkYwlBB5brqUc9wu9GDeJTuNrvg5YAEC4pq3ZnocWjuvqh6bh1owSQMOjBr
	5ac1somjIdP0joMw5l0LtUsBS1M76uGCJ6DuYivvvsL+h57vej+/XMbwN4mQRrtxfbiakcEdbv6W5
	M1FLwUqaA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzs5x-0003pX-8W; Thu, 14 Jan 2021 02:10:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzs5k-0003jK-40; Thu, 14 Jan 2021 02:10:29 +0000
X-UUID: 100ab0edbd5b4255a9a05e81daadede5-20210113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=NuaaCNSxyNSThWbdoMr70KINtL4T/OZl54vOvTQmmwg=; 
 b=BXScZta3ncBRPC9X66QojVlwS4EJsagj+w02cNU/vpYwQMuzQ9WiU1gyOPDo63Wl9dbmm2pcNPvV2cjuVMT1oE3IRgzqDf1XxAtA3Nkk5ZASTp7rgKI7x60TXACl8e9ZMevNsGFeyucFYOHUaBau1Nahy7mosSUc78DpDebOhUk=;
X-UUID: 100ab0edbd5b4255a9a05e81daadede5-20210113
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1977033926; Wed, 13 Jan 2021 18:10:24 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 13 Jan 2021 18:10:23 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 14 Jan 2021 10:10:19 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 14 Jan 2021 10:10:18 +0800
Message-ID: <1610590218.30053.2.camel@mhfsdcap03>
Subject: Re: [PATCH -next] phy: mediatek: Mark mtk_mipi_tx_driver with
 static keyword
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Zou Wei <zou_wei@huawei.com>
Date: Thu, 14 Jan 2021 10:10:18 +0800
In-Reply-To: <1610415484-92497-1-git-send-email-zou_wei@huawei.com>
References: <1610415484-92497-1-git-send-email-zou_wei@huawei.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: FCE73643E55E92ED26370A94CFD667C3147589CB9C210729EA13CD4E6D5BFDB62000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_211028_427549_A31F67AE 
X-CRM114-Status: GOOD (  14.59  )
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
Cc: chunkuang.hu@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kishon@ti.com, vkoul@kernel.org,
 linux-mediatek@lists.infradead.org, p.zabel@pengutronix.de,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2021-01-12 at 09:38 +0800, Zou Wei wrote:
> Fix the following sparse warning:
> 
> drivers/phy/mediatek/phy-mtk-mipi-dsi.c:237:24: warning: symbol 'mtk_mipi_tx_driver' was not declared. Should it be static?
> 
> Signed-off-by: Zou Wei <zou_wei@huawei.com>
> ---
>  drivers/phy/mediatek/phy-mtk-mipi-dsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
> index 18c4812..eeb357b 100644
> --- a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
> +++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
> @@ -234,7 +234,7 @@ static const struct of_device_id mtk_mipi_tx_match[] = {
>  	{ },
>  };
>  
> -struct platform_driver mtk_mipi_tx_driver = {
> +static struct platform_driver mtk_mipi_tx_driver = {
>  	.probe = mtk_mipi_tx_probe,
>  	.remove = mtk_mipi_tx_remove,
>  	.driver = {

Acked-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Thanks

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
