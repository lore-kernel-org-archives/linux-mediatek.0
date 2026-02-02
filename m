Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1194CD172B8
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Feb 2026 02:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n7l0qcnyrUiRMBos2/spllTnQlnbr3gDS72IGaq9hbw=; b=O1iCRMK5JnXsB9HV3Vk4Ebudew
	k6IB+BYAhBxKvpvWYPwLBhIpAS/9Vl9XeGnNBVx/unvGNZBfrcbKn6yTwu7SRElbMoeFzsrL7GQze
	VD2MdVLPi5Jw92Cj9UIwjNo+qZdS9K0loPT9IaYufsoBi1NlgznKEBKicZ5sjTBXmIomTmFUg+Gwg
	gjA/S/HuNOL3URrDtBki7GvNnw7udGqK6kRq/4n2Xr1WecAkcqU6KGYszWm/54cdAXRSkW6u3RiI0
	AlFl38ZpYuZJVH0HXW7oWD9DJKMt95SZAWmlaX8MX5L5aPYNnyroog7glzsDps6BOzzsg0M6wGtVt
	U/sbk9XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmjwe-00000004MIV-2DYl;
	Mon, 02 Feb 2026 02:45:44 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmjwc-00000004MIA-2ktL
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Feb 2026 02:45:43 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-81ed3e6b8e3so2036995b3a.2
        for <linux-mediatek@lists.infradead.org>; Sun, 01 Feb 2026 18:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tier4.jp; s=google; t=1770000341; x=1770605141; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n7l0qcnyrUiRMBos2/spllTnQlnbr3gDS72IGaq9hbw=;
        b=Fl490CZEgXdc8UxP9sjGAGxH0OacB3Ropw2BJRzfmrzWNWVvPoPgc3A8i1HBMJsyL1
         AWJEPYduO8WkICtneLhBWenHnRTzcuU370P1kZi9sgItPmHWICTF9K+M6PG7RqL8fZbg
         UJrKKJ+iZ1iktLOuozQqDjcue5Dhc59fySK2NZGgrPmY6vli3g7LuYZxVBXCGcVByAIf
         HXPSFEiG9npgwrUZSLs7mmrrVuMRE3T76/lBZVseebOn7hoC1ktry1PfmepFExA2xDD9
         ZeKjpHjxmT+jsE197JvdFwVcEbxjviKiNVOqKlMll+lILdk7UkJkhmjnGuQlO/xzluZQ
         mLpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770000341; x=1770605141;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n7l0qcnyrUiRMBos2/spllTnQlnbr3gDS72IGaq9hbw=;
        b=LzpUqDH6JzXXgHm24N925nrdVRDdVAUD/FHvcv+z8x6w9eJ5K1rEil3RdSWd2e0I+F
         pvS+yN03vNWNUTPT6st2Byp6HEDUZtKERGMrquL9FQRCfNhC1DyH+VK4zf/8XsQU9p3y
         riLzTDaYD6ZPTC2BqTOmt7WmPH2ow6KIPbZR2fW68t9vdSFCAegLByKMCzvVkkrhUQul
         YQi+3EWcUS6as5CIbAS2tnc8B923ZD4w3pVfW2aF53wjDzaEJGX5egz5fbEqbDoHZFRf
         6+YAnAA9TpmUbV//FIlpHGt2lqOI/m0GFYWNY3ap+HI4Tz/QZ1fqKYt4XQ1une8SDJ2q
         TghQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtHGzNQB7moP0eW4tf/I5h13Fl9r9pNr8TT+P3srIsGLJQvtpI0L+fNmWO4mvUdHGT/JB8AQ8wgnetSZdRDw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyS58oszbaQuF/zDYjqhZkLgJLDlLH4p6FLJdtNgY8eJYoVMJ0D
	59R3/k2BqIQrzbW/18JDaHeJl7NzjYOkfzS0VXn4aUkuHNoJVrmoxyhqI//9Ca3LCpc=
