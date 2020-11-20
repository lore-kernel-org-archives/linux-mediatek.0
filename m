Return-Path: <SRS0=OETw=E2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A0E3C63777
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2020 18:37:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B15D4246AA
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2020 18:37:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2V+16Op5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="oeHjZdCS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B15D4246AA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YxWapJU3LB6bmBujx3q6lbL4r0VlARDCqx/1n65v12Y=; b=2V+16Op5JIocKIOshZl2e49hf
	i1njGnMaMsmM/VubuoXFiVUmaE30ru+GyZnRpWv1eEVN4ooNcs3mA9thSU+mZ/BA113zaUZlQynOI
	3aMEYt2cg1mGH85FLZLirc3IromdC2frIGEcYusjR59TkQ71j9UpaptbtnUU16+Nn0vzZUmcNTu4e
	qlULnB7JG7OFLJY4op0SMc9jC2s1vKqjS26bLDQ8Ja26ldr59CIYeXT5CspkprGZR9O1YSoB6kctn
	KgIdTX/I9CPuZQ1I1Fh+gszPjuEydo/mW02zgrtijqgM/XWye6LOKSs7be6F9VhKz+9OHrMxJdJQl
	iQX2EK9GA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgBHb-0002r1-UC; Fri, 20 Nov 2020 18:37:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgBHV-0002ps-Iv; Fri, 20 Nov 2020 18:37:14 +0000
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C417B24124;
 Fri, 20 Nov 2020 18:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605897432;
 bh=szf042y2s9sgwSPIKL6lzAqAJLKh9Jw1IOFO3mdaolE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oeHjZdCSofjeMmI9xih31DLKwyANZ7rHAW7CLK9y0d1rivty8MP53oItCKYp9jeKT
 0wc7gaygePioCZyYuNSoIyLzNQIjOqafmLAQpkJKGo7TtC63gldue3DCaZd1zqXU8I
 RLyL+t8nu2CeAOw9Wd8jHDtqEsZkLA+arrZWwy+s=
Date: Fri, 20 Nov 2020 12:37:18 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Kalle Valo <kvalo@codeaurora.org>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 099/141] mt76: mt7615: Fix fall-through warnings for Clang
Message-ID: <5e4366865b6fd0d0dd6b504b66f430b67c315841.1605896060.git.gustavoars@kernel.org>
References: <cover.1605896059.git.gustavoars@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1605896059.git.gustavoars@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_133713_980436_82DE5405 
X-CRM114-Status: GOOD (  13.61  )
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
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-hardening@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In preparation to enable -Wimplicit-fallthrough for Clang, fix a
warning by replacing a /* fall through */ comment with the new
pseudo-keyword macro fallthrough; instead of letting the code fall
through to the next case.

Notice that Clang doesn't recognize /* fall through */ comments as
implicit fall-through markings.

Link: https://github.com/KSPP/linux/issues/115
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7615/eeprom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt7615/eeprom.c
index f4756bb946c3..9a9685e5ab84 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/eeprom.c
@@ -127,7 +127,7 @@ mt7615_eeprom_parse_hw_band_cap(struct mt7615_dev *dev)
 		break;
 	case MT_EE_DBDC:
 		dev->dbdc_support = true;
-		/* fall through */
+		fallthrough;
 	default:
 		dev->mt76.cap.has_2ghz = true;
 		dev->mt76.cap.has_5ghz = true;
-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
