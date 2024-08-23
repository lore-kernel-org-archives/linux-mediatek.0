Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C0F2C5472C
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Aug 2024 21:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=faZTWsJecnvdOlAjahWLoCMiZoe5zzRsIAbS695uofU=; b=JJMkZsc6yzIXGI
	hcUVfSJ5bTK0NGg7jw9jwJB7y7RfkQQ/wrcLfBh4OSBPfSyQI+EhLiDqVQ1iV3f00FJQ16QMnOieD
	OdX6btfhlr17IXlBH/WiMFLjr+6L22ZJCqpX0zfQbVvHO9yDL+RylnqqkqBs0kd40m5IiN8Zmqee4
	anOHgy0n0fits+JZd89f/Y6t3SLE2S1BRzJq2BqI5YRctFG4cuTKEiOaBGtD3ASmHYxv6p7g2zPRT
	OqEzHKDjqkGPwitDokkuEWh5X2xd/n6kZC4IiVknhxgbqkXy3A1qN4qWoY3DsNomsGg2PE6ZvZNB7
	XUp1ro0pJum9Vg+xBk5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shbsr-00000000if7-2qjC;
	Fri, 23 Aug 2024 21:31:49 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shbso-00000000idK-03nI;
	Fri, 23 Aug 2024 21:31:47 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1724448699; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Xl/Zfx7Xclz/z3s5EKpVC3Mc6D9WtpIC8WB6JtqKqAfKm8EuRUMtAO6zGcbaJz0g8AMFMhfEwQkhynAZbdMtRHrPGxLeBHjjk/QrWHRsQVRovqTlyHCjGVqk+lX5tRMh3jYmrQSf7AmYFvnhjIWBMMDCrXLmnQV6cIEMvJs4yNY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1724448699; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=faZTWsJecnvdOlAjahWLoCMiZoe5zzRsIAbS695uofU=; 
	b=gZNFjaHEAzJTeZbVs8HfU8F3lF5rHviSxRhdgHhHUdFQH4nwsNSUCMMBU+G4DAOYxhBtmRLETE/VUW59/BsYP0cfNtJnyMan7FAkellUDem8+cDyzDAL4bGVzULqFsyUg+iXDYm84Upw86B25KQn408W1HwQUbyZEP7nUOUH7gc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nfraprado@collabora.com;
	dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724448699;
	s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=faZTWsJecnvdOlAjahWLoCMiZoe5zzRsIAbS695uofU=;
	b=VBJcJj2a6CK6e/COGZqI72JcoU5MjdRtuehW7/nwwIunu1OVppSk1RY4CTDfrbRz
	nLv0Kiu/HQt2WdO6Mj08thXxzmoc201SVyvChJ6SL7Q7a2pqiYiUKRW6Y7YOIQYE+1g
	dMOGl91JuRPif0UQCOtLGcufLxkcK+FTP1HC2JaQ=
Received: by mx.zohomail.com with SMTPS id 1724448697934898.310874403391;
	Fri, 23 Aug 2024 14:31:37 -0700 (PDT)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Subject: [PATCH 0/4] media: platform: mtk-mdp3: Cleanups for masking in
 cmdq operations
Date: Fri, 23 Aug 2024 17:31:20 -0400
Message-Id: <20240823-mdp3-comp-cleanups-v1-0-1f8c1395ecd3@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKj/yGYC/x3MwQpAQBCA4VfRnE0xuySvIgfGYIq17UZK3t3m+
 B3+/4EoQSVCmz0Q5NKoh0so8wx4HdwiqFMyUEG2aIhwn7xBPnaPvMngTh9xHhu2puTK1gQp9EF
 mvf9p17/vByQ94RFkAAAA
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.1
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_143146_134597_BEAC22EC 
X-CRM114-Status: UNSURE (   5.82  )
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

This series contains a few cleanups to remove unneeded masking in cmdq
calls and in the helpers that call to them throughout the mtk-mdp3
driver.

All of the commits in this series are cleanups and don't cause any
functional change.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
Nícolas F. R. A. Prado (4):
      media: platform: mtk-mdp3: Use cmdq_pkt_write when no mask is needed
      media: platform: mtk-mdp3: Remove useless variadic arguments from macros
      media: platform: mtk-mdp3: Remove mask parameter from MM_REG_WRITE macro
      media: platform: mtk-mdp3: Remove mask parameter from MM_REG_POLL macro

 .../media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c   |   6 +-
 .../media/platform/mediatek/mdp3/mtk-mdp3-comp.c   | 537 +++++++++------------
 .../media/platform/mediatek/mdp3/mtk-mdp3-comp.h   |  29 +-
 3 files changed, 253 insertions(+), 319 deletions(-)
---
base-commit: bb1b0acdcd66e0d8eedee3570d249e076b89ab32
change-id: 20240822-mdp3-comp-cleanups-fb8c431c5462

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


