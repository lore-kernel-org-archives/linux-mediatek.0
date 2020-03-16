Return-Path: <SRS0=xc+O=5B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3688DC0044D
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Mar 2020 08:55:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08EDB2071C
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Mar 2020 08:55:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h92haTk5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="okxbpSCf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08EDB2071C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DfN+xxb7v7aXjagtwYw5aOZUXOGRfNHjn+LXjDb/2h8=; b=h92haTk53G4sPU
	Xl2lZltQEl7HHG6gjO6mNt/AN5M4p65DCoRP38hn9x+x7dipTkTVm4mCROBmKbQhx2uOzH4BouuIZ
	5zkd89flbfpYa45+O6664391TW4myeAyjzpOPDQEt7Qkmkf8BUQmSrtyEWj+MVN0ucw84ldOdPyw8
	XSx4UtblfaPaUUMBGMNBmDjkyEFE7/hcZorKt3OwK06JS4ecjawVFRjJuNKenrrHeyhkS2esJ7je9
	LDW9cttXYiq8lUIzwHQH9CmoXORwv7S/AWAdO5jLJP1fxGAbEVuhJHHIGqnEAJuqc7IjUaE+L0k0N
	Vxax1zasTIR4ck4JjgBw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jDlWd-00031t-0s; Mon, 16 Mar 2020 08:55:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDlUo-0000Z2-P9; Mon, 16 Mar 2020 08:53:16 +0000
X-UUID: 39d43779d3c94b73971fa9ffda7b77a2-20200316
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=gp+miboBva3gmpY9AwDXQhfWdq6yO74UoFEFEIC5fwA=; 
 b=okxbpSCfQ77cDzQBfHEQOlcZkqRx0Ph7F0Bu2T/MTeqDP8ifLmPQSDUmsoja6J65D/qXKQdKlra4+HkdzCuHhExjog/JDDeKZXbq3VjW3pBCEqwhtG25lQXtNnkksmRCqeNZDz5kDlOq3x8EWRJgA+8tXo+DRiNruuqu/1LmBUU=;
X-UUID: 39d43779d3c94b73971fa9ffda7b77a2-20200316
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 890443897; Mon, 16 Mar 2020 00:53:07 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 16 Mar 2020 01:53:23 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 16 Mar 2020 16:50:49 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Mon, 16 Mar 2020 16:53:51 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.peter~sen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v6 0/7] scsi: ufs: some cleanups and make the delay for host
 enabling customizable
Date: Mon, 16 Mar 2020 16:52:56 +0800
Message-ID: <20200316085303.20350-1-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200316_015314_830896_C66F9BB5 
X-CRM114-Status: UNSURE (   6.03  )
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
Cc: Stanley Chu <stanley.chu@mediatek.com>, bvanassche@acm.org,
 andy.teng@mediatek.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, beanhuo@micron.com,
 linux-arm-kernel@lists.infradead.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

v5 -> v6
	- Drop patch #2 "scsi: ufs: remove init_prefetch_data in struct ufs_hba" in v5
	because Can Guo has similar cleanup earlier in patch "scsi: ufs: Do not rely on prefetched data"

v4 -> v5
	- Fix patch #7: Fix typo "initializatoin" in title

v3 -> v4
	- In patch #8, fix incorrect condition of customized delay for host enabling

v2 -> v3
	- Remove /arch/arm64/configs/defconfig chnage because it is for local test only

v1 -> v2
	- Add patch #1 "scsi: ufs: fix uninitialized tx_lanes in ufshcd_disable_tx_lcc"
	- Remove struct ufs_init_prefetch in patch #2 "scsi: ufs: remove init_prefetch_data in struct ufs_hba"
	- Introduce common delay function in patch #4
	- Replace all delay places by common delay function in ufs-mediatek in patch #5
	- Use common delay function instead for host enabling delay in patch #6
	- Add patch #7 "scsi: ufs: make HCE polling more compact to improve initializatoin latency"
	- In patch #8, customize the delay in ufs_mtk_hce_enable_notify callback instead of ufs_mtk_init (Avri)

Stanley Chu (7):
  scsi: ufs: fix uninitialized tx_lanes in ufshcd_disable_tx_lcc()
  scsi: ufs: use an enum for host capabilities
  scsi: ufs: introduce common delay function
  scsi: ufs-mediatek: replace all delay places by common delay function
  scsi: ufs: allow customized delay for host enabling
  scsi: ufs: make HCE polling more compact to improve initialization
    latency
  scsi: ufs-mediatek: customize the delay for host enabling

 drivers/scsi/ufs/ufs-mediatek.c | 64 +++++++++++++++++++------------
 drivers/scsi/ufs/ufs-mediatek.h |  1 +
 drivers/scsi/ufs/ufshcd.c       | 32 ++++++++++------
 drivers/scsi/ufs/ufshcd.h       | 67 +++++++++++++++++++--------------
 4 files changed, 100 insertions(+), 64 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
