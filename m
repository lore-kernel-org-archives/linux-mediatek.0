Return-Path: <SRS0=pLce=IU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 613F9C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Mar 2021 11:22:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D281F6198E
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Mar 2021 11:22:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D281F6198E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V6tqREghsJhshU6PF56mthVqsCMjGM2Y5jC1kKVpwWw=; b=CSR/cdObFPIDfIj0LX/IpzEY/x
	w4B0RYPOaGhfGlBumzqILFE+ESvVSe1id6hVpiPvrl4GzlMqPnlJjz6/4v8MRJ42IHGvC62jkMA5s
	Q4Wr25tm69qihGjLtyo8ENUcrCsB7HJ9Lo/fJorEl7N187BhmcxkzdOC7de9U5Lh+znToah5JnAKd
	A9tHT6fy1LAcMm1uo+32DwMyMe2IOaLCXN3D5eE/SqgTupuF5HLaiCM1hM0YX5ps6P491OT92Ypnx
	mUUTppZPmZV9OJ781ky50Iw1Vdv0eD1gWVlE6tqhAea7KRpJo/IMU5KhhY3XSdSpNXPbnrE8GN53Y
	lvEARltA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOIdL-00BQmk-BO; Mon, 22 Mar 2021 11:22:07 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOIcw-00BQg9-M8; Mon, 22 Mar 2021 11:21:45 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
 by mxout2.routing.net (Postfix) with ESMTP id 079555FA25;
 Mon, 22 Mar 2021 11:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1616412100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=fAfm5d45zVhZhTCL6xmuYVatc8OOf7hdInt0jJzTI/s=;
 b=tQzm0AytTusaC9sgjVBpygi4A40dsq73kw5wLj26GDKuOEY/uhrzf+W/sd9lET1f6h8BQ6
 YPdKbuhBQZ3aCZ6AvuKpz6gzVCa8eVtUlfQf7paF6fXzYfKNbzutUVJKp9IidcCIvbQRHM
 RfDm1cIgtKpfz58GfKc9Qrl1huE8nyw=
Received: from localhost.localdomain (unknown [80.245.73.88])
 by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 25EBA36010D;
 Mon, 22 Mar 2021 11:21:39 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Cc: Frank Wunderlich <frank-w@public-files.de>, Felix Fietkau <nbd@nbd.name>,
 John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] support mt7623 and ipv6
Date: Mon, 22 Mar 2021 12:21:15 +0100
Message-Id: <20210322112117.16162-1-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mail-ID: 39cf0cc5-dd48-4042-b3b9-87b31c10b3b8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_112142_961368_760E708E 
X-CRM114-Status: UNSURE (   7.02  )
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

From: Frank Wunderlich <frank-w@public-files.de>

Extending functionality of recently sent nftables flow offload.

This Series contains 2 Patches where the second is for RFC, because i cannot test it,
but it is reported by author as working and i should send it

Series depend on HW offload Patches:
https://patchwork.ozlabs.org/project/netfilter-devel/list/?series=233310&archive=both&state=*

Frank Wunderlich (2):
  net: mediatek: add flow offload for mt7623
  [RFC] net: ethernet: mtk_eth_soc: add ipv6 flow offload support

 drivers/net/ethernet/mediatek/mtk_eth_soc.c   |  1 +
 .../net/ethernet/mediatek/mtk_ppe_offload.c   | 55 +++++++++++++++++++
 2 files changed, 56 insertions(+)

-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
