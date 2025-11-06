Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 841A7CCFA13
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Nov 2025 19:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UC7o/Lm5tysqi1r/QiS1zppEaC6hX+4dTRHAwtxyreU=; b=ZosurFgW30bYgf+P8iJeJ6W4+W
	4aU5vgGU9YaeH09hYSG4mx86yDj0S670hBX07Yq1/KWzpauKeSQsIQ2q/yJUm1mg/f41DbSwX0Lk1
	MdEYQ85SVuuCtcnw8713Q6yNiZZQbHQ2qV13vMwwVWd9KfM2mRG7r+otKQKBhnJf/2Z9VYBsNIK6n
	ZfCHayoCuT654kvLvtYhIalQK5jvG52+fZ6pMGqN86FIGIP/AR2j518dg96HZ8HoRePitDTHvzfrl
	+4IW2PexpMPAVldVdQQa51mJ5lX+WsFZfv37hAJQPIjCvpLtf4Nk7zMZcwSWzZKCUA4TkU8Kt+ZzY
	h+AwFtTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH5LD-0000000G7wT-1zDt;
	Thu, 06 Nov 2025 19:08:15 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH5LA-0000000G7td-0GCy
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Nov 2025 19:08:13 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b7273abc418so16701966b.1
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Nov 2025 11:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762456090; x=1763060890; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UC7o/Lm5tysqi1r/QiS1zppEaC6hX+4dTRHAwtxyreU=;
        b=n9lPkElk9ByBp0vkoEMF0g1Nsa1tOFq4OdvW8y5d0E4gIvaFxxdCRhKNJ/1XISKBUX
         Yqvmmg5lLUtXtMgC6krHqXdQ2VvsdHmak56Zp7sf55aRVt7VvCXtJ5sdK9oQf1FnC0mZ
         WrhAyrjOeT0ZDnThye7X/1rlx4YUgIsfe8O0xV3J65tNsganyHP1hX3BGe39F0rAMNIg
         VecEA/QJxuxjqIDovVUo8YJM7iypVYBxQS157OBBuUF0kohXXBgJykrN7R8sHgsUcJQT
         DbZekHv/z8KTyUKZFCCDDHmrwnV80X8FZA19Wayp9wsZY3cJ5plZanQnP2R0qZ3TwFgb
         45Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762456090; x=1763060890;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UC7o/Lm5tysqi1r/QiS1zppEaC6hX+4dTRHAwtxyreU=;
        b=aIZlyic+fbgG5JYHiEJfWpt902qXRlpoVu143U6cN7bRA22KjZm84Q8uYCfkjUz4Ax
         DPOGBaO9BQBlsUZwSwUPvguyCqAhZe54QXwoVMSjWE9MYQuGT6NWA9Z39ISRfXfsS1wJ
         A98ZJmJzBUL8ENMQQO/u6ransX2ycImy8Z6lcm2zv4IlJb8uVfU1Np0Cx3eLHuJ34SDT
         757GbSX9GHoUnfRpIGSk6Q0jhjYvoj2SW8KnJRrHfVuBVvQnMMMkGVzwJBZ3u+K7VtFL
         5Wi8ARTNXhhj0LoP9PvceGw08xpkGLqdk1NjjYcXKhlQFji/Qz7S+IkA2/pLJ10tsjMw
         2bZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEWRD9TzrkXLbvtvaVsjR5tm6+StOtHwrqtiyV8GNcRX8b+Cqhi322KGbdS7wQpqR4Q12WtCexNHpvhKHASQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9ZzrtA2GPIedVw1wqRsjONaC/hjkpZqFcEpxTBvUG8viMhxaO
	pYzYBL+sv2d9JBQadVsDbd4Gk6JfKsmXFjUegSxD3zlrNuJJ/bvoVBjNygxVoM7iSGE=
X-Gm-Gg: ASbGnctZ3k+PwoC6UEfs9myuABMlPz+fjP9WCiS/jZS+iD56Hb1GV64PPy9lz6bdZ4q
	NU39kR6F/xOBnaAGQO+4Q60gk60ntLu1qeaq73DsyalIYFEZVn27ERxj7/0WrScxe2KZOpGEzrc
	yIx0IrVLb4DsYxPM2m2gx3Vzr+dFbossSZTC4mLOEDhhebJXU3uYvgiP2oICcJPULuFs+WHi3aC
	3OeNiDu5jAymhdMRNDukowgOcFetgcoxT995wCO0sMinMxSX409jlknUDPK7U5PbXqK5+RVgjKx
	VPl49PqRgjqOdpcWRw95WPm0iQmMFv7mikuEepEC0XjqzQsCwZWuXqV8OqB+xKGraTRKUy8pv5L
	u6LCzV044H8OyMH0PFi7pstbRUUGl2oeJh5WR8gXGqvlbVo8c+GvXsneqfL010xPbrwXnkJCHmv
	DGn1iuwpapaLGpc/PlO6hOtSorUSM=
X-Google-Smtp-Source: AGHT+IH4u0visRizZo2d3rYJCHF6DFTUhu6yOMzJeaTU5w4S3ldRzQL6ooWntCfuedndsflKkieXmA==
X-Received: by 2002:a17:907:1c01:b0:b6a:382a:1516 with SMTP id a640c23a62f3a-b72c0d52bf6mr17951666b.5.1762456090174;
        Thu, 06 Nov 2025 11:08:10 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bfa2510esm26739566b.72.2025.11.06.11.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 11:08:09 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 06 Nov 2025 20:07:08 +0100
