Return-Path: <SRS0=AnEI=KU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D89E5C2B9F8
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 May 2021 13:38:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1BBB6140F
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 May 2021 13:38:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1BBB6140F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=E9egXjnFsyl/rWaxgBfxE6HEbZRv/mdmzSX1lT+BcBQ=; b=btGIp5ifFFtgrN
	t5RmUXCWD5HrQ0KIJGOUngxNjdTKAvribWv/E6MN5ndJAdk9GZxsi0IXasd1lCuDXXxkenv708Yco
	E+lUBKEyTcQQUpJSmqCz7yPfuri1H4RjjAu6lwrKR/UOM5KdVsdOOrAcbJl+SP94oyjXXnxJ0ao2l
	REhMCtIhtTVd91uJF/scM6QtuxcPR4lnQ90glCsMuJ8H3eZKVvJZ+po5qf+WJe2MBGBasvdxS7gOT
	irYKokFMAtU61h78HF/cJsmULa1/ns5gm+wHEQBU7T0IELk6veMfx7WqUbEWjINd7XOsAA4xVU8BM
	ZZwqEi9cxUhlLMTWfzPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llXG5-005Ncg-Da; Tue, 25 May 2021 13:38:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llX47-005INZ-Gy; Tue, 25 May 2021 13:25:50 +0000
X-UUID: 67fd25c9e7214aaca496da5bc8eb526d-20210525
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=ud7imlrmde8MlcwDmtfapnR90OaFzmMSmXBH1Z1clLc=; 
 b=jupMGlGLJ9MHSHbC7E+lChBVh0Az1WbX4YksBHInO5+Z7JIfLoGzXyGyi3KfCDhixW8JTVEJI4mztpFMZmToCD83Mq1Jrb/FekPNlcM2VYfnJ0GZJt/88mqgQCTEMyPVm5fB4XBY70mMpGm08UCa+u4UIkV415fPK3zx3BwRyHY=;
X-UUID: 67fd25c9e7214aaca496da5bc8eb526d-20210525
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1623537973; Tue, 25 May 2021 06:25:42 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 May 2021 06:25:40 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 May 2021 21:25:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 25 May 2021 21:25:38 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [v3 0/2] Add MediaTek MT8192 clock provider device nodes
Date: Tue, 25 May 2021 21:24:57 +0800
Message-ID: <20210525132459.8741-1-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_062549_020394_DF8B40A0 
X-CRM114-Status: UNSURE (   8.06  )
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

- this series is based on v5.13-rc3 and dependents on
"Mediatek MT8192 clock support"[1].
- add devcie tree reviewer to list.

[1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=487577

chun-jie.chen (2):
  arm64: dts: mediatek: Add mt8192 clock controllers
  arm64: dts: mediatek: Correct UART0 bus clock of MT8192

 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 165 ++++++++++++++++++++++-
 1 file changed, 164 insertions(+), 1 deletion(-)

--
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
