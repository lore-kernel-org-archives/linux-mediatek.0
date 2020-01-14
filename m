Return-Path: <SRS0=z6AG=3D=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8ADCC33CB3
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jan 2020 09:19:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 762712084D
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jan 2020 09:19:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V5eFt5eM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Ar1wA9kt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 762712084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Tew7ti5/3CRGupmiuq7jM5R5oKQlXRNhE8nbpm6jtJ4=; b=V5eFt5eMxHmXQT
	fKDfSceKOTO2mRQJidiEV9WG/fq/BzCsTyKGZOQ/UTzFxluLoVqhGG2O7L5zvc+2XQj/xOgsIQa4z
	nLJ0GljAUheKlFaNQ9Mz9yVVFmI7l8kAmtuWM9UFnND+HEFbp8bdXzHi5sSDMiaLYMxpXV9vSA8eO
	Tv1P/o+SXCFZGbPg7vxzWmNvfMw2Js4sSXG5IuC8XVv5swhs2TfCVGCcAS2fIwruFI/dbkiEyafoW
	iagWV1q04uz3lGn5HRNxB/vOEeM54ZhUqc9THNL+hjDT8kS0NejAoiaFO5vURW3CXdI9yD8FOEsk3
	okaOidB4kbPeqE5FeTpA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irILu-0005l8-54; Tue, 14 Jan 2020 09:19:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irILk-0005kS-PC; Tue, 14 Jan 2020 09:19:08 +0000
X-UUID: c6b4fe61adb44e679d54c6b2cd5e9dd2-20200114
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=aZyDNFPXw+JIpXqug8qSOA95bzg2wpu/wWgcIqMi9CQ=; 
 b=Ar1wA9ktUCLu69Mt+03KkFq6zww1rp+Mp5L7hXLUZ8NQoYETb77UwjnNotB1dN+dT+7l+36M8w8bqhtqcKQgeRQzV9GIjx6lOVmxDoJL7VjbR254TU+unKFWSypGfwI1xn/guzbad6zz7+5ZHMC3iC5tuGnnHaWHt8cNP4on/T8=;
X-UUID: c6b4fe61adb44e679d54c6b2cd5e9dd2-20200114
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <gtk_ruiwang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1400567670; Tue, 14 Jan 2020 01:18:59 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 14 Jan 2020 01:18:57 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 14 Jan 2020 17:17:41 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 14 Jan 2020 17:18:54 +0800
From: <gtk_ruiwang@mediatek.com>
To: <linux-firmware@kernel.org>
Subject: pull request: linux-firmware: Update Mediatek MT8173 VPU firmware
Date: Tue, 14 Jan 2020 17:18:35 +0800
Message-ID: <20200114091836.19403-1-gtk_ruiwang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200114_011900_825775_AC45B92F 
X-CRM114-Status: UNSURE (   6.12  )
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
Cc: gtk_ruiwang@mediatek.com, Maoguang Meng <maoguang.meng@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>, srv_heupstream@mediatek.com, Yunfei
 Dong <yunfei.dong@mediatek.com>, Longfei Wang <longfei.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 linux-mediatek@lists.infradead.org, PoChun.Lin@mediatek.com,
 Tiffany Lin <tiffany.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi linux-firmware maintainers,
 
The following changes since commit 67d4ff59bf3334895626cf165e508e9eb1846e24:

  Mellanox: Add new mlxsw_spectrum firmware xx.2000.2714 (2020-01-07 09:08:25 -0500)

are available in the Git repository at:

  https://github.com/ruiwang-mtk/linux_fw_vpu_v1.1.3.git

for you to fetch changes up to 7f3177d224ee7afdd6e36ed01a13f499d671e167:

  mediatek: update MT8173 VPU firmware to v1.1.3 (2020-01-14 15:33:19 +0800)

----------------------------------------------------------------
gtk_ruiwang (1):
      mediatek: update MT8173 VPU firmware to v1.1.3

 vpu_d.bin | Bin 2977008 -> 2977136 bytes
 vpu_p.bin | Bin 131180 -> 131180 bytes
 2 files changed, 0 insertions(+), 0 deletions(-)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
