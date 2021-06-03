Return-Path: <SRS0=bWHh=K5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7F89C4708F
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Jun 2021 02:57:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B45CF613E9
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Jun 2021 02:57:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B45CF613E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=afZq4nShvmOMGCWaY4Bq4C0q3rBNUE2z2fa/3iIyv40=; b=CN5Dqk1wnFOFda
	PZzZc+184UWTwjqb5LGN/mhXHFtMG43bdrTXFpCepGsfdco5uuHE7NjA+dkDVe+Z8O5dSQjTr4Aui
	uXZyIOTTWi/fsvQqq3BxBuA45xcgfBxDv+AZJ9pCqkzdLd3Zn9IwdZlzUDFNWQV5Umwd2naRkJL6d
	uJdCwmMguoSR2DWOMXBpm0sQza53//hhQlpIl0R/bkesucXkGfZAcov3cNUTj3jovpCY+3n6iRfBK
	pAQhVi8nz+gi8cV/Pxv/hgY8h5yt/daU+ZyYjGapODOZRT3tt6q22z7ceclk84/VTs4+bb3JlbsZZ
	1DRQAY1ff8LShaRBdlMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lodVQ-006sOv-Ik; Thu, 03 Jun 2021 02:54:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lodVC-006sMb-6P; Thu, 03 Jun 2021 02:54:37 +0000
X-UUID: 518483a811dc48adb8c38a97ea584bcc-20210602
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=T1f3ciz9FJ4+c/XRklk7ljIC8zMrcEktrNSPUm0vuD8=; 
 b=gji5lqHJQxCHQymnuUdthL2OQIgIzGhN1XARFFVEb65H4z//E85HgeEkhBcGwRvtADF163b4sJH7KDGdXEmNn7xVcWc88lHNcpO51jPAbTWjnxwtcn/GM21pm4GNX/py4s8axcdKFTq6x/ROQc4UWQaJm6tgBLSEiFqMWHGmSt8=;
X-UUID: 518483a811dc48adb8c38a97ea584bcc-20210602
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 860040028; Wed, 02 Jun 2021 19:54:28 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Jun 2021 19:54:26 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Jun 2021 10:54:25 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 3 Jun 2021 10:54:25 +0800
Message-ID: <1622688865.7096.6.camel@mtkswgap22>
Subject: Re: [PATCH v1 2/3] scsi: ufs: Optimize host lock on transfer
 requests send/compl paths
From: Stanley Chu <stanley.chu@mediatek.com>
To: Can Guo <cang@codeaurora.org>
CC: <asutoshd@codeaurora.org>, <nguyenb@codeaurora.org>,
 <hongwus@codeaurora.org>, <linux-scsi@vger.kernel.org>,
 <kernel-team@android.com>, Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman
 <avri.altman@wdc.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin
 K. Petersen" <martin.petersen@oracle.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Bean Huo <beanhuo@micron.com>, Jaegeuk Kim
 <jaegeuk@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, Kiwoong Kim
 <kwmad.kim@samsung.com>, Satya Tangirala <satyat@google.com>, open list
 <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
Date: Thu, 3 Jun 2021 10:54:25 +0800
In-Reply-To: <1621845419-14194-3-git-send-email-cang@codeaurora.org>
References: <1621845419-14194-1-git-send-email-cang@codeaurora.org>
 <1621845419-14194-3-git-send-email-cang@codeaurora.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_195434_265163_2B4EC311 
X-CRM114-Status: GOOD (  10.91  )
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

Hi Can,

On Mon, 2021-05-24 at 01:36 -0700, Can Guo wrote:
> Current UFS IRQ handler is completely wrapped by host lock, and because
> ufshcd_send_command() is also protected by host lock, when IRQ handler
> fires, not only the CPU running the IRQ handler cannot send new requests,
> the rest CPUs can neither. Move the host lock wrapping the IRQ handler into
> specific branches, i.e., ufshcd_uic_cmd_compl(), ufshcd_check_errors(),
> ufshcd_tmc_handler() and ufshcd_transfer_req_compl(). Meanwhile, to further
> reduce occpuation of host lock in ufshcd_transfer_req_compl(), host lock is
> no longer required to call __ufshcd_transfer_req_compl(). As per test, the
> optimization can bring considerable gain to random read/write performance.
> 
> Cc: Stanley Chu <stanley.chu@mediatek.com>
> Co-developed-by: Asutosh Das <asutoshd@codeaurora.org>
> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
> Signed-off-by: Can Guo <cang@codeaurora.org>

According to my test, the performance indeed has impressive improvement
with this series!

Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>




>  #endif
>  
>  	bool req_abort_skip;
> -	bool in_use;
>  };
>  
>  /**

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
