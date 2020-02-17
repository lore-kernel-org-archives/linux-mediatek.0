Return-Path: <SRS0=sDSL=4F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47061C7619B
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Feb 2020 08:30:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 197F620725
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Feb 2020 08:30:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J2lVMEpt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="GxMEtP+y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 197F620725
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7+4uJmyTfsLbYDorE59ToxVlOgSkUGjwsF2oM0cDFAM=; b=J2lVMEpt5j9TLz
	r8T9+bERuKDTnrXtrwpDAkMDbz8BQqnOKrbIj7tu/bf0JptLe2+Dq/MePGj+mfcNubFyDQuYvdQ5H
	FGNruMI+JV7wvKC4p5ARpeGJBqbGzJx+eGx1lRX0kyMZ26/yRrd3o+UDg1zbHIh5aZ74Yev+FQrNT
	Y1heNYvtSzUGGIQQesB3G8LzIyr1nSbwy0tEAMXQXsNVf7NxyQiKM7xgmTBXPfHvLIa3GQAgOQxS2
	LNE0rnQTNnagDPOCCNxOQalymexam61LKWirXAojTffSl++AGEkFu9OZSmEkp6RTeWfW1OmGVDs4r
	9un0uA1QzgpGC1NmW2kg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3bn7-0004OD-VY; Mon, 17 Feb 2020 08:30:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3bms-0003WL-BB; Mon, 17 Feb 2020 08:29:55 +0000
X-UUID: f6679d66f7f54e0080b5535626aa3106-20200217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From;
 bh=CNjl2hI20d68vxiX1u56Xsi7CnowTCfuliL82LhhtjI=; 
 b=GxMEtP+yMSdYfaEG+zQl7drojz7GwZx6v5XDzZta5sC2zPXw0IXexSNaBSRXusjMZ7EtspKGhyT6fo39F9a/H7LqFGif3XXJdtS/VIapnAhbLM8B4Leq4hfeptFuIVuA8Wyt25RNiq+hciLOP02XjIxjYwm2AfXJq9lTbJczNUM=;
X-UUID: f6679d66f7f54e0080b5535626aa3106-20200217
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.liang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1758047724; Mon, 17 Feb 2020 00:29:50 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 17 Feb 2020 00:19:47 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 17 Feb 2020 16:18:14 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 17 Feb 2020 16:19:20 +0800
From: Yong Liang <yong.liang@mediatek.com>
To: <yong.liang@mediatek.com>, <robh+dt@kernel.org>, <mark.rutland@arm.com>,
 <matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/1] Add watchdog device node
Date: Mon, 17 Feb 2020 16:19:21 +0800
Message-ID: <20200217081922.22544-1-yong.liang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <Add watchdog device node>
References: <Add watchdog device node>
MIME-Version: 1.0
X-TM-SNTS-SMTP: AA4A247E4141285BF863CB3E3630B1908C7C738F9C63F62CDE6CC0D77BA2CC8E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200217_002954_389844_8D6FC1CF 
X-CRM114-Status: UNSURE (   3.80  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "yong.liang" <yong.liang@mediatek.com>

Add watchdog device node

yong.liang (1):
  amr64: dts: modify mt8183.dtsi

 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
