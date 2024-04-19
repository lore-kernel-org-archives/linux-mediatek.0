Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B512C41513
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Apr 2024 09:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LtYl9w0rOEhkj26cvWhCGa7iaXgSAClc12fCrbixCRY=; b=AMvNyM1rApvmgMDcu9cGHT8Ou8
	s5h8tAbq4tzX+XEWTYnxdQ8/fDwMgEZ0slD3dUjSvo5qrTZXTslnPENnM0D9NthIF3xN/rtsZlUvI
	D56+bOo15Y5Tkm3rw89GkhOqwpDV4Hulrz+OEGiSHybMlglQq2Wx1GrUgLrr/74DRQVMOI8jIG8wM
	vPebFIcocjT6lR2QVjdDI7dRLpQK1wI2AdhSE5rKdRrHz5tYK5SmGzWS7fKEsQ/2P203yCpYZ42Pg
	5uEMaD/PhsPFt6MaMXbXb65V3jGrVTQCkCoa20yGQbEYTYfB/hFKtXH1WmHImVi36nlhq8tulVWAJ
	sJZfZLEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxkth-000000059ty-4AMO;
	Fri, 19 Apr 2024 09:51:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxksM-0000000598u-0oeh
	for linux-mediatek@bombadil.infradead.org;
	Fri, 19 Apr 2024 09:49:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=LtYl9w0rOEhkj26cvWhCGa7iaXgSAClc12fCrbixCRY=; b=M3Uyy3okNIYPkjIHtQV6uFIlpo
	WG2ZN6+Xp4hWqkOrHcX67BU1IFaGOVKF80huxG+cULzmcMDcYoXckEHIIaKSM9wvsde40d+/5zQx+
	ygTawaH04+FroMHOTploEXkGg7t+/Op/vBqLQQeiYnOxCyXZJviG0aPRpG2TtFJoteH/78Y3OLFMK
	To++xvfTiEaoT0E2w5kyzPYNLYGK5DGOTT/IPM0UNdKTa7ppwVC0f7msrhLgUDACp7QAuh9n5eHPg
	P6O+7nwN+ihOc0sofc+Ed9x1D73sNUWs0+PiYpR14DYbZUV2mSGVs5UvmFCDPrHaHsHg4kqyyxysV
	5b1CUF2Q==;
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxksG-0000000COPE-2mBH
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Apr 2024 09:49:44 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-78edc3ad5fdso150400485a.0
        for <linux-mediatek@lists.infradead.org>; Fri, 19 Apr 2024 02:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713520167; x=1714124967; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LtYl9w0rOEhkj26cvWhCGa7iaXgSAClc12fCrbixCRY=;
        b=VieoLwg1yXcpGl0JmH35TuMTY2iX/k60AXpOkjC4F/xhPF8BNp2CQ7Vpp8wpicMjYo
         5o0wmTkbuQsQs0FCjEEAYsmVyWN2GzIITqxIlqwM/PD9bfykGdptqJJ46t2b2ExO4P1V
         LC7mEWmtK0i/1k1/NSenlbhDCWA4Hr4GiEB58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713520167; x=1714124967;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LtYl9w0rOEhkj26cvWhCGa7iaXgSAClc12fCrbixCRY=;
        b=cFIOESytNbjNJb7yXWxI1MBQoCND1xvSkfPU50CQAq4jyjQkieUaPuBIoHNBHugH1+
         SI6lyDVCID4Hm6ONUkKOJvo0PkhjDdzJ9aDgahBrUDMgqdV0HMOzVgTqqOGXD2HAq2lB
         FD0YwaPKNeBaGwZZgayV8gWoFGFbh1WcNjdUNUC11QjAPfhpKHbPCXjGdJY8fYucZbNT
         iJHy/nLHnu+3C6gnpSnIYsELMYPWs/iJD3tVuCsTgoeD8a0ioqrqmE9dgF+57tqxXQJo
         k76fvCIP4Pi/rW7xN/7WsZ5z5EvyvHYW1wr/phaUJg47S3YzfIIgFAYWju/fafnIM157
         F3qA==
X-Forwarded-Encrypted: i=1; AJvYcCWq1WDxXGfW5rTxq2TCr8EFstZzTwWxrERzjmx5FaZxxB41tPGQnNFYGHBdYYX/eoFO3QwJL8ZaF3cRkH7+aYaB+GiMXk585Rw8SspzXygBdu4k
X-Gm-Message-State: AOJu0YyESxn7tQolORrB6g14Ah3bU4ktH5qSFJUAiur/45Y+ObvWIoW4
	B0gpMmJRne+H3RMNp3+ZIM8u+axET7N2Xerhqw/mPdvBjIcyb5xagKKHxOtF7Q==
X-Google-Smtp-Source: AGHT+IHJxWxlXkvVgayg/8KmEPlEYrjGm6s2oAW8VlNrxH8CHO+X8RZjNxTD6ZWD86mZ22X+MElfTw==
X-Received: by 2002:a37:de0e:0:b0:78e:eb64:d91 with SMTP id h14-20020a37de0e000000b0078eeb640d91mr2763665qkj.1.1713520167230;
        Fri, 19 Apr 2024 02:49:27 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:49:26 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:47:52 +0000
Subject: [PATCH v2 06/26] media: stm32-dcmipp: Remove redundant printk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-fix-cocci-v2-6-2119e692309c@chromium.org>
References: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
In-Reply-To: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hugues Fruchet <hugues.fruchet@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>, 
 Abylay Ospan <aospan@netup.ru>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_104942_238819_5004C62D 
X-CRM114-Status: GOOD (  12.92  )
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

platform_get_irq() already prints an error message.

Found by cocci:
drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c:444:3-10: line 444 is redundant because platform_get_irq() already prints an error

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
index bce821eb71ce..4acc3b90d03a 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
@@ -439,11 +439,8 @@ static int dcmipp_probe(struct platform_device *pdev)
 				     "Could not get reset control\n");
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq <= 0) {
-		if (irq != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Could not get irq\n");
-		return irq ? irq : -ENXIO;
-	}
+	if (irq < 0)
+		return irq;
 
 	dcmipp->regs = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
 	if (IS_ERR(dcmipp->regs)) {

-- 
2.44.0.769.g3c40516874-goog


