Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F00D5C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Mar 2022 05:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8jsZruOjGQZH7dSs5ul3G+QnICSSLur/2pSDbdhrnQA=; b=2YYi5qlUhJ29Yx
	pXbvab5AnpB13Hp48Y78uwvoyodAqKkIICW204DHlbg4CV+PpAaL6jIhZQ0xhvRyDPjcSP0Ptusa9
	A6PrhAKEwWaRotM6XVg4kVG5c24+czuHhIEAaFVcrpl54TKyP8793Y4rX4X1yraGEsmBvbKNZclrV
	eaaRZtdVKtom6rEh56YhjX4RC4u60fdIIUrycTKvtfwvwcQRy+CvGLR5Zwhm6WyUOwUWacm0VpqU+
	Mt/XXO8kkK5aKf2SFJdW4Rwip/fw3KGc0z3tGSfw1C+13/SubPwbQiAl4yqQ4N/KDzy6wfgRnZQ71
	B/EGYl2b40QNRuixcslA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPHdq-001WFn-0r; Wed, 02 Mar 2022 05:35:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPHdj-001WEE-Vu; Wed, 02 Mar 2022 05:35:12 +0000
X-UUID: 25538331d7bd43818e64d451327d1c4f-20220301
X-UUID: 25538331d7bd43818e64d451327d1c4f-20220301
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 749150757; Tue, 01 Mar 2022 22:35:00 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 1 Mar 2022 21:31:56 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 2 Mar 2022 13:31:50 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Wed, 2 Mar 2022 13:31:49 +0800
From: <xinlei.lee@mediatek.com>
To: <thierry.reding@gmail.com>, <u.kleine-koenig@pengutronix.de>,
 <lee.jones@linaro.org>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
CC: <linux-pwm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <jitao.shi@mediatek.com>, <allen-kh.cheng@mediatek.com>,
 <rex-bc.chen@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>
Subject: [PATCH v3,0/6] Convert pwm-mtk-disp.txt to
Date: Wed, 2 Mar 2022 13:31:40 +0800
Message-ID: <1646199106-26879-1-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_213508_061994_E650B361 
X-CRM114-Status: UNSURE (   7.74  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Xinlei Lee <xinlei.lee@mediatek.com>

Changes since v2:
1. Modify the PWM name to DISP_PWM.
2. Include pwm.yaml.
3. Separate conversion files and add/remove operations.

Changes since v1:
1. Fixed formatting issues mentioned in the v1.
2. Delete pwm-mtk-disp.txt.
3. Add mtk_pwm dt_maintainers.
4. Add "#pwm-cells" & power-domains properties.
5. Make dt_checking successful.

Xinlei Lee (6):
  dt-bindings: pwm: Convert pwm-mtk-disp.txt to mediatek,pwm-disp.yaml
    format
  dt-bindings: pwm: Remove compatible for MediaTek MT8167
  dt-bindings: pwm: Add compatible for MediaTek MT8183
  dt-bindings: pwm: Add compatible for MediaTek MT8192
  dt-bindings: pwm: Add compatible for MediaTek MT8195
  dt-bindings: pwm: Add compatible for MediaTek MT8186

 .../bindings/pwm/mediatek,pwm-disp.yaml       | 72 +++++++++++++++++++
 .../devicetree/bindings/pwm/pwm-mtk-disp.txt  | 44 ------------
 2 files changed, 72 insertions(+), 44 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
 delete mode 100644 Documentation/devicetree/bindings/pwm/pwm-mtk-disp.txt

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
