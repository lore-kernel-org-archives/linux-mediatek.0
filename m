Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE48CD98CC
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jun 2026 15:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tMCB5aEJqZUM5g7PfGe/93cSlvh7IQWgPKJGGXWKhlM=; b=Tt9LOvV/Ow2N5L10TuikgnXUjE
	xKeXv9L1JGPcfvoYy8D1c36fbqQqVwUCMAhkHEYEmAWZliMxvYdkmy5SoiMHBH6SnmUEGApL3E8W3
	vF+FZcZP6mGd1HG8ouw+0mOGRn5hgG6+4wE9axaqasuPEFtfL1ubtfl8Nq2q/gS3nAvec1E9juI7O
	BmWipga7JUUbBwHFXGpkNkNe5cezwbvOZ/GxCFQClEs3cPpUdH6wqmruKBF5on6PFSAYLKnsjYGjt
	AP6NSxyWUMQ6/x8rFUDVfzaQPk7k5rDcI+ny9P6+zrPosy2ZzSHmieWMdZ90p+tAD7/LB2npVLUYN
	qofTQFdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXgtv-00000009e35-3XWV;
	Thu, 11 Jun 2026 15:00:59 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXgtt-00000009e2L-43gU
	for linux-mediatek@lists.infradead.org;
	Thu, 11 Jun 2026 15:00:59 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-842264dde84so575774b3a.0
        for <linux-mediatek@lists.infradead.org>; Thu, 11 Jun 2026 08:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781190054; x=1781794854; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tMCB5aEJqZUM5g7PfGe/93cSlvh7IQWgPKJGGXWKhlM=;
        b=Fe8ZlJ28T8dNsfOb1NdGB2P33S/Tgc5Xhvbv1OJwP0wBuQjq8VY4BG6uO/9gEyFTe0
         QtPP7HJap6SuhS4dumRuKYetq1Dg4Z5nZnt23HjF4Zfm0/xkD/PViqlSh2MNbybrSpac
         26BAl9yfq4ZgQAUkPYfvuSXbDDQgJkJWIsUHgyiPf6IXstNZA3fQqeMDLMn2JHzL7nPs
         3C/jCmLrZJFJMKyXxNVHFHmKYwlunFm6gaBKSD5KM6srTKFPrRkhO+mv/4/XNQYlDm3J
         e7WkTN4zkR5e8zjAfIBntdoeUmx6+sjZCTK5zuott8ZipoH45YlvVrJKlCvj9twzduTh
         L53A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781190054; x=1781794854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tMCB5aEJqZUM5g7PfGe/93cSlvh7IQWgPKJGGXWKhlM=;
        b=LtSng2ValcKU6cpv6yGid/cwn/EA3nD5v4/NYIYOvElwIru1uf86vpUHr6GyyLIJT6
         Zw5kWgID11z3P17CUWFqLwWrk6IS+o8g3BglUmp/R2VSwy28C+HGKW2ihikuSY9ggTKA
         b5PO+xu+17EppJK/2N0yOgbDvh+7aH1eiqOaTj/FI1znF8Q/u2an4ARxU/+m5yLz8eW1
         z+A54HoNPan6N7Fe0xqQukugTGeIEzvD2ct6HUluOtIo2QhTyx7zeHriMMk53Q4fADzO
         GuD3rd88IQiEEvv6cBewR06O0BoOFK2YwpFz0E8AOdwhsnKczrOP/0HsgGgtqtEZ02E2
         UK2w==
X-Forwarded-Encrypted: i=1; AFNElJ/sf9JsdY4T7AbihttJLDyd6V+VwKggPlgOAYkmj9lZ4CekDU5Kz9O4NbyhPtERQpNTwwJ9Eb4RnKFgcKbk/g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxnkhTzuB6vv56hgAIA0BnWwREI1fBpLd02zhF1rZAWtOaWRcTw
	pUsy4Sn3ZnCyamvwog1nW5Zf/TuWe3D40EG6CaFO6Diap/krD3XurXvO
