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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54D36C433DF
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 Aug 2020 19:31:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D8B12075E
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 Aug 2020 19:31:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b1ZVboL7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V77Ac81F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D8B12075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mdGqoWfnTfJB3Kwp5Dxy6GRhli63HGtCF61YkJR6opI=; b=b1ZVboL7C5vV5lPH0cRFeDRGzt
	PKvWRaeVTz4xc4tI0o0x0YgBHPhTrV8etvto1eHWCfOQw5bFlXnZ4zfBNnhiQ4PNqbhlM6sYhnlcC
	7FDdtGV5PBduLPOaK+kiSqhQp3BZO1jykO5XuD6LRGG4jJ9D66c9NXwEcwmqRihMElwX2Ui4DxXYg
	tfZQ6wpTjKfy4VU6rECWAJFHGWChNMdGtvg0prWOt7Jw02en00Maqm4D9blcN6cXMUYRHWibwS3o/
	8m2B0hkPoIGR3U73jN1k3L9ggQJKzovh+Y2s3iVxA5H9Ciz9i6zQV+3Q7TnHJerCQPrqpBEJ9uxsl
	E3cQUWAg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k9vhx-0003md-3p; Sun, 23 Aug 2020 19:31:13 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k9vhr-0003la-Lq; Sun, 23 Aug 2020 19:31:08 +0000
Received: by mail-pl1-x643.google.com with SMTP id f5so3172562plr.9;
 Sun, 23 Aug 2020 12:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=weNWHTNBlFYVLfVtCUahgwUBiIrruSXZn6kHTI1JUaY=;
 b=V77Ac81FIKwovH3RsFHYw6KqcGVROAhAK7uQOVOywTRUgnyCtheBeTYlD1U+XRbKHB
 G/ioAl4eu40NyeaXo8Nl33FsxQSPIUvhrlHT2SLxOszsMe0ByUA9Szm5Jbg9ZuS4b0uy
 ZHJCNEJV1fLvjRhxlxSMq89sQ7MHRGM6yCJDrAa3t8rrnoQ8QIg5eezpRxC/UgdtYppA
 PoDfL/7KmBV3kKXseyYll1UVhOqEWjq8reufqJ6BX1Ou5u9bvkAQNSDgr0FJxnig6WZN
 q3am9o04NOYfbyLNjZlXhDpjGRu+YHnYJCuR1Y2E3KPVC9A4WB3DGhfailImR7zwA9Bg
 92Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=weNWHTNBlFYVLfVtCUahgwUBiIrruSXZn6kHTI1JUaY=;
 b=s/73nu1mdhUMBPo+9kxXhPRvSTCcDhWip+Df8t9gUVGXyclGb0kuJD1a51yqkN+myS
 rHa6DI0cpXcNUcEVI0tVAD3Ae4Zh6k8BcVpzbOg8tFsKq6qvYLHEYi1Pb+U2WKS+mbjD
 crUQmqyqdgdxT6j6yS84pqzLB495KBp/xrKwMzOyV1V8hqKz/EQOStSkxeguRVzSM4pK
 v3iM3+nJ4ArCuJIxehzqg23UrM81ur2bqWT7d3ySYDsGHf7m7T2ph8t8JUvmlVMaKsHl
 6Io/Cq1EaMCWAi4aaVbf/fjjjTgGVZo/VYbn62OvhvoGTreg3KaEScpcydzKquu8UiRK
 +S9g==
X-Gm-Message-State: AOAM530+ltOUC4EiycRUCzQFNSLjDnhiAf3W6PgoO54kzgRa+xeVhxR2
 0FayekbGMypLKT/TWmreYYI=
X-Google-Smtp-Source: ABdhPJwwq1r/SRRcR3NwII2uDcDioNwrJebgxM9d75uHBbsTp1sJOileU4MFGNBOgcn4iKBR6eyIzA==
X-Received: by 2002:a17:902:8bcb:: with SMTP id
 r11mr1547106plo.65.1598211063471; 
 Sun, 23 Aug 2020 12:31:03 -0700 (PDT)
Received: from localhost.localdomain ([49.207.212.93])
 by smtp.gmail.com with ESMTPSA id mp1sm7804624pjb.27.2020.08.23.12.30.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Aug 2020 12:31:02 -0700 (PDT)
From: Sumera Priyadarsini <sylphrenadin@gmail.com>
To: davem@davemloft.net
Subject: [PATCH V3] net: dsa: Add of_node_put() before break and return
 statements
Date: Mon, 24 Aug 2020 01:00:54 +0530
Message-Id: <20200823193054.29336-1-sylphrenadin@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200823_153107_898009_C59766B9 
X-CRM114-Status: GOOD (  13.58  )
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
before the break and return statements.

Issue found with Coccinelle.

---
Changes in v2:
	Add another of_node_put() in for_each_child_of_node() as pointed
out by Andrew.

Changes in v3:
	- Correct syntax errors
	- Modify commit message

---

Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>

Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
---
 drivers/net/dsa/mt7530.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 8dcb8a49ab67..4b4701c69fe1 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -1326,14 +1326,17 @@ mt7530_setup(struct dsa_switch *ds)
 
 			if (phy_node->parent == priv->dev->of_node->parent) {
 				ret = of_get_phy_mode(mac_np, &interface);
-				if (ret && ret != -ENODEV)
+				if (ret && ret != -ENODEV) {
+					of_node_put(mac_np);
 					return ret;
+				}
 				id = of_mdio_parse_addr(ds->dev, phy_node);
 				if (id == 0)
 					priv->p5_intf_sel = P5_INTF_SEL_PHY_P0;
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
