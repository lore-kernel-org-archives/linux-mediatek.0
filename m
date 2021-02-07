Return-Path: <SRS0=0SFh=HJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C47EC433DB
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Feb 2021 13:12:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AC4B64E43
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Feb 2021 13:12:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AC4B64E43
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G+wnix4xutJtvaq1Sw4iuzbCAvih12r4fOH3WdjRpr8=; b=onsSjDfWeGmW24CvuTWW998zOF
	VZ6LwPxexoCLLccAB0rhZIzNTF2zuOuSfmF5azC3XDBFkXWPM/Qp4T4bzOgGmThuxkrYv8V9WfGr2
	EpEJwpINT5CgX6kOO/V4qkQkTI+vzCFhzLnv56pXEBeBXk8ZTWQQzGmyEU6vKa5bD38MVf6Bbhymz
	v5tsm12MiFgcwap8UmGALqavryujm1INnSyYvsxlSu3ECU4LI9JnNLaNRlAsfpb52jLPWAdI18JCy
	qElYY71FxvK4WgrFLdROgnWNXxEytu3q2+PYLYhbHkhiiNzRQzQ1G/5SvUNZMrSW956Lb9qOLMVP5
	WkLWGZIg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8jrj-0006UY-VM; Sun, 07 Feb 2021 13:12:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8jre-0006Sy-3G; Sun, 07 Feb 2021 13:12:35 +0000
X-UUID: 0198b58d266b4f39a0f9ab460ec931ac-20210207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=QLNscCM4wsQMv3eq+zALW0d8AAKHMikMVrsEX23/lO4=; 
 b=IP/PkTxSJosnvt3rv63Z+xL0zV/cLDpmRIKpX7QxFVVkOjwti/DXqC/m4WW1rcOqK08ucAuM9enjzH/oOM4gCmjRs/RFeP1n4NSwXIqm2BSckhJsqfg6CNIA/ZfmDzpaWEjTYuEsmTzF3FWDQqvrRZKBtaDSF0sBzV1ClaFbmN0=;
X-UUID: 0198b58d266b4f39a0f9ab460ec931ac-20210207
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1454181712; Sun, 07 Feb 2021 05:03:04 -0800
Received: from MTKMBS33N1.mediatek.inc (172.27.4.75) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 7 Feb 2021 04:58:59 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sun, 7 Feb 2021 20:58:52 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Sun, 7 Feb 2021 20:58:51 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>
Subject: [PATCH 0/3] Add check for max clock rate in mode_valid
Date: Sun, 7 Feb 2021 20:58:47 +0800
Message-ID: <20210207125850.155979-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TM-SNTS-SMTP: A3BBACAF5CC47D71965CAB1DB8605E5CB53589E2F1F23802461841E15CEBCFD52000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210207_081234_300276_178489DE 
X-CRM114-Status: UNSURE (   5.21  )
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
Cc: devicetree@vger.kernel.org, Jitao Shi <jitao.shi@mediatek.com>,
 srv_heupstream@mediatek.com, shuijing.li@mediatek.com, airlied@linux.ie,
 huijuan.xie@mediatek.com, stonea168@163.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, ck.hu@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, daniel@ffwll.ch, matthias.bgg@gmail.com,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Jitao Shi (3):
  drm/mediatek: mtk_dpi: Add check for max clock rate in mode_valid
  drm/mediatek: mtk_dpi: Add dpi config for mt8192
  dt-bindings: mediatek,dpi: add mt8192 to mediatek,dpi

 .../display/mediatek/mediatek,dpi.yaml        |  1 +
 drivers/gpu/drm/mediatek/mtk_dpi.c            | 27 +++++++++++++++++++
 2 files changed, 28 insertions(+)

-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
