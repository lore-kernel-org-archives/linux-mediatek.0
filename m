Return-Path: <SRS0=wG/x=E7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39BE4C2D0E4
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 02:24:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4A9120678
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 02:24:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mrtq1iC6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="NCA0F+al"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4A9120678
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qVi3EwA16h9DMynOVo0HnPRyWnF+pRIMH2u7TLuecdk=; b=mrtq1iC6Am/TnSp2C9309CRpW
	o/l95EtViqMbJR0QBPLubguNHaLiHszpKDmRN2LYI1AAlrpVEdT8yf44ZoY0OZwu/AF+dqPoKna6A
	UbIuDuNgQBVuHGY9lkTw0WspF/LccAzSCU0LptOuuhTDm97K3CqsMAwbKkh5fMDFszCJt5boyeUiS
	wp6SvcZUyUl0/HVL6qYRy+hXAkL/GvIhZbTz3W3JedWxL95XeW0hh8uVhijzN6aTZv7emUaCnZj8V
	E32d63GUXUyw7CmpoGddoBVKCN2lLLSYvgUBwBqpQ4GhwYwjX02PnNPwifC8M+B76WIA8UDx7/b8R
	U7Jf9TsWA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khkTp-0002jS-HJ; Wed, 25 Nov 2020 02:24:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khkTl-0002hf-RH; Wed, 25 Nov 2020 02:24:23 +0000
X-UUID: cce79962ab9e4f8cae3a403983398e4a-20201124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=WL55vboZZ3dXagtqBYzxQcXVcZpJORx9ydPC+NvFj5k=; 
 b=NCA0F+algkuaRNJd7Fkwdgw4rplW6l5UI7bv4703xoMuEOiKgrkM+AwGbxk4aBoaGydjlmPfHti0OUjT0HB+Q/rlHf8gJ3m2eLViNi/Rq0Xi0AA9p7IOM1ZHhUDB0IwRXhnMzQikLhm3eAYqaXjMjs4ObduEceJkwJ07sWBtMQs=;
X-UUID: cce79962ab9e4f8cae3a403983398e4a-20201124
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 313474837; Tue, 24 Nov 2020 18:24:06 -0800
Received: from MTKMBS32N2.mediatek.inc (172.27.4.72) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 Nov 2020 18:24:09 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS32N2.mediatek.inc
 (172.27.4.72) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 25 Nov 2020 10:24:04 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 25 Nov 2020 10:24:04 +0800
Message-ID: <1606271044.32484.20.camel@mhfsdcap03>
Subject: Re: [PATCH] phy/mediatek: Make PHY_MTK_XSPHY depend on HAS_IOMEM
 and OF_ADDRESS to fix build errors
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Date: Wed, 25 Nov 2020 10:24:04 +0800
In-Reply-To: <1606211233-7425-1-git-send-email-yangtiezhu@loongson.cn>
References: <1606211233-7425-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9FB0A06CCF3590F0103C7A554F82C24ADD8313A5CDDE3B0898BB4E8F8795A64D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_212422_086347_FF3DCA07 
X-CRM114-Status: GOOD (  19.73  )
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
Cc: Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 linux-mediatek@lists.infradead.org, Xuefeng Li <lixuefeng@loongson.cn>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Tiezhu,

On Tue, 2020-11-24 at 17:47 +0800, Tiezhu Yang wrote:
> devm_ioremap_resource() will be not built in lib/devres.c if
> CONFIG_HAS_IOMEM is not set, of_address_to_resource() will be
> not built in drivers/of/address.c if CONFIG_OF_ADDRESS is not
> set, and then there exists two build errors about undefined
> reference to "devm_ioremap_resource" and "of_address_to_resource"
> in phy-mtk-xsphy.c under COMPILE_TEST and CONFIG_PHY_MTK_XSPHY,
> make PHY_MTK_XSPHY depend on HAS_IOMEM and OF_ADDRESS to fix it.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  drivers/phy/mediatek/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/phy/mediatek/Kconfig b/drivers/phy/mediatek/Kconfig
> index 50c5e93..66df045 100644
> --- a/drivers/phy/mediatek/Kconfig
> +++ b/drivers/phy/mediatek/Kconfig
> @@ -30,6 +30,8 @@ config PHY_MTK_XSPHY
>  	tristate "MediaTek XS-PHY Driver"
>  	depends on ARCH_MEDIATEK || COMPILE_TEST
>  	depends on OF
> +	depends on HAS_IOMEM
> +	depends on OF_ADDRESS
Why not add them into deconfig but here? In fact I don't know which way
is better and follow the kernel rule.

Vinod and Kishon, do you have any suggestion about this?

>  	select GENERIC_PHY
>  	help
>  	  Enable this to support the SuperSpeedPlus XS-PHY transceiver for

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
