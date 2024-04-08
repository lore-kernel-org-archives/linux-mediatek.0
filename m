Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D010C67861
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Apr 2024 09:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HRb08lOvL/RkQcGPtpnIO47HiV3JbnaC5Kla4WlkdPg=; b=FkD7Pwm6lAvJT0+FV4TuZoOTb6
	ZLIMTDGlKpsCuOmQb9XmRz55cVD/974vZGEofIWXYAAogPzlYDnPqM1QGdDTb0TvRaa/iLIKoVq4L
	EvIxozH51tkacGaYpLcagvQ2tOmmc6PCTtORSlCnVSxOqOYSpgaoKpx3iWlhLfvUzWeiHL7xogPi9
	9g4p/eoHTKyGpEmjS9o4ILHnEP9hLfCHv6xNWvAjhoP2udOT1p3J+p5UTV6Y6xMLMsJXXuUrLVXUs
	ez39JkLShRc9dpglpM2keZkBSo+tP4kw2rdfSP9zULhHagKonoYoVTLXyMFrISyAjBpbimpHFXJNc
	pbpv44Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtlNj-0000000F70v-1ouf;
	Mon, 08 Apr 2024 09:33:39 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtlNY-0000000F6yY-148w;
	Mon, 08 Apr 2024 09:33:35 +0000
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 4389674X018763;
	Mon, 8 Apr 2024 09:33:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 mime-version; s=pp1; bh=HRb08lOvL/RkQcGPtpnIO47HiV3JbnaC5Kla4WlkdPg=;
 b=HAJzuBNsO2JwyXcSUPA5KKjMXoa85ATgDBDMdlUVrWrD4LTczUD9Nzq1exAuSBYIXiod
 e0MbeFjiTJ8BhZHNrUhGGDzWKY8EITc7XduqdLDZ5GctKya+kVyoKq/IkOu0SedUx2z5
 pQp8LeJGmQfs2CM+LTbmD/KJRvxg9VmuuBuJ1NKV4C1xxrojFpma6UqwA03Fy2zslw5J
 vQkdyyQm/5xiBkjpSpVWZG0r2JfzA51m5ovZNnFXMysbeE8Tuv+bGvb6/0yFAENxHcVu
 qAKQ1mFWZTC2QuNZ6UtiF13rTIvo2INwrArwDWHsJE6MYCmUQBSAMU8Fvb7Q48Tb74E1 6A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xcahageb0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Apr 2024 09:33:21 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4389WAD8027701;
	Mon, 8 Apr 2024 09:33:20 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xcahageav-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Apr 2024 09:33:20 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4388CHai022664;
	Mon, 8 Apr 2024 09:33:19 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xbhqnqanr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Apr 2024 09:33:19 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4389XFRb40632662
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Apr 2024 09:33:17 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E7ADC2004B;
	Mon,  8 Apr 2024 09:33:14 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 43F2D20040;
	Mon,  8 Apr 2024 09:33:11 +0000 (GMT)
Received: from osiris (unknown [9.171.19.167])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon,  8 Apr 2024 09:33:11 +0000 (GMT)
Date: Mon, 8 Apr 2024 11:33:09 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Allen Pais <apais@linux.microsoft.com>
Cc: linux-kernel@vger.kernel.org, tj@kernel.org, keescook@chromium.org,
        vkoul@kernel.org, marcan@marcan.st, sven@svenpeter.dev,
        florian.fainelli@broadcom.com, rjui@broadcom.com,
        sbranden@broadcom.com, paul@crapouillou.net,
        Eugeniy.Paltsev@synopsys.com, manivannan.sadhasivam@linaro.org,
        vireshk@kernel.org, Frank.Li@nxp.com, leoyang.li@nxp.com,
        zw@zh-kernel.org, wangzhou1@hisilicon.com, haijie1@huawei.com,
        shawnguo@kernel.org, s.hauer@pengutronix.de, sean.wang@mediatek.com,
        matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
        afaerber@suse.de, logang@deltatee.com, daniel@zonque.org,
        haojian.zhuang@gmail.com, robert.jarzmik@free.fr, andersson@kernel.org,
        konrad.dybcio@linaro.org, orsonzhai@gmail.com,
        baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com,
        patrice.chotard@foss.st.com, linus.walleij@linaro.org, wens@csie.org,
        jernej.skrabec@gmail.com, peter.ujfalusi@gmail.com, kys@microsoft.com,
        haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
        jassisinghbrar@gmail.com, mchehab@kernel.org,
        maintainers@bluecherrydvr.com, aubin.constans@microchip.com,
        ulf.hansson@linaro.org, manuel.lauss@gmail.com,
        mirq-linux@rere.qmqm.pl, jh80.chung@samsung.com, oakad@yahoo.com,
        hayashi.kunihiko@socionext.com, mhiramat@kernel.org,
        brucechang@via.com.tw, HaraldWelte@viatech.com, pierre@ossman.eu,
        duncan.sands@free.fr, stern@rowland.harvard.edu, oneukum@suse.com,
        openipmi-developer@lists.sourceforge.net, dmaengine@vger.kernel.org,
        asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
        linux-mediatek@lists.infradead.org, linux-actions@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        linux-hyperv@vger.kernel.org, linux-rdma@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-s390@vger.kernel.org, netdev@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 7/9] s390: Convert from tasklet to BH workqueue
