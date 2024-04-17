Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5871CC04FFE
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 20:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vkJszbQYs1o414BkCnfzaobHDnZKDVd8xFkMWbtLTqM=; b=H9iqk1FolbsSJLtwWXE7FTUYus
	FpNQ5qkxf3k9LwrmVp3tsB2x3jInkZMN60mRUOZhbup7P4gf0F/FH5RhrwYyTbwNwlJNgdeExRezY
	eDT6QJop8v/iXHIlIYHFYWjN5Q94LNmOqrZnrMAuIUfxf+Vnr5w910hiKJ0iHcRvrFOJU0QjjAUTX
	hI73vtPzWlVj+ZwzOmMaEMFHiX2sstWL6IJrZ6yg5qrZciDNHfGIwudSp0zUVOLMW0cWEtw+9/T9P
	sT2vafxT7hkI5cJlwGxd/XZbm6n3dCe7iPGP9CjdMHDxrWxzwy/Be0DSlcH5RRwhJM6UcVVW9QUaC
	XRp5SAbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxBTO-0000000HQkY-2lFn;
	Wed, 17 Apr 2024 20:01:38 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxBTG-0000000HQdy-2Xw4
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Apr 2024 20:01:33 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-56e477db7fbso111528a12.3
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Apr 2024 13:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713384086; x=1713988886; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vkJszbQYs1o414BkCnfzaobHDnZKDVd8xFkMWbtLTqM=;
        b=NfGVgQIH5kbpaf30NUULgyqLLTfCRD0YARG4TuwZg15JqINXEHwuxk5FBxPTnUCLdv
         y95teDt4/tbK6+HXa28GMvXXXygYy6CafOIa4kNvkniFFH/MJGVC/7pYATH9Y7yInVQT
         /mVIQ/cpJM4aIUc2JOqKONiFjHzKyyOYOzZa0+vb1aBgyxcLpdx39t2eYLck2bNwL6GF
         4xEGbTKlJpp0f7aLP6QOQByiTD4nXJ1vjHklT/wmeLYBOHAoWbA2M4Tvm5ouJ0OmsXbP
         Roblc+SIp+gWgCw+T2Nv/g5A1j/e40W1nu+MS8Ga9qV3DbV0FVnrOf0SjB9lu/MSHeY0
         0wUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713384086; x=1713988886;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vkJszbQYs1o414BkCnfzaobHDnZKDVd8xFkMWbtLTqM=;
        b=Z1qz8E0jeUt13tn5eC4HHZ7IwK2csnPaCg9mrikPYfH/MJGG6BD+wdGb9QTrB8gjZV
         cEM0jEjE6lM7UxK8CaJDmw0LYYbSxt14HaFa4cL4fkNkIHxikWgzyYfCROgACZDDwIdz
         p2jh0AP7ZvlEfScqhGVELG9AJ/59SD4T0uOwDhBmrfcSsRpS6yOhA57RgvH+IoNqm9E7
         24w1E0s/X0HGFjRXcu5+hkrD0JRmk7gJJxF5HHpEtc/cuKO1vvtYO+sAvelTYZp5QOe2
         L17o/5swBUESKDmkqAxRyprEkFxZRhuAvE3v4485To7LagkI2qj6OiAnZA/GnuOVnEHx
         3OKw==
X-Forwarded-Encrypted: i=1; AJvYcCVgeuCxS+ptFPON6SW3rDFJU10NjCtvjoYLSJ6N1LQ4IF5vuV64sQAdxQjpSFKdaewlMDYhW/FW6TLhbUbF+Br3PzvbGUHhiwEZI5qyUBQedY7y
X-Gm-Message-State: AOJu0YzYo8TuFa83LFE88OXLT09n51eMCjdL4UDYkO1Ten6oU2lc7vIh
	e+RxTPbZkV7eOyGRlddUrcVPqTG1l7/K7gbs8tx+z4cCAf84Sga1nwPXodaktS8=
X-Google-Smtp-Source: AGHT+IFpQveQN0WrZ+igZQXQ/yZHaNlkS0Wb8UjbefxIeVkiBGAZDA+tfI2DaDqdb7B/J0ieeXhS+A==
X-Received: by 2002:a17:906:3108:b0:a52:408f:8575 with SMTP id 8-20020a170906310800b00a52408f8575mr323610ejx.12.1713384085598;
        Wed, 17 Apr 2024 13:01:25 -0700 (PDT)
Received: from [127.0.1.1] ([79.114.172.194])
        by smtp.gmail.com with ESMTPSA id gs6-20020a170906f18600b00a555ef55ab5sm939981ejb.218.2024.04.17.13.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 13:01:25 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 17 Apr 2024 23:00:55 +0300
Subject: [PATCH v10 3/7] spmi: pmic-arb: Fix some compile warnings about
 members not being described
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240417-spmi-multi-master-support-v10-3-5bc6d322e266@linaro.org>
References: <20240417-spmi-multi-master-support-v10-0-5bc6d322e266@linaro.org>
In-Reply-To: <20240417-spmi-multi-master-support-v10-0-5bc6d322e266@linaro.org>
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
 h=from:subject:message-id; bh=YI6kFnUdqCb3smm8drA7puqPY4IMwS3WgmIgWIqmjO4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmICqCsJCp5gvQLMFFQqhO6XcTbU8fTs4T/CIWa
 AXutDY5l12JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZiAqggAKCRAbX0TJAJUV
 VuoPEADFvtdR0eoFq683MWj9bQyN6Ev9lNZORhL83dK7WvbVw5uafRLMCnA8CU4fP3w0Kf9IL9L
 n2+Ur2s+mFLl3pmu4dirqFKWJ1LLsB6bMwwxQ6RiBOlZuzE4UPaRLlJmwHLqngTW/XYdYecjBuM
 FO+inXrw4Wdasn0e0h7YPAAgolDlPESnihqZbwn5ej+XRKWIEy38Wg4wMG0dm1dGs6tqAJkWa0B
 Z5mdv9QnJIkakiwkXsAEthf4EBpuT69ko6SfBIQXsvKVNGS5fYpYluyzj4kDbTxmldyCXiOWpwU
 4UTt6nDZ0e0703FBlPHnIFVxUEsyNP6XawDt/7b7XNRhhEXIrgOUzqT7WWPTPoP0xLD30VGatWp
 ScUxn6pqpbFo+eL7ARai0GUsGKnyLCESqSG3x7NOmpgJ7vHZ3TJuU893QVmpOnjIIBoENLLDJ/O
 yW0AQW+LokEnUW31ICYLlRdt4i8iJ5Hsr9eHd2CZ6Xr8p77O6bDVkp1vLmxElC5fdoR0aISE7pl
 5jMF3HaDzquGQRvE/yG7JHeCoSAeyIR4j/ZtlKR6Gvecd0HLQnIhYLq2crXtSIDWbrZdrbijulw
 2SpE9/SpxhZ8D9rkwLvWp46T0nGpFJrFgljjVD4M39zH9X+yKnjpyvWkaXV0FoCrFn/bKR1gXDS
 h3TrYgCKNQ5rzeQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_130130_701461_AE399CA3 
X-CRM114-Status: UNSURE (   9.30  )
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
index 937c15324513..12c0efd744c2 100644
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


