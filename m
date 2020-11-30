Return-Path: <SRS0=DVVK=FE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B655C64E7B
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Nov 2020 15:39:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A2AA20725
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Nov 2020 15:39:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2X2bphKi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="oFaE7bMw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A2AA20725
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+TflB8UUHNki8pNrjdHDHLyRbcyvdlBdocDmWLEMecM=; b=2X2bphKieljM9UF+Z9MdNAPGq
	WaUazlPUjgtWsZB4lumnJpd+EESRSW36c3B9GwCK1HJJcJNpm4vsFaK7bRbH3OzYIfz1kHy17PD6n
	4Gny2KKbaLlgYh/1rAab6umAhMTDqxIjS5YyFxZuJWdCZ4CuC132jvB0/8C0tB9+1nHBkNtAYrmET
	pRmxop8VSbOsHKspaXMSHS4wkWyZyc9/fclBepIfwBkPmt3hzBuQ44l/f25u+WKPg1EUPpvx+r17z
	XxbGNUeSvobH5Mlhs61DfFLxYBJaSLSrTZFElLJ0UgCgSICsL0n2Wa2kYXDs3E4UVYvJYyeLdDOJN
	9j3TijSXg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjlH3-0001hR-U5; Mon, 30 Nov 2020 15:39:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjlGy-0001fP-JT; Mon, 30 Nov 2020 15:39:29 +0000
Received: from localhost (unknown [122.171.214.243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C3CA2206C0;
 Mon, 30 Nov 2020 15:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606750767;
 bh=7f4KPZ4iCisw1kDO37mrD2ADltaAvJw3PYEd004KdcQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oFaE7bMwAMwcR764NAnL3/nzWmHQ0jrv+mfH2NWabKqNrZbLbajElNCV5kGb85xMI
 ahd6Wm1OHFWfzj41bNyrvis7+SmK7ZkEp9H6yw1dGP0QQt2IQMfp0iI/8avfksG/M7
 GxRHpX6WHE9JrJw31d1Jj3ppp7mdLbJ/sDdAJDEE=
Date: Mon, 30 Nov 2020 21:09:23 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [PATCH v2] phy: mediatek: Make PHY_MTK_{XSPHY,TPHY} depend on
 HAS_IOMEM and OF_ADDRESS to fix build errors
Message-ID: <20201130153923.GV8403@vkoul-mobl>
References: <1606289865-692-1-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1606289865-692-1-git-send-email-yangtiezhu@loongson.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_103928_849161_BD111445 
X-CRM114-Status: GOOD (  11.67  )
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
Cc: Heiko Stuebner <heiko@sntech.de>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>,
 linux-mediatek@lists.infradead.org, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Xuefeng Li <lixuefeng@loongson.cn>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 25-11-20, 15:37, Tiezhu Yang wrote:
> devm_ioremap_resource() will be not built in lib/devres.c if
> CONFIG_HAS_IOMEM is not set, of_address_to_resource() will be
> not built in drivers/of/address.c if CONFIG_OF_ADDRESS is not
> set, and then there exists two build errors about undefined
> reference to "devm_ioremap_resource" and "of_address_to_resource"
> in phy-mtk-xsphy.c under COMPILE_TEST and CONFIG_PHY_MTK_XSPHY,
> make PHY_MTK_XSPHY depend on HAS_IOMEM and OF_ADDRESS to fix it.

Applied, thanks

-- 
~Vinod

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
