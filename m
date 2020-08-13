Return-Path: <SRS0=lgZq=BX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23A6BC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 09:17:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4D1920781
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 09:17:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0KCaSE1L";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="HbQYefQ5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4D1920781
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wh4dKpbM2pWXWDw+NP/q8YMx7wZPLNduAE5NTpDPYDg=; b=0KCaSE1LzueeVKeTzc3YpatsVX
	LjPA4+dazzQLzoNDU+0UuncXFHuuUrQ65Yji5tDnCFdKnFFsrTg2VEI7pKYnBrucjICZ7QO0cmNz8
	0Hl4lI8ZSWOxiWEZ9y2Q2dx5FYRNpqEm2jNabfxlYtfqQGAdg+aBcjuMK7OU5ueBgLF7r1jbBw1ou
	MarM9kOEWSqNAxBNO0oyhp7SIsFT6mS3i/BpHoPDSGPjPVQHgSitonboTql4/OjuVFQzkeYeMDpB4
	RCdeutDox4jseT8N4N9qTPpBdmiZskEfxpvoxaBwMpalxu7FQI06jwpGubMsiya4VaVvgNIejgXoQ
	UL4ip65g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k69MY-0001Cz-QQ; Thu, 13 Aug 2020 09:17:30 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k69MT-0001An-Mn; Thu, 13 Aug 2020 09:17:27 +0000
X-UUID: 7ba895fff6cb4370964dc8736415a0e1-20200813
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=xVTG3i3NZ+1cOXWR7yCUvveG4pS/BEjPy1kRWzM1V+Y=; 
 b=HbQYefQ5NBkj3GDSJjtA/+x89HH/uN9Yv9L3ly/W4/gvuarutfb2vNlrPZLg+hUXhePRF+S3577BM3GK8xakxrDrAmCASUihsnYgb/8nVg/tnMeGVY4wr4BPBNvqDlhrg4rvVN+VxiEENfCa7iD9847kXX8JxJ9R0nVHnWgvllA=;
X-UUID: 7ba895fff6cb4370964dc8736415a0e1-20200813
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <wenbin.mei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 410224735; Thu, 13 Aug 2020 01:17:21 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 Aug 2020 02:07:18 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 Aug 2020 17:07:17 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 13 Aug 2020 17:07:16 +0800
From: Wenbin Mei <wenbin.mei@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [v4,
 0/3] mmc: mediatek: add optional reset property mmc: mediatek: add
 optional module reset property arm64: dts: mt7622: add reset node for mmc
 device Documentation/devicetree/bindings/mmc/mtk-sd.txt | 2 ++
 arch/arm64/boot/dts/mediatek/mt7622.dtsi | 2 ++ drivers/mmc/host/mtk-sd.c |
 13 +++++++++++++ 3 files changed, 17 insertions(+)
Date: Thu, 13 Aug 2020 17:06:15 +0800
Message-ID: <20200813090618.28009-1-wenbin.mei@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200813_051725_964602_2428FEFD 
X-CRM114-Status: UNSURE (   8.97  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
