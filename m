Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E2A60A2628
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2026 18:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CyTY6wdG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yMAAykQB6oCefnRWkX8/jVQpDHtwcvOmdsuX+RRnkkg=; b=CyTY6wdGmZf8JC
	UnIuSovt7dw90Ikb0dZQ6J7h/wR1X03z8qY1RlA1Id0BsAwmID9yMzigcRRcrJUpjMyl6VEfBECeX
	6lre9GQwRrMnRFL2+YR5E1M8uWR98IOw/2ckcEvuRz0iCUYettBMvU0JjQ58IG+f/1Em3MW1P7Jjz
	bC6v08YW8Qyp/m8uoUJF/ft1l6yGOYkSHACBVipupDyngOFNSWNgQacUfsyVxtbAR5OTrJcsB2Tvg
	9gBUKOH7Mz0F12/tWI0DdPW08Jvd88w9iLbLT8JswtBgvhe0POdvvt7+6zfMBXJ7Tu+phCXKQl3b6
	wiivmjhuXaV4Ntl5Tsfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRa1c-0000000AuLV-2kUg;
	Thu, 12 Nov 2026 18:59:56 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRa1Z-0000000AuJY-3NXH
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Nov 2026 18:59:56 +0000
Received: from [2a04:4540:1403:f2fc:83ce:6656:246:c906] (helo=bertha10..)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xRa1V-002Xgt-0T;
	Thu, 12 Nov 2026 19:59:49 +0100
From: John Crispin <john@phrozen.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Ahmed Naseef <naseefkm@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	devicetree@vger.kernel.org,
	lei.dong@airoha.com,
	Linqi.zhang@airoha.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	mfd@lists.linux.dev,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Rajeev.kumar@airoha.com,
	upstream@airoha.com,
	Weifeng.xu@airoha.com,
	zhengping.zhang@airoha.com
Subject: [PATCH v2 3/7] pinctrl: airoha: make the chip SCU optional
Date: Thu, 12 Nov 2026 19:59:37 +0100
Message-Id: <20261112185941.1316112-4-john@phrozen.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261112185941.1316112-1-john@phrozen.org>
References: <20261112185941.1316112-1-john@phrozen.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_105953_843051_C1138541 
X-CRM114-Status: GOOD (  13.34  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A SoC that muxes every pin through the IOMUX block and describes no
pin configuration has no use for the chip SCU. Skip the lookup when
the match data names no chip SCU compatible, instead of handing a
NULL compatible to syscon_regmap_lookup_by_compatible().

No functional change for the existing SoCs, which all name one.

Signed-off-by: John Crispin <john@phrozen.org>
---
Changes in v2:
- Look up the airoha,chip-scu phandle before the check for a chip
  SCU compatible (Lorenzo).

 drivers/pinctrl/airoha/pinctrl-airoha.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index f9ae4020b764..5ae0c49e491a 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -833,6 +833,22 @@ static const struct pinctrl_ops airoha_pctlops = {
 	.dt_free_map = pinconf_generic_dt_free_map,
 };
 
+static struct regmap *
+airoha_pinctrl_chip_scu(struct device *dev,
+			const struct airoha_pinctrl_match_data *data)
+{
+	struct regmap *map;
+
+	map = syscon_regmap_lookup_by_phandle(dev->of_node, "airoha,chip-scu");
+	if (!IS_ERR_OR_NULL(map))
+		return map;
+
+	if (!data->chip_scu_compatible)
+		return NULL;
+
+	return syscon_regmap_lookup_by_compatible(data->chip_scu_compatible);
+}
+
 int airoha_pinctrl_probe(struct platform_device *pdev)
 {
 	const struct airoha_pinctrl_match_data *data;
@@ -853,12 +869,9 @@ int airoha_pinctrl_probe(struct platform_device *pdev)
 	if (IS_ERR(pinctrl->regmap))
 		return PTR_ERR(pinctrl->regmap);
 
-	map = syscon_regmap_lookup_by_phandle(pdev->dev.of_node, "airoha,chip-scu");
-	if (IS_ERR_OR_NULL(map)) {
-		map = syscon_regmap_lookup_by_compatible(data->chip_scu_compatible);
-		if (IS_ERR(map))
-			return PTR_ERR(map);
-	}
+	map = airoha_pinctrl_chip_scu(dev, data);
+	if (IS_ERR(map))
+		return PTR_ERR(map);
 
 	pinctrl->chip_scu = map;
 
-- 
2.34.1


