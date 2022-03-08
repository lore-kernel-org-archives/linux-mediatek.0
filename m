Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE69EC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 11:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=D20wh+zNMskOO8rGV0iwqOmfnPUyVsArOSFHH2r+mdA=; b=HJegnxGtAe0D/M
	orQmgmmnfD1M08WK5+vf4AwLMlYVIcAKZCTIrDU28R8N1E56aAjN3FoTKCvdf0nmsPC4xJ+mPFrkb
	+p02GXM/CHWwrEPI1oxV2LI2b5YXsiNsYUDhR9MvI3xXx1zvJU86aWKGsQEhWX6wUYRRQQaxRtWb5
	pPj4OVvnQBpwISvm5R04WHQwk5e9RDZuPLPHIwn5y3sQL447eo6h/iPv6yusNJ4OcySbb17RA6ihx
	C8hvT+vkf16OrpLst7MuvVwZyxWKfzy5KOM8Nb5+cnYm+/IHAaykrjDBInluTZ6fHdI0pKZ0AoGSz
	TwUwTXnl/xrzfGNzJFbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRYFY-004CGo-Eg; Tue, 08 Mar 2022 11:43:32 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRYFI-004CAR-4e; Tue, 08 Mar 2022 11:43:20 +0000
Received: by mail-wm1-x32f.google.com with SMTP id c192so10959773wma.4;
 Tue, 08 Mar 2022 03:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=BD9aL/dk972NeBQAccfFJoKozgGlibcPRxYjlFBN04k=;
 b=HKZd76acvxhuP1BW/RDw2oDbrADj7nvmM0wYNYDB9G0smXzeJyRazrshA1yYwkV0Io
 jPRxoZHjqxwNrFCPAhOs87KulQ168F2ZIJA0dL0sDnelfLoaryk3z7sTS7+YsqQU77Aj
 RrYMwXqAaQ0bgXsewEEmdgdnW1oGu6SFAVfbLViM4ZT+exZGNVslMW+zPMmjv2Q2rnXr
 IZggZAqSVMT2pQSJja8yxysD17kcg9XkJwV03PCpHN8O0ICv8z/xpxlK9/qG2Jg/kqf5
 yTPUZzMSfAewV+2GHkRYkqYyI5WnWSX86TeX80dVyDwy0d1Svc9BAN66Z4xh5ccw8RM1
 RwnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=BD9aL/dk972NeBQAccfFJoKozgGlibcPRxYjlFBN04k=;
 b=78HCqG9Db2/8TPR3xTuUb2JTlFPJQ8Pm/YtqgQJrEGd/+8UOqU6czgfEERF5yLHvjI
 DZT3i2FL1hB3VFqyDeTgUZrc2cV9gr7o1GLTzy6INwkqzCoiUkFGF3JFXXKKgVI6VqQs
 EGbV7Ej2DAFoaWf1TYipqs99dVpOEsLIhe/f4NAKUqiD3DoodfouWo86qdChJu06UTS2
 Pw2IIVkhYvykOYC8jV7IDbgbDX+tMkPjr7u1XC98RtIDMzgwwFGPkcaqUyTq60urTClR
 FX8z4isoI6BRargohao1d1aGP57dHL3Ng+WT3MBVP9FJ03gHTxATiswA6utXf+8r0PNd
 1kgg==
X-Gm-Message-State: AOAM531PsamRWeqYhV4nwT0RoUEL0uNF4qxX2UAzmm4El/hqftq3vi3N
 oME5OwAxASzvvVGGBrN7DnotLth/u5lcLg==
X-Google-Smtp-Source: ABdhPJxHS9QZHXHiJbg8LL9woOu+Y9wLufJJ6DmZ5EISoQGuEpYGXYx9AX/nNTbePJ25NMWVKuvkpQ==
X-Received: by 2002:a1c:4489:0:b0:389:8b0f:9a67 with SMTP id
 r131-20020a1c4489000000b003898b0f9a67mr3202144wma.40.1646739794391; 
 Tue, 08 Mar 2022 03:43:14 -0800 (PST)
Received: from felia.fritz.box
 (200116b82626c9000cc91df728b27ead.dip.versatel-1u1.de.
 [2001:16b8:2626:c900:cc9:1df7:28b2:7ead])
 by smtp.gmail.com with ESMTPSA id
 p11-20020adf9d8b000000b001f063deef80sm11773169wre.86.2022.03.08.03.43.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 03:43:14 -0800 (PST)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Bin Liu <bin.liu@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-media@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH RFC] MAINTAINERS: drop unreachable contact for MEDIATEK JPEG
 DRIVER
Date: Tue,  8 Mar 2022 12:43:00 +0100
Message-Id: <20220308114300.12502-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_034316_206549_A922F501 
X-CRM114-Status: GOOD (  11.54  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

After sending a patch to Rick Chang, the mediatek mail server responded:

  ** Message not delivered **

  Your message couldn't be delivered to rick.chang@mediatek.com because
  the remote server is misconfigured. See technical details below for more
  information.

  The response from the remote server was:
  550 Relaying mail to rick.chang@mediatek.com is not allowed

So, drop Rick Chang from the MEDIATEK JPEG DRIVER section.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---

If Rick Chang is gone, pick this patch.

 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8c7e40e1215e..02a75dd04187 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12334,7 +12334,6 @@ F:	drivers/iommu/mtk_iommu*
 F:	include/dt-bindings/memory/mt*-port.h
 
 MEDIATEK JPEG DRIVER
-M:	Rick Chang <rick.chang@mediatek.com>
 M:	Bin Liu <bin.liu@mediatek.com>
 S:	Supported
 F:	Documentation/devicetree/bindings/media/mediatek-jpeg-*.yaml
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
