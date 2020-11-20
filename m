Return-Path: <SRS0=OETw=E2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5936C388F9
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2020 03:06:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C15292223F
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2020 03:06:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y6s6sZ2O";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="JeeV4n+j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C15292223F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E9qnTypIcJZteZ8ikXdxPQZ9v1XnffGakljGiak4x2s=; b=Y6s6sZ2OqXS6TY/9dkIXq08gr2
	jFkK7UFNKHvvErQPF9BhZo8nD+kJNn1SOquKUlBB3kFnENTIDX3+1mBtlfVNkM3OoBLVlNzjhu3iV
	tzBkSPjpYI8IbWmx6epDeUzDR01CHakOsszYBY81HC+Z2gD7+mCXHoPBH3hcOXXzFxBU1d/fJbFGF
	nht8qeq1YFceg+nhS0BNChJ5gRsskAZ6IL6+9d8RnZCMhgcgDnKjUATKy3cShN967II503+JFptuY
	vEs6r8MjoqI0OKIJ3jTn/bpjgnifFA1JMN/q/WYPFPetUM24J3K41Z3j2tWCTd5qBBYbcInJsFLvy
	on7IPnwQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfwkp-0000TL-UE; Fri, 20 Nov 2020 03:06:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfwkj-0000S1-2x; Fri, 20 Nov 2020 03:06:26 +0000
X-UUID: f7bb53275dce4b0db311e3afcfaef998-20201119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=/xg9dGQUzAaDewkv1uLAWsZO6/V6ngtpxhdrqv5GJHA=; 
 b=JeeV4n+jIza28M4ii0+zfNKFgdoYitQMARLWvPSk0AVbERJYUIGXaIIAhcKItEk7QzSoS6vKPYLxWzF2uydSFIX3Zk3LEWouOa+9rgWDCQclKZp13Z6xIOo7MF/+0tMaIXEI6k8HUn3pBViM1T9iF81tN0smwjqzGtv/qY2YByo=;
X-UUID: f7bb53275dce4b0db311e3afcfaef998-20201119
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1434379878; Thu, 19 Nov 2020 19:06:14 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 Nov 2020 19:06:17 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 Nov 2020 11:06:15 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 20 Nov 2020 11:06:14 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <matthias.bgg@gmail.com>,
 <tzungbi@google.com>, <alsa-devel@alsa-project.org>, <robh+dt@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] ASoC: mt6359: Fix regulator_dev_lookup() fails for id
 "LDO_VAUD18"
Date: Fri, 20 Nov 2020 11:06:11 +0800
Message-ID: <1605841573-1442-1-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_220625_356337_B0812C44 
X-CRM114-Status: UNSURE (   9.56  )
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
Cc: shane.chien@mediatek.com, Trevor.Wu@mediatek.com,
 Jiaxin Yu <jiaxin.yu@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series fixed "LDO_VAUD18-supply" regulator register fail.
We can see the error log "mt6359-sound supply LDO_VAUD18 not found, using
dummy regulator" when register the DAPM widget "LDO_VAUD18"
Otherwise, the power can not be turned on correctly when recording.

Jiaxin Yu (2):
  ASoC: mediatek: mt6359: Fix regulator_dev_lookup() fails for id
    "LDO_VAUD18"
  dt-bindings: mediatek: mt6359: remove unused property for mt6359

 Documentation/devicetree/bindings/sound/mt6359.yaml | 9 ---------
 sound/soc/codecs/mt6359.c                           | 7 ++++---
 2 files changed, 4 insertions(+), 12 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
