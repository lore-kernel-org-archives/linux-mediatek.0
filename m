Return-Path: <SRS0=Ml8/=4E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C923C76199
	for <linux-mediatek@archiver.kernel.org>; Sun, 16 Feb 2020 06:15:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F0EF20857
	for <linux-mediatek@archiver.kernel.org>; Sun, 16 Feb 2020 06:15:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OHqFOyvE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="EqisWo6J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F0EF20857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gYFSchI/8ha+H0ynHrngfktDQTtMyAkPNbfwAo4pop4=; b=OHqFOyvEqBMfl6
	cIxZPDLiRfE2uuG568kushdplOMBhFHilFJ9cOP/M89Io0haCBj6dvGMH8iB6dUA2gy8N/w4FRGjJ
	fQiGLo1lTWQCuEZf4zBEQt/5bKVSFd5IboQ+qX0LANtsxiDAVPIMHgwwqjqMwp36LbbQD8fA34pUI
	v8GplUWt63uFQSNoDdgh9Z3zw9LcmH3InRt+zZhebwRmiBKnixyP9CaM2ask20xK6+v+6A+7NMrl0
	uZGuOJLB+9g7c0hnL7EZyS6xJVJmY8CErausCM67EzbOzsQ+9k2PQ3BYDhXhoiM0t8F2v/pWNYVb5
	DojfLSiFoO0o1L9sV3WA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3DCp-0004kF-JG; Sun, 16 Feb 2020 06:15:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3DCk-0004Zh-J8; Sun, 16 Feb 2020 06:15:00 +0000
X-UUID: 558feafba4cb44a7ab6381b22c49614f-20200215
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=TbzTN9VDopWuQM9WqUfKWtNwI/MMB07r6MYptBp9CNE=; 
 b=EqisWo6JUlLLexi9fzEuHafiSWQWm2RYkmAktBidIVttKVLSonFtH9+wSEQicP3L3Gr4PshTDcFr8xdEMttdEfB6R23G8rdUMoJYZGfCaoRbNWfmdakfQi70pwWCrAgJaSg2q4a5mSAbqua+G9WXHBC/O0LMs//h7EfCu6foRu8=;
X-UUID: 558feafba4cb44a7ab6381b22c49614f-20200215
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <argus.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 195984150; Sat, 15 Feb 2020 22:14:44 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sat, 15 Feb 2020 22:14:41 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 16 Feb 2020 14:13:52 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Sun, 16 Feb 2020 14:14:32 +0800
From: Argus Lin <argus.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Subject: [PATCH v2 0/3] soc: mediatek: pwrap: add pwrap driver for MT6779 SoCs
Date: Sun, 16 Feb 2020 14:14:36 +0800
Message-ID: <1581833679-4319-1-git-send-email-argus.lin@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200215_221458_639154_6ADEB618 
X-CRM114-Status: UNSURE (   8.43  )
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
