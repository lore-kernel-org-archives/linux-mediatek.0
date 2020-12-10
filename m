Return-Path: <SRS0=Sq/6=FO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B901C4361B
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 17:03:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB27B207A2
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 17:03:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB27B207A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ql2syH5MVCNKp+T9kpJzmTr+rFvXy5iw7BjJ23erAWU=; b=amAZeoFlCa3GlLZBxzYN7salPa
	1wyKbw8yfujPq/cr/UDAdeUZPvlHGQ3Cf0wQLt8HDIl+C1vIAE2lWyAhmZwFk7VdBoD5ffCvN33hU
	N747+kF2aE1i1rVLmeSR2EYbeJ0eHHYxJzzByhb+JTi0jzvKqXOJnsGCJcLNg73RgW9jItM2wrb1L
	5tOLfokq7sergbuyA0L7UOEZ0A9ntELj0HXJtdSe5tnfLm/SB/rRG1QRUPJtBY21+uQBI8XIi6xNT
	LbLW6rf9xBERwPrpDkr79q7tl5utp6DyXoNe8Q1qoCG6NT456Hs8Hxoz0P25oHLw+Bpos/Go2hyNU
	N1ry/2ZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knPLq-0005Ff-Dd; Thu, 10 Dec 2020 17:03:34 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knPLo-0005Ew-NL
 for linux-mediatek@lists.infradead.org; Thu, 10 Dec 2020 17:03:33 +0000
Received: by mail-pf1-x444.google.com with SMTP id i3so4679903pfd.6
 for <linux-mediatek@lists.infradead.org>; Thu, 10 Dec 2020 09:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eRcirKkczqUwPjfzJ1m1K31YYmn9lbP0Ojco8kH6qww=;
 b=fEUkmcpMf+8Vk4ezAJBrMWMvdJAxJgERulmR6uMHHh9CJKjkhoIk9w4eH9cL1AXk79
 7Eb0EkNThEnn2fzZYxiahVyH59Z0LlGhy0iUFCZ4qgSopEf5TYLJ94MzHLgaFkHKLt5F
 hLd+I5mawe4HTX1q/7J9RQSRFW/1Eb0Mp5I04OI2pXsIKhHTbYYDTSANznv5XUThXOo7
 gUpOBX2FHvCZyG18eKWbdXRa96lm5sHKLjFKbIRJEAaEPcofYHdTdVWpdT0i6m+kDUJ5
 cTTnaFW0aAbrKSxXUfymEvVt73mTKIL2rYTW5PVPjhe26nNyplTrj09EXTQC+YdZ14lh
 AkUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eRcirKkczqUwPjfzJ1m1K31YYmn9lbP0Ojco8kH6qww=;
 b=V4UFqMpor93RlqJnefpCUZCbsolmq8bADOnPXMJ/fT5Qia0mbN/I/FTfDyFhuv4EOW
 XA8xsgYfn5+hFoUptK24Uz2b6Z05x5T3CCuhDy5SwzPDFYXg2SAAqqJul3iksykJos6m
 RvcsBg5ZtpDFZ6ofcVp1XutKmmLsYw6hd5wZxGFmJg83fPqy97lC6KRj1+3eBUVYo82o
 IZ1IAXJ66QczhQMHgwZgMw9EyuFHZs1z+mxG86+CFN+81jOLmdCKAHkX2zNG+w96JQrZ
 a1ZsJDb38n8VQIHYd2c7nLZTZA/C/vSNLaBWr865VHD0NyyH3OsWC/5FRYYpzmTAfEsR
 LMDA==
X-Gm-Message-State: AOAM5332S6rbHQqMyFwhrtQG7G7cqRkUmiP5XpNBjeXeIA/99oJvXQlE
 G0BASgivI98MQO5W4fDyucw=
X-Google-Smtp-Source: ABdhPJyEWgOjT095zKQ46nRfysxXucdy1M7MntGxBJ3lkXo3bYoyFlRe2bxAORpp4HAYHVJeLIEKCA==
X-Received: by 2002:a17:90a:8b8a:: with SMTP id
 z10mr8672792pjn.67.1607619809005; 
 Thu, 10 Dec 2020 09:03:29 -0800 (PST)
Received: from container-ubuntu.lan ([171.211.29.210])
 by smtp.gmail.com with ESMTPSA id u12sm6495318pfn.88.2020.12.10.09.03.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 09:03:28 -0800 (PST)
From: DENG Qingfang <dqfext@gmail.com>
To: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>
Subject: [PATCH net-next] net: dsa: mt7530: enable MTU normalization
Date: Fri, 11 Dec 2020 01:03:22 +0800
Message-Id: <20201210170322.3433-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_120332_773622_B379F744 
X-CRM114-Status: UNSURE (   9.69  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

MT7530 has a global RX length register, so we are actually changing its
MRU.
Enable MTU normalization for this reason.

Signed-off-by: DENG Qingfang <dqfext@gmail.com>
---
 drivers/net/dsa/mt7530.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 99bf8fed6536..a67cac15a724 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -1657,6 +1657,7 @@ mt7530_setup(struct dsa_switch *ds)
 	 */
 	dn = dsa_to_port(ds, MT7530_CPU_PORT)->master->dev.of_node->parent;
 	ds->configure_vlan_while_not_filtering = true;
+	ds->mtu_enforcement_ingress = true;
 
 	if (priv->id == ID_MT7530) {
 		regulator_set_voltage(priv->core_pwr, 1000000, 1000000);
@@ -1895,6 +1896,7 @@ mt7531_setup(struct dsa_switch *ds)
 	}
 
 	ds->configure_vlan_while_not_filtering = true;
+	ds->mtu_enforcement_ingress = true;
 
 	/* Flush the FDB table */
 	ret = mt7530_fdb_cmd(priv, MT7530_FDB_FLUSH, NULL);
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
