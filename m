Return-Path: <SRS0=imyo=KB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4210C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 May 2021 06:41:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 792FB613F6
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 May 2021 06:41:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 792FB613F6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+m0B0G+/AEAI7uFmEu2KuxEnoZMZYqrZNQmqHb//R1M=; b=DYTHzGs0xwNJuUVCuPNqRI2W2
	fbUvh6DL8y+sERxmLCN1Wi3XuOle3Xi/9z8O+3FLJQBUY1IUskkKtvdWM2wn9PyUFFMk9YU0NK0FI
	ayBK4gDfPAe6Z7t9E/u2ANyFuDbzUUlbyJ4QrCH7KCh9SdfnEJoqvKJANKBaMr4wTyXp/cW7cRGuJ
	T1MB1H9O8lXJn1cb89alhgZkhTQPJ+w4uveciZicEl1KPSi0FhQHu+naJAkwk3Yhxjh3Fm3sIg1h6
	RgKxHKTc/BoQtqG0f2LoLLjg9vFsz2jlBwQYtWCwYt3YJ55cxJHls00jzp/8vJ1qrFNK6ijZWxZO5
	llX1wi+BQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leXgx-003NeB-FA; Thu, 06 May 2021 06:40:59 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leXgt-003NdB-5k; Thu, 06 May 2021 06:40:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=raXcjZ3WzvPOm6XVb1ur/e0/EIhGyxl0cImjeLyeEZk=; b=2hYbgAnlNTlqLA5Ub69/VowLh8
 HnfcI2dxFqMRHyDX/79gUFGF1i84LdnsflIZJS+MSsFe0EnZYA4ruRL1CTHPcAw/Ad8CNgio0LdjP
 IksR1nv9CfS51ZLpPhMfqzSZ/CkxMRa2pTxIXO5bXFT+b+srn54GljUHv4RFLwMiDY4Csv++Rr+wV
 v4VDgXDHVufHXvNFy3lNL8EirBdm6wraq/O+899w0UTflD5NgD0ICBq+tR8Swk5aI3zT4FgV318iH
 LaCCo6kiB1O07TYVGP/7l2xf1YjD9atCatWsarIou7A5dhu9KcEW7j1HHqJ60Qbq0EYsUZpNAvVID
 gxYN447Q==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leXgq-005dqb-C4; Thu, 06 May 2021 06:40:53 +0000
X-UUID: 07a129debbef401cb280024d654e88d5-20210505
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=raXcjZ3WzvPOm6XVb1ur/e0/EIhGyxl0cImjeLyeEZk=; 
 b=KKz387QZTG3TFi9A961K0HqXdZoJsbhc2+VzbbAtZBFSZ+sDyDenh+EauSbUB0QNMMPIkl9N3Ka0W2VzFUVinZBXXdMJpHqvzc/BgT8LbaCw5zlx3KKYRMXDdPP9D+ZZ3OCzMi7mfgArqOgFs5fY+gHBwQeopk1DH2/JcLmLqFc=;
X-UUID: 07a129debbef401cb280024d654e88d5-20210505
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 241223364; Wed, 05 May 2021 23:40:49 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 5 May 2021 23:31:19 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 May 2021 14:31:18 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 6 May 2021 14:31:18 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mathias Nyman <mathias.nyman@intel.com>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Ikjoon
 Jang" <ikjn@chromium.org>, Eddie Hung <eddie.hung@mediatek.com>
Subject: [PATCH v2 3/3] usb: xhci-mtk: use first-fit for LS/FS
Date: Thu, 6 May 2021 14:31:16 +0800
Message-ID: <20210506063116.41757-3-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210506063116.41757-1-chunfeng.yun@mediatek.com>
References: <20210506063116.41757-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_234052_434839_901A3F75 
X-CRM114-Status: GOOD (  10.58  )
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

Use first-fit instead of best-fit for LS/FS devices under TT,
we found that best-fit will consume more bandwidth for some
cases.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: no changes
---
 drivers/usb/host/xhci-mtk-sch.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
index 9fb75085e40f..c07411d9b16f 100644
--- a/drivers/usb/host/xhci-mtk-sch.c
+++ b/drivers/usb/host/xhci-mtk-sch.c
@@ -634,6 +634,11 @@ static int check_sch_bw(struct mu3h_sch_bw_info *sch_bw,
 			min_bw = worst_bw;
 			min_index = offset;
 		}
+
+		/* use first-fit for LS/FS */
+		if (sch_ep->sch_tt && min_index >= 0)
+			break;
+
 		if (min_bw == 0)
 			break;
 	}
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
