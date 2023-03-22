Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6833C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Mar 2023 03:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yNEtokRAgptmn8Q7UhCFJ5SNvKxLvarbRSkba0BBYQw=; b=yzN0Yg+XRVXWVQ8OtbjNBwvkz8
	AqIRaHck94FdKLNfOH7OGGNYswCSRDGsToz5DUZB0Sdrrj19XzD5ufnMxzgEBRgycpHDRljN5RmsC
	dDz6n4lnQSAVs8afZKlcETQOdChpk4i2AjsLn6th6k8Vrb8kRtwR6ofB7ZEMZQCS7QdeuSNfKPRIv
	VARPc8dDFTCVrZ+EmXUvfI0JkQQEELoc/VvTQDAOlCQeRE1GM6ag6rW+t6AKJBu3dXt59htQZIWbm
	eZiJwicoRk0imEpgv2KHDOuHeg/5xm/BnRA9pXlVpfU4dk85gYUkQTGJWYaytf3x9JGgQiSA2WF+q
	QboK6iwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pepM9-00ESxm-0f;
	Wed, 22 Mar 2023 03:41:45 +0000
Received: from m126.mail.126.com ([220.181.12.37])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pepM4-00ESwZ-2X;
	Wed, 22 Mar 2023 03:41:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=yNEto
	kRAgptmn8Q7UhCFJ5SNvKxLvarbRSkba0BBYQw=; b=UXAhkpLa8drFdrIC7eWow
	/H9FhcvN7Mb8C/x2RmJ/YVGUG0KJOf1VtCH3MtFCxKvviUo8MePqiUvWT/Fh+V0L
	I7agkfwTw8mepYAUIusvWI0Iq8/8XdOU6/6tlPUs2M4xJnD0UzjyXHOEGddMx/z7
	5R15z3eUMKrx/U1Nm99L2M=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by zwqz-smtp-mta-g4-0 (Coremail) with SMTP id _____wD3_7fpeBpk5+yZAQ--.2410S2;
	Wed, 22 Mar 2023 11:41:30 +0800 (CST)
From: Liang He <windhl@126.com>
To: pavel@ucw.cz,
	matthias.bgg@gmail.com,
	windhl@126.com,
	gene_chen@richtek.com,
	linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] leds: mt6360: Add missing fwnode_handle_put()
Date: Wed, 22 Mar 2023 11:41:28 +0800
Message-Id: <20230322034128.1856117-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3_7fpeBpk5+yZAQ--.2410S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZrWkJryfWrW8ur1DJw43Jrb_yoWkWrX_Wr
	y7WrWxXr95uF42gFsFyr4FqrZ2kF48uw18CFs293WSgw17Jr1rX3yvvF93ZryrXF43try5
	GF40ya47Ca4fKjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xREKsj7UUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi3As6F1pEFGbfeAAAsx
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_204141_188159_5D10FDFC 
X-CRM114-Status: UNSURE (   9.34  )
X-CRM114-Notice: Please train this message.
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

In mt6360_init_isnk_properties(), we should add
fwnode_handle_put() when break out of the iteration
fwnode_for_each_child_node() as it will automatically
increase and decrease the refcounter.

Fixes: 679f8652064b ("leds: Add mt6360 driver")
Signed-off-by: Liang He <windhl@126.com>
---
 drivers/leds/flash/leds-mt6360.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/flash/leds-mt6360.c b/drivers/leds/flash/leds-mt6360.c
index e1066a52d2d2..bbb8e4284873 100644
--- a/drivers/leds/flash/leds-mt6360.c
+++ b/drivers/leds/flash/leds-mt6360.c
@@ -637,14 +637,17 @@ static int mt6360_init_isnk_properties(struct mt6360_led *led,
 
 			ret = fwnode_property_read_u32(child, "reg", &reg);
 			if (ret || reg > MT6360_LED_ISNK3 ||
-			    priv->leds_active & BIT(reg))
+			    priv->leds_active & BIT(reg)) {
+				fwnode_handle_put(child);
 				return -EINVAL;
+				}
 
 			ret = fwnode_property_read_u32(child, "color", &color);
 			if (ret) {
 				dev_err(priv->dev,
 					"led %d, no color specified\n",
 					led->led_no);
+				fwnode_handle_put(child);
 				return ret;
 			}
 
-- 
2.25.1


