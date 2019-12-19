Return-Path: <SRS0=dCaZ=2J=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DC24C43603
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Dec 2019 09:24:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EFF12465E
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Dec 2019 09:24:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IK+O09Sr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ilU1fcMc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EFF12465E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1ZtdO4DfJQGreKlTHpxtyT6ccoyg58KaSaNkjsnF0+8=; b=IK+O09SruxADGq
	RmX+RVYODRXUN43urYTTgfqeEn9RrfRvH0QqNNY9/SQL62PWm4lOV0fu10vZwvS6xu3idGBp2ThGX
	cWwpvRlRYBpfPwMZBArVQpSpljDvPKwoYaB9zbVeKPptUvC/H/S46eZgObttSQAF0EQom1ngHDU/u
	oSLz8b3YwNzJSVGd+x69yzD3Kjnt447TEEUEEsdNcYTkPDcXI94LT4UIAVmuM794d0L7/f7mhEWEw
	ehDA7kOjRZSq7O9lVIlBQ4u/WzTege3iyZFQGNe7ZiTBkG9SGt+i16Dnzk5UxD8il0xS/AnxpoLAT
	9FBPfWbh/HYzIYqd3urw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihs35-0001yo-RM; Thu, 19 Dec 2019 09:24:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihs31-0001xZ-Fi; Thu, 19 Dec 2019 09:24:46 +0000
X-UUID: 41eda239b5f243ea9125a9b88c34126e-20191219
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=kMoZXDieEORztJ/hucM7IpRP4DRg2oBPqKa9JoCjaBs=; 
 b=ilU1fcMchb4Jb6k/gMAo0yj5LOapSUEZk10ZynTDlQbfqYbKeq6I42ix/5Sr/aDNBLm7dOEXEu89WF/ms5Ji8zD3utjVeeTiV2AI1SWYoixb4d2wISfFje9ukDqRI/J96xnUzsNY+AdbU+qNJ9TrYbAa/IpcfDwU6eXgoTT6tRI=;
X-UUID: 41eda239b5f243ea9125a9b88c34126e-20191219
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <michael.kao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 837473206; Thu, 19 Dec 2019 01:24:37 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 19 Dec 2019 01:24:51 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 19 Dec 2019 17:24:16 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Thu, 19 Dec 2019 17:24:37 +0800
From: Michael Kao <michael.kao@mediatek.com>
To: Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <hsinyi@chromium.org>, <linux-pm@vger.kernel.org>,
 <srv_heupstream@mediatek.com>
Subject: [RESEND] thermal: mediatek: add suspend/resume callback
Date: Thu, 19 Dec 2019 17:24:30 +0800
Message-ID: <20191219092431.8935-1-michael.kao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191219_012443_540592_5502BBAE 
X-CRM114-Status: UNSURE (   5.13  )
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
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Louis Yu (1):
  thermal: mediatek: add suspend/resume callback

 drivers/thermal/mtk_thermal.c | 134 +++++++++++++++++++++++++++++++---
 1 file changed, 125 insertions(+), 9 deletions(-)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
