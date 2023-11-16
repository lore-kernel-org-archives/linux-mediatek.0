Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1BE9C072A2
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Nov 2023 02:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Th9lj+aGAw0IRo2uy0RbfTDSdNUMIUbSlSIvNRSZ8To=; b=cZDjcilNClJjTneH0zXoCDtg+w
	WN/Twu0zz3IhYkuq1/4kXnnZEUhyMFup/Q/ua4TE3qbGRn8zg+Ot0ygn9ILnAdYTZsb2C2xcNjhfF
	7SzZ4GQJn6Ac46LZc3koRkxQxtpnOKw5F9TQc7YtR2sq6ZIHA/3/sGF6Uh30Zo3n7UV+6FmzK1e0q
	DdzS0G9etzFhAL+I9EnAUIo/mrHoa3N0YYpgta2Ed+1qTDKwQ3LzIeNx7TSG9ASG03/sXZtTMb6Wb
	ryi3hOSRHT/k3sHkIPpbrB0jI15o9U7yb2t5hWUVGcWA7x/3vo1Br1HAMKpvh2IfKaZXxdW3pXEnf
	dybqsFIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3Riu-002CCE-0T;
	Thu, 16 Nov 2023 02:03:16 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3Rir-002CBJ-1y;
	Thu, 16 Nov 2023 02:03:14 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6c32a20d5dbso271596b3a.1;
        Wed, 15 Nov 2023 18:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700100188; x=1700704988; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Th9lj+aGAw0IRo2uy0RbfTDSdNUMIUbSlSIvNRSZ8To=;
        b=de+KSOlMVACjPA3MvMKfB9NN8C60CCbcuWsjwR5oRzCNzNmBtbsKesvH4Q2M9sCyd3
         Y/0PFn1cdNh1c2h+m8vdfPrvtLeOvKj1Lbgcl0MRpSoFT9KcetcvjDMegcgCw++dUasE
         gtgOCpgnd81xQDmh0Z+jElZQb95KVbc4Fx1q7BMZKHKnUBB3OssTNu4eoedv1UTsR/f8
         Yju1fnSqF0ElgRI+x0lfa136oMfjLdpnRew8pf1VkW9zKXRlrGxAaCAXyVGc01Q8gMFb
         haS8Cz8QdqEBVbIc8GjwSpBUy4uLItAq4O+vL4D4QMbweZvMPI/AIvPJ/3Y45+h4QArp
         C7Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700100188; x=1700704988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Th9lj+aGAw0IRo2uy0RbfTDSdNUMIUbSlSIvNRSZ8To=;
        b=lp8JBa/fnr/m9qF/IGckKlN66n9A7XJN6T2rI5fJoo/D+wDT/Z6aVFhCDR/qUH/dwB
         03qWgSusomwEwMyXfQZWGCapPjxqTjdTIJxAKjwl78EtM6P0Nt5xnJt55zfZRRxq8Oq2
         fqL0LpYLpY249YEanYTntJ3MnoFS3TiaSOtkriIZVYNzKBdwVdQB0lCngWo6tyjm7Frb
         YJPJlKnz2EuOya5Z56MtMsAd1yVeJsXvlXZo7i+i+aicRD7pTRWABeiQ5gnFhn68hzuw
         bKo7CPf78izBPKBwzfwMvstb6yK5BNqKngicSz+cK3VUnrmu5zJ3srvNq1LvOu8PCGfT
         qAKg==
X-Gm-Message-State: AOJu0YzuwVrdbX7CD5ppOZCRNLv+gHE8gEz6c7tgcn4vqIchAM7FHiRj
	mDmuysTNEpTb5dVpLr1CVg==
X-Google-Smtp-Source: AGHT+IEBPLrFnZID1/lRKENL/IKG5994xUr1PV3o5p2zRisF/Gqa54OTbof+SlXP19NYV+iGIjUajg==
X-Received: by 2002:a62:ab0c:0:b0:68e:3772:4e40 with SMTP id p12-20020a62ab0c000000b0068e37724e40mr11743047pff.3.1700100187996;
        Wed, 15 Nov 2023 18:03:07 -0800 (PST)
Received: from localhost.localdomain (111-243-26-65.dynamic-ip.hinet.net. [111.243.26.65])
        by smtp.gmail.com with ESMTPSA id fe8-20020a056a002f0800b006c31b4d5e57sm3417037pfb.184.2023.11.15.18.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 18:03:07 -0800 (PST)
From: Stanley Jhu <chu.stanley@gmail.com>
To: inux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	alim.akhtar@samsung.com,
	avri.altman@wdc.com,
	bvanassche@acm.org,
	peter.wang@gmail.com
Cc: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	chu.stanley@gmail.com
Subject: [PATCH] scsi: ufs: mediatek: Fix the maintainer for MediaTek UFS hooks
Date: Thu, 16 Nov 2023 10:02:54 +0800
Message-Id: <20231116020254.10590-1-chu.stanley@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231115_180313_654963_2BA7A94A 
X-CRM114-Status: UNSURE (   9.85  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fix the maintainer for MediaTek UFS hooks since the origianl
email address is not available anymore.

Signed-off-by: Stanley Jhu <chu.stanley@gmail.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index be1cbc6c2059..45762cab2991 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22102,7 +22102,7 @@ S:	Maintained
 F:	drivers/ufs/host/ufs-exynos*
 
 UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER MEDIATEK HOOKS
-M:	Stanley Chu <stanley.chu@mediatek.com>
+M:	Stanley Jhu <chu.stanley@gmail.com>
 L:	linux-scsi@vger.kernel.org
 L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
-- 
2.34.1


