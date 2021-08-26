Return-Path: <SRS0=zgIi=NR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8471AC4320A
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Aug 2021 14:45:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BA30608FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Aug 2021 14:45:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4BA30608FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0aqYlIcMiXJg7MWnCLgaWkZg8RN7kw/Cq38VvSNyQuo=; b=dao3CYC4pUfFBx
	JfYhxAeh21VMSJ8lzXCAMQccEHKDrKMc3W6RiqdYHccc18u0wM2f0jGuWo5jsS3cz6Nev39VfNtlt
	VSJnfdpZwKTSIRkjV3J854UY1VW9nS9tx8heFh4YAKxUmveYShleERTuG7k5OBCx4E52c2HeF8SOA
	15mJukoH3yi08WNc+wHKdijtpH8PaqrxSrc9mTRzoGFF29kFl4t8doctszqXZnaR4iXRaaV/YVKwF
	Gx1lZtVDO0lj0F7ik43zvz5ZFu7wWONTU6xdQwWX7whFEKRv3UQHjx9oC8UJ6OBT8Aca3Kv7LLeoq
	fY8iYjME0tEDKb71TuQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJGdV-00AOnw-1v; Thu, 26 Aug 2021 14:45:45 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJGdH-00AOlH-Vt; Thu, 26 Aug 2021 14:45:33 +0000
Received: from guri.fritz.box (unknown
 [IPv6:2a02:810a:880:f54:b4b4:99cd:b7bb:6e84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id EC1F31F44473;
 Thu, 26 Aug 2021 15:45:26 +0100 (BST)
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, kernel@collabora.com,
 acourbot@chromium.org, andrew-ct.chen@mediatek.com, courbot@chromium.org,
 dafna3@gmail.com, eizan@chromium.org, enric.balletbo@collabora.com,
 houlong.wei@mediatek.com, hsinyi@chromium.org, hverkuil@xs4all.nl,
 irui.wang@mediatek.com, maoguang.meng@mediatek.com, matthias.bgg@gmail.com,
 mchehab@kernel.org, minghsiu.tsai@mediatek.com, tfiga@chromium.org,
 tiffany.lin@mediatek.com, catalin.marinas@arm.com,
 Will Deacon <will@kernel.org>
Subject: [PATCH] arm64: defconfig: Enable media drivers of mediatek
Date: Thu, 26 Aug 2021 16:45:16 +0200
Message-Id: <20210826144516.6359-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_074532_182616_02B81D1D 
X-CRM114-Status: UNSURE (   7.91  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

add as modules:
VIDEO_MEDIATEK_VPU
VIDEO_MEDIATEK_MDP
VIDEO_MEDIATEK_VCODEC

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f423d08b9a71..f97da10a21ea 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -669,6 +669,9 @@ CONFIG_VIDEO_RCAR_DRIF=m
 CONFIG_VIDEO_IMX219=m
 CONFIG_VIDEO_OV5645=m
 CONFIG_VIDEO_QCOM_CAMSS=m
+CONFIG_VIDEO_MEDIATEK_VPU=m
+CONFIG_VIDEO_MEDIATEK_MDP=m
+CONFIG_VIDEO_MEDIATEK_VCODEC=m
 CONFIG_DRM=m
 CONFIG_DRM_I2C_NXP_TDA998X=m
 CONFIG_DRM_MALI_DISPLAY=m
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
