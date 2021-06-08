Return-Path: <SRS0=WQwL=LC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 775CDC47082
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 22:41:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33A7860551
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 22:41:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33A7860551
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nrfPIBd0O5+KOmtyuAI4qpo2//DI6IqSNKL+6D9QVLU=; b=ESUMvDYuPkSn8f
	PlMmZn0lOUoSK0En/K2N4U3GuwLlCiLkAN9vZAunCv6Gs5FhJ9TwpZo68AHqll9ki6DJHUOk6x3wA
	obY3eov+8PKJiOagHnTQeChRjKvv4pLYzdVgO4HgIMn3Gdyl8PipQvLjdOfYnIDW6WgrTmOzRfY8z
	4lxrPE/vdkAZAxHawRxfWmlq7k1BudZST6NRsykK8dIZZP02+9aTtMeAXuuSYbkFFWK7lctZJimsp
	sv8I8cd7rOTgs9f721RHS6Bg4Gn6XzoDEgNv8NX0Ga2rxxQu59Aqo7I8WS4kOWdtVl2zCEkXqQ2rU
	fCsRx8iQGcT4Lrwhu/yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqkMn-00Aftf-T7; Tue, 08 Jun 2021 22:38:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqkMi-00AfsT-JW; Tue, 08 Jun 2021 22:38:35 +0000
X-UUID: a89b9c0d7f49438b9504f56334870f46-20210608
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ivMnUFJafxDha8EQimrXm/APkwffM+/2AWU/I6lOamU=; 
 b=I+qTarQLyx+iCfTlcGnysgKa0Gqq+4813uWfjY2YF7ExM8JX/dEbZLS1rgxx8NyJ2YCbRe12zj43U8R89M7erdkOmGz9qcvvctXz5za56BBVLWgwtuMZ9HeXeoCBVXwAIAoQKu2iaYw/l7VlgQOIzQFM1O7couqlup2qVo41W8Y=;
X-UUID: a89b9c0d7f49438b9504f56334870f46-20210608
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2120903996; Tue, 08 Jun 2021 15:38:26 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Jun 2021 15:38:24 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Jun 2021 06:38:22 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 9 Jun 2021 06:38:22 +0800
Message-ID: <ef9441888d4ca82d79295106548dd3d463c9c8bc.camel@mediatek.com>
Subject: Re: [PATCH v9 18/22] clk: mediatek: Add MT8192 mmsys clock support
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring
 <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Weiyi Lu
 <weiyi.lu@mediatek.com>
Date: Wed, 9 Jun 2021 06:38:22 +0800
In-Reply-To: <7520a10b-b362-03d4-e41b-e2098ae26621@gmail.com>
References: <20210524122053.17155-1-chun-jie.chen@mediatek.com>
 <20210524122053.17155-19-chun-jie.chen@mediatek.com>
 <7520a10b-b362-03d4-e41b-e2098ae26621@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_153834_061197_BCD9D708 
X-CRM114-Status: GOOD (  24.97  )
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

On Tue, 2021-06-08 at 16:44 +0200, Matthias Brugger wrote:
> 
> On 24/05/2021 14:20, Chun-Jie Chen wrote:
> > Add MT8192 mmsys clock provider
> > 
> > Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> > Signed-off-by: chun-jie.chen <chun-jie.chen@mediatek.com>
> > ---
> >  drivers/clk/mediatek/Kconfig         |   6 ++
> >  drivers/clk/mediatek/Makefile        |   1 +
> >  drivers/clk/mediatek/clk-mt8192-mm.c | 108
> > +++++++++++++++++++++++++++
> >  3 files changed, 115 insertions(+)
> >  create mode 100644 drivers/clk/mediatek/clk-mt8192-mm.c
> > 
> 
> [...]
> > +
> > +static int clk_mt8192_mm_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct device_node *node = dev->parent->of_node;
> > +	struct clk_onecell_data *clk_data;
> > +	int r;
> > +
> > +	clk_data = mtk_alloc_clk_data(CLK_MM_NR_CLK);
> > +	if (!clk_data)
> > +		return -ENOMEM;
> > +
> > +	r = mtk_clk_register_gates(node, mm_clks, ARRAY_SIZE(mm_clks),
> > clk_data);
> > +	if (r)
> > +		return r;
> > +
> > +	return of_clk_add_provider(node, of_clk_src_onecell_get,
> > clk_data);
> > +}
> > +
> > +static struct platform_driver clk_mt8192_mm_drv = {
> > +	.probe = clk_mt8192_mm_probe,
> > +	.driver = {
> > +		.name = "clk-mt8192-mm",
> > +	},
> > +};
> 
> Did you had a look at drivers/soc/mediatek/mtk-mmsys.c? How is the
> MMSYS
> different from all the other SoCs? I suppose it is not. Please don't
> just
> implement the clock drivers, but check in existing code how they play
> together
> with the HW they are for. MediaTek unfortunately has the design to
> add the clock
> registers in the address space of the IP block that needs this
> registers. Which
> makes it more complicated to implement clock driver in the first
> place.
> 
> Regards,
> Matthias

Did you means binding the mm clock driver by creating a platform device
in drivers/soc/mediatek/mtk-mmsys.c? There is 8192 mmsys compatible
data in patch [1] but lack of it in the latest patch [2], I will check
it.
Thanks for your kind reminder.

[1] 
https://patchwork.kernel.org/project/linux-mediatek/patch/1609815993-22744-11-git-send-email-yongqiang.niu@mediatek.com/
[2] 
https://patchwork.kernel.org/project/linux-mediatek/patch/1618236288-1617-5-git-send-email-yongqiang.niu@mediatek.com/

Best Regards,
Chun-Jie
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
