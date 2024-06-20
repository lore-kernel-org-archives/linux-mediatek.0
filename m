Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B688C27C79
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jun 2024 10:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9b9o2FIBC6CHU9KLscRhkfHduCG2chUR0QcdzSqhhlo=; b=PLRoXvdUMjRR9g4lrFmpJdLf35
	UznyuugG9i7UiFYcFZ13Gjah0emd78t7krDzRPuLUU2lmXDslggDm05d3paHPk+xmgKljG5VmdBA1
	TmeaicKvukG9W6m9eGVkbPW1VSXtbgJC7UfErKMEonRPlv7y0+Qb7ugKeLzO80p3RBgMPhKOpEk92
	KufxDYf91nN5ktDJKssVwb8ircA9fPI9rLrQKlL8nW7UI45sir4AElpnH1x45GtaPwbLzaQ3RZOUD
	rmBADGtAoSXowsG+IzurMVmvQ/4cCYvg//Hp2OzHZ4TPJr2L0QD/6zNDXPWeGf6hzSWb0pII8RzXc
	BtGORbqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKEiE-00000004VNR-0ry3;
	Thu, 20 Jun 2024 10:08:14 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKEi8-00000004VJh-21h2;
	Thu, 20 Jun 2024 10:08:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718878084;
	bh=fcT31yM+NshgIhzfWXghtZi7e3NaZVSVWS2eQeAyGkY=;
	h=From:To:Cc:Subject:Date:From;
	b=Kz+Cx5hNFgkqzab9aIBWCYtNRS2+Xat5GTL+bNOLeAqN8o/EJljq7PWQ3i+vE6qbm
	 sUmpW4mCOu9FM4+9loKTixn9/r9e2VNxyWpTCPoLOyweOJ9dXXi/kxz87gP+Q7LuXU
	 xo3MMk0769nV23qyhizW94PH0R8YiJoWrE/xIFr1Lx0zxLarvBEhndesWYxWqPKdh6
	 sYSmRf39xMo5Yjvya641afNrx3EIL8mVY0abFiO57CS7z7mafVprdrvtIMAjFb0JBe
	 FSGJFYp26zWxNeZ8M55400UOqbgMTDx1mlr+EaEer4VRC6+VJO82IyIfzI9aKdysqN
	 nLU7R+gHLgkyA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 213C6378143B;
	Thu, 20 Jun 2024 10:08:04 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: jassisinghbrar@gmail.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	houlong.wei@mediatek.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 0/4] MediaTek CMDQ - drop clock-names and refactor clock probe
Date: Thu, 20 Jun 2024 12:07:46 +0200
Message-ID: <20240620100750.1075790-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_030808_729185_802691BD 
X-CRM114-Status: UNSURE (   5.84  )
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

All CMDQ Mailboxes have only one GCE clock per hardware instance:
remove the clock-names requirement and, while at it, also partially
refactor the clock probe code to improve both readability and its
flexibility.

This was tested on MT8192, MT8195 Chromebooks, MT8395 Radxa NIO 12L
and on the MT6795 Xperia M5 smartphone.

AngeloGioacchino Del Regno (4):
  mailbox: mtk-cmdq: Stop requiring name for GCE clock
  mailbox: mtk-cmdq: Move and partially refactor clocks probe
  mailbox: mtk-cmdq: Dynamically allocate clk_bulk_data structure
  dt-bindings: mailbox: mediatek,gce-mailbox: Stop requiring clock-names

 .../mailbox/mediatek,gce-mailbox.yaml         | 11 ---
 drivers/mailbox/mtk-cmdq-mailbox.c            | 87 ++++++++++++-------
 2 files changed, 57 insertions(+), 41 deletions(-)

-- 
2.45.2


