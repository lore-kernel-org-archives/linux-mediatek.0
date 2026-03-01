Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E8FEFD004A
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 Mar 2026 02:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ns0lXggDC2aX4UrHTXUvjJ7IDX6kAfcdiSwFXxMJNIs=; b=oLIUU2lGzZDxZiRIW55zJEMXMk
	BbiTSx8dwd3fTGwLwXhnlSHXN3+RGu3Jl03zghuGnI6tnalzFGPfgv6o1XQBQRJGt3GKda1RjhJKj
	jBkmzk6o9jUgYImiXfBATKj5wnCBIdZ16FAFJPn5r/mtiQWbAK4+cLiiUYFfhwNqzrB5iNIQaYIiv
	S6NVTaeGbqyo/Ury3U+xUrnhxzoLHVjn7ujN67wts1BrWqD/Y7G689dvetudvnUfe47b/X1xx3/2P
	ucooBfTbvgBn0NoUr4Z9rqeyImg7GX9qbLwZO5Q3E0FJOqkaNjA7BWRHo42Pm/169eujwKdnbpaEN
	ZBw2Re/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwWMU-0000000Ak5R-2wza;
	Sun, 01 Mar 2026 02:16:50 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwWMP-0000000Ak4l-0U89
	for linux-mediatek@lists.infradead.org;
	Sun, 01 Mar 2026 02:16:48 +0000
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6211fw0C1890255;
	Sun, 1 Mar 2026 02:16:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=Ns0lXggDC2aX4UrHTXUvjJ7IDX6kAfcdiSwFXxMJNIs=; b=
	kX+gFT9t/aEChoiCZKkz4lmoU3uPoWWrLErA9DCCQVqBT0YcJEofM8miqaSpYz5j
	qZ2WEgvphtmkEvq3ZGxHFgG4OjPaYWue5lAfCbCIFHfw5aB9vtJvVXT9sF0mQc5v
	noeCexTeNyEBgPfaAD33LG9JMx5sYLjtwgzgkrGWeX0GACcXzK8v686Jkm0DjhDW
	CHxHLN1Vj2CLEAST/cKfQYIcOANZG97HzC/ZYDXFqrmliFWQ2qHVVUcq4S5Vz50o
	HTl+IAe8RBnVBttr8V8YW2aKIslO12iW+b1ZaAAgsFYK9P2LB+azvwTQHuTWZp/r
	2NxXb92UV3BixCkIxrIFpQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cksg80qg6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 01 Mar 2026 02:16:40 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61SL0iPp037318;
	Sun, 1 Mar 2026 02:16:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4ckpt7ehh7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 01 Mar 2026 02:16:39 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 6212GXt2019643;
	Sun, 1 Mar 2026 02:16:38 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4ckpt7ehdg-4;
	Sun, 01 Mar 2026 02:16:38 +0000
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
Date: Sat, 28 Feb 2026 21:16:17 -0500
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
 definitions=main-2603010017
X-Authority-Analysis: v=2.4 cv=bbJmkePB c=1 sm=1 tr=0 ts=69a3a188 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=7Gl3-_t3PgB9XO-mQDs3:22 a=VwQbUJbxAAAA:8
 a=mpaa-ttXAAAA:8 a=0BTOhgosUMHOF3p0MAAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: U20jptXxPTmcnCT6CDzsFeCX7H0QUHFi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDAxOCBTYWx0ZWRfX7/ZIwlpjfuDg
 xhv9mqoBU3KMEa2cxOUUm6lIB0QClsMAPqHaYkHc3JtMLxJlGJg7EOfhp7R8kCv/GOhiR2mHuyB
 FkQJgUkQRNFbu0CM2mfaxJv1Ph3bFSb3h5Cbq3NvbRqXKdpqxbzLLVKEOZVxDEz0cj4CdJiFm31
 YlJi/weJO2tAUuLKoqUS+/oRydEHcPjQMtvKIvU8wCiAw1q/UpXmKeelNOL2WqLU1MbZrTWV270
 ss2E0UKnVFHBrUiPo0F4hX2WPb4+Ji9P1/6x4CwWa+gh+jg/tCdtszCAglEP3kl0ssE/gU3H1AC
 ofnZMbCyMErKl1r4gKioq6DW0XvW8izO15ZMMDnPFuh0drzq6p5r3Py32y+jkOPkbt9Md16e/XJ
 Mowgp4cK8+E/CitMp3c9h6IhWUg227dFqUwqTzVT/wI7tBLbhGiWHfgxw908+azTUtwigcv2YaQ
 YG0qTtOjdA0jC8khE3Q==
X-Proofpoint-ORIG-GUID: U20jptXxPTmcnCT6CDzsFeCX7H0QUHFi
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_181645_154323_6A365657 
X-CRM114-Status: UNSURE (   9.82  )
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
Message-ID: <20260301021617.nFFaeEcu5o7ddFHS28pqUwfNAMWBAgiE4-MybJ5thW8@z>

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

