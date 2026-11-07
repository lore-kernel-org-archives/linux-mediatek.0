Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E39606EE87
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Nov 2026 14:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n2AJuWoU;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LGQuHeNE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NJC/Y/6ygBaJvU2GPJgj3ACgIGfTCfMexIHbp6F6K/A=; b=n2AJuWoUeXeS/y2F+WIF2npCBu
	qXdIjHWa6IIowV9eKX3xEBFDK2lnRMJHr1F7YpzxgsLE4R58sv4lxzInzd1whHkAR6opvQHjxvNgf
	I9CuCMtF8SEPzJYyHJtHguf179/yYGT6uS/fII+6UnJjaon+JW57dmjIq2aKAemO89jOSzktf9Cjp
	JhX7eZ7Z+gi/rxHOiXqz02HHdIt10dqfruseLDpMx/h4NyMf4FAdn0qRMtmj0wZyc3ByYPSwIDcUd
	X1g3/c5ffdn3tMDpH1fzBZhOVIts48P68tMHtWYfBHuomsJ7Zh4NQF2GkUy4/rjZ2J0QezuFub0TS
	NTMxLDLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPhoj-0000000ErWM-2w9O;
	Sat, 07 Nov 2026 14:54:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPhoc-0000000ErRh-2kJ1;
	Sat, 07 Nov 2026 14:54:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6C05F417F7;
	Sat,  7 Nov 2026 14:54:45 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794063285;
	b=kX/e47il/TOys54NmtCOHe7NMQ9SyMvr30wngI2UU1OvWy/upsqfbch4e8tNLxh/FomI
	 QX56oCLlKFtPeaqCHXUVyBMlOvc0//BOZIgzzHtWsDMD6m2l3SXj1wrG8Xuv5b/8AJCNy
	 HkrShtrwZPF5oK4g1Q+otAEUK5XmlgFVwEG/0oV987fdoO63OzDtnU03dKeJJtUm/9O6f
	 2mnyMLgSe5kLM/WIwr7Y45/rkDiptWLO1UUSVmlkGWIJBmmgs4TrkBLTmMGbRWjjbO1Ax
	 S5+4Gq08pJUlutQaltcC4oxeAPDXrU6yj163WmAqwRTOzVu3rm9LrwMzMy+7xnMv+Iw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794063285;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=NJC/Y/6ygBaJvU2GPJgj3ACgIGfTCfMexIHbp6F6K/A=;
	b=yQm0KgcXU70IWLHFyaVaxKCp1Wtb7T5wy1mIcQXQTOtHqfjamCvFdLp9ZmFJa8ccA8rF
	 eshn4zSmEjjLK+v3ic/Cv/MruLi5DCScsRJ8J7nqSP6LkTwcP53qjvSFPhlIQ7TY2i77a
	 ti6vm3Sm3d3YK3vGi9elbMiC1Vf3maKVs5G92OZC/Iu/9KuS6CfxoaU6At0NBf073U/nf
	 09zOGdSx63rJihIaiAv35hgv6LjBe2BjzU46fwzj0AoLb+x6lMmR7Wrse7AWdRcETE9S6
	 /RQyoEq2QKWehFqIT2eGav8xPI7X9oTVGxinp1dDpzAvaJ4Samngt/aqdes/Ho6Wq0A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7F0A41F008A4;
	Sat,  7 Nov 2026 14:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794063285;
	bh=NJC/Y/6ygBaJvU2GPJgj3ACgIGfTCfMexIHbp6F6K/A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=LGQuHeNEmQoThmOb3WgRXRhN2+296MrsYP38yGjecymrPlTa8KH8BItZ0/9+ATAWd
	 zyqk724OD4Spfkr/dg0eZLB1MS8Ahr3yA6li1Vxm9plILfMBIDF3f0+dLMvmpy8/9K
	 EoYCAurDKlp0/GO5Oxr+b/1aKKTgJqtWGWxz1EWbX6k7o1aBrfNGSYUmbVRek2TJts
	 u36MnqInsGtTLKoYw7PTVlboBQgjPLsaXoX+Hiba0G/7Wv5FqSFmcj56Vdt3OOopeh
	 jdajH3mJwleUKMoxJVUDNTPCDIVr4xlbjDeqkJc5Zn+hsHXAAClCqqZHyFzHPhsIAw
	 JSQaFH3cl9A0w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1017547C47;
	Sat,  7 Nov 2026 14:54:44 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Sat, 07 Nov 2026 16:54:43 +0200
Subject: [PATCH v3 2/3] usb: mtu3: add SoC platform data for FIFO quirk
 handling
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261107-6595-mtu3-v3-2-f36bc569cb47@protonmail.com>
References: <20261107-6595-mtu3-v3-0-f36bc569cb47@protonmail.com>
In-Reply-To: <20261107-6595-mtu3-v3-0-f36bc569cb47@protonmail.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794063282; l=3866;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=auQPHvab1ZzrFsEkD3kyiLiuuk6+++iHHfze1wbJCXA=;
 b=rZXp5qlTOcGBFK+aoKrYTcpaBANl+TuT7yMeU+HgrjWzoDkqG5Rbv45x4nraCZ3FuBud98D8L
 URz7wWccYg0Dq52F9VtuVvauGz1DLZPiYJ5puQxwmtLab2xT0Lcfulu
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Reply-To: rva333@protonmail.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Roman Vivchar <rva333@protonmail.com>

