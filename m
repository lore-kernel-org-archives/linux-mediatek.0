Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6578C61DA4
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Mar 2023 11:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PCTTb92AAoMVvXQ5aE8pDO5aVyOUz4eqvmWQp2fU5mw=; b=qLRBjJP+N67VAqWWf9ZVl7D8Nt
	Uw0RagPCVQGFUiUigiWWEU/4gqT2Py20oIGTDt60YuM+pfsrFXgVIE8uEAKIL/HGdFsugM69VovYa
	Ax4kbbFDrWoIhzV6Bl1/Nl4yvtmewbcng9Q1l1VauMmPBE7YkkygmRFM4oiK4FnAek3mVFFYK7a3n
	gVt07l59OX5T4njXCBnS3LhVQEfsfqzGwu2hZ6KkVsXhtR9BUP840hFWxfqAjxJLlStGUMLQQAkqp
	vdNgeZ1czMezYvGIZIZ80/z966vdzX+CS9zOA+adbpU78x/GoXi+wUSBEFxZ6bFYfv2gkvtH4TikR
	bVH8RA7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paxFH-000HMF-Nd; Sat, 11 Mar 2023 11:18:39 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paxAu-000F7j-EU
	for linux-mediatek@lists.infradead.org; Sat, 11 Mar 2023 11:14:10 +0000
Received: by mail-ed1-x52c.google.com with SMTP id x3so30656953edb.10
        for <linux-mediatek@lists.infradead.org>; Sat, 11 Mar 2023 03:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678533247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PCTTb92AAoMVvXQ5aE8pDO5aVyOUz4eqvmWQp2fU5mw=;
        b=Xm4ZuJCCS7mm2qZMe06Jl5IFxegK2jOFxBFzdXD8adzQQtzra9b3D+2gZVDsRL2Z5p
         yKPHBv6EJz23Gldjk7JeKL3y+HQs5vwr3j8MxArHRdmbHUQezhso5hmxKI33oTpC+Bgj
         aDXRVDrPiOOypiDuaQxjGFJXba0ILv5OrgB6VuKgrKQz10PrvoMlWWxPmqURmzDVHen/
         fyO51YknvUUS058ozWRq4+5eu6XAl+yz1G6TmFFWHlQPhDVhQzLhReWj/Mgy0/cKxtZK
         86n7P0CqmxRaPazE944YAf1PnuEpRFCjnxffXywf+Ol07IZWuz6jP+rOAx/hZgzfAF3t
         mNUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678533247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PCTTb92AAoMVvXQ5aE8pDO5aVyOUz4eqvmWQp2fU5mw=;
        b=uZRkYyKxseTUpgBTIf19t3t6UGS5xfUXwmDL8OKUD0VTq8PiS/SsWcln5t8QBscnZg
         bQNNibJf4Ylzt7rMfpzJ2+8hgrfbzU6Ll55yDz5cI4WPLTlO9YL5dxBRpH/jCv5yK2RF
         JLv8mhSE3RI0Mh7AS6605N6YKW0/9OPZNs2ohGP0/IVjYHIWs6R6XALcJX/v6II48WPF
         xQAqpTWqJw5dJZFnB1rUljZBIODRIOHylA8XN+hHM2lWQFTOsOqCaP666nHgDmSCAEla
         T0lKajV1F4GuyYqKFUZdC3U5oeuuUs0U7viLkZ5DFu9S9hXulj914Gv4S9WopX94NLFX
         UalA==
X-Gm-Message-State: AO0yUKW2+4FmvOSGDEHxBRh8cM+QFXU2bRjKrozGS0qINSFjNnIW11Qs
	MPcrjG4tDaM/wZOFNMPJvFbFbg==
X-Google-Smtp-Source: AK7set8VUBCC++0rZKvVuN9HoT+LHcQIhyp29YmG0D+xXFTSWOFjLW7ajPk00csdW30mYzCxwGXf6w==
X-Received: by 2002:a17:906:d54d:b0:91d:a049:17a9 with SMTP id cr13-20020a170906d54d00b0091da04917a9mr3961752ejc.36.1678533247256;
        Sat, 11 Mar 2023 03:14:07 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:fa97:2d7c:bdd7:e1b])
        by smtp.gmail.com with ESMTPSA id q12-20020a50c34c000000b004bf2d58201fsm1053859edb.35.2023.03.11.03.14.06
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
Subject: [PATCH 4/4] Bluetooth: btmtkuart: mark OF related data as maybe unused
Date: Sat, 11 Mar 2023 12:13:54 +0100
Message-Id: <20230311111354.251316-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230311111354.251316-1-krzysztof.kozlowski@linaro.org>
References: <20230311111354.251316-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_031408_559877_DCCD2B13 
X-CRM114-Status: GOOD (  10.71  )
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

  drivers/bluetooth/btmtkuart.c:971:36: error: ‘mt7668_data’ defined but not used [-Werror=unused-const-variable=]
  drivers/bluetooth/btmtkuart.c:966:36: error: ‘mt7663_data’ defined but not used [-Werror=unused-const-variable=]
  drivers/bluetooth/btmtkuart.c:962:36: error: ‘mt7622_data’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/bluetooth/btmtkuart.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/bluetooth/btmtkuart.c b/drivers/bluetooth/btmtkuart.c
index c98691cdbbd5..7680c67cdb35 100644
--- a/drivers/bluetooth/btmtkuart.c
+++ b/drivers/bluetooth/btmtkuart.c
@@ -959,16 +959,16 @@ static void btmtkuart_remove(struct serdev_device *serdev)
 	hci_free_dev(hdev);
 }
 
-static const struct btmtkuart_data mt7622_data = {
+static const struct btmtkuart_data mt7622_data __maybe_unused = {
 	.fwname = FIRMWARE_MT7622,
 };
 
-static const struct btmtkuart_data mt7663_data = {
+static const struct btmtkuart_data mt7663_data __maybe_unused = {
 	.flags = BTMTKUART_FLAG_STANDALONE_HW,
 	.fwname = FIRMWARE_MT7663,
 };
 
-static const struct btmtkuart_data mt7668_data = {
+static const struct btmtkuart_data mt7668_data __maybe_unused = {
 	.flags = BTMTKUART_FLAG_STANDALONE_HW,
 	.fwname = FIRMWARE_MT7668,
 };
-- 
2.34.1


