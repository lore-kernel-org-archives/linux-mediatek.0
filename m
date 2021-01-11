Return-Path: <SRS0=02OB=GO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5FD7C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 05:45:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DCB12251F
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 05:45:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DCB12251F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8zVdnnQWQ0X3zL2tA1/NnOJYuuNjHxnjl6/MRd7X4Vg=; b=IDBIO3Udkh99osbFXju8IpSBjc
	SwYAgD+a6svL/G3WvdUqz/C5v8SQon0306ddM73DFOKhUKx/t3lNITIOkmO+Y2PLB/9PKzGT0dgpF
	zXmHFO4XnGFetyydVZ5rXfwIiT6RUFUEwfhw2qHW27bDp2OpwhRfkqvRlkGhWcYX+8LXPWPAuD/Ib
	t5gNqkeQ//QGIE4WqgJ+qEq+o/5xdLGNaaoh5a/63HiYlckUSVuiKeZlD5ayuJ6W5/91WT+Fq3WZx
	SvOOQIKIX9JSOe1MEAhRfPKgJOE2jEy3z8GQ2yidw1O5Q3LJJUyCksl/OqkffHAQjYrIHJLgRNwJb
	yklsb0ZQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyq0l-0004Ij-6X; Mon, 11 Jan 2021 05:45:03 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyq0e-0004G1-VD; Mon, 11 Jan 2021 05:44:57 +0000
Received: by mail-pg1-x52a.google.com with SMTP id c132so11880760pga.3;
 Sun, 10 Jan 2021 21:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=88GcoNGL/AXgeCjNvngovwMr6/msxp3BLQE6/faGv1E=;
 b=h4+cG8LBG4mJ2vwsd0js8PfV+47sXFW4md16+AhwPXwgU9YZmmW2Lbaanew5uI+efR
 zxNOSQz+NPgRzUZN54kj7M4CTyLAeDMQ4sI8MlJaKA6U28f5X1Ttwhlvn6ke5ccL99bV
 IhZ0wc4vjAW+v0aiYBZscmF0Hg5up2X/8PWzw1QVEx2emEkzgZ0isVk5GQuCHEjDh+Au
 mTjoRy8bwfYWPmGnaPczlFMa5fPx7oQD8HJdtlJki8doIr1dyB0vwKO4zcaRR+nFpvnU
 kiJOLyZdXC4wL862hDu6srQ8LXH2o98c2u1m2wnEqj2kHNZNPJh4m8P6LZZtKEpgyoQL
 8EDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=88GcoNGL/AXgeCjNvngovwMr6/msxp3BLQE6/faGv1E=;
 b=jmu59sBa/ihH8oBSyllKkONjS4TAR7eWjHZP6NKrJR2/jvPYxS8UNwg6KEBbPCBrcM
 l8HPXxumav5v0LR7kyCAF7BtEYgIJkqJlo8azQ96+XDSaM2zayGvQE5kFKI8ol+PgThD
 L9yWJ+9zWsNQyt9wtD8KgPuP0zF7AIrSkC8Xpenpikr7umKAepcjYWD4jiH22dC4Irfn
 VWhRMQd9o9jRJLPq/X4xsCu/+13XQMeBFUctjSoR8gWnpHIHufS3ELFFF8nKwrwGhZbF
 2ns5mbx11AMTPk2kV9aP54yNrICIYoFAxMSJpq2MXSoI03ORqfm9q2qQKOaOZ5pJ7NUA
 E6Qg==
X-Gm-Message-State: AOAM530wztwUvp1AvTLyG5/1opbvaFIAdqWaLycY+vuRAznd1zKOzGHj
 RIifky7IGZ9JR+zrkvU9jjJdYUKcntX4U11t
X-Google-Smtp-Source: ABdhPJxglMNH6WCUJJua0ObPzfzCa/AOfasQge6NqUl2igBLSmJcdZvEEwFVOyUKepzuXmQCloQ5tA==
X-Received: by 2002:a63:1d59:: with SMTP id d25mr18119366pgm.259.1610343893413; 
 Sun, 10 Jan 2021 21:44:53 -0800 (PST)
Received: from container-ubuntu.lan ([218.89.163.70])
 by smtp.gmail.com with ESMTPSA id q16sm17548005pfg.139.2021.01.10.21.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jan 2021 21:44:52 -0800 (PST)
From: DENG Qingfang <dqfext@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next 0/2] dsa: add MT7530 GPIO support
Date: Mon, 11 Jan 2021 13:44:26 +0800
Message-Id: <20210111054428.3273-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_004457_051286_F90F1085 
X-CRM114-Status: UNSURE (   9.43  )
X-CRM114-Notice: Please train this message.
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
Cc: =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>,
 Frank Wunderlich <frank-w@public-files.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

MT7530's LED controller can be used as GPIO controller. Add support for
it.

DENG Qingfang (2):
  dt-bindings: net: dsa: add MT7530 GPIO controller binding
  drivers: net: dsa: mt7530: MT7530 optional GPIO support

 .../devicetree/bindings/net/dsa/mt7530.txt    |  6 ++
 drivers/net/dsa/mt7530.c                      | 96 +++++++++++++++++++
 drivers/net/dsa/mt7530.h                      | 20 ++++
 3 files changed, 122 insertions(+)

-- 
2.25.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
