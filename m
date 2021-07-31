Return-Path: <SRS0=E1wD=MX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD44FC4338F
	for <linux-mediatek@archiver.kernel.org>; Sat, 31 Jul 2021 19:11:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A299161040
	for <linux-mediatek@archiver.kernel.org>; Sat, 31 Jul 2021 19:11:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A299161040
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dpMAE1OxKniH4DqsM6MmpFEQlmvNIdB+xBLUzNApm1E=; b=PUrxYUxOVYRDrC
	/tJ6fMqhmDv71sEcooG+Ot4lg67pOQNBt4laMHHZ8hwsnM9XxLBuPC1H5w6UIshAvyTY41YR49POr
	/K31Wr+HoH0pQS7L7DnrPqS6SiSnlqSDJDzIEwzF17xFt7JOuX+kGqT7Gt+QRsVHqcJ6AvIRLuLAj
	gvdbydIBHXqZPCfUQhGd6Jbk6Q4eYnfeP6gj8hjCdl51YgLUn2nxGU27gA/caNPFeIaZVmRuXacar
	eJlcJMbmuDJeh1d5hTRfO5BRatrw+fr6JHO6yGyD+J/tXOUMubGomyZs4zagwdB6oVTeXrVPTxeRp
	kvCJ7r7V75V+TXJrrxkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9uOQ-00C8xM-7G; Sat, 31 Jul 2021 19:11:30 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9uNr-00C8mM-8J; Sat, 31 Jul 2021 19:10:56 +0000
Received: by mail-il1-x129.google.com with SMTP id q18so12782048ile.9;
 Sat, 31 Jul 2021 12:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=03PtB7i7Y8jswIK8wIaeVs+8jvWKvPEBQvVpB2jKQz4=;
 b=eTEpH2UyNVPu3VI2OqY8iY0ZxtYubDRoUitW6AkHIysbpPvLfaj2NCH5bn6v13YCIA
 G01uA6lEGN7Iva03On+AO4xvzD1dvHpV11S/d0atuRu9MWJzNKRaDsjtBKn3yR37ud10
 XrGSYHFu1gRonP2YL4Ofym474bCj6HbcII2q6nK6Plxt8nFAGXY5w54HTWx0h4KEXu38
 N3iUvT0zuHlx0jhaVffvMwPajE7DOx4jLOFxHmzkg6DkAW/mjgcMafvG32iWXEsHPoV1
 w7wYPs4a0QILaVhMeE10Qf7zg/zWUegb00VqSCmDBnR7xI0lAjRAspEKdBzWpfI16XYm
 7mPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=03PtB7i7Y8jswIK8wIaeVs+8jvWKvPEBQvVpB2jKQz4=;
 b=sMDBZvljTzHLeBbJwIaw0KuLH6nR8hnrdwtAWSk61RYf4v9T6CVHqzbw6Uauk15PWP
 eLmCI6Jcj++vPnUJxgw4p5zhICStPpzXmBA2y/hyEyZ1EqI3Crl8s82gzrhFX0lYOBzx
 NassrvlyXHgsdgmt5DvHzgOenUMzmUVqox6Q0HSCE9PcuVWSNBGhuB8rnZoboLUi3H7D
 YEnGWTe0LJhdtVkh9w23F+o4GZt+AgMr9vxWxXChCCEymBXL3aCxK9puv2BJMG65Ldlp
 NGO3lXjr6EJ2805C+0t6ehax5OeGwuI26/zNjE9+CSq+0x3Yi0VkPt7IAQgwAJbs00xN
 zscw==
X-Gm-Message-State: AOAM533/onH/EPG7m2GM4btahHuDFpH/u1QAztXU2PegQY1IX5l7JNvU
 jwxIFz5SbFnxNiPMmH2W79M=
X-Google-Smtp-Source: ABdhPJyREUPQ4aqHZeaToHQaro8v+j8fwNRUzkQyLj6Mu6CEAiwp5dP0SpxH2wGmNV91eOd9vez5Mw==
X-Received: by 2002:a05:6e02:1c0b:: with SMTP id
 l11mr2411293ilh.126.1627758654458; 
 Sat, 31 Jul 2021 12:10:54 -0700 (PDT)
Received: from haswell-ubuntu20.lan ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id g1sm2837991ilq.13.2021.07.31.12.10.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Jul 2021 12:10:54 -0700 (PDT)
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
Subject: [RFC net-next v2 3/4] net: dsa: mt7530: set STP state also on filter
 ID 1
Date: Sun,  1 Aug 2021 03:10:21 +0800
Message-Id: <20210731191023.1329446-4-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210731191023.1329446-1-dqfext@gmail.com>
References: <20210731191023.1329446-1-dqfext@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210731_121055_350139_635895AC 
X-CRM114-Status: GOOD (  12.45  )
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

As filter ID 1 is used, set STP state also on it.

Signed-off-by: DENG Qingfang <dqfext@gmail.com>
---
 drivers/net/dsa/mt7530.c | 3 ++-
 drivers/net/dsa/mt7530.h | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 3876e265f844..38d6ce37d692 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -1147,7 +1147,8 @@ mt7530_stp_state_set(struct dsa_switch *ds, int port, u8 state)
 		break;
 	}
 
-	mt7530_rmw(priv, MT7530_SSP_P(port), FID_PST_MASK, stp_state);
+	mt7530_rmw(priv, MT7530_SSP_P(port), FID_PST_MASK,
+		   FID_PST(stp_state));
 }
 
 static int
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index a308886fdebc..294ff1cbd9e0 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -181,7 +181,7 @@ enum mt7530_vlan_egress_attr {
 
 /* Register for port STP state control */
 #define MT7530_SSP_P(x)			(0x2000 + ((x) * 0x100))
-#define  FID_PST(x)			((x) & 0x3)
+#define  FID_PST(x)			(((x) & 0x3) * 0x5)
 #define  FID_PST_MASK			FID_PST(0x3)
 
 enum mt7530_stp_state {
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
