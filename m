Return-Path: <SRS0=Ml8/=4E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51963C76199
	for <linux-mediatek@archiver.kernel.org>; Sun, 16 Feb 2020 06:28:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 270B520729
	for <linux-mediatek@archiver.kernel.org>; Sun, 16 Feb 2020 06:28:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mrkimx+M";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Y7XpsBu2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 270B520729
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gYFSchI/8ha+H0ynHrngfktDQTtMyAkPNbfwAo4pop4=; b=mrkimx+MUMkral
	jg99Nte+K5x3gKHBgL5/mnFRi18J06GbfzCDmTgxvNNT8JJg/tCKJXnNA/xSOS4gA+5/yZRFpl3oL
	SbcHPUn/kOiq/U+zoQc7uJuS6xupjlY2ZQ+lkGx/muMUOdd2/LJ02jsNyzfqLjZxHZkjVr8QbTeN7
	2Q4tdOUiZEIxR6m8GsPGCak7kG055mJwo8CNCVMPQMLqVsnCY7BS9el/hRVICxDnjcfCG1aBJqRIn
	Fv8ORPVrGOuv/UCgVm1rQcsz9rEFJpo+sdxS/RiXE814oIxVS3Ft8OgcuBABGIvxD3Omq61gqjcZU
	k9+xVp36b85YVdcjTSvg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3DPE-0003Ab-Np; Sun, 16 Feb 2020 06:27:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3DP6-00030X-TU; Sun, 16 Feb 2020 06:27:46 +0000
X-UUID: b6021cc1698c40ddbc74e5a1e53a8806-20200215
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=TbzTN9VDopWuQM9WqUfKWtNwI/MMB07r6MYptBp9CNE=; 
 b=Y7XpsBu2ngHN5KNahAEYHUfMWfZnYWZd2E+x4HatzN1ZGI7nqsajiYlSyL3syDXDutuNuJtlGsyPMWuYU88lXAeZnqyzRAsC3VCjfql8bpPWqxR74SPfEsvs0o9Twut6geF8XYsX2vvgqzcFBshdqECjn1bTqJCHDu/WeGXCe3E=;
X-UUID: b6021cc1698c40ddbc74e5a1e53a8806-20200215
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <argus.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1116204255; Sat, 15 Feb 2020 22:27:40 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sat, 15 Feb 2020 22:17:37 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 16 Feb 2020 14:13:31 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Sun, 16 Feb 2020 14:17:16 +0800
From: Argus Lin <argus.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Subject: [PATCH v2 0/3] soc: mediatek: pwrap: add pwrap driver for MT6779 SoCs
Date: Sun, 16 Feb 2020 14:17:20 +0800
Message-ID: <1581833843-4485-1-git-send-email-argus.lin@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: 7412AF20A4FC3BC8F73193F5B5A732A519D5745AA9092E8F85F58D612DB633FB2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200215_222744_990945_F1EAAA16 
X-CRM114-Status: UNSURE (   8.15  )
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
Cc: devicetree@vger.kernel.org, argus.lin@mediatek.com,
 wsd_upstream@mediatek.com, Chenglin Xu <chenglin.xu@mediatek.com>, Sean
 Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 henryc.chen@mediatek.com, flora.fu@mediatek.com,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 linux-mediatek@lists.infradead.org, Chen Zhong <chen.zhong@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

changes since v1:
1. Modify pwrap_mt6779 arb_en_all, int_en_all, and wdt_src value
when initialization.
2. Remove PWRAP_WDT_UNIT, PWRAP_WDT_UNIT, PWRAP_INT_EN, and
PWRAP_CAP_INT1_EN registered value check, we will initialize them
again at kernel level.

Here's version 1 of the patch series, include 3 patches:
1. Add compatible for MT6779 pwrap
2. Add pwrap driver for MT6779 SoCs. Keep PWRAP_HIPRIO_ARB_EN,
PWRAP_WDT_UNIT, and PWRAP_WDT_SRC_EN value if it has initialized.
When we enable interrupt flag, read current value then do logical
OR opersion with wrp->master->int_en_all.
3. Add MT6359 support for MT6779 SoCs.

Argus Lin (3):
  dt-bindings: pwrap: mediatek: add pwrap support for MT6779
  soc: mediatek: pwrap: add pwrap driver for MT6779 SoCs
  soc: mediatek: pwrap: add support for MT6359 PMIC

 .../devicetree/bindings/soc/mediatek/pwrap.txt     |   1 +
 drivers/soc/mediatek/mtk-pmic-wrap.c               | 128 +++++++++++++++++++++
 2 files changed, 129 insertions(+)

--
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
