Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C37F3C77B73
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Apr 2023 13:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rr/VGc2QJFQQWWyAsRt+4nmKh6M6OKkHUXWnMS647nA=; b=GmRWoDtecdCiJczxQuh30iDWrc
	trU92ay0ru+d3nO5rqTnNBLEzaNzgXCTBHO/ZeiFx7epsDPP+xNtUuxK2/Hk2TRkDksaVmWtvQ48o
	iCzdj+w+KwQY7vdahYrumjuySqfceefwdIbdkEy7nyHK/dRRoOmrxLVzh+u8JDrqVMFXkdjjqZJaj
	pP5hu+UrUpua/GLpOLDvmgTz198CwAZUPMnra7dLBEvLOjDf2E55Ti3WzMJ3PtE4dcKAbq70UIJ0k
	3dFcqe0hxCnPlrpo/XffNqTy5wvkw/uivB/JD1zgazMQAgoHvDL1y6Knf19ncSTO52uK5iYaYon7u
	Zda+zKfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppU45-008AO1-31;
	Thu, 20 Apr 2023 13:11:09 +0000
Received: from [202.114.0.240] (helo=hust.edu.cn)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppU3s-008AJj-1g;
	Thu, 20 Apr 2023 13:11:08 +0000
Received: from wjk.. ([10.12.190.56])
	(user=wangjikai@hust.edu.cn mech=LOGIN bits=0)
	by mx1.hust.edu.cn  with ESMTP id 33KD8iYo011467-33KD8iYp011467
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 20 Apr 2023 21:09:14 +0800
From: Wang Jikai <wangjikai@hust.edu.cn>
To: Jakub Kicinski <kuba@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: hust-os-kernel-patches@googlegroups.com,
        Wang Jikai <wangjikai@hust.edu.cn>, Jakub Kicinski <kubakici@wp.pl>,
        linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH 1/2] wifi: mt7601u: delete dead code checking debugfs returns
Date: Thu, 20 Apr 2023 13:08:14 +0000
Message-Id: <20230420130815.8425-1-wangjikai@hust.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-FEAS-AUTH-USER: wangjikai@hust.edu.cn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_061056_934011_9CFF3CA6 
X-CRM114-Status: UNSURE (   9.11  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Smatch reports that:
drivers/net/wireless/mediatek/mt7601u/debugfs.c:130
mt7601u_init_debugfs() warn: 'dir' is an error pointer or valid".

Debugfs code is not supposed to need error checking so instead of
changing this to if (IS_ERR()) the correct thing is to just delete
the dead code.

Fixes: c869f77d6abb ("add mt7601u driver")
Signed-off-by: Wang Jikai <wangjikai@hust.edu.cn>
---
The issue is found by static analysis and remains untested.
---
 drivers/net/wireless/mediatek/mt7601u/debugfs.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt7601u/debugfs.c b/drivers/net/wireless/mediatek/mt7601u/debugfs.c
index 230b0e1061a7..dbddf256921b 100644
--- a/drivers/net/wireless/mediatek/mt7601u/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt7601u/debugfs.c
@@ -127,8 +127,6 @@ void mt7601u_init_debugfs(struct mt7601u_dev *dev)
 	struct dentry *dir;
 
 	dir = debugfs_create_dir("mt7601u", dev->hw->wiphy->debugfsdir);
-	if (!dir)
-		return;
 
 	debugfs_create_u8("temperature", 0400, dir, &dev->raw_temp);
 	debugfs_create_u32("temp_mode", 0400, dir, &dev->temp_mode);
-- 
2.34.1


