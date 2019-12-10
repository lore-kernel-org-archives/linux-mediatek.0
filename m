Return-Path: <SRS0=F6Lp=2A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80F9FC43603
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2019 01:25:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 521412073D
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2019 01:25:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uaIleQGb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="gcPpE+/5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 521412073D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cwNcYB0Ama5XZcBLk9b20E1ZnzK/ULXEZavbnQrev5k=; b=uaIleQGbiUIJJv
	YCwWFcNUTC5BbNZnJdgEZNhh+ZpDerp42x9csOl6XPvQK6egHliFdQvpWpXcXsYqExw93mLUlfLMh
	YdouPEqYakghH4Xmm+eqaAAs/5a39xy1ao/bZH9w99gcYiIHSjZ5kdVnKoK6NXSC4bxcZ6LHiToSl
	jJdsz3WHZ+6gvbxPcy8uyWgvNmSPLGaujyopzxsb0GNaaGECJQdGNvAo0Biv6fBnOa3EZkdN6v/21
	bMOYJwdaidPRu9LpjmvnxBvQKeTqD6byaOUACmzjLx5rNh1npYnSF3NACV0NR4/wlrQHZ82ntkGn9
	bu6fOVz8/TW43EMCZdmA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieUGz-0001ue-MD; Tue, 10 Dec 2019 01:25:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieUGg-0000yS-It; Tue, 10 Dec 2019 01:24:51 +0000
X-UUID: 4bda56e0eda04f5587c8c2463e0c8aab-20191209
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=uS+vnIodKcC3nYeOH364CYiGDOfQNtI3mPSCouI1v0o=; 
 b=gcPpE+/50n18No5AZmiEkd3C3cSllzyT7fYi6K8YFsPoZyqwFQ8VQr1H2plHvwffV2EGBag/Cckd/SwXSWTBqGaote7w/Hq4JfhE4QZKBaowDBMJh227YsKXJyFTZK0F1urZXGKKCvxMLNQOL8qPlpg9/UyM1RanJjrOPlNzus4=;
X-UUID: 4bda56e0eda04f5587c8c2463e0c8aab-20191209
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 830653311; Mon, 09 Dec 2019 17:24:46 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 9 Dec 2019 17:25:41 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 10 Dec 2019 09:23:39 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 10 Dec 2019 09:24:16 +0800
Message-ID: <1575941074.9782.0.camel@mtksdaap41>
Subject: Re: [PATCH v2 24/28] drm/mediatek: hdmi: Use drm_bridge_init()
From: CK Hu <ck.hu@mediatek.com>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Date: Tue, 10 Dec 2019 09:24:34 +0800
In-Reply-To: <20191204114732.28514-25-mihail.atanassov@arm.com>
References: <20191204114732.28514-1-mihail.atanassov@arm.com>
 <20191204114732.28514-25-mihail.atanassov@arm.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: C2053D4113A1F6C2D03FB17F90EEE848F312EC60C58E129E95C51A71E518A3AF2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_172450_627723_DB1FE953 
X-CRM114-Status: GOOD (  10.46  )
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
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 nd <nd@arm.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Mihail:

On Wed, 2019-12-04 at 11:48 +0000, Mihail Atanassov wrote:
> No functional change.
> 

Acked-by: CK Hu <ck.hu@mediatek.com>

> Signed-off-by: Mihail Atanassov <mihail.atanassov@arm.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> index f684947c5243..9761a80674d9 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -1708,8 +1708,8 @@ static int mtk_drm_hdmi_probe(struct platform_device *pdev)
>  
>  	mtk_hdmi_register_audio_driver(dev);
>  
> -	hdmi->bridge.funcs = &mtk_hdmi_bridge_funcs;
> -	hdmi->bridge.of_node = pdev->dev.of_node;
> +	drm_bridge_init(&hdmi->bridge, &pdev->dev, &mtk_hdmi_bridge_funcs,
> +			NULL, NULL);
>  	drm_bridge_add(&hdmi->bridge);
>  
>  	ret = mtk_hdmi_clk_enable_audio(hdmi);

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
