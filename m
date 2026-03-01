Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C77EFD0045
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 Mar 2026 02:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bwUkbaTki6TTnhaRVp0leO5Xd4rs/qy/Oc0xfqrFu94=; b=4dCQz8rfbUXgHDqzYe8KTdx2dP
	wJekANlX8MJw8Tbyiz9Csst64aDRhcK4oQs8hXDr2x0bP1UWdxxAvxTCRP63p5g/yjGo3PiLaJAFc
	Lj7NGNpnAMdtGrjkyEQKWf0w6nj7qTcWTPrFsoKf9TExQwSRtolwVNECM3PRrhtt9lYaJYzltRJLE
	pD9EdgmoCPuK2xW/SzDdzKSER9lQfRDvlXkFAeH02/rgtvhhQjaC/UEPkbSvE/TPZrxQVJ3V7ldh7
	SN2EyQRsSr6bjH+TJLaxwHNrV/SmXPxVqhJEg0HZgz9ePgjQIY8YBQ9jvL29dCH2cC2u1ttYkNR4z
	d9HjzXaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwWMW-0000000Ak5h-4ARz;
	Sun, 01 Mar 2026 02:16:52 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwWMR-0000000Ak4z-3CQv
	for linux-mediatek@lists.infradead.org;
	Sun, 01 Mar 2026 02:16:49 +0000
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6211vS4p2966046;
	Sun, 1 Mar 2026 02:16:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=bwUkbaTki6TTnhaRVp0leO5Xd4rs/qy/Oc0xfqrFu94=; b=
	aQH/qoGxFJcDCz2Q1Mb7MJya/6IRfx7s9kCy0j0GDns+bjRCi1D42pRFth0tz8uy
	brsMgEBCaIkn0aRPHp0Qp8sh2zGF9T50lxplkscFd0t7GJLCtxWTS+XiMfc1IZTD
	Ik//ZhrT9+1/lSMuJ4+Yvoti8N7MwEES0UWQOohMnTalPu1eFp7xGF93o173CAFY
	EfnP9NgSwwOlg47EcetXZwMTLcZmwgV+Hq7m8U7bp606dkLxxUJxTbnhXyzR9nPA
	JWDnAD5GkeuLluathkiLR8pn6T75sCV+UPHGk0uKpP0LAnmbMYb+6FQcn8xPpDTX
	mRQEcwTA+QAbBBQ84ZgFrQ==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cksh8rny5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 01 Mar 2026 02:16:42 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61SL0gO3036920;
	Sun, 1 Mar 2026 02:16:41 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4ckpt7ehhy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 01 Mar 2026 02:16:41 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 6212GXt4019643;
	Sun, 1 Mar 2026 02:16:40 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4ckpt7ehdg-5;
	Sun, 01 Mar 2026 02:16:40 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: linux-scsi@vger.kernel.org, avri.altman@sandisk.com,
        alim.akhtar@samsung.com, jejb@linux.ibm.com, peter.wang@mediatek.com
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
        chun-hung.wu@mediatek.com, alice.chao@mediatek.com,
        cc.chou@mediatek.com, chaotian.jing@mediatek.com,
        tun-yu.yu@mediatek.com, eddie.huang@mediatek.com,
        naomi.chu@mediatek.com, ed.tsai@mediatek.com, bvanassche@acm.org
Subject: Re: [PATCH v2] ufs: core: support UFSHCI 4.1 CQ entry tag
Date: Sat, 28 Feb 2026 21:16:18 -0500
Message-ID: <177231727974.1778274.1876634781735565722.b4-ty@oracle.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210071834.1837878-1-peter.wang@mediatek.com>
References: <20260210071834.1837878-1-peter.wang@mediatek.com>
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
X-Proofpoint-ORIG-GUID: VxlT5mDGgUN2wem8cDGj-jmHOqv32lPi
X-Authority-Analysis: v=2.4 cv=D8VK6/Rj c=1 sm=1 tr=0 ts=69a3a18a cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=x4eqshVgHu-cdnggieHk:22 a=VwQbUJbxAAAA:8
 a=mpaa-ttXAAAA:8 a=QqvJkLw1XXo513EEspsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDAxOCBTYWx0ZWRfX8LI1x4/X2Hh1
 sL6QS0eCqyNOPXsHlaVXRoDYVdGKefsyNKENGkxgLR+sTIO47y6KUVCS2t9x9EV0f0rZ4EgRDzR
 B3ESgo4C6IIEJ1XNmI4JWncCqYdCaZmPHUhrfIMLJiYP1pts4kRSSrnKUn+QhcMG4+bpgJRbYfA
 0GOaEDXaVdzrzTK0vOyQ3KVfYqGhau5uzh8djl9cbhBPNGYedaza4zHT+RdKK7r/1qrZi0MMEJ2
 oNZvBXfzW58fUCqH2AsdViWKNl4MrFhvDZQDBYPmN0p8AWPBrDgoofpDKKzrF2bkdpA+eKQCARo
 wM8LHqpyZ6phY+iP01BA5XOS9Yp+99OBwxUuUuzchsBicsEMXWGqm0az0oF8VhsB5VtoNj+dEGE
 OYe5Ewx/EuGtO0G6vBLKIyLrNzPFi7ZB+tr2lKkb3825lSoR/8EyXyj5DCGT880uwSSdUu2cC3q
 tpJguvE1HkuKsQeKbCw==
X-Proofpoint-GUID: VxlT5mDGgUN2wem8cDGj-jmHOqv32lPi
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_181647_915354_337A7A85 
X-CRM114-Status: UNSURE (   7.57  )
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
Message-ID: <20260301021618.4VSfBzsJMBQqwFudwkK0g8h2PtOefmVwgSeMJQQv7dc@z>

On Tue, 10 Feb 2026 15:17:30 +0800, peter.wang@mediatek.com wrote:

> The UFSHCI 4.1 specification introduces a new completion queue(CQ)
> entry format, allowing the tag to be obtained directly.
> 
> 

Applied to 7.1/scsi-queue, thanks!

[1/1] ufs: core: support UFSHCI 4.1 CQ entry tag
      https://git.kernel.org/mkp/scsi/c/f707860ebc84

-- 
Martin K. Petersen

