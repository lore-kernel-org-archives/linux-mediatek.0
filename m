Return-Path: <SRS0=yE1p=NL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36F71C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Aug 2021 09:38:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F35B261051
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Aug 2021 09:38:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F35B261051
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q3xsA/MdxZsFaO7AT8gPPLfzcCa0FL7cTubO4DHlyk8=; b=wFU0gq2z79zSw5
	e4eURn3CEWR/cAB2DVb7c1Sl/sTThI3pZf+3ad0ZnfNJIPbgwe4E4I1c0tg5l1fZrmrtmE0yS6QjW
	bBoMWDruybb+VxzgXuEaslpHrjrDqMbJYmuchx0gB7ZUhpf2YAIlUJzPuqPFxIh1bWJ97/8UVmiWR
	P4WkbOiMFLMg0ezR+DLVhl+nmhqF8RRHWf4KhMF6HwrIdubkdufIOv8h/ReBqvw49AJVMgBotCfbT
	8Y/sUVmn+UNy7idP3VvRD9dR67s3cA2uVJB2WVQkLPSuQSTvqqZsHQXiZ74mG/kd+/RsxcjVLNjBc
	QR/MqCaYERGk4WoouBdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mH0yb-00AXKM-Cy; Fri, 20 Aug 2021 09:38:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mH0yI-00AXFf-8o; Fri, 20 Aug 2021 09:37:58 +0000
X-UUID: 08000bfb9929402db9d1ad23606169f4-20210820
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=4Y/FH3iXL+/m9wsv5YTYuPEUK+mliUM7GZNw5VfSRxk=; 
 b=d+s+yAXsrCONxSDz4ItLNRLCVm3f87OVhVy4dcuCer9eRcTcNMqIQ4GvNvV2+06VV1KYVyi7Y+gO/Dlr3bZhxCZdrtIkR/ZTu4dfDH00JJcSrl0yQkAi6lo+WU1l77tU9b7ckaga1S9f69QsMO8mp4NokzowH7zUhPbh07WIKZU=;
X-UUID: 08000bfb9929402db9d1ad23606169f4-20210820
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 898566606; Fri, 20 Aug 2021 02:37:50 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 Aug 2021 02:37:48 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 Aug 2021 17:37:46 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 20 Aug 2021 17:37:46 +0800
Message-ID: <1629452267.23725.3.camel@mtksdaap41>
Subject: Re: [PATCH v8 12/13] drm/mediatek: add MERGE support for mediatek-drm
From: CK Hu <ck.hu@mediatek.com>
To: jason-jh.lin <jason-jh.lin@mediatek.com>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 <fshao@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>, "Enric Balletbo
 i Serra" <enric.balletbo@collabora.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Fabien Parent <fparent@baylibre.com>,
 <hsinyi@chromium.org>, Yongqiang Niu <yongqiang.niu@mediatek.com>, Jitao shi
 <jitao.shi@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
Date: Fri, 20 Aug 2021 17:37:47 +0800
In-Reply-To: <20210819022327.13040-13-jason-jh.lin@mediatek.com>
References: <20210819022327.13040-1-jason-jh.lin@mediatek.com>
 <20210819022327.13040-13-jason-jh.lin@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_023754_357546_3581B23C 
X-CRM114-Status: GOOD (  12.60  )
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

Hi, Jason:

On Thu, 2021-08-19 at 10:23 +0800, jason-jh.lin wrote:
> Add MERGE engine file:
> MERGE module is used to merge two slice-per-line inputs
> into one side-by-side output.
> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---

[snip]

> +
> +int mtk_merge_clk_enable(struct device *dev)
> +{
> +	int ret = 0;
> +	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
> +
> +	ret = clk_prepare_enable(priv->clk);
> +	if (ret)
> +		pr_err("merge clk prepare enable failed\n");
> +
> +	if (priv->async_clk) {

This checking is redundant.

> +		ret = clk_prepare_enable(priv->async_clk);
> +		if (ret)
> +			pr_err("async clk prepare enable failed\n");
> +	}
> +
> +	return ret;
> +}
> +
> +void mtk_merge_clk_disable(struct device *dev)
> +{
> +	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
> +
> +	if (priv->async_clk)

Ditto.

Regards,
CK

> +		clk_disable_unprepare(priv->async_clk);
> +
> +	clk_disable_unprepare(priv->clk);
> +}
> +


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
