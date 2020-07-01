Return-Path: <SRS0=KJBd=AM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C88AC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2020 12:47:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 196C420702
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2020 12:47:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VcTCPtuG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NkxOWXIN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 196C420702
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JsBXxMkedrt0rlCn26R4ZJZyODRq+z/2CdNGHXJ6WzY=; b=VcTCPtuGrd+Vue5MTkBzpAg88
	MJa5qPM27K1JGMxKbaJMAfRru0NmP26/71cmslmK94ESv0TmUG1kbNBW4zVNCDQmKsSHvnCDuSRxr
	uptcdJf+NKCwTuDYuGJ7hbLI1Z8xYkZU4z9HJr6Pv+aLjLzyhdGsFD/OJZ8hgLz3rcf02Q/LV20cY
	HJ0G0BfA2yCfc2TsY6AHwoX+E6wd/hCnpK9uOogNAhw+FZ71Ap6nyx38h+xiRvXuJOo8ByQPJju7p
	6HcJB3fyIowDNJUrpNTD8Kw4oRfoKa85wiEU8PweBM+wAfkmPoKk6i5vSvF9TpN1EqtZLJYltGIrE
	l1NX8uwYg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqc99-0004ws-5Y; Wed, 01 Jul 2020 12:47:27 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqc8v-0004ql-Ul
 for linux-mediatek@lists.infradead.org; Wed, 01 Jul 2020 12:47:15 +0000
Received: by mail-wm1-x342.google.com with SMTP id 22so22268676wmg.1
 for <linux-mediatek@lists.infradead.org>; Wed, 01 Jul 2020 05:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sJPW3QXOhHs7zWGK9W13Qhww3wag5wL/K8qzQE+aHP4=;
 b=NkxOWXINSEGLHqpysGjU6l/aLOB9D1RBUt6a9Cv/cmC44LR032HJ/q+z+4snhCTNaW
 PdMMvGuAtO6Ujsk4aFY5+ggkapbI0y8vbr63jnUFJyXL86NW5J8CQGij61gyCDHXbUvz
 q0ZXV3do+vtPoNt8BgF/Jqn4PdF42fkgGAD0WiII26VZNos1Zz4ezvQGo2YuQ6UVBJDV
 LjbxniUTQMcgraMb0BQXgE7a+gMVTa48nOSq35qfFocyo8c0E6lg3HCVEfXt60C77tY6
 reC6aeGYzXZElVG8Ik/hDOwn7VmhUGcSH3jWARgSvgWiATkKl6mXLwuzriMC6WwSkV18
 Tz5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sJPW3QXOhHs7zWGK9W13Qhww3wag5wL/K8qzQE+aHP4=;
 b=n8x6JP4cdBGZ2IyZFPmTwgefAAvWC6at89/+TDebX/wMLAHNNGt6XKUIAnor+xtRf6
 vZKHBpAobwM5XkGNIyQx10kYkCgYO5OkFY85fq22q3LjvbAdwRvko61jXpNXZLiwlkCZ
 M8JrmFrObMnhMjwOfIirxQVp2xDP4UtXfwuZqyUHeKP48dkPSlTJcjjQjVgj98rrvmn4
 vtvDzaTFT+UwuHnfVWnN4e9qDkWuxgCoa30ZS8x6NKsn8CS1+KVb/1IW4iwYn194hzPs
 hbhTwf9RTwP/f9fvfGcsqr1j6pCwDLzlLn2fSYe8bfqxnVqOouEqZQo4u8uj+Nb9V3aI
 Qg+A==
X-Gm-Message-State: AOAM5308JRCPuSrVTieKvdX+8krH9R9bp3E4jlCq1Kl2tYnVouVd9vYO
 7S1sNYhamfm7cX3DxsnsDQ6DWw==
X-Google-Smtp-Source: ABdhPJxnFAAMJptNueVPmlk8boLIXJmBHNOeNDTpH4SZs6YyRbzwAScqFRsTswPCfpzS6+CQ/Dp17w==
X-Received: by 2002:a1c:6006:: with SMTP id u6mr26009722wmb.111.1593607632721; 
 Wed, 01 Jul 2020 05:47:12 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
 by smtp.gmail.com with ESMTPSA id o29sm7817862wra.5.2020.07.01.05.47.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 05:47:12 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: ulf.hansson@linaro.org
Subject: [PATCH 05/15] mmc: host: mtk-sd: Demote msdc_recheck_sdio_irq()
 function header
Date: Wed,  1 Jul 2020 13:46:52 +0100
Message-Id: <20200701124702.908713-6-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200701124702.908713-1-lee.jones@linaro.org>
References: <20200701124702.908713-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_084714_045993_170DD52A 
X-CRM114-Status: GOOD (  14.21  )
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
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Chaotian Jing <chaotian.jing@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

No other function in the file is documented using kerneldoc and no
effort to document the function arguments have been made.  It's a
bit of an oddity to say the least.  Let's downgrade it from
kerneldoc to a standard comment block instead.

Fixes the following W=1 kernel build warning:

 drivers/mmc/host/mtk-sd.c:1030: warning: Function parameter or member 'host' not described in 'msdc_recheck_sdio_irq'

Cc: Chaotian Jing <chaotian.jing@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mmc/host/mtk-sd.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index 39e7fc54c438f..49ac802ebbfeb 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -1018,13 +1018,12 @@ static int msdc_auto_cmd_done(struct msdc_host *host, int events,
 	return cmd->error;
 }
 
-/**
+/*
  * msdc_recheck_sdio_irq - recheck whether the SDIO irq is lost
  *
  * Host controller may lost interrupt in some special case.
  * Add SDIO irq recheck mechanism to make sure all interrupts
  * can be processed immediately
- *
  */
 static void msdc_recheck_sdio_irq(struct msdc_host *host)
 {
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
