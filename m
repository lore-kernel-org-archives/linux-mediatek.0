Return-Path: <SRS0=Skuz=LT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,FROM_LOCAL_DIGITS,
	FROM_LOCAL_HEX,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D61CC2B9F4
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jun 2021 12:32:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E62061878
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jun 2021 12:32:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E62061878
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=163.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+q2EXBUR1vOzu/nhqZ6iWROfu3VVXTVwpOhlvfRDwO4=; b=WpOM4tFTxoX7lc
	OfeiFYi2cFIss9gEtlTLn8/ZzLkTl6RD+xAFQvOQIYwH6v3MHRXcOeHx367gVs9rhDFWJ5b5Rnu0V
	YgRallwZjSXgIrfz2OoOgcGAjXU4fTc8UE6gwKSarQ++D/TOmrn/vNvVG/1MKQb2PBnpJknYSivG/
	rRUR7Nq/bRjhbo+PJiA8xgymTm2lLqcquh1nRPZUoR3LWUp+HmVLScjZ+PxiE1hSVaCCTCB4H4jUy
	jq/pwD9JExxu+Rq1Q78FqHSATsqtNWg9UefYgl3eQuJvvfdBz6W7uVuri4TJQAKCmI5hiXW1V1fe/
	1FlLN0HKwlGfrA3N3MXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwl0b-001SY5-D7; Fri, 25 Jun 2021 12:32:33 +0000
Received: from m12-11.163.com ([220.181.12.11])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwl0N-001SU8-9P; Fri, 25 Jun 2021 12:32:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=HtJQV
 9EtAC2qyxvZO+JK0dUGs8ISgYjR0FsgXeb14II=; b=NBKTKxrOaj3cM5Ybk9mQv
 L9SkpVHGptvT7aUj7LA3w+RFNO0+P/pQm5/1aofwGpx+sI53fGb9ZopKsSiLf4nY
 E/76LCiU/CUaecPUzkWwk+J+kSwcPILvQv5jh1BQwkhOo3cVbScy4IwzK2KP910H
 4v17BtDs59A93b/2YGao44=
Received: from ubuntu.localdomain (unknown [218.17.89.92])
 by smtp7 (Coremail) with SMTP id C8CowAA3R3_AzNVgSHY2jw--.55453S2;
 Fri, 25 Jun 2021 20:32:01 +0800 (CST)
From: 13145886936@163.com
To: perex@perex.cz, tiwai@suse.com, matthias.bgg@gmail.com,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	gushengxian <gushengxian@yulong.com>
Subject: [PATCH] ASoC: mediatek: mt8192: Simplify if else codes
Date: Fri, 25 Jun 2021 05:31:59 -0700
Message-Id: <20210625123159.490218-1-13145886936@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: C8CowAA3R3_AzNVgSHY2jw--.55453S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZr1rKw18XF1kAw1kAryrWFg_yoWftFg_G3
 4kGwn3ZFW7JrWxCa9rtrn7urnrXFy8CryIvF4Yqr13t347XF4rZwnFqF47ur4DZw4vv34f
 A34Svw4fXr1qyjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU5JMa5UUUUU==
X-Originating-IP: [218.17.89.92]
X-CM-SenderInfo: 5zrdx5xxdq6xppld0qqrwthudrp/1tbiGgG8g1aD+PMCbAAAsU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210625_053220_170560_EEE403A1 
X-CRM114-Status: UNSURE (   6.82  )
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

From: gushengxian <gushengxian@yulong.com>

Simplify if else codes.

Signed-off-by: gushengxian <gushengxian@yulong.com>
---
 sound/soc/mediatek/mt8192/mt8192-dai-adda.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-dai-adda.c b/sound/soc/mediatek/mt8192/mt8192-dai-adda.c
index f040dce85da5..f8c73e8624df 100644
--- a/sound/soc/mediatek/mt8192/mt8192-dai-adda.c
+++ b/sound/soc/mediatek/mt8192/mt8192-dai-adda.c
@@ -413,8 +413,6 @@ static int mtk_adda_pad_top_event(struct snd_soc_dapm_widget *w,
 	case SND_SOC_DAPM_PRE_PMU:
 		if (afe_priv->mtkaif_protocol == MTKAIF_PROTOCOL_2_CLK_P2)
 			regmap_write(afe->regmap, AFE_AUD_PAD_TOP, 0x38);
-		else if (afe_priv->mtkaif_protocol == MTKAIF_PROTOCOL_2)
-			regmap_write(afe->regmap, AFE_AUD_PAD_TOP, 0x30);
 		else
 			regmap_write(afe->regmap, AFE_AUD_PAD_TOP, 0x30);
 		break;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
