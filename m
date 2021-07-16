Return-Path: <SRS0=t3QX=MI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A1C3C07E95
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 15:37:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D7ED60238
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 15:37:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D7ED60238
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=M33zrLJH4qaXwoNUH43ihFUpX9cW6xSZvjG/lIuZ4LM=; b=tYnRVBQr5Ye95v
	rshwIGCsu3ZcQ1Fl0jOPOaKblVg7Paj4aO9JTyw5vWjqZuTnXQwKyX7n8GTaO1m3vxGosKGwDqpLm
	Pyx+hNBcmva22s5p66o0giiK5+/FNDl8xjytT17RQZIaVBzFfZ8regsK8lZ/oYxqlpZHyNw+v3lV3
	OFKuBBrtn+XyNTjNoeD5lKUmB/oeQ5hlUaYlcdLx7HKLU0uGAhbcsVcEsNUnoKprTM3+IuNTWPjHR
	dy3Z3SCsO2g/W3wAFCGfzKQTgzr6Ci4tzx1/hHkaFvKnMmDa/4CcMqJXHqAgB0qoTphKV7tpM4L2G
	VJcJugIxDr0cHRvhjJ5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4Ptv-004kI3-Av; Fri, 16 Jul 2021 15:37:19 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4Pth-004kEB-K5; Fri, 16 Jul 2021 15:37:07 +0000
Received: by mail-ej1-x630.google.com with SMTP id hd33so15741498ejc.9;
 Fri, 16 Jul 2021 08:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ki2zBfnx3wTm6ja5X0xz1vQES5mUBp96RRpteIatjzg=;
 b=vQQq7D2u8FY3LLbHq3YwlnkcjjL1Lk/MMZ41mUIW99c/wETgAeygsAaEw7ifE69C4m
 yTbde2kxkr/SXaS7HBqt1heZ892uTqcWzU/l6TINtLIdY7A/+15O2iiDPHHyBt1bcg8M
 2cE2y32Ay9DaBhbizhOL51qqSIxJLpLdKnRTzUxXknA2yHUWC8drceG33lZuapMyjlfL
 cWUmH0VVU/WBPLgM3jb7APdaH/LRZOattgkyMLM08SCNUQDAGC0z15kBJZ+mMsYACJuw
 DlKMptd0IHu5iEa2a4hOsEj86OPXodlMOLLwOm/m+YvKeLgjrWCK3SsUjJzRFBIPQRVr
 MCMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ki2zBfnx3wTm6ja5X0xz1vQES5mUBp96RRpteIatjzg=;
 b=OP2vEl0pBsnawDjhSd5svMYzvJz6wl2wyuPE45Qv4QPqcuOE+TU+Gc3SffPVUm4You
 XODJoncGiBwre0vJxdvANJCVM1jId/TvvvfKQ+Lhmz8HMq0y8AXOYrTweRZlnGdPyAS8
 /QriQjL11IC5ISnJG8jqycdAF5kiwWGzNzRMk+VzGAjGSx2OuT0pvTZt6dvFfBAoTT3K
 WlOpoQX8IxB4v5XYsi/RpM9i0r8Z3U//9zdqjqflDp2R6/zDNFsBxjtl4/j/11/S0ReB
 sos7zQ0SlCh/JqjzzoBKs1ZFOzT6ISl6qEVW4iFP2WzNFH98+PF2EVEkZVrSlFPqRoxs
 8rrA==
X-Gm-Message-State: AOAM531Xw0eRUl3U+fauIDpQ+4eAsfLVhdMfdXJ3UXZJ9zQ58UHR5wDh
 wJTa/Gm4Bvfm/CujxDX+ICw=
X-Google-Smtp-Source: ABdhPJzrSkE/YKYvdOFRzAd/CUykoOGwPhF2xo9Ms8bUpMhwmjUaf/lpnzZTc9/LikUI2+IrBZv4Vw==
X-Received: by 2002:a17:906:fb12:: with SMTP id
 lz18mr12657259ejb.324.1626449823335; 
 Fri, 16 Jul 2021 08:37:03 -0700 (PDT)
Received: from BLUE.mydomain.example (83-87-52-217.cable.dynamic.v4.ziggo.nl.
 [83.87.52.217])
 by smtp.googlemail.com with ESMTPSA id n14sm3913973edo.23.2021.07.16.08.37.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 08:37:02 -0700 (PDT)
From: ericwouds@gmail.com
To: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Eric Woudstra <ericwouds@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] mt7530 fix mt7530_fdb_write vid missing ivl bit
Date: Fri, 16 Jul 2021 17:36:39 +0200
Message-Id: <20210716153641.4678-1-ericwouds@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_083705_703300_7865394D 
X-CRM114-Status: GOOD (  14.83  )
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

From: Eric Woudstra <ericwouds@gmail.com>

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

Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
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
