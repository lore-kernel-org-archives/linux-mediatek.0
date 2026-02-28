Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E5E3FD0040
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Feb 2026 22:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ns0lXggDC2aX4UrHTXUvjJ7IDX6kAfcdiSwFXxMJNIs=; b=YKvQmWu5DXWGnH/h9aGU71wzED
	YipK8sOqgJK1Ccnh5JRrRxTiCpqur73djS/xInIl842mtfm8lUSBGwEJxu0vC8npwtr0Jd+8eqHAR
	LzTxTrrtcVBaRMh6YFlbmxdLqVvmRXhmvjYxnw6g1hQ42F77qcFWmpFqJzz+845sBI6e+Q7XQG548
	i1Iuf2zKolek3RseCcwHehVAl3MhqkzKMKuhdW8AwcAeLgZnyd0arsQJz0W0a5jcy+2wXjQkgw3zi
	SWbPRpJfsTDthiMSV1QXuyP2BZch8oKCCxgEZPsxDVH2JEivFGh0tS7pJo8pcRiAZ4x5RyKJUGhyx
	MWoVsAEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwShg-0000000AKbA-1EdG;
	Sat, 28 Feb 2026 22:22:28 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwShc-0000000AKa6-143h
	for linux-mediatek@lists.infradead.org;
	Sat, 28 Feb 2026 22:22:26 +0000
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61SKx9Vl2599266;
	Sat, 28 Feb 2026 22:22:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=Ns0lXggDC2aX4UrHTXUvjJ7IDX6kAfcdiSwFXxMJNIs=; b=
	T5lPbJnk2o3wS+4nQn5TEnXeJMSeH3rH66rTLT02k6MyEsFbwdiQBAfTEqVEgv4G
	nb9S59knMFjR3i9MdAKHMdA8g1viH/CAUyrXDaoEYKcykzRx75/R9MgOqUZFz9N6
	4mU4h9yxMd7MspyUV4BO30KyzG0FJXrG/heskEPKiVNgVPijajz/EXQZ6rqBZd2D
	MTdHdxNZxZ7YJlbgbv2Y1wi/cWQWgjq5y5sABZOkz9z7cXnHkc3IPAyWme6QoaQR
	4+QlMCzsQ06gbLAfg3Us2fjG2vq9XLpE/VaZUNy4KyDm/r7wXjc1VocD69NlrKH5
	bgOFp5s3cL4h++XH+9ASug==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4ckshmgk78-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 28 Feb 2026 22:22:17 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61SL0gRB036929;
	Sat, 28 Feb 2026 22:22:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4ckpt7bhdt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 28 Feb 2026 22:22:16 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 61SMHlvZ018394;
	Sat, 28 Feb 2026 22:22:15 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4ckpt7bhc9-4;
	Sat, 28 Feb 2026 22:22:15 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: linux-scsi@vger.kernel.org, avri.altman@sandisk.com,
        alim.akhtar@samsung.com, jejb@linux.ibm.com, peter.wang@mediatek.com
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
        chun-hung.wu@mediatek.com, alice.chao@mediatek.com,
        cc.chou@mediatek.com, chaotian.jing@mediatek.com,
        tun-yu.yu@mediatek.com, eddie.huang@mediatek.com,
        naomi.chu@mediatek.com, ed.tsai@mediatek.com, bvanassche@acm.org
Subject: Re: [PATCH v2 0/2] add debug log for command timeout
Date: Sat, 28 Feb 2026 17:22:04 -0500
Message-ID: <177231727973.1778274.12344057374101536805.b4-ty@oracle.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210070837.1820710-1-peter.wang@mediatek.com>
References: <20260210070837.1820710-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_07,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 suspectscore=0
 spamscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2602280208
X-Proofpoint-ORIG-GUID: CrlQ1SF_jI4AVdsC__TEvnQX6WGh-UkY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDIwOSBTYWx0ZWRfXyzPtp1E07t24
 bY0M6luYICdlqI0V70A0/77dzsDNYs1CJAY7JxghG43wh6SUNlv+f7CWH9ZEFhe5iRt2ShvzoIp
 UM6Lyzgo5A2AVP3Ofyz97XWai7ivs5ZzCkynD+SobNAoWDB+TZlMrbAs7Ie2IaEuRBVaUuTHPQo
 TsfVjJjiAT+LCK9Rc12BtxEb9EDeHH9RiY1Fla4TVnALw/1AbazBT9QmRpfWi6Eoit9lwywPRl0
 YieuL1wUHB1M8DldvBuQZ5PhHsYsKyH+ubufAgM7dAYt8vjjmvMqvzUA3KEO8LQ3K36OFPn9UzI
 JFT5B/a282aYF0F0UbwqqCHBc/MT1tftcdG5djX9eIfH1E2/qIg3GMne0M7cc2ffA7TmamAhWpG
 jCS61VMlCLiJ0fh9lxkSuDTVJtaASrpU98GnDs3OqRw/l099vtXMR8vxnoO59cKgNE+oq7VqgEI
 I93jCJ2xxqQEJqsho1Q==
X-Proofpoint-GUID: CrlQ1SF_jI4AVdsC__TEvnQX6WGh-UkY
X-Authority-Analysis: v=2.4 cv=Urlu9uwB c=1 sm=1 tr=0 ts=69a36a99 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=3I1J8UUJPc9JN9BFgKH3:22 a=VwQbUJbxAAAA:8
 a=mpaa-ttXAAAA:8 a=0BTOhgosUMHOF3p0MAAA:9 a=QEXdDO2ut3YA:10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_142224_743081_17107743 
X-CRM114-Status: UNSURE (   9.00  )
X-CRM114-Notice: Please train this message.
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

On Tue, 10 Feb 2026 14:41:42 +0800, peter.wang@mediatek.com wrote:

> Add some logs to make it easier to debug after a command timeout.
> 
> Changes since v1:
> 1. Fix typos in the cover letter and commit message title.
> 2. Improve log clarity.
> 
> Peter Wang (2):
>   ufs: core: add debug log for uic command timeout
>   ufs: core: add debug log for mcq command timeout
> 
> [...]

Applied to 7.1/scsi-queue, thanks!

[1/2] ufs: core: add debug log for uic command timeout
      https://git.kernel.org/mkp/scsi/c/01517654bc25
[2/2] ufs: core: add debug log for mcq command timeout
      https://git.kernel.org/mkp/scsi/c/3abe4113e784

-- 
Martin K. Petersen

