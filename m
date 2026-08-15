Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D18BC5CFC1
	for <linux-mediatek@archiver.kernel.org>; Sat, 15 Aug 2026 10:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nnQwhiS1oK35ru3NmuwF6q+bn/KVmSxsNWaO1by97NI=; b=jaoijnlgF7rb1Zu90vj7Yuhqpd
	Wwxgom4tWIkDHU1jqkluaEQo/mq0SrkAkx58VSwNoLlELk0BebuAxe1ISJHXDtJqbDVo2pWNkK6CI
	u3OYni8QNN7TZ/V8mgn6aFyhpjbSHSLLCY5WA9S9cqBf4BE7l7NQJsMvzLk+M1Fn3+hY2Q+TdkYHu
	bJKVwESDxom66vZ2tFIAhUKGF+KE1Q4TiXz2AvkpIMDuC2ksW8enT0arJi3Q68zrUxzZUcj6QRIVD
	0aURgfagIPe4CMb+Ec/U493FX1YpFgEH9rmZIzGDB/wPg1twRClkD+JOhxSe5sd9lJwYyGnJdm4SW
	ZlX80spQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvBhZ-00000003kI7-3E4W;
	Sat, 15 Aug 2026 10:33:21 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvBhX-00000003kHW-2GGq
	for linux-mediatek@lists.infradead.org;
	Sat, 15 Aug 2026 10:33:20 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5b0117dda13so1744182e87.0
        for <linux-mediatek@lists.infradead.org>; Sat, 15 Aug 2026 03:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786789997; x=1787394797; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nnQwhiS1oK35ru3NmuwF6q+bn/KVmSxsNWaO1by97NI=;
        b=QQWPFwA99GZt3XmgeNwWHaumTx7myPt98imC63OOQe67CF1tmaUWdDSHIWnxu+UvAj
         b6aBxVL6zZcDOB1ECIZd+qStrQqJ2BEYjOzTaTuCXMGVIdW9Gu+DTxosKcZjnMU4XXJB
         eIvvq40iOgaXt9vheGdTjjVg8Yl6ywdN8Y5PzzBL7WYeWU/zmGyx9fQ029extsuHdabs
         uCe0bCMlOnn2uiCNK7K0XnKbbL7elc/yj1GXcG4CziQNB3tuJnAze1vju1+hmqADf0gw
         6DGzoehcwevVcyms0+/gcfli0OpkggLFJzLeClGmzPllsC/ejuB1lzsHOAd2RYjwanJg
         6ckw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786789997; x=1787394797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nnQwhiS1oK35ru3NmuwF6q+bn/KVmSxsNWaO1by97NI=;
        b=tZArs0eAc9iby5Ky3Fw5uT0YyP7Wwd4PPNgaphhJj2XlAQAMPObx/nT8M/Vbd4eBuj
         7yjGdL2ZakBjM5ilrpXyHV2DANpcIToEJRjSB5nchKfOWDCwE1m+ZjXgChBkqutt+5C/
         tFQJKqdIAX/mPQDOaZCgRLVPl3zcqVflUHbEgh2JvY5pxLTMftFvjraEQLKi8wlgPUlI
         dK4vBZV5uVy8xn+LDSZpqFx9El+h3dt5ccO3HAIUwNdKd8227tB9Nh2xHD4N62afoBJY
         yUQnq5o4zu9zf5RHY+QuU8/OACiWrXXReY4DWJWUp/5idNXmrr3NVVTBy3P7fQlEnNGO
         fJgA==
X-Forwarded-Encrypted: i=1; AHgh+RqlpWkwJuNguAokMFnaYIzC6KG3fh7w70I4AhSW+d0itqJf6IHpZxx7DX7tOFPDY6nW/AAlNFjWjvxQt/r9Kg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzXf9J+jVcFUOi5Mag06pMDPWIZ80ZdSmUtXiSpEdu+s1ejGfTl
	YRQamTBU2/mk6OlhEV4p+tUzB1u/K725pBwyh1P28Zmuts8eeIqHX7Hz
X-Gm-Gg: AR+sD13Kw626hhw3n6x0OB70O8I5G4jYie7JdOWsP9fuWPy949BKY6Z6gKSfi3dG5fe
	YGfwZffWbNHmmT2LTUQOKVVlUzhlt+ta00awjMaw4LcjBAEP42DR0QWM9ktLB447OQXGMDZPZLk
	vbEEJaFRLXqLgXJZJmELrkUMGWMOjFYc+kJMlCyiWHUw7MPL51YehNolM2ByW487tDxOZ0x6AMB
	4gPlQimKTo7Lk2TVqhdzngQ/M+8rMsfkfWQNY3Jlm1z7Jftb8ykF7/DVKG3OERHYzC2X5jH2bSH
	arCGe14AX9s0GhNxUv/9aKJxwrcUFOCok9/GViDtQm0ebOOAmAnxigmfI7ADWd/1Lg+BzLeaJVb
	7QXEOkZE7OanCx2rTfgIneZC+LOq51ruDJ+z4pvDuekqJFrhCNXVUL+A1ZQK+TkUVSguQV56+8U
	+nsdMPi00Sk9Jkhrf/2dlNjvTwkMxdsofkPaaFHJ1aQMD0h0d328SEsom8OKiupE2kvLvU1ZLop
	TPs9wnObiLDaO6/qR9iIFozfsxFqhyaY1AeS29rHvNiHvCkyb1itiawKR8O
