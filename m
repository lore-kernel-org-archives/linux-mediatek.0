Return-Path: <SRS0=vV1m=M2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2CCCC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 13:02:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B35F760F38
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 13:02:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B35F760F38
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KCWfeElSz597AoTjTecUcJjBJKoanMs+hcJDVJ+rmJM=; b=RQs5xCFiOCm2wh
	Fgjqd1WQjsDnV6NSYMfbqGN/UUz6S79H38ngkYlIAfWaPRa54/e1U54h+VTwEXS9eabWOTRpj7gIr
	qPdMJ1fRwdhZYr2jvgPJEXX7XzPQVimkwfsvq1PLFbkV9P/kOlAT+2BAHKetS/AIhKGVI7lYiKUKk
	kEITjuYVNT/Radj3Maodrb1iXJiGzDfEu2S9HujpNyqnGAhKmnWImjyL6FI/hm6AnXqL37plCL0g/
	cTXExbzUd48ZkC0U9dkoPtu3LqgldFNDL/DczOkighICxWvg8dKY05vV1pTHqepnmmTsd29yvmgq2
	rTi3oOPIajRJQi2sJGWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAu49-002pWD-AQ; Tue, 03 Aug 2021 13:02:41 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAtj1-002hT7-A3; Tue, 03 Aug 2021 12:40:52 +0000
Received: by mail-pl1-x633.google.com with SMTP id d17so1581610plr.12;
 Tue, 03 Aug 2021 05:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IghreoH0EV+JzcXbJzyg8ag9UQhB8aBaKVtS7Rb1A+E=;
 b=tZPIOGHtyiSJSaC1x9erQ0KSW4TgYQvx7WTuNUjv4yE42XcuCl9Euzn+SPJT/Gv+/x
 LXgYMJUpYz9QFXL4lBXg/DT+gYh6E/NO4Tmbmo4VlANCI7aKmF4Gfic+j+vN5IBKSXCd
 N3D/7L2yCDmi0FSc3amZE+946RSZphpDT0ubzA8P+sd9IdEjwD1Os8/2iFfFJSNTKYu0
 yA8Pm1j5/2HZ19udQxVYMKlGdOzMiHZdlCVj2pZ2T8vsH78rKUPBrjTQ0nYD+b7GTfjU
 7tZPk0Wk7/ALw6wWOVX0FlahMUq5KI1HKKi8W1+uFpUBosO2ffwjMmq87TIiiDMKEgvK
 uwNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IghreoH0EV+JzcXbJzyg8ag9UQhB8aBaKVtS7Rb1A+E=;
 b=I5mejSjPQahVQYjr0AkFCO7EIcSPWVEUh+bhE7mc3NWDgZ/u4u8CZxNY+tO4uqGTkY
 EQoHn2enfzY4tzZg7ZWXHl+jm2d56+xBh7aBw3c7otEcNq5TQeEc4OheLnj8BrHTr83J
 kRnRCroeuM7oXRZgy2N7iQ7cXAqBuVko331AE5xhXAMeho9c4263Jw857BRmzeNxTlhD
 MGJmgEFS9aKmEARj6doN/0M6XxcksL/ouEzzAD83pws56QrA/GzORx6OLFxdz65w+axw
 wcgcqgljIfHdwTfmWbZl0URHliecvJ3MPXrqM22jH8bUTVDRzsxedqEHOQdFYaaY6xnU
 OuAw==
X-Gm-Message-State: AOAM531qzkWUgEzNbWZwwaS0lpKncA/0Jk36xCh8GhHWbiHp3Ni/KGui
 ORas9SFifN9qycY7UHLRDnk=
X-Google-Smtp-Source: ABdhPJzipk/rEXZOBgGQv1DnquIjRxhiFr8GQzLr+KoPcpuPmQflWsm+Bt6zcvyGvQr451BVfZ3oBQ==
X-Received: by 2002:a17:902:c202:b029:12c:9970:bdf9 with SMTP id
 2-20020a170902c202b029012c9970bdf9mr16524134pll.30.1627994449277; 
 Tue, 03 Aug 2021 05:40:49 -0700 (PDT)
Received: from haswell-ubuntu20.lan ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id g25sm15747499pfk.138.2021.08.03.05.40.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 05:40:48 -0700 (PDT)
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
 Frank Wunderlich <frank-w@public-files.de>,
 Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH net-next 3/4] net: dsa: mt7530: set STP state on filter ID 1
Date: Tue,  3 Aug 2021 20:40:21 +0800
Message-Id: <20210803124022.2912298-4-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803124022.2912298-1-dqfext@gmail.com>
References: <20210803124022.2912298-1-dqfext@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_054051_403403_7EB62ACD 
X-CRM114-Status: GOOD (  12.41  )
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

As filter ID 1 is the only one used for bridges, set STP state on it.

Signed-off-by: DENG Qingfang <dqfext@gmail.com>
---
RFC -> v1: only set FID 1's state

 drivers/net/dsa/mt7530.c | 3 ++-
 drivers/net/dsa/mt7530.h | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 12f449a54833..8d84d7ddad38 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -1147,7 +1147,8 @@ mt7530_stp_state_set(struct dsa_switch *ds, int port, u8 state)
 		break;
 	}
 
-	mt7530_rmw(priv, MT7530_SSP_P(port), FID_PST_MASK, stp_state);
+	mt7530_rmw(priv, MT7530_SSP_P(port), FID1_PST_MASK,
+		   FID1_PST(stp_state));
 }
 
 static int
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index a308886fdebc..53b7bb1f5368 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -181,8 +181,8 @@ enum mt7530_vlan_egress_attr {
 
 /* Register for port STP state control */
 #define MT7530_SSP_P(x)			(0x2000 + ((x) * 0x100))
-#define  FID_PST(x)			((x) & 0x3)
-#define  FID_PST_MASK			FID_PST(0x3)
+#define  FID1_PST(x)			(((x) & 0x3) << 2)
+#define  FID1_PST_MASK			FID1_PST(0x3)
 
 enum mt7530_stp_state {
 	MT7530_STP_DISABLED = 0,
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
