Return-Path: <SRS0=dCaZ=2J=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83EF3C2D0C1
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Dec 2019 09:40:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59D9524679
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Dec 2019 09:40:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TSA+1bvf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LyDg1/Lf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59D9524679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gfqL+meeYcz7B/oxE59UqhGK9Obj9htwuZHD/ShnSbY=; b=TSA+1bvfScHRw8
	G3m68l+DrxjrMCt4MZec72HVCUBQHuVHf3KWtah+ZkuPlowdht9zJ0yY9waVtxn6oY3leizJeScp7
	QiKYeGrRp0h5RxhvZSV6Z+EbsXedjSV4it/3ZxjnpBvWCuqOmfAmzcvcbVNMgjb/tJdqIafLeWjL+
	EHJe+TEj5miCFd+meAfnl7Vta+KQWy2nQIIvr6gKNjqZOw3HOi+uWa3N5t/oSf2bjQVjF4qJMjH8z
	f+FYEva/aBUzbzkDGtNKQ8CJIgy+ofGFQnzIscD99x0l51AUX7rVtyHvCmAGibPV3gTkKE/mnKvKL
	yyFlZUG/E7PPZKHx6eOg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihsHz-00013E-UL; Thu, 19 Dec 2019 09:40:11 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihsHx-0000lV-Es
 for linux-mediatek@lists.infradead.org; Thu, 19 Dec 2019 09:40:11 +0000
Received: by mail-pj1-x1043.google.com with SMTP id l35so2259203pje.3
 for <linux-mediatek@lists.infradead.org>; Thu, 19 Dec 2019 01:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UaU6i9zWU3yr9QJvcRz0VGGzrcUKaBIv86YipeMOKo8=;
 b=LyDg1/LfFyRwWJTxBF/LnsfrTJSpgla5kvA98Hg+eeijCP9Q4VYEvCBGyN5xVxKn7p
 eEsQscd3wujq8XMHgepAaRQXBH0E1PQZo9FaDL3lWv8qT+wBABdwjQ6wBRbPQczrwZhV
 xi1HLrIQxvVPsnnXebX2B39JQ8NlNTXox5+ak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UaU6i9zWU3yr9QJvcRz0VGGzrcUKaBIv86YipeMOKo8=;
 b=gsvvjgsLEb1saLPSqylUplbzFa5uXS9TZh7TXKOP0puHF3Oo64eX2Y0Kk4gfTu97GR
 XWIePDoB9jHj2/wK5y2V9LgS/r8ifvrp0FgkiuuK8Y/bCTeXi3DSlj1BL011uWRHHnBp
 srS0OOfWgdCorQAGDsU8CYrwmtuj4s63WMrDKq8mL/uOW1D6KYgYsmBDyx9FlaurRJ+P
 QthO4bUahIpiJVqrrI1f9c6Ko3DCDefPBR/uZUWYeTJE7CH8BASRS0bQlwS55YqA57c6
 asp2uTPe4djgleN+cESND0TCTknS0zfSA7pfga6p4Vx/BVbZBgVCRFHRMoosp7uXp1Et
 QU+A==
X-Gm-Message-State: APjAAAVBZe/00/O7gwDT9sp6DcucRi4AnMkzL3/E8SVOantf6xFtmbpq
 wQVFf5tiT9pmU0Idwf0FwfPuB5MuJmxavg==
X-Google-Smtp-Source: APXvYqzL4Uv3f/vYWiTWGoQqppzSjCV/VAXe3mUM5lmKJDJ2u9Tql+pWQk6EMSv57P1oNg9ofZmndA==
X-Received: by 2002:a17:902:8bc5:: with SMTP id
 r5mr8257114plo.189.1576748408099; 
 Thu, 19 Dec 2019 01:40:08 -0800 (PST)
Received: from tfiga.tok.corp.google.com
 ([2401:fa00:8f:203:f5fe:2a5e:f953:c0ed])
 by smtp.gmail.com with ESMTPSA id d22sm7057694pfo.187.2019.12.19.01.40.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2019 01:40:07 -0800 (PST)
From: Tomasz Figa <tfiga@chromium.org>
To: linux-usb@vger.kernel.org
Subject: [PATCH] usb: mtk-xhci: Do not explicitly set the DMA mask
Date: Thu, 19 Dec 2019 18:39:54 +0900
Message-Id: <20191219093954.163417-1-tfiga@chromium.org>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191219_014009_543490_41DC395D 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Changqi Hu <Changqi.Hu@mediatek.com>, Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Tomasz Figa <tfiga@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Shik Chen <shik@chromium.org>, linux-mediatek@lists.infradead.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The mtk-xhci platform glue sets the DMA mask to 32 bits on its own,
which was needed before commit fda182d80a0b ("usb: xhci: configure
32-bit DMA if the controller does not support 64-bit DMA"), but now it
has no effect, because xhci_gen_setup() sets it up for us according to
hardware capabilities. Remove the useless code.

Signed-off-by: Tomasz Figa <tfiga@chromium.org>
---
 drivers/usb/host/xhci-mtk.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index b18a6baef204a..bfbdb3ceed291 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -488,11 +488,6 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 		goto disable_clk;
 	}
 
-	/* Initialize dma_mask and coherent_dma_mask to 32-bits */
-	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
-	if (ret)
-		goto disable_clk;
-
 	hcd = usb_create_hcd(driver, dev, dev_name(dev));
 	if (!hcd) {
 		ret = -ENOMEM;
-- 
2.24.1.735.g03f4e72817-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
