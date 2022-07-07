Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39376C43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jul 2022 07:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=70xtc+uGcQwXm4fuaD/+Dh6Vj8lV/MgZmktrLD3peVk=; b=TzinL3Gfe7+gvD30YcP8sKS2oW
	LwhKQB2DZFNGKe2S0UpAiKUPD5027BB8fB82j7Od1PF3tL+54PXWE1sbMHX8gpBc5hLDtlvphx4Er
	G4e89n6T52QrDCZKkIxvrbemRra5gdm/Ii4koLeNSi7gE4xBQw1gqIzzmrLfxexvy42m/wTxGyfbS
	ppg00J5A9cp8F8nDGrOZ8Z1Zq1UbNAy2gpBs3OpYY8aGXN9ZyqgLeDRP8Dj9VkulG6jmDyL/kXxOO
	qDvKQ3LM/+5aPObcyQXAVXjlXYFchmgo/KDR+fPKJOWtFTC3ifR1UNEgyqRZp1By2mwz2a8zMeKBK
	u/nzujxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9MJc-00EsHH-3J; Thu, 07 Jul 2022 07:52:48 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9MJX-00Es7o-RV
	for linux-mediatek@lists.infradead.org; Thu, 07 Jul 2022 07:52:46 +0000
Received: by mail-wr1-x42f.google.com with SMTP id r14so19315270wrg.1
        for <linux-mediatek@lists.infradead.org>; Thu, 07 Jul 2022 00:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=70xtc+uGcQwXm4fuaD/+Dh6Vj8lV/MgZmktrLD3peVk=;
        b=q+ABpgrDDFIRVVXBzf1fEBgDOZzkcnovjTczwvCHoQEx9EgtVFK1S3cP2uNewqCcTu
         p46x/EAuzL8Mq8CqKyQKnXaxdbv3t5xEZRPHIX+0v+6H8mmMHaFBVqG/LkKwzDxuMvnC
         hBFFYWRW6D7mzE+7JF28l0mzOAPa6pzYpJundz2VwprhE2P8uOzoL2H6ZCYKZxy9MJ//
         BeAQIkrUCwLtgQ8mgVS0wZ1tqgWgPyRDmcXgxyV01Cd757TNNiA/UbgAwSOyR+wXyAvU
         Qqv9uxflEEFTnsmPUuz5NOh649OaU3wk0Y4VIjLPFzrTqwduxHStzOCezNJdJWkRcmOQ
         SUdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=70xtc+uGcQwXm4fuaD/+Dh6Vj8lV/MgZmktrLD3peVk=;
        b=Q1u87BCRUXxfGAQrvRHgzS/BTuOhJ8xcbpESa/pY7Z1sqtcf4YJwj7/GuELh+idFN9
         Nkp6M+onuPlgmyPKVBZBt781pls6guUdvXssphYHEfG1teLG7UhdDp/zaGE4RGJQnS/m
         TPHjdzrgluVIMPGY19pY+K6twh2kkx6ORGvkuGGSwwcnbfNcrmkke9tA9RVTNF/FmiMi
         yDxWGnG6WfFiNXKDC+EZ++5P4J97xCoBZCnsmoR/HqMyWbdMo5t60zleffGgRYHivJ1A
         PHT36//EY9fy9mdtt/Ot/4gS9o5zoEXIugFtge1V+oTNsLUHGTeo6zdE7P7nD5u78cee
         e8dA==
X-Gm-Message-State: AJIora/zXHnc90twfxibrnXrBpURfeCUaAfN3XkWYHAH0iGyFEGMedY2
	Gq7A/oGZQvfK+9B9MlTJe7OtdQ==
X-Google-Smtp-Source: AGRyM1sZKaUua+SZ//O7YATU5JaHhkvcrG36JPkNNJpcew0H+3gBJSHXOrAH+5Ri9Sdz2ccf4TInhA==
X-Received: by 2002:adf:f34c:0:b0:21d:6705:87dd with SMTP id e12-20020adff34c000000b0021d670587ddmr20717172wrp.430.1657180359439;
        Thu, 07 Jul 2022 00:52:39 -0700 (PDT)
Received: from groot.home ([2a01:cb19:85e6:1900:334b:5931:88c6:bbd2])
        by smtp.gmail.com with ESMTPSA id m16-20020adfe950000000b0021d70a871cbsm6972089wrn.32.2022.07.07.00.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 00:52:39 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Fabien Parent <parent.f@gmail.com>,
	linux-input@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: [RESEND PATCH v3 0/2] Input: mt6779-keypad - fix hw code logic and row/col selection
Date: Thu,  7 Jul 2022 09:52:34 +0200
Message-Id: <20220707075236.126631-1-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_005244_159286_2F7EEAFD 
X-CRM114-Status: UNSURE (   8.68  )
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

Input: mt6779-keypad - fix hw code logic and row/col selection

This serie is the first follow-up on the mt6779-keypad in
order to enable it on the MediaTek mt8183-pumpkin board.

To fully enable it on mt8183-pumpkin, we still need:
* double key support
* dts changes

To ease up reviewing, I preferred sending this first.

The first patch fixes a logic bug based on the (non-public) datasheet
I have.
The second patch configures the keypad correctly in order to not
report bogus values.

Thank you,
Mattijs

Changes in v3:
* reworked row/column logic as discussed in [1]
* Dropped Angelo's review since patch 1 changed

Changes in v2:
* Simplified SEL_COL/ROW_MASK macros as suggested by Dmitry
* Added Angelo's Reviewed-by on patch 1

Mattijs Korpershoek (2):
  Input: mt6779-keypad - match hardware matrix organization
  Input: mt6779-keypad - implement row/column selection

 drivers/input/keyboard/mt6779-keypad.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

[1] https://lore.kernel.org/r/YpMDZORAlHmg/x/0@google.com

base-commit: c4bcc1b99b8b8acdfe673e4701a9c2acb6b8b2fb
-- 
2.34.1


