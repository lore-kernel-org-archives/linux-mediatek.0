Return-Path: <SRS0=L9pZ=D7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19241C55178
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Oct 2020 06:51:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE43620829
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Oct 2020 06:51:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O8BmKDcZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="seYv3Pxw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE43620829
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zQpqe3BnbJSZuz8obJpRJKFfdfwZynZDO88LqnABlnE=; b=O8BmKDcZVHD7GvpYE1BlIoztJH
	rOFokPzMD9idLWSWOhU/FiULqzkalkuYobate9NbIEFWcZ5GNy/CC7Q3ivtfnjbYbiY3pnDQYXeCi
	oRQq7cypsPsDD4kfClYzey8/ih3PH4xRuowJUU4oYl31xRMHJoErMLSGFEwdslU4JMByOx8yx+oJ2
	BLraNhS1xgY3x4T+eARWtDA3EsPTdK27fimrRtSriCatxpZK0RJ8QEmV3PnkBF7BlaeyXlhukgTmC
	cGYRmZK3G+HrIT0xlBuxrjsyyfWbesf8K2iezwQkulF+pWyIyJCuNMOEoOuOSkWBuhrPbozzfbf0c
	bOsMbhVA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kWDP1-0005Sm-He; Sat, 24 Oct 2020 06:51:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kWDOt-0005Qi-PW; Sat, 24 Oct 2020 06:51:40 +0000
X-UUID: 31f36cba3ad041dda9e2cfae242d1de3-20201023
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=DQPo+D8DmTE+gRly/pqrKB2WAr0Beeu56QSN7DCokCo=; 
 b=seYv3PxweKiMNUN0HMsZZe0vCOsUJ8mRhEcQ1bVUzgGpmPkJE6vUd9QGA8vjcimWqngDZqxdiIS2wwLt4DPa3WvYTAqhGBu5Mc+RnIFzmRWAb6U8ZrfmxJuNWIYUWegfroz/26adyVbqTDyZd83OAZY4LOGJalH+JYs1WcFl9AE=;
X-UUID: 31f36cba3ad041dda9e2cfae242d1de3-20201023
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1690894219; Fri, 23 Oct 2020 22:51:33 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 23 Oct 2020 23:41:31 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 24 Oct 2020 14:41:28 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 24 Oct 2020 14:41:28 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>,
 <tiwai@suse.com>, <tzungbi@google.com>, <alsa-devel@alsa-project.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <devicetree@vger.kernel.org>
Subject: [PATCH 0/2] ASoC: mt6359: skip first time data at the beginning of
 DMIC recording
Date: Sat, 24 Oct 2020 14:41:24 +0800
Message-ID: <1603521686-13036-1-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201024_025139_969987_0CA37C93 
X-CRM114-Status: UNSURE (   8.79  )
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
Cc: shane.chien@mediatek.com, Jiaxin Yu <jiaxin.yu@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch fixed the pop noise at the beginning of DMIC recording.

Jiaxin Yu (2):
  ASoC: mt6359: skip first time data at the beginning of DMIC recording
  dt-bindings: mediatek: mt8192: add ul-delay-ms property

 .../devicetree/bindings/sound/mt6359.yaml     |  6 +++
 sound/soc/codecs/mt6359.c                     | 38 +++++++++++++++++--
 sound/soc/codecs/mt6359.h                     |  1 +
 3 files changed, 41 insertions(+), 4 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