Some SoCs, such as mt6595, require specific quirks for the MTU3 to
function properly.

The mt6595 IP block doesn't support multiple slots for the FIFO,
resulting FIFO wrap.

Fix this by adding platform data with a field to handle FIFO limitation.
No functional changes for existing SoCs.

Assisted-by: LLM (debugging)
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 drivers/usb/mtu3/mtu3.h        | 9 +++++++++
 drivers/usb/mtu3/mtu3_core.c   | 3 +++
 drivers/usb/mtu3/mtu3_gadget.c | 8 ++++++--
 drivers/usb/mtu3/mtu3_plat.c   | 8 ++++++--
 4 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3.h b/drivers/usb/mtu3/mtu3.h
index ba5a63669e5f..349e5b20f285 100644
--- a/drivers/usb/mtu3/mtu3.h
+++ b/drivers/usb/mtu3/mtu3.h
@@ -315,6 +315,14 @@ static inline struct ssusb_mtk *dev_to_ssusb(struct device *dev)
 	return dev_get_drvdata(dev);
 }
 
+/**
+ * struct mtu3_platform_data - platform data for the driver.
+ * @fifo_single_slot: the IP can handle only one buffer for bulk transfers
+ */
+struct mtu3_platform_data {
+	bool fifo_single_slot;
+};
+
 /**
  * struct mtu3 - device driver instance data.
  * @slot: MTU3_U2_IP_SLOT_DEFAULT for U2 IP only,
@@ -369,6 +377,7 @@ struct mtu3 {
 	unsigned connected:1;
 	unsigned async_callbacks:1;
 	unsigned separate_fifo:1;
+	unsigned fifo_single_slot:1;
 
 	u8 address;
 	u8 test_mode_nr;
diff --git a/drivers/usb/mtu3/mtu3_core.c b/drivers/usb/mtu3/mtu3_core.c
index 66dbfe1705d5..15f1b80fd0e2 100644
--- a/drivers/usb/mtu3/mtu3_core.c
+++ b/drivers/usb/mtu3/mtu3_core.c
@@ -922,6 +922,7 @@ static int mtu3_set_dma_mask(struct mtu3 *mtu)
 int ssusb_gadget_init(struct ssusb_mtk *ssusb)
 {
 	struct device *dev = ssusb->dev;
+	const struct mtu3_platform_data *pdata = device_get_match_data(dev);
 	struct platform_device *pdev = to_platform_device(dev);
 	struct mtu3 *mtu = NULL;
 	int ret = -ENOMEM;
@@ -930,6 +931,8 @@ int ssusb_gadget_init(struct ssusb_mtk *ssusb)
 	if (mtu == NULL)
 		return -ENOMEM;
 
+	mtu->fifo_single_slot = pdata->fifo_single_slot;
+
 	mtu->irq = platform_get_irq_byname_optional(pdev, "device");
 	if (mtu->irq < 0) {
 		if (mtu->irq == -EPROBE_DEFER)
diff --git a/drivers/usb/mtu3/mtu3_gadget.c b/drivers/usb/mtu3/mtu3_gadget.c
index f224f2ee379a..8ac244d40afd 100644
--- a/drivers/usb/mtu3/mtu3_gadget.c
+++ b/drivers/usb/mtu3/mtu3_gadget.c
@@ -112,8 +112,12 @@ static int mtu3_ep_enable(struct mtu3_ep *mep)
 	mep->ep.desc = desc;
 	mep->ep.comp_desc = comp_desc;
 
-	/* slot mainly affects bulk/isoc transfer, so ignore int */
-	mep->slot = usb_endpoint_xfer_int(desc) ? 0 : mtu->slot;
+	if (mtu->fifo_single_slot)
+		/* older IPs can handle only one slot reliably */
+		mep->slot = 0;
+	else
+		/* slot mainly affects bulk/isoc transfer, so ignore int */
+		mep->slot = usb_endpoint_xfer_int(desc) ? 0 : mtu->slot;
 
 	ret = mtu3_config_ep(mtu, mep, interval, burst, mult);
 	if (ret < 0)
diff --git a/drivers/usb/mtu3/mtu3_plat.c b/drivers/usb/mtu3/mtu3_plat.c
index cc8a864dbd63..bb67da4704b2 100644
--- a/drivers/usb/mtu3/mtu3_plat.c
+++ b/drivers/usb/mtu3/mtu3_plat.c
@@ -611,9 +611,13 @@ static const struct dev_pm_ops mtu3_pm_ops = {
 
 #define DEV_PM_OPS (IS_ENABLED(CONFIG_PM) ? &mtu3_pm_ops : NULL)
 
+static const struct mtu3_platform_data mt8173_platform_data = {
+	.fifo_single_slot = false,
+};
+
 static const struct of_device_id mtu3_of_match[] = {
-	{.compatible = "mediatek,mt8173-mtu3",},
-	{.compatible = "mediatek,mtu3",},
+	{ .compatible = "mediatek,mt8173-mtu3", .data = &mt8173_platform_data },
+	{ .compatible = "mediatek,mtu3", .data = &mt8173_platform_data },
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtu3_of_match);

-- 
2.56.0