Subject: [PATCH 01/13] of: Add wrappers to match root node with OF device
 ID tables
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-b4-of-match-matchine-data-v1-1-d780ea1780c2@linaro.org>
References: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
In-Reply-To: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-tegra@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3693;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=O33tzwOMuFzj5je6ou6p3VavVz9CrO7CoaSioDAC7d0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpDPIJjcqOIsRPKVtKm1n48qkLFTKl0iTeRLJML
 O0ig2VobJSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaQzyCQAKCRDBN2bmhouD
 16upD/0ZvU0jba0Dx7VybPnYT2mGXlqQGiRbmnASkWMky8rIi6Sp8RSTLDhpclz2LmVx2skpz9v
 0r6fP/FAMEFShI7EOBA+3f2t6USlukHdnPVV5xooagFdsMEyVL6+LwbgBm0f51zE6VM/tdjSDvM
 lCVONspGTJH1L/sttThdI2ovYpqbZYDhIgRcyLipKeWZte4YfeSzgnv3mOsaZFNFZKNt1Y8jn5q
 lAnXZCY6RgamYZplen5FS1RlMwii6jqAT4iMGTBELYGQSe4sB6WFyV4jpa5ZvU6gKmSjgMPVrAa
 u+SHuX1DmTVBI+iqI+OHv0K5lS2PQIvbQOYEI1nVsSxLPQj3FZDmO2dIMvtZq/A1xk150fjigAN
 IXNMW7CdnSTV4oloo/K2XJKpIqVWKtkjEMeQz8y3d7z+i9ufMn+SvYkCQwhDWwr26gkfEIHxLRd
 GcS4JoNkEeK1NPDp1DJsvbGwTtKcfxX5AE/GI11SX5KqZmCOcZfsh3AxXQsI6q/r/HIoj0pWGr/
 aawjN/1UsCSiEDwm7T0yFZgc40VQp5wqrhuIZclvDr0ycCO6vt4LEFykBHRt5xA27HSsxSWVT35
 oEZvCZypUBmVZTUMfjm3P2tcxblSskFAWSXealeXfawQqRW3usvcwdwSGsJ4wz1RkezOFDOI08h
 PmOXu5HeggsWkCw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_110812_144976_33EF9FFC 
X-CRM114-Status: GOOD (  15.93  )
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

Several drivers duplicate same code for getting reference to the root
node, matching it against 'struct of_device_id' table and getting out
the match data from the table entry.

There is a of_machine_compatible_match() wrapper but it takes array of
strings, which is not suitable for many drivers since they want the
driver data associated with each compatible.

Add two wrappers, similar to existing of_device_get_match_data():
1. of_machine_device_match() doing only matching against 'struct
   of_device_id' and returning bool.
2. of_machine_get_match_data() doing the matching and returning
   associated driver data for found compatible.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

All further patches depend on this.
---
 drivers/of/base.c  | 47 +++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/of.h | 13 +++++++++++++
 2 files changed, 60 insertions(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 7043acd971a0..0b65039ece53 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -434,6 +434,53 @@ bool of_machine_compatible_match(const char *const *compats)
 }
 EXPORT_SYMBOL(of_machine_compatible_match);
 
+/**
+ * of_machine_device_match - Test root of device tree against a of_device_id array
+ * @matches:	NULL terminated array of of_device_id match structures to search in
+ *
+ * Returns true if the root node has any of the given compatible values in its
+ * compatible property.
+ */
+bool of_machine_device_match(const struct of_device_id *matches)
+{
+	struct device_node *root;
+	const struct of_device_id *match = NULL;
+
+	root = of_find_node_by_path("/");
+	if (root) {
+		match = of_match_node(matches, root);
+		of_node_put(root);
+	}
+
+	return match != NULL;
+}
+EXPORT_SYMBOL(of_machine_device_match);
+
+/**
+ * of_machine_get_match_data - Tell if root of device tree has a matching of_match structure
+ * @matches:	NULL terminated array of of_device_id match structures to search in
+ *
+ * Returns data associated with matched entry or NULL
+ */
+const void *of_machine_get_match_data(const struct of_device_id *matches)
+{
+	const struct of_device_id *match;
+	struct device_node *root;
+
+	root = of_find_node_by_path("/");
+	if (!root)
+		return NULL;
+
+	match = of_match_node(matches, root);
+	of_node_put(root);
+
+	if (!match)
+		return NULL;
+
+	return match->data;
+}
+EXPORT_SYMBOL(of_machine_get_match_data);
+
 static bool __of_device_is_status(const struct device_node *device,
 				  const char * const*strings)
 {
diff --git a/include/linux/of.h b/include/linux/of.h
index 121a288ca92d..01bb3affcd49 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -407,6 +407,8 @@ extern int of_alias_get_id(const struct device_node *np, const char *stem);
 extern int of_alias_get_highest_id(const char *stem);
 
 bool of_machine_compatible_match(const char *const *compats);
+bool of_machine_device_match(const struct of_device_id *matches);
+const void *of_machine_get_match_data(const struct of_device_id *matches);
 
 /**
  * of_machine_is_compatible - Test root of device tree for a given compatible value
@@ -855,6 +857,17 @@ static inline bool of_machine_compatible_match(const char *const *compats)
 	return false;
 }
 
+static inline bool of_machine_device_match(const struct of_device_id *matches)
+{
+	return false;
+}
+
+static inline const void *
+of_machine_get_match_data(const struct of_device_id *matches)
+{
+	return NULL;
+}
+
 static inline bool of_console_check(const struct device_node *dn, const char *name, int index)
 {
 	return false;

-- 
2.48.1


