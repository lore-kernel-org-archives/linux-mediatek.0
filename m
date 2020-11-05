Return-Path: <SRS0=qi5H=EL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F5EDC388F9
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2020 04:22:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD7DF20795
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2020 04:22:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tdvOqN8d";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="xzBkHHw7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD7DF20795
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gu8uaSYLBUKRi75G529PC+amxGqxzXNo8sXzp/7Xqwo=; b=tdvOqN8dtwDsY0pttlSHKTlgZ
	4oR8XsvgtbF/W3QrRwjRhOcPBdFp9rb97molJtky+lkiKkFmoLoMCnSdRNQmtDu0xjxI/rSc9l/qM
	FgYzCM8Ys2wjoa/0hvL2I+Wum2gdvPPkotlSM+C09DK2rfr1T/VUsA9JgAp4aEY8z6cWIKgWTcDjw
	1QK6SOmNbbRPhZj/GU0Kka1aNp6JwKNckjW5j4pkg2f8SRBQ1zS7MgsLnxOhKZ0o9NhOMgOILXx1P
	DYjLmgZFW4q5w7/BKD00iLPNAvpvOu5wkCw+ua0li8TQ3reykb6gn3wM/ScvpsbVfFxNqyoD/cDqb
	DXCeafhqw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaWmo-0006AF-Bb; Thu, 05 Nov 2020 04:22:10 +0000
Received: from aserp2120.oracle.com ([141.146.126.78])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaWml-00069Y-N9; Thu, 05 Nov 2020 04:22:08 +0000
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0A54Jh4m146131;
 Thu, 5 Nov 2020 04:21:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=Q/Zxvd8Y2ETDhPysP3vR7GgbkKkwEG1Cl5eXaCf/fe8=;
 b=xzBkHHw7LXUkd0oDkDaZx33aT+UMvLcF3XsZBEmSc6gdJTky7+BxLaq5trrunXYiwZnJ
 BfBvjOWewoWvXsJ7b2x4XfTaQXdGwWpbC2L/QtVd8hoVkYTjRuIIfGXAUpgKXHH2Vd8l
 MHGHq/0J3qj+UDyQIwFWXSoFJiPYPzHPhu3fHV7kAbgWlrrteh6Q/9cQJtC1bljKUezj
 i63C878rWpa2SUjTF57R9PKApvCS1pOj2O9hiWnan1F7tzS9x71UFMe/6bBxz/CrD5Ds
 crX3r+pLQEsyNM0cSQP7tfq4sS4QZpAuEIWah+OCBd/P08e+e4phLd4Pb5dGuEXA5z1g eg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 34hhvchya2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 05 Nov 2020 04:21:57 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0A54Kkhn020897;
 Thu, 5 Nov 2020 04:21:57 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 34hw0m0e9k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 05 Nov 2020 04:21:57 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0A54Lo4M017180;
 Thu, 5 Nov 2020 04:21:50 GMT
Received: from ca-mkp.ca.oracle.com (/10.156.108.201)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 04 Nov 2020 20:21:50 -0800
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: cang@codeaurora.org, Asutosh Das <asutoshd@codeaurora.org>,
 linux-scsi@vger.kernel.org
Subject: Re: [PATCH v2 1/2] scsi: ufs: Put hba into LPM during clk gating
Date: Wed,  4 Nov 2020 23:21:45 -0500
Message-Id: <160455005256.26277.2812826866099587703.b4-ty@oracle.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <52198e70bff750632740d78678a815256d697e43.1603825776.git.asutoshd@codeaurora.org>
References: <52198e70bff750632740d78678a815256d697e43.1603825776.git.asutoshd@codeaurora.org>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9795
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 adultscore=0 bulkscore=0
 mlxscore=0 suspectscore=0 spamscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011050030
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9795
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=999
 bulkscore=0 phishscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011050030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201104_232207_873053_A1B6B5DB 
X-CRM114-Status: GOOD (  16.94  )
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
Cc: Bart Van Assche <bvanassche@acm.org>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 linux-arm-msm@vger.kernel.org, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 open list <linux-kernel@vger.kernel.org>, Satya Tangirala <satyat@google.com>,
 Avri Altman <avri.altman@wdc.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, Bean Huo <beanhuo@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 27 Oct 2020 12:10:36 -0700, Asutosh Das wrote:

> During clock gating, after clocks are disabled,
> put hba into LPM to save more power.

Applied to 5.11/scsi-queue, thanks!

[1/2] scsi: ufs: Put HBA into LPM during clk gating
      https://git.kernel.org/mkp/scsi/c/dd7143e27cb7
[2/2] scsi: ufs: qcom: Enable aggressive power collapse for ufs HBA
      https://git.kernel.org/mkp/scsi/c/61906fd465c0

-- 
Martin K. Petersen	Oracle Linux Engineering

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
