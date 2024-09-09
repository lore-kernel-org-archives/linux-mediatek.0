Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE955ECE579
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 14:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yX0ieRX3qt7UlOSEcKeb4ov5m9CKVjYZ6v64GoSji2o=; b=IXd0PUDv72iytCkW55TcixJOIZ
	coDGp/c1z5xAiWgm0DUOAfqtm0Ec2iEFsnf8JHNDPv4TU6GQi46KwR5EcZsA94oY7Q6YGYEZDEabQ
	5wmv/TdYzQw9rxIuGhz4par5B0Ap4JvZIlIR775TSzIDY1xEM7U6bHP/L8M4UmyoUkTs8YNub6v5Z
	q/69JwmAZNeQW1MsWOmxHHLY/3SmnX0CcUEExaBfkxCx6jWc0PoQRXBLRXJjgN6GVJW/OWIrm5Wec
	wP3rBcNnh4h3y9qnd7GXsE22g5r0k3JdDJANap+bqv5IYlU94r+M1+t4XaHC+jrHHZFIKxKrLN7yc
	kDwI5ZWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snezZ-00000002CG6-23Bw;
	Mon, 09 Sep 2024 14:03:45 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sneo9-000000028hq-1kuI
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Sep 2024 13:51:59 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a8a858ab5a5so24731966b.1
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Sep 2024 06:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725889915; x=1726494715; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yX0ieRX3qt7UlOSEcKeb4ov5m9CKVjYZ6v64GoSji2o=;
        b=JS2FMpPU0vCjzJRajiZHgzPEvKoF1qCWx6vqBTxO7oAMuF0EcZ5Jl8CkVUxDJ3j4df
         iFcgLOHDxYVz9FbCbspzBh1o80YFpWRay2+B4RAfbMCtq8AXcZ0Fh8B2emkPjWNjIL6I
         VA+VbVLq7PB80LCZCy5bIuHNZmrWDwGxWlcrrrzZmOgn44I/50E+Pi25tL6kR9egfGdX
         OMp6P9+iSfVjNFubnQfxoY2+nWG6EWDbcaR1UKI9YUAR6Ezajf/uOy7UQreNg8PlGVED
         KsueY76tdWjJc/40+4QXCLMuOJ6CeWh3cbAI3qMmU9NPqwrWCI+Vyax7NG8yERTSRyNT
         xVJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725889915; x=1726494715;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yX0ieRX3qt7UlOSEcKeb4ov5m9CKVjYZ6v64GoSji2o=;
        b=ZJAS/r7FJes/Bky/VgRJvDJciKURkvRWt3VLyEbiMKPHPxetqKHvCkV2bSljshxuc7
         sc00AN6IztD+411V9hM8Jr3OJPLXfXiIRnC8A7Ui63kBXP5NMADnLB7onz56FdrohTNn
         9Ms13anZD42BGLlOXYyAkkGxa6iscOgII7sramsgWB/Vk1zND22JFsEmnQNlDveAO5bT
         BeCOEqTuVFTn8KwHGplYb9pgFcL5LCX0EYQkfH7R3cVAYfj3N5xN59V3kuSM7kGujQkb
         HFoaElH3yadD+OIC+FDWV/oJmmM60TtQt+iC/e+jC2LiNCUvvQKCvXbYhLVlvW4SJCXB
         xNbw==
X-Forwarded-Encrypted: i=1; AJvYcCXAlmoeev5wl8UYNK1/E3vT+nZSCTYSAY0SSRe17Jf25BynWPkqrAFQ6sZgMhDizMOZi7LMm/KhUhCqmivM7g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxdmiRW21h6t+Pdzk/M+RzHrhv4uQm9quNxv7D592XxioEw7JuB
	vgHrSWlAz1RMwfPCTPhv0XHNDnCxJXdECb76f9PTZzNwLYxc6ADH0jsn8W+n6qM=
X-Google-Smtp-Source: AGHT+IHCG4aOhWEoDHhp4VlM/hSRsuN52yWkPHfFAEGYdvVImYzvsFpKRpyVze8PsPQZpSmUk8de4A==
X-Received: by 2002:a17:907:7212:b0:a80:ed7e:8468 with SMTP id a640c23a62f3a-a8a882725e1mr381160866b.0.1725889915394;
        Mon, 09 Sep 2024 06:51:55 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25cf3ad6sm345344566b.148.2024.09.09.06.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 06:51:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 09 Sep 2024 15:51:23 +0200
