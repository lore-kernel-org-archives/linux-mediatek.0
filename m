Return-Path: <SRS0=0SFh=HJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 154F5C433DB
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Feb 2021 01:45:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB37064E87
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Feb 2021 01:45:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB37064E87
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=j2mugsrM+BHz5Oaq36M2LT4OPtsOYxNSndAO7fq26Jw=; b=uOQTAVSEbhdAqWL3wt094/iFD
	DF12geay3QO3CpTGGwrem9KkkxgtWtcEjKmoxrupfWvIi5rvEMuMSoPuQJ+lSk20Sw0g2y+BOUYuk
	ET2nyzrE8dZBLr2IN8DxFZp8x20UTsFZpjl0kyzacP+kksdSd0eFLtX7xarCnXYmNQFsJ8UhG/kBD
	7UpU7JUdQ3Gsu7FJGaIAWL+/MQqW9uCZtr4mdRBMg5CpJsK6RjGUFmRJbCqIM7ywyX0kQP35fBzqO
	RqHPnetJAULAWJJiTGgpt8VtN0CJ3b607I7OnXfcLd/xRG3qBmFketoRisUIADYptphqNyYzEwY05
	bzpzWOITA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8Z8u-0004Pw-Co; Sun, 07 Feb 2021 01:45:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8Z8q-0004On-IT; Sun, 07 Feb 2021 01:45:38 +0000
X-UUID: 74feca78e12e4182bec474e556ae678b-20210206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=UOcodyhE36vNMhq5b0qi4z7RJDMmPhWYZvVA5+EV+68=; 
 b=I1A0/qzk9afNaXia6AWsmFc5zD8zmrMHswca9erF1+Sj5WtfKR/9iqusGc7NFkajs2Krl+ghGOMG5JyYzXG04md0fMR2yKfqxzp2uS2MdsZYHdoFVEFPdbfMMIst9RlOzPT+tFrFN76+HGMqo248uGyQrAlXyzpcx4wA4KGzdTc=;
X-UUID: 74feca78e12e4182bec474e556ae678b-20210206
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 759488060; Sat, 06 Feb 2021 17:45:29 -0800
Received: from MTKMBS33N2.mediatek.inc (172.27.4.76) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 6 Feb 2021 17:45:28 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sun, 7 Feb 2021 09:45:23 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 7 Feb 2021 09:45:19 +0800
Message-ID: <1612662319.2524.16.camel@mhfsdcap03>
Subject: Re: [PATCH] iommu/mediatek: Fix error code in probe()
From: Yong Wu <yong.wu@mediatek.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 7 Feb 2021 09:45:19 +0800
In-Reply-To: <YB0+GU5akSdu29Vu@mwanda>
References: <YB0+GU5akSdu29Vu@mwanda>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: A90FA4188E79EC868A03301EA33900D9514BD2F174ABA508AF7335354372B47E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210206_204537_406219_EE3B23D3 
X-CRM114-Status: GOOD (  15.75  )
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
Cc: Joerg Roedel <joro@8bytes.org>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2021-02-05 at 15:46 +0300, Dan Carpenter wrote:
> This error path is supposed to return -EINVAL.  It used to return
> directly but we added some clean up and accidentally removed the
> error code.  Also I fixed a typo in the error message.
> 
> Fixes: c0b57581b73b ("iommu/mediatek: Add power-domain operation")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Yong Wu <yong.wu@mediatek.com>

> ---
>  drivers/iommu/mtk_iommu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 0ad14a7604b1..5f78ac0dc30e 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -886,7 +886,8 @@ static int mtk_iommu_probe(struct platform_device *pdev)
>  	link = device_link_add(data->smicomm_dev, dev,
>  			DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME);
>  	if (!link) {
> -		dev_err(dev, "Unable link %s.\n", dev_name(data->smicomm_dev));
> +		dev_err(dev, "Unable to link %s.\n", dev_name(data->smicomm_dev));
> +		ret = -EINVAL;
>  		goto out_runtime_disable;
>  	}
>  

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
