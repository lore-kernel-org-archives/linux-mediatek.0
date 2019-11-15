Return-Path: <SRS0=MjbJ=ZH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFA00C432C3
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Nov 2019 10:49:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2F4520748
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Nov 2019 10:49:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ulBHwMnF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="FGu/d3oc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2F4520748
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EEMchpfexUDqVX0yx/ZwGemdBVxfGGeLyzZH/KG62LE=; b=ulBHwMnF0bIrv4
	Bqt+1JYqs9NAnqCSUGgR0ZO3gvKdJNMLdOYthujkgfh+hsQ1VIpllCCZuajW8RXADLv6p+1LvJcFS
	6poVwd//PF4Ap44wmtiAKq8NWQdyxynzb1ZW5343H5JzMya14rGRC5mhVaVI7ot29RAFGYAIJs4Ht
	jYuvHVMdN69+ikOtntauZKwwkMPeo9rjoIIO5Zqk3zPznnjSrBDuk1Tk2fljV5Wqn82Fs8guBt3NT
	CL4B6OnmRyhBonAM2P8F68i648kpIb8MvpvwJWHyDmyZ29qbAb3h+P+5KD44fg7j0kMyW1P4UccxL
	AQ3ZhCEkHQjFEWaeeSEA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iVZAD-00051l-CT; Fri, 15 Nov 2019 10:49:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iVZAB-00050o-1z
 for linux-mediatek@lists.infradead.org; Fri, 15 Nov 2019 10:49:16 +0000
X-UUID: a17a98beccb8479f9adc6e9a7b5d6ac4-20191115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=r1J2x+cf0MV14ViUNbOr8DSPYB8uoQZWrAw4hIFdll0=; 
 b=FGu/d3oc0P3aWyR4msvXTXddUk9qsbwZ9S2TXw5RVCRosbXPlIG7gJJoQB3e6WM5fQKDrTwdSTkej0Vga7tI528IvM+6kVSPaJXaBZwMemkSMUbf5Ui2XFFJlAQx216/J/uNkS80QkhXZnEkcvlN4ZB1wqJxt7aYYQOjqQmEkwQ=;
X-UUID: a17a98beccb8479f9adc6e9a7b5d6ac4-20191115
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <eason.yen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 631126513; Fri, 15 Nov 2019 02:49:12 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 15 Nov 2019 02:48:47 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 15 Nov 2019 18:48:45 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Fri, 15 Nov 2019 18:48:46 +0800
From: Eason Yen <eason.yen@mediatek.com>
To: <broonie@kernel.org>
Subject: [PATCH v2 0/2] ASoC: mediatek: common: refine mtk_afe_fe_hw_params
Date: Fri, 15 Nov 2019 18:48:44 +0800
Message-ID: <1573814926-15805-1-git-send-email-eason.yen@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-TM-SNTS-SMTP: BDCDFFBC8F493320CCF91C8464AD5E89F9EC6E5E6F5288D24BE2BDCDAB9EC9052000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191115_024915_106846_2E8F42B4 
X-CRM114-Status: UNSURE (   4.66  )
X-CRM114-Notice: Please train this message.
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
Cc: alsa-devel@alsa-project.org, chipeng.chang@mediatek.com,
 jiaxin.yu@mediatek.com, linux-mediatek@lists.infradead.org,
 eason.yen@mediatek.com, matthias.bgg@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch is to add more helpers to control mtk_memif dma_address/format/pbuf_size
And refine hw_params and hw_prepare by these helpers.

v2 changes:
  split patch v1 to two seprated patches for different purpose.

v1 changes:
  1. patchwork list:
     https://mailman.alsa-project.org/pipermail/alsa-devel/2019-November/158394.html

Eason Yen (2):
  ASoC: mediatek: common: add some helpers to control mtk_memif
  ASoC: mediatek: common: refine hw_params and hw_prepare

 sound/soc/mediatek/common/mtk-afe-fe-dai.c | 359 +++++++++++++++++++++++------
 sound/soc/mediatek/common/mtk-afe-fe-dai.h |  16 ++
 sound/soc/mediatek/common/mtk-base-afe.h   |  28 ++-
 3 files changed, 336 insertions(+), 67 deletions(-)

-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
