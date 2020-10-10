Return-Path: <SRS0=AZ7y=DR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 723C0C433DF
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Oct 2020 07:19:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECA822073A
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Oct 2020 07:19:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="w7BiIwK5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="mLc7pWV+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECA822073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fyget37XV+dYwKQNZtMRRLfIa50Jonq/Pkd30T+hYfY=; b=w7BiIwK5tcHwPOG74W2U4EfM5+
	Ez3WvukIKsgQmwMLlCj1yOd3q9k7rpOilvlMMBNopV+h+QlWLsQ0dmsyIUMYot/suE5BaPxapp6/7
	XbwNffzT/+9kpFbKrZi3KD565U9fzZtWzsqEO5uqYJ6z96vZCc6/4HCKUx2TZyecuZY74qIuB39J/
	2dp6+6NxawQoDAQG+DrhIDSe5eTzR+cchQZjIWCy7SED94lclhPAJnkDEC24Y6HVPiFDCDlLS8Vch
	n730pLOx+jhIY+XtTbLV4IdZVbr0mB6vBEt+5slLvY9TxulVvtx89oTgwZRSZCO/zyrUWLFuHIWWK
	7HM9l2jw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kR9AG-00043M-Io; Sat, 10 Oct 2020 07:19:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kR9AE-00042r-0S; Sat, 10 Oct 2020 07:19:36 +0000
X-UUID: 4842a85238ec409484c80ce296ffb309-20201009
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=ANpEljZrqglc8EMQg/MmRI2i6NTOfGYjN7epVx7bN3M=; 
 b=mLc7pWV+4oru6y5/2DxA/aG8uOKd/fTYXdSIvvFC0a1mP9g71/Y2wkjqgOM8X2uF2j7YqrAxiq80iQBxp2TvH7Uj0UUh1BavjvkE2QDOOY7ycL5UTC686VWeY8KobFvyqfDur7wTiWdW6PVQIgenWR3O4Rm1U9PUoyc1FsfZw9I=;
X-UUID: 4842a85238ec409484c80ce296ffb309-20201009
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1467842088; Fri, 09 Oct 2020 23:19:26 -0800
Received: from MTKMBS33DR.mediatek.inc (172.27.6.106) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 10 Oct 2020 00:09:24 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 10 Oct 2020 15:09:18 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Sat, 10 Oct 2020 15:09:17 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [v4 PATCH 0/2] fix scrolling of panel with small hfp or hbp
Date: Sat, 10 Oct 2020 15:09:08 +0800
Message-ID: <20201010070910.11294-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.12.5
MIME-Version: 1.0
X-TM-SNTS-SMTP: E976FB5C5D4C68B5ED5FF64A5487CFDC6271ABC0676969679FADBA60D22808B22000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201010_031934_772913_A90DD4C4 
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
Cc: devicetree@vger.kernel.org, Jitao Shi <jitao.shi@mediatek.com>,
 srv_heupstream@mediatek.com, huijuan.xie@mediatek.com, stonea168@163.com,
 cawa.cheng@mediatek.com, linux-mediatek@lists.infradead.org,
 bibby.hsieh@mediatek.com, ck.hu@mediatek.com, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Changes since v3:
 - Revert v2, for v2 will cause some bridge ic no output. the cause
   the video linetime doesn't match display mode from get mode.
 - Make sure the horizontal_frontporch_byte and horizontal_backporch_byte
   are > 0.

Jitao Shi (2):
  Revert "drm/mediatek: dsi: Fix scrolling of panel with small hfp or
    hbp"
  drm/mediatek: dsi: fix scrolling of panel with small hfp or hbp

 drivers/gpu/drm/mediatek/mtk_dsi.c | 65 +++++++++++++++-----------------------
 1 file changed, 25 insertions(+), 40 deletions(-)

-- 
2.12.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
