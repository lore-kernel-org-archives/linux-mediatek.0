Return-Path: <SRS0=9yZI=PC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C76A1C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 12:04:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9731E61056
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 12:04:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9731E61056
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JT8LpQDbOprUShnAHpYliqFL+rxs9xoJ2sJrKMkomzM=; b=ATylxfl+xY949W
	f8ahEI368rsLAqzynzUfgRYrimP5FXkcrAmfKEbJund6nK2d7Vm9f9X+r8Qe/NLepM7GlhFSkDs84
	Op3aRQ8jeUuYtVHEaZZZg9t6QIlpVJu6LeGpKUtOcol6g4CAu/0O/3jAPLJwqAuFCBaniq4ouGT7P
	3ZRosZONJYhgXEcWm04788bKdACOEzs35ciQuoUJgkypN8pqMR+E1Lt1eeq6RGUvIwvTpBjy5P1tV
	TKKXPs3gRqaIfb+bu+D/jL+5W7RIvXA50EzbLPf1SdBA4hNeDSVMgM8BLheth4EbL3x4bCopX+I2t
	KGUS3088V8Xbfz+YS/Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mazTD-002zm5-T2; Thu, 14 Oct 2021 12:04:23 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mazTB-002zl1-P5
 for linux-mediatek@lists.infradead.org; Thu, 14 Oct 2021 12:04:23 +0000
Received: by mail-pf1-x433.google.com with SMTP id t184so4403429pfd.0
 for <linux-mediatek@lists.infradead.org>; Thu, 14 Oct 2021 05:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=92n0moAabT6AS5dGSdK43zewU3rUGs37H16qpFt37P0=;
 b=M5TGLvDdV5GB7BnmG+6NPyEGICwR4d406PUheHDG9uvyo+imp5sL9SvfgGl6t61z8Q
 ejBWvaTzzlkPDzyk5D0bKK3sYzDSIB3dW7mtOiOkFFZ+ZRDgGBqCdcJgKUFvhSrBCAIu
 dQeQeGXZNjJ8hstscY++totv3/mjlOpIC07b0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=92n0moAabT6AS5dGSdK43zewU3rUGs37H16qpFt37P0=;
 b=3Ws89BfDJiN9uPRN1MxM90td8CjUcyh9g1HiMbSWemtYFuF5m8rAIMJqNghexWu96X
 8+abevqsUIlmqQz9RCq9+FqlpvZVx4G297Rea/vevR4wHdVn4AwM4soh9FoAOLfQkSQr
 rJQ/xG8wNdHcNtufITwysASvJOpZFZTU8ipV//HG3MEscbqJyGTD6JOJPaywwopHgV7H
 rjrp3cmzf1QYauEXxVpFhxsWVSk8T4Z+OQAj9MSjn++ap8kgjmue2sXp2G+miTWZNMbm
 GcyezpTm32B3bYVrJbVRPRExZ1MxTo1eXlBDiZFGFkcw/pJ4BzeY1mPF3jlaL0hnJfA7
 ZHGw==
X-Gm-Message-State: AOAM53223jwW7Caw3y7gY2wb/aiy+Y/8DtPQEPfI9USwLjjP3o4hgMnU
 8tguQOEkpf2hHmIWPtpVP334dg==
X-Google-Smtp-Source: ABdhPJwIWotZPHk184vFFep0mQkX2raEyAkHyKCaAGKFVNw83k5U9hsxrtADiEetCitAyE2LbTbplg==
X-Received: by 2002:a63:7542:: with SMTP id f2mr3918157pgn.64.1634213060611;
 Thu, 14 Oct 2021 05:04:20 -0700 (PDT)
Received: from fshao-glinux.tpe.corp.google.com
 ([2401:fa00:1:10:64c0:3f2d:5152:a6f1])
 by smtp.gmail.com with ESMTPSA id b11sm2300275pge.57.2021.10.14.05.04.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 05:04:20 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Jassi Brar <jaswinder.singh@linaro.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Tzung-Bi Shih <tzungbi@google.com>, Fei Shao <fshao@chromium.org>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v2 0/2] Fixups for mtk-cmdq multi-gce support
Date: Thu, 14 Oct 2021 20:03:50 +0800
Message-Id: <20211014120352.1506321-1-fshao@chromium.org>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_050421_887117_58B6BB54 
X-CRM114-Status: UNSURE (   7.75  )
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

This series includes some fixup patches for 85dfdbfc13ea ("mailbox:
cmdq: add multi-gce clocks support for mt8195").

Changes in v2:
- Add Reviewed-by tag
- Make clock names static

Fei Shao (2):
  mailbox: mtk-cmdq: Validate alias_id on probe
  mailbox: mtk-cmdq: Fix local clock ID usage

 drivers/mailbox/mtk-cmdq-mailbox.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

-- 
2.33.0.882.g93a45727a2-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
