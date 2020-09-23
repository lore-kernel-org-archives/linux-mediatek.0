Return-Path: <SRS0=E7TL=DA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45223C4727E
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Sep 2020 00:39:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDD25221E8
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Sep 2020 00:38:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VCI1E4Fm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NmE5pRHJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDD25221E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Date:References:Message-ID:
	From:Subject:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZLxFBbuCuuT7KqpB4Og5sSuKCuUguLVA37/osiZL/94=; b=VCI1E4FmKGAdHfR/Xq8URcCVz
	KqRknFe4GC9XRi4tEZ2Of+34RNCo7pMUycVqXAx3f/7O9ej8s477juNmaMgbqT5JuaokeR+jxiEQC
	Dgicf1pCsCgBl+I5maLXY2BJbiqCe1rir5srrKTdFXsLZBrExeoZlLszzEGAI7DjMUtPx4Q3GdEPB
	5exia/4VW/imKj+dYl9xeTA87NSGU8yhqQOxY6XXHrczRaFmTXVD35dkiDTp52AwbJUKHNYWCFsze
	MKksZhwSdWRtNog51BY8fHk7dezFkqRnm8oLf1Kj4MeWk0sq0FAJ9W8xx3fI1J14U0WpD9r2r6f4T
	w+/Qqz7OA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKso3-00059o-Ol; Wed, 23 Sep 2020 00:38:47 +0000
Received: from userp2120.oracle.com ([156.151.31.85])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKso0-00059J-LZ
 for linux-mediatek@lists.infradead.org; Wed, 23 Sep 2020 00:38:45 +0000
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08N0StEm100661;
 Wed, 23 Sep 2020 00:38:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 from : message-id : references : date : in-reply-to : mime-version :
 content-type; s=corp-2020-01-29;
 bh=Xey5ieFSyN8kbwbiKUIJyF1Q0BSSLa8Dkq0jcaaZFxY=;
 b=NmE5pRHJvYwdCW2JbFjO1Zyt8jHcCzv5khwfhfzPaqUeHz0fN4p4X415v5f4ZqTgS9DS
 xzNK25pcyRiOPhhsqZ+TTHsZ68isy+vhjLeJT3gKADCdKsbv+u9K8LhgzpckWexduVNi
 LvlheGG9eLhebbA9JxSimEop92glp9dz/X/Q/BpTqptRsa3vsKocweXy9JpBBfdiNgWt
 Rc7C1PyDrTrQkkTH8SS+3hd62uOHOazcjiqX1D4RBpB4zR1efXmhT/2Q0Yg5K1bEF5lE
 lR4ol8cCEja0wQi0KrHn0qd1fzvrffAAl83xlOTBqOkugcuspuAhYREMbBthIO5petZW vw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 33ndnufs0h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 23 Sep 2020 00:38:27 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08N0QDgT163738;
 Wed, 23 Sep 2020 00:38:27 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 33nuw5c3d5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Sep 2020 00:38:26 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 08N0cOZW004102;
 Wed, 23 Sep 2020 00:38:25 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 22 Sep 2020 17:38:24 -0700
To: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v3 0/2] scsi: ufs-mediatek: Support performance mode for
 inline encryption engine
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq13639nx8z.fsf@ca-mkp.ca.oracle.com>
References: <20200914050052.3974-1-stanley.chu@mediatek.com>
Date: Tue, 22 Sep 2020 20:38:19 -0400
In-Reply-To: <20200914050052.3974-1-stanley.chu@mediatek.com> (Stanley Chu's
 message of "Mon, 14 Sep 2020 13:00:50 +0800")
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9752
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 malwarescore=0
 mlxscore=0 suspectscore=1 adultscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009230000
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9752
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=1 bulkscore=0
 clxscore=1011 impostorscore=0 mlxlogscore=999 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009230000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_203844_870439_8D3C0F75 
X-CRM114-Status: GOOD (  15.63  )
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
Cc: mark.rutland@arm.com, vivek.gautam@codeaurora.org, jiajie.hao@mediatek.com,
 alim.akhtar@samsung.com, robh@kernel.org, linux-scsi@vger.kernel.org,
 kishon@ti.com, peter.wang@mediatek.com, arvin.wang@mediatek.com,
 chunfeng.yun@mediatek.com, yingjoe.chen@mediatek.com, liwei213@huawei.com,
 devicetree@vger.kernel.org, andy.teng@mediatek.com, cc.chou@mediatek.com,
 chun-hung.wu@mediatek.com, henryc.chen@mediatek.com, avri.altman@wdc.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 chaotian.jing@mediatek.com, martin.petersen@oracle.com,
 kuohong.wang@mediatek.com, pedrom.sousa@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


Stanley,

> This series adds high-performance mode support for MediaTek UFS inline
> encryption engine.  This feature is only required in specific
> platforms, i.e., MT8192 series.

Applied to 5.10/scsi-staging, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
