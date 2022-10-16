Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EFF6C433FE
	for <linux-mediatek@archiver.kernel.org>; Sun, 16 Oct 2022 14:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OKTCq3U8WxlLqgFE/aqGBsXXYH4vpqvyz2Cz5TrvL6k=; b=AWnRi1DgnvK9AqqqKvZx3BiZJz
	fBJhx766OJBfZszpB4hhL+jCQulCBuYbf4XjSZoBioVHcsdjmQmHaKBJOoPrIgx5RejmtEWTgUS2X
	IFyGXV81Q977s2i+eVRKRpsSunfZ+IjAmeigSoarkvmvRMRFe2FhLObc9w4f5d2n4t72cK+/lSPXf
	Kk4e0P7JlwznYQ+aoLHvzeVtuujW4fozOKS04lKS+zOhf0uJKH3N1mrW6AnI+fVNeogacwXuAc5Ux
	2jFpMWNFhH6l/TZtps5JR2braiat6Elky8u2u2CyEDdwNP6mqCDkfsxkZM3aQqlS5MzPJz5FPvcGH
	a+LRx45Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ok4us-001pOq-8q; Sun, 16 Oct 2022 14:47:02 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ok4uf-001pLl-5I; Sun, 16 Oct 2022 14:46:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 89705B80C9D;
	Sun, 16 Oct 2022 14:46:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 197D3C433D6;
	Sun, 16 Oct 2022 14:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665931606;
	bh=75PnQdYsQ5WAhnnJexT0fXaGnLlhuJBW9vcYq/nL+xQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qa5cfHDQnzd1mCdEqRlY7U7rIx10G8pGGJ3iEZD8OSrgpVE1DDgiA8Q3pO2nZc6le
	 bczBeq4ohP83HgCZjiPdIHis893XNPyrQx0G2da3BHGZnHxm/SR085i7SWRaE/vh+g
	 G1MGcGFdd28eUMF7CVL/lVVJm81q+g5NzQFPIv7aCbn+7nd5cVL7d+7zI7ACiLg/XW
	 9nWEltNz7CsShdHiQBOFzZ8Ju5EWWxnkHfgGzs3+eFbFkEo8g5SjfiYPD6bKC2Hnxj
	 q072LX7llS4V/DG88O6r1xJWpHAECR1MD9qLaqDvjE+/TNZsLDnmiH6jW1qNK1rV3F
	 Ik0ZXMMU0xHFA==
Date: Sun, 16 Oct 2022 10:46:44 -0400
From: Sasha Levin <sashal@kernel.org>
To: Jean Delvare <jdelvare@suse.de>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	kernel test robot <lkp@intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chenglin Xu <chenglin.xu@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH AUTOSEL 6.0 04/46] soc: mediatek: Let PMIC Wrapper and
 SCPSYS depend on OF
Message-ID: <Y0wZVNIAqZJmqoRJ@sashalap>
References: <20221011145015.1622882-1-sashal@kernel.org>
 <20221011145015.1622882-4-sashal@kernel.org>
 <20221012004949.06d45f74@endymion.delvare>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221012004949.06d45f74@endymion.delvare>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221016_074649_379888_E3C210FF 
X-CRM114-Status: GOOD (  11.47  )
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

On Wed, Oct 12, 2022 at 12:49:49AM +0200, Jean Delvare wrote:
>Hi Sasha,
>
>On Tue, 11 Oct 2022 10:49:32 -0400, Sasha Levin wrote:
>> From: Jean Delvare <jdelvare@suse.de>
>>
>> [ Upstream commit 2778caedb5667239823a29148dfc48b26a8b3c2a ]
>>
>> With the following configuration options:
>> CONFIG_OF is not set
>> CONFIG_MTK_PMIC_WRAP=y
>> CONFIG_MTK_SCPSYS=y
>> we get the following build warnings:
>>
>>   CC      drivers/soc/mediatek/mtk-pmic-wrap.o
>> drivers/soc/mediatek/mtk-pmic-wrap.c:2138:34: warning: ‘of_pwrap_match_tbl’ defined but not used [-Wunused-const-variable=]
>> drivers/soc/mediatek/mtk-pmic-wrap.c:1953:34: warning: ‘of_slave_match_tbl’ defined but not used [-Wunused-const-variable=]
>>   CC      drivers/soc/mediatek/mtk-scpsys.o
>> drivers/soc/mediatek/mtk-scpsys.c:1084:34: warning: ‘of_scpsys_match_tbl’ defined but not used [-Wunused-const-variable=]
>> (...)
>
>This is warning only, pretty harmless, so I don't think this qualifies
>for stable kernel trees.

Ack, I can drop it.

-- 
Thanks,
Sasha

