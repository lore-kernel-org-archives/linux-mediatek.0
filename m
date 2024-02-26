Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50AFDC5478C
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Feb 2024 17:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZotKd2o47/oKAtdV1I26QivtjRepugTGHOJDDp/ZM4g=; b=QWXw+kfJ3gUYVFdP4YHl8tfKNL
	idJymfHi1Zo59dWIFvD7uYR218tW3f4HOzml3OoETiIP/D7xdwgY8T060YH6d6V3sAryf3lt+4BMr
	oHtoG1wh0YI467gDU1UIMaSxvguQTJTXmLDSXdfDPOJHAzfthYmtXvwjwCvlyasbB8quDgSaPjgxW
	OS/pk7TkZBT0Y+xe4+VxwkYqj3n6Pc+1LxSIK13rK0eCAFkABfj/alsjNG0ZXqpn1+52o/Hof7M2n
	kgcy2DEHotM0uAxpXQSnWWni2y4kwVpyOsS5awpJg5H1kJ1AXfGal5x++DpRvZW6LqOpO7PJB2LJ6
	hfTLhkRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reeqc-00000001ziw-3QAF;
	Mon, 26 Feb 2024 17:33:02 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reeqT-00000001zZ8-21LU
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Feb 2024 17:32:56 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-783045e88a6so291996885a.0
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Feb 2024 09:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708968770; x=1709573570; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZotKd2o47/oKAtdV1I26QivtjRepugTGHOJDDp/ZM4g=;
        b=XHvLVG5KcdLR++bTT70XlA07bxTFT7gb0mxQ1Vb+cZ5ql8IxJ/zGEgPdGWCGkP236T
         7hhPrErA3TnK2B1r8K16clLIdDaBXdjldN27E/hk2Zl4B2kCJQUAjgW+jY2PPT/G08Vl
         HzIxD5lsn09/0dB6gD2xRp2TM1avVqsF9HT/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708968770; x=1709573570;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZotKd2o47/oKAtdV1I26QivtjRepugTGHOJDDp/ZM4g=;
        b=WLRmGdF3pRz1ZK95zsITFqLUV2M1Kpr8Ud+JoLSwh0LFV0vuzRoJMicJ7VH3VCo0xf
         +FX+//zl7O2+5TtAtkfNHT8uFvQYjt/4MTbD0vD/hcdJCaBXSH4zs6v8nj33EQiNF50e
         EelhJ61iFsWuC+P8m2p/vTvzbWM1VqvdDHQgQrQIFDoYKRVzrQi5yvj2MWjYe5LnoHDi
         l4KE138dKl58l1crVWGSAZ6EPKFYBianbKa/RwAtzGDi23SZnDdZfQV98ob862C4lWtO
         BBnLWRZDqaO2MGAAZM3gVAAG9IxGP1FhIL44ciyRJKizIpjg3M3oaty+efCf0YkWxH+/
         qaWA==
X-Forwarded-Encrypted: i=1; AJvYcCVNy5p3TM/4nMgVxgWkvNL0dabnjAWId220gbQYJ3iOFv1NYnUtZsjvg8A2igxBf4IR1OE+7reh1AJD+UYGnBtTGaqyEG7/pan5BOfzzPIlKhOl
X-Gm-Message-State: AOJu0YwLe2diNGa69m5GL78yumcvRqLitYbjSzEhaHWKFB9UEBDLmZuK
	JDwcQn+AOjq6W5soPT7udsbtH5yxSuChTmS21Z4vpvMMYlTS2IAdMC7nG2Sp9Q==
X-Google-Smtp-Source: AGHT+IH3rAwgd0NXJq8G/TBWJ93nsJy2+AmuJ1+7I538QjgTdtVQQDhSqF/spxCAW7zvWaoaCpSjOA==
X-Received: by 2002:a05:620a:9d7:b0:787:9a1c:fb32 with SMTP id y23-20020a05620a09d700b007879a1cfb32mr8021996qky.2.1708968769789;
        Mon, 26 Feb 2024 09:32:49 -0800 (PST)
Received: from denia.c.googlers.com (115.25.199.35.bc.googleusercontent.com. [35.199.25.115])
        by smtp.gmail.com with ESMTPSA id b11-20020a05620a04eb00b0078725d0345dsm2672669qkh.2.2024.02.26.09.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 09:32:49 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 26 Feb 2024 17:32:44 +0000
Subject: [PATCH v2 1/3] media: pci: sta2x11: Fix Wcast-function-type-strict
 warnings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-fix-clang-warnings-v2-1-fa1bc931d17e@chromium.org>
References: <20240226-fix-clang-warnings-v2-0-fa1bc931d17e@chromium.org>
In-Reply-To: <20240226-fix-clang-warnings-v2-0-fa1bc931d17e@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Mike Isely <isely@pobox.com>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-remoteproc@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_093253_567848_79363661 
X-CRM114-Status: GOOD (  12.13  )
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

Building with LLVM=1 throws the following warning:
drivers/media/pci/sta2x11/sta2x11_vip.c:1057:6: warning: cast from 'irqreturn_t (*)(int, struct sta2x11_vip *)' (aka 'enum irqreturn (*)(int, struct sta2x11_vip *)') to 'irq_handler_t' (aka 'enum irqreturn (*)(int, void *)') converts to incompatible function type [-Wcast-function-type-strict]

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/sta2x11/sta2x11_vip.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/sta2x11/sta2x11_vip.c b/drivers/media/pci/sta2x11/sta2x11_vip.c
index e4cf9d63e926d..a6456673be3f6 100644
--- a/drivers/media/pci/sta2x11/sta2x11_vip.c
+++ b/drivers/media/pci/sta2x11/sta2x11_vip.c
@@ -757,7 +757,7 @@ static const struct video_device video_dev_template = {
 /**
  * vip_irq - interrupt routine
  * @irq: Number of interrupt ( not used, correct number is assumed )
- * @vip: local data structure containing all information
+ * @data: local data structure containing all information
  *
  * check for both frame interrupts set ( top and bottom ).
  * check FIFO overflow, but limit number of log messages after open.
@@ -767,8 +767,9 @@ static const struct video_device video_dev_template = {
  *
  * IRQ_HANDLED, interrupt done.
  */
-static irqreturn_t vip_irq(int irq, struct sta2x11_vip *vip)
+static irqreturn_t vip_irq(int irq, void *data)
 {
+	struct sta2x11_vip *vip = data;
 	unsigned int status;
 
 	status = reg_read(vip, DVP_ITS);

-- 
2.44.0.rc0.258.g7320e95886-goog


