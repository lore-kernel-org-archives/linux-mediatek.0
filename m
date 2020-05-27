Return-Path: <SRS0=IT6v=7J=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 018B9C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 May 2020 13:37:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB84020C09
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 May 2020 13:37:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iCNR7WiA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB84020C09
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8ovNee6qbfOZwhc4TSReqBsiEoU3yq1oyXPJMIxT5Vk=; b=iCNR7WiA4dsv24
	WpWLyqtk29tUJy80Q7ueLJuQ1eu6vp4LMPl+ngq5SlE0yg5C5gNOk3rNfKvvFnmsQqL6/F4F9jN5u
	ynHffTi7pwWGftVuF0/RPDePcza1QToMY5ZgGv7wC9YyhN7W1K7bfzYa3yo8MZog5ZQM54u0Eczc7
	876MM/AsZum4IZz/3DW8mN2PwAalJQyogbO2fULtyoBCUFjn+ATrJ/pnYp0HdI/R4GtX0dZAABgo/
	YWXjjE1JYbIGj7o0cIDpXkA53Ih1VjQA6ktgXZHJ87J8QDKQRtuaP5sR9nvNex1hq2v2lPUj91h/b
	lo1b/1QryWta/kqvYfuQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdwFM-00018l-UQ; Wed, 27 May 2020 13:37:28 +0000
Received: from mout.kundenserver.de ([212.227.126.131])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdwFI-000183-RL; Wed, 27 May 2020 13:37:26 +0000
Received: from localhost.localdomain ([149.172.98.151]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MelWf-1j437k3y2n-00aqFI; Wed, 27 May 2020 15:36:58 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Kalle Valo <kvalo@codeaurora.org>
Subject: [PATCH] [wireless-next] mt75: fix enum type mismatch
Date: Wed, 27 May 2020 15:36:30 +0200
Message-Id: <20200527133655.617357-1-arnd@arndb.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:2xsdauHeCgoTJqtAjoy1w439KhbI5AyVOuAxW1IHW47YA4Gorsi
 Uh4YCVjbYsbddzHdqSL/9Nyka228g3hOyRaepN6TWoIe5HUzp67ihrRMluLbPYi2hFTnxyw
 1JRB8qLO9BliOGYOZdkWVaHW2CucwMbhaxuLQUo9QhEp3DP9AIG3a/U+jSsmX/6lg/tAn8j
 7jHNArva+RLoRfuAuh3Cw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FtVcgZauz7o=:scUFGVl1oIETlCqq2XG30+
 BY+OSB/p/C2PHbQV8moxHzruH1uP9Hs2Cmkfuzt1pzAyXtW82VPL+i6XhfkL4Kzn7fV4xIawJ
 A2HAq5Il64nn45Q6XqxowsRnC3JKSDVcU6+/hxjOI0t5GljWTrL92TJl527WU8NnDHJS4Tsmr
 KsgZU4nD98sSiKPVkTHHG6nMcDBR3BIOtqB5sWIH6/bz3j+ogz/P1rSXjrKE0QGmIvpjlYWua
 3SS7ZaIIfPGwxYYgrFIJ+K+IdIdOXXvEY8bX+OteZNxdWkg2RjR6bBm/P/yo4S8qC8nEl6Bow
 YJpUhM/w7lN9lF3hGTidifdzL9moxS+mjIcV6NaE77kl9pTr1m1pdb19VurLWicwiNgTE2fgG
 6wGAv4DAXmgkb6c6AwimTkBPyjXRsaK2gl5t/gWIv5dz++WZzoYVa+r+a2J4ZpwrK6K6pH5EU
 Z5Dy7USzvBQWE/JgGDaFqcG+Zk8lbixikSTtHW+LPnfyiDbiKHjlimzlMGpd4+NVXmrgc8uJd
 YgMB9mM3nsWcahk0NbkhXZsVMe14iaKWstbUlaF/zFJ1TnQC3bPfKIooWLd7eSJkNYMY6dJ41
 zAneqRyKhsqVGB16LHOiS9GXVxbBwaemmq2+f9F08NizeJDLOrW4MAY0hLNAQ5WzoMC9RUliB
 vSvJiyC5p01107GyNrmS7vC+Nfi31gg21wIlE8ej7ZltRD0sM09YzWVBnr5fkky8ZBGd4pQfE
 YxO/L8TcnJlj9bmltBSZuOTgEL8rM/nVk034s2QC/YfSrq20qSaPTCrGtTgxQncP9Ds0LSwdn
 lOjGQJNACJeHLPwBGXaDbUg2u7n3XaDiXVfLbhmQB6Wp7qadf4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200527_063725_175336_8F94A1D2 
X-CRM114-Status: GOOD (  12.10  )
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
Cc: Shihwei Lin <shihwei.lin@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Arnd Bergmann <arnd@arndb.de>, YueHaibing <yuehaibing@huawei.com>,
 YF Luo <yf.luo@mediatek.com>, Chih-Min Chen <chih-min.chen@mediatek.com>,
 linux-kernel@vger.kernel.org, Yiwei Chung <yiwei.chung@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The __mt7915_mcu_msg_send() calls a generic function that expects a mt76_txq_id
rather than mt7915_txq_id, and it also uses the values according to that
type, which are different from the similarly named MT7915_TXQ_ constants:

drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:232:9: error: implicit conversion from enumeration type 'enum mt76_txq_id' to different enumeration type 'enum mt7915_txq_id' [-Werror,-Wenum-conversion]
                txq = MT_TXQ_FWDL;
                    ~ ^~~~~~~~~~~
drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:287:36: error: implicit conversion from enumeration type 'enum mt7915_txq_id' to different enumeration type 'enum mt76_txq_id' [-Werror,-Wenum-conversion]
        return mt76_tx_queue_skb_raw(dev, txq, skb, 0);
               ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
drivers/net/wireless/mediatek/mt76/mt7915/../mt76.h:668:97: note: expanded from macro 'mt76_tx_queue_skb_raw'

Use the mt76 types consistently.

Fixes: e57b7901469f ("mt76: add mac80211 driver for MT7915 PCIe-based chipsets")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 99eeea42478f..001b3078c48e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -220,7 +220,7 @@ static int __mt7915_mcu_msg_send(struct mt7915_dev *dev, struct sk_buff *skb,
 {
 	struct mt7915_mcu_txd *mcu_txd;
 	u8 seq, pkt_fmt, qidx;
-	enum mt7915_txq_id txq;
+	enum mt76_txq_id txq;
 	__le32 *txd;
 	u32 val;
 
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
