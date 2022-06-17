Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29C2C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 10:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JUh/bHw36MKI9KfeYCyLalDxvnkYkNzB5fpZd7noo7A=; b=fhjkxqev9vY+Me
	+qrdkjBlnf1CJZ68UwScnDOZSBdrNuZb6BfGx4QEtSFqcscFHR1imoqEjudfgw/NVybzJqjKSdX/s
	F/FIswxvgVQppRZOlagwCEELlcJHNcsPtwF1MM6Hsbm7/FF7Hxi5/5aOAmqzK3tJZDYesvPk+mXa9
	okdwvuITVeXq4D2lEEgCd/bID8OgCNLx9V19Jl2MxrFz6Nygq5N7OmAiYnB2w5l3Sem48Eyu+o+L8
	+g8SGuEUQVmQJiLwcIcK5AQa3AfCwM2clKlei0LrVorRH3QMgfULJSy8H7bLEhiKmeBVsykKUtOgw
	gvZCCV+1Srhfs9ZW1UTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o28vD-006tMT-5w; Fri, 17 Jun 2022 10:09:47 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o28vA-006tLd-28
	for linux-mediatek@lists.infradead.org; Fri, 17 Jun 2022 10:09:46 +0000
Received: by mail-pj1-x1035.google.com with SMTP id x1-20020a17090abc8100b001ec7f8a51f5so149918pjr.0
        for <linux-mediatek@lists.infradead.org>; Fri, 17 Jun 2022 03:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JUh/bHw36MKI9KfeYCyLalDxvnkYkNzB5fpZd7noo7A=;
        b=EBcPCrvNrluTSrKM0n6wApN287TyqIr9nV0eEF20OBwFtM9Bej0q/bAUjf/svaLoVn
         Ai/CmuhHaA+QXb4hVeknvDmwAVQwHVG1EAWhtibEc0eSjLdnS1AzCYeYt2slCt75sh9t
         loaz7o7UhssdYICnUoit5N6TBY03YQtXr4juA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JUh/bHw36MKI9KfeYCyLalDxvnkYkNzB5fpZd7noo7A=;
        b=6cqNQaQHjZtg05N07tDrqoXcU6ld+N/W+YObGwGc1c2l8/ufdz/7McvLq1PQbRFfBG
         64im1wp/x0lS2Ajk48SyDdWqgzpDsxPxRk721LvzeJd7tGujpFbtGopB7tEmX/TKNbWk
         72x4c2xg0ExynFsp4oxE/tPB7yEy39n6xaV2k6nNP1ZOg2OioCwjI97RFSHd8KjELo8m
         t8lgcmYFlnwUL3OxXeUcmvISEj26+x3uJaszFMKPiHy9jFJWryYmxVT3Gato40VQg68G
         529trPv1GFdqpIIlyQaoE7az6PyhXg0IYUE5dk4GfTDBasElbR27hDSXLS2lEDgBsH3P
         6Gqg==
X-Gm-Message-State: AJIora+9c+00KV1Sq1GYz5pGNvqiRjwu2yRRX+kwkvQtXNO3jqiV6vaA
	qvkpG/cWtC2WG9rpKdRHHYOFtA==
X-Google-Smtp-Source: AGRyM1vR4p23EKYSOBmxfH5Y3pMbGolPl1H0MOWkXYoT2MFmzc0ACWYKnY2gHyd0rGFDz3Llpf+bkg==
X-Received: by 2002:a17:903:22d0:b0:164:ec0:178c with SMTP id y16-20020a17090322d000b001640ec0178cmr9145864plg.127.1655460580273;
        Fri, 17 Jun 2022 03:09:40 -0700 (PDT)
Received: from fshao-glinux.tpe.corp.google.com ([2401:fa00:1:10:e616:b34a:9b5b:24ef])
        by smtp.gmail.com with ESMTPSA id o12-20020a62f90c000000b0051b4e53c487sm3337533pfh.45.2022.06.17.03.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 03:09:39 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: [PATCH] ASoC: mediatek: mt8186: Fix mutex double unlock in GPIO request
