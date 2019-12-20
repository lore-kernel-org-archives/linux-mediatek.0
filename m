Return-Path: <SRS0=AkNb=2K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C24EC43603
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Dec 2019 01:25:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F961227BF
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Dec 2019 01:25:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hI8rPSms";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="qcUct+bD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F961227BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0gemKS0voFCb7qKi+hjELA4XpJo5RRjj2tjRm3DmPYw=; b=hI8rPSmsZYOR8p
	02tyI/n6JwZYCKSiE1HqU/Q/Z7yD1kRIXVJTHDUo3SUzSx/fnfWV9bvMCzKKKTg42QouyBiKwzTLQ
	ri2TQ9HjUfhrDS8o53UMln3+mxqDMtHBLiw9lAglWZ7DfhNuSy+zVXVwO3MKpcs9OpBscp2FEXpHe
	bn6hffJ4H8Ml86i8c9gbt4w+YFlKSH8+leaN7QFlx5RBY8eo/lj6rAM63bF/NiCwAHsg45Y3sFV+E
	KW0+g1jtssgjETQRGESeJzopoj35Hd99Nj2JpshyFoFU1E2qLYG3O8+JpOM3rBFVcpC02SaSTHUqf
	/oAr/jno2ZTfdcbCUmyQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ii72s-0008Pk-3J; Fri, 20 Dec 2019 01:25:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ii72p-0008P7-8q; Fri, 20 Dec 2019 01:25:32 +0000
X-UUID: 1a6aff08d9a14986ac75e4c846c0eeae-20191219
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=6G3dtw5AJylg2abavZ7E0QIWsi21fn4ZfWIqnuXqxBM=; 
 b=qcUct+bDYeVS1aaDJcL6m6qACEsT2L7zyOsMEz+hx9bn+mGHjFgZjnrGiFi7NNGRjSrAKdyGvyjkqcpLH/rd3n21mHWONU5YYQz4x2mzccQGJEEIk8pms+mCMtX2CFpwRZRf8Pc6dqujWB3Mr7Kha3JUXOGmv+F2mRzBI+EQ2V8=;
X-UUID: 1a6aff08d9a14986ac75e4c846c0eeae-20191219
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 490268563; Thu, 19 Dec 2019 17:25:29 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 19 Dec 2019 17:25:47 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 20 Dec 2019 09:24:45 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 20 Dec 2019 09:25:18 +0800
Message-ID: <1576805118.13056.31.camel@mtkswgap22>
Subject: Re: [PATCH v1 0/4] scsi: ufs-mediatek: provide power management
From: Stanley Chu <stanley.chu@mediatek.com>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Fri, 20 Dec 2019 09:25:18 +0800
In-Reply-To: <yq1tv5vc3ci.fsf@oracle.com>
References: <1576224695-22657-1-git-send-email-stanley.chu@mediatek.com>
 <yq1tv5vc3ci.fsf@oracle.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: A67BF4AF579820BA1BD2EC944F6F15F073CC96FDD18A0D00DFAB356298EA55922000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191219_172531_321504_3E40926C 
X-CRM114-Status: UNSURE (   9.67  )
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
Cc: linux-scsi@vger.kernel.org, andy.teng@mediatek.com, jejb@linux.ibm.com,
 chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, avri.altman@wdc.com,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 alim.akhtar@samsung.com, matthias.bgg@gmail.com, pedrom.sousa@synopsys.com,
 linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Martin,

Thank you so much and sorry for your inconvenience.

I was based on the latest linux-next commit in my submission time. I
will be more careful and use your "queue" branch instead for submission.

BTW, sorry again because this series actually require a header file
present by below patch in another series which was submitted earlier
than this series,

"soc: mediatek: add header for SiP service interface"

Otherwise missing header "include/linux/soc/mediatek/mtk_sip_svc.h" will
cause build error if MediaTek UFS driver is enabled.

Hope "soc: mediatek: add header for SiP service interface" could be
merged soon, or please rollback this series first if build error happens
and wait until above patch is merged.

To prevent this error, I shall merge both series and provide a new
combined series. If you want me to do so, please kindly let me know.
Sorry for this again.

On Thu, 2019-12-19 at 18:17 -0500, Martin K. Petersen wrote:
> Stanley,
> 
> > The patch set provides power management on MediaTek Chipsets by
> 
> Had to apply this by hand. Please make sure you prepare patch
> submissions against my "queue" branch.
> 

Thanks,
Stanley


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
