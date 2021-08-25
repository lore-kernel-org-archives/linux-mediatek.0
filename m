Return-Path: <SRS0=pvhC=NQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50F82C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 01:12:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2078661206
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 01:12:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2078661206
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dgwr7qhpm3h8QaJNYStqkOjAQ3DLLC51kfWl8sq5Mxg=; b=RBs1hxDTZL/oJz
	8NXdis3vr2p2K1GNCbGC6SU9oXTUYb/b2hNv19WKN5415oKb5T9fnvCPw+PglXUbQDlroPMDJceoX
	xEW4XHc4PazG/fx3mwtkdDIydeLN4dZ5QIwCYaqXZRETWjEtOARI8BWglR2PQ1G1ygFvGSjQ7PqJv
	3UQG8upecJKpS369cBAaTJ7hrHCq4Q75FKYKSRzc/o0BTlcpHicUAwYdAqCMsJpoOsLOmqiM9Be/0
	jwiNiZ/5yafcvt6vQz4ZkM/no+soOwDNytlnexMNFhnAMOAxQiQAniNG9V4oOP9wmp9fJEQt5nemj
	9Qvp/Jl0QetSEXR7jX6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIhSH-00525Q-UA; Wed, 25 Aug 2021 01:11:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIhS1-00521s-IM; Wed, 25 Aug 2021 01:11:37 +0000
X-UUID: 6ade6f0a38c94a1abff791453b871e95-20210824
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=ZBBEejFJpJcel0EuKJ+AWDQEVlL5HZlC46pS8NX8hkk=; 
 b=WVbgSd5Ud2lTxIQeBGlp+q8ECqohfSU1Fgd4ZJLn6uOukSki+pftOLoD9uWEsRr9Nad6QZ1hWEWhLL7cx5LsYLxLfee0onKyJSWBNtmZDIkit2XO2Ik0Vnhqq6X4pA/4itqY8nMjCtiyOHsnCVyGC3IcCoy1KG51pL5JEZ1MlAE=;
X-UUID: 6ade6f0a38c94a1abff791453b871e95-20210824
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 228254139; Tue, 24 Aug 2021 18:11:30 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 Aug 2021 18:11:28 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 25 Aug 2021 09:11:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 25 Aug 2021 09:11:26 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [v1 0/5] Update MT8192 Clock Setting
Date: Wed, 25 Aug 2021 09:11:15 +0800
Message-ID: <20210825011120.30481-1-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_181133_656691_8C9E87D4 
X-CRM114-Status: UNSURE (   7.51  )
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

This patch is base on v5.14-rc1,
series "Mediatek MT8192 clock support"[1] and [2].

[1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=521127
[2] https://patchwork.kernel.org/project/linux-mediatek/patch/20210727023205.20319-2-chun-jie.chen@mediatek.com/

Chun-Jie Chen (5):
  arm64: dts: mediatek: Correct system timer clock of MT8192
  arm64: dts: mediatek: Correct UART clock of MT8192
  arm64: dts: mediatek: Correct SPI clock of MT8192
  arm64: dts: mediatek: Correct Nor Flash clock of MT8192
  arm64: dts: mediatek: Correct I2C clock of MT8192

 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 90 +++++++++++++-----------
 1 file changed, 50 insertions(+), 40 deletions(-)

--
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
