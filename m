Return-Path: <SRS0=zPgu=IK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6505C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Mar 2021 14:56:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62BA664FB3
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Mar 2021 14:56:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62BA664FB3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=K1k2Z5oLpx6+gVS5E0MzG0WwMrIdECUiej4oYmYMtW8=; b=MbJDJWCKpqLOob1MazdjYklmV
	QqZFlZPTfW/+Rh5kBhPCy2KCLVRHlnYJoY+VLO/soEtjW2LMVVhAakJrGq8XWhzHtIOJyYxUxa9km
	ySpFnAkEH1XthvJUMfYrFQz66Zd9EgNgr1nmbpwM0oRCgnJOsZ/NaDAUmmyP3vAROwvXXXkxEd02Z
	vHq4B0HHU6w8VmBp+mjqnlD8N/FW290tO5AeU7q/gNARVfscwPnDSUvVxw3exSB3/dWdO+qTtIanY
	fkuCgc0x8610QhlOg3+ipqAtEMZdQ9nSafS0WZ/fObwz0H9MNQPLBtkomHZZnxjYPcwl2fvUJCVu+
	zqfbkN4BA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKjDZ-00Bgms-Ml; Fri, 12 Mar 2021 14:56:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKjD0-00Bgf5-IJ; Fri, 12 Mar 2021 14:56:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0A9DE64FF3;
 Fri, 12 Mar 2021 14:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615560969;
 bh=Ywd2fbIlwdEKuoislyKBKy60FlzB2Pp3hQxuP2yVuMs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WaDs2NOneOopLzjjXKp+V7QkdvG+dKYTsqW2+f6U4FrswBtMZ/Fs6EMTWOwIh9RLN
 KB09cZ+LOOee+GnsafGTvSdMZ6iJFs6TMGRF7tguuwPZ4AKW9j3ERIXF2VbsnkCKut
 jqclKst7d4ITY/+wIhrhmA1eJIGthFDH46ztVXlq6GqnEwBU2Fi/WFFujtmKzcN/BQ
 sJ6+1ykH7jrtAg1KaZqHEPpt5tLtGUGl+8X/ES/bgmweOQ7GIXJUfXAjjHjdcLzEBQ
 t+p6C7D45BgL5d7e1p1EThv+GQlR1erqkJC1TEsprZYGztHA0cfsrP3LGkIrxeylkz
 VpOw3RoKFLeZA==
From: matthias.bgg@kernel.org
To: lee.jones@linaro.org, robh+dt@kernel.org, matthias.bgg@gmail.com,
 lgirdwood@gmail.com, broonie@kernel.org
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <mbrugger@suse.com>
Subject: [PATCH 3/7] mfd: mt6397: Drop of_compatible for regulator
Date: Fri, 12 Mar 2021 15:55:41 +0100
Message-Id: <20210312145545.26050-3-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210312145545.26050-1-matthias.bgg@kernel.org>
References: <20210312145545.26050-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_145610_858282_90C47969 
X-CRM114-Status: UNSURE (   8.39  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Matthias Brugger <mbrugger@suse.com>

For regulators a compatible string is superfluous. Drop the string.

Signed-off-by: Matthias Brugger <mbrugger@suse.com>
---
 drivers/mfd/mt6397-core.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 7518d74c3b4c3..13037f4bc54e7 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -67,7 +67,6 @@ static const struct mfd_cell mt6323_devs[] = {
 		.of_compatible = "mediatek,mt6323-rtc",
 	}, {
 		.name = "mt6323-regulator",
-		.of_compatible = "mediatek,mt6323-regulator"
 	}, {
 		.name = "mt6323-led",
 		.of_compatible = "mediatek,mt6323-led"
@@ -87,7 +86,6 @@ static const struct mfd_cell mt6323_devs[] = {
 static const struct mfd_cell mt6358_devs[] = {
 	{
 		.name = "mt6358-regulator",
-		.of_compatible = "mediatek,mt6358-regulator"
 	}, {
 		.name = "mt6358-rtc",
 		.num_resources = ARRAY_SIZE(mt6358_rtc_resources),
@@ -107,7 +105,6 @@ static const struct mfd_cell mt6397_devs[] = {
 		.of_compatible = "mediatek,mt6397-rtc",
 	}, {
 		.name = "mt6397-regulator",
-		.of_compatible = "mediatek,mt6397-regulator",
 	}, {
 		.name = "mt6397-codec",
 		.of_compatible = "mediatek,mt6397-codec",
-- 
2.30.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
