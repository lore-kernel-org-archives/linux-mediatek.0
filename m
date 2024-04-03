Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D95CD1292
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Apr 2024 14:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GuCdjLuGGbkRMQ83O6riv/SQKm1Ri8pT6mWmBtg/ZLU=; b=2OD9rfcwC3YT8Y
	R/tD/QnZJDmPb2HjcQtAVtDeA4760zIZO8GQ9rmRy94EAejx3+N5ry46NGE/OJRdriquGwE2GlHCa
	duIPojGka1jjOFlB3PkvtSwUoAJNCOvXl/59Gv2h9vzlOuqHaWaAHGiIQqGABtYljDRRrBYhqGSz9
	ACjjV1hBTVWC1Zcyt7n2f7Iz07buGjpq0MifEjDHft+SnJpsJxhfZ/KMwptFzJ5WVpuXJDyNVox7j
	C8L+WeSFu+gfQgzLSwlzSayqjN/Wr68fScn526J1bkBSIJzMwpWPpGedHSpr4EUi/Vol4tpRpyY9Y
	w/utb6x6jdcMAmLS5saQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs1Qd-0000000GPmi-28p0;
	Wed, 03 Apr 2024 14:17:27 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs1QS-0000000GPaW-1SgI
	for linux-mediatek@lists.infradead.org;
	Wed, 03 Apr 2024 14:17:18 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a4644bde1d4so878063566b.3
        for <linux-mediatek@lists.infradead.org>; Wed, 03 Apr 2024 07:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712153826; x=1712758626; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GuCdjLuGGbkRMQ83O6riv/SQKm1Ri8pT6mWmBtg/ZLU=;
        b=uik9d/eFEjToyz1itmDjzDL74MD7C3U0wD/U1K7QP+9zgoQMhdN3ccqJjatmKF6n2o
         muav9qKkGbFUHFYVCFBivAHtaGqtWYZSyHot9d7WQnqtgbspwCeq2xIW2m4MhyemlKdn
         p4Gwvh6At8R83Pir4htaYR5JRN0sIONA8JXSRudtqNQH9G/HCOyzpfLbcOt3HcLxHkG+
         y1kzZIcUXLL14la/XPvqm5pii2rQknXNj5o/vhHO5INtSnHwPoqI+6EbrcOVUx90IhJN
         H7UT/MulnSBECP+t6z9HHQw15/1GP+HqgqTK0lytjYU2RcAMBaaI/SHRgADnVUCz75Vr
         uVhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712153826; x=1712758626;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GuCdjLuGGbkRMQ83O6riv/SQKm1Ri8pT6mWmBtg/ZLU=;
        b=eFl8K1bTseIrBa9flKzyiSyVx8zou9xvqzNEJbv0JHizJb+g/6H4neEZtyd6GOj32e
         1zFLPBwklpa9DSL6o+edMHawd95cR3o3qp5qhi0SXZc0fn435OBpbTBDyUTzmZ9r+3Xk
         vYDvf0BOKWRSeBNNwjGEpZuFc8nwBqYI+19fEAYwQW82jFRK+4S0jkRV+G2C3kllGigO
         1TBmf7eGwwLhetYN/zu1O6h24HtThGBTGw3Ig4WoRr4g4MhYDRKDOT9+/3okLx+UuZsO
         gZ/aP+U2HaFtqhrU2LfIISC+5Vht0NAX6/+3ZIkoRMcLa0dJIwjsvAHS3uARTWicXE7M
         OSMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuuLH0RyIA7pkmef/+4zbLBhr0t94ScnEIk3WRk7j11q69Dgtc/qhkIH2mcEX1qiRZON7/QGv9F99uKiFBwHkvAUBeuuvzezS/KWSzEOdhrheJ
X-Gm-Message-State: AOJu0YzbyJz3+6Jq3jMsY7V/hN9L8jQTAtguozP8H8xooe3jvlNnlHCu
	tJlzMcYAizF3svmjrXR+zkn7I+JVDaiXgyRh6fBJ9pW6iqQkjTW8CGAtr1bHcpE=
X-Google-Smtp-Source: AGHT+IFO8Vb9lHvVlqh4Fhvzs8+Osxn5YUdvNkeRmO3RgCSXeLQUOJc/FTwyahym7ZIF7zC+/P+mMg==
X-Received: by 2002:a17:906:2286:b0:a4e:2ad3:60ff with SMTP id p6-20020a170906228600b00a4e2ad360ffmr10167064eja.47.1712153825752;
        Wed, 03 Apr 2024 07:17:05 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id he18-20020a1709073d9200b00a4729f093ecsm7737819ejc.53.2024.04.03.07.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 07:17:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 0/7] mmc/wifi/bluetooth: store owner from modules with
 sdio_register_driver()
