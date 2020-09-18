Return-Path: <SRS0=3MyJ=C3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 207A8C43463
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2020 10:00:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B46C6206DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2020 10:00:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kc7YrDvj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="uYLROxXB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B46C6206DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MvmmhslNz1XCNnMWA+1iEZ1Lznlh/dvPvj/vjt0VVcE=; b=kc7YrDvj0zQ9gJvnJHAu0wpyP
	htdPlG3A+tornaNMkiBoihwiByVE1EQLEc/RTKC7YqhGQjAasadpE0gtaOEROzWD41vEAGPFbIwqS
	JBlWpy7WmCCpioaOwoNAZ/fUYZzcILdv0cWRXN93ZWp5LXl2bH29QUUViajqVFaAUJfqYMBZ5pWFp
	b/hRIilFcJ6f/ATpWmQu3gsMdssxEPCnkkFY9FCdDKpJj74619K6PEXH02BeMe9uaWqLXxRzLSiu7
	JUx2TNapYbIQZGweuu/Nwmg1kcnaWQYEV4uvsMeewBMdbo9VgCU+e0vS8ZoWRuZExTR0fMAAAcJ0i
	ov3hm0daw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJDCA-0002Hq-QY; Fri, 18 Sep 2020 10:00:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJDC7-0002Fr-Uo
 for linux-mediatek@lists.infradead.org; Fri, 18 Sep 2020 10:00:44 +0000
X-UUID: 17a5a9b29cbb4bfab93c55aa136a088c-20200918
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=DTzHJ0x3J7AjDNKHrUyRTj2CRSv0RSJyT9HCWPEn1sY=; 
 b=uYLROxXBCzgU0DUKwJTITwNdgQbPEt7g0lOwclFMaWCZg6HTSrc6ZUpaquAVcQnfJLLpbJACzTPi/fSsBt/yGLmYivEGwQe8hj19ezM2AdjTdGu4xEZ3bOrMyxpqf4RdYFUsXt0MQBdpWETq9Ge+9gjb1yALX7QdrmwFhtmwSLo=;
X-UUID: 17a5a9b29cbb4bfab93c55aa136a088c-20200918
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <shane.chien@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 497532964; Fri, 18 Sep 2020 02:00:39 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Sep 2020 03:00:37 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Sep 2020 18:00:35 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 18 Sep 2020 18:00:35 +0800
From: Shane Chien <shane.chien@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: Use memset_io to access I/O memory
Date: Fri, 18 Sep 2020 18:00:19 +0800
Message-ID: <1600423219-29058-2-git-send-email-shane.chien@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1600423219-29058-1-git-send-email-shane.chien@mediatek.com>
References: <1600423219-29058-1-git-send-email-shane.chien@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200918_060044_147897_53973169 
X-CRM114-Status: GOOD (  13.01  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 linux-kernel@vger.kernel.org, jiaxin.yu@mediatek.com, shane.chien@mediatek.com,
 linux-mediatek@lists.infradead.org, eason.yen@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "Shane.Chien" <shane.chien@mediatek.com>

Use memset_io to access I/O memory, instead of
memset.

Signed-off-by: Shane.Chien <shane.chien@mediatek.com>
---
 sound/core/pcm_native.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 9e0b2d7..a4efa84 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -756,7 +756,7 @@ static int snd_pcm_hw_params(struct snd_pcm_substream *substream,
 
 	/* clear the buffer for avoiding possible kernel info leaks */
 	if (runtime->dma_area && !substream->ops->copy_user)
-		memset(runtime->dma_area, 0, runtime->dma_bytes);
+		memset_io(runtime->dma_area, 0, runtime->dma_bytes);
 
 	snd_pcm_timer_resolution_change(substream);
 	snd_pcm_set_state(substream, SNDRV_PCM_STATE_SETUP);
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
