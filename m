Return-Path: <SRS0=YIXp=5T=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82E90C2D0E8
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Apr 2020 11:30:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55F9D20CC7
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Apr 2020 11:30:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P5joeXuD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iegDoB1I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55F9D20CC7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Jj0AzObAdmRAvegyaj5KK2V1abIFyzgxNqiBKC/A6KU=; b=P5joeXuDy5ybn9
	HDXa/ooieFuwvSqwv7XyjPYD5FaDMtdhlIR34AZCn53/PsCYa1+1NPRQjRXeYrstv8lFkjO5SX8nL
	S+OwriyjdVweQahopJJCn7rsQ86Tg3WVmSPwW0JeIjvRZtGlYqzkg8sQCU1DWIPzvilrzZIxiNIaU
	EP7nkS3EojO6UH4OJ55OpRzt0AIKTNvNTcTLRCuRvxddAVF/IBsaX/2+9qsbdNR+xk7XbGHKIDbxx
	QKfn2JXkW31d1XvfDtZd+fUDYDHMYaYLBo2CloAF7UAQuvxidU9BRoiAo9CTZE/JE8HAHj171QNgQ
	GWrmNVd9zkuqXfVRmqhA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jKKWI-00069k-Ef; Fri, 03 Apr 2020 11:29:54 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jKKWB-00060G-16; Fri, 03 Apr 2020 11:29:48 +0000
Received: by mail-pl1-x642.google.com with SMTP id t4so2577890plq.12;
 Fri, 03 Apr 2020 04:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8rXpdWw7x9PpBvoBR/qm/XcVJsNWHJ1tSvQ9UIVcPLA=;
 b=iegDoB1IxCA4quOPEOuEst/h/o+3lRJuFDKhH/u9bys+FKqKdgPy8zwo7dxJoU2DwR
 OqDJQKEkNLhlMWWPZ065eDbOe6Eo4ZD2JqnLMoX4sksEkxM3ZDYy5kzvKC2zOoRSXSix
 t4aCJWtpQqSvrC2solgN22MI9dJUgkfeMjY9mCzCjV3+JrCclicKu8HBvSumuae23O0f
 YKuek9MktR7z3Pa6J8hUkwLCmerbyvtBYv3ux2yPUeMxkyXQt8qVyoEDBorLtSBfEd5K
 OyxNXrHVYivJX0Up0fRhONeNVQ+BFkAj2kkYUT2zWAdglRTaY2wwTkrVVQKGMJYZypuJ
 v5YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8rXpdWw7x9PpBvoBR/qm/XcVJsNWHJ1tSvQ9UIVcPLA=;
 b=P4O/phCyGE1efGT64CFKHH4YjGsoUGXPS9xcdLIJAetCWzHM7t1TBQtdXs0h4wZwlk
 0ZlDn8xHSJSWUTzgyUn3jxQRzQfTy+bmlIG8bhELPX6pb89KCuPrIuf4GjtMn/yID1AJ
 Sg5KiYNRox9/ND5YnXLJcnk6FvItl0TpSGsmrksoTheIop6Svgh3ovATSOpbrhQ+/yq2
 yMJiK2fDcNZ2bK9kzFu5XuB0Ww80bYqEdJw/c6Vwe8o55n4sIAKyjvXcdBCHY6YWkuV/
 iOUr7D5eko9eDguyKAuMEWPZpDAD4GjepbMJnrl85MSucsVkIlAZ2xcQYgq07pMw8BIu
 jU7g==
X-Gm-Message-State: AGi0PubDM4fJatKyGGS2Q+JANCSHtXvuUv003C0ReFleZ1fvbVU1HeIw
 gVkJHRck8W5IHi4lsMxXgQwLOn/ha9Q=
X-Google-Smtp-Source: APiQypJ73aRw0jbyNSgssLXyjPahMN2KTO/im/OozAk2AXrhtWeGe0HEMNdi7dRewEFL4MTJbkL6Mg==
X-Received: by 2002:a17:90a:37ea:: with SMTP id
 v97mr9591002pjb.26.1585913384901; 
 Fri, 03 Apr 2020 04:29:44 -0700 (PDT)
Received: from guoguo-omen.lan ([240e:379:95c:7214:abe6:11ff:840d:b9a7])
 by smtp.gmail.com with ESMTPSA id g18sm5034114pgh.42.2020.04.03.04.29.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 04:29:44 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
To: netdev@vger.kernel.org
Subject: [PATCH] net: dsa: mt7530: fix null pointer dereferencing in port5
 setup
Date: Fri,  3 Apr 2020 19:28:24 +0800
Message-Id: <20200403112830.505720-1-gch981213@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200403_042947_076556_0BDD7D9F 
X-CRM114-Status: GOOD (  10.48  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>,
 Russell King <rmk+kernel@armlinux.org.uk>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Chuanhong Guo <gch981213@gmail.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The 2nd gmac of mediatek soc ethernet may not be connected to a PHY
and a phy-handle isn't always available.
Unfortunately, mt7530 dsa driver assumes that the 2nd gmac is always
connected to switch port 5 and setup mt7530 according to phy address
of 2nd gmac node, causing null pointer dereferencing when phy-handle
isn't defined in dts.
This commit fix this setup code by checking return value of
of_parse_phandle before using it.

Fixes: 38f790a80560 ("net: dsa: mt7530: Add support for port 5")
Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
Cc: stable@vger.kernel.org
---

mt7530 is available as a standalone chip and we should not make it
tightly coupled with a specific type of ethernet dt binding in the
first place.
A proper fix is to replace this port detection logic with a dt
property under mt7530 node, but that's too much for linux-stable.

 drivers/net/dsa/mt7530.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 6e91fe2f4b9a..1d53a4ebcd5a 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -1414,6 +1414,9 @@ mt7530_setup(struct dsa_switch *ds)
 				continue;
 
 			phy_node = of_parse_phandle(mac_np, "phy-handle", 0);
+			if (!phy_node)
+				continue;
+
 			if (phy_node->parent == priv->dev->of_node->parent) {
 				ret = of_get_phy_mode(mac_np, &interface);
 				if (ret && ret != -ENODEV)
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
