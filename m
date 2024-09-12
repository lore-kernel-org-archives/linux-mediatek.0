Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D53A5EED603
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Sep 2024 13:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rTlTsm0zoeq17ZYNqdaCYwXY/6L7Pkp+oGaR9Mh4b0g=; b=34TS6O39AEBPqth1bsUpdHXmKs
	3okbUFugfxeuIu+DHYYB5yqiqesxTZ7nC8hP0KzJbFo4ZiyEexDYK+A4GfCBwFiNenHG6ixSe31Bs
	FfgDkJCyQ6uRnoSGMcuFasHeddAIclNvJclrcoHxirHm1HSmjaxkHc3bSMXwZ9nv7XBEy5/l8gvBA
	OqyNVDKIZ9YFrHi/wDorEFsEo3ZWlx+8NUGXPt4n5GVjtDdLjFpWKhtDjeLMDyPJuqP99uJ/6CbKu
	PfdpnRz4O3ENWKESweo0LL6c+ncc6XJDxIC/bqlr7Nas2u91PN8HtLVhVPxCslsLO8kw2vmhBDVnB
	52tGWHqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sojqk-0000000DCBx-2w2n;
	Thu, 12 Sep 2024 13:27:06 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sojqh-0000000DC9k-3e3k
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Sep 2024 13:27:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=rTlTsm0zoeq17ZYNqdaCYwXY/6L7Pkp+oGaR9Mh4b0g=;
	b=nPARHoBtysgf/5FLfBjBp4t57Z5frUnZt3zXvHeAgqpnjegbIYyh9vXbEEtLT4
	0QIGif4iRh5LGqWGpsX9r2egKSSwUrNtrhlzltkmg0UIfCf5osnikLHj48lO4Q6u
	9NJ+v8jtue3ZKqemIYGQvD51/DqOQbFYdziPoEBP/ou+c=
Received: from localhost (unknown [58.243.42.99])
	by gzsmtp3 (Coremail) with SMTP id sigvCgC3VJ0V7OJmvQqRAA--.17965S2;
	Thu, 12 Sep 2024 21:26:46 +0800 (CST)
Date: Thu, 12 Sep 2024 21:26:45 +0800
From: Qianqiang Liu <qianqiang.liu@163.com>
To: mingyen.hsieh@mediatek.com
Cc: nbd@nbd.name, lorenzo@kernel.org, deren.wu@mediatek.com,
	linux-mediatek@lists.infradead.org
Subject: Is this a out-of-bounds issue?
Message-ID: <ZuLsFWd6yg07B20y@thinkpad.>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CM-TRANSID: sigvCgC3VJ0V7OJmvQqRAA--.17965S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ur47Zr47KryxKr1DuF43Awb_yoW8Xw1Upa
	4kKFW7Cry7G3WDGw48Jw1DZF4rt3Z3G3W3Gr1Yyw1rXF95Cr93CFZIqa4aya1fKrWvyFy8
	Jr4aqF9xZF9IqaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07bbR67UUUUU=
X-Originating-IP: [58.243.42.99]
X-CM-SenderInfo: xtld01pldqwhxolxqiywtou0bp/1tbiRQVYamXAo33xcgABsL
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_062704_318188_24C8DCF2 
X-CRM114-Status: UNSURE (   8.76  )
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

Hi,

The code in drivers/net/wireless/mediatek/mt76/mt7925/mcu.c may have a
out-of-bounds issue:

638         for (offset = 0; offset < len; offset += le32_to_cpu(clc->len)) {
639                 clc = (const struct mt7925_clc *)(clc_base + offset);
640
641                 if (clc->idx > ARRAY_SIZE(phy->clc)) <-
642                         break;
643
644                 /* do not init buf again if chip reset triggered */
645                 if (phy->clc[clc->idx])
646                         continue;
647
648                 phy->clc[clc->idx] = devm_kmemdup(mdev->dev, clc,
649                                                   le32_to_cpu(clc->len),
650                                                   GFP_KERNEL);
651
652                 if (!phy->clc[clc->idx]) {
653                         ret = -ENOMEM;
654                         goto out;
655                 }
656         }

Let's say the array size of "phy->clc" is 2, then the valid index is 0 and 1.
If "clc->idx" is 2, "clc->idx > ARRAY_SIZE(phy->clc)" must be false, the "break"
statement won't be executed, and "phy->clc[2]" may access illegal memory address.

So, should we modify the code like this?

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 748ea6adbc6b..0c2a2337c313 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -638,7 +638,7 @@ static int mt7925_load_clc(struct mt792x_dev *dev, const char *fw_name)
 	for (offset = 0; offset < len; offset += le32_to_cpu(clc->len)) {
 		clc = (const struct mt7925_clc *)(clc_base + offset);
 
-		if (clc->idx > ARRAY_SIZE(phy->clc))
+		if (clc->idx >= ARRAY_SIZE(phy->clc))
 			break;
 
 		/* do not init buf again if chip reset triggered */

-- 
Best,
Qianqiang Li 


