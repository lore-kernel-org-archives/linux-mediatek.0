Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC5ECD1283
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Mar 2024 17:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KcD8HRHcrp/DV6/mbC4noaoosmpuTxjJzgOpstPofQw=; b=4pud7U8jkYjQKvXgdHo55Oka3/
	fsfGInRN66hVtsX5OPXX1Lhaz6xiZ1L3VMJ8NRRyL/CjAmJWCb/BAeoWDsP0yHcDOj3ETVM8Ox4Oa
	oyNTVgGo8sDI/XG0VzUYoT4PcIT3obVoD6woIjx3YVSmLJSLe7KvwsKkanTsgM9N6Bv+n/EpEEiLG
	cVHGQTcoa47irWIoDuwEWBWOY+Nv4Knx8RocTw9zkt58SiiKY8xWK4+VstwfTwUUBF6AFRpSLMjYB
	Fc0cTQ6xDfH7IzJFzrmePgL+LNs/hChl6+WlE/MNT2MTNrESlkRw0dQSsyJgvMkVKcv1y7Y5CIAoD
	YEIhSOwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqFzR-00000001TJA-03T1;
	Fri, 29 Mar 2024 17:26:05 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqFyR-00000001SeI-4Aa8
	for linux-mediatek@lists.infradead.org;
	Fri, 29 Mar 2024 17:25:05 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2d6ff0422a2so31302321fa.2
        for <linux-mediatek@lists.infradead.org>; Fri, 29 Mar 2024 10:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711733100; x=1712337900; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KcD8HRHcrp/DV6/mbC4noaoosmpuTxjJzgOpstPofQw=;
        b=ZHNvOVmbZziufsECLM9WAuxaFDZo+FerZFkGoPRnG1ApAHCAG+s/pbUXR3QR9ZV17x
         dMlUswS6d6Qn2lWd+umtsjtUzJspJbWHfuAaoivpxgS5tQ15DWep//OeiLUWxihmN1s4
         26uErgOiyr3Lr6LTj+tZka4U0TKOp918h8Ysb1B4jizUFu5GDMXEzIet3Z9AfWOUdlsP
         noPW1Yt/z0DHvj8xX9mPBP1vYLNHFmPUOuUZebc9nSsyqHhPP5UI0c/24S1Dpc2659qL
         dhm/fy8Iyfom8dXC1v9uO4y4xAI4ik5DQF0EFEV2GtmpIB5JACgZGj5Geg7zfnGA4Lnh
         BLeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711733100; x=1712337900;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KcD8HRHcrp/DV6/mbC4noaoosmpuTxjJzgOpstPofQw=;
        b=PYx/7eIZ4HsBPJ3SjI+xUfErqtB7W0tFSfuLFxOmRsT7b/J1dCddXspe9GecvK937J
         hlfKEUqCGNxTt2Gmq3jvfwxlEm3nCOUPrbwqP3pJQGSpPme5ncRylGQYnP+Iq5GFZ2eX
         V8eZ487tb117X2cu/By5oeKotUdVc6FraLPHo0Zlxpqv/41JxPj0UkGeK/NwjIdONULd
         xE3Rl1cn5TmK3BrAc5zEPlqTGYbP278QL5B1PavLdSdpZ6/uXngj66MsPrv0z+/CmPfb
         ROJtVIp02SeZmrM4smTyAeFPvYSqZQhseJDAM+NdZYeCnKTvsLg4rfg+cezt35RBY1/Q
         QYrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJwF0lceEdCfmXfWy5MMRorYhUX9T1Kg/oAqhMPDcYxXbv3e+LmZJgMFFpO9RfTIJnxWNbFbN4nlXy0bjSyCOsbpyJ/VbjdK9uInCNSnvc5UoW
X-Gm-Message-State: AOJu0YzRSTOXo3BdmQp+d+Iot//7QQa0zqH89USzOKOjmzOqazW675Tt
	j0fh05fZ8uscXiO0JiwNWJagWS3zF/7j3oQJD23yHw7zhlypdp26cCpuQx0rogs=
