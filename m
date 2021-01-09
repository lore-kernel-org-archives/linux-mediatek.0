Return-Path: <SRS0=452w=GM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC338C433DB
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Jan 2021 02:11:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83FDA23A3C
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Jan 2021 02:11:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83FDA23A3C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cA3IeaqTGFGfX3NnTg/noL+RE7RPb01DVxx3WON9BLM=; b=pt4hla490zDliDablhfEDUljX
	8GEnQ8FKAxxMoCL6evqF/BZd5NFEO28m2iJmP97X+UCglNH9ml/AtbNndD+nXZUgJXNnZrcSQW3gI
	bphmGr9QUMH9JZRN+tMauweuFoE5AsYui4dmVXKN0soTgPVLmx1G0k61tn5rJsi1O6o0bEusZw4ho
	7V5DR7AYciGRawKl1/KCsVoQ12vhYlJ4/GCt3PznMTDDK1eqpu2JwVZF5dx3IF6r9YYsvUcRrvgOJ
	fNFpMxdmuCvJAaiE9x6NUXzFxWChIuDcaoghZ6HvCQq9VHBSr8+9cpwzbJhHpfkEheABsSY+nmW1A
	V4TlVubNA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ky3ih-0003JT-Hi; Sat, 09 Jan 2021 02:11:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ky3ia-0003Hc-G2; Sat, 09 Jan 2021 02:11:05 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1D56F23AA3;
 Sat,  9 Jan 2021 02:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610158263;
 bh=t0IHG7i/rG5q0kGjKDEB6BMqF7jMIE84um+5xi949Sg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZcNUrJuDaDmSymaVrfjWxRc6dQbT/apZ7uMQHnllurftkrwnUMfSWCkCEpA3IoeFz
 04mojUPlpllMMbu3qOT5iHQYrKBSmfpgw0tOvdrnWncb6uKN7XR6oVThIeOBEi9PBH
 uVazrZsTCzQ+cKriSdF2BQebHCTmtacSU8H/ljUc75qsabLFM3CE9vA31NNQy8TZF9
 mRSaC3uj/pQc5QraBN5zFVyoeGJyRm/bzthR9v14Ih7tZ8OYH0O28znjsOPfRP5qPn
 /frNb2HaXJKavuZiDAlaCuStAe1lNIwTHW1pjfcjTNwTLyqlyMshYl99UEnPT7Z/+x
 uJg4a0HkHZ8Kw==
From: matthias.bgg@kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 3/3] regulator: mt6323: Add OF match table
Date: Sat,  9 Jan 2021 03:10:46 +0100
Message-Id: <20210109021046.21907-3-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210109021046.21907-1-matthias.bgg@kernel.org>
References: <20210109021046.21907-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_211104_785055_29AACA63 
X-CRM114-Status: GOOD (  10.51  )
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
Cc: Gene Chen <gene_chen@richtek.com>, Matthias Brugger <mbrugger@suse.com>,
 Axel Lin <axel.lin@ingics.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chen Zhong <chen.zhong@mediatek.com>,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Matthias Brugger <mbrugger@suse.com>

The binding documentation mentions that a compatible is required for the
MT6323 device node. But the driver does not provide a OF match table.
This way auto-loading is broken as the MFD driver that registers the
device has a .of_compatible set which makes the platform .uevent
callback report a OF modalias, but that's not in the module.

Signed-off-by: Matthias Brugger <mbrugger@suse.com>

---

 drivers/regulator/mt6323-regulator.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/regulator/mt6323-regulator.c b/drivers/regulator/mt6323-regulator.c
index ff9016170db3..b3d84e95f051 100644
--- a/drivers/regulator/mt6323-regulator.c
+++ b/drivers/regulator/mt6323-regulator.c
@@ -406,9 +406,16 @@ static const struct platform_device_id mt6323_platform_ids[] = {
 };
 MODULE_DEVICE_TABLE(platform, mt6323_platform_ids);
 
+static const struct of_device_id mt6323_of_match[] = {
+	{ .compatible = "mediatek,mt6323-regulator", },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, mt6323_of_match);
+
 static struct platform_driver mt6323_regulator_driver = {
 	.driver = {
 		.name = "mt6323-regulator",
+		.of_match_table = of_match_ptr(mt6323_of_match),
 	},
 	.probe = mt6323_regulator_probe,
 	.id_table = mt6323_platform_ids,
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
