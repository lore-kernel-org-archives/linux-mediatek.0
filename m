Return-Path: <SRS0=p+jW=B4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8153FC433E1
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2020 08:37:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43A102067C
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2020 08:37:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f0VhM+K2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="oiWpoxmA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43A102067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZhOubiDDDyOhECNgznO2rU+hl7f2Vv3zW0cXrJm/M9U=; b=f0VhM+K2amYrceMtuZoGzixRXa
	G2FtCosqQNSW2A1kAv0/JIycDZgh4QSdmy/ZX2sa4LM4v0lIKOlPH+XmiaJVgVcYCrZcRaLsJcrb7
	/zFdNKKU1XrxG07TPkssKS6IZmZfbBU5i/n+zQIbTPr2Da3xSaCZJCeAcMNlh8xbj8bZ3ARBoX+nd
	PWaEnVqbW6DjumtjIan+NKHmExyXn8/xuCCTzgPct+U+uW/VPbOKZjmVZgUBWdMqb5Q1QSUvtgFlx
	08eIHLEVRxFPrE/0Gm//NEep3lSurX1zm+cI4iaiM0WlcGCKHPHYgJOBwVPAEQ4hr2CJvNO6D33i8
	KpGKsHuA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7x7o-000762-Vv; Tue, 18 Aug 2020 08:37:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7x7l-00073G-H1
 for linux-mediatek@lists.infradead.org; Tue, 18 Aug 2020 08:37:43 +0000
X-UUID: 37f60a558a7d4db392495e0dca61ab49-20200818
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=aSQA+gxoSQ0QZcwrx3/12pS4dgKqh+H+S6wrzElQA5M=; 
 b=oiWpoxmA2YANbo7haAsYbJSgyylv9S4ht81wS6EyCqIstVn21fk5Ar2jAKtlpST48ofT9Nh/u15hEBSLmIrvau83di5Jjy7RTyv6uc/AvA+UuJzKGIGGfhZqyQVLHz+yEiZ5zQGq/Co59DsLziJlfHVaQLqQ5WGNqufHrOun0Ug=;
X-UUID: 37f60a558a7d4db392495e0dca61ab49-20200818
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <light.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1497171527; Tue, 18 Aug 2020 00:37:26 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 18 Aug 2020 01:36:31 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 18 Aug 2020 16:36:16 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 18 Aug 2020 16:36:17 +0800
From: <light.hsieh@mediatek.com>
To: <linus.walleij@linaro.org>
Subject: [PATCH v1 1/2] pinctrl: mediatek: support access registers without
 race-condition
Date: Tue, 18 Aug 2020 16:36:15 +0800
Message-ID: <1597739776-15944-1-git-send-email-light.hsieh@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200818_043741_711830_1C7D47C0 
X-CRM114-Status: GOOD (  17.33  )
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
Cc: sean.wang@kernel.org, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, Light Hsieh <light.hsieh@mediatek.com>,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Light Hsieh <light.hsieh@mediatek.com>

Some MediaTek SOC provide more control registers other than value register.
Generanll, a value register need read-modify-write is at offset 0xXXXXXXXX0.
A corresponding SET register is at offset 0xXXXXXXX4. Write 1s' to some bits
  of SET register will set same bits in value register.
A corresponding CLR register is at offset 0xXXXXXXX8. Write 1s' to some bits
  of CLR register will clear same bits in value register.
For GPIO mode selection, MWR register is provided at offset 0xXXXXXXXC.
  With MWR, the MSBit of GPIO mode selection field is for modification-enable,
  not for GPIO mode selection, and the remaining LSBits are for mode
  selection.
  Take mode selection field with 4-bits as example, to select mode 0~7 via
  MWR register, 8~15 (instead of 0~7) shall be written to corresponding mode
  selection field.
When using SET/CLR/MWR registers, read-modify-write of value register is not
  necessary. This can prevent from race condition when multiple bus masters
  concurrently read-modify-write the same value register for setting different
  fields of the same value register.

Signed-off-by: Light Hsieh <light.hsieh@mediatek.com>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 69 ++++++++++++++++++++++--
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h |  2 +
 2 files changed, 67 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index b77b18f..51f0b53 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -18,6 +18,29 @@
 #include "mtk-eint.h"
 #include "pinctrl-mtk-common-v2.h"
 
