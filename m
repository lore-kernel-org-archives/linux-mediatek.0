Return-Path: <SRS0=7UDR=CC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29152C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2020 20:03:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF0D720656
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2020 20:03:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="y7c3r4H8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c2U6POoJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF0D720656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HR2mPc53sNDbLQFZjRZ0A8GiCNSzInb/q17CCGcgBUU=; b=y7c3r4H8FQCB+oy76jjUlwTTau
	V7Q37avtNkny2SbEIRimh4MUUBBAg/zzeRyOL73K+df6a6h6OKKwYs011f4o/OH1RvGjnd4sG0c/i
	5WpzsM3W1dFLgPVhz1zI35bwUbhUOPAS1TSs3pVrwk5Y4CQ28i3oCm0qO3ZJU4Y/vxzLr+j4R4M9l
	JlpDrFJn3cN3dod9FIDTdEkhxT+1W+oXeKBGtPbB3F+2nLPlyBXmpk8MNkNc1PFX2p0npm3iJKO0R
	2NDG/9njWCSwc87hdGT6nHquW6Fr2HB1XQtQUG6TtJoSbts00RJP6jbCiS4XRcKkyFxzc8OmYUa7C
	85A4bXbQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAIgd-0008RX-5K; Mon, 24 Aug 2020 20:03:23 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAIgY-0008Qf-Tv; Mon, 24 Aug 2020 20:03:19 +0000
Received: by mail-pf1-x441.google.com with SMTP id m8so5476239pfh.3;
 Mon, 24 Aug 2020 13:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=isOavbC0CqCTOWpwarMOyw2TDbIMP+uJPiDdCwZdCm4=;
 b=c2U6POoJvv+0vYTJHvEKQaX7ET3zmfZwu9hCOQz2NJZ+PiNfhFvjFQkeNq2hSR42uW
 7S8VHrutiLhiRBILzasdfdAJAUnRG1BHOCXg+p3O3MnhKvLqagdmz9JFCDcXCQjh55oY
 +f/IPLBAsnBHlUOyvhRwO9nsmc8HG92Qbgce3slKVbJKFawgJNYx1D+Z4lADIh2TFrhG
 AAQvK+mlzor09CElVJkoHNgs8uWmwthGXkvATFK48jV6B9yy1Bwy7gHmmM7rktLFFFkg
 xOykXFC2KPGf9A+h/7exWOnjehmtzUPeRqpqsFOFSR19UiXRudkmG3F43aht6Jpr7lZ7
 wN7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=isOavbC0CqCTOWpwarMOyw2TDbIMP+uJPiDdCwZdCm4=;
 b=mU4iDRC+UCyQfmZWD0jHgZGf1aBTtGsKb6e8GSLlPSEWYA8KdmKTCP09G1JCyCijIs
 co44LSd1zeB/s4HgPpqKf5rRbr2k7qjUaWyyZHxAe4p9yPDBV4H3Q+TdgrCLRJV6Uosw
 y0kj3l5+BTxzUAieqH+ljQOdphq7lZoPD3OWPioSpOv48opZ2UqdwsuA2pbWCL//nEU4
 W6aK++qJQcAf8wYQft0RPUJNEVz+WsnA6OnYG/84MaHaua2OnTH2U7JaXfH7D02anD5G
 ZFwkvfwg6xl9vYjbdIaKmVKL21rQu+Z1K8Us87RHlWj5LaM3q02o25eMamnKP+gGnMp7
 GDJA==
X-Gm-Message-State: AOAM532PCwXqtIljlazb7iE14bTy2zIam/pugTWtYzbUBofEQms9GAA3
 JcvpeSRDPrC28rgqXbO1ZOs=
X-Google-Smtp-Source: ABdhPJyNNJ7ZQ0kH+sJbXxUJ+q4pt6tVcRPH37tIEAQf5D8RdnbjPmfJNMPVfDiij6bCHTAMNMa81g==
X-Received: by 2002:a63:7018:: with SMTP id l24mr4221170pgc.55.1598299396720; 
 Mon, 24 Aug 2020 13:03:16 -0700 (PDT)
Received: from Kaladin ([49.207.215.194])
 by smtp.gmail.com with ESMTPSA id d23sm10418236pgm.11.2020.08.24.13.03.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 24 Aug 2020 13:03:16 -0700 (PDT)
Date: Tue, 25 Aug 2020 01:33:11 +0530
From: Sumera Priyadarsini <sylphrenadin@gmail.com>
To: davem@davemloft.net
Subject: [PATCH V4] net: dsa: mt7530: Add of_node_put() before break and
 return statements
Message-ID: <20200824200311.GA19436@Kaladin>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_160319_027447_C000946B 
X-CRM114-Status: GOOD (  14.75  )
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
Cc: andrew@lunn.ch, f.fainelli@gmail.com, netdev@vger.kernel.org,
 sean.wang@mediatek.com, linux-kernel@vger.kernel.org, Julia.Lawall@lip6.fr,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, kuba@kernel.org,
 vivien.didelot@gmail.com, linux-arm-kernel@lists.infradead.org
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

Signed-off-by: Sumera Priyadarsini <sylphrenadin@gmail.com>
---
Changes in v2:
        Add another of_node_put() in for_each_child_of_node() as
pointed out by Andrew.

Changes in v3:
        - Correct syntax errors
        - Modify commit message

Changes in v4:
	- Change commit prefix to include the driver name,
mt7530, as pointed out by Vladimir.
	- Change the signoff to the correct format.

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
