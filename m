Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39EADEE57CB
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Sep 2023 06:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EdlxO8xCKrQy/jRT0nkbbxVM9BFP+RkDY99mRvExc+k=; b=Mi5L+ICsm1qIo9AFSYwy9fDXTi
	aQ6aIEUD+zXLcu0ZqeVB3Pwbzm7wuNTL0sgOxw/Bx648hcecqhhSaP6dDlRD3Do1FS0SD/m5zGDdR
	Td5yoUIxI7C+GMqYtRCxoQTM2h5+t2u8d1KbDYdEtLSzhGIcmXQ+j3TzKaAxfOwrC1g0mpqIZpjlo
	Rco2ghVN2K6Ur6b66EwvIoI+IxIH6kArkkkjpl5GiH89TkYYjlRU+LNq0VO/ekVuZ0tsmtX3DXFMg
	FJMdjQ92odcisurLlD/c4565LaEeFn1EKQUL9uHE8TF1HyWKRs6npHg3gVXFOWTfVvFYy45YKwAPd
	HTUIugcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeUs5-00D9v9-32;
	Fri, 08 Sep 2023 06:21:37 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeUs2-00D9tN-33;
	Fri, 08 Sep 2023 06:21:36 +0000
Received: by mail-pl1-x644.google.com with SMTP id d9443c01a7336-1b89b0c73d7so3335225ad.1;
        Thu, 07 Sep 2023 23:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694154094; x=1694758894; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EdlxO8xCKrQy/jRT0nkbbxVM9BFP+RkDY99mRvExc+k=;
        b=iAGmcfwfNeffkfIRE1afYYoCtaue7hSBqndAxuV5SKKV8Eh+f/Qt5QGawjGTB6/YQT
         gWywPfyX0Vl4MBHqOqep7Ihnv20/zokFml9VZ3Wcrh8lTakwzzQCdVm3PmbWxqVSvemr
         W9Q1YCtfgWCsREVir/kGo9itBP6F7S1T6tzZWD4OJNLm1e1DOnGW79JSl7Eoi0GPe5Jn
         amrY/lI5Cik7MQn4NNTMMpIKvr4TrxJbaQjL0OF6zFjtlHZdyo/Pa5Q19J4R/j8Y3hyF
         8hUrfFjuvUo61cLbPaJQO4bOgQ6fcHcTh4ixxrFkMv9HqhZ7DxaOO4N+cw7iyIIBDdeS
         MWog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694154094; x=1694758894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EdlxO8xCKrQy/jRT0nkbbxVM9BFP+RkDY99mRvExc+k=;
        b=DrPPEAGsJBtkBrRgJVOU6wZE0jgb+57sgOEFL9UlYxLhbxvTE3Cpma5AClhSvqwLXA
         K0BKbUtpTqqEq0W52hnnA/LVCgmrhESPoq5PRLxejAlI6EWffDr9xfbe/mDCNiti5ae6
         Vvs7m5oibdZmKL/R9RNJ2ov8rONXzN2odFPt9FbQdTnSLEdPrBIfTfDH3DUwtr9trwNE
         FAp4zZ0mB9vtnbtJuDZQHmFHlffFybWLYUvJ4SI8LZjSspFHGOZ6UVxYgeRjaODNpkl2
         7nM0dw/ZFUkDANCHIKfd9Y/eHfqo+rQdRqN96AI/BGMmgcZpmR97LGhJhKxpFCTwOJoT
         vFqA==
X-Gm-Message-State: AOJu0Ywa59VxpY30W04OiF14igT6kLNHXhw3MZZ4gXqqLhG6VwR0Xfb/
	uHVc+8Vmimw4eqLIGVgKiou8HyV+VFPrVjOONCU=
X-Google-Smtp-Source: AGHT+IFtdbDXX/f6kthEXzxe3IPBBobkRzWDXfCM/Z8uOIZugSIsTKjKzDPEZO02Vum21D08dqAq4A==
X-Received: by 2002:a17:902:e751:b0:1c3:2af5:19f3 with SMTP id p17-20020a170902e75100b001c32af519f3mr1732109plf.5.1694154093626;
        Thu, 07 Sep 2023 23:21:33 -0700 (PDT)
Received: from hbh25y.mshome.net ([103.114.158.1])
        by smtp.gmail.com with ESMTPSA id l7-20020a170902f68700b001b8c6890623sm768620plg.7.2023.09.07.23.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 23:21:32 -0700 (PDT)
From: Hangyu Hua <hbh25y@gmail.com>
To: justin.chen@broadcom.com,
	florian.fainelli@broadcom.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mw@semihalf.com,
	linux@armlinux.org.uk,
	nbd@nbd.name,
	john@phrozen.org,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	lorenzo@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	maxime.chevallier@bootlin.com,
	nelson.chang@mediatek.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Hangyu Hua <hbh25y@gmail.com>
Subject: [PATCH v2 2/3] net: ethernet: mvpp2_main: fix possible OOB write in mvpp2_ethtool_get_rxnfc()
Date: Fri,  8 Sep 2023 14:19:49 +0800
Message-Id: <20230908061950.20287-3-hbh25y@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230908061950.20287-1-hbh25y@gmail.com>
References: <20230908061950.20287-1-hbh25y@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_232134_979582_B97EDC84 
X-CRM114-Status: GOOD (  11.32  )
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

rules is allocated in ethtool_get_rxnfc and the size is determined by
rule_cnt from user space. So rule_cnt needs to be check before using
rules to avoid OOB writing or NULL pointer dereference.

Fixes: 90b509b39ac9 ("net: mvpp2: cls: Add Classification offload support")
Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
---
 drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
index eb74ccddb440..21c3f9b015c8 100644
--- a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
+++ b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
@@ -5586,6 +5586,11 @@ static int mvpp2_ethtool_get_rxnfc(struct net_device *dev,
 		break;
 	case ETHTOOL_GRXCLSRLALL:
 		for (i = 0; i < MVPP2_N_RFS_ENTRIES_PER_FLOW; i++) {
+			if (loc == info->rule_cnt) {
+				ret = -EMSGSIZE;
+				break;
+			}
+
 			if (port->rfs_rules[i])
 				rules[loc++] = i;
 		}
-- 
2.34.1