Subject: [PATCH 12/17] regulator: pcap: Constify static data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240909-regulator-const-v1-12-8934704a5787@linaro.org>
References: <20240909-regulator-const-v1-0-8934704a5787@linaro.org>
In-Reply-To: <20240909-regulator-const-v1-0-8934704a5787@linaro.org>
To: Support Opensource <support.opensource@diasemi.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2714;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=MS4Vn8NDElkbWDEAQWJiCHTN4oDL8ETlvc4aO5xEqXE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBm3v1ipR0PFario11XiOMREeg6br4HZqWH6heoy
 GID0BAwI3aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZt79YgAKCRDBN2bmhouD
 1+kjD/4yE+PIP+59j+gU/cUsfasMKH6r1asR/aM3IqmfKNUATk6MFUoNDDqUNZZnvEQ2gXzj2kL
 ThFAHRQoOCDMk/5me0Qil5BYYCS7NVWojWcIA/GVUsB90Zc4bYWmSZxs4UijN3cVkqmqT4ddIHK
 tBcOZmJ9sibK9TVjWT5DjKslzyWfB1WjU2v0w42c6pFD5D4OOdrXMHg1EhcEgb+DsObz20hKhTD
 JH+rPF33xMlY6zwl0/fcmgxM4uQv2+yLuyhGKg9OFDdcYtXICXhc3Uk7+Uky79VqwLP9hnoyGll
 Ps0YHrHaeFLkVFErLkBvJtfe8C0+z0LvhmyM8Hwu8OICUSQ1SImwdzggxP/8aIGVSmYCTIxUhmM
 fEgimd1EJZxM9199uNr2fXFFSw7+2jgiOoVcYC18cQieDZU6mkhTkysZeY7YcVrzF49oNuYSONr
 GIDEw65D1QWqcpSwx7HEXOwfROB8RgQgoo2D41EYaE1hrqLob34BEAhOqAVZhAWAfUiOYhMkz3O
 ENspkvf9K2h/6v13cIsrsKnUqjA0C49v0h5EG375HB3awPv3EBQHxCN3ZeDcSWT8qoMJ646n+qC
 aPfIJZXhcERGnaRZVS6MtRl5WezHcyJ71zGeqitfhtptvvt9rfqHlRQ+fLDtqjjy03WFiT05ZGr
 a4zrHL0vlDmpXiA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_065157_581848_95B6A378 
X-CRM114-Status: GOOD (  12.24  )
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

Driver does not modify static data with regulator description (struct
pcap_regulator), so make it const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/regulator/pcap-regulator.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/regulator/pcap-regulator.c b/drivers/regulator/pcap-regulator.c
index 319a88412154..441c9344aef7 100644
--- a/drivers/regulator/pcap-regulator.c
+++ b/drivers/regulator/pcap-regulator.c
@@ -105,7 +105,7 @@ struct pcap_regulator {
 		.lowpwr		= _lowpwr,				\
 	}
 
-static struct pcap_regulator vreg_table[] = {
+static const struct pcap_regulator vreg_table[] = {
 	VREG_INFO(V1,    PCAP_REG_VREG1,   1,  2,  18, 0),
 	VREG_INFO(V2,    PCAP_REG_VREG1,   5,  6,  19, 22),
 	VREG_INFO(V3,    PCAP_REG_VREG1,   7,  8,  20, 23),
@@ -141,7 +141,7 @@ static struct pcap_regulator vreg_table[] = {
 static int pcap_regulator_set_voltage_sel(struct regulator_dev *rdev,
 					  unsigned selector)
 {
-	struct pcap_regulator *vreg = &vreg_table[rdev_get_id(rdev)];
+	const struct pcap_regulator *vreg = &vreg_table[rdev_get_id(rdev)];
 	void *pcap = rdev_get_drvdata(rdev);
 
 	/* the regulator doesn't support voltage switching */
@@ -155,7 +155,7 @@ static int pcap_regulator_set_voltage_sel(struct regulator_dev *rdev,
 
 static int pcap_regulator_get_voltage_sel(struct regulator_dev *rdev)
 {
-	struct pcap_regulator *vreg = &vreg_table[rdev_get_id(rdev)];
+	const struct pcap_regulator *vreg = &vreg_table[rdev_get_id(rdev)];
 	void *pcap = rdev_get_drvdata(rdev);
 	u32 tmp;
 
@@ -169,7 +169,7 @@ static int pcap_regulator_get_voltage_sel(struct regulator_dev *rdev)
 
 static int pcap_regulator_enable(struct regulator_dev *rdev)
 {
-	struct pcap_regulator *vreg = &vreg_table[rdev_get_id(rdev)];
+	const struct pcap_regulator *vreg = &vreg_table[rdev_get_id(rdev)];
 	void *pcap = rdev_get_drvdata(rdev);
 
 	if (vreg->en == NA)
@@ -180,7 +180,7 @@ static int pcap_regulator_enable(struct regulator_dev *rdev)
 
 static int pcap_regulator_disable(struct regulator_dev *rdev)
 {
-	struct pcap_regulator *vreg = &vreg_table[rdev_get_id(rdev)];
+	const struct pcap_regulator *vreg = &vreg_table[rdev_get_id(rdev)];
 	void *pcap = rdev_get_drvdata(rdev);
 
 	if (vreg->en == NA)
@@ -191,7 +191,7 @@ static int pcap_regulator_disable(struct regulator_dev *rdev)
 
 static int pcap_regulator_is_enabled(struct regulator_dev *rdev)
 {
-	struct pcap_regulator *vreg = &vreg_table[rdev_get_id(rdev)];
+	const struct pcap_regulator *vreg = &vreg_table[rdev_get_id(rdev)];
 	void *pcap = rdev_get_drvdata(rdev);
 	u32 tmp;
 

-- 
2.43.0


