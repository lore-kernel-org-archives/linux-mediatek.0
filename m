Return-Path: <SRS0=SpBb=PH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D17BAC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Oct 2021 06:30:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97D1C610A1
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Oct 2021 06:30:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 97D1C610A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BkvYp0XqDRKNypLQe1PuPFDAha80dskY5bZrNG/DLmg=; b=wo4IOUlWWdLcYj
	49SbSS/FyV2er3cHhuhFWO8wYycgNWtzbM8jA7qxYq1fi4sPp9Q5AktGYW2GkZEyS5ffg4FLPl9Uh
	zcKAtGKh68JudG5i5R3xUyrNbVoSwgsY7i8BtOL7kPeS4dZEDxIalmL+F+M+KwJqvd/aT1PrMZXZB
	YJBgiB4PQXYbNEqau6aGO/EpvFTTApK5GIyME3Pad+e727xlFpWfq8/19gR9m0d8Gd3ib4TprYXpQ
	8O+xr9V2frlpJoJvsXxn9o9+flV32kCTADH6c6PXF5xj9WxykWHDzagjzs/KEMvbfPhujKma6eIhO
	3bwmOYdNAMdIR2byZazA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcidW-000IFF-Nx; Tue, 19 Oct 2021 06:30:10 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcidD-000IB6-Cm; Tue, 19 Oct 2021 06:29:52 +0000
Received: by mail-pf1-x429.google.com with SMTP id m26so16752925pff.3;
 Mon, 18 Oct 2021 23:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dnXn+h5taVTZko0OST5Rrf452xL+m2nCHrGrWQWsoO8=;
 b=pL4ipHDmG3TfyQE5wlMTOb8U/OdBLqTm607+cLDZdIFBBFRpgfFMDf45EWwDFFVbg8
 liUD57wxDtfz3Hg+kwalp2G9MJEYVeC8M55bEmf7+riBxIZtxEtMCXQDUHb5Pi9wD2bw
 pv8dKByL5OobbvsJG6jQ08xkwPQGwY4cP4Oa78d3dhrNTetjPFDCYLwdJvF271RaBhgx
 CK8ETdWLB879kZldQWhqCopY7baJMQgz8BN/iZIJLoUbx5M59dd4azMftALHWC22bPzj
 D7hxx5kcPa5nCWQgpnXejbm5Z5T9MINwkfEodZbo/32G4lAv3/hhwa323Q68d9xKnla4
 mgow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dnXn+h5taVTZko0OST5Rrf452xL+m2nCHrGrWQWsoO8=;
 b=AIqtmMPdGGd0rYVUgecTy+dlulevcuk3vT0rwtGiVtD+NKA6EGJQ/Sd0kAGmVKqysl
 YvbdE4TVM17JEDMvSLa8rmz7YPDszrhzFdki83b0+H5TqjVavrSr17rIPHnEvLwAlUlg
 GUjcDhETRzsuQsHmfBTo9m7RI6bBWMU0PN8hf/faQbPq66zWr2SEaCiQj5ZxfLF28A3v
 qNdUp9V2hzIEXRHakuHiITzT8HGPwFulRyzIZW0Wc9KD9A/3YPLxNP5kTci3cYKp9bQl
 yJ/78nYPXGtZySwO0MHBvXdfiCYaxvFsSBkcdLGGjqTkSAOF00h/A+3bxPj3nS0DZZR1
 4SgQ==
X-Gm-Message-State: AOAM532e8h/tXH04zz6ZKjdef9DBX7W8HSAGGZTiBw5XT2fxQT6LwxQr
 +aw3v9VqI0UyGVql9q9nNEs=
X-Google-Smtp-Source: ABdhPJwExjdwTxD3Dj/lgIOSPSS3R74iQXiAt6bQeFWHIwggACFsS+Lj/fzO+5rgWMmY8wHSm3+4xg==
X-Received: by 2002:a05:6a00:2390:b0:44d:bccd:7bc with SMTP id
 f16-20020a056a00239000b0044dbccd07bcmr16462708pfc.4.1634624990209; 
 Mon, 18 Oct 2021 23:29:50 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id d14sm6469690pfu.124.2021.10.18.23.29.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 23:29:49 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: ran.jianping@zte.com.cn
To: mturquette@baylibre.com,
	wenst@chromium.org
Cc: sboyd@kernel.org, matthias.bgg@gmail.com, chun-jie.chen@mediatek.com,
 ran.jianping@zte.com.cn, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH v2 clk:mediatek] clk:mediatek: remove duplicate include in
 clk-mt8195-imp_iic_wrap.c
Date: Tue, 19 Oct 2021 06:29:39 +0000
Message-Id: <20211019062939.979660-1-ran.jianping@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_232951_475628_B6E4F09A 
X-CRM114-Status: UNSURE (   9.40  )
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

From: Ran Jianping <ran.jianping@zte.com.cn>

'dt-bindings/clock/mt8195-clk.h' included in
'/drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c' is duplicated.It is
also included on the 13 line.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Ran Jianping <ran.jianping@zte.com.cn>

v2:
  delete extra empty line.

---
 drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c | 2 --
 1 file changed, 2 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c b/drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c
index 0e2ac0a30aa0..1aa5afc05929 100644
--- a/drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c
+++ b/drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c
@@ -10,8 +10,6 @@
 #include <linux/clk-provider.h>
 #include <linux/platform_device.h>
 
-#include <dt-bindings/clock/mt8195-clk.h>
-
 static const struct mtk_gate_regs imp_iic_wrap_cg_regs = {
 	.set_ofs = 0xe08,
 	.clr_ofs = 0xe04,
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
