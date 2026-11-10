Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327F660A3817
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 17:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fWR1u/rr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=C/CW9UeKb6nIJKTf8Z9vYcXmdOZkRzveAetbAoCHv0Y=; b=fWR1u/rrxKo750
	L88VdElSfHXYwnc83/0eZtQNuQWDvBrtCDKS7i2gfGdgxCy+vkNLGqFCF/O7g7RjVaKvmJlrX81oV
	OwEtZHvP9JRu4bA+QPwVfmEw6ccH8kpNxxd0s135dc9UmkjXf4YSyWknEVttbwhcWLvmk6pXHRxiZ
	YG3YFWRnYx121NRWQDMLCZ75v28Qr18gV1K7h51yM3EHXvwe7mHlDRyTyL36DlytmdVRG6UoCdDk2
	hTEDrBwJeR5tN89R8dAA7enO69cflkytI2ZfKaKj2rV1xZzDEVLGKAWg8KDP6OcNtepwqDvGc3UfN
	S71+V+hNS8lm3ViX2wbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQpp9-00000004hYl-3gly;
	Tue, 10 Nov 2026 17:39:59 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQpp5-00000004hTm-19NQ
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Nov 2026 17:39:56 +0000
Received: from [2a04:4540:1403:9bfc:b113:5373:d0ec:2ad1] (helo=bertha10..)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xQpoy-001CWh-2R;
	Tue, 10 Nov 2026 18:39:48 +0100
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
Subject: [PATCH 2/7] pinctrl: airoha: add per pin mode field mux
Date: Tue, 10 Nov 2026 18:39:36 +0100
Message-Id: <20261110173941.301478-3-john@phrozen.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110173941.301478-1-john@phrozen.org>
References: <20261110173941.301478-1-john@phrozen.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_093955_314243_67C1F648 
X-CRM114-Status: GOOD (  18.02  )
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

Newer Airoha SoCs select the function of a pin through a mode field in
a dedicated IOMUX block instead of through function specific bits in
the chip SCU. The AN7589 has a 4 bit field per pin, eight pins per 32
bit register. A group can then need one register write per pin, and
the two entry regmap[] of a function group cannot carry that.

Let a function group supply a pin_modes[] array, parallel to the pins
of the group. When it is set, set_mux writes each mode into the IOMUX
regmap and then applies the regmap[] entries of the group, so a group
can combine its pin modes with a register write in the GPIO block.

A SoC with an IOMUX describes it in its match data with struct
airoha_pinctrl_iomux, which holds the width of the mode field. Probe
then takes the regmap from the airoha,iomux phandle.

No functional change for the existing SoCs.

Signed-off-by: John Crispin <john@phrozen.org>
---
 drivers/pinctrl/airoha/airoha-common.h  | 14 ++++++++
 drivers/pinctrl/airoha/pinctrl-airoha.c | 48 +++++++++++++++++++++++++
 2 files changed, 62 insertions(+)

diff --git a/drivers/pinctrl/airoha/airoha-common.h b/drivers/pinctrl/airoha/airoha-common.h
index 850e733db15a..7a0cb8924e71 100644
--- a/drivers/pinctrl/airoha/airoha-common.h
+++ b/drivers/pinctrl/airoha/airoha-common.h
@@ -49,6 +49,12 @@
 		.group_size = ARRAY_SIZE(table##_func_group),		\
 	}
 
