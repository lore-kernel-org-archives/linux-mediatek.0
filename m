Return-Path: <SRS0=iyt4=M5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DEA3C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 04:24:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C563961154
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 04:24:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C563961154
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References:
	Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Tser7C4ZE3pNUxXl2YMk5+JHpZwsy/+MpKuFCHdHCQ8=; b=OhH001LjQ1fi3eYQSwKLpq+nkF
	1rtfAB4MHscuTddcIW7czvr6IJaR5ktQ+PbuxaCFApp5OH5qDrRYL/EucJRaK7xqmhzCdRdqIE6I7
	lpQJr3aM/zJUjwGdf/gX9BDlW5MCNE2VCZAgapjq0LuekGANfdbQBobevL/JCDXEAFphK0SD2q7dC
	lIk2Yc4ehHcDyPPsZf0J0Zx9WIoPqeIGXlRNToyLagC5Y//tgNWOobOgGowx1B/3C7/YrQ6AgzoNM
	0/F1V0X2oBKm7wxLZSR0TZrHPZ8nhwUrVipDJxXJOT3EzH4aw1hhB1lVR3HTiSkF79KIzFE4JbhmM
	oD8vm4lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBrPZ-00BX1S-0D; Fri, 06 Aug 2021 04:24:45 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBrHm-00BTB8-3C
 for linux-mediatek@lists.infradead.org; Fri, 06 Aug 2021 04:16:43 +0000
Received: by mail-yb1-xb49.google.com with SMTP id
 203-20020a250bd40000b02905933fff7091so835231ybl.16
 for <linux-mediatek@lists.infradead.org>; Thu, 05 Aug 2021 21:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=Q40VTyrZ8Jb3xiuLDWJt6+4MmyDxko7tqCpmYIXIET0=;
 b=KFfQ68eJZhEOu8WCeUjfFQd8FJzMNLuIbt1sBK+Zex7v8uDpxuX3qJAzY+rlDVkCzx
 ddgml7gc7yo115aJu0qJ7YFRhOH8EacWt4TFqPyugYmvZlkzGymGrEe78IRkuoTeAPIQ
 IGPEHz9/qYkpe4H4PMkNJ7jPaJ0WWG/RCMNa9z9wT7z0OXKaQksRDXFP+eeAGiunL1lE
 AxICXMcYN4tpXeX4HKJ2R6aQkGzjiINLeRiRMoQYibsJZEj1NKopEJ8EUIewwYLdidHt
 24zi8T8Ovqs2psTayROx8d7JgvDSh+lbY1iEqTfFky4qIMSW5XhfN+nOgJIjVAKfIK2Y
 YFZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=Q40VTyrZ8Jb3xiuLDWJt6+4MmyDxko7tqCpmYIXIET0=;
 b=dfmDi2UAniBQBZxzGP273u+Y0oVS3exo7OyXHst2vlpJU/krkpJfGb09q/xuiQW/cg
 SzDh0axFYHFe1rGOowvDOuVopNdBEHsQSQlE+Ak8gxzaxm7IiqE/B2w8hqXHS2xSlnCu
 Ltd+7ncMOu+AJofUiQYZhpLRzfWsy67uKU2QjbY8r7/XREh7AN134UR0nHO14cPCPV43
 LUpui1zJwB5UT6VBUQT+5ldyn1jQXW9XdyHaSan58o+iFjCQdtEm04DCSL8aHhM2sBnc
 pgQAGS295z1jsUZ+K6luD9W3nkHutegzt9+h9l5hNsQbxQVMZhHV3TbpIkl/mqhJy9bX
 7XNA==
X-Gm-Message-State: AOAM531qaZ5UC4WhVqwDTqludvCk7OM9QID50QnsbXIOJzC+J8Y58kR9
 JF2rP/rVm48zAko6RwmdsnhDpXWZ/rfa
X-Google-Smtp-Source: ABdhPJy7KEPygmtbEYTAh7CaN/i2KocvupvFKwvGA77PqToujXIpHnTvPQ/IKCQ1AV7lU8YQE63ExtiPNS3T
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:ebc2:859f:4153:773e])
 (user=tzungbi job=sendgmr) by 2002:a25:bc02:: with SMTP id
 i2mr9968274ybh.98.1628223400442; Thu, 05 Aug 2021 21:16:40 -0700 (PDT)
Date: Fri,  6 Aug 2021 12:15:29 +0800
In-Reply-To: <20210806041530.4170869-1-tzungbi@google.com>
Message-Id: <20210806041530.4170869-14-tzungbi@google.com>
Mime-Version: 1.0
References: <20210806041530.4170869-1-tzungbi@google.com>
X-Mailer: git-send-email 2.32.0.605.g8dce9f2422-goog
Subject: [PATCH v7 13/14] dt-bindings: media: document mediatek,
 mt8183-vcodec-dec
From: Tzung-Bi Shih <tzungbi@google.com>
To: hverkuil-cisco@xs4all.nl, yunfei.dong@mediatek.com, acourbot@chromium.org
Cc: tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com, 
 dafna.hirschfeld@collabora.com, mchehab@kernel.org, 
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, tzungbi@google.com, 
 Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_211642_214393_85A783E0 
X-CRM114-Status: UNSURE (   7.96  )
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

From: Alexandre Courbot <acourbot@chromium.org>

MT8183's decoder is instantiated similarly to MT8173's.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 Documentation/devicetree/bindings/media/mediatek-vcodec.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
index ad1321e5a22d..c44a6e6943af 100644
--- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
+++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
@@ -10,6 +10,7 @@ Required properties:
   "mediatek,mt8183-vcodec-enc" for MT8183 encoder.
   "mediatek,mt8173-vcodec-dec" for MT8173 decoder.
   "mediatek,mt8192-vcodec-enc" for MT8192 encoder.
+  "mediatek,mt8183-vcodec-dec" for MT8183 decoder.
 - reg : Physical base address of the video codec registers and length of
   memory mapped region.
 - interrupts : interrupt number to the cpu.
-- 
2.32.0.605.g8dce9f2422-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
