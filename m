Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD2A9CCA481
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jul 2022 05:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Us2UrJm+CrAchXldrlfTY1vJzYEZtEywPP3HPE+EGck=; b=n0HiTMdwcQ8waa2wjjbADaqujF
	kxNqpX2FuXvkgYVnPIfq+x9bZ3xx+NFDKDWFORzjc8zkePS48fafC8C+Ww22bKXGMdx8GUVAqap9v
	i3qpfePfLGHp3aFWqw7JwK8mrHEZdZYHWr4gfWYmfrIMJA4zQ6xZuCRdMFRSAI6LN3cFP8tq8KqKK
	XPSBivZVzAFVAfKK1dI+em0nEbRnDDnxpauoRbJaqe3e/CprRI+KjEnJ3jqCJS4G4gMlZRChkGSe+
	evNBhrhRHegSFtMLAzG8EeRr/cE3l4tXHT43v1rF0JTJKL6HfEqnOnG0KIPacY/OAhd5uQmIXf1o6
	XJ/GlNOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBrQw-00B4rg-MN; Thu, 14 Jul 2022 05:30:42 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBqNB-00Aa09-4N; Thu, 14 Jul 2022 04:22:46 +0000
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26E3mrT7014116;
	Thu, 14 Jul 2022 04:22:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2021-07-09;
 bh=Us2UrJm+CrAchXldrlfTY1vJzYEZtEywPP3HPE+EGck=;
 b=E/d/2hNl95kwCT5CNGmYE5uNhW+ZO5hz5mVsvdB+BSlhmh94b/dW5a6oPNr6JSG+8TWs
 VLP2eNM7rgDMCJn7nmqhehIWF1xuPwJMKQUI2KemUKXlm7qdIKk8VydJe8k8nSDSiji2
 RmhPAxCcf3EwXYsKvYufqi7hhDSIRJLLkXx6SEWCfb9HndhGz921KTp1e3aJMoPSsofC
 rmqnXTgzH6dFsQ4biBEtnJZCt0yVGaJR5f62qrB8OKs+X6KvxMxt5+Y0YLb8H+iLiimr
 JtP4LqDmQyUYIeHreCoLYWLooemMo3+ZIKittqQEW4AeLmuWIB+MrtapyeRHYHEmu1hP pQ== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h71scc27q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 Jul 2022 04:22:18 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 26E4Assk000991;
	Thu, 14 Jul 2022 04:22:17 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3h7045au2s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 Jul 2022 04:22:17 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 26E4MD5L024736;
	Thu, 14 Jul 2022 04:22:16 GMT
Received: from ca-mkp.mkp.ca.oracle.com (ca-mkp.ca.oracle.com [10.156.108.201])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3h7045au20-5;
	Thu, 14 Jul 2022 04:22:16 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: asutoshd@codeaurora.org, Matthias Brugger <matthias.bgg@gmail.com>,
        Po-Wen Kao <powen.kao@mediatek.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>, cc.chou@mediatek.com,
        alice.chao@mediatek.com, mason.zhang@mediatek.com,
        stanley.chu@mediatek.com, peter.wang@mediatek.com,
        jiajie.hao@mediatek.com, linux-mediatek@lists.infradead.org,
        chaotian.jing@mediatek.com, linux-arm-kernel@lists.infradead.org,
        linux-scsi@vger.kernel.org, wsd_upstream@mediatek.com,
        linux-kernel@vger.kernel.org, chun-hung.wu@mediatek.com
Subject: Re: [PATCH 1/1] scsi: ufs: fix missing clk change notification on host reset
Date: Thu, 14 Jul 2022 00:22:12 -0400
Message-Id: <165777180153.4401.9576790792487987073.b4-ty@oracle.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711144224.17916-2-powen.kao@mediatek.com>
References: <20220711144224.17916-1-powen.kao@mediatek.com> <20220711144224.17916-2-powen.kao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: U0wZjmrQuW-CRIib8J2KKEbveJx9i5pB
X-Proofpoint-ORIG-GUID: U0wZjmrQuW-CRIib8J2KKEbveJx9i5pB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_212245_315328_170B90BB 
X-CRM114-Status: GOOD (  13.84  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 11 Jul 2022 22:42:23 +0800, Po-Wen Kao wrote:

> In ufshcd_host_reset_and_restore(), ufshcd_set_clk_freq() is called
> to scale clk rate. However, this did not call vops->clk_scale_notify()
> to inform platform driver of clk change.
> 
> We propose to call on ufshcd_scale_clks() instead so that clk change
> can be properly handled.
> 
> [...]

Applied to 5.19/scsi-fixes, thanks!

[1/1] scsi: ufs: fix missing clk change notification on host reset
      https://git.kernel.org/mkp/scsi/c/52a518019ca1

-- 
Martin K. Petersen	Oracle Linux Engineering

