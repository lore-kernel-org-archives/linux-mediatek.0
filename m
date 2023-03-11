Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B8AC6FD1F
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Mar 2023 11:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HfgCmRHhyuo5ShiG6WferUkA8idmPyC77QHmmLyRsDA=; b=QxtxqjWaogy+fGhkjxGA2ZdGVL
	hcxbtzB7N7MQcMPs41yPabhLWHVEIuu5VnWl7Fdpp87lIZ3TTkUz/GYoxH1tcuUjZW4iHiYa1sPH0
	UYky3OPvtNXvkf/aKLW65VcPFjkGYtDIOm1z3ObECmVzVpxM8i0w64usA2mgF0TsDzFNjDPN3bbM9
	lpdj/bNMXvL897MDN4F7Ll4TsI6Z7OPkXcN91Q5NX2Xi1SxeK2f6ZqdZ7O4pe0L2g3kU0ol4zFFvi
	v/Vq71j8NGF8PN/JBOG+I+Zfo2Q2bjlo6fSEOVw1LocYY3ty2b/LmY2Vwy27zldKNLjeh1aWDaJe5
	P6Ii6A1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paxFJ-000HNE-SP; Sat, 11 Mar 2023 11:18:41 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paxAt-000F6f-Iy
	for linux-mediatek@lists.infradead.org; Sat, 11 Mar 2023 11:14:10 +0000
Received: by mail-ed1-x52a.google.com with SMTP id y4so1268502edo.2
        for <linux-mediatek@lists.infradead.org>; Sat, 11 Mar 2023 03:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678533246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HfgCmRHhyuo5ShiG6WferUkA8idmPyC77QHmmLyRsDA=;
        b=Ai+YLS2y4PGHC/9uJ4BYXqU5tqHi1DFst28xlaZKWWk9gVF3EsLVrdL0yWig3YEsEi
         gnXeHIs3lmu0ACB//f1T0iLrRF8wPLkXBAnIFeExpOIJk9VaIMaYY8CvoHCS+8XGfrt4
         pWgDo7akzGrq9lBaPKCziSeN3YuM6vHTc7MJyDymuOK6hNCvTC/oE2zIartOpjjoQ4YH
         0xU4yzxssXi+MKm1fODdikQ7QG4RhDRP/Pw8TpTZFwZxM2/FuGv+JOfajSbPAUKTB5T7
         16knGigsXQVyzxrjTtuDqUe0m7Wj2NDqNVGOrVSdkocENqWx9qk4betrEFkRoIfeSSBC
         3vzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678533246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HfgCmRHhyuo5ShiG6WferUkA8idmPyC77QHmmLyRsDA=;
        b=t1/8LHkhXxISWthjofFPqx3kH8lCTHLKep1l8YsM0dS6z1mzH+lIO3NSk6NuBin+Ia
         TJsw7QJtRu2wubN6i0+80GvvBtJUyrBHfTUJGI7GdSNVhsk3l2ZE/69R0x0UJSgAo2pd
         cc4o9kixVQ5/X3xwySVHCVKm1/m8vZBd6tRWbqk5ndJf+CpIHvFYGWQyG9IxPjQ4AV2k
         LysYOtYMj/rVriY0JOB1HV4A5UcxxKZpCUQnLaQCfP/FH620NIkN62qWeeV1o80T5aGQ
         wAYYVpqCu2cGeh7gavH4nyttlKe7+WGTYI8rUYLgKa3NSNeWigGQq8Th0/HLpL0iCUnb
         CPJg==
X-Gm-Message-State: AO0yUKVuw3mt52Dux6EhDRa648M6+i+hlxACNjr6YfA8kGhbJWtEIuH1
	71ktHmcx/rW29Gk21fW46o1s8A==
X-Google-Smtp-Source: AK7set8PoInSY9NcKc9iYDRrupBgkkVpQ/KTRtw7UUXM703e5cPSAELCnEraa7b6ZjIBERltsVtOIA==
X-Received: by 2002:a17:906:948f:b0:8f6:c7cc:92ad with SMTP id t15-20020a170906948f00b008f6c7cc92admr30328442ejx.43.1678533246400;
        Sat, 11 Mar 2023 03:14:06 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:fa97:2d7c:bdd7:e1b])
        by smtp.gmail.com with ESMTPSA id q12-20020a50c34c000000b004bf2d58201fsm1053859edb.35.2023.03.11.03.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 03:14:06 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/4] Bluetooth: hci_qca: mark OF related data as maybe unused
Date: Sat, 11 Mar 2023 12:13:53 +0100
Message-Id: <20230311111354.251316-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230311111354.251316-1-krzysztof.kozlowski@linaro.org>
References: <20230311111354.251316-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_031407_650373_46AD8497 
X-CRM114-Status: GOOD (  11.50  )
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

The driver can be compile tested with !CONFIG_OF making certain data
unused:

  drivers/bluetooth/hci_qca.c:1869:37: error: ‘qca_soc_data_wcn6750’ defined but not used [-Werror=unused-const-variable=]
  drivers/bluetooth/hci_qca.c:1853:37: error: ‘qca_soc_data_wcn3998’ defined but not used [-Werror=unused-const-variable=]
  drivers/bluetooth/hci_qca.c:1841:37: error: ‘qca_soc_data_wcn3991’ defined but not used [-Werror=unused-const-variable=]
  drivers/bluetooth/hci_qca.c:1830:37: error: ‘qca_soc_data_wcn3990’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/bluetooth/hci_qca.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 3df8c3606e93..a199ed52d76d 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1827,7 +1827,7 @@ static const struct hci_uart_proto qca_proto = {
 	.dequeue	= qca_dequeue,
 };
 
-static const struct qca_device_data qca_soc_data_wcn3990 = {
+static const struct qca_device_data qca_soc_data_wcn3990 __maybe_unused = {
 	.soc_type = QCA_WCN3990,
 	.vregs = (struct qca_vreg []) {
 		{ "vddio", 15000  },
@@ -1838,7 +1838,7 @@ static const struct qca_device_data qca_soc_data_wcn3990 = {
 	.num_vregs = 4,
 };
 
-static const struct qca_device_data qca_soc_data_wcn3991 = {
+static const struct qca_device_data qca_soc_data_wcn3991 __maybe_unused = {
 	.soc_type = QCA_WCN3991,
 	.vregs = (struct qca_vreg []) {
 		{ "vddio", 15000  },
@@ -1850,7 +1850,7 @@ static const struct qca_device_data qca_soc_data_wcn3991 = {
 	.capabilities = QCA_CAP_WIDEBAND_SPEECH | QCA_CAP_VALID_LE_STATES,
 };
 
-static const struct qca_device_data qca_soc_data_wcn3998 = {
+static const struct qca_device_data qca_soc_data_wcn3998 __maybe_unused = {
 	.soc_type = QCA_WCN3998,
 	.vregs = (struct qca_vreg []) {
 		{ "vddio", 10000  },
@@ -1861,12 +1861,12 @@ static const struct qca_device_data qca_soc_data_wcn3998 = {
 	.num_vregs = 4,
 };
 
-static const struct qca_device_data qca_soc_data_qca6390 = {
+static const struct qca_device_data qca_soc_data_qca6390 __maybe_unused = {
 	.soc_type = QCA_QCA6390,
 	.num_vregs = 0,
 };
 
-static const struct qca_device_data qca_soc_data_wcn6750 = {
+static const struct qca_device_data qca_soc_data_wcn6750 __maybe_unused = {
 	.soc_type = QCA_WCN6750,
 	.vregs = (struct qca_vreg []) {
 		{ "vddio", 5000 },
-- 
2.34.1


