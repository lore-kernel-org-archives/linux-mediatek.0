Return-Path: <SRS0=IZYC=FJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E857EC4361A
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Dec 2020 07:51:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BC0F22D58
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Dec 2020 07:51:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BC0F22D58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kaAdndvWtYUn9MeTmi3NxvQ8MKKOGoLmlCR8TXBnHZw=; b=hK+SxgjLCiYRgz9xiBFKKU+bD
	LRiYeAubsNMpj++2qH3j5vRTQsXGzgO2MEEM+SnoRFt4Zrt+AjMVKH/NI1Q6sVMQZIUnjn0YCxJOB
	9xPDz4MLcPgFPQWVh7tQUx6Ml5rit2tUQZa0Vlp428fRuDYV9JpU3Nc0hMynTXR4sMpByRGdrhXI1
	1JIZelnjE1WbV7KFe/lqV8ZpgT9ppUcwYJoIHr0WrrlrSqWRum6jukCWSzk6DmauYvxvUnGoIOEcy
	WK21bsC8DUGaOWz8wNMoJ6TnLfpJH+6GuXmpaqo4BBy1cp5L/pCWt5oFj+OPrUDVtnYT2EoAihMkT
	f4mUxlHVA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klSLs-0004Ml-3n; Sat, 05 Dec 2020 07:51:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klSLn-0004M1-7H; Sat, 05 Dec 2020 07:51:28 +0000
Date: Sat, 5 Dec 2020 13:21:20 +0530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607154684;
 bh=GaxbPS8fHhiN9RhDI+/JzYD1c9Bk3jACxukW0zQnLAw=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=WbuDEhmrQiUNLTuokjtEHchH+bbS08fFU34VdR4lmISk9BUScVFwZ1uwvDsA7uEmc
 a159kXqqFRqPbpucDTTwnSrZIzYlkfW5xAtmpz9XNX+k57a6bANTJ+uPXd1XkrehOZ
 k+HSXIzdIfWknZkTmk8H+/qf1tn2pEV+ssLJWxcE0HFjGyZHPeKeLjI1EgkLLLHZt5
 epz9qQQMi0EAnbMgHOUGdRUw0GF+hl0T5eG0p82arWprWySQDfZ5fL7lxl40FSlIVU
 lnKTO7cMsVZVY0RdxRgK8wFOda+C6XaUBfBttKgbxR5l180E3jkm63iMTCbXAz+R6P
 UdiYs3H359n5g==
From: Vinod Koul <vkoul@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] [v2] phy: mediatek: allow compile-testing the hdmi phy
Message-ID: <20201205075120.GT8403@vkoul-mobl>
References: <20201204135650.2744481-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201204135650.2744481-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201205_025127_362405_A009837D 
X-CRM114-Status: GOOD (  10.49  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>,
 linux-mediatek@lists.infradead.org, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Colin Ian King <colin.king@canonical.com>,
 Tiezhu Yang <yangtiezhu@loongson.cn>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 04-12-20, 14:56, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Compile-testing the DRM_MEDIATEK_HDMI driver shows two missing
> dependencies, one results in a link failure:
> 
> arm-linux-gnueabi-ld: drivers/phy/mediatek/phy-mtk-hdmi.o: in function `mtk_hdmi_phy_probe':
> phy-mtk-hdmi.c:(.text+0xd8): undefined reference to `__clk_get_name'
> arm-linux-gnueabi-ld: phy-mtk-hdmi.c:(.text+0x12c): undefined reference to `devm_clk_register'
> arm-linux-gnueabi-ld: phy-mtk-hdmi.c:(.text+0x250): undefined reference to `of_clk_add_provider'
> arm-linux-gnueabi-ld: phy-mtk-hdmi.c:(.text+0x298): undefined reference to `of_clk_src_simple_get'
> 
> The other one is a harmless warning:
> 
> WARNING: unmet direct dependencies detected for PHY_MTK_HDMI
>   Depends on [n]: ARCH_MEDIATEK [=n] && OF [=y]
>   Selected by [y]:
>   - DRM_MEDIATEK_HDMI [=y] && HAS_IOMEM [=y] && DRM_MEDIATEK [=y]
> 
> Fix these by adding dependencies on CONFIG_OF and CONFIG_COMMON_CLK.
> With that done, there is also no reason against adding
> CONFIG_COMPILE_TEST.

Applied, thanks

-- 
~Vinod

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
