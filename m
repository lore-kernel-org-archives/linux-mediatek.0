Return-Path: <SRS0=HQvY=EY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 194A8C5519F
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2020 09:18:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D1E92467D
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2020 09:18:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d+vVx0jd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="h8vv1dJp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D1E92467D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=30E647jla//fXuqASwCuCKWlLLNifUyjslx4EoRUTxQ=; b=d+vVx0jdgzQ7Zl0hosR55MqFn
	QolH+sCcoiYLOKK1GsCNU21DfykculWlAA5/FTFPqTTWPb4mlukjbJkUgT2b6xn88aOMxyDQsJTZF
	jvuRvoY2yythY6PLtfvsE1fEbx0UuVmilNoLq1OantRNIZHrVt5rOXdkyWirGNp1vBXJ+EijGc4oC
	9UWPnCsptwoWztV1pWxbI/Klvi65RtrkpQGZhsNgPnKcFSWw41Hys0Gux8FiB3umN4S7WJkVoTh5G
	nSDDuZkLS/xkaeO9mG2Sb7lopiON0NHS80tlekqxnsvQhNX8HTFtcgMawJkx2h+LFfDnTEB/eNiwZ
	O+GyT6kgA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfJbt-0001oy-5u; Wed, 18 Nov 2020 09:18:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfJbp-0001nj-4x; Wed, 18 Nov 2020 09:18:38 +0000
X-UUID: 2cf2d1bfd3c74b388cfd8fcacb3e1d83-20201118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=qfpE3TD0SXn2IdwIG4zbudRW/4wZoYJlExaUY6FckbM=; 
 b=h8vv1dJpXxHp6gQB/O/sFi+jUuuB5ZQjZkNnqmRMW3nLQNNlObFCEOjSqQzAcA/4RGfVHLMp2U/D/GtJOeH+Ta5QpZRTd7jPJk+qf060ALlwgxLoRX7h8mJJbD+pXLHG+z4bgAJ7QzrxhsLRlkBNmqQ+dWB63rJeY8TuozD9Tmw=;
X-UUID: 2cf2d1bfd3c74b388cfd8fcacb3e1d83-20201118
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1262489568; Wed, 18 Nov 2020 01:18:23 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Nov 2020 01:18:27 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Nov 2020 17:18:24 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 18 Nov 2020 17:18:24 +0800
Message-ID: <1605691104.18082.3.camel@mtkswgap22>
Subject: Re: [PATCH v3 05/11] dt-bindings: phy: convert phy-mtk-ufs.txt to
 YAML schema
From: Stanley Chu <stanley.chu@mediatek.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Date: Wed, 18 Nov 2020 17:18:24 +0800
In-Reply-To: <20201118082126.42701-5-chunfeng.yun@mediatek.com>
References: <20201118082126.42701-1-chunfeng.yun@mediatek.com>
 <20201118082126.42701-5-chunfeng.yun@mediatek.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 3661B6D048093FC12761A842A0EF53BC43F4169167C5DF3D9BA71DE7D2A9FEBD2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_041837_376796_165F9361 
X-CRM114-Status: GOOD (  11.31  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Min Guo <min.guo@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, netdev@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-11-18 at 16:21 +0800, Chunfeng Yun wrote:
> Convert phy-mtk-ufs.txt to YAML schema mediatek,ufs-phy.yaml
> 
> Cc: Stanley Chu <stanley.chu@mediatek.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
