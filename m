Return-Path: <SRS0=tJCI=6P=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7F6CC47253
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 May 2020 10:36:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC7F120787
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 May 2020 10:36:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fv+r2d93";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="17EgoLvU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC7F120787
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Tl8K8D4jargNftFlRZYGRF2mJDtstMdsX3ZbAAPLv3o=; b=fv+r2d9311iV3H
	GlbXqIiCJkVQW3V+pr9fwSVj1+G0uL6dtvYiRCSG3Bo3i3CW5e67/CeLEebwx9UK+XQmC1/3bCdaF
	iVXDszT/PbA+AIwhd8/VgU2dYUlAhJ//+KjxAlR6UzedN1Xq8wfq8W2y9n3OhAnn4pLQrByBGMUOs
	GIZCqHl0OaGKzPlVXhrcqharVi1BOXQXmb2rt0WUvq4/emigTnruhHEZev3UnFde2oQC2rA9PAOFS
	uq9ltzJNavm60WOVYmddHqV1OSUyKEC6UE3seWI+k+ahrp1xPcWRdDEbEulQmZiQCHOIUWoQXOWbq
	jbtW8KXR8U3RxVIWgfaQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jUT1x-0004Hf-Pc; Fri, 01 May 2020 10:36:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jUT1u-0004Gj-OE
 for linux-mediatek@lists.infradead.org; Fri, 01 May 2020 10:36:27 +0000
Received: from lore-desk.lan (unknown [151.48.155.206])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 20737206B8;
 Fri,  1 May 2020 10:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588329386;
 bh=fw5xGVqqd2tprPzJsl0T/zAt2VuNqlVmoDfWPZLmlKI=;
 h=From:To:Cc:Subject:Date:From;
 b=17EgoLvUjeytXWPV60EHMWV9rFVCc3oMLPXi4RtFN/9NrHplAbKy53bYb6pEMLukq
 jR332/i40UnCrJakVsRoDJo1hjkqoV74EAjgAs7NAAQzvWqwk1j/OTZazkW2QXVHTu
 7dM/Z5mEvNfBppYJXSbFj5BNvaF7RFfBCSSNG+Xw=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH 0/7] Introduce WoW support to mt7663 driver
Date: Fri,  1 May 2020 12:36:10 +0200
Message-Id: <cover.1588329170.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200501_033626_807903_D09DFE52 
X-CRM114-Status: UNSURE (   7.06  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
 sean.wang@mediatek.com, linux-wireless@vger.kernel.org,
 soul.huang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Introduce PM and WoW support to mt7615 driver if it is
running offload firmware

Lorenzo Bianconi (5):
  mt76: mt7615: introduce support for hardware beacon filter
  mt76: mt7615: add WoW support
  mt76: mt7615: introduce PM support
  mt76: mt7615: add gtk rekey offload support
  mt76: mt7615: introduce beacon_loss mcu event

Sean Wang (2):
  mt76: mt7615: introduce mt7615_mcu_set_hif_suspend mcu command
  mt76: mt7663u: introduce suspend/resume to mt7663u

 drivers/net/wireless/mediatek/mt76/mt76.h     |   2 +
 .../net/wireless/mediatek/mt76/mt7615/dma.c   |  37 ++
 .../net/wireless/mediatek/mt76/mt7615/init.c  |   1 +
 .../net/wireless/mediatek/mt76/mt7615/mac.c   |   4 +-
 .../net/wireless/mediatek/mt76/mt7615/main.c  |  87 +++++
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   | 353 +++++++++++++++++-
 .../net/wireless/mediatek/mt76/mt7615/mcu.h   | 101 +++++
 .../net/wireless/mediatek/mt76/mt7615/mmio.c  |   4 +
 .../wireless/mediatek/mt76/mt7615/mt7615.h    |  12 +
 .../net/wireless/mediatek/mt76/mt7615/pci.c   | 107 ++++++
 .../net/wireless/mediatek/mt76/mt7615/regs.h  |  28 +-
 .../net/wireless/mediatek/mt76/mt7615/usb.c   |  43 ++-
 12 files changed, 766 insertions(+), 13 deletions(-)

-- 
2.25.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