X-Received: by 2002:a05:6512:32c5:b0:5b3:cd0:6be6 with SMTP id 2adb3069b0e04-5b45914b25cmr2126112e87.54.1786789997153;
        Sat, 15 Aug 2026 03:33:17 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b458b9a964sm1109010e87.1.2026.08.15.03.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 03:33:15 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Cc: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	Deren Wu <deren.wu@mediatek.com>,
	JB Tsai <jb.tsai@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Subject: [PATCH wireless] wifi: mt76: mt7921: fix array-index-out-of-bounds in mt7921_load_clc()
Date: Sat, 15 Aug 2026 15:33:12 +0500
Message-ID: <20260815103312.34080-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_033319_605835_0327A611 
X-CRM114-Status: GOOD (  16.49  )
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

mt7921_load_clc() walks the CLC region of the firmware image and uses
clc->idx, a value taken straight from the blob, as an index into
phy->clc[] without validating it. The array has MT792x_CLC_MAX_NUM (3)
entries, so a firmware image carrying a section with a larger index
overruns it.

linux-firmware 20260810 does exactly that. Dumping the CLC region of
mediatek/WIFI_RAM_CODE_MT7922_1.bin before and after the update:

  20260622, region len 366448:
    idx=0 ver=1 nr_country=255 type=0 len=179384
    idx=0 ver=1 nr_country=255 type=1 len=187064

  20260810, region len 475488:
    idx=0 ver=1 nr_country=255 type=0 len=179384
    idx=0 ver=1 nr_country=255 type=1 len=187054
    idx=3 ver=1 nr_country=0   type=0 len=54520
    idx=3 ver=1 nr_country=0   type=1 len=54530

and UBSAN reports the overrun on every probe:

  UBSAN: array-index-out-of-bounds in
  drivers/net/wireless/mediatek/mt76/mt7921/mcu.c:471:15
  index 3 is out of range for type 'void *[3]'
  CPU: 19 UID: 0 PID: 261 Comm: kworker/19:1 Tainted: G     U              7.2.0-rc7-2f1baf1fc892-with-fixes-v1+ #125 PREEMPT(lazy)
  Hardware name: ASUS System Product Name/ROG STRIX B650E-I GAMING WIFI, BIOS 3854 04/03/2026
  Workqueue: events mt7921_init_work [mt7921_common]
  Call Trace:
   <TASK>
   dump_stack_lvl+0x84/0xd0
   ubsan_epilogue+0x5/0x2b
   __ubsan_handle_out_of_bounds.cold+0x4e/0x58
   mt7921_load_clc+0x826/0xb80 [mt7921_common]
   mt7921_run_firmware+0x113/0x180 [mt7921_common]
   mt7921e_mcu_init+0xba/0x18d [mt7921e]
   mt7921_init_work+0xdb/0x3f0 [mt7921_common]
   process_one_work+0x901/0x1640
   worker_thread+0x601/0xff0
   kthread+0x36e/0x470
   ret_from_fork+0x5bf/0x910
   ret_from_fork_asm+0x1a/0x30
   </TASK>

Both idx=3 sections are read out of bounds; UBSAN deduplicates by
source location, so only one report appears. Booting the same kernel
with linux-firmware 20260622 is clean, so the overrun is only reachable
with the newer blob, but the missing check itself predates it.

phy->clc[3] aliases phy->chip_cap, the u64 that follows the array in
struct mt792x_phy. The report above is the read in the "do not init buf
again" test. mt7921_mcu_get_nic_capability() runs before
mt7921_load_clc() and fills chip_cap in from MT_NIC_CAP_CHIP_CAP, so on
this device it is non-zero, the loop takes the continue path and no
store happens. On a device whose firmware does not report that tag
chip_cap stays zero, and the following devm_kmemdup() stores a heap
pointer into it instead, enabling whatever MT792x_CHIP_CAP_* bits that
pointer happens to have set.

Skip CLC sections whose index the driver does not know about, so that
they are ignored deliberately rather than by accident. With the
firmware above this is not a functional change: the idx=3 sections are
dropped either way. Use continue rather than break so that known
sections following an unknown one are still parsed. mt7925_load_clc()
has had an equivalent check since commit 9679ca7326e5 ("wifi: mt76:
mt7925: fix a potential array-index-out-of-bounds issue for clc").

Fixes: 23bdc5d8cadf ("wifi: mt76: mt7921: introduce Country Location Control support")
Cc: stable@vger.kernel.org
Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
---

ARRAY_SIZE(phy->clc) is used rather than a named constant on purpose.
mt7921.h still carries

  enum {
	MT7921_CLC_POWER,
	MT7921_CLC_CHAN,
	MT7921_CLC_MAX_NUM,
  };

whose MT7921_CLC_MAX_NUM is 2 and does not match the array, which is
sized by MT792x_CLC_MAX_NUM (3) in mt792x.h. That enum is otherwise
unused except for MT7921_CLC_POWER, which happens to have the same
value as MT792x_CLC_POWER. Removing it is a separate cleanup.

The two idx=3 sections add roughly 109 KB of payload that the driver
now discards explicitly. If mt7921 is supposed to consume them, that
needs a MediaTek patch adding a fourth MT792x_CLC_* entry; this one
only stops the out-of-bounds access.

Tested on an MT7922 (mt7921e) on v7.2-rc7 with linux-firmware 20260810:
the UBSAN report is gone and the regulatory domain is unchanged.

 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 25b9437250f7..1b147b492b9f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -467,6 +467,9 @@ static int mt7921_load_clc(struct mt792x_dev *dev, const char *fw_name)
 	for (offset = 0; offset < len; offset += le32_to_cpu(clc->len)) {
 		clc = (const struct mt7921_clc *)(clc_base + offset);
 
+		if (clc->idx >= ARRAY_SIZE(phy->clc))
+			continue;
+
 		/* do not init buf again if chip reset triggered */
 		if (phy->clc[clc->idx])
 			continue;
-- 
2.55.0


