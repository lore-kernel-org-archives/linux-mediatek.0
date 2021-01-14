Return-Path: <SRS0=30Xp=GR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92E41C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jan 2021 06:26:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2729E2396F
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jan 2021 06:26:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2729E2396F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=thYU8yyFi4vCpBLgQehgvsclD4hp+aNTazpKZo9bsSI=; b=oaY1KWvOcqcRWK9H78VpnmOtO
	6UKIdPhfVOWjLqFRJa4UKvJmhE5UOcbigQOLjMvuvxPplnokx0MHbBpzjGXt+p0rjg+yEYd9rUx44
	8KgPcdlmpdic2E1kynimk+SwIirFn/aHvRHbJBZnyZ608Nx8SPAC8MC/8Hyk9FOwcMmeDC0aqlc9m
	TvTg6kuuGAOFSK6Khkwx01Q8aZ2RKBUW2+YB0p6Dihq/xbCMMl/XHxqTrYlOtJU3uj8AV0Vy4dpav
	Uups0TK0pxyPAqYW5d6TOfNDNC8W+wcPEamRiy8c5VqL/ZLfwMExjAsxWQ79H5ibJC9C+w0QX4QF9
	3pDP7GmHQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzw5K-0006Vu-AU; Thu, 14 Jan 2021 06:26:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzw5A-0006Tx-Pj; Thu, 14 Jan 2021 06:26:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 13DDC23976;
 Thu, 14 Jan 2021 06:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610605568;
 bh=BiN2Dsvpeojkkw97MJouJxauaNi6M6gNDGNje1e+PM0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=o9Dubl2+wHr4IzrQ+8CrbEtbxYT5TuXipZqQ6q9Y+b1bxn9yucdX3DgFol8mWrXfC
 jd1p5z6DF0D2c+OrFs2I50CwS4jXwKueQDbTplOhtbYYyawQSGw/bQWhPOYCrShUOX
 k0S6Yt5LzcjUrlO3SZVFN1Pk/htVhUgzat5NlCmATYDRnhSOtuFB7f+Yj0U6riFasa
 hbqvEL2NjD1QKbwfFDhWUDIwEXfUOdDLRkekau1vsEKGaZs5hFWKbdrQ7sHm10Jc1p
 EDShcropGEkvuXiCY/gu6mkiE9kE4lKGUCSPsluokxStDO5MYjPRRasFKNscwY9OAR
 mGNGv+eySAVzA==
Received: by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1kzw56-00EJ7I-J0; Thu, 14 Jan 2021 07:26:04 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 3/3] MAINTAINERS: update mediatek,ufs-phy.yaml reference
Date: Thu, 14 Jan 2021 07:26:00 +0100
Message-Id: <d452a50ec87a662f3e816a25a4bff4ea7bb4ac23.1610605373.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1610605373.git.mchehab+huawei@kernel.org>
References: <cover.1610605373.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_012608_950603_AC5655FC 
X-CRM114-Status: GOOD (  10.13  )
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
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Changeset 67038ec1bdfb ("dt-bindings: phy: convert phy-mtk-ufs.txt to YAML schema")
renamed: Documentation/devicetree/bindings/phy/phy-mtk-*
to: Documentation/devicetree/bindings/phy/mediatek,ufs-phy.yaml.

Update its cross-reference accordingly.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index b15037d9b01d..6cf24e7fc569 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2093,7 +2093,7 @@ M:	Chunfeng Yun <chunfeng.yun@mediatek.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
-F:	Documentation/devicetree/bindings/phy/phy-mtk-*
+F:	Documentation/devicetree/bindings/phy/mediatek,ufs-phy.yaml*
 F:	drivers/phy/mediatek/
 
 ARM/Microchip (AT91) SoC support
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
