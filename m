Return-Path: <SRS0=YoM+=H3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66991C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Feb 2021 15:00:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBE3264EDC
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Feb 2021 15:00:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBE3264EDC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q9z2jI/NSvOO3vQzneBCuhv5PduqBDtsn8V7rBQI4L0=; b=PGQAMp8hnt1lfai8bUoPcypOna
	beSfcyOnGVtSO2wRqrNjlPM4bI6Z3VZ/trsaqgVpPOSHHcS3U0Ef9LfmBRQk5C6CMlsT04FTwP5qZ
	3NEwvtDXp4ibYZRk/+Uzp3XMgYStVcIY5gMsFy1LXDZB4GC97A17b1GPafSYwEqYoqbGVimvJgO6O
	6gyc57uALHi1hOyzGMQOzrRosBRr5K3OD4x+eZe5qHcJretsaH/MbzuaJ3Xoyy9Ao+dIr4UYRyHKA
	H5Q5I5Y2FIunFDC6ZHrvdRFIzmGbZixJzf8WQ9wNC8e101TbJOlI9qTsHVvfdPOt7LGNUD1JQbSPZ
	WELQ9sQw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFI7b-0003he-Ol; Thu, 25 Feb 2021 15:00:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFI7X-0003gx-Ob; Thu, 25 Feb 2021 15:00:04 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 383B864E83;
 Thu, 25 Feb 2021 14:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614265202;
 bh=4wzLdHIu+jiyPmW3PiOzDadifaMBPSqSTbdxzwLIE1c=;
 h=From:To:Cc:Subject:Date:From;
 b=G1oBjB6uOoC4UCHfTV2LUsCGDAd0MUJCZE95YTtfWF5Cch4L5tnf75prgLq19fCv1
 Zxx6a02DtrC6TzcyNu9066IZV5lBGowkcmlTc6MWj0gqquXzJ4Nca6HENTdXp2HXVQ
 YQ62sJ27DR/kG3CXW12s+6Mh2ayEePgl8nIZpqciUkFWCTojN5gnydDK1B5a/JhV1j
 a4mQU/n6dOxQQ5INkCevueTCy2svlyxM6x6wL5P2fw5WMOt9l8UNwojwQXWEljA7mX
 DJAp5dew5ZMgzfRYGe9Djth9Y4PXO9S15ZM2R+4rGlos00owsJUlV6CxX/8nZCD2N4
 xxZHdY6Mwvj6g==
From: Arnd Bergmann <arnd@kernel.org>
To: Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH 1/2] mt76: mt7915: fix unused 'mode' variable
Date: Thu, 25 Feb 2021 15:59:14 +0100
Message-Id: <20210225145953.404859-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210225_100003_883063_79B93EAA 
X-CRM114-Status: GOOD (  12.05  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-wireless@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>, clang-built-linux@googlegroups.com,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arnd Bergmann <arnd@arndb.de>

clang points out a possible corner case in the mt7915_tm_set_tx_cont()
function if called with invalid arguments:

drivers/net/wireless/mediatek/mt76/mt7915/testmode.c:593:2: warning: variable 'mode' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
        default:
        ^~~~~~~
drivers/net/wireless/mediatek/mt76/mt7915/testmode.c:597:13: note: uninitialized use occurs here
        rateval =  mode << 6 | rate_idx;
                   ^~~~
drivers/net/wireless/mediatek/mt76/mt7915/testmode.c:506:37: note: initialize the variable 'mode' to silence this warning
        u8 rate_idx = td->tx_rate_idx, mode;
                                           ^

Change it to return an error instead of continuing with invalid data
here.

Fixes: 3f0caa3cbf94 ("mt76: mt7915: add support for continuous tx in testmode")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/net/wireless/mediatek/mt76/mt7915/testmode.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
index 7fb2170a9561..aa629e1fb420 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/testmode.c
@@ -543,6 +543,7 @@ mt7915_tm_set_tx_cont(struct mt7915_phy *phy, bool en)
 		tx_cont->bw = CMD_CBW_20MHZ;
 		break;
 	default:
+		return -EINVAL;
 		break;
 	}
 
@@ -591,6 +592,7 @@ mt7915_tm_set_tx_cont(struct mt7915_phy *phy, bool en)
 		mode = MT_PHY_TYPE_HE_MU;
 		break;
 	default:
+		return -EINVAL;
 		break;
 	}
 
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
