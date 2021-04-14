Return-Path: <SRS0=Strr=JL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3387C43461
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 13:36:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B99A56103D
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 13:35:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B99A56103D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0na6H7ZbENHfRI77Nt2Ths701+nvt8lqWQMSEX7urUw=; b=ao2ZoDvK4StSI9xcY9+cVcYOgj
	PTGo9uiibwAH5wBX71a0DjkduIVIq214BgE1ib2stqZgLH8gzMx8SWI6qhg6kCUiLwmZrJvbXAlSZ
	GYhf7HRGeWGMUi23wplbecLpiLwvpNt8FDIXia8dM8a495bvXr6m9G7++UVLoorys3Ed4cNX2gZ7j
	VHGKzDAjUGudWy14z+m38qzsZ3fM2AZCN0N6rM2ZitLGyl+vEmPkh+T8mfj6EovYmTfw4xZAqOVoW
	GWufExZKaWE1k9H5zTib0ZpOy7o6x+PUShW7mvQD9IV2vy30/NUOGIpizcTmCNl9nWBmBgfQfZZnX
	nCm/ekXA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWfgE-00ClKl-IZ; Wed, 14 Apr 2021 13:35:42 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWfg7-00ClJL-6h; Wed, 14 Apr 2021 13:35:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=68bUlwQx9WFOy2Cy4UWP/n63iEoYvyfvxIJv4RoRsnM=; b=tmnGl+h9si/rXlUtjkLpxtXAcO
 l8c4VAu3OgY48mGInQN0WQz5fQaytUlWD89frHQs4UcPpvfI3BwUi4IcQZhqc3G8FR/MCbOQdpy+K
 fJlM7cofHoIdtdSiOJhh+lSXKM1901UlXDE8JPZ97ci2VpP4xWntaqs7AyRnHjT5L67hvrpU4IJha
 4UcKF99BoVWFBqm+4L6h8mhnSeIIJFY+neulT8beApJ/+JrLg6BCAF7L2UMqwJG8JQwaHja7VppvM
 b8ugf4uIiN8AAW1Tb4ydAIRvaccQZRfz3MakRl7N7CI2fVsNwO4D1YpRlgrEtWNQ7n9XuYS9gehV9
 x5B3ZfNw==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWfg4-007nZI-QT; Wed, 14 Apr 2021 13:35:34 +0000
X-UUID: dfbb378d948542f89356744c6aa99b84-20210414
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=68bUlwQx9WFOy2Cy4UWP/n63iEoYvyfvxIJv4RoRsnM=; 
 b=hYqUuGk6ZXLFQmSO8zd4kG7pPYXRVWPpO3QBPM4gJ4ERGeO2017RMrl9POIctOnXjNhMDd/vmhcb011oWkvW/AJ+YgucveIU8sF/cJI2tFioi3LrzkUz7Uoi2F7FKcuupxjochTquG4ROSz7Rwo9i7rdtt4GikNMmxjwjj2sHKg=;
X-UUID: dfbb378d948542f89356744c6aa99b84-20210414
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1368339905; Wed, 14 Apr 2021 06:35:24 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Apr 2021 06:35:23 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Apr 2021 21:35:21 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 14 Apr 2021 21:35:21 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [v2,PATCH 0/3] mt8183 dpi supports dual edge
Date: Wed, 14 Apr 2021 21:35:13 +0800
Message-ID: <1618407316-10042-1-git-send-email-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210414_063532_885047_A9EBC044 
X-CRM114-Status: UNSURE (   6.37  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

v2:
modify unused code

v1:
DPI can sample on falling, rising or both edge.
When DPI sample the data both rising and falling edge.
It can reduce half data io pins.

Rex-BC Chen (3):
  drm/mediatek: dpi dual edge sample mode support
  drm/mediatek: config mt8183 driver data to support dual edge sample
  drm/mediatek: dpi: add bus format negotiation

 drivers/gpu/drm/mediatek/mtk_dpi.c | 102 +++++++++++++++++++++++++++--
 1 file changed, 97 insertions(+), 5 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