Date: Fri, 17 Jun 2022 18:06:33 +0800
Message-Id: <20220617100632.1447811-1-fshao@chromium.org>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_030944_651422_DAC3AB5F 
X-CRM114-Status: UNSURE (   8.23  )
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
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The lockdep mechanism reveals an unbalanced unlocking on MT8186:

  [    2.993966] WARNING: bad unlock balance detected!
  [    2.993971] 5.15.46-421fef3b44d7-lockdep #16 Not tainted
  [    2.993978] -------------------------------------
  [    2.993983] kworker/u16:1/10 is trying to release lock (gpio_request_mutex) at:
  [    2.993994] [<ffffffdcd9adebf8>] mt8186_afe_gpio_request+0xf8/0x210
  [    2.994012] but there are no more locks to release!
  [    2.994017]
  [    2.994017] other info that might help us debug this:
  [    2.994022] 3 locks held by kworker/u16:1/10:
  [    2.994028]  #0: ffffff80c004a148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work+0x1a8/0x364
  [    2.994054]  #1: ffffffc0080d3d58 (deferred_probe_work){+.+.}-{0:0}, at: process_one_work+0x1d0/0x364
  [    2.994074]  #2: ffffff80c12ab9a0 (&dev->mutex){....}-{3:3}, at: __device_attach+0x44/0x150
  [    2.994096]
  [    2.994096] stack backtrace:
  [    2.994102] CPU: 6 PID: 10 Comm: kworker/u16:1 Not tainted 5.15.46-421fef3b44d7-lockdep #16 a2af0e2c6b3eeab6799b5aa8091c1d05d3a7bbb1
  [    2.994113] Hardware name: Google Kingler board (DT)
  [    2.994120] Workqueue: events_unbound deferred_probe_work_func
  [    2.994130] Call trace:
  [    2.994135]  dump_backtrace+0x0/0x1d4
  [    2.994144]  show_stack+0x20/0x2c
  [    2.994152]  dump_stack_lvl+0x78/0x9c
  [    2.994163]  dump_stack+0x18/0x44
  [    2.994172]  print_unlock_imbalance_bug+0xf0/0xf4
  [    2.994184]  lock_release+0x150/0x388
  [    2.994193]  __mutex_unlock_slowpath+0x4c/0x1bc
  [    2.994202]  mutex_unlock+0x44/0x50
  [    2.994210]  mt8186_afe_gpio_request+0xf8/0x210
  [    2.994220]  mt8186_afe_gpio_init+0xcc/0x134
  [    2.994230]  mt8186_mt6366_rt1019_rt5682s_dev_probe+0x14c/0x220
  [    2.994238]  platform_probe+0xb0/0xd0
  [    2.994247]  really_probe+0xcc/0x2c8
  [    2.994253]  __driver_probe_device+0xbc/0xe8
  [    2.994264]  driver_probe_device+0x48/0xf0
  [    2.994271]  __device_attach_driver+0xa0/0xc8
  [    2.994278]  bus_for_each_drv+0x8c/0xd8
  [    2.994288]  __device_attach+0xc4/0x150
  [    2.994298]  device_initial_probe+0x1c/0x28
  [    2.994308]  bus_probe_device+0x3c/0xa0
  [    2.994318]  deferred_probe_work_func+0xa0/0xe0
  [    2.994325]  process_one_work+0x208/0x364
  [    2.994334]  worker_thread+0x288/0x3fc
  [    2.994343]  kthread+0x140/0x160
  [    2.994351]  ret_from_fork+0x10/0x20

The cause is that the mutex will be double unlocked if dai is unknown
during GPIO selection, and this patch fixes it.

Fixes: cfa9a966f12a ("ASoC: mediatek: mt8186: support gpio control in platform driver")

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 sound/soc/mediatek/mt8186/mt8186-afe-gpio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c b/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
index 255ffba637d3..274c0c8ec2f2 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
@@ -230,7 +230,6 @@ int mt8186_afe_gpio_request(struct device *dev, bool enable,
 		sel = enable ? MT8186_AFE_GPIO_PCM_ON : MT8186_AFE_GPIO_PCM_OFF;
 		break;
 	default:
-		mutex_unlock(&gpio_request_mutex);
 		dev_err(dev, "%s(), invalid dai %d\n", __func__, dai);
 		goto unlock;
 	}
-- 
2.36.1.476.g0c4daa206d-goog


