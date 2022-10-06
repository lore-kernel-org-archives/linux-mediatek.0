Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D0CBC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Oct 2022 12:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i2dFv5u/USsOJ5+ExuxllA/r71M3NGC2+F4uNH0Sfu0=; b=3QM5cZgHjVlhW/D5xBYp+ZJpN5
	VW+amUQw5yXXSVO4XcsM65esPEEZ9hMNsRhd/atIB0q41BbmBhtaBjjinYo5nm2MGC2qFsssMnKVa
	71Qcx643I0brhzCRV+Ci9R7DJp3J13t95KCgPlDUAzzk0UAOxQ/fPU5oR/rafF5Gom47m6vlatNSK
	6p7tx8EoZmtaBaP/IVyYlyBcoE1S8hg9YIgT6AWAz/pXILrdpDkaAhL/tI8f//jQ9VSgAPhMcdjkr
	LoFioFqx3HNG6VRLHLdN4uWrfWl5FBnO3+jR074AOx0I3z43c2jC1paIYZA1ZyvSzxpw60Qi95t5x
	48nwXo8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogPvE-002EQ5-Oz; Thu, 06 Oct 2022 12:24:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogPv2-002ENb-W2; Thu, 06 Oct 2022 12:24:06 +0000
X-UUID: 4880537ec76345e582b3315ed165cd53-20221006
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=i2dFv5u/USsOJ5+ExuxllA/r71M3NGC2+F4uNH0Sfu0=;
	b=UHb98RNkFzs7vJF0XW2YXG+rWY+n1g+WvRyB5dKPc5ac4pq44TIbLw0tRfsr7+JRye8jySyEcP+eEmdF4ENfuG0P4kY/u50YquWJGfRp/VgtfbIru6QbkOKy8Cmk1Wd+NITQgzxGTi95HUxPck9JGLbDPVLvvZubnkfcZEm+C3E=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:526b7909-c05c-479f-9a83-528b14ca467f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:ad7b73fe-ee8c-4ff7-afe9-644435e96625,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 4880537ec76345e582b3315ed165cd53-20221006
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <roger.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1552270628; Thu, 06 Oct 2022 05:23:58 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 6 Oct 2022 19:43:21 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 6 Oct 2022 19:43:21 +0800
Message-ID: <cf0c39bdb5da55d850b3bf33bf76f5862becb098.camel@mediatek.com>
Subject: Re: [PATCH 5/8] soc: mediatek: mtk-svs: Move SoC specific functions
 to new files
From: Roger Lu <roger.lu@mediatek.com>
To: <matthias.bgg@kernel.org>, <jia-wei.chang@mediatek.com>
CC: <nfraprado@collabora.com>, <khilman@baylibre.com>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<angelogioacchino.delregno@collabora.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>
Date: Thu, 6 Oct 2022 19:43:21 +0800
In-Reply-To: <20220928155519.31977-6-matthias.bgg@kernel.org>
References: <20220928155519.31977-1-matthias.bgg@kernel.org>
	 <20220928155519.31977-6-matthias.bgg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_052405_061785_DDB01F75 
