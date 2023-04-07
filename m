Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 072BEC76196
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 11:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n4yjwe4G2G9/env2LGiwcE/Ce2F1TWlNc2OcCX0hL4A=; b=ESYXJqwfU5fI1dqILu1PQASiy7
	Q73cEtuVtfMalAc+GJVd1SLcila/b3RL0LV+kurwP1OoTsuN+TJPS+IK8ZLUKrXuprXpMFfoWHaFi
	SrB0+NiZMEhPVwMd/MXrqlXtpxK+R42Ksa4fwgxICcN2k6jVCGPtPlhFjDaCpPpPRdvWjZpmFgU9q
	nDhZxEyJySzemW9n4dVexjtl08u8kE9aIZ8F19lX9wNddmlOu77insMmr6b3WNe9E/epRl4KnaZm0
	eUsJvLINpBZn64P4Rj08nnK66DOR5O623BOFXegwmWrLJqTFeQ+VxWFlZ2b+93g4ssBKJHGYAx2ME
	/jQCWpMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkkhL-00A84u-2w;
	Fri, 07 Apr 2023 11:56:08 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkkhH-00A83s-0G
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Apr 2023 11:56:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680868558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=n4yjwe4G2G9/env2LGiwcE/Ce2F1TWlNc2OcCX0hL4A=;
	b=E3U7Wh7ECWyrUkS6D/zbhCF147KS4jscbnVtz3mLXfthHIQSMRR6rV2zJVe3e9p8SYknAv
	GdXcUU1LZWBhjRKm/Bmcqb3OHP8rdAayLynWLjm8qNRoyJrUn4pFWwTq5KU+/jvCk4eYyT
	L+zRsZKsNjA3HRNIHphkSo0D+btH8Z0=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-140-aHPPZUcOP_GYnx4u019v2g-1; Fri, 07 Apr 2023 07:55:57 -0400
X-MC-Unique: aHPPZUcOP_GYnx4u019v2g-1
Received: by mail-qt1-f198.google.com with SMTP id l13-20020a05622a174d00b003e4df699997so26505449qtk.20
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Apr 2023 04:55:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680868557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n4yjwe4G2G9/env2LGiwcE/Ce2F1TWlNc2OcCX0hL4A=;
        b=PcCBBi0HhJC8K5x0CPcnU1VSK3ZPO7a5ssk/obpgqeP3ya36ZmnIflcTO0Z8gB0Q/h
         MpL+2w6bEyPz5qv0kkJEWXFrbRnkB2H/qlyvodlBkbBoRpV/PCUQFlwyQl5UbgmAvwQ8
         5NAEktfrnRZeIbTCtumV/zP+C0WW7bR3euMrFwVkHZPsK+MhRGKpHvT/0g2gcjHIbNum
         UzGk3TEltVv4QfV2KFi3BRhcjcvjNVKDtgAN0Jm+z/Z0yzJ8b7zaIkAEfQRLXAoQYM08
         hPvm/hVP7EMnXhtFOBezMgyuQgjpSXIoVjLfNZl4uZsf1gfG0wZbNR50xNcRHcqG4DFf
         4Chg==
X-Gm-Message-State: AAQBX9e79xkToJx1b9xj03dvZgISSBtBNAvcLiUle3mXe/qO5b6W/yqH
	35NRbS8un4nHNEHXwBIzy2vsDXrOfYCI/ga6Cc6maAGN3GntF6vHzFrpv3EZlVjrah2srEMldQy
	qA6zVr+3aqdfterGX4zN81SbqfEZDSyk5
X-Received: by 2002:a05:622a:1646:b0:3bf:b70b:7804 with SMTP id y6-20020a05622a164600b003bfb70b7804mr3553533qtj.25.1680868556874;
        Fri, 07 Apr 2023 04:55:56 -0700 (PDT)
X-Google-Smtp-Source: AKy350bl0Z3EzCJjIcLXRO1sAvzdukxxqrzrxNB4Iggt9a8A/nFDAbH/D/tViLjUBbsmcHprRWWaUQ==
X-Received: by 2002:a05:622a:1646:b0:3bf:b70b:7804 with SMTP id y6-20020a05622a164600b003bfb70b7804mr3553498qtj.25.1680868556613;
        Fri, 07 Apr 2023 04:55:56 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id t186-20020a3746c3000000b00746ae84ea6csm1256321qka.3.2023.04.07.04.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 04:55:56 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	colin.i.king@gmail.com,
	fshao@chromium.org,
	jiaxin.yu@mediatek.com,
	allen-kh.cheng@mediatek.com
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] ASoC: mediatek: mt8186: set variable aud_pinctrl to static
Date: Fri,  7 Apr 2023 07:55:53 -0400
Message-Id: <20230407115553.1968111-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_045603_250226_EE2BE516 
X-CRM114-Status: GOOD (  10.17  )
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

smatch reports
sound/soc/mediatek/mt8186/mt8186-afe-gpio.c:14:16: warning: symbol
  'aud_pinctrl' was not declared. Should it be static?

This variable is only used in one file so should be static.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c b/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
index 20b9f5d810ec..f12e91cc4fcf 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
@@ -11,7 +11,7 @@
 #include "mt8186-afe-common.h"
 #include "mt8186-afe-gpio.h"
 
-struct pinctrl *aud_pinctrl;
+static struct pinctrl *aud_pinctrl;
 
 enum mt8186_afe_gpio {
 	MT8186_AFE_GPIO_CLK_MOSI_OFF,
-- 
2.27.0


