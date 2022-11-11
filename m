Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A3DC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Nov 2022 08:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O7XFRD57Ip4dGqDJ0XOR7pxNjCqTahxYqdQzy3E8aVM=; b=QBUgBlMjC/G7I7ez7TDqBgq2cY
	EHPia+wfMRKb5aM5tlC78L5sWNV7wbZlqdH8MbK6xtoB6zEl7+y5m4zEIHSZLHtooiQS3A5ygJorR
	bKzxc7kCOviSASe7wHEYqEbLMseH0JIXe0Cng6jG1QV08Re1Grec+FSipwlZFfm8Og1+Ozfuu3pcp
	BGK90odxKFO0arXlZ3WmLHVztuA4UdGoEXLzJB3mN7kk8tv9Bnd1N0Am6IUlK8i2T7KH6/i47TG0k
	mJcCduwsx5qNEiacigYaVOJ1V42BwZ/Afje10J5OV1o0FVUfVwSKE5puOIpUcRLGcI2oPAszyyOE+
	JlBs7iOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otPPy-00EDzA-1L; Fri, 11 Nov 2022 08:29:42 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otPPm-00EDwD-OQ; Fri, 11 Nov 2022 08:29:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 654EDB8244E;
	Fri, 11 Nov 2022 08:29:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C739BC433D6;
	Fri, 11 Nov 2022 08:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668155368;
	bh=IbKTOSMRuvpV8+oOxfdFXA1JqBMgz65cI7OeqnvELIk=;
	h=From:To:Cc:Subject:Date:From;
	b=STTRE6H/1T/mrvwgv3N6PQyijKtXpeAPGlTOng+Osur9C0CwbVaiO9InFBF7R7Q3H
	 cisSqYm8zwxZjrgPdkHu/3VSAnLRnHNrwshrfC0Q4gA/tQ/ED9ht4sVr1+1GPB2nIS
	 p7g8CUfJzAZgCJ4ZRZNK0KWSsg/DmZKHkLHX7Ug9hJNqNVXhVoIvz4VEf3ap6KxysS
	 2F74FPN/SQg5I3IFmSms3bHZfD5+O0oTJ7jyfv0cjYngcD08dZxM09+trxaTGX5atV
	 hPWd/ByQacSUXyxWZPM6NnJtQ53VW96zs2AIWEHqCM1UZ5Bu6cKVo25053IyiM+vNQ
	 N40vxDESs3Law==
From: matthias.bgg@kernel.org
To: matthias.bgg@gmail.com,
	nancy.lin@mediatek.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] soc: mediatek: Add deprecated compatible to mmsys
Date: Fri, 11 Nov 2022 09:29:12 +0100
Message-Id: <20221111082912.14557-1-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221111_002930_957561_B0FFE81D 
X-CRM114-Status: GOOD (  11.41  )
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

From: Matthias Brugger <matthias.bgg@gmail.com>

For backward compatibility we add the deprecated compatible.

Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
---
Changes since v1:
- fix drive data pointer

 drivers/soc/mediatek/mtk-mmsys.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index ba2e79b26993b..f3431448e8431 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -303,6 +303,10 @@ static const struct of_device_id of_match_mtk_mmsys[] = {
 		.compatible = "mediatek,mt8192-mmsys",
 		.data = &mt8192_mmsys_driver_data,
 	},
+	{	/* deprecated compatible */
+		.compatible = "mediatek,mt8195-mmsys",
+		.data = &mt8195_vdosys0_driver_data,
+	},
 	{
 		.compatible = "mediatek,mt8195-vdosys0",
 		.data = &mt8195_vdosys0_driver_data,
-- 
2.38.0


