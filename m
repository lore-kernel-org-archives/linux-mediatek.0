Return-Path: <SRS0=GpGz=2U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89973C2D0C0
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2019 02:08:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 526BE206DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2019 02:08:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E4j9BrTv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="GTjlAmp0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 526BE206DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m1WsKuMors6YPkqgQF5p/+jrMVg0625qPgO873nUrRE=; b=E4j9BrTvFK/nao
	gerQr4ozozkbMu2c5wd0TOkTeJvdtHMizFbFYikX8No8KAegodPG3lqH5xbROPtsnEj77vB9lqnxQ
	F3sb+8drMr/iiizjGDA/EPxmc/SwmOamnEBVdMdaMx753TymPQgrJGnbST6B+1YokoVojRuSZWuf8
	rhh7vMruWt6Nb95jBzG6SdzQ4hImOSsOOUt02yJwFpFsqKCNuWji2OTy6qKEmWjm7fsHqPxFiNeUW
	EaIHd+s1LscFoP8bliPfrWWfWol4F6FhDWYQkF1+1Q4+pMn5AOc9C6c7kqCyzRyHUBG9TFG3RPp/x
	Ys5UgCMh8x1g2RTyS9Jg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilkU4-000743-I3; Mon, 30 Dec 2019 02:08:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilkTs-0006vE-K2; Mon, 30 Dec 2019 02:08:29 +0000
X-UUID: 37616466035142df9ef656893048e389-20191229
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=/lpQkAv3iCwWOkWgJJE5MaCHaqTpfO0sf9t+VBFhKO0=; 
 b=GTjlAmp0bUzhzZ0gAq4CejELM4MMdAWNVRWicb93uz0IRUHzH073haBzaUpl//g5fxEa2dj1cjoWyuI5HBsDgCqp26l/bZNJ75FBrDDOTBbo3qPy3NnkMs1Y7JAWjeW0pCKN1FiiFXdPhWq1oxG9zVWIXCoTiFK7kpeAHjtlTQc=;
X-UUID: 37616466035142df9ef656893048e389-20191229
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 642653931; Sun, 29 Dec 2019 18:08:23 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 29 Dec 2019 17:58:37 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 30 Dec 2019 09:57:57 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 30 Dec 2019 09:58:42 +0800
Message-ID: <1577671100.8160.0.camel@mtksdaap41>
Subject: Re: [PATCH 04/13] mailbox: mediatek: cmdq: convert to
 devm_platform_ioremap_resource
From: CK Hu <ck.hu@mediatek.com>
To: Yangtao Li <tiny.windzz@gmail.com>
Date: Mon, 30 Dec 2019 09:58:20 +0800
In-Reply-To: <20191228183538.26189-4-tiny.windzz@gmail.com>
References: <20191228183538.26189-1-tiny.windzz@gmail.com>
 <20191228183538.26189-4-tiny.windzz@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191229_180828_669391_4152EA2C 
X-CRM114-Status: GOOD (  10.60  )
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
Cc: bjorn.andersson@linaro.org, matthias.bgg@gmail.com,
 thierry.reding@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 f.fainelli@gmail.com, jassisinghbrar@gmail.com, jonathanh@nvidia.com,
 agross@kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linux-arm-msm@vger.kernel.org, alexandre.torgue@st.com, rjui@broadcom.com,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 lftan@altera.com, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, sbranden@broadcom.com,
 linux-kernel@vger.kernel.org, mcoquelin.stm32@gmail.com,
 nios2-dev@lists.rocketboards.org, nsaenzjulienne@suse.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Yangtao:

On Sat, 2019-12-28 at 18:35 +0000, Yangtao Li wrote:
> Use devm_platform_ioremap_resource() to simplify code.
> 

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
>  drivers/mailbox/mtk-cmdq-mailbox.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
> index 9a6ce9f5a7db..7f9e34b021c8 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -458,7 +458,6 @@ static struct mbox_chan *cmdq_xlate(struct mbox_controller *mbox,
>  static int cmdq_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> -	struct resource *res;
>  	struct cmdq *cmdq;
>  	int err, i;
>  
> @@ -466,8 +465,7 @@ static int cmdq_probe(struct platform_device *pdev)
>  	if (!cmdq)
>  		return -ENOMEM;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	cmdq->base = devm_ioremap_resource(dev, res);
> +	cmdq->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(cmdq->base)) {
>  		dev_err(dev, "failed to ioremap gce\n");
>  		return PTR_ERR(cmdq->base);

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
