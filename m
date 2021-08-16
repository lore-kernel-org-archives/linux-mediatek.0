Return-Path: <SRS0=ZvcN=NH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7119C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 04:27:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D523606A5
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 04:27:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5D523606A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tWwKtgWCNNOs9NTOCV7QM6GJmza0O8AvQARpVmrtXB4=; b=q4LsHfR7VVKb0D
	gP98H0WoNgL0lyd1hiCDQItPR1oGXt22V+kgSle8DFtbxP03MFzTMgi9hyrEHc4oak5uTCorWjInh
	wkACH1qHH7VpfDAlU8lB0nJ0pY1C1r0F2gQpCBsfe8U2Sl2LbLXnG6ucZBInanaIdKdQ0m09hDIL8
	zxhvpeU6JW4plmmWzcwVAv58m0Uyj2MnLYxw78ms4ZXZOqws1b3HpYzIRA75myF9enqPkwNiBp3la
	CDKTGXFM9CibhpFAxVeZvNtF4kN9Yxr20C4/Nmg59z3VTqFI5Z3FBXNzCCzC9SQWipx3/9giMXYX9
	3/lrLxk5Cy0/6qkH+Olw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFUD1-00G641-N8; Mon, 16 Aug 2021 04:26:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFUCf-00G62f-1w; Mon, 16 Aug 2021 04:26:36 +0000
X-UUID: 9734b4f3838b48a79981c9f7fd91e67a-20210815
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=75z41JHo4jjGziE47FcivuBdbVLRxrMx8X85H0Fok1E=; 
 b=cyHfyPcLieBmz4SPO225e/FrnL2Nkew8M4aCLKRdzBCi3/wPAdUx86mmpn6BRXz+dvoI413wBdrnFt7ajrq9ZUTMkOq0mxmg9kblbVJzCNsyFOvi5VLVMxCC+SQqywXK6cFidIIuz5LGSqVE8Z6yMnPPgLmWGTHdTZxK4mcdeAY=;
X-UUID: 9734b4f3838b48a79981c9f7fd91e67a-20210815
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <houlong.wei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 226956749; Sun, 15 Aug 2021 21:26:23 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 15 Aug 2021 21:26:21 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 16 Aug 2021 12:26:06 +0800
Received: from mhfsdcap04 (10.17.3.154) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 16 Aug 2021 12:26:06 +0800
Message-ID: <484e199d23a09d79f121ea37eb9e7d95eabfd886.camel@mediatek.com>
Subject: Re: [PATCH] media: mtk-mdp: make mtk_mdp_comp_init static
From: houlong wei <houlong.wei@mediatek.com>
To: Eizan Miyamoto <eizan@chromium.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
CC: "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>,
 "dafna.hirschfeld@collabora.com" <dafna.hirschfeld@collabora.com>, "Andrew-CT
 Chen =?UTF-8?Q?=28=E9=99=B3=E6=99=BA=E8=BF=AA=29?="
 <Andrew-CT.Chen@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Minghsiu Tsai
 =?UTF-8?Q?=28=E8=94=A1=E6=98=8E=E4=BF=AE=29?= <Minghsiu.Tsai@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, <houlong.wei@mediatek.com>
Date: Mon, 16 Aug 2021 12:26:07 +0800
In-Reply-To: <20210811171512.1.I4a34d99ace27ad2fe55e22c90244d3bba2c29bab@changeid>
References: <20210811171512.1.I4a34d99ace27ad2fe55e22c90244d3bba2c29bab@changeid>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 67B8FCEFAC2E30AB80B2D6E2060C2D7B791BC54275D89F0FBD2475ECC40D88E32000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210815_212632_684962_0FA1BF5C 
X-CRM114-Status: GOOD (  17.04  )
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

On Wed, 2021-08-11 at 15:15 +0800, Eizan Miyamoto wrote:
> This function isn't and doesn't need to be used outside of
> mtk_mdp_comp.c
> 
> This patch depends on and is a follow-up to
> 
https://patchwork.kernel.org/project/linux-mediatek/list/?series=524929
> 
> Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
> ---

Reviewed-by: Houlong Wei <houlong.wei@mediatek.com>

>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 2 +-
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.h | 2 --
>  2 files changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> index 9527649de98e..2cf8f1864f8c 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> @@ -234,7 +234,7 @@ static const struct component_ops
> mtk_mdp_component_ops = {
>  	.unbind = mtk_mdp_comp_unbind,
>  };
>  
> -int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device *dev)
> +static int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct
> device *dev)
>  {
>  	struct device_node *larb_node;
>  	struct platform_device *larb_pdev;
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> index e3d6aef52869..aa6442cc8c1d 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> @@ -21,8 +21,6 @@ struct mtk_mdp_comp {
>  	struct device		*larb_dev;
>  };
>  
> -int mtk_mdp_comp_init(struct mtk_mdp_comp *comp, struct device
> *dev);
> -
>  int mtk_mdp_comp_power_on(struct mtk_mdp_comp *comp);
>  int mtk_mdp_comp_power_off(struct mtk_mdp_comp *comp);
>  
> -- 
> 2.32.0.605.g8dce9f2422-goog
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
