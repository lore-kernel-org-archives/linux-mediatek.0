Return-Path: <SRS0=gG0U=EF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82FC0C2D0A3
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2020 01:58:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0B4C20723
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2020 01:58:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BYk0yYaz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TGaH6sbn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0B4C20723
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Date:References:Message-ID:
	From:Subject:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fF3YDlkSHKp4JCSZE8OVKGy9qAvfgnLZXF18nnka7XE=; b=BYk0yYazu7u5ACgGftzlScC13
	zg5hE3MwnAT/wsizPKbcTeiX0q4E64dfZRowlc2Gs5UBVLcrBH4BNO05PWK6CfPZAm5uhSSmp6Yf3
	vyv7KdgObJYPMcOpVAqay9Lnhr4erBBpCDAtKZ/JP2ECmyZ0RopXL6vjxNC6DL5bu7Ziz9UMENO0D
	fyxjTvaQuiRN6WAVDJUSwy7LrAUbDoPSNmLAAikUUM7uvfWOIvhqWTYuwopghU80ooOxNk/teR4G+
	S5WisrLELuC98Ghta+1UOTachzyT7rttSx3oQafYt6N6dLiOsuJmQAG1ZA+MGC4eJogp1VWSmvApm
	2Ay609sqw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYJg1-00051n-QU; Fri, 30 Oct 2020 01:58:01 +0000
Received: from userp2120.oracle.com ([156.151.31.85])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYJfy-00050p-SM; Fri, 30 Oct 2020 01:58:00 +0000
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09U1meL5165332;
 Fri, 30 Oct 2020 01:57:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 from : message-id : references : date : in-reply-to : mime-version :
 content-type; s=corp-2020-01-29;
 bh=Xo4961axV8+bFG/0+a1irfWYVoKHxcVZBEbloOyD+OI=;
 b=TGaH6sbnseOioiaCfe3Tln7baygF+t91CosgtuKpRisdLMWTJUA+pjCE04PpUvTuZZXM
 Ggh0eSiJEMfSZZldoef9Cfmzt/tpVM3/Bx8fcVBqFDlNlMhwCUcmi2+36AjfLMi8Bmzp
 cTfF/krecrYIitVWHY+YxGuV4kdNs3iNozSrPi0S23NNSQjySPzEVp5BRLDX3lMlfkrl
 IrbERUmnSSZf92CmqHqd57/iTq8/PXy0McnDUJZzLC0vz9XL3oNAytGPnz/DB2EQ0Ow3
 CyaGO9ViAXTlbi/sEAM3DvHmU3U20vriec/ehh0wuME//MpLrAIRt0Kf6Tl5SFrBQYjP AQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 34dgm4d9yw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 30 Oct 2020 01:57:42 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09U1uBE7104141;
 Fri, 30 Oct 2020 01:57:42 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 34cx616f11-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Oct 2020 01:57:42 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 09U1vcO4028926;
 Fri, 30 Oct 2020 01:57:38 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 29 Oct 2020 18:57:38 -0700
To: Asutosh Das <asutoshd@codeaurora.org>
Subject: Re: [PATCH v2 1/2] scsi: ufs: Put hba into LPM during clk gating
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1mu041nnc.fsf@ca-mkp.ca.oracle.com>
References: <52198e70bff750632740d78678a815256d697e43.1603825776.git.asutoshd@codeaurora.org>
Date: Thu, 29 Oct 2020 21:57:35 -0400
In-Reply-To: <52198e70bff750632740d78678a815256d697e43.1603825776.git.asutoshd@codeaurora.org>
 (Asutosh Das's message of "Tue, 27 Oct 2020 12:10:36 -0700")
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9789
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 mlxlogscore=999
 suspectscore=1 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010300012
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9789
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 suspectscore=1 clxscore=1011 mlxscore=0 malwarescore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010300011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_215759_067424_350CAC52 
X-CRM114-Status: GOOD (  16.09  )
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
Cc: martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, "James
 E.J. Bottomley" <jejb@linux.ibm.com>, open list <linux-kernel@vger.kernel.org>,
 Satya Tangirala <satyat@google.com>, Avri Altman <avri.altman@wdc.com>,
 cang@codeaurora.org, "moderated list:ARM/Mediatek
 SoC support" <linux-mediatek@lists.infradead.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Stanley Chu <stanley.chu@mediatek.com>, Bart Van Assche <bvanassche@acm.org>,
 "moderated list:ARM/Mediatek SoC
 support" <linux-arm-kernel@lists.infradead.org>, Bean Huo <beanhuo@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


Asutosh,

> During clock gating, after clocks are disabled, put hba into LPM to
> save more power.

Applied to 5.11/scsi-staging, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
