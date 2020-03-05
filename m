Return-Path: <SRS0=EkB4=4W=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03B41C3F2CD
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Mar 2020 04:07:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CED2C208C3
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Mar 2020 04:07:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B4GD03HR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="VdMFZZKY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CED2C208C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gjDIuzZFiAl7bGlMzaT+16JIPC0d1LeDHAOzvH3b/sw=; b=B4GD03HRZnCPoE
	ENJw7RklxZqbgCre/WokAD5ErKmJey0kACiuol4cy5wBHbJ7Q/brzX3vDk5HD+Ztm16hddkdzJ0bQ
	I5Wvgub5WtIF5kmL2ssfoVpZMWTH5KAjuAsfgUNcMA5HxbXIINGz05X5QPo4PZtYzeyUVc6H0goBa
	Leev+7zgV0+0V5kc9O832xTYfRC7C0Hv49gpOxl2B8qCs25BHaMsJLyx78vYy0GilCFS4u3T0dPYv
	8lqH22BPc05lBjbHCxRcwDB9YBsxLpzlzdKagod9DuBCP/JupYD8drnjTQt1Enz/I1NYMuQUz4Cl4
	4BQeujaUXAHuMGYlmhzQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9hnT-0002oQ-Gf; Thu, 05 Mar 2020 04:07:43 +0000
Received: from [216.200.240.184] (helo=mailgw01.mediatek.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9hn4-0002Ke-43; Thu, 05 Mar 2020 04:07:19 +0000
X-UUID: dd8c419858984a17811b5601f76128e7-20200304
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=uT3b+HVjGTui2Fg/xFBgMfnNPkFCcTSrdu3yNux9XCE=; 
 b=VdMFZZKYWKpD6uRDAoui/V6wxNaE4o694Vjkv7ZR/mgYhfOWqAY9TsALjAOAxvx89Cgn6jsXPvO/pzmWAggj0o/EZ3Fs3aG3Tnm3YQ+/jRQcJ3DISVX3FvD/Me4fNrUrxVq3gBHuXFdp0STAxVbOH/oEmQ3F8d5ThMhlNsQVGZU=;
X-UUID: dd8c419858984a17811b5601f76128e7-20200304
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 560286909; Wed, 04 Mar 2020 20:07:08 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 4 Mar 2020 20:07:25 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 5 Mar 2020 12:05:03 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Thu, 5 Mar 2020 12:06:20 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v1 0/4] scsi: ufs: some cleanups and make the delay for host
 enabling customizable
Date: Thu, 5 Mar 2020 12:07:00 +0800
Message-ID: <20200305040704.10645-1-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200304_200718_168783_B86DCE78 
X-CRM114-Status: UNSURE (   5.60  )
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

Hi,

This patchset do some cleanups in ufs host driver and make the delay for host enabling customizable
by different controller or vendors.

Stanley Chu (4):
  scsi: ufs: remove init_prefetch_data in struct ufs_hba
  scsi: ufs: use an enum for host capabilities
  scsi: ufs: allow customized delay for host enabling
  scsi: ufs-mediatek: remove delay for host enabling

 drivers/scsi/ufs/ufs-mediatek.c |  2 +
 drivers/scsi/ufs/ufshcd.c       | 21 +++++-----
 drivers/scsi/ufs/ufshcd.h       | 68 ++++++++++++++++++---------------
 3 files changed, 51 insertions(+), 40 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
