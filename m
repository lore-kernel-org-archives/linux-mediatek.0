Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDB7606A320
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2026 08:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LusdQgPI;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=pwT+MWNS;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OZdaM4FJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=VjvPviRplzIhgWM/q2jdDcLxkxdDLClBt75UUKoUPKE=; b=LusdQgPILLUnjJ1A6nM1tmyk5Q
	5y4bhVN0+6o1IhmvnVyvMBGYENbQ0+Bs/tqEJCpAGU2J9oQr+WcsQWNBI52wGdtoxeeh26D9Bikcs
	vjdgsoHmB/OTrI/IucjxkYXLLpHr0xEIZks00zvUcewXuz0GihUqBwRDYe3mycdkZO6o7sVFAyVum
	MBb8qFUQ4rcHRBnpnQjGb2Wzo957oPPWc2bdNbzPRr4z+BajyCzG7TEUUDGO7pGV2W7dNnMgtEP5e
	Qjb51RvLekZe2WjLVluLqRj10RIWjGPvU/mTNG5+l4SSOrXOLMa9zcgUWbYATZrUVgwoeDIhV5NXG
	cBEFqysQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKAf6-0000000Fvp1-0mk2;
	Fri, 23 Oct 2026 08:30:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKAf5-0000000Fvol-0Ylj
	for linux-mediatek@bombadil.infradead.org;
	Fri, 23 Oct 2026 08:30:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=VjvPviRplzIhgWM/q2jdDcLxkxdDLClBt75UUKoUPKE=; b=pwT+MWNS55B2EXELe58kFwhWBo
	EmWmv38sfSMERIWmHZ0wKb9ROK973smRPzd3lM2/or57f/1nckLOU+lB4RiiEl9v8oKmVTXxo4Okj
	ABLdpKD9qeyFztUTOedmakySGOeR/X2izfBxKQL95wPKVdlOscveXg5Fk+pT4PoygkaiXf0/SVe56
	ceaIyMco8QfEynDypMIjWP0AWPw0GXrg1yoY3sXFNRZKI4Pz3tdYjc9mDySqntvbijAOwEMjwFIg2
	DIeDNThF6Ou2RQZ/BsA71ogfxkl6+CPVoIDCqhzfBzhEL41KBbm7YsAlLBAI6Roc822ISt3YoGDmC
	AQACsCNQ==;
Received: from mail-dy2-x0a.google.com ([2607:f8b0:4864:36::a])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKAf1-000000098z6-3zdp
	for linux-mediatek@lists.infradead.org;
	Fri, 23 Oct 2026 08:30:01 +0000
Received: by mail-dy2-x0a.google.com with SMTP id 5a478bee46e88-35eaf84cc66so554001eec.0
        for <linux-mediatek@lists.infradead.org>; Fri, 23 Oct 2026 01:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792744198; x=1793348998; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VjvPviRplzIhgWM/q2jdDcLxkxdDLClBt75UUKoUPKE=;
        b=OZdaM4FJamt6nY86pxqOelMBIDaz24eXyuAbuI2TEwPBtVp1Bia1p/fSHEVB5HxdpY
         7a/RKTCzVuWcziIKADesfvjOWhLUsgm3l/tyt5oSU8UJn459ilYs9tYBAl0VDOeuc/cv
         UzeJE10b2B5ApUGz7u51UXmda/H58HSNEv5GWXTj4L848vVhMQZxzvtGqygRo5MpS0Z+
         xbCIYaHrqnVQB0HF25VeL9gUK9PXIZHKHJEOuQ6XquQnhezTu2bAd/HufVhFcAS/X6yg
         EfUYpbdOyhl88vdbGKoDvjrEzf6cNd/vSC3WDcV3BSyu7XAChH8u93F4DC9yLD8u/Htc
         xf9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792744198; x=1793348998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VjvPviRplzIhgWM/q2jdDcLxkxdDLClBt75UUKoUPKE=;
        b=nH2cbf+WRobS0eZGjSkNirC4O1EQWc9VylcwO1Z0lUFhVjNh6QzzgZBIwQ4dT6I6tQ
         uJVrtPz4TUPLdeTTPIl63Tk68fmQw9pATSIIQd258XJ2YIh25FQd6LIS5yiJGjJ2nR+K
         3dMlwdLZS5/AJ+hMcRPL/aaa3/vA45UTGFVMmeoctHChGBwg3xD+zdUo70jXhMJ0OMgG
         adZaQQ+BaA9J+AFB0irIigvyum8udxos/6gttpuYKydJw3PWXNOgK6/1oykpXWkXfS+d
         QtYQ4uATkgDqNNex+I2Hfq4x6uh/32jYEDJFv2mJ0JD9bPP+Arz52xxl7yYxzXduVNtf
         bS4g==