+#define PINCTRL_MODE_FUNC_GROUP(id, table)				\
+	{								\
+		.name = id,						\
+		.pin_modes = table##_modes,				\
+	}
+
 #define PINCTRL_CONF_DESC(p, offset, mask)				\
 	{								\
 		.pin = p,						\
@@ -75,6 +81,7 @@ struct airoha_pinctrl_func_group {
 		u32 val;
 	} regmap[2];
 	int regmap_size;
+	const u8 *pin_modes;
 };
 
 struct airoha_pinctrl_func {
@@ -102,6 +109,10 @@ struct airoha_gpiochip_regs {
 
 extern const struct airoha_gpiochip_regs airoha_gpiochip_regs_64;
 
+struct airoha_pinctrl_iomux {
+	u8 mode_bits;
+};
+
 struct airoha_pinctrl_confs_info {
 	const struct airoha_pinctrl_conf *confs;
 	unsigned int num_confs;
@@ -126,6 +137,8 @@ struct airoha_pinctrl {
 	const struct airoha_pinctrl_confs_info *confs_info;
 
 	struct regmap *chip_scu;
+	struct regmap *iomux;
+	const struct airoha_pinctrl_iomux *iomux_info;
 	struct regmap *regmap;
 
 	struct gpio_chip gpiochip;
@@ -135,6 +148,7 @@ struct airoha_pinctrl {
 
 struct airoha_pinctrl_match_data {
 	const char *chip_scu_compatible;
+	const struct airoha_pinctrl_iomux *iomux_info;
 	const char *pinctrl_name;
 	struct module *pinctrl_owner;
 	const struct airoha_gpiochip_regs *gpio_regs;
diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index b50108826d8d..f9ae4020b764 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -401,6 +401,35 @@ static int airoha_pinctrl_add_gpiochip(struct airoha_pinctrl *pinctrl,
 }
 
 /* pinmux callbacks */
+static int airoha_pinmux_set_pin_mode(struct airoha_pinctrl *pinctrl,
+				      unsigned int pin, u8 mode)
+{
+	unsigned int mode_bits = pinctrl->iomux_info->mode_bits;
+	unsigned int modes_per_reg = sizeof(u32) * BITS_PER_BYTE / mode_bits;
+	unsigned int shift = (pin % modes_per_reg) * mode_bits;
+	unsigned int reg = (pin / modes_per_reg) * sizeof(u32);
+
+	return regmap_update_bits(pinctrl->iomux, reg,
+				  GENMASK(mode_bits - 1, 0) << shift,
+				  mode << shift);
+}
+
+static int airoha_pinmux_set_pin_modes(struct airoha_pinctrl *pinctrl,
+				       const struct group_desc *grp,
+				       const u8 *modes)
+{
+	int i, err;
+
+	for (i = 0; i < grp->grp.npins; i++) {
+		err = airoha_pinmux_set_pin_mode(pinctrl, grp->grp.pins[i],
+						 modes[i]);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
 static int airoha_pinmux_set_mux(struct pinctrl_dev *pctrl_dev,
 				 unsigned int selector,
 				 unsigned int group)
@@ -431,6 +460,15 @@ static int airoha_pinmux_set_mux(struct pinctrl_dev *pctrl_dev,
 		if (strcmp(group->name, grp->grp.name))
 			continue;
 
+		if (group->pin_modes) {
+			int err;
+
+			err = airoha_pinmux_set_pin_modes(pinctrl, grp,
+							  group->pin_modes);
+			if (err)
+				return err;
+		}
+
 		for (j = 0; j < group->regmap_size; j++) {
 			switch (group->regmap[j].mux) {
 			case AIROHA_FUNC_PWM_EXT_MUX:
@@ -824,6 +862,16 @@ int airoha_pinctrl_probe(struct platform_device *pdev)
 
 	pinctrl->chip_scu = map;
 
+	if (data->iomux_info) {
+		map = syscon_regmap_lookup_by_phandle(dev->of_node,
+						      "airoha,iomux");
+		if (IS_ERR(map))
+			return PTR_ERR(map);
+
+		pinctrl->iomux = map;
+		pinctrl->iomux_info = data->iomux_info;
+	}
+
 	/* Init pinctrl desc struct */
 	pinctrl->desc.name = data->pinctrl_name;
 	pinctrl->desc.owner = data->pinctrl_owner;
-- 
2.34.1


