Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48405C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 11:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oQLjYSyO5bnT1k2cMo+qtFEL9roIKTpXUxzFJ5E7YeU=; b=n6w7PiXBxKXvgk
	AaQ86Q+0nNqsHmdT9S6MNZZpfG1GA7AYzNwRQ1f8UQ1VOcfkeyTAYs4Gklmw/3ZCNC0pejYOTPy9N
	ltnj4o3ADLrTc1sX85qb1tCfiQyymQVx/DFYDqIrWYFBxT/P5hd+MuKQG6rjeyQFDXlrjv5zDlUf4
	s3Symrh4SdV2XH9SzmsgaS8ibkqTVlyB13D2Mpm8cXckiNOq7k0a+UKtnlRO1LukqZbwdbnwK5wIp
	LbHQm9zpmbg2/3TLLARUTcmkVBhv1/s0MZJeT+WlIj8U9sUhQtYuQf7nX4BQ1I8PnVYDfhSD7DTPx
	hlZq+czKU1AmJLMXvCYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o29wy-007FuZ-Jo; Fri, 17 Jun 2022 11:15:40 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o29tT-007EQ4-BY
	for linux-mediatek@lists.infradead.org; Fri, 17 Jun 2022 11:12:07 +0000
Received: by mail-pj1-x102a.google.com with SMTP id k5-20020a17090a404500b001e8875e6242so3849344pjg.5
        for <linux-mediatek@lists.infradead.org>; Fri, 17 Jun 2022 04:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oQLjYSyO5bnT1k2cMo+qtFEL9roIKTpXUxzFJ5E7YeU=;
        b=WEXQJ2c0zXPPo70AqX4ePE2lo2jfTA7rpG+C5RBXENB1K0P1BBjGTUBKWrVNIRgYMx
         HldHvQtAl/hTE2t7F2GKPeB/yiddMus1F8uOtTiwN9+rR9c0CSzHVt8S5NTgrhhhnsSe
         xRiJJZNKdeC7o73Bc1I3uTPEccX3CTIDbP26E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oQLjYSyO5bnT1k2cMo+qtFEL9roIKTpXUxzFJ5E7YeU=;
        b=eU11V0XTnxRbfE6nozw3O9vJALXXc5U5V0bJdYlDA0EXB33z2PK6WD3Ra57GgWQjQK
         yMGVcpKu/zEy3An8CJNaJSzaClireUrnvUUKe2E9ZWF4iuPFrilrbbexkW44F+TS2Rp6
         XM2dawrtsnu1j7gXnvXNitHDjjOJK/2XdMwfuOK5Jj25aj4qBI5VKyrbJBSYeQi/RrVv
         Qxds+S1eNfctZl8a5kiLOKyH48S9mqAW6zpHWRksFkY38dEmgEtg1bMfh+pHPszDvjYX
         TOlkhnJG47cYPHKa5P6zuNhEte7+mh48tMR8U1riPd+tuyhaFle3ELQNRbgGLA297ptD
         c0+g==
X-Gm-Message-State: AJIora+1l5Oe0Ze4P0u5C9yjbQyg7CRJRgvTMlIqchtgd4AtKxosSnWV
	XBdTc2L1G0XDpOGRpLV4R/ahcQ==
X-Google-Smtp-Source: AGRyM1tf2bQGeUv5328p9BV+crG8b7G31H6qrJWwNOzsEDjIHBFrwQCM7E2x9VN5sMfX6/KCSapUnw==
X-Received: by 2002:a17:903:32c4:b0:167:6e6f:204b with SMTP id i4-20020a17090332c400b001676e6f204bmr9221820plr.117.1655464315709;
        Fri, 17 Jun 2022 04:11:55 -0700 (PDT)
Received: from fshao-glinux.tpe.corp.google.com ([2401:fa00:1:10:e616:b34a:9b5b:24ef])
        by smtp.gmail.com with ESMTPSA id 9-20020a170902c20900b00163f7935772sm3296754pll.46.2022.06.17.04.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 04:11:55 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: [PATCH v2] ASoC: mediatek: mt8186: Fix mutex double unlock in GPIO request
Date: Fri, 17 Jun 2022 19:10:04 +0800
Message-Id: <20220617111003.2014395-1-fshao@chromium.org>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_041203_490469_9882FDCC 
X-CRM114-Status: UNSURE (   8.48  )
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

The lockdep mechanism revealed an unbalanced unlocking on MT8186:

  [    2.993966] WARNING: bad unlock balance detected!
  [    2.993978] -------------------------------------
  [    2.993983] kworker/u16:1/10 is trying to release lock (gpio_request_mutex) at:
  [    2.993994] [<ffffffdcd9adebf8>] mt8186_afe_gpio_request+0xf8/0x210
  [    2.994012] but there are no more locks to release!

The cause is that the mutex will be double unlocked if dai is unknown
during GPIO selection, and this patch fixes it.

Fixes: cfa9a966f12a ("ASoC: mediatek: mt8186: support gpio control in platform driver")

Signed-off-by: Fei Shao <fshao@chromium.org>
---

Changes in v2:
- Trimmed the commit message

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


