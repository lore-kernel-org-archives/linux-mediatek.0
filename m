Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7659C48286
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Feb 2024 18:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FM4cDbc05aFm+s5YmM2e5LZAZcaagXIlqsb3avH/P4U=; b=AJaL5pclG17TZ2
	xqsWJ4J/V2KETIF1Qn2AWqP6m3Y8PkFycEr5HFAx/4s5GulfOxtljTNn1r/JMr3m40NFC1uRZWmVo
	+r2IGH+0UWlwiS6oP+5o3v6zh4dL33BdbFMvM8AUSMal5FB/s4pLzIAqqxKyetXCJeD9hxLAm7I1D
	7rhWHLDc4SwEOPc46SPF+dnrr83/ciUPBYS2WmA0r4DktUiL+G5W2yEhENKqv1cp254fTEAx6jop6
	WYGS+nHjyJaCuNlmXrDOqYnuaRVEJ/cVWnr07Nwi1BRzvQV1DYoLYWpFVCeDXqkd/fGIRmuazEV+c
	QW0Cnt12YuY/z+EFbKaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVbjh-000000090Bb-13QP;
	Thu, 01 Feb 2024 18:24:29 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVbjb-0000000906C-0SSa;
	Thu, 01 Feb 2024 18:24:25 +0000
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout2.routing.net (Postfix) with ESMTP id 15933615E9;
	Thu,  1 Feb 2024 18:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1706811856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FM4cDbc05aFm+s5YmM2e5LZAZcaagXIlqsb3avH/P4U=;
	b=tt1qRTliyFFSUHcMcviRe+VcJNZonpH26E8dcYVWElrfwmBvJGErlNZWu9vcwvtc29m+ld
	fR5Hj/0LQVl3HMVwY/cVXoz7qP3B5GC5yngrA0SoYtLeEawZL16MajOChDPaxfV48q8kDC
	8n6YvCFuSVht9AX1E3/QJ/H+Ao8fK7M=
Received: from frank-G5.. (fttx-pool-217.61.148.248.bambit.de [217.61.148.248])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id F247440533;
	Thu,  1 Feb 2024 18:24:14 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v4 0/2] Add reset controller to mt7988 infracfg
Date: Thu,  1 Feb 2024 19:24:07 +0100
Message-Id: <20240201182409.39878-1-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: c0fd09d3-398d-40e5-b864-847111d8224c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_102423_493167_186D6BC0 
X-CRM114-Status: UNSURE (   7.94  )
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
Cc: devicetree@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Infracfg on mt7988 supports reset controller function which is
needed to get lvts thermal working.

changes:
 v4:
   - changed commit message of dt-bindings patch to include information
     about starting from 0 again suggested by Conor Dooley.
 v3:
   - start resets on RST0 offset (LVTS is RST1)
   - rename offset constants with MT7988 prefix (else collision with reset.h)
 v2:
   - change value of constant to 0 from 9
   - add missing SoB and commit-message for binding-patch


Frank Wunderlich (2):
  dt-bindings: reset: mediatek: add MT7988 infracfg reset IDs
  clk: mediatek: add infracfg reset controller for mt7988

 drivers/clk/mediatek/clk-mt7988-infracfg.c    | 23 +++++++++++++++++++
 .../reset/mediatek,mt7988-resets.h            |  6 +++++
 2 files changed, 29 insertions(+)

-- 
2.34.1