X-CRM114-Status: GOOD (  11.02  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Matthias Sir,

> drivers/soc/mediatek/mtk-svs-mt8183.c | 234 ++++++++
> drivers/soc/mediatek/mtk-svs-mt8192.c | 100 ++++

We've encountered some build warnings as below. Could we put mtk-svs-mtxx.c
implementation into mt81xx-svs.h and remove mtk-svs-mtxx.c?

kernel/mediatek/drivers/soc/mediatek/mtk-svs-mt8183.c:103:6: warning: no
previous prototype for ‘svs_mt8183_efuse_parsing’ [-Wmissing-prototypes]
 bool svs_mt8183_efuse_parsing(struct svs_platform *svsp)
      ^~~~~~~~~~~~~~~~~~~~~~~~
/mfs/mtkslt1043/mtk11157/upstream/2022_1003_1704/kernel/mediatek/drivers/soc/med
iatek/mtk-svs-mt8183.c:198:5: warning: no previous prototype for
‘svs_mt8183_platform_probe’ [-Wmissing-prototypes]
 int svs_mt8183_platform_probe(struct svs_platform *svsp)
     ^~~~~~~~~~~~~~~~~~~~~~~~~

kernel/mediatek/drivers/soc/mediatek/mtk-svs-mt8192.c:5:6: warning: no previous
prototype for ‘svs_mt8192_efuse_parsing’ [-Wmissing-prototypes]
 bool svs_mt8192_efuse_parsing(struct svs_platform *svsp)
      ^~~~~~~~~~~~~~~~~~~~~~~~
/mfs/mtkslt1043/mtk11157/upstream/2022_1003_1704/kernel/mediatek/drivers/soc/med
iatek/mtk-svs-mt8192.c:67:5: warning: no previous prototype for
‘svs_mt8192_platform_probe’ [-Wmissing-prototypes]
 int svs_mt8192_platform_probe(struct svs_platform *svsp)

...[snip]...

> +#define debug_fops_ro(name)						\
> +	static int svs_##name##_debug_open(struct inode *inode,		\
> +					   struct file *filp)		\
> +	{								\
> +		return single_open(filp, svs_##name##_debug_show,	\
> +				   inode->i_private);			\
> +	}								\
> +	static const struct file_operations svs_##name##_debug_fops = {	\
> +		.owner = THIS_MODULE,					\
> +		.open = svs_##name##_debug_open,			\
> +		.read = seq_read,					\
> +		.llseek = seq_lseek,					\
> +		.release = single_release,				\
> +	}
> +
> +#define debug_fops_rw(name)						\
> +	static int svs_##name##_debug_open(struct inode *inode,		\
> +					   struct file *filp)		\
> +	{								\
> +		return single_open(filp, svs_##name##_debug_show,	\
> +				   inode->i_private);			\
> +	}								\
> +	static const struct file_operations svs_##name##_debug_fops = {	\
> +		.owner = THIS_MODULE,					\
> +		.open = svs_##name##_debug_open,			\
> +		.read = seq_read,					\
> +		.write = svs_##name##_debug_write,			\
> +		.llseek = seq_lseek,					\
> +		.release = single_release,				\
> +	}
> +
> +#define svs_dentry_data(name)	{__stringify(name),
> &svs_##name##_debug_fops}
> +

CHECK: Please don't use multiple blank lines
#208: FILE: drivers/soc/mediatek/mtk-svs.c:208:
+
+

...[snip]...

> -static struct device *svs_get_subsys_device(struct svs_platform *svsp,
> +struct device *svs_get_subsys_device(struct svs_platform *svsp,
>  					    const char *node_name)
>  {
>  	struct platform_device *pdev;
> @@ -2032,7 +1522,7 @@ static struct device *svs_get_subsys_device(struct
> svs_platform *svsp,
>  	return &pdev->dev;
>  }
>  
> -static struct device *svs_add_device_link(struct svs_platform *svsp,
> +struct device *svs_add_device_link(struct svs_platform *svsp,
>  					  const char *node_name)

CHECK: Alignment should match open parenthesis
#1502: FILE: drivers/soc/mediatek/mtk-svs.c:1502:
+struct device *svs_get_subsys_device(struct svs_platform *svsp,
+                                           const char *node_name)

CHECK: Alignment should match open parenthesis
#1526: FILE: drivers/soc/mediatek/mtk-svs.c:1526:
+struct device *svs_add_device_link(struct svs_platform *svsp,
+                                         const char *node_name)

... [snip]...

> +struct device *svs_add_device_link(struct svs_platform *svsp,
> +					  const char *node_name);
> +struct device *svs_get_subsys_device(struct svs_platform *svsp,
> +					    const char *node_name);

CHECK: Alignment should match open parenthesis
#269: FILE: drivers/soc/mediatek/mtk-svs.h:269:
+struct device *svs_add_device_link(struct svs_platform *svsp,
+                                         const char *node_name);

CHECK: Alignment should match open parenthesis
#271: FILE: drivers/soc/mediatek/mtk-svs.h:271:
+struct device *svs_get_subsys_device(struct svs_platform *svsp,
+                                           const char *node_name);

> +int svs_thermal_efuse_get_data(struct svs_platform *svsp);
> +
> +void svs_get_bank_volts_v2(struct svs_platform *svsp);
> +void svs_set_bank_freq_pct_v2(struct svs_platform *svsp);
> +
> +void svs_get_bank_volts_v3(struct svs_platform *svsp);
> +void svs_set_bank_freq_pct_v3(struct svs_platform *svsp);
> +#endif

Sincerely,
Roger Lu.


