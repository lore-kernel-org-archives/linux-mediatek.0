Return-Path: <SRS0=FEjz=EP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F28C7C2D0A3
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2020 09:30:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EBB4206ED
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2020 09:30:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yQvLvw0x";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ZipNuwcl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EBB4206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xH34/lao8ICSZrTPbnLbCeRpWBrM8f+qXjZgOhg6CMU=; b=yQvLvw0xQOJc2eNgTJSXuqpClC
	3ReDlpGNGdyYh9l8hNjJHbh1fkweNpcJ9JAmuh/tN8PLzctZ+M+NPByDRscNSLzL0vJQjDviXZczx
	JccoR+MupqxFfBrmILR3Ve9u0tNmscPHTcyreuItYcLNkp3YWv+g2Tpo/oh0oyDMa4Qx5hTOj1aIa
	LFj7rQ6rs1+99Tlio/ZJYsYmF7Wd3f8HMUrvUOBHLN62YT2vMzDy3yG3zkGz70fkI4d1TWTVrVVFI
	dGSsC5s290bN67P/hes9l2bYh/TgCP6kWn3VkzADmrW7iYyF2L77B/MEK2DHtWphkP4tOjmN3iPjg
	BYZm7zsw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kc3VY-0005yp-DS; Mon, 09 Nov 2020 09:30:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kc3VV-0005x6-6D
 for linux-mediatek@lists.infradead.org; Mon, 09 Nov 2020 09:30:38 +0000
X-UUID: d47a914c00534066b843defe23e701ed-20201109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=zK9nYBgoBMXUoKRoHGUeopoMoVSUHzOv523JRkEZ1AA=; 
 b=ZipNuwclhQpKG2tUFBtiiUztBhVk08SGo71Vy6YWW+NMam52VuJyc6Hc71MangbhWgvdvpGakFnWFNRVVTdwzTBT5inIXQI7JOeq4QdkkatzzliIkB2cfDC62+CK9Ooap+emfBRyO63Ljci2f7m3Oe+SCJEZRYJaIxEz+PlKD08=;
X-UUID: d47a914c00534066b843defe23e701ed-20201109
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <shane.chien@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1622465698; Mon, 09 Nov 2020 01:30:28 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 Nov 2020 01:30:26 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 Nov 2020 17:30:24 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 9 Nov 2020 17:30:24 +0800
From: Shane Chien <shane.chien@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown
 <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring
 <robh+dt@kernel.org>
Subject: [PATCH v2 0/2] Fix vaud18 power leakage of mt6359
Date: Mon, 9 Nov 2020 17:30:07 +0800
Message-ID: <1604914209-9174-1-git-send-email-shane.chien@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-TM-SNTS-SMTP: 8982818A31E456278736392BC1DA4C265125EFEC122D7738F621B0C9085C90C22000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_043037_457045_AA7484EC 
X-CRM114-Status: UNSURE (   8.96  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 chipeng.chang@mediatek.com, linux-kernel@vger.kernel.org,
 jiaxin.yu@mediatek.com, shane.chien@mediatek.com,
 linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "Shane.Chien" <shane.chien@mediatek.com>

This series of patches is to fix vaud18 power leakage problem.
vaud18 will be enable only when mt6359 audio path is turned on.

Change since v1:
 - use dapm regulator supply widget for vaud18 control.
 - add vaud18 regulator property in mt6359 dt-binding.

Shane.Chien (2):
  ASoC: Fix vaud18 power leakage of mt6359
  dt-bindings: mediatek: mt6359: Add new property for mt6359

 .../devicetree/bindings/sound/mt6359.yaml          |    9 +++++++
 sound/soc/codecs/mt6359.c                          |   25 +-------------------
 sound/soc/codecs/mt6359.h                          |    8 -------
 3 files changed, 10 insertions(+), 32 deletions(-)

-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