X-Forwarded-Encrypted: i=1; AKwUvBzXu0tP7ifbbjEoCva7g97fHfnexye7O+TQWU7levs1tyTujXd3saWwytVdJtlZuPkK9yhvgjq247rThoDYeg==@lists.infradead.org
X-Gm-Message-State: AFq9FYLVT4XCdu2uRCmgAD/7qs7JbvMcxrUtzPESPbvTy4ojI257Y7nO
	WD/8yJ4I/uaIeaQg4RNwAfHXuFej9gRPVnr2OIVx2950XwCaB2kDMbQp
X-Gm-Gg: AYBFou2ttI20Za0h5slsMNsC7n0dFQbg0DarXoNxDd6BGK1ZaFBgHmnBOOJ+Rlbo38L
	AYypCY083Kxq0TJrBQwsQcgB4vHsNbwRxJr0xTvU5hgsN79Fm9qLhptu59NW/WiaTwZts/I3Piy
	BHaZkBdJIHltGnOnL+QV+z4vIqAnqVpJFiX5U14Z06OS9s+HC/273F2bBjzhNKku2O8aBCM74x+
	ckW95klNZ4At3dYKR/7AzCJ2hGt9hTYNKc1fPC4fQLzjvPM0n7YMD7O+BC7Ypv2cBGbDgW4QqkH
	viIBdSREyitAOnLhr/+GsmFrwma4sH2u9YUBOYI2pDq+t3hyiaPKcPaWeQSdhA5gTg1igM3gXv8
	k1kWyew7afo7PxF6srtktAT8jq8G8AzHsUgRJcJpsuZyTpFTFFn3FegGNYq3ZHfFYFDFLdVYfpX
	WWwyTIrS+L/7xMqcUTYs0GboQhxKRQ23ZaLpzknWQRuuUmcUykrAhZEmqcxUEfBxiVPNz25zmSS
	0a6SVHovwznPoQWxUgHAQcByRbQpUbKxfHsxaDqGwEx0H4KysWzYAI=
X-Received: by 2002:a05:7300:a225:b0:351:6b27:d67d with SMTP id 5a478bee46e88-369d9802e3amr1997730eec.30.1792744197389;
        Fri, 23 Oct 2026 01:29:57 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9a72ff2sm4847349eec.0.2026.10.23.01.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 01:29:56 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Kevin Hilman <khilman@baylibre.com>,
	Roger Lu <roger.lu@mediatek.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Coia Prant <coiaprant@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] soc: mediatek: SVS: fix device reference leak in svs_add_device_link()
Date: Fri, 23 Oct 2026 16:29:48 +0800
Message-ID: <20261023082948.1854252-1-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_093000_226351_ED3E1F02 
X-CRM114-Status: GOOD (  15.41  )
X-Spam-Score: -0.2 (/)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

svs_add_device_link() calls svs_get_subsys_device(), which returns a
device with a reference taken by of_find_device_by_node(). If either of
the subsequent checks fails, the function returns an error pointer
without dropping that reference, and the caller only checks IS_ERR() and
bails out, so the reference is leaked on every -EPROBE_DEFER.

Both error paths can be hit in practice: device_link_add() returns NULL
when the link would create a reverse dependency or on allocation
failure, and the supplier status check fails whenever the supplier has
not bound yet.

Drop the reference before returning on both paths.

While at it, note that the return value of device_link_add() is only
used to detect failure. Managed links are owned by the driver core, so
the driver must not keep or dereference the struct device_link pointer
to inspect the supplier state; read dev->links.status directly instead.

Fixes: 681a02e95000 ("soc: mediatek: SVS: introduce MTK SVS engine")
Cc: stable@vger.kernel.org
Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 drivers/soc/mediatek/mtk-svs.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index 99edecb204f25..fecb09b9185c2 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -2145,21 +2145,21 @@ static struct device *svs_add_device_link(struct svs_platform *svsp,
 					  const char *node_name)
 {
 	struct device *dev;
-	struct device_link *sup_link;
 
 	dev = svs_get_subsys_device(svsp, node_name);
 	if (IS_ERR(dev))
 		return dev;
 
-	sup_link = device_link_add(svsp->dev, dev,
-				   DL_FLAG_AUTOREMOVE_CONSUMER);
-	if (!sup_link) {
-		dev_err(svsp->dev, "sup_link is NULL\n");
+	if (!device_link_add(svsp->dev, dev, DL_FLAG_AUTOREMOVE_CONSUMER)) {
+		dev_err(svsp->dev, "device_link_add returns NULL\n");
+		put_device(dev);
 		return ERR_PTR(-EINVAL);
 	}
 
-	if (sup_link->supplier->links.status != DL_DEV_DRIVER_BOUND)
+	if (READ_ONCE(dev->links.status) != DL_DEV_DRIVER_BOUND) {
+		put_device(dev);
 		return ERR_PTR(-EPROBE_DEFER);
+	}
 
 	return dev;
 }
-- 
2.47.3