Message-ID: <20240408093309.9447-A-hca@linux.ibm.com>
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-8-apais@linux.microsoft.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240327160314.9982-8-apais@linux.microsoft.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: iEx_GL3tt0mvzHnM4XY0RznJTIWn8Sle
X-Proofpoint-GUID: YubKogQl91W9lviSSqhJG7ZeEe8HfK38
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-08_07,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1011 phishscore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 adultscore=0 spamscore=0
 bulkscore=0 mlxlogscore=816 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2404010000 definitions=main-2404080073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_023329_424404_7161FDE9 
X-CRM114-Status: GOOD (  18.72  )
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

On Wed, Mar 27, 2024 at 04:03:12PM +0000, Allen Pais wrote:
> The only generic interface to execute asynchronously in the BH context is
> tasklet; however, it's marked deprecated and has some design flaws. To
> replace tasklets, BH workqueue support was recently added. A BH workqueue
> behaves similarly to regular workqueues except that the queued work items
> are executed in the BH context.
> 
> This patch converts drivers/infiniband/* from tasklet to BH workqueue.
> 
> Based on the work done by Tejun Heo <tj@kernel.org>
> Branch: https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-6.10

I guess this dependency is a hard requirement due to commit 134874e2eee9
("workqueue: Allow cancel_work_sync() and disable_work() from atomic contexts
on BH work items")?

> ---
>  drivers/s390/block/dasd.c              | 42 ++++++++++++------------
>  drivers/s390/block/dasd_int.h          | 10 +++---
>  drivers/s390/char/con3270.c            | 27 ++++++++--------
>  drivers/s390/crypto/ap_bus.c           | 24 +++++++-------
>  drivers/s390/crypto/ap_bus.h           |  2 +-
>  drivers/s390/crypto/zcrypt_msgtype50.c |  2 +-
>  drivers/s390/crypto/zcrypt_msgtype6.c  |  4 +--
>  drivers/s390/net/ctcm_fsms.c           |  4 +--
>  drivers/s390/net/ctcm_main.c           | 15 ++++-----
>  drivers/s390/net/ctcm_main.h           |  5 +--
>  drivers/s390/net/ctcm_mpc.c            | 12 +++----
>  drivers/s390/net/ctcm_mpc.h            |  7 ++--
>  drivers/s390/net/lcs.c                 | 26 +++++++--------
>  drivers/s390/net/lcs.h                 |  2 +-
>  drivers/s390/net/qeth_core_main.c      |  2 +-
>  drivers/s390/scsi/zfcp_qdio.c          | 45 +++++++++++++-------------
>  drivers/s390/scsi/zfcp_qdio.h          |  9 +++---
>  17 files changed, 117 insertions(+), 121 deletions(-)

I'm asking since this patch comes with multiple compile errors. Probably due
to lack of cross compiler tool chain on your side.

If the above wouldn't be a hard dependency I'd say we could take those parts
of your patch which are fine into the s390 tree for 6.10, fix the rest, and
schedule that as well for 6.10 via the s390 tree.