X-Gm-Gg: Acq92OE6SRD81YkvR1RoPOhDN87WRqa2U32OSplsJko7moqs3AGHPsOnE9qNZ9Tcrmk
	yXQV2NtDHqRhtxc2dM9CvXm0olyBqysJJvWKIAWQNTxq3OMN4Ubyanyl/4CYJ1jXBInLXfLo+yo
	G0eNp3YetefuHl3JptX2njTpb3H3Pjz+tMfdIiirWy4WL4epIIYa/schVV/UpfT2TSbwn0ThIwg
	X60TvFNV+QzfFllw6PCWscf3Wnq73umUfV3263s36YXIwYckRqrdG2icAauXCCg2AHBozpESi9N
	GE8q7n0ul39wxACBmsECZn/GWOxX/NwHS4DVUsiZaZ9YPyYH9Z0pExHzJ03uOduORdRxWWw9Ayf
	CzkOeNaxvRJkFVySQ0r0+QqyBEg+flYbZgyGSYuwpBuV2/36yD22IYj9Ph3Dw6nzN85Kn+r1tmJ
	ekkJ7CdiMqp29nmHmRA9xLSYLRDlSfjFhxBrcSHW0mfALGAESSd6Rur5lLR5z/dmkR5tzqj4UQy
	Hk=
X-Received: by 2002:a05:6a00:3988:b0:842:63f5:d097 with SMTP id d2e1a72fcca58-84335ca5571mr3001210b3a.3.1781190053512;
        Thu, 11 Jun 2026 08:00:53 -0700 (PDT)
Received: from DESKTOP-VNSSJ2S.lan (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84337bb6ca7sm2481378b3a.14.2026.06.11.08.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 08:00:52 -0700 (PDT)
From: Zhi-Jun You <hujy652@gmail.com>
To: lorenzo@kernel.org
Cc: nbd@nbd.name,
	netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Zhi-Jun You <hujy652@gmail.com>
Subject: [PATCH] net: ethernet: mtk_wed: fix loading WO firmware for MT7986
Date: Thu, 11 Jun 2026 23:00:51 +0800
Message-ID: <20260611150051.586-1-hujy652@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_080058_053920_5915B29C 
X-CRM114-Status: UNSURE (   9.86  )
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

MT7986 requires a different mask for second WO firmware.
Without this, WO would timeout after loading FW.

The correct mask was removed when adding WED for MT7988.
Add it back and add a WED version check to fix it.

This can be reproduced with a MT7986 + MT7916 board.

Fixes: e2f64db13aa1 ("net: ethernet: mtk_wed: introduce WED support for MT7988")
Signed-off-by: Zhi-Jun You <hujy652@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_wed_mcu.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed_mcu.c b/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
index fa6b21603416..0d38183c6ba7 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
@@ -367,8 +367,12 @@ mtk_wed_mcu_load_firmware(struct mtk_wed_wo *wo)
 	/* wo firmware reset */
 	wo_w32(MTK_WO_MCU_CFG_LS_WF_MCCR_CLR_ADDR, 0xc00);
 
-	val = wo_r32(MTK_WO_MCU_CFG_LS_WF_MCU_CFG_WM_WA_ADDR) |
-	      MTK_WO_MCU_CFG_LS_WF_WM_WA_WM_CPU_RSTB_MASK;
+	val = wo_r32(MTK_WO_MCU_CFG_LS_WF_MCU_CFG_WM_WA_ADDR);
+
+	if (!mtk_wed_is_v3_or_greater(wo->hw) && wo->hw->index)
+		val |= MTK_WO_MCU_CFG_LS_WF_WM_WA_WA_CPU_RSTB_MASK;
+	else
+		val |= MTK_WO_MCU_CFG_LS_WF_WM_WA_WM_CPU_RSTB_MASK;
 	wo_w32(MTK_WO_MCU_CFG_LS_WF_MCU_CFG_WM_WA_ADDR, val);
 out:
 	release_firmware(fw);
-- 
2.47.3


