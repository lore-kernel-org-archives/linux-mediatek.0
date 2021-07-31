Return-Path: <SRS0=E1wD=MX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 939F9C4338F
	for <linux-mediatek@archiver.kernel.org>; Sat, 31 Jul 2021 19:11:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5519E61042
	for <linux-mediatek@archiver.kernel.org>; Sat, 31 Jul 2021 19:11:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5519E61042
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HoSibeS4RTcyh4YYleUNfICaDTFfMba77Svcg7XXUAA=; b=DoUvwf8dvlvs/V
	lEO5hab+9Lxm6Q9+t4OGCME6NyqJTJH37A+2SRwb90wQ+ae5cIsUx1z4M6e6Ypbc9UQiIgRSydfbU
	ohG12b4AdxTNCYAHyPHZGUfG0PA3qqzG2a0JF/M+2wFz/EY/T6PwtccAheH8+fH+QAFg0Sl24ZPop
	IpPuhy/GJLtLkE5aGC912UviJG31IeIHihNF/nYF+0gu3QzvjJnEshRbtgZkXP5e4JFiJiXjmbo5Z
	qET669TeU9X9wo8DeeitpR9HcI62RZXepyAacVJQFoFeSRwWTd2GF2hjGvk0uxMB1/FoETP8WT3qb
	Sf1QYYLL/t2wZOM8DCUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9uOg-00C94z-Ne; Sat, 31 Jul 2021 19:11:46 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9uNy-00C8nW-5M; Sat, 31 Jul 2021 19:11:03 +0000
Received: by mail-io1-xd2a.google.com with SMTP id 185so15574796iou.10;
 Sat, 31 Jul 2021 12:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1M+wifrjKnGWtdnx+ta5aPYGhd+6fvMpaZ2GY9QQ4f0=;
 b=CIquJTrWLvU/Nw+FkwqducdAzBwvUmqqCzPDAoCJn8AWOfubID25PxVVOnUStKCXLb
 LC2etc9lRUupCqJ/wSH2EYfcfS0XslUnD5iT8UICOOnvgTOMMP4owYnkkzNSJlCBJ25q
 3ijdC9KbyRu2xqCLLHYxROTGNQ9dZBjrPUt/YvfvxhXsajFjjS3+VuJ8T6RDT9zL3+LJ
 POk2ldL2EyJ4Xdbg0ZsM37rZtrgkDMTWrzoqMNkCcJvp4Fh6LhsPddUKOcJAleps54/l
 2UvnCyHhKC0WMj71pbt+DXyaw6h7rzY6Gm5bMELSSBqN4dwJmvpOhPh8AANGdKsn5FAx
 lxKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1M+wifrjKnGWtdnx+ta5aPYGhd+6fvMpaZ2GY9QQ4f0=;
 b=a4SFXW+crjWWcCwT8prBW0jypAI062w/ztUnDrUpGhuAv/EsSQuPHhYHNcRxK5fttW
 lC71uDFBBkY9pWnOhCEIBJ7YAraxiiFk74twmaEsdlqd8G1a9a/acHc8fITTh2PluPeY
 clGRbOEbmYIU6l730x6LBel2J3aEacjFD/rn9XrVrR8ZfqQ8kymZw4Di+MA1E5Kjy4cE
 sVNfzFN81MDts2KjSQLSQSU6HxNG3+8wVpBejqAl/Wlsn+GOrrH0gAAmt/084JRNygIc
 9EwfsGM0hRY8nTTlDK8PryvLsESY0HcIt++h4BosHFr6qr/Y+250DezTDcf+b6yAWikC
 gBuw==
X-Gm-Message-State: AOAM532MUZLSILHVmxyzgegyy2HIiwVcnbxsvAKEWMkyuTCBZcX/QYj/
 RTxQ4b7W5jb7peZXCnm+KPk=
X-Google-Smtp-Source: ABdhPJzlnoVF/Ae1KwED8ArpzoVj+uD7GdpzSL8TVE1Sg92joMvx0qB8jVTPkObUL8m2CMEmEFtmxg==
X-Received: by 2002:a5d:89d6:: with SMTP id a22mr4548712iot.178.1627758661364; 
 Sat, 31 Jul 2021 12:11:01 -0700 (PDT)
Received: from haswell-ubuntu20.lan ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id g1sm2837991ilq.13.2021.07.31.12.10.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Jul 2021 12:11:00 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Eric Woudstra <ericwouds@gmail.com>,
 =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>,
 Frank Wunderlich <frank-w@public-files.de>
Subject: [RFC net-next v2 4/4] Revert "mt7530 mt7530_fdb_write only set ivl
 bit vid larger than 1"
Date: Sun,  1 Aug 2021 03:10:22 +0800
Message-Id: <20210731191023.1329446-5-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210731191023.1329446-1-dqfext@gmail.com>
References: <20210731191023.1329446-1-dqfext@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210731_121102_272091_F2714F2C 
X-CRM114-Status: GOOD (  10.66  )
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

This reverts commit 7e777021780e9c373fc0c04d40b8407ce8c3b5d5.

As independent VLAN learning is also used on VID 0 and 1, remove the
special case.

Signed-off-by: DENG Qingfang <dqfext@gmail.com>
---
 drivers/net/dsa/mt7530.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 38d6ce37d692..d72e04011cc5 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -366,8 +366,7 @@ mt7530_fdb_write(struct mt7530_priv *priv, u16 vid,
 	int i;
 
 	reg[1] |= vid & CVID_MASK;
-	if (vid > 1)
-		reg[1] |= ATA2_IVL;
+	reg[1] |= ATA2_IVL;
 	reg[2] |= (aging & AGE_TIMER_MASK) << AGE_TIMER;
 	reg[2] |= (port_mask & PORT_MAP_MASK) << PORT_MAP;
 	/* STATIC_ENT indicate that entry is static wouldn't
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