Date: Wed, 03 Apr 2024 16:16:49 +0200
Message-Id: <20240403-module-owner-sdio-v2-0-ae46d6b955eb@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANFkDWYC/32NQQ6CMBBFr0Jm7Zi2YIyuvIdhUdoBJsGOmSpqC
 He3cgCX7yX//QUyKVOGc7WA0syZJRVwuwrC6NNAyLEwOOMaU7sT3iQ+J0J5JVLMkQV9Fw+R6t7
 GYwNld1fq+b01r23hkfND9LNdzPZn/9VmiwapMdZ01obg/WXi5FX2ogO067p+ATismyqzAAAA
To: Ulf Hansson <ulf.hansson@linaro.org>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
 Arend van Spriel <arend.vanspriel@broadcom.com>, 
 Brian Norris <briannorris@chromium.org>, 
 Francesco Dolcini <francesco@dolcini.it>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_Pouiller?= <jerome.pouiller@silabs.com>
Cc: linux-mmc@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org, 
 ath10k@lists.infradead.org, brcm80211@lists.linux.dev, 
 brcm80211-dev-list.pdl@broadcom.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Jeff Johnson <quic_jjohnson@quicinc.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1881;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=sLpMucYAHhsdtxJHN7w3Qoxaqd4j7HhpYMAWN0I+lGI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmDWTWhZYH5I8P8YpT2j4tBswcTi465OR3R2Vdy
 MFQyrfbcxKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZg1k1gAKCRDBN2bmhouD
 13mdD/9oyNN2LDJS4UUT9lh9FMmVKzv4zMsED2g7AFXgqM0qm2cmuSWbj4u0GU5NwOX7BrqZ0vm
 1MoFRjiJXrPRIf7W0+2V4H+nJoVr1yuR2iyhjUzHWMvuP0zH94qu171iOEclYnnYRB1qU+aLfL1
 kJzO1IgcZr62n1nUT87KOIg6EYDjM3bkN70HEKdTpUnT/4IeQGlz31nGBN5fMwY7ilGcHj2o6eD
 SD/B+XlchCBRqtClLLHRjE6vWL3Kh8waYpVcQN5tkTL8n4Z6Kx2V2ggi/cRaAivFJE0QO0twESt
 a2uhb7p02ZXGJUgcq/q8X3ZHdg3Tk52fyiITyoVkmqt+aeXgy3BIjNLzbEYYCdkbE+O+a6aIVMY
 sWh80j9S3lKWFD459htyZZNQ+JAYTQOPyskSA0Y77+ZJ2hcky7Bj0npm4yECJMg7Clz5yA/nOCP
 /p3pZpdzVSifUQjpfg/Pyb3kFJfSAY8JZyX3rHkMb8drpepqWBRAhDZXwCnHmb8gFL9U1fn9149
 H/c92m5ZCti6AeuyN9qchKtH+ni3k2ZwfcSCq0jHltwjYJRvyR/f9kdOe7BtQVEtUHEKrn/TPPn
 ucoPD3S7+PK5iVuBtSj1znupa2G6inwizGfgWIioyOsREpGfSWWDon01uTGqrV6OhMBIx5fIAGI
 RSRd/yitwa0sF4w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_071716_451105_70607056 
X-CRM114-Status: UNSURE (   8.97  )
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

Changes in v2:
1. Add "wifi: ath10k: sdio: simplify module initialization" patch, from
   my other patchset to avoid conflicts.
2. Add Acks/Rb tags.
3. Drop applied SDIO patch, which was the dependency for the rest
   cleanups.
4. Update subjects according to feedback.
- Link to v1: https://lore.kernel.org/r/20240329-module-owner-sdio-v1-0-e4010b11ccaa@linaro.org

Merging
=======
With Acks from Kalle, please take entire set via mmc/sdio.

Description
===========
Modules registering driver with sdio_register_driver() might
forget to set .owner field.

Solve the problem by moving this task away from the drivers to the core
code, just like we did for platform_driver in commit 9447057eaff8
("platform_device: use a macro instead of platform_driver_register").

Best regards,
Krzysztof

---
Krzysztof Kozlowski (7):
      Bluetooth: btmrvl_sdio: drop driver owner initialization
      Bluetooth: btmtksdio: drop driver owner initialization
      wifi: ath10k: sdio: simplify module initialization
      wifi: ath10k: sdio: drop driver owner initialization
      wifi: brcm80211: drop driver owner initialization
      wifi: mwifiex: drop driver owner initialization
      wifi: wfx: drop driver owner initialization

 drivers/bluetooth/btmrvl_sdio.c                     |  1 -
 drivers/bluetooth/btmtksdio.c                       |  1 -
 drivers/net/wireless/ath/ath10k/sdio.c              | 21 +--------------------
 .../wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c   |  1 -
 drivers/net/wireless/marvell/mwifiex/sdio.c         |  1 -
 drivers/net/wireless/silabs/wfx/bus_sdio.c          |  1 -
 6 files changed, 1 insertion(+), 25 deletions(-)
---
base-commit: 7d860d3177a745017d38b37bc2bff2f090631148
change-id: 20240329-module-owner-sdio-abd5de3f1d74

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


