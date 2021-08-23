Return-Path: <SRS0=it3p=NO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85F1FC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Aug 2021 07:11:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4086B61220
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Aug 2021 07:11:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4086B61220
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Cy0u5LOo+8bYCXk6g8oHwahaUlkNlbYf7YujMSpg1Hw=; b=kmRy3jc5Yi/S8x
	Eqb4nzgMDEnqO+Qa9eZUtPGX9vWpJbQZVBlwdkaeOvosa4OA6TZ/UZpvnAH/SCXc3Ro8jS2OW0Jrx
	9sMp4GmxIl3bXbLg7uVzKZThEAVdAvG+A71Qus6HXUQkdHTEomZbHbwfaQAH9foYliYtP4xr666rN
	Hc4pP+5Q5pUz731+V1elHZtSL1ELveAbyPuplq0NDjy7CHXnwuH8EwfuQ+YvmZNaL/3WUGd2/JVBT
	U/Ehyr2PBQipBhChlabCxi4ZJOd8u56TLNxQstG78UaSDFcIebjsQjbU8Q+oj/eLyRTVFWTx1C8Ma
	zqSLjB2e/G5V6QD/XrdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mI47C-00FgbW-MI; Mon, 23 Aug 2021 07:11:26 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mI45d-00FfUl-Ud; Mon, 23 Aug 2021 07:09:51 +0000
Received: by mail-pj1-x102c.google.com with SMTP id bo18so11414072pjb.0;
 Mon, 23 Aug 2021 00:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9Nh9cOJMrafoLUQICBnICXP4da42X3TBMHLOJtv6el0=;
 b=AxZoV944kTBLUgukjShmgDe0FvhulDu6B3x2ddsY7WplXZl2E8qswgBIl0W+0BOkUV
 c0BspHSChAKwTslLkKvro5VlK5+U1n1QMF9gW3KhfYX4QeiNw4g/zHmyqWEWBYzqcQtG
 1vLJ5x+8GRk8xZ8oOFtReEPhb64xk4ZmtPuQVx48lCNlJHFHp5RF5yCjOhlE9PjPXsx3
 3VKJ9GrXLF/ju2O2QHv0uQRg4KCd/6/uJGtJXVXqp6M1CGTB7GsFn7AHIP/jL0NZwRJZ
 w6qECMP6h94h7oji/Byl/Dp8y4ZQNdZf89TEfUf1A6mJ8eBNCNsadlbCg2sH9rCcP/DA
 /Stg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9Nh9cOJMrafoLUQICBnICXP4da42X3TBMHLOJtv6el0=;
 b=opXxTQQBw6GvQubFgevLju/YbyZsdM2BA0endjXOCkZTsmiV1flQiAvqXNyELyghpi
 8LjWBT0JvoCLQ3yDwt5l9WYgf/Oo3eInAD/UedgUx1Y6MGAevY722Xp7DfF8KlwyuOxk
 ZOXvWbWOVPANj99ZnSG9IqD/m5iA3Z503ty4N6objqeWcWO6CTC26JqSBo8Noi1qVyZ+
 h/pCPhRuUDlK8wuC2ROFkQC1JD6z0sqoayD1SWdMMg9Oa0p2zK1VorT8hPINE0iABspw
 aNk6vyVmVkuwnB9CyIorHoguZKRvg4xKe/+/oKfV26hke5DKrfsU79ACrkBFGKUoLLtx
 iqaw==
X-Gm-Message-State: AOAM530cqXYlYdQRFPMGBP72/jXoFIGpNxH9F9NUbA4j4r2va7JDJ6RN
 v2HHcjr/20waP+8+D8lCAZ4=
X-Google-Smtp-Source: ABdhPJxoTn09yTVb41VGVSMz5hnPE0hHo+zxZ05BNRUzTGPTrnjYb7hN/zvxg3fQU2bDmXHeLLkRmg==
X-Received: by 2002:a17:90b:370d:: with SMTP id
 mg13mr18518621pjb.117.1629702578826; 
 Mon, 23 Aug 2021 00:09:38 -0700 (PDT)
Received: from haswell-ubuntu20.lan ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id j6sm16215974pgh.17.2021.08.23.00.09.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 00:09:38 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: stable@vger.kernel.org
Cc: Vladimir Oltean <olteanv@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 netdev@vger.kernel.org (open list:MEDIATEK SWITCH DRIVER),
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
 linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support), 
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 5.4.y] net: dsa: mt7530: fix VLAN traffic leaks again
Date: Mon, 23 Aug 2021 15:09:27 +0800
Message-Id: <20210823070928.166082-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_000950_045572_7D3FC97D 
X-CRM114-Status: GOOD (  12.97  )
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

[ Upstream commit 7428022b50d0fbb4846dd0f00639ea09d36dff02 ]

When a port leaves a VLAN-aware bridge, the current code does not clear
other ports' matrix field bit. If the bridge is later set to VLAN-unaware
mode, traffic in the bridge may leak to that port.

Remove the VLAN filtering check in mt7530_port_bridge_leave.

Fixes: 4fe4e1f48ba1 ("net: dsa: mt7530: fix VLAN traffic leaks")
Fixes: 83163f7dca56 ("net: dsa: mediatek: add VLAN support for MT7530")
Signed-off-by: DENG Qingfang <dqfext@gmail.com>
Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
---
 drivers/net/dsa/mt7530.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index aec606058d98..fc45af12612f 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -840,11 +840,8 @@ mt7530_port_bridge_leave(struct dsa_switch *ds, int port,
 		/* Remove this port from the port matrix of the other ports
 		 * in the same bridge. If the port is disabled, port matrix
 		 * is kept and not being setup until the port becomes enabled.
-		 * And the other port's port matrix cannot be broken when the
-		 * other port is still a VLAN-aware port.
 		 */
-		if (dsa_is_user_port(ds, i) && i != port &&
-		   !dsa_port_is_vlan_filtering(&ds->ports[i])) {
+		if (dsa_is_user_port(ds, i) && i != port) {
 			if (dsa_to_port(ds, i)->bridge_dev != bridge)
 				continue;
 			if (priv->ports[i].enable)
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
