Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9178CCD98DE
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jun 2026 22:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A3CN6mz876+/SEyI0OosJ7IJHs+qiuB800Fja+uy4WU=; b=bx1wxamSys02ojDfoL48+cfB3Q
	EGMkr5c0+NtG4lABlKApnyKRFCeOmnuZyRR9Kg2CYa5fZ0NKiera4Ij2Kf8gI7PzGeYs/VHNtMxjL
	N87PIIpL1yLiY03jUycJYmgZ4Dfts8GGBZ27XiOqCAWtfN0oDD2UoG+JM2XBj9LMHyrw+Gl/LX4+x
	kL9B/1ihDffABJPDC8MB6sBwvLRA/XIvHZsJe2+uzk4zEImnpqzhfYhuExQFGely4vxdElDJGK5dc
	Mmj6Dc7TKVAqdlyEGQVE9OlKpKTlKYL4LBEdZJ1ltaFlXWzodpd25w67egz4leVOjs5A/ls8qiR7c
	OIJc6Xlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZGBp-0000000Euuq-2H1F;
	Mon, 15 Jun 2026 22:53:57 +0000
Received: from mail-dy1-x1342.google.com ([2607:f8b0:4864:20::1342])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZGBn-0000000Euu4-12ho
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Jun 2026 22:53:56 +0000
Received: by mail-dy1-x1342.google.com with SMTP id 5a478bee46e88-30807ba471bso10999795eec.1
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Jun 2026 15:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781564034; x=1782168834; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A3CN6mz876+/SEyI0OosJ7IJHs+qiuB800Fja+uy4WU=;
        b=KWGLqB2L+KfWN3DNCZkApIxWTPwKL3pmQLNcSrk3GGc0f+M4JapBy8mnCceud9stpE
         9Z2yvho5BuazxW5Sbi0aHI8vFCGOIRmXTXxle251eGv+b7aMXL0tKZC4XwYs+tZgNmEv
         Z+48BcmiUh3B1ePgX3+GPXprQFMauc+VFwH3D3A4olxx8v4SOipKNF/pT2S7v+oq5bgl
         /IRaqFXIeoqjw02k9SmqslzeDk4g0h2F70CqU0youvgljBiFUwQQkIVIYs1avnlQBzpG
         DT8MnN81zeO8rkoo+Q4/4eq27Y8AFO86oUSsWW3c/uhkE3xbyeD7vzzFnPKojrDn44jH
         Q/Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781564034; x=1782168834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A3CN6mz876+/SEyI0OosJ7IJHs+qiuB800Fja+uy4WU=;
        b=Hw0+5h6H7FVJMDy+SS0Jmu39tO/1iXMWKSn+itPHfffLtyGRQhfuMEPrHoyVgoXrC9
         EY3VCa5paU57t/SISXyKrjf/aN6INbr2wC4WlgTnL5yCREWAgJHMEgW2zfceoMztgYaw
         tfxlBZNwOxJ2G4d+9jdGQellCtwJA3EZyItJrfOcez8s+jY0Rqt9cae9NoLp5JVwJK0n
         oNeEfn3ZvRP9qc/9dkkJp5vhDkqQiu9cN0+5Kt0tOHyBsCXl+6QEEN79RZesV7e1YBVN
         MMEeKZb3ESEYm4BIpvsW+IriTCoecDMlBriiuw8H9fTXY/L8L+q5YKGGOWxcuYH7AHeR
         Icjw==
X-Forwarded-Encrypted: i=1; AFNElJ/An0aeCk3dDbTmKoLdK8Yj9VRDup7k50+qKTpvuCy4GEUKSAdtCvsn1IJhDMg2rSNTs+VnRm0Up0cSRVvG1Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyQJ+1FoThnnuy2uiDEFiXGJw6t8vy+58FGwq7Zs/38upT/eJ+K
	+06mzpwwr46w8EMUBcdmlgDWcKa7MEg7tSo/u9BJD1l8HRIviBU1KrxC
X-Gm-Gg: Acq92OFYr837ebWJiemw98gw5E+M0CUhtG4X67gxP1oakCrzLKOP0GgFWUbNGSiVb2m
	PYtqmBLUcK2SnKbgpveyCVL1QQU1yx2b6FxvkiZCmebIXqWoRkJLTEIhXretE3/g0Rpg5MAdakL
	1gmxQhzcjtuWyY5pWw0jeupu0Q4oqhyDOLU1qXOiM0PPa2yFIDTW3gHuzPekjF/X9SJFNqeNVBK
	zDjULJysguJ3VCgmoz9mNUrnVb+mzSBZyl8yTAbtI6iu42gkwe4syru26+AR0o3Y4kigKv/lydR
	H7qyEGHd+Tzdfd2AJDyXR4L1unK4yNTTSklgsejp+Lyobieepk75eGv6BTdbL3J5Ddxxbp3iIMz
	sNdhcTXEg4OCUv7SP1r0vGq+kw94YjEmjlNXCyCCbVhQhhIGDfjfRkhkAoeCEGWIMEtUSjBAAas
	fEu6A+pB305/ihH9kLqf0pn5vhcZ5hudlOj6wUTPbnNUt6XK3Y3f2tBGpCvjau8TjYAgID2g6rN
	cra48sNcx9puVhrRo9FDIDA9tEBulf4IgiAqNqbBS4sModIcJlyWgSmIXiyNO2HAndtaSm7DOfX
	5hIruyIW6Z1DDTMd3Enyc6xdVkI8
X-Received: by 2002:a05:7300:8609:b0:304:d8cb:841a with SMTP id 5a478bee46e88-30ba5b28d0emr761709eec.14.1781564033851;
        Mon, 15 Jun 2026 15:53:53 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081eb95342sm16727559eec.29.2026.06.15.15.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 15:53:53 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: "GitAuthor: Ethan Nelson-Moore" <enelsonmoore@gmail.com>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2] media: mt2063: correct CONFIG_MEDIA_TUNER_MT2063 macro name in comment
Date: Mon, 15 Jun 2026 15:53:48 -0700
Message-ID: <20260615225351.22791-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_155355_330192_B9147128 
X-CRM114-Status: GOOD (  10.95  )
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

A comment in drivers/media/tuners/mt2063.h incorrectly refers to
CONFIG_DVB_MT2063 instead of CONFIG_MEDIA_TUNER_MT2063. Correct it.

Discovered while searching for CONFIG_* symbols referenced in code but
not defined in any Kconfig file.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
Changes in v2: Use correct media: commit message prefix

 drivers/media/tuners/mt2063.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/tuners/mt2063.h b/drivers/media/tuners/mt2063.h
index 30d03cd76061..6c4b6c68ec25 100644
--- a/drivers/media/tuners/mt2063.h
+++ b/drivers/media/tuners/mt2063.h
@@ -24,6 +24,6 @@ static inline struct dvb_frontend *mt2063_attach(struct dvb_frontend *fe,
 	return NULL;
 }
 
-#endif /* CONFIG_DVB_MT2063 */
+#endif /* IS_REACHABLE(CONFIG_MEDIA_TUNER_MT2063) */
 
 #endif /* __MT2063_H__ */
-- 
2.43.0


