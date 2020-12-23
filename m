Return-Path: <SRS0=SIUT=F3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF21AC433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 07:23:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C10D22273
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 07:23:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C10D22273
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a/xqMp5MPltNMyy1z9/kB947cHL4HFOKxAtuBnNityY=; b=sRNuzeadXb+IiCiQNsJti18z9J
	OAddnpaKYV/bQAYyco5tg+Yp9GB+VpP2G3AZ7jaf0SK4/TtPlulXw6SYgxv9616whR8Ex+rgsAxUM
	kF6qRV8j4lE8/lut2stfjbC+uVPkOcyswzLFJE1v/VffE8mCLoV/e+kB3w/FoxgRV/4BuSNTnfbQT
	/8eDkTa0+ad3RJ+2zof6BZIJs2G9zkTUjQ6p8cAO0aZTqRH5I6CNhFBJ818v0pBUsteN6XAKebgmh
	QxFXzLMAlkVEDT6p7XXPWQiUSVEb/R1MKeTTMICRdmaMESFvkjpZTkBDQBPBJ9CmEtlqKbwO8+Tlr
	1tTcUh3w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kryUN-0002XA-VX; Wed, 23 Dec 2020 07:23:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kryUL-0002WF-AL; Wed, 23 Dec 2020 07:23:14 +0000
X-UUID: c6de98d1e6654016af0da78e1867f21a-20201222
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=fGUgKBst9TC6Tf09eOEmon6PtJYgtrLiMue0dEP3GbM=; 
 b=RO3WWwxCcMOFa56jDhR+pTEGgCnfncc47DPW+8GT4/akOq/4rNKHXJDNY9L2ZK7MNADbfmm99ggxuufgcmKfB6vtZ1XsVdgC6RRPvznDNcoPuIsVxzdsfyr5Z2cuyj26NUzfiwofVAOsdMlp/DQrBe53oHHuql5stnowmbpqmng=;
X-UUID: c6de98d1e6654016af0da78e1867f21a-20201222
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 214907051; Tue, 22 Dec 2020 23:23:10 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Dec 2020 23:13:08 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Dec 2020 15:13:01 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 23 Dec 2020 15:13:00 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>,
 <matthias.bgg@gmail.com>, <robh+dt@kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v2 0/2] arm64: Support Universal Flash Storage on MediaTek
 MT6779 platform
Date: Wed, 23 Dec 2020 15:12:57 +0800
Message-ID: <20201223071259.764-1-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 4A44233D09EE66442D84A68BB2555E347F5CB8A1A9DB9CB15F6B567F866156F62000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_022313_580050_DB9230F4 
X-CRM114-Status: UNSURE (   9.25  )
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
Cc: hanks.chen@mediatek.com, andy.teng@mediatek.com, cc.chou@mediatek.com,
 chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 peter.wang@mediatek.com, jiajie.hao@mediatek.com,
 Stanley Chu <stanley.chu@mediatek.com>, chaotian.jing@mediatek.com,
 linux-arm-kernel@lists.infradead.org, alice.chao@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,
This series adds UFS (Universal Flash Storage) support on MediaTek MT6779 SoC platform.

Changes since v1:
  - Fix irq attribute in dts in patch [2/2]

Stanley Chu (2):
  arm64: configs: Support Universal Flash Storage on MediaTek platforms
  arm64: dts: mt6779: Support ufshci and ufsphy

 arch/arm64/boot/dts/mediatek/mt6779.dtsi | 36 +++++++++++++++++++++++-
 arch/arm64/configs/defconfig             |  1 +
 2 files changed, 36 insertions(+), 1 deletion(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
