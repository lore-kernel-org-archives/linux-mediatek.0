Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A89C5AD4E
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Aug 2026 20:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SDVkGCf+wZIAIn3ijo+C35M8x1Ew0hMLzqVjwMb8SL4=; b=eqxsI+WzAgHYZVxMCAIciRR5vG
	7bgPuT2JTHgCbJdzqKLRsV2w+B2yIBKRYzhdd6tx+zNuOv0QeJSD3MbYUOeInlxZQxK6DbLzTWkH2
	kOY9YfnCbbeuVtwACxZhwIKbp2vGPNcVS/xt1LtN5JwZuZu5G7jDGOiyIjXYPRPke0r+tcjBoZ/vj
	3FH6n2yrReVKth7yLdOqpg61xj+mtqTP8bIRn7l4jeNmtwREINLgW86kzZtzlstFOr/81xZTo9L1y
	qs3kwCzCBQNuswX3nNrGKRidGNdGnboilbOR1B6RkRdAgKRVQ175w629TecwxtE7scXuBzZvvULKU
	7LW3+dtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtABI-0000000AfzH-2Sv3;
	Sun, 09 Aug 2026 20:31:40 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtABG-0000000Afuu-1H9b
	for linux-mediatek@lists.infradead.org;
	Sun, 09 Aug 2026 20:31:39 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso13924075e9.1
        for <linux-mediatek@lists.infradead.org>; Sun, 09 Aug 2026 13:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786307497; x=1786912297; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SDVkGCf+wZIAIn3ijo+C35M8x1Ew0hMLzqVjwMb8SL4=;
        b=O11IT3IL0NSJsU0A14AC5eY68ysdtYD5FugDE5LrvdWsT6GDfrIAPxVSk2F+yrPltb
         cI6iKreerc9bOl4DQTcIId8A0pgDzZew/TRINblrF63qchqhtX8vlAHCN0FBJDjNxqAw
         IJqUhz6WhcgVTgQb1VWjUQal3G0PisiMmLBns4sqDXC9tIR6NSZyLUxH4Mrk/b6bqemW
         AOjs1ofTyWPeGrhMa9tYJzD++Hy2PMaW3jjW4GToHQhIuXWEqxHws3ndtEjcnQ3iTGx4
         sHimwGNj8PUetjdroykvzBeumkZJ7zm+2sOI0RTQDrzWED5fpdb64l7GJr8/83SlHSTb
         NUKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786307497; x=1786912297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SDVkGCf+wZIAIn3ijo+C35M8x1Ew0hMLzqVjwMb8SL4=;
        b=nv/qV/9yx0mxu0WR8i9Rxomh2uCJkvYUqgmtZnMbeiI/+E92NNzY5bQu8uwOtF4RFB
         4ODWoeQZrWnc/D1AP3tO+T5kHg2VotysG+mYbSTDmB2c5cwfAL+KvzKMkAWIP3SRgOwQ
         7o0w9wopmgWO7sTFWvSmV7io6buPrkzeEzhKKS0MgvFS1xh14cJN5fuTsuEjPi4mI+dP
         aIMk0Md0WiwV1cehrFfvA3y7tPOdqDDPI6NZ0ErrJge0hIuEw5uJhOPEe+gvC/PCVD2m
         mWSMntfqf+Cm9ilfHUIPuXZqmbQg8K9OQpd8K3HHMONOALB7HSS0+vw6SYT3YITkIsGN
         zgTA==
X-Forwarded-Encrypted: i=1; AHgh+RrnKhFN9oVud5U4Lp+RwfYks4bEThakSuSv08Wn7bgZZTIWx/UzpleXtdiZvnWE2pUfbgvFd2sbSoITNt/XgQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxxd7e8u5HD7pXjO/Xw1ymC6CSWTXCffoVt/kYoqyPs7raptkPI
	3ovoksv3l1u88JVRrRQK/dcOC7kDwFI9aRUulHLCsncbxFqZIDm9JlQF
X-Gm-Gg: AR+sD13c53GmCGEj0KkTS10EtX3Gzd9dMXXeGJQfAGEgyvxjNtlw9m33I50vcS3GujP
	iB9yDTaHQtmEVnfRB1jXDc95JyI89FZONggZcTgbQZkwicDyJfCsq/4NlOw+/jAD8vWelRwKprC
	aiXLqBQL5uBE9Byxn/SYUGcnLEmRHswHLnCdLtWleUtnuuPFz+NYo5aw/0v1NldgdZpmkOStLjG
	IbpsB+o/lhL/gLZD1xojAsca6psUdiUcRfowFP+BVa9c8vp5ZUK59FWQzNnqTfKO4L5iVUt6wLk
	0bHHdrbiXqGi2nxRIUKz+7H/NmR/M0R20dGjdQTjS5Y/SZBeaYRI4nbVEL20lKGGkPX7lW5Mcxo
	aVVFJt2K8jN4HsCaE9zeycCFK1fiRZ5xRZPkZiiLaYy67DN8HxcVaQoIC6AuV9PhKuqBZgf/JFT
	2zQMqhcc+FKpt1Yq9rUmOjJP9qOYrFpgbnVmj0VqGn5mwdmmqZxK8Brw/zzRg2SWsd0zCB6iXfA
	+CMgUz/NTkZE/OmdnC+PNOrpQ4IOiApzSsdiVxhPP3KQIL5
X-Received: by 2002:a05:600c:198f:b0:492:4e09:9fc1 with SMTP id 5b1f17b1804b1-4994e7cc5a4mr520537665e9.15.1786307496663;
        Sun, 09 Aug 2026 13:31:36 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4995e9ea92csm229357065e9.4.2026.08.09.13.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 13:31:36 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v12 04/12] net: phylink: save phylink instance fwnode on phylink_create
Date: Sun,  9 Aug 2026 22:31:01 +0200
Message-ID: <20260809203116.640271-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260809203116.640271-1-ansuelsmth@gmail.com>
References: <20260809203116.640271-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_133138_374881_302EAEA3 
X-CRM114-Status: GOOD (  13.99  )
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

The firmware node associated with the phylink instance might differ from
the device firmware node passed in phylink_config as such device can
reference the parent switch or other platform peripherals.

Some function might need to reference this firmware node after
phylink_create so add a dedicated fwnode entry in phylink internal struct
and save it on phylink_create().

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index b69050f22717..b9a5cd123775 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -44,6 +44,7 @@ struct phylink {
 	const struct phylink_mac_ops *mac_ops;
 	struct phylink_config *config;
 	struct phylink_pcs *pcs;
+	struct fwnode_handle *fwnode;
 	struct device *dev;
 	unsigned int old_link_state:1;
 
@@ -1993,6 +1994,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 	INIT_LIST_HEAD(&pl->pcs_list);
 
 	pl->config = config;
+	pl->fwnode = fwnode_handle_get((struct fwnode_handle *)fwnode);
 	if (config->type == PHYLINK_NETDEV) {
 		pl->netdev = to_net_dev(config->dev);
 		netif_carrier_off(pl->netdev);
@@ -2077,6 +2079,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 		pcs->phylink = NULL;
 	}
 free_pl:
+	fwnode_handle_put(pl->fwnode);
 	kfree(pl);
 	return ERR_PTR(ret);
 }
@@ -2107,6 +2110,8 @@ void phylink_destroy(struct phylink *pl)
 		list_del(&pcs->list);
 	}
 
+	fwnode_handle_put(pl->fwnode);
+
 	kfree(pl);
 }
 EXPORT_SYMBOL_GPL(phylink_destroy);
-- 
2.53.0


