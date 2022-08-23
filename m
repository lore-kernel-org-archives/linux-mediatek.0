Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 542F7C32774
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Aug 2022 08:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0XpZgLgvQIhzD9OrA/D2oRDjY+6u93V0EFGksJPqrXM=; b=PgQ1bwL/FrazamHnzZdYX0h2Js
	xCvKnCq7oEMPX2Z2YpT+vP6wS17mpKd8UoZTAmK/l7GbUsSKfjFiZiDJYAFkj9lKerdHkrLZD7SvT
	8c+wbV2aU3oylgJnoJ0TgPB2gPgIpBHkP2R3vS4hFoddzrJOYEP9NFkU0peWWT0F8KKkhCF+mF14Q
	cMrWSFA/SMKhgd1DJ3tQoNsBV2qWWcYi7a3izd4579qnqqkiVnOQlh2H3NyLNxtAuxGPUsOkFeM2Z
	ldf7gHRrMDDpn2QkhXgtEWCQTNfjdUCGM0ro0Dxj5UTYE/oDayzrzPV+P2dj/XTGCPKEP1bkIOJfd
	LAfUXAJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQOs0-003jwX-G8; Tue, 23 Aug 2022 08:02:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQOrI-003jat-99; Tue, 23 Aug 2022 08:02:04 +0000
X-UUID: e3e23292a78745aa8611d5db1f28f3b3-20220823
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=0XpZgLgvQIhzD9OrA/D2oRDjY+6u93V0EFGksJPqrXM=;
	b=KI2iq0XbXSNL0G5QRHRPveIHTalEMzyTV4rbUwnhR684meDxcvWsYhkUMbugWhf/JxiVmIT1A2c9LPJlRVy0QDN5wHISl9MhABe8lriKvguYgzw+SfCOZpO6W7YF4jVnIkCbRuERDWvVETvOA5OuruMmolGoGQk/kaR7RXRTlH4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:e2a4aa4b-8cda-4e8a-bca7-0f0b1a812e44,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:961c55cf-20bd-4e5e-ace8-00692b7ab380,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: e3e23292a78745aa8611d5db1f28f3b3-20220823
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <xinlei.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2121864220; Tue, 23 Aug 2022 01:01:56 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 23 Aug 2022 15:31:19 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 mtkcas10.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 23 Aug 2022 15:31:17 +0800
From: <xinlei.lee@mediatek.com>
To: <thierry.reding@gmail.com>, <u.kleine-koenig@pengutronix.de>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>
CC: <linux-pwm@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Xinlei Lee
	<xinlei.lee@mediatek.com>
Subject: [PATCH 0/2] Fix mtk_disp_pwm_get_state function disp_pwm enabled flag
Date: Tue, 23 Aug 2022 15:31:13 +0800
Message-ID: <1661239875-19841-1-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_010203_346406_144A727F 
X-CRM114-Status: UNSURE (   8.85  )
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

From: Xinlei Lee <xinlei.lee@mediatek.com>

Base on the branch of Linux-next/master.

The series mainly completes:
1. Add compatible for MediaTek MT8188 in the dt-bindings file.
2. Fix the parameters calculated by the enabled flag of disp_pwm in the
mtk_disp_pwm_get_state function;

xinlei lee (2):
  dt-bindings: pwm: Add compatible for Mediatek MT8188
  drivers: pwm: Add disp_pwm compatiable for MT8188

 Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 1 +
 drivers/pwm/pwm-mtk-disp.c                                   | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

-- 
2.18.0


