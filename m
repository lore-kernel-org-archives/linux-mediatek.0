Return-Path: <SRS0=HbKG=JG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 261F7C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 01:44:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5621610A3
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 01:44:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5621610A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MGXX7TTT0QTJugQT07znnqmAXT2ETBqwCRX6LHYYRFE=; b=GwNP/19J5Wmc15JVslUcs22Ib
	vBiWJZcXwoesY9XM6vL+hcziuPXkB0AvQrhCIZqkANj6P+k+Mbg6VrTHs7x/VkLhu0nlA4K1VwOnO
	s0Pue5vupxV7l2c8mipaD5LtRqFFbvjaPudpgLSvXedUCwxkDGMwo2C23WuAOvpvgjt7ij6T5TRbA
	aikII03LKEnsdypFelvSkWW6CWhfzJZH5A1QvEqMi83mtTlxTgYNx+sU8huYOAaZGcgFS/LwOgxUy
	MW7mCtnzVOyzjr0t3hn9Hf5ZSTwewoRLv88YToaRgUlG4cExpP5pOcNX9WE75wlQI1wknA3hNosUA
	7MehbmY8A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUgCA-009f5P-QY; Fri, 09 Apr 2021 01:44:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUgBw-009f2U-Ki; Fri, 09 Apr 2021 01:44:16 +0000
X-UUID: dc2ab52bcf7c410f93e2c87cb9fe9022-20210408
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=QlQV/IjGGqn8yZBn7TzzTKt2J3XWX4ZDL0hPjNElmPk=; 
 b=XO4qE+DO9QylqmUgxDWhuDixTsvO9ot0/QhlwC20bPZrypM/ZZcXOsSitQgMDjZQCPdbkFSI3HHtKbOV6FTlHRRpM4QGRGIYMPsyltZyUWoYo42MT4uCq66rfxS041mZW5AZAJcZJIsL/xL3cK2qBZiWuUtTT9QI5XvqiBOWpIA=;
X-UUID: dc2ab52bcf7c410f93e2c87cb9fe9022-20210408
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1351644486; Thu, 08 Apr 2021 18:44:06 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 8 Apr 2021 18:34:04 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 9 Apr 2021 09:34:00 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 9 Apr 2021 09:34:00 +0800
Message-ID: <1617932040.12105.11.camel@mhfsdcap03>
Subject: Re: [PATCH v2 -next] phy: phy-mtk-hdmi: Remove redundant dev_err
 call in mtk_hdmi_phy_probe()
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: He Ying <heying24@huawei.com>
CC: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <kishon@ti.com>,
 <vkoul@kernel.org>, <matthias.bgg@gmail.com>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-phy@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Date: Fri, 9 Apr 2021 09:34:00 +0800
In-Reply-To: <20210408115530.15673-1-heying24@huawei.com>
References: <20210408115530.15673-1-heying24@huawei.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: FB4F945084C6864C1700CE1A8C0D5AD93A629F8E0CEFB464A6F6F98223C2952B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_024414_754777_596326C1 
X-CRM114-Status: GOOD (  15.24  )
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

On Thu, 2021-04-08 at 07:55 -0400, He Ying wrote:
> There is a error message within devm_ioremap_resource
> already, so remove the dev_err call to avoid redundant
> error message.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: He Ying <heying24@huawei.com>
> ---
> v2:
> - Use 'return PTR_ERR()' instead of 'ret = PTR_ERR();return ret;'.
> 
>  drivers/phy/mediatek/phy-mtk-hdmi.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/phy/mediatek/phy-mtk-hdmi.c b/drivers/phy/mediatek/phy-mtk-hdmi.c
> index 8313bd517e4c..8ad8f717ef43 100644
> --- a/drivers/phy/mediatek/phy-mtk-hdmi.c
> +++ b/drivers/phy/mediatek/phy-mtk-hdmi.c
> @@ -119,9 +119,7 @@ static int mtk_hdmi_phy_probe(struct platform_device *pdev)
>  	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	hdmi_phy->regs = devm_ioremap_resource(dev, mem);
>  	if (IS_ERR(hdmi_phy->regs)) {
> -		ret = PTR_ERR(hdmi_phy->regs);
> -		dev_err(dev, "Failed to get memory resource: %d\n", ret);
> -		return ret;
> +		return PTR_ERR(hdmi_phy->regs);
>  	}
Reviewed-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Thanks a lot
>  
>  	ref_clk = devm_clk_get(dev, "pll_ref");

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
