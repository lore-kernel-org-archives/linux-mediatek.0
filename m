Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E3D0C48260
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Feb 2024 02:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zDHvNKH6z8IMSD7KKDrzVdYMtSlJj+y0Dfbg3H1Ui5w=; b=sQmUH7OPKL+qcTr557wXhzGHOn
	yuN9DiAUwl/YjDcSWNVQvby9fwL8ErJ1XVu4apgArBUMiuRYionQxfYoAW3czTtp2uvHQYCBUKGzz
	cbEIGqhy1DiZCakBcYK1eq/ObUH9FlA07tJ1BzQyoxOFvFKwDEbhf8grXLxn1vikbEE8pLqNNzcyC
	rzG3CfzwwycN5QEnFIxZrlJDmmlX5M5Nlm0lkopsx0mpQytFIHF7FOnBuS+LX7AsiOSTODHOcHzBI
	P6eW+1MRZSOvbvbPOkBjhpWb2mGnCI/9hIhMMEJELVnqC1+ZdaNImcdqvr7z+Q42dzavuBDBXvYHi
	qVQ9uU0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXAtk-00000005lK1-1T9h;
	Tue, 06 Feb 2024 02:09:20 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXAti-00000005lIb-02GW;
	Tue, 06 Feb 2024 02:09:19 +0000
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 4161EQcu002420;
	Tue, 6 Feb 2024 02:09:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2023-11-20;
 bh=zDHvNKH6z8IMSD7KKDrzVdYMtSlJj+y0Dfbg3H1Ui5w=;
 b=d3QE4/02LAU9sFFyfRpfnIeSn2Z4jCU+SEW5sVGoMaS2S14c2BV1WXQMFpOIALTGCVTk
 oq/vfqxeRi+cPMBc7VErTcRtrXyBhO6bDr9XhZwedQw7Hmy7/qQ962WoPogQtmLX4LZQ
 NxTK9McCAqnX6q/R6xDa7jyiTObPzlGMipjryhwQQAKz3xVfEzgTuVw5jQ0ebsUjCeUh
 xQPJjcV67tqn8ysj7FYuigHbyvilj50ilMZ6r2HLXnPuYm/sp+HwbrDus9qumxhE8YRd
 DM8G5HxYpPjCLI6bbMIu08qGYjDvcRflpPUXHSF8MAGQVZCJJ7ckIwxOiioA3TRCXdBX lw== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3w1cdcwkm5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 06 Feb 2024 02:09:08 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 4160rGUc039547;
	Tue, 6 Feb 2024 02:09:08 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3w1bx6cefx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 06 Feb 2024 02:09:08 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 416297CI038970;
	Tue, 6 Feb 2024 02:09:07 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 3w1bx6cef6-1;
	Tue, 06 Feb 2024 02:09:07 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        alice.chao@mediatek.com
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        wsd_upstream@mediatek.com, stanley.chu@mediatek.com,
        peter.wang@mediatek.com, powen.kao@mediatek.com,
        naomi.chu@mediatek.com, cc.chou@mediatek.com, tun-yu.yu@mediatek.com,
        chun-hung.wu@mediatek.com, casper.li@mediatek.com,
        linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v1 1/1] ufs: core: fix shift issue in ufshcd_clear_cmd
Date: Mon,  5 Feb 2024 21:08:55 -0500
Message-ID: <170718504180.1101069.12960133692209922791.b4-ty@oracle.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20240205104905.24929-1-alice.chao@mediatek.com>
References: <20240205104905.24929-1-alice.chao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-05_18,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 bulkscore=0 phishscore=0
 spamscore=0 adultscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2402060014
X-Proofpoint-GUID: glV5wqreaqgNxcm7upHbcuFGcUYdzy6r
X-Proofpoint-ORIG-GUID: glV5wqreaqgNxcm7upHbcuFGcUYdzy6r
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_180918_076171_80C0E9D7 
X-CRM114-Status: GOOD (  14.33  )
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

On Mon, 05 Feb 2024 18:49:04 +0800, alice.chao@mediatek.com wrote:

> When task_tag > 32 (in mcq mode), 1U << task_tag will out of bound
> for u32 mask. Fix this bug to prevent SHIFT_ISSUE (Bitwise shifts
> that are out of bounds for their data type).
> 
> [name:debug_monitors&]Unexpected kernel BRK exception at EL1
> [name:traps&]Internal error: BRK handler: 00000000f2005514 [#1] PREEMPT SMP
> [name:mediatek_cpufreq_hw&]cpufreq stop DVFS log done
> [name:mrdump&]Kernel Offset: 0x1ba5800000 from 0xffffffc008000000
> [name:mrdump&]PHYS_OFFSET: 0x80000000
> [name:mrdump&]pstate: 22400005 (nzCv daif +PAN -UAO)
> [name:mrdump&]pc : [0xffffffdbaf52bb2c] ufshcd_clear_cmd+0x280/0x288
> [name:mrdump&]lr : [0xffffffdbaf52a774] ufshcd_wait_for_dev_cmd+0x3e4/0x82c
> [name:mrdump&]sp : ffffffc0081471b0
> <snip>
> Workqueue: ufs_eh_wq_0 ufshcd_err_handler
> Call trace:
>  dump_backtrace+0xf8/0x144
>  show_stack+0x18/0x24
>  dump_stack_lvl+0x78/0x9c
>  dump_stack+0x18/0x44
>  mrdump_common_die+0x254/0x480 [mrdump]
>  ipanic_die+0x20/0x30 [mrdump]
>  notify_die+0x15c/0x204
>  die+0x10c/0x5f8
>  arm64_notify_die+0x74/0x13c
>  do_debug_exception+0x164/0x26c
>  el1_dbg+0x64/0x80
>  el1h_64_sync_handler+0x3c/0x90
>  el1h_64_sync+0x68/0x6c
>  ufshcd_clear_cmd+0x280/0x288
>  ufshcd_wait_for_dev_cmd+0x3e4/0x82c
>  ufshcd_exec_dev_cmd+0x5bc/0x9ac
>  ufshcd_verify_dev_init+0x84/0x1c8
>  ufshcd_probe_hba+0x724/0x1ce0
>  ufshcd_host_reset_and_restore+0x260/0x574
>  ufshcd_reset_and_restore+0x138/0xbd0
>  ufshcd_err_handler+0x1218/0x2f28
>  process_one_work+0x5fc/0x1140
>  worker_thread+0x7d8/0xe20
>  kthread+0x25c/0x468
>  ret_from_fork+0x10/0x20
> 
> [...]

Applied to 6.8/scsi-fixes, thanks!

[1/1] ufs: core: fix shift issue in ufshcd_clear_cmd
      https://git.kernel.org/mkp/scsi/c/b513d30d59bb

-- 
Martin K. Petersen	Oracle Linux Engineering

