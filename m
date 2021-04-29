Return-Path: <SRS0=2Vnt=J2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39C17C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 04:17:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F21EF61450
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 04:17:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F21EF61450
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4m4HMpAfW/01rg986ok7wPYjfDUV/ptkpw31NTBd+Is=; b=cHImRYxXbREeKGgfE31tzQMX2P
	8BRlGFOkkV7pwTEehv1fUbH4wvqiZZjxU6eEARvyoXDqEW3dt4FezyAyanYGH5HLnFEyk3bQxQ4lB
	vp8OB8RshZ8rE29ol7pZIalt7DVu4MxcyH6S1O9S5KskOj4nxh/aSWpUMi/IuSz4ozbNEpw7BYPoT
	8kZqUTIh6TzGJKdW0WuFxeTcKcq65M/l/GgnT/vg+M2XPvhrzXYIOKDdkSYO/W/TDap2pRoanzHea
	AyJIDCFOt8ZiBiwAwaUppuBmXdViKY26khpsprxrrAmoGMnrelkJp56ejuBTpYvHfgFTHXEesq9Cs
	7421Ij8g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lby72-004qZF-Jd; Thu, 29 Apr 2021 04:17:16 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lby6h-004qXE-Sf; Thu, 29 Apr 2021 04:16:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=1wwtodXYjucbS9xVNCe50A+efwkbumB3XvjtLdttizI=; b=mbXAuY9/JhVs1bGq6RdJICuJTI
 6Qe8hz8Uer0F1ikDXRdimV0Zd8It5YgTkC5cgJ9TMGsy39S9b04tYYa+25ODItl0SrP9IvRgWJH3n
 0Dj32UqWZ1Qmfv8T+ANRtTRA6JyUINDFjfJtYWSziXWh4JL053H1JlSx+pTb6YKyC74OROU3+jbCE
 Ti6+whiyvHzCC6qNyTjZ2IJ5nkp1lxnbKAzDT9WXVGG291Xo/gee6Je8pbsoXO7Ek12pyY9j8GMPd
 O3K9Evu6gqMJPV5VEEUIp2GH+KhbuUY60+ObqqM7lcuVKcIznPkodFMlzHDy+8n76MMvq7QL9I6dh
 375VCWCQ==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lby6e-000MD3-DK; Thu, 29 Apr 2021 04:16:53 +0000
X-UUID: 0d40ef75e7b7415da5d77e82e03a7ab0-20210428
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=1wwtodXYjucbS9xVNCe50A+efwkbumB3XvjtLdttizI=; 
 b=q8eOD2EqHiCM8qHThXhvIxzV6JgRDIA9E8Nv6RzSvt3FbzaL7j3x0OQYKcIZe+j6M9qu0PPEGcKzBpodZrOX7NfldueFzJpbJzeNEK/rLgHexmmEMxFMG8s6Ga+mMCXBXl37NYC0hpElY1oGDLgDrWSWu3Xs9DYlbkaIR3ndNBQ=;
X-UUID: 0d40ef75e7b7415da5d77e82e03a7ab0-20210428
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1342461783; Wed, 28 Apr 2021 21:16:50 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 28 Apr 2021 21:16:49 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Apr 2021 12:16:47 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 29 Apr 2021 12:16:47 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [v3 RESEND,PATCH 0/3] mt8183 dpi supports dual edge
Date: Thu, 29 Apr 2021 12:16:38 +0800
Message-ID: <20210429041641.11077-1-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210428_211652_467921_97773344 
X-CRM114-Status: UNSURE (   5.93  )
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

v3:
Modify clock rate for dual edge setting.
Add more bridge function.

v2:
Modify unused code

v1:
DPI can sample on falling, rising or both edge.
When DPI sample the data both rising and falling edge.
It can reduce half data io pins.

Rex-BC Chen (3):
  drm/mediatek: dpi dual edge sample mode support
  drm/mediatek: config mt8183 driver data to support dual edge sample
  drm/mediatek: dpi: add bus format negotiation

 drivers/gpu/drm/mediatek/mtk_dpi.c | 107 +++++++++++++++++++++++++++--
 1 file changed, 101 insertions(+), 6 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
