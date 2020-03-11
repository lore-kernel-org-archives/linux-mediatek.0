Return-Path: <SRS0=ZThz=44=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1903C10F25
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2020 03:36:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B315F21D56
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2020 03:36:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fCNRrSYx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="iERI+jak"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B315F21D56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lxkkNK6FAuAkVZEc0yRjYN+JXiKc5tjC23ZgGMjP0xM=; b=fCNRrSYx/CmuDS
	/nJ0V+VaXEhF+nPRQ3KpUYURnodJu54y8yV8au8ww7HwzYyG0nJYfVQf5Ms3uBbkRCTMXRoI/zNjU
	ylojMoS92XnjiTiZu1qTr5mE+iP9poIS9/63Kj+kY9BIU9k+LmR62dsKIwhnnHqFKgpszbWyXMix2
	9p7L4S73HxBxO1kI8g6OyJcYYrlWPyd0BK2CGMxjiMEBA8IGdMBMQY8fm3YnGz1WasPsqmDjRfxH1
	Qc2BVNGEWNmvLp1P+uwA38eEpobO/SSYui/+BRkCJtOlzXiZfLD7ugH+pxPqxV9qlWass7A1HVcde
	4PEZPw/Wbs3rQsDfkkuw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBsAU-0001jT-KV; Wed, 11 Mar 2020 03:36:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBsAS-0001iq-At; Wed, 11 Mar 2020 03:36:25 +0000
X-UUID: ed183455145b4cb0bd93342115f93a52-20200310
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=DPJUQnv87RbzN8dm0Mgk9azwyYcGOhnHBbgcNu92ga0=; 
 b=iERI+jak/HtMasoCvWXvUVw192XtrcERlG2u980a1zpgERP8wFU7foQ3UYStKaKb9IoBEKp51wPndZ01t5tthjGJZhPYwV/6NEBtFSh0vg54X+sRXqkXP66IJgZtStHfuirh/KnKuMIsW7yKirTbIWqZYlzOA2upjLNd0dhkwXU=;
X-UUID: ed183455145b4cb0bd93342115f93a52-20200310
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <erin.lo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 211004139; Tue, 10 Mar 2020 19:36:18 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 10 Mar 2020 20:36:23 -0700
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 11 Mar 2020 11:35:17 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Wed, 11 Mar 2020 11:35:23 +0800
From: Erin Lo <erin.lo@mediatek.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
Subject: pull request: linux-firmware: Create Mediatek MT8183 SCP firmware 
Date: Wed, 11 Mar 2020 11:36:01 +0800
Message-ID: <20200311033602.31905-1-erin.lo@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200310_203624_386695_71F3659B 
X-CRM114-Status: UNSURE (   7.34  )
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
Cc: menghui.lin@mediatek.com, maoguang.meng@mediatek.com,
 srv_heupstream@mediatek.com, drinkcat@google.com, yunfei.dong@mediatek.com,
 linux-remoteproc@vger.kernel.org, sj.huang@mediatek.com,
 linux-mediatek@lists.infradead.org, shawnku@google.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The following changes since commit 0148cfefcbf98898ca65bb26d9d7d638b30e211d:

  Merge https://github.com/rjliao-qca/qca-btfw (2020-03-02 08:08:15 -0500)

are available in the Git repository at:

  https://github.com/erinlo/linux_fw_scp v12573.77

for you to fetch changes up to a52150d8e1fe65994464b15ea162bdc89ba61ce8:

  mediatek: Add mt8183 SCP firmware (2020-03-11 10:36:45 +0800)

----------------------------------------------------------------
Erin Lo (1):
      mediatek: Add mt8183 SCP firmware

 mediatek/mt8183/scp.img | Bin 0 -> 1027104 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 mediatek/mt8183/scp.img

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
