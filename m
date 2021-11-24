Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84DACC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Nov 2021 19:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vKyz9gp8ndSCHXQzOXrBAeNKUNXnIsdpcOIRj7AoXQ0=; b=m96TjvX2RWQ18J
	vVFLbODta9Ai4E2iqr1nZPNZao0PCyLA6c+yf4vr+eMXlgA0OVHgYEXVe0oj4nZtPla3koUZK2t5Z
	kqo6mEjoc5dyZH4j3jbEE2WFSLSiK4Y0U9ts3Wtc7br78wHKk1oduM/KHRCO0O+XAtxzcwG96gfms
	Lcjo7dvARutcz9C7Rl6K+vWReGPqHu+PNs47QFXMbyjfh40ml3OBt0z0fm3FZEzPsKw0oLbV02L8z
	0HPyOoTlvM8iVhag8xqoJiQmWejHcKujIyKUgsmyA3xo4O+VBhDK0Tlqn2alHul5/e5k6+MIFMBdW
	pOBsJVcHY40SYt8XS64Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpxic-005cK2-H1; Wed, 24 Nov 2021 19:14:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpxiN-005c8Y-AZ; Wed, 24 Nov 2021 19:13:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=YQq93t7axsAIWp1ciV83UugabM3csRSN0gRk2Ja1x1U=; b=n9nLUBcDFO3+haoUEmsKJmp8YH
 FdG9T67lEbY3hQPdsEWTIV+5Mz6c2dSvZazby3zyy3NP3H5A97NA19y9dY0OPMdMwW0JOafnhlFlW
 eGuXv/y4D8yWXu32cZoDMvPqyqdqM2eTxdl29KBrAVm6XBjni8wqnj0P5F4CJAiMey5ejUVsPeF/A
 OkmyDRvu0N3caojZ4ywfTUlqWLbxzyEgQMgGdvwGPJlK6043NcBg1ba9Y2r1+tF52R51+i+bpFhI9
 TAe8Alp5HckdZ83L200k904uqVYGyCS83xMz5eZVRiKPBJqBSlzHha9sTIoIIM8wverRla3bk9kUS
 UtQVBU0A==;
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpxiG-000Irl-Oy; Wed, 24 Nov 2021 19:13:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8C7876109E;
 Wed, 24 Nov 2021 19:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637781216;
 bh=7ACxNdIYeMx8BUyKvevWfbu+SlAB3f7acPwte6T0ctw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UvF1O2K2wz8dTg8lVTJTsof9T5iLyiw4owWRk2izeBHKRcG+Abhny1WbI4EmdgzAD
 U5a0pKb0WQcWlAi4Io5/jfeS2d2w4zE6yWNec3/1tIl/hTHESOx7082s0y/H8GC6T9
 d6+kAcc0gUG/mbbEdvxN53xxP1ATPmlgS+wL1hqWXaxE4nLhB9Lri2pCi/aZBhfdvU
 AIf7snghwdHLS9B6FuqViHSDnYuA/qP8tGcRr7yPEJdtahQhrp+xLIWvgGS0RWR+e2
 WLVJHbaUUExcGZtWYgkl5wcXfK2WUKVK79AN3njb0ba9nwyHqcmuhSadFb8b+8qZmd
 SpqY/WqAY6kIQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1mpxhs-004Q60-Nr; Wed, 24 Nov 2021 20:13:24 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: linuxarm@huawei.com, mauro.chehab@huawei.com,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
 llvm@lists.linux.dev
Subject: [PATCH 18/20] media: mtk-mdp: address a clang warning
Date: Wed, 24 Nov 2021 20:13:21 +0100
Message-Id: <63ecb865c4f2b81862f5e6ac0dea497d3e0baca3.1637781097.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637781097.git.mchehab+huawei@kernel.org>
References: <cover.1637781097.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211124_191349_209462_36B7B5FF 
X-CRM114-Status: GOOD (  11.05  )
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

The typecasts at the dvb-core generate clang warnings when W=1
is enabled.

Such warning is harmless, but it causes the build to break with
CONFIG_WERROR and W=1 with clang, so do the cast on a way that
it won't produce warnings anymore.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/20] at: https://lore.kernel.org/all/cover.1637781097.git.mchehab+huawei@kernel.org/

 drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
index 976aa1f4829b..11285717577f 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
@@ -148,7 +148,7 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 			continue;
 		}
 
-		comp_type = (enum mtk_mdp_comp_type)of_id->data;
+		comp_type = (long)of_id->data;
 
 		comp = devm_kzalloc(dev, sizeof(*comp), GFP_KERNEL);
 		if (!comp) {
-- 
2.33.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
