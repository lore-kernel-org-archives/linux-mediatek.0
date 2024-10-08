Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A30CF042A
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Oct 2024 22:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PmhkzeMg8gOijeug1M9aLU+rSZW5pw46/po2LQrRcyI=; b=kDaX4HzmjyclH990gg0mBwk6LJ
	YTuxDs4MprdY4NmMMcrCRg5xzXEYF8HcFrNB+5a2f+CdwOYP8XHQ99V0PAau+Ori5UUgAXlTMV6BY
	gLI4TjH+wUeigL480vb01eV4tC532P/CASxUVjlHQruAyEe8PzUP/XYGqfEs1LXJenkoM+Hxviw+Z
	O1eIHSsoUHaiszNakHkjZiu+IFt0p3OCHABovOYrv0lel9vWvEm1IrJ1HAUxZLmff8crxma4AMTTU
	ALcj/lT3jwbk4CgkxpEbNlqySjB8ooccslyiCnnQ+OLxd01iFU9jIrlz6FFH5cLl5nlrdxm6JqRV5
	KfE0dc4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syIcQ-00000007H97-0AOG;
	Tue, 08 Oct 2024 22:23:50 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syIb5-00000007H2n-3XYy;
	Tue, 08 Oct 2024 22:22:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 32703A436C5;
	Tue,  8 Oct 2024 22:22:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FC52C4CECD;
	Tue,  8 Oct 2024 22:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728426146;
	bh=MccBu7KW7dTQw0QT8KNJWntrJS4ZIEa0v6xwKmeKxb0=;
	h=From:Date:Subject:To:Cc:From;
	b=V1JHCNHMAWZlI32H7SWOFNxGbaXRPEPegtkHpt5JHInfFurbF2AgEM71jSxZfx6lc
	 LX0XaXGpFZUsPRWRkR7bdPF8KdizYUQVL29v9L2cErouCYP93/n9rgvDcCf5jeZbfb
	 K4uqjt2eMtLKSrsRNsouGZ9tNMsG33rdUGLK3v2A/yh3PK0n0oxTL9r417K0jVG5lf
	 6Npe1UhwWlve7lxE7GQu1AtwanalPJItIiDvBwbAOp3Piyavp7nJqYCX1UavzrDoUL
	 SegwDV8jGI+J0Wb9+X9vMMX7yui4LGEO+RNDcNjshUxcGSyD48Wnidterm6NhEfNUO
	 Dv3uv5Ekiy4LA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 09 Oct 2024 00:21:47 +0200
Subject: [PATCH net-next v2] net: airoha: Fix EGRESS_RATE_METER_EN_MASK
 definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241009-airoha-fixes-v2-1-18af63ec19bf@kernel.org>
X-B4-Tracking: v=1; b=H4sIAHqwBWcC/3WMQQrCMBBFr1Jm7UgSAymuvId0Ma3TZlAamUhQS
 u5u7N7l+5/3NsiswhnO3QbKRbKktYE7dDBFWhdGuTUGZ5y3xngk0RQJZ3lzxp6IehvC6E4emvJ
 U3o9mXIfGUfIr6WevF/tb/4SKRYtuDGQsz1Nw4XJnXflxTLrAUGv9AtFxLQCpAAAA
X-Change-ID: 20241004-airoha-fixes-8aaa8177b234
To: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
 Mark Lee <Mark-MC.Lee@mediatek.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Jacob Keller <jacob.e.keller@intel.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_152227_979840_EE880042 
X-CRM114-Status: GOOD (  10.51  )
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

Fix typo in EGRESS_RATE_METER_EN_MASK mask definition. This bus in not
introducing any user visible problem since, even if we are setting
EGRESS_RATE_METER_EN_MASK bit in REG_EGRESS_RATE_METER_CFG register,
egress QoS metering is not supported yet since we are missing some other
hw configurations (e.g token bucket rate, token bucket size).

Introduced by commit 23020f049327 ("net: airoha: Introduce ethernet support
for EN7581 SoC")

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
Changes in v2:
- improve commit log
- Link to v1: https://lore.kernel.org/r/20241004-airoha-fixes-v1-1-2b7a01efc727@kernel.org
---
 drivers/net/ethernet/mediatek/airoha_eth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/airoha_eth.c b/drivers/net/ethernet/mediatek/airoha_eth.c
index 942fcfc5b79972e1bbda06e6e5c07302cab0affa..b3601a56bda3ec63500e0df4809102f3f0ec940f 100644
--- a/drivers/net/ethernet/mediatek/airoha_eth.c
+++ b/drivers/net/ethernet/mediatek/airoha_eth.c
@@ -554,7 +554,7 @@
 #define FWD_DSCP_LOW_THR_MASK		GENMASK(17, 0)
 
 #define REG_EGRESS_RATE_METER_CFG		0x100c
-#define EGRESS_RATE_METER_EN_MASK		BIT(29)
+#define EGRESS_RATE_METER_EN_MASK		BIT(31)
 #define EGRESS_RATE_METER_EQ_RATE_EN_MASK	BIT(17)
 #define EGRESS_RATE_METER_WINDOW_SZ_MASK	GENMASK(16, 12)
 #define EGRESS_RATE_METER_TIMESLICE_MASK	GENMASK(10, 0)

---
base-commit: 42b2331081178785d50d116c85ca40d728b48291
change-id: 20241004-airoha-fixes-8aaa8177b234

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


