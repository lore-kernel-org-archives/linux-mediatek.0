Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 491A0C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 12:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bba8CFBLEzCVMycdqjuHz4JLgs7oLSvh+sjFZ0ftRrs=; b=Qus+9BQ6XAl+oi
	JV84CxDWmUd+RFqEP3vEhllL+q+BWxbzFj+VDN+nTVV1WCX4o60uOEFazAuI6qX89cTB6trOqMGlT
	yRQSik5johotGCweiuSHcfvXfkvRUYx/Lud+hHUY9kRnegkd8XkfZ5knOy7UGV+0cs8Zq5VbCnLPz
	7NtuHcTnHvyeLxhLtqTWV6+bqtP5kPUcAZy1RIE3benQanDOxIYdt4b/0xHj4OApOJHj7BqidEKEG
	Vbv8RZNK6nDbzmN3g2upB8vMd3lGqb2sEVC2MUIFUaYHmvQ7RXweNBaUnROG1m8+wauQtwswp54Dj
	pjanaMB1fedcM6oW1dCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndsoX-008rpO-S0; Mon, 11 Apr 2022 12:06:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndsnr-008rXp-Ly; Mon, 11 Apr 2022 12:06:01 +0000
X-UUID: df7f9e1adb9f494c98095150c982e24b-20220411
X-UUID: df7f9e1adb9f494c98095150c982e24b-20220411
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 239232337; Mon, 11 Apr 2022 05:05:49 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Apr 2022 05:05:47 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 11 Apr 2022 20:05:46 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 11 Apr 2022 20:05:45 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: <linux-firmware@kernel.org>
CC: <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
 <tinghan.shen@mediatek.com>, <Yunfei.Dong@mediatek.com>,
 <irui.wang@mediatek.com>, <srv_heupstream@mediatek.com>
Subject: pull request: linux-firmware: Create Mediatek MT8192 SCP firmware 
Date: Mon, 11 Apr 2022 20:05:44 +0800
Message-ID: <20220411120545.20066-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_050555_769804_97E3D57E 
X-CRM114-Status: UNSURE (   7.47  )
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

The following changes since commit 681281e49fb6778831370e5d94e6e1d97f0752d6:

  amdgpu: update PSP 13.0.8 firmware (2022-03-18 07:35:54 -0400)

are available in the Git repository at:

  https://github.com/yunfeidongmediatek/linux_fw_scp_8192 v1

for you to fetch changes up to ae8dfb4a5d4c6028ee1fca04b374b0e03ec35360:

  mediatek: Add mt8192 SCP firmware (2022-04-11 20:00:24 +0800)

----------------------------------------------------------------
Yunfei Dong (1):
      mediatek: Add mt8192 SCP firmware

 WHENCE                  |   3 +++
 mediatek/mt8192/scp.img | Bin 0 -> 309436 bytes
 2 files changed, 3 insertions(+)
 create mode 100644 mediatek/mt8192/scp.img



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
