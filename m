Return-Path: <SRS0=IR42=AN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 843B2C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 16:06:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5274E20720
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 16:06:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Rw9Et89M";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UH/FEPUu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5274E20720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=elD3gNc05Tb3tGoKXy/kbqweD8b3llEMMQj1DQHGk0E=; b=Rw9Et89MwwRQmMRlQKHjKPNcj
	pIFSWTE7lMIK/uhhKm675XiLnUKvd6f/w+lYbJYaH2flgK+1U4jH28egXsBWt/MWQmW0I0kJM9aJa
	Nb2Sy8u6EslpTqZ3Qvz5GOlGBj2DIoWG7iDNsVbnFMOmwUfNJkkYXiiSSHCX5dMF9HpyIPHQRfHHa
	3cgfC6NoSSf7WS/lxovJPFZsM9PgQv17NtlLZJZsCMRslU4Yp/3HpfDAYnxKagd3B1uT7Zvzfxfwl
	iltf7VKth4pVo0GwTOlBc+EXTC+nxpRhmagay0zF6UX5BXIngkLRnushooOazMVCLhNKdPMMKsEAi
	UdAzg2sdA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jr1jD-0006it-Su; Thu, 02 Jul 2020 16:06:23 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jr0UR-0005SP-T3
 for linux-mediatek@lists.infradead.org; Thu, 02 Jul 2020 14:47:06 +0000
Received: by mail-wm1-x343.google.com with SMTP id g75so27086049wme.5
 for <linux-mediatek@lists.infradead.org>; Thu, 02 Jul 2020 07:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j3qxTGweigJBwA2Dcfmp6Oj8j3v23FLWhOhHeBcgW7I=;
 b=UH/FEPUuaJiocBixPJWaxF19GJofrsYjNd0ZwLFDYiM8v2DNvddLqbfFEcoEIAgua9
 bP2+NQ5D2EnmEmmOkQbHI1JvyYJ/o4zFDERtjZF/Uu9t+zeH9dUNXTfGa/pdIk4yUPVT
 vvgPEaa1aFKNK273L+hRW9C1Ev04KveXHYXLiyNdzpToBUXws7X15l+6DSLce7p6jeiD
 K1WSC+eCuZhhTPH1+Xzr3/PN1YghnkO1pOilzPFlhWeP9jW6k+/D1ZIAemdOPEOqmxJa
 Sfo4YYjZUP2FR65boUwbWOUyS/gbbcgDSJusheHBjW1mniiBCNgNVkiP4pZ6pixHLMGz
 YoDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j3qxTGweigJBwA2Dcfmp6Oj8j3v23FLWhOhHeBcgW7I=;
 b=gEahaZca7ONvv1sCFvqpJiFWZ5k1XcNfxEn/lS4LvLuOZsBruO9/0KKAXziev5Jit6
 XTbLV6EuCnSWVu7PxJbNyL+trISWFvlv+qHthzfKkYj4b36FloH06iAJzps4Po6sqyRo
 a1QuQhZfOx8P1vwjCiv1P3QlH4t5aD8wKNYo6iWTk4tlzpdiPVaUuXYDgCmk8EhvGsu2
 DejmgZ+w32XC+PZ/WvXOuX3og3sPrc3Cf9oh1vGbx6XsEt80su3z24Y0Mu38bp61OjsL
 RYuDTUUzOc9jKLvFT9Sj7uxHo3Mvts9KBWfJhxGBhxoa7wxwHWppwLEca7aMAKmEBWIT
 pONA==
X-Gm-Message-State: AOAM530n+5UrqpmdOP3BApb0CiS+5y3vB9ptXuHhfNACJj9/FCK2Qs7X
 nQXiur6BCF294nB2PAHbkwFJIw==
X-Google-Smtp-Source: ABdhPJwSKu/tDOvAvRT809W5s5eyOxbUaM/7UBHj3f8+fnH4iRC5julZ8NEXw3uo/stZQZBYv3h22Q==
X-Received: by 2002:a1c:7402:: with SMTP id p2mr20868613wmc.117.1593701222460; 
 Thu, 02 Jul 2020 07:47:02 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
 by smtp.gmail.com with ESMTPSA id g14sm7002737wrw.83.2020.07.02.07.47.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 07:47:01 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: gregkh@linuxfoundation.org
Subject: [PATCH 25/30] usb: mtu3: mtu3_core: Demote obvious misuse of
 kerneldoc to standard comment block
Date: Thu,  2 Jul 2020 15:46:20 +0100
Message-Id: <20200702144625.2533530-26-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702144625.2533530-1-lee.jones@linaro.org>
References: <20200702144625.2533530-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200702_104704_306851_13CE49E1 
X-CRM114-Status: GOOD (  10.89  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

No attempt has been made to document the function.

Fixes the following W=1 kernel build warning(s):

 drivers/usb/mtu3/mtu3_core.c:805: warning: Function parameter or member 'mtu' not described in 'mtu3_set_dma_mask'

Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/mtu3/mtu3_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/mtu3/mtu3_core.c b/drivers/usb/mtu3/mtu3_core.c
index 9dd02160cca97..6d515eb67ea79 100644
--- a/drivers/usb/mtu3/mtu3_core.c
+++ b/drivers/usb/mtu3/mtu3_core.c
@@ -797,7 +797,7 @@ static void mtu3_hw_exit(struct mtu3 *mtu)
 	mtu3_mem_free(mtu);
 }
 
-/**
+/*
  * we set 32-bit DMA mask by default, here check whether the controller
  * supports 36-bit DMA or not, if it does, set 36-bit DMA mask.
  */
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