+/* Some MediaTek SOC provide more control registers other than value register.
+ * Generanll, a value register need read-modify-write is at offset 0xXXXXXXXX0.
+ * A corresponding SET register is at offset 0xXXXXXXX4. Write 1s' to some bits
+ *  of SET register will set same bits in value register.
+ * A corresponding CLR register is at offset 0xXXXXXXX8. Write 1s' to some bits
+ *  of CLR register will clear same bits in value register.
+ * For GPIO mode selection, MWR register is provided at offset 0xXXXXXXXC.
+ *  With MWR, the MSBit of GPIO mode selection field is for modification-enable,
+ *  not for GPIO mode selection, and the remaining LSBits are for mode
+ *  selection.
+ *  Take mode selection field with 4-bits as example, to select mode 0~7 via
+ *  MWR register, 8~15 (instead of 0~7) shall be written to corresponding mode
+ *  selection field.
+ * When using SET/CLR/MWR registers, read-modify-write of value register is not
+ *  necessary. This can prevent from race condition when multiple bus masters
+ *  concurrently read-modify-write the same value register for setting different
+ *  fields of the same value register.
+ */
+
+#define SET_OFFSET 0x4
+#define CLR_OFFSET 0x8
+#define MWR_OFFSET 0xC
+
 /**
  * struct mtk_drive_desc - the structure that holds the information
  *			    of the driving current
@@ -64,6 +87,38 @@ void mtk_rmw(struct mtk_pinctrl *pctl, u8 i, u32 reg, u32 mask, u32 set)
 	mtk_w32(pctl, i, reg, val);
 }
 
+
+static void mtk_hw_set_value_race_free(struct mtk_pinctrl *pctl,
+		struct mtk_pin_field *pf, u32 value)
+{
+	unsigned int set, clr;
+
+	set = value & pf->mask;
+	clr = (~set) & pf->mask;
+
+	if (set)
+		mtk_w32(pctl, pf->index, pf->offset + SET_OFFSET,
+			set << pf->bitpos);
+	if (clr)
+		mtk_w32(pctl, pf->index, pf->offset + CLR_OFFSET,
+			clr << pf->bitpos);
+}
+
+static void mtk_hw_set_mode_race_free(struct mtk_pinctrl *pctl,
+		struct mtk_pin_field *pf, u32 value)
+{
+	unsigned int value_new;
+
+	/* MSB of mask is modification-enable bit, set this bit */
+	value_new = (1 << (pctl->soc->mwr_field_width - 1)) | value;
+	if (value_new == value)
+		dev_notice(pctl->dev,
+			"invalid mode 0x%x, use it by ignoring MSBit!\n",
+			value);
+	mtk_w32(pctl, pf->index, pf->offset + MWR_OFFSET,
+		value_new << pf->bitpos);
+}
+
 static int mtk_hw_pin_field_lookup(struct mtk_pinctrl *hw,
 				   const struct mtk_pin_desc *desc,
 				   int field, struct mtk_pin_field *pfd)
@@ -197,10 +252,16 @@ int mtk_hw_set_value(struct mtk_pinctrl *hw, const struct mtk_pin_desc *desc,
 	if (value < 0 || value > pf.mask)
 		return -EINVAL;
 
-	if (!pf.next)
-		mtk_rmw(hw, pf.index, pf.offset, pf.mask << pf.bitpos,
-			(value & pf.mask) << pf.bitpos);
-	else
+	if (!pf.next) {
+		if (hw->soc->race_free_access) {
+			if (field == PINCTRL_PIN_REG_MODE)
+				mtk_hw_set_mode_race_free(hw, &pf, value);
+			else
+				mtk_hw_set_value_race_free(hw, &pf, value);
+		} else
+			mtk_rmw(hw, pf.index, pf.offset, pf.mask << pf.bitpos,
+				(value & pf.mask) << pf.bitpos);
+	} else
 		mtk_hw_write_cross_field(hw, &pf, value);
 
 	return 0;
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
index 27df087..95fb329 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
@@ -203,6 +203,8 @@ struct mtk_pin_soc {
 	/* Specific parameters per SoC */
 	u8				gpio_m;
 	bool				ies_present;
+	bool                            race_free_access;
+	unsigned int                    mwr_field_width;
 	const char * const		*base_names;
 	unsigned int			nbase_names;
 
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
