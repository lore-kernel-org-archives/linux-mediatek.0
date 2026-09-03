Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A881C624A4
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2026 04:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ESwlNjvZs7Wa/B2Z+WZbhnploP2cGr2N9OS4nSRjKU8=; b=hLs+Dwg6GAat40kGz0gDgKq6or
	N/x7tq2oJIvB39HXB/H3ZVdj9GS6LhYDEkjt9Lig7dh3B4vFTlfexG1wCqp0LMlInjPaHHM3MpToL
	8NooT3cRnBPK3IyQE73OYBr8vgjEFCmq+ouS2BWosIUeNPYCm9yBoKyrkWpxD3fH/BdW3DFdhf9Sr
	U+xgM4DjL2fwJR//S/iBRQnwBrYxFrjNk+BE7LboQJSSAhBLyFgEJOIQv6Jd1JveARSFGaeSidMfh
	IaWOmjq440Fdwic0qbaf6yrdCxmLgutCs3xEoEBzI3rVqQrSGY5XbjQI8nLYtJYbZu4qiHQ//hhet
	dl2zJxmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zRP-0000000GLWv-3JaU;
	Thu, 03 Sep 2026 04:52:47 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zRN-0000000GLWA-3Z9Q
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Sep 2026 04:52:47 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-cc1cb472b76so1766213a12.0
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 21:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788411165; x=1789015965; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ESwlNjvZs7Wa/B2Z+WZbhnploP2cGr2N9OS4nSRjKU8=;
        b=sYrm27thMMcxTb1Su+vsTtzH7yZz2+yMEhMYH+gvqFHwd6eyB5u3NK+n3SgDO0/cPA
         dUGD2zGCN4iak6KDb491glL1HF1Bxq2OcIN7Lg8rb8QiarbTIG2Y4Km6qk0V3WRy4fEH
         v3WsW8UQcIniLB9sWmJ1Eiy3KWxe8AXIpLH/CaRZ+zd956D8b0J0uFi2oWcXxSpaICok
         a+zfWbKqvfKyT+f5H+Bex1ocIfgZZFAaRdYBhwz7WsCqmX6dTfXPX9jU0aeLAZwf3tjw
         /EHx+DenXygp6DDZKu0km9WKAJPWFwW0rg3SYLyytyz7VcKDMIdho2YbwEyiPbKMe7vi
         wFwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788411165; x=1789015965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ESwlNjvZs7Wa/B2Z+WZbhnploP2cGr2N9OS4nSRjKU8=;
        b=AX4nC4m2pNA7rffTxHq6fNAmR+t5zfsKobNCgmjy2L3/+0VLQBFi6M9nkCigJNqz7w
         wyNg5zGtDLUnpePH+oqtJ9RVQoDx9jUjUFnwiSG3aBj6LRlYSyzxE9TUUKn+/SOEQzII
         A8Ioe78uxrQv6OP/64a6RIldmEpvFDD6a9hFFE1Juk6IddY6u+k4uLUr1MWMKAvo86iK
         ZMZIQ0IaWoRrNt12m35iScQy8Kovb/TOtLrJK+h3auQ/6H0DowIaTNwDYEUZqXTqzbbm
         hl3eptNC33117Ta+xAlI04jW2EXo5Lwqz+BksX6yu1NF4xWzvf4rmCikhLAMgNzuFOY3
         d4gw==
X-Forwarded-Encrypted: i=1; AKwUvBy1I0jIZaU6MkBNVAVZjzqm5Y8aH3rZU6aX5G62LZ/jdZ9yhZ7OKQ/HIkX/A0JkPaWUeiHxwWsY7ItV3015Mg==@lists.infradead.org
X-Gm-Message-State: AFuF++ka2NOH8Qi0B37QcN9TtDQBR1NK8JimaSOtXsrfyrVfdvF2ijOG
	hnZY5y2Zb12KDvnx0LsXYSSgP+aJ8/xD0A77CpHmvp5zay9FNnef4RiT
X-Gm-Gg: AYBFou1uaE2d8jV2Bt1lUjNQH8cerZCgLuYENUn3sCRbeyCiZaqReOfsEWULabAxyla
	yVohqFlsgzo/ztF3Qp+GnmhnsRHUtGKP8ofr5sGkSoFCniAtFwvCg++4MZtamEcwjujLQu/pq6w
	HGrfH6I3yd0Xh2aey49DtewfuLPQxW31fMbvi+lz8O6xo9gRrcWS9CbKF2U2xhlYxcNvXJ42o4L
	762TVgvsjRSLN1lyvg7XCxrJw11Nix6rrTM+OOCKn/pTpMObekAn7Z1QQr8W3NWH31zPjRUOSaM
	noDk2ePZZSUZYFlXJ/Ci1QCidl41ncv+kFObgpALKnAX8/D48rzP7xtKwJoFu88FI2R/X/NMH4m
	O+KFAAR1xsDFWnX/1bJ8JlzvWVYiWd93lcmJcX4mKey3JABIZusAjMCcI9/CKmjSszlgXaUT1Ar
	39DsbWeJn+ecp+pIR55WJW2JK9gbp52uV2WinH3EenlXxpvO349UZor5xgZVSZytwRdrT+x9JFF
	Ws1qSYaVvSQ/mJj7KspEL32lmgwpCGvoE0V6WwJrrETNrYQS9Irs1LweRShN1XNG6NOar7L0hTn
	bKcU
X-Received: by 2002:a17:90b:17cd:b0:38e:67e1:15b with SMTP id 98e67ed59e1d1-39aededf539mr13392201a91.6.1788411165011;
        Wed, 02 Sep 2026 21:52:45 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d0d7e8sm2747538a91.16.2026.09.02.21.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 21:52:44 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Shunli Wang <shunli.wang@mediatek.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 0/5] ASoC: mediatek: mt8183: Fix clock error handling
Date: Thu,  3 Sep 2026 11:51:58 +0700
Message-ID: <20260903045203.175337-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_215245_890314_2DFE192E 
X-CRM114-Status: GOOD (  10.13  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series fixes and cleans up clock error handling in the MT8183 ASoC 
driver.

Compile tested only.

Link v2:
https://lore.kernel.org/all/20260821122928.41343-1-phucduc.bui@gmail.com/

Link v3:
https://lore.kernel.org/all/20260828050526.590761-1-phucduc.bui@gmail.com/

Changes in v2:
 - Remove the redundant error log for apll1_mux_setting error handling.
 - Add Fixes tags.
 - Add a cover letter.
Changes in v3:
 - Add a patch to fix clock handling in the mux disable path, 
   as suggested by Cezary. 
 - Return directly from apllx_mux_setting() instead of using a goto label, 
   as suggested by Cezary.
 - Add a Reviewed-by tag.
Changes in v4:
 - Add a Reviewed-by tag from Cezary.
 - In the mux disable path, remove the goto labels so that all teardown 
   steps are attempted and any errors are only reported.

Best regards,
Phuc

bui duc phuc (5):
  ASoC: mediatek: mt8183: Fix wrong clock cleanup on clk_set_parent()
    failure
  ASoC: mediatek: mt8183: Fix clock handling in mux disable path
  ASoC: mediatek: mt8183: Fix APLL enable error handling
  ASoC: mediatek: mt8183: Use dev_err_probe() for error handling
  ASoC: mediatek: mt8183: Drop redundant probe error messages

 sound/soc/mediatek/mt8183/mt8183-afe-clk.c | 31 +++++++++++-----------
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c |  8 ++----
 2 files changed, 17 insertions(+), 22 deletions(-)

-- 
2.43.0