X-Gm-Gg: AZuq6aK2F8DQBPMncHiH2t4kzFMNdlsa/llvYWRqqZNiYey6DDrCwiKU6HIvSTBFxky
	qjplUIygsqWQFHhSGH7qTSGI/cdV+b2yniSB9re9SY3/YN6yCLS2RPn++5pgcM4oVto1np1gSsF
	w5U3QUSbT5YOwf2etazfkp811A7TPFPB6ItpVtjL318z+6dqFr2EqkxPb3C/7cGKc9VCnId+pQF
	9+wmZ/2BLLJGra7GSSjlRk0y8SI8FH1amMBuNgcYhJz6eo2XSIOImj+nbynSp9ltA+JzFIzq9W5
	mc12eVKzLtVu5qB7pEdsXugoBvkpLC3E8+r55L5nA+/l86dQwxpTugD+9fm/0vJABoEs/wU4v9A
	8xKggFrctZ00ul40QTaNo1enHHMAQuH5VScLabdkwt5TcD2HV3qeT/1QzfhW1wHzWeuizcR/MvI
	DOUMCraVkC4JWXIgo9MOeDRMYCSXFLkGvmrp35r1xFZbZQkVk=
X-Received: by 2002:a05:6a20:3d8b:b0:35e:5a46:2d68 with SMTP id adf61e73a8af0-392dffe0dddmr8347239637.9.1770000341265;
        Sun, 01 Feb 2026 18:45:41 -0800 (PST)
Received: from dpc2500057.. (fsb6a9315e.tkyc502.ap.nuro.jp. [182.169.49.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b413d16sm135081995ad.25.2026.02.01.18.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 18:45:41 -0800 (PST)
From: Keita Morisaki <keita.morisaki@tier4.jp>
To: Peter Wang <peter.wang@mediatek.com>,
	Chaotian Jing <chaotian.jing@mediatek.com>
Cc: Stanley Jhu <chu.stanley@gmail.com>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	linux-scsi@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Keita Morisaki <keita.morisaki@tier4.jp>
Subject: [PATCH] scsi: ufs: mediatek: Fix page faults in ufs_mtk_clk_scale trace event
Date: Mon,  2 Feb 2026 11:45:26 +0900
Message-Id: <20260202024526.122515-1-keita.morisaki@tier4.jp>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260201_184542_713002_E09CB4EB 
X-CRM114-Status: GOOD (  15.81  )
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

The ufs_mtk_clk_scale trace event currently stores the address of the
name string directly via __field(const char *, name). This pointer may
become invalid after the module is unloaded, causing page faults when
the trace buffer is subsequently accessed.

This can occur because the MediaTek UFS driver can be configured as a
loadable module (tristate in Kconfig), meaning the name string passed
to the trace event may reside in module memory that becomes invalid
after module unload.

Fix this by using __string() and __assign_str() to copy the string
contents into the ring buffer instead of storing the pointer. This
ensures the trace data remains valid regardless of module state.

This change increases the memory usage for each ftrace entry by a few
bytes (clock names are typically 7-15 characters like "ufs_sel" or
"ufs_sel_max_src") compared to storing an 8-byte pointer.

Note that this change does not affect anything unless all of the
following conditions are met:
- CONFIG_SCSI_UFS_MEDIATEK is enabled
- ftrace tracing is enabled
- The ufs_mtk_clk_scale event is enabled in ftrace

Signed-off-by: Keita Morisaki <keita.morisaki@tier4.jp>
---
 drivers/ufs/host/ufs-mediatek-trace.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek-trace.h b/drivers/ufs/host/ufs-mediatek-trace.h
index b5f2ec314..0df8ac843 100644
--- a/drivers/ufs/host/ufs-mediatek-trace.h
+++ b/drivers/ufs/host/ufs-mediatek-trace.h
@@ -33,19 +33,19 @@ TRACE_EVENT(ufs_mtk_clk_scale,
 	TP_ARGS(name, scale_up, clk_rate),
 
 	TP_STRUCT__entry(
-		__field(const char*, name)
+		__string(name, name)
 		__field(bool, scale_up)
 		__field(unsigned long, clk_rate)
 	),
 
 	TP_fast_assign(
-		__entry->name = name;
+		__assign_str(name);
 		__entry->scale_up = scale_up;
 		__entry->clk_rate = clk_rate;
 	),
 
 	TP_printk("ufs: clk (%s) scaled %s @ %lu",
-		  __entry->name,
+		  __get_str(name),
 		  __entry->scale_up ? "up" : "down",
 		  __entry->clk_rate)
 );

base-commit: 18f7fcd5e69a04df57b563360b88be72471d6b62
-- 
2.34.1


