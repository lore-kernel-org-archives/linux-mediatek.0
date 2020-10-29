Return-Path: <SRS0=uLCs=EE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0211C2D0A3
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 07:47:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33A80204FD
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 07:47:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wjXzj5Yb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ujy//ADr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33A80204FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oWF0oAJtcPi//gGC7ql3OfuYr5GON7hc7V3wapPZCsw=; b=wjXzj5YbFpuYyEcVhbIUzFlTw
	mc8Gwp+iqf+1rwBS761a0OK5xMdDz0wK21MNteurUIbO9qlQh8mdS6BtTUo81Cj0ieLvuluIgqKPK
	sOdQGUhhDrtOREz8+G9sah40KQFZWDoCvtnQRcbjV0Xn+KrCy/72fs9SrdnRG9mMVss4HmVPtZ6Bv
	lEp7ljrhmnaANGe8QfCa4bb+F1upEXwKh+8nD9d66vJBjp2G3vI8Plnz0d5rsVVpe9yPs6vL35Sv7
	OPm7vG7UWj/wvwQXHQHLX11Vv/6kKaGeM/vCnC/O7v/kPaqpfCkMleNRE8c0Oey3ueCUiL1xp+XvX
	lsuvp+BPQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kY2ee-00005J-Lw; Thu, 29 Oct 2020 07:47:28 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kY2eV-0008TF-GO; Thu, 29 Oct 2020 07:47:20 +0000
Received: by mail-pg1-x544.google.com with SMTP id r10so1646157pgb.10;
 Thu, 29 Oct 2020 00:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RMptxvJmzOcZiuXNgbU/HwziNAPryxG8DYu7tZwcxLQ=;
 b=ujy//ADrms1eofnQAz11bblwO1E1flvt7rEanUwzH3ALIbzvBP8QBeaL8UwceylDcl
 YXu+MnsHF6Ic+PrAKO3yIyzJLA1R99bWvJYzlrOClwOiPjDKaipwPPi5E4RC/kYAE8SQ
 ZAaFZFUfYjlzhrKNLO/PD4/DxffevErzJ21FnJ8G9pPKJQnLrqQgnaYSF1rweqqAf/lm
 qrlo+rrqS+2m+4fbCkt8p94IQXKMtyAIOmlbGUmz/fX5f9JdlaYyBAEqlGq37dpDK0AV
 NQIDiHozX1XNOaonMf0QYYT2GexsXc/bwQWdeiaodSADmULgs8GPhKr9yk5arffDnDf2
 wTbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RMptxvJmzOcZiuXNgbU/HwziNAPryxG8DYu7tZwcxLQ=;
 b=ihdDxOK876RWfz8YWBxRtLeoMeQlCnbEGlY2qRlfDDpVxMKDRZWZ3xtJ18CzqJGVV/
 0PEbA5qMUSKkDCv7ye6v17iyZpZq8D2u5zc0XXLGBchteMwflioGK44ELE7/gIh/o6WF
 YWmICiWl1AbqejVJ+aUOKmAiYwq2rAmZjdB7SVy+cfx552jpiUZ4As+Os6SH1OfeB5wS
 G8tm7xeuq5lYdwCdFlcJZypMokSVQR763nacCVy6g4Dt8RIPxNrrl2/OtlgKPJj0qgSW
 KyNGOygT1xF9Gg3+k4Lqh7o9S8/vVR1y1wtwTnxz+vZrx+dcV5b3MOU8Iu73sLyFSKND
 Z8BQ==
X-Gm-Message-State: AOAM5319MBoM3VSdV3LIRvhY/5FLDgO++2HtUIDUabRpA3BJEgaweHhD
 r7S+IdoLl/OUMUrsgchht4E=
X-Google-Smtp-Source: ABdhPJw8P1RoK4I78C2zTcT3FY9ZJ4cZamb/26Rqvh2ViBc7KDj3Fnsuu9LYIO9HCkQJTW/1BzyCMA==
X-Received: by 2002:aa7:9dcd:0:b029:152:421f:23eb with SMTP id
 g13-20020aa79dcd0000b0290152421f23ebmr3223431pfq.58.1603957637685; 
 Thu, 29 Oct 2020 00:47:17 -0700 (PDT)
Received: from localhost ([2409:8a28:3c42:6840:9efc:e8ff:fef2:1cdc])
 by smtp.gmail.com with ESMTPSA id v125sm1864615pfv.75.2020.10.29.00.47.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 00:47:17 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: linux-i2c@vger.kernel.org
Subject: [PATCH 2/5] i2c: mediatek: remove unnecessary CONFIG_PM_SLEEP
Date: Thu, 29 Oct 2020 15:46:51 +0800
Message-Id: <20201029074654.227263-2-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201029074654.227263-1-coiby.xu@gmail.com>
References: <20201029074654.227263-1-coiby.xu@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_034719_563693_451664C5 
X-CRM114-Status: GOOD (  11.16  )
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
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, Qii Wang <qii.wang@mediatek.com>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SET_SYSTEM_SLEEP_PM_OPS has already took good care of CONFIG_PM_CONFIG.

Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 drivers/i2c/busses/i2c-mt65xx.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index 0cbdfbe605b5..c2939f2e5dea 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -1284,7 +1284,6 @@ static int mtk_i2c_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int mtk_i2c_resume(struct device *dev)
 {
 	int ret;
@@ -1302,7 +1301,6 @@ static int mtk_i2c_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static const struct dev_pm_ops mtk_i2c_pm = {
 	SET_SYSTEM_SLEEP_PM_OPS(NULL, mtk_i2c_resume)
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
