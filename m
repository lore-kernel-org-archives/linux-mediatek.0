Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B18860A3821
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 17:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CWNkUuCf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7lS+EIcXlCg6dJDyf8DgoQ18O18IVBFyUh/28ceN0+E=; b=CWNkUuCfyWL8S+
	DO9z9vjvqL0NHpltt01Ph+83AO0c8mKwR7y5BxkQ3RdQC+kJ3W4z4gQTeBcJW/B3uVFCfqb+SFKsW
	TrS2RThBn2V1KTazN7R5jL+htLjKldhZPV1j68svSGzD3toK75TfIrhPTDEthIw8KiFYeusZSrCvs
	vuJ9vF2nYtJ0RMcfF2U8nqHFOnYl/68WO2++5s04hjulNAZUR/7MHiN2MWw0aZ+41h23ep/yzn+NZ
	rpcG41l//9+TcB4LmOw7UEocwaXmy7ORUSd0niEIOaAhloaKX99YTk3IrtEf84NpH6RzpBeLmu2jD
	4fAfwPhcn43lg6zy+9Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQppA-00000004hZ6-08Ig;
	Tue, 10 Nov 2026 17:40:00 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQpp5-00000004hU1-2qUx
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Nov 2026 17:39:57 +0000
Received: from [2a04:4540:1403:9bfc:b113:5373:d0ec:2ad1] (helo=bertha10..)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xQpoz-001CWh-1q;
	Tue, 10 Nov 2026 18:39:49 +0100
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
Subject: [PATCH 4/7] pinctrl: airoha: mux a requested GPIO through the IOMUX
Date: Tue, 10 Nov 2026 18:39:38 +0100
Message-Id: <20261110173941.301478-5-john@phrozen.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110173941.301478-1-john@phrozen.org>
References: <20261110173941.301478-1-john@phrozen.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_093955_742157_F06EF956 
X-CRM114-Status: GOOD (  11.80  )
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

On a SoC with an IOMUX block every pin turns into a GPIO with one mode
value, mode 0 on the AN7589. Add that value to struct
airoha_pinctrl_iomux and write it when gpiolib requests a pin, so no
SoC needs a gpio function with one group per pin.

Without an IOMUX the callback does nothing, so the existing SoCs keep
their explicit gpio functions and their behavior.

Signed-off-by: John Crispin <john@phrozen.org>
---
 drivers/pinctrl/airoha/airoha-common.h  |  1 +
 drivers/pinctrl/airoha/pinctrl-airoha.c | 14 ++++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/pinctrl/airoha/airoha-common.h b/drivers/pinctrl/airoha/airoha-common.h
index 7a0cb8924e71..adfce89493f0 100644
--- a/drivers/pinctrl/airoha/airoha-common.h
+++ b/drivers/pinctrl/airoha/airoha-common.h
@@ -111,6 +111,7 @@ extern const struct airoha_gpiochip_regs airoha_gpiochip_regs_64;
 
 struct airoha_pinctrl_iomux {
 	u8 mode_bits;
+	u8 gpio_mode;
 };
 
 struct airoha_pinctrl_confs_info {
diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 9116d3ded258..a805f542bc7b 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -430,6 +430,19 @@ static int airoha_pinmux_set_pin_modes(struct airoha_pinctrl *pinctrl,
 	return 0;
 }
 
+static int airoha_pinmux_gpio_request_enable(struct pinctrl_dev *pctrl_dev,
+					     struct pinctrl_gpio_range *range,
+					     unsigned int pin)
+{
+	struct airoha_pinctrl *pinctrl = pinctrl_dev_get_drvdata(pctrl_dev);
+
+	if (!pinctrl->iomux_info)
+		return 0;
+
+	return airoha_pinmux_set_pin_mode(pinctrl, pin,
+					  pinctrl->iomux_info->gpio_mode);
+}
+
 static int airoha_pinmux_set_mux(struct pinctrl_dev *pctrl_dev,
 				 unsigned int selector,
 				 unsigned int group)
@@ -510,6 +523,7 @@ static const struct pinmux_ops airoha_pmxops = {
 	.get_functions_count = pinmux_generic_get_function_count,
 	.get_function_name = pinmux_generic_get_function_name,
 	.get_function_groups = pinmux_generic_get_function_groups,
+	.gpio_request_enable = airoha_pinmux_gpio_request_enable,
 	.gpio_set_direction = airoha_pinmux_set_direction,
 	.set_mux = airoha_pinmux_set_mux,
 	.strict = true,
-- 
2.34.1


