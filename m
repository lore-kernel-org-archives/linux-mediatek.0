Return-Path: <SRS0=gQ79=JX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB6CEC43460
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Apr 2021 02:49:15 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82D0C6128B
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Apr 2021 02:49:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82D0C6128B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mGGdO3GOQ6LsZVP1S3nRe1A13ilDrjBw1XFIfXLa9ys=; b=ElptXXTwNUu4DRH8reYdUJ027Q
	w6v+7FIzRVeDNS/amKUPJVsjYwlRxnXAX157mKs+qtxNhdoXk5a9VD3vVSjUtlal/mZaXJUvB5uNm
	HKNECgjURlUjE4nkIjbnIFBQ7PER11HxiXWoB2W87E+r0VYhoLNqjU2Da7K6fcZdYeNPNnyzYhxjG
	nZGDtshpYXLxiCbDe4fvBG7KtWNXQf9WdBZr7knxor29f92/yAibv5wHqbJ3WqAveTv+NwFYUt/eb
	TeTLI3bQigcRyVxuCfjgSqt9cctsQYi+WyySFDvnR6wuAsnHUrpAcoKfr7ToBhzzuZO4bi4AQ5mnr
	0XNsmQXw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1larJ2-006kCE-SG; Mon, 26 Apr 2021 02:49:04 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1larIz-006kBW-IB; Mon, 26 Apr 2021 02:49:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=gt13WCDQ/zd+v9FPD35vbo66b69bTXdn1ZGXlNVhGSI=; b=c2B0c1d/xj8HGLwZaRxQNxZmtY
 sbUHKJxq0OT0oyWJpsYF7yIzqpn32FUfuX6X/xMXWd/HW1RJjH15C9Dm2yy22KwpNnJJ6wlDeB/fC
 OvSALbYIHV4v8MG1aSWyZRnfZPSPeiZzGJxJkFdhw9SF2MlUZQoPy/Ty0UmowcoJJNsv//VWOqF83
 80ROBCDBh3+FSZueUXKRznLyOVOIRvzdT5N4CILgUoR+97iXoOlRUdsbl/ouPDuumYolaWC86C4Yt
 CcIDevI7Naa0B9YT9PnA2bzc/VWTvFL4SPwv8b4RCpiCja01YTqcEvv1O50q2SfmrtycjXYYFDLWq
 XTy1f3lA==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1larIw-00FhMV-1C; Mon, 26 Apr 2021 02:48:59 +0000
X-UUID: 6887fd60cb534bf5a6209a1e014f6495-20210425
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=gt13WCDQ/zd+v9FPD35vbo66b69bTXdn1ZGXlNVhGSI=; 
 b=RgcFX7yRxIRXXIp00C5K28jBWN8PFYiJF+UsjKy9R+YipR19mwtzHsTMap2c//emA8G0wyNWd0a7Knc2HIrrGthf7U5sWHOXy7J7xfSyke36TnG8lxSSkpVlEprlpiB9oJqvF4brhmR5xrM0Q6aFHkAxOYyRiwfynTe24moTdb4=;
X-UUID: 6887fd60cb534bf5a6209a1e014f6495-20210425
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 301664153; Sun, 25 Apr 2021 19:48:54 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 25 Apr 2021 19:45:37 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 26 Apr 2021 10:45:35 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 26 Apr 2021 10:45:34 +0800
From: Zhiyong Tao <zhiyong.tao@mediatek.com>
To: <robh+dt@kernel.org>, <linus.walleij@linaro.org>, <mark.rutland@arm.com>, 
 <matthias.bgg@gmail.com>, <sean.wang@kernel.org>
CC: <srv_heupstream@mediatek.com>, <zhiyong.tao@mediatek.com>,
 <hui.liu@mediatek.com>, <eddie.huang@mediatek.com>,
 <biao.huang@mediatek.com>, <hongzhou.yang@mediatek.com>,
 <sean.wang@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>
Subject: [PATCH v7 0/1] Mediatek pinctrl patch on mt8195 
Date: Mon, 26 Apr 2021 10:45:32 +0800
Message-ID: <20210426024533.20840-1-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210425_194858_095459_79C37EAB 
X-CRM114-Status: UNSURE (   7.38  )
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

This series includes 1 patches:
1.add pinctrl rsel setting on MT8195.

Changes in patch v7:
1)add version in patch and fix spelling mistakes.

Changes in patch v6:
1)add "pintcrl: mediatek" as prefix.

Changes in patch v5:
1)document and driver patch are apploed.
2)change '-EOPNOTSUPP' to '-ENOTSUPP'

Changes in patch v4:
1)fix pinctrl-mt8195.yaml warning error.
2)remove pinctrl device node patch which is based on "mt8195.dtsi".

Changes in patch v3:
1)change '^pins' to '-pins$'.
2)change 'state_0_node_a' to 'gpio_pin' which is defined in dts.
3)change 'state_0_node_b' to 'i2c0_pin' which is defined in dts.
4)reorder this series patches. change pinctrl file and binding document
together in one patch.

There are no changes in v1 & v2.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
