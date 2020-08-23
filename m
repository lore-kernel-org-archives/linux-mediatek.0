Return-Path: <SRS0=ROsh=CB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FE02C433DF
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 Aug 2020 14:02:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C339206C0
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 Aug 2020 14:02:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aswwgzLV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FBm7IpmR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C339206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ObnzzH7JstaZdBWHf2T4AVns5KefyzoC76OWe7AT4Qk=; b=aswwgzLV3tyOQKZSprHY5yaUEf
	2GRiUkuVdN3QUYbxr3vZp5r8JCmE1SS1hujmS5uTtDF7Ct2YE4hBXIkQUG9GEhlrv2Ymq3AHBK3Eq
	UUae1+zpm+CrhvyNuWjz6GnCysPiTr47nNN7M8pDwj5hSE4R3eeEkKkqW4Vq9gsWCHlR73qnkmh38
	RKDs4B6qz+Cv7RtRL6UNZIeFKKIlcHc6jkDTwsdPFvlNthUhiTJn5DYAYLb4sX7vMOJqUXVCfk8Gv
	CZt5athPRMZwRR+A54BE1+R/IuRxRtiFHc/L0QwyNANatNtf/XaTIo4vXfXU0bKgsAB2+RFkYtltH
	vr++C+2g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k9qZC-0001oU-SX; Sun, 23 Aug 2020 14:01:50 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k9qZ8-0001mt-Tx; Sun, 23 Aug 2020 14:01:47 +0000
Received: by mail-pj1-x1043.google.com with SMTP id g6so937583pjl.0;
 Sun, 23 Aug 2020 07:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=TlsZGie0Pmq1ULANAaf92cPvcSYg7hONtV2IZVBlGx0=;
 b=FBm7IpmR8lFsFOm/8ZYSpn4lHcHTTlLQtfZ7gnrV+9KiCN7Z+4XW9HBRFhYCAlcrFo
 IegKHLWFZd1UkHFojFjnNltDYMlTWXU2lXJpBlQipRET6ZAxveZCthpajxQjss5Zf0Fd
 ynmVJHpxWPvnLkNLJhz0gqlBBDG39Sl6OB2u5yQfDJ4e/OQ+XN24CklX+9L9hl6VHcmD
 S4x8op5uNEZJd+mTCTWeZKCP9nr8b7ltoXA4wYNk2EgxM+kr1Ffa8mn7/rH1hcR+7rop
 K8jAzyqiq/obyOFReOMaKDFMA650dGvGDq6ePyVaPgO3tVecb0DM94WUru27QsRozWQH
 RJIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=TlsZGie0Pmq1ULANAaf92cPvcSYg7hONtV2IZVBlGx0=;
 b=StU7zB+7xSj6ywoM60U/13pcUQpwwX0+JwNq45tgXs34ZxH26ePN/l1FQl8Xr9MokV
 TDUIaisIWuXfB+OZ7TxIBd2EaGqfr3hLQIO6kSKIhWQa/ESHTZ2cTTZ1xAvE817oKRrk
 maEoCW196c9tHhVuhl9PMBHhmhySrzC7EO24K9bJ7wNTi7/vXzXyp8o5YtvrAkR66JbC
 LPrgUwoBy5oMucXok/tEFPXuISvmBYIl3sDl1iz1RAmyF/cLonE34/o+G8VR+RM1KsuN
 52Ti1Lmg1JOdJJOdly36tX2SidAL2izYcNPTYBuFfxGawX3Nh8SL2y9Tnf7Fwfj+b5Vl
 vFxA==
X-Gm-Message-State: AOAM531kXaskg7F5WgUIi//Ha6w/PB3/w3nFbsE3R2eHV8SkgnRdz2CB
 xNTjHB1cL/WFYve0UAd1Xi4B7kpi+ZeOmqD0QyE=
X-Google-Smtp-Source: ABdhPJwB7I7XTQmD24PNJDgOa3uoUFrwQGJ2tGiqYQj1CtzJOReQaeyjNpN2XqZHLin2FmSnxHgu7A==
X-Received: by 2002:a17:902:10f:: with SMTP id 15mr976200plb.121.1598191303470; 
 Sun, 23 Aug 2020 07:01:43 -0700 (PDT)
Received: from localhost.localdomain ([49.207.210.11])
 by smtp.gmail.com with ESMTPSA id t19sm8291639pfc.5.2020.08.23.07.01.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Aug 2020 07:01:42 -0700 (PDT)
From: Sumera Priyadarsini <sylphrenadin@gmail.com>
To: davem@davemloft.net
Subject: [PATCH] net: dsa: Add of_node_put() before break statement
Date: Sun, 23 Aug 2020 19:31:16 +0530
Message-Id: <20200823140116.6606-1-sylphrenadin@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200823_100146_998296_730743BB 
X-CRM114-Status: GOOD (  11.59  )
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
Cc: andrew@lunn.ch, f.fainelli@gmail.com,
 Sumera Priyadarsini <sylphrenadin@gmail.com>, netdev@vger.kernel.org,
 sean.wang@mediatek.com, linux-kernel@vger.kernel.org, Julia.Lawall@lip6.fr,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, kuba@kernel.org,
 vivien.didelot@gmail.com, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Every iteration of for_each_child_of_node() decrements
the reference count of the previous node, however when control
is transferred from the middle of the loop, as in the case of
a return or break or goto, there is no decrement thus ultimately
resulting in a memory leak.

Fix a potential memory leak in mt7530.c by inserting of_node_put()
before the break statement.

Issue found with Coccinelle.

Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
---
 drivers/net/dsa/mt7530.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 8dcb8a49ab67..af83e5034842 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -1334,6 +1334,7 @@ mt7530_setup(struct dsa_switch *ds)
 				if (id == 4)
 					priv->p5_intf_sel = P5_INTF_SEL_PHY_P4;
 			}
+			of_node_put(mac_np);
 			of_node_put(phy_node);
 			break;
 		}
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
