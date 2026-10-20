Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED03606A339
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2026 02:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xXWTyd/y;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=XPonYUPZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cb9ewf3o3LE8X+Qeg+i0VTACWRFyz4Qa+t6SXIrAGc0=; b=xXWTyd/yvix9kkLx/CZunGLgmf
	Y0+oRqSSfi5yOpEgwAJXTXW+4/QjMKihkzB20+Pr+vEKBaYhN4BV/Kq9UFpQDXbnRt7tA41Y/DHSG
	NgQyEVECiPoLAIvv47WhOl4j+EKCwg1Juc1atgMOtDVeyBLvBpZCwy+FdHL0ifepacqMEGbA+Ukoy
	RSQt2u6Iq3aP9GwnxmT+llrZEFo8x93q3Pzz41qPGfnwkkPO+Suj3r4FSdoVCmKjimZxHjdCouhNl
	XNuI4zUsGieSWWhbeUGk/9ZNJ7cKfc2i72+ry4jB5tujNYsqbW6Mqlk+dFCrI35f5N25sMYsqdsKP
	2xVYpOOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIzs5-00000008i4J-2ZvN;
	Tue, 20 Oct 2026 02:46:37 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIzrb-00000008hg6-41GU;
	Tue, 20 Oct 2026 02:46:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=cb
	9ewf3o3LE8X+Qeg+i0VTACWRFyz4Qa+t6SXIrAGc0=; b=XPonYUPZzhgmzkdkXw
	ad6gx6Y8ilyg+c4YFZR6D6CnB1FQY1xh5mLBDTfupWpTKuT2dOOVrN9RS1FNBIWh
	74x3t4bMLdwAyFHg8FRYvtape4970kVw2DhfkcfS2YxaWMHjKjU/i56NiO2Grdqp
	gdUlUzcVYeqBIzZZ88ZErjIwc=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD3H9HZ1dZq2OtmBQ--.60682S10;
	Tue, 20 Oct 2026 10:45:58 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Deren Wu <deren.wu@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 08/11] wifi: mt76: mt7925: validate temperature response length
Date: Tue, 20 Oct 2026 10:45:40 +0800
Message-Id: <20261020024544.3101738-9-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020024544.3101738-1-yaojiale02@163.com>
References: <20261020024544.3101738-1-yaojiale02@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3H9HZ1dZq2OtmBQ--.60682S10
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gr1DCF1furW8Xr4UCrW3KFg_yoWkCrc_ur
	n2vr97Jr18Gwn8Kr42krW7GF90k395uF1rurWrtrWfX3y7JFWxurZ3Zrn7GrZFkwn7ZF98
	Crn8Aa42q343ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbW8BUUUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC8Ab+OWrW1eYclAAA32
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_194608_370501_BDBC1D91 
X-CRM114-Status: UNSURE (   9.08  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.8 (-)
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
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The temperature query removes a fixed prefix and TLV header and then
reads the event without validating the response length. A truncated
firmware response can cause an out-of-bounds read.

Require the prefix, TLV header, and complete temperature event before
pulling the skb.

Fixes: 396e41a74a88 ("wifi: mt76: mt7925: support temperature sensor")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index e5cacb12d367..d768002c64c2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1037,6 +1037,10 @@ int mt7925_mcu_get_temperature(struct mt792x_phy *phy)
 					&req, sizeof(req), true, &skb);
 	if (ret)
 		return ret;
+	if (skb->len < 4 + sizeof(struct tlv) + sizeof(*evt)) {
+		dev_kfree_skb(skb);
+		return -EINVAL;
+	}
 
 	skb_pull(skb, 4 + sizeof(struct tlv));
 	evt = (struct mt7925_thermal_evt *)skb->data;
-- 
2.34.1


