Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ACF9E66891
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Dec 2025 21:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZV5l3aK94WjBMd234KR2t67rjid2aTdUenY4d4w/l6o=; b=siHSbXnDDO2gHpiLVwWMAYnI4i
	W67AVJEhPksCCJABxvCB2pyClqBubTxERdcF1NT0GBQozyP5UgCFGaRWJVRQYkpMf2NN1AtH6mtEe
	KV/XwLKLywD7j8oz8BhD/wby2pxBNxCzDW4XggaLqePbAbPkVb1Zn3BTOoQzdAa7qew5+4AZp3hcD
	nMUxwEsClcY4i0mPAKQKngAhoFtxHhTPLcLQ0wf05fiww6ASZOP4P5MAl0EJQzw0f8gg8/fZFCfoI
	2RBY49dRJkonM8rLLckpT3Z0ev3oN56TWaJFGL0TbOZC7PUftkPt/NW7Z/yprrw6el9g15wsDh9sP
	o14XMdoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWiI2-0000000B0zC-1DwW;
	Fri, 19 Dec 2025 21:45:34 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWiHx-0000000B0yG-4Bx7
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Dec 2025 21:45:32 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-430f5ecaa08so1075718f8f.3
        for <linux-mediatek@lists.infradead.org>; Fri, 19 Dec 2025 13:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766180727; x=1766785527; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZV5l3aK94WjBMd234KR2t67rjid2aTdUenY4d4w/l6o=;
        b=KBMxzYNlyvZbsX32nCLlHOFWHo8x18C3p0ilunV0n4FWrJU0gTh5c5USS1ZDSZzXU+
         +CxZ//w6x1+1mGfesoIlAo8a85EXIJbkpTWy4RTDicZtwPhndJbB+k1lyrU7MAGNs/mN
         kUdwy0i36J/dMe5O2BRQ0nOLXO/6Z/4pXvmUbdzDxz4ol2qYLYgYphvhcWKXecRRu2sH
         fXryuABWu1UloHNFI1DlBuj4QozX/yRgpWDky4wuU5jpRPd5Dm9l4AEqLlq0HRgfXSBA
         v4+k5GF076xb3LBH4QcfCt++6eGWiW8yRZuNXwkkjlMF1vxt8HGmV3J3uH3e/VGspdj6
         vXOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766180727; x=1766785527;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZV5l3aK94WjBMd234KR2t67rjid2aTdUenY4d4w/l6o=;
        b=FD8CMdc2O+q/RlmDLt3cpq4MHAgauOxdQ/QaJHI0axo7KxZCBfgmIAmtMN4KGLjKtI
         Ko5GKzwD8f5Fo7TMYXscmMDRlYKQoi8hLjSEzyy/g8Z8GcXSn519tj4/NWNEMggm2upg
         wSQFynBa/ji/Myp8skIcsMMsC+oWTtMHo033V6eGY4oMdwTYokrH6qF+8RsvBTs3zwx9
         U2c9HNtiE+7YvWViIf0FVm6VXS4j9ZeXCTMTidHKw2oCRQzyFEvK2Uvv2QBw5ikoh6RS
         wy6tvBU9SkKWedzEAgsZtB4kiwwwYAitTpjOjixkHrkWvksvvXfOYBXo8VmFmgrMJiBO
         Gtbw==
X-Forwarded-Encrypted: i=1; AJvYcCUosSQcTjJ6yPkXhJAgYLcCc18HXSz7PORay2gIJmDMYGo3SohHt1LmHMtuPan4/HV2ELBSvFW8p0MkPOE9Fw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyr9doCgbTZpvxCQ+viMEyg3izjRDo81eJwNNbsVennn9nrCxuL
	wVjFmMQ5ZR+n1/cxvbW/yYROZLourH1MUQUQwZHy5odV6iqV7Z8BLGpf
X-Gm-Gg: AY/fxX4pPy6id8KM2IA0wjZ6HeK7bDgRlmDyDsADJUQnIW/cKjVJehfxAICjivk6zEn
	0ab+vlPDjHznuM3GL3YYlJx4POymD9OV5dJ85SptjaNj2h621zEm3bccWbIpxskaAbXBu+SXUsp
	Chz2pICAiUfdQ1s0B1z2mG/KWIrPwnlZyGGmBDXtradhxy3SViSgBrlWHhAktzlZHhvglX7ctSh
	5hBjctvQwl+6LqAgZMASR2MbddxTMq+7OFGJQ7ArCN8MxY2/osC++LoQtKnSlMzpAY/lZb7lfew
	C/x2V224W9HqfQD9cwLHNuGcSHfSMfCwJebV7x/tFVHmdTIet3eo0B7U6cvGKiXkbMaqOzv6min
	NKQnBpggfkafAFvfCXh+K6MFEdwlBAESy9Isut09ZPzg879y5Teoc31Hp49fsF/GFhFPrOxi4qY
	5040mruGlvLDLrI1zr/zna
X-Google-Smtp-Source: AGHT+IH6/ztrcn+SlJfyVJT63am/rH1xZvx6X/K4m0kF1MT0B91G4kSCAcxAARG8TFZiP/ksh381nw==
X-Received: by 2002:a05:6000:2211:b0:42f:bbc6:edab with SMTP id ffacd0b85a97d-4324e4fb405mr5082384f8f.29.1766180727224;
        Fri, 19 Dec 2025 13:45:27 -0800 (PST)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324e9ba877sm7013078f8f.0.2025.12.19.13.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 13:45:26 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Peter Wang <peter.wang@mediatek.com>,
	Chaotian Jing <chaotian.jing@mediatek.com>,
	Stanley Jhu <chu.stanley@gmail.com>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-scsi@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] scsi: ufs: host: mediatek: make read-only array scale_us static const
Date: Fri, 19 Dec 2025 21:44:28 +0000
Message-ID: <20251219214428.492744-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_134530_035909_F98026BA 
X-CRM114-Status: GOOD (  11.23  )
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

Don't populate the read-only array scale_us on the stack at run time,
instead make it static const.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/ufs/host/ufs-mediatek.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index ecbbf52bf734..66b11cc0703b 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -1112,7 +1112,7 @@ static void ufs_mtk_setup_clk_gating(struct ufs_hba *hba)
 	unsigned long flags;
 	u32 ah_ms = 10;
 	u32 ah_scale, ah_timer;
-	u32 scale_us[] = {1, 10, 100, 1000, 10000, 100000};
+	static const u32 scale_us[] = {1, 10, 100, 1000, 10000, 100000};
 
 	if (ufshcd_is_clkgating_allowed(hba)) {
 		if (ufshcd_is_auto_hibern8_supported(hba) && hba->ahit) {
-- 
2.51.0


