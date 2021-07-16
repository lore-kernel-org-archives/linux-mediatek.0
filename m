Return-Path: <SRS0=t3QX=MI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA741C07E95
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 15:22:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F8D3613D4
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 15:22:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F8D3613D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1hYAv2JLwRcr8u28RapqB8CU5KCIJwQ0u9r6SPo2t2E=; b=PowwP8VAHOVv8c
	+zXNQ7wcSIi4vj0EpSRe2SEF+qT9DyJEFm7piDqp5y2oMumSnyxU0W/M3s2KNvGZGhuusfwMKw9Qm
	tqzyMhqW5LvSbIf3sV8PVcGDtiiLpHB1LoRhMy9HZCK84vYxStm7enmHFVm7EMgKfczX7/8CEPlHk
	l51Top0ziAFfRNOtIOe6cia2A+FNxsuuOK3jYKEAIaLesy9JkxfCh0StXevjcuGftDB1li/VG/hBF
	XM5Z32+cISgBKCzRdHzsa2a1r72dmgIzHeSpdxXziBBg8+GnCCxad/Y6nozEEVYRsJmnEJF4LyzqA
	n00Ag8lU1QQQSZpxKmyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4Pfn-004hTO-1V; Fri, 16 Jul 2021 15:22:43 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4PfW-004hQb-EQ; Fri, 16 Jul 2021 15:22:28 +0000
Received: by mail-ed1-x52e.google.com with SMTP id k27so13438191edk.9;
 Fri, 16 Jul 2021 08:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N8bkFF5p3b8ynQNRAkxev5NHQlLvryoP4qlYhGqFBjc=;
 b=YYBLC0FKuFQE+AMrZG+egLBpSZ3nXAtpNpXYXUYdi8IpU528hZGQcV7zIn1nKWoh+3
 ECyIhmFYi64mRz+5ITsg1Kq1G4JwxpP/2qxmSwtzbSPTD4WY1ofx6g823TNKblAgbtKD
 Vm3Np+TXmneBi2ovKHlAs3v1iSr6ESk4Y2u3I2DtafYU1AXM+teTsF/yQ975MYxNs1bf
 5eHl72YV5JLHoNuCDW7JQqGN/ZESv3loLUE3Ftd5FgAkf47WQis+YzCBoXzeF6TBbva8
 dtnyDMq1L/yUKka8DECO/5KJ3qyjO/q7LnogwycDjmLkyMkQ0fwTmgdW7355cCVEu+PY
 TB4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N8bkFF5p3b8ynQNRAkxev5NHQlLvryoP4qlYhGqFBjc=;
 b=bdOEav+/L1gnxPLtDPqQgC4SRKK4L9vKwHZMDT07oO9PoVoiTfWbuQBX3km5UQdu1W
 s22NgRJlM0i42IUK5ZTeV3S6eGd+ib/PPkIY16UTYCwWotzxAJ3Ol/AlPJkfd0piabcN
 wHiRKpDQLSbbicGqhTeHzvMvUHNIV6vM/rN/oxnUfSnJkwpcYUIRc9TqYx4R5Ksz89L4
 i4ZLGRSJRhMeA4M3tF/doOR9OvBa26bRxAAUx5t2/tlWcsRSZN9kJ4CTP3v9DC2bci3S
 0WKeUivKpbJVTazu9Q1OccCah0nt7ytfU0SNwn4XlPxdskyEg92SuHRPnznZu5ObKU4H
 y+AA==
X-Gm-Message-State: AOAM531bHU+fyCXliyE1hFsSePhBS5P3jOwBnvEQ3rXh6zIOtsaa7sUa
 q2Z8c3GIrNYeUavV50NBzf4=
X-Google-Smtp-Source: ABdhPJxwoY9sX8skN/GsQiNXCI54N8UYo1l0znh40dUm/vmIQlVyUttGmaINiqSWefaAYlOdseJ/wA==
X-Received: by 2002:a05:6402:b8f:: with SMTP id
 cf15mr15279163edb.286.1626448943269; 
 Fri, 16 Jul 2021 08:22:23 -0700 (PDT)
Received: from BLUE.mydomain.example (83-87-52-217.cable.dynamic.v4.ziggo.nl.
 [83.87.52.217])
 by smtp.googlemail.com with ESMTPSA id i11sm3876648edu.97.2021.07.16.08.22.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 08:22:22 -0700 (PDT)
From: ericwouds@gmail.com
To: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Eric Woudstra <37153012+ericwoud@users.noreply.github.com>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mt7530 fix mt7530_fdb_write vid missing ivl bit
Date: Fri, 16 Jul 2021 17:22:11 +0200
Message-Id: <20210716152213.4213-1-ericwouds@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_082226_545001_56F4ED17 
X-CRM114-Status: GOOD (  14.92  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Eric Woudstra <37153012+ericwoud@users.noreply.github.com>

According to reference guides mt7530 (mt7620) and mt7531:

NOTE: When IVL is reset, MAC[47:0] and FID[2:0] will be used to 
read/write the address table. When IVL is set, MAC[47:0] and CVID[11:0] 
will be used to read/write the address table.

Since the function only fills in CVID and no FID, we need to set the
IVL bit. The existing code does not set it.

This is a fix for the issue I dropped here earlier:

http://lists.infradead.org/pipermail/linux-mediatek/2021-June/025697.html

With this patch, it is now possible to delete the 'self' fdb entry
manually. However, wifi roaming still has the same issue, the entry
does not get deleted automatically. Wifi roaming also needs a fix
somewhere else to function correctly in combination with vlan.

Signed-off-by: Eric Woudstra <37153012+ericwoud@users.noreply.github.com>
---
 drivers/net/dsa/mt7530.c | 1 +
 drivers/net/dsa/mt7530.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 93136f7e6..9e4df35f9 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -366,6 +366,7 @@ mt7530_fdb_write(struct mt7530_priv *priv, u16 vid,
 	int i;
 
 	reg[1] |= vid & CVID_MASK;
+	reg[1] |= ATA2_IVL;
 	reg[2] |= (aging & AGE_TIMER_MASK) << AGE_TIMER;
 	reg[2] |= (port_mask & PORT_MAP_MASK) << PORT_MAP;
 	/* STATIC_ENT indicate that entry is static wouldn't
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index 334d610a5..b19b389ff 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -79,6 +79,7 @@ enum mt753x_bpdu_port_fw {
 #define  STATIC_EMP			0
 #define  STATIC_ENT			3
 #define MT7530_ATA2			0x78
+#define  ATA2_IVL			BIT(15)
 
 /* Register for address table write data */
 #define MT7530_ATWD			0x7c
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
