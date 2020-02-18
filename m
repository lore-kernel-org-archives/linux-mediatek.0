Return-Path: <SRS0=iFQR=4G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9F67C34031
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Feb 2020 07:03:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C79820836
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Feb 2020 07:03:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NuCo0J0Q";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="hGs1vrG8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C79820836
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WgAnMdvb2GcuGQiENn/VooOt/b9tmhxM0gXTlqugBew=; b=NuCo0J0Q9mlmbT
	BRQU8pFw7eJvgluOT5o56RODMuIo6AwNNzJAAdIrDQ1wq7WnBpaDJpA7HYOxz3anMtNK6puKT1Rh0
	ibhePKtEUbMTwa4b9D+fkQ+bVFSKPZwrWr5LTTYoHK1g2qnH20TaCCDbtVOTAIR8R4U7w9iJP7rnQ
	Q1GRde/GrRfIE3wbSSAf8nA3Aa6yRmnvPCDojKfOBD/qr88UhhCWNxSlrXNY1MXboO+HykH9zd5s7
	et9nlDcrWdPtu/12xPIc8xHce3hj3tYnz5pr8qnP6U70C609ovt7NxP95Xf379rGYo8WAALT3GMsW
	klWPCp3QhFcooKpDUhpA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3wuF-0000th-Mo; Tue, 18 Feb 2020 07:02:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3wu6-0000lB-WF; Tue, 18 Feb 2020 07:02:48 +0000
X-UUID: 81e7c4f1824642d6b337fce76713c2d1-20200217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=SfQLOOesViht8zuhVZth6gVEBbimYGDRoLRh1mE3SdQ=; 
 b=hGs1vrG84S+Pz2nTgA2P2nTRze0MIZaTGrFJUASFtwVira+GpWynxZrNlUhlyzdyX37T1sNlrykeNd83BAhFNIDWiBaoMaA4M91p+CZ402Oj3EKvMgJoLfqxKtKJVhpoNA6lWhW7M6QYf1SzhCOovGtJjlL4XfbgyytIJ7ssWVY=;
X-UUID: 81e7c4f1824642d6b337fce76713c2d1-20200217
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1241533735; Mon, 17 Feb 2020 23:02:43 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 17 Feb 2020 23:02:40 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 18 Feb 2020 15:00:11 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 18 Feb 2020 15:02:11 +0800
Message-ID: <1582009359.26304.29.camel@mtksdccf07>
Subject: Re: [PATCH v3 1/2] scsi: ufs: pass device information to
 apply_dev_quirks
From: Stanley Chu <stanley.chu@mediatek.com>
To: Can Guo <cang@codeaurora.org>
Date: Tue, 18 Feb 2020 15:02:39 +0800
In-Reply-To: <2a8fc44914b7ed8777a4a99ba6b8647a@codeaurora.org>
References: <1578726707-6596-1-git-send-email-stanley.chu@mediatek.com>
 <1578726707-6596-2-git-send-email-stanley.chu@mediatek.com>
 <2a8fc44914b7ed8777a4a99ba6b8647a@codeaurora.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 73E60B1B862E9A9A7A34435771FBADD9483B4202554A334657B8DC4403A419B82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200217_230247_047711_C5281745 
X-CRM114-Status: GOOD (  11.95  )
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
Cc: linux-scsi@vger.kernel.org, martin.petersen@oracle.com,
 andy.teng@mediatek.com, jejb@linux.ibm.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org, avri.altman@wdc.com,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 alim.akhtar@samsung.com, matthias.bgg@gmail.com, asutoshd@codeaurora.org,
 bvanassche@acm.org, linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Can,


> Hi Stanley,
> 
> Is this series merged? If no, would you mind moving
> ufshcd_vops_apply_dev_quirks(hba, card); a little bit? Like below.
> 
> @@ -6852,14 +6852,14 @@ static void ufshcd_tune_unipro_params(struct 
> ufs_hba *hba)
>                  ufshcd_tune_pa_hibern8time(hba);
>          }
> 
> +       ufshcd_vops_apply_dev_quirks(hba, card);
> +
>          if (hba->dev_quirks & UFS_DEVICE_QUIRK_PA_TACTIVATE)
>                  /* set 1ms timeout for PA_TACTIVATE */
>                  ufshcd_dme_set(hba, UIC_ARG_MIB(PA_TACTIVATE), 10);
> 
> In this way, vendor codes have a chance to modify the dev_quirks
> before ufshcd_tune_unipro_params() does the rest of its job.
> 

This patch has been merged to 5.6-rc1.

Basically I am fine with your proposal. But if you need to move it to
new mentioned position, our apply_dev_quirks callback also need
corresponding change so it might need our co-works : )

For example, you could just post your proposed changes and then we would
provide corresponding change as soon as possible?

Besides, I would like to remind that allowing vendor to "fix" device
quirks in advance imply that current common device quirks have some
problems? If so, would you consider to fix common device quirks instead?


> Thanks,
> Can Guo.

Thanks,
Stanley Chu


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
