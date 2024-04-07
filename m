Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB35BCD11C2
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Apr 2024 16:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vscs/vp4w/DCCZB4T9EYacJgn/oMnEE7t/RUrWC0J30=; b=V7X4yR7qWLT8RmQNlZbobyUw2R
	hTOKeMUAY3yzS4BtAKHnK+TUbXLmb0pJRqoDkHNO2odxtvardX7oFdMKJthQDfrQn+a21o7ISrMwB
	zwe05FD37COxkc1CzRCOQ2bDnWjDnqEYfHSHCZxpMlBHvejM/ht16enQ6P0ZoDLsGICH5C5lXHPhC
	h72Wr6z5W9su2wH9rGtfiL1aIaKHLmLc8AwlmCMDm7NKZ9VVE0F+Uz4Odu5m0RiwEN5DKPK2noGbF
	LqZO/R6akVGR3C9aSaBTuIw0okxF6QA+gSXJ3NagZOicXZJlomRZY4th2tAmhiYUhLnZ5BP95MXJ/
	5bjYQrig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtVJP-0000000CzbB-3l9h;
	Sun, 07 Apr 2024 16:24:07 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtVJ7-0000000CzM9-0GG7
	for linux-mediatek@lists.infradead.org;
	Sun, 07 Apr 2024 16:23:51 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-516d1ecaf25so3465916e87.2
        for <linux-mediatek@lists.infradead.org>; Sun, 07 Apr 2024 09:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712507025; x=1713111825; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vscs/vp4w/DCCZB4T9EYacJgn/oMnEE7t/RUrWC0J30=;
        b=cbQ8EsLW7WqP00DchM8Hbfkjvwao0BioYzTDJS8cWW0v65iXV5pwvB4Qn7D6QRGmjn
         g2V2GQ8O2Bem75dWjJ9l4qgYhq3O3flRPBhLeEZtGsUIdSDMUe075URRvCzM42BGFwRE
         o4nSO08kAxdolA5HH39n9lDynNieM6GiwPXsH3BwDC3VKIz72Zb/ixbg4KUJgPKSVJnI
         bUv6IzmON9SGG7qPqeghcwK0/Me4wlPsk0epW1vnVKJNllHwdeNJ3uuz6sUWJdfQn5wq
         nLK0jA+uR8R+QnGa72/GA/6ph9Fa1OakqMXjOYR9hQwIondHYBAnd4imQm8XMHb3jgrV
         vv5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712507025; x=1713111825;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vscs/vp4w/DCCZB4T9EYacJgn/oMnEE7t/RUrWC0J30=;
        b=MmXGFdbyy9Jc1LgW6ewOWN2G2rAbviI5YFrJ5AIT4bLcANSdCWd42qLTTxAzdaqBWl
         0T3hZChkz7/qzCy+4D2QxPlM44VDTvJ9FSmtVKKq1OIPYG7xc+sxu66yMkqxozdT4jlN
         OePGW5ubWywJVzO84WZmn6zmo3NF/5TMPnQCpg+MDXICb26I5ONx+fOAHa/YAM1tE3ig
         BqbZyJq5i8R7kiGl8ThffNLy850z4GdffBEvJOe/DXkq5pKosTY9cDHqo+cd0URMmSYJ
         P2LrrBlWFQZaj4NtGXVHRZa4i2ax4DLCcJsLQEBnmqLeIE/ZzDNpU351gl5SgmD2nz5y
         WgnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWQLBiqh5m7tsPx1c+czCl0//1Uf6VvZeFQqqpXddKc9YYxfd2AgZ7xQh177fqPlTtuGzLhFeK5Qn8Mou3ltAnQLwIjHZzG/O4/A259fVH8mXU
X-Gm-Message-State: AOJu0YxBkwV3lad872p//jAotq1FjZxvWJ9bPCC3C/FrpNsVXG+RKv+G
	1GwqM2CKKt0i6GYFCY1z7Wk/rUv/XMiNqsI0noKealbKUFOPxdvI9eK/tczkGy8=
X-Google-Smtp-Source: AGHT+IFTroclcEILQ+ze+mBcd9b3SxEaZM09rIp/V8POCBbv5tIoL3icq37ZZdxfWFkBbAy1JYVerw==
X-Received: by 2002:a05:6512:475:b0:516:c1b9:22e9 with SMTP id x21-20020a056512047500b00516c1b922e9mr4454812lfd.17.1712507025226;
        Sun, 07 Apr 2024 09:23:45 -0700 (PDT)
Received: from [127.0.1.1] ([79.114.172.194])
        by smtp.gmail.com with ESMTPSA id qs28-20020a170906459c00b00a51bed388a4sm1811626ejc.139.2024.04.07.09.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 09:23:44 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Sun, 07 Apr 2024 19:23:23 +0300
