Return-Path: <SRS0=HZpZ=FM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79DC8C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Dec 2020 01:50:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 144EE238E7
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Dec 2020 01:50:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 144EE238E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=P4u0dj11taaDfQLAcMjR81jXwy239fHNjrIbOO7xpH0=; b=YlmUzG9rY2KgcSCB0Vk3W8jB6
	3Alcp9ou/RleOmEI6YXGVX3wayuoA421fKouOu8D1WWVgrE1KRNhE4wLCKuRaCMQ1PshjirUZBMIq
	CtB/cXL6p6Jkya6AduXd2AKFNmfXOtX7vzuMI6RRkk4CIrHoIjwjh8PU0alceDgrCQ3Jcs/vRu9ZW
	7eFr2HMQcf5b7rXubPm4veIRY+OGaiz6RT1AHRWaM1DG/5OaTZ+W+2KrHC1ARCrd1jxDfDFtXwKY3
	z5SwO1KQtRqOBL2HAdp4m/COUZfclLjc+qY66DsHn//nZzvHx6sr2N3wKI57dQ5MfgF3ixa88XY6M
	v3QT99rCQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmS8r-0006wi-I9; Tue, 08 Dec 2020 01:50:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmS8o-0006w2-EO; Tue, 08 Dec 2020 01:50:11 +0000
X-UUID: 9006af38c67042e1a05a8666cbf4a0c4-20201207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=dCzH311+U2RFvjPiv7C+GlVUPgKHpvOsRKaE8jAB0UM=; 
 b=dAks2qEQ9ToMg60OeCOyZKIZs2vHSPVaZtFyg63SUZxre5J+IYe0U1+QO+yv1ePO/vFjjqU/SyP7MLSZZaCooHp4ruB658gHV+xp9vdN4SCpMhIqYRxEan8hqQf+B6Fnp6IGd8zktk8cW25wiYpPb0JDnroWJRsQBsnmEJCFsXc=;
X-UUID: 9006af38c67042e1a05a8666cbf4a0c4-20201207
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1783293279; Mon, 07 Dec 2020 17:50:06 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Dec 2020 17:50:04 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs05n2.mediatek.inc
 (172.21.101.140) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 8 Dec 2020 09:49:59 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Dec 2020 09:49:57 +0800
Message-ID: <1607392202.23328.1.camel@mhfsdcap03>
Subject: Re: [PATCH][next] drm/mediatek: avoid dereferencing a null hdmi_phy
 on an error message
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Colin King <colin.king@canonical.com>
Date: Tue, 8 Dec 2020 09:50:02 +0800
In-Reply-To: <20201207150937.170435-1-colin.king@canonical.com>
References: <20201207150937.170435-1-colin.king@canonical.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_205010_634942_5DBDA134 
X-CRM114-Status: GOOD (  19.62  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 chunhui dai <chunhui.dai@mediatek.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>, CK Hu <ck.hu@mediatek.com>, Vinod
 Koul <vkoul@kernel.org>, linux-mediatek@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-12-07 at 15:09 +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently there is a null pointer check for hdmi_phy that implies it
> may be null, however a dev_err messages dereferences this potential null
> pointer.  Avoid a null pointer dereference by only emitting the dev_err
> message if hdmi_phy is non-null.  It is a moot point if the error message
> needs to be printed at all, but since this is a relatively new piece of
> code it may be useful to keep the message in for the moment in case there
> are unforseen errors that need to be reported.
> 
> Addresses-Coverity: ("Dereference after null check")
> Fixes: be28b6507c46 ("drm/mediatek: separate hdmi phy to different file")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/phy/mediatek/phy-mtk-hdmi.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/mediatek/phy-mtk-hdmi.c b/drivers/phy/mediatek/phy-mtk-hdmi.c
> index c5c61f5a9ea0..5184054783c7 100644
> --- a/drivers/phy/mediatek/phy-mtk-hdmi.c
> +++ b/drivers/phy/mediatek/phy-mtk-hdmi.c
> @@ -84,8 +84,9 @@ mtk_hdmi_phy_dev_get_ops(const struct mtk_hdmi_phy *hdmi_phy)
>  	    hdmi_phy->conf->hdmi_phy_disable_tmds)
>  		return &mtk_hdmi_phy_dev_ops;
>  
> -	dev_err(hdmi_phy->dev, "Failed to get dev ops of phy\n");
> -		return NULL;
> +	if (hdmi_phy)
> +		dev_err(hdmi_phy->dev, "Failed to get dev ops of phy\n");
> +			return NULL;
indentation: one tab before return

Thanks

>  }
>  
>  static void mtk_hdmi_phy_clk_get_data(struct mtk_hdmi_phy *hdmi_phy,

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