X-Google-Smtp-Source: AGHT+IFyjNez3sE4PWODMtgmz7C3Sd3IPme3UL4MYB3hYvUDweMQ3FjLWXzSNso3+baxRqVn9yAqyA==
X-Received: by 2002:a2e:a40e:0:b0:2d4:ad34:85a7 with SMTP id p14-20020a2ea40e000000b002d4ad3485a7mr1899831ljn.29.1711733099818;
        Fri, 29 Mar 2024 10:24:59 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id v8-20020a05600c470800b004149543c82fsm8491069wmo.39.2024.03.29.10.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 10:24:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 29 Mar 2024 18:24:37 +0100
Subject: [PATCH 7/7] wifi: silabs: wfx: drop driver owner initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240329-module-owner-sdio-v1-7-e4010b11ccaa@linaro.org>
References: <20240329-module-owner-sdio-v1-0-e4010b11ccaa@linaro.org>
In-Reply-To: <20240329-module-owner-sdio-v1-0-e4010b11ccaa@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
 Arend van Spriel <arend.vanspriel@broadcom.com>, 
 Brian Norris <briannorris@chromium.org>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_Pouiller?= <jerome.pouiller@silabs.com>
Cc: linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-bluetooth@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org, 
 ath10k@lists.infradead.org, brcm80211@lists.linux.dev, 
 brcm80211-dev-list.pdl@broadcom.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=750;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=dy5/P4BbGd7xVHeclyb88G2cDXZH9d/+8cFl6+jA+cY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmBvlcZ0oBCo8Oq6N8hTvt2aQpgKAKxHIpjqSlr
 SahyH8uLI6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgb5XAAKCRDBN2bmhouD
 1/gPD/92fMg4HeDOH6UvazVFxNBFDiNGJ0FuWFqOWnbcog8PrO2WrRE1CwCalUVCWLtRzP/1FSC
 wPYAKDHxoCbDCUBmACS1AywZqPGdRT/aw3iVNVrBDP8MD36K+MzLgAysUxL+5DCQsNF+L+hi7JW
 3gtzJRKDlGqFn/qAnv+C9FI/Ds01g5GuA0re2O1B1Pjl/6AuKk9hLXXOaWOsgDdjhU+z8KaW2Tf
 xhU15j9lvurPC3StuJfkS3YV/4SoVpPzvO8YB54LV6wyx6RHDxi7UItPbp1KbECx/NE2oGo/EQq
 5NRKXKzKAUd+Ldk9rKoRG0Qns2jZdUZd/9UIbgZIBcVTCd6XbVolP0fzkibJ878LM9hxbq8ZX4l
 qILgzeZ0//xpzDjVLIraNWKk7sZ5rHsOUI2TFzneTIuVzfDM9vc9ArlWOPoe1zJSWathXf8DG+O
 WatvfNlBC2gQ9NTQGlOgJQDC7sjHIeIheQAGBrvbfhhCMooPM9G8Ca8p+ivZvs+WRI1mn253DY1
 +qus3gE+ShRmFXkyRfALGgV5dwLm6Me6e2CoBys14WXjhMe9d3hog/3RNZtVjIeAdG5J+Vw5PgT
 StMgaYVmpBBm4LkTKTBuvaFhH89MiGxa7ChhElyueeFEP7QVpO+cVfVEASSGeAOL1vSNOX0M7cE
 osfdo2scTUV3CIg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_102504_096326_2BE467BB 
X-CRM114-Status: GOOD (  10.22  )
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

Core in sdio_register_driver() already sets the .owner, so driver does
not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on the first patch.
---
 drivers/net/wireless/silabs/wfx/bus_sdio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/silabs/wfx/bus_sdio.c b/drivers/net/wireless/silabs/wfx/bus_sdio.c
index 909d5f346a01..f290eecde773 100644
--- a/drivers/net/wireless/silabs/wfx/bus_sdio.c
+++ b/drivers/net/wireless/silabs/wfx/bus_sdio.c
@@ -267,7 +267,6 @@ struct sdio_driver wfx_sdio_driver = {
 	.probe = wfx_sdio_probe,
 	.remove = wfx_sdio_remove,
 	.drv = {
-		.owner = THIS_MODULE,
 		.of_match_table = wfx_sdio_of_match,
 	}
 };

-- 
2.34.1