Subject: [PATCH v9 3/7] spmi: pmic-arb: Fix some compile warnings about
 members not being described
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240407-spmi-multi-master-support-v9-3-fa151c1391f3@linaro.org>
References: <20240407-spmi-multi-master-support-v9-0-fa151c1391f3@linaro.org>
In-Reply-To: <20240407-spmi-multi-master-support-v9-0-fa151c1391f3@linaro.org>
To: Stephen Boyd <sboyd@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Johan Hovold <johan@kernel.org>, David Collins <quic_collinsd@quicinc.com>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2479; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=FYDSYbmfadGmbe6XpAJqrRrZBX6gmScLt/RVQz821d8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmEsiE01RcIzvn1/GAP/pGKGg17V5zKKsmiEOUp
 BIJQ/dwspmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZhLIhAAKCRAbX0TJAJUV
 VietD/0YfHXAxrcZlJBMPjukOj1ghQjxodW3aC8xQgQLao5CTb7h1UPdxdMgsa5J1leJN/ag0L8
 4/65veby6zyHkMUCo7J/AP3VM3s0CJj9QjSH4c8/rh2rIfrl8qO9lFidlG8SBVBEhWQQSgHZd4N
 +be1VE0ntdVuBO3KqD2NEgk7vxERBfFai1XeLkNOyP7uSIT+arBNUmjYCsHxdWgj4/odjfF5Wtm
 oBEpPl7+o8eYvBIGiRNRW/Y7WYZmMwjUzK42OwbedJiRtjbJ+CFcfmfA6nwZGL3buwnSs+ON6S+
 yvXi/JmJVcmhpr6aoAF+VbtkWv+FZoFO95Sf7litHpDOxefMCZ/gDGj11UhfKxItIe+//FvtE4Y
 3cZ0kRadZgqv2HrVB7a4Ob8DnJ70aYyysKJyUjWg44eNOklLri+NAELM1c2X8d5gl/vwhCSl/8f
 dkVADc0iagQwCBgyNSFR7I1Ls6OYb36lK7IDy1bsszlLwgWmgybCa+56Hskgot8PS8IOfxmFue/
 GnXgwV9Fon6AHXclEdY1wACkUqPfl/Z70Qq1DCbSomiI6Cd6y7AFZ4dk8bVwm5S1sEzBeB2Zjvi
 o3O1tKwABdyXM3UV9pWDh3GRDyHIrrw7oYfe9n+2XpAfJLauzrBUgWh6Lvgz6U/bTYCJTM3imW4
 erkidpCuwZu41Bg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240407_092349_154175_E64715BC 
X-CRM114-Status: UNSURE (   9.06  )
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

Fix the following compile warnings:

 warning: Function parameter or struct member 'core' not described in 'spmi_pmic_arb'
 warning: Function parameter or struct member 'core_size' not described in 'spmi_pmic_arb'
 warning: Function parameter or struct member 'mapping_table_valid' not described in 'spmi_pmic_arb'
 warning: Function parameter or struct member 'pmic_arb' not described in 'pmic_arb_read_data'
 warning: Function parameter or struct member 'pmic_arb' not described in 'pmic_arb_write_data'

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/spmi/spmi-pmic-arb.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
index 9ed1180fe31f..704fd4506971 100644
--- a/drivers/spmi/spmi-pmic-arb.c
+++ b/drivers/spmi/spmi-pmic-arb.c
@@ -132,6 +132,8 @@ struct apid_data {
  * @wr_base:		on v1 "core", on v2 "chnls"    register base off DT.
  * @intr:		address of the SPMI interrupt control registers.
  * @cnfg:		address of the PMIC Arbiter configuration registers.
+ * @core:		core register base for v2 and above only (see above)
+ * @core_size:		core register base size
  * @lock:		lock to synchronize accesses.
  * @channel:		execution environment channel to use for accesses.
  * @irq:		PMIC ARB interrupt.
@@ -144,6 +146,7 @@ struct apid_data {
  * @apid_count:		on v5 and v7: number of APIDs associated with the
  *			particular SPMI bus instance
  * @mapping_table:	in-memory copy of PPID -> APID mapping table.
+ * @mapping_table_valid:bitmap containing valid-only periphs
  * @domain:		irq domain object for PMIC IRQ domain
  * @spmic:		SPMI controller object
  * @ver_ops:		version dependent operations.
@@ -232,6 +235,7 @@ static inline void pmic_arb_set_rd_cmd(struct spmi_pmic_arb *pmic_arb,
 
 /**
  * pmic_arb_read_data: reads pmic-arb's register and copy 1..4 bytes to buf
+ * @pmic_arb:	the SPMI PMIC arbiter
  * @bc:		byte count -1. range: 0..3
  * @reg:	register's address
  * @buf:	output parameter, length must be bc + 1
@@ -246,6 +250,7 @@ pmic_arb_read_data(struct spmi_pmic_arb *pmic_arb, u8 *buf, u32 reg, u8 bc)
 
 /**
  * pmic_arb_write_data: write 1..4 bytes from buf to pmic-arb's register
+ * @pmic_arb:	the SPMI PMIC arbiter
  * @bc:		byte-count -1. range: 0..3.
  * @reg:	register's address.
  * @buf:	buffer to write. length must be bc + 1.

-- 
2.34.1


