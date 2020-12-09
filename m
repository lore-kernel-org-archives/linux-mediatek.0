Return-Path: <SRS0=7tkd=FN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA16FC4361B
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 17:12:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CA6323C30
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 17:12:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CA6323C30
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Date:References:Message-ID:
	From:Subject:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PuTa1viWpzJ5Ri/2GvrKSYux+Tp+MDbnXqE1KcVIwJs=; b=PnHBJnqlVHgH1Go1/ts8OYqAh
	hypujUzHViRx7WjqlrjaWJGFkR3JIB8UolOoCq0UscIAyvkGdUscYNUmc58LcVNkfdj1RzomGY5b4
	20fT5e/cMHGgcyvO2VNs0DXFwmnqxIUu19Yha31ndq8U9fY4vQH6QzOX1NAoFRYTEK3MKtx0TcGyj
	nip5Zr7E7YvWSeLbN2YMcd1E098fgtuCwQ/9rFTjP1+wJl15/oIGbRONO0nBSlLSXn/HBeEPrS10U
	lqdHaLup+MiErROB+2/m/Eot0Q++AdeCnWch4SMVxaUQkzb85JzKl16FaRTiRN9HsD7zizZdOZMoH
	BukDElIWQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kn30u-0006Cj-Qw; Wed, 09 Dec 2020 17:12:28 +0000
Received: from userp2130.oracle.com ([156.151.31.86])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kn30s-0006CE-R8; Wed, 09 Dec 2020 17:12:27 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B9H9vOA047456;
 Wed, 9 Dec 2020 17:12:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 from : message-id : references : date : in-reply-to : mime-version :
 content-type; s=corp-2020-01-29;
 bh=Wucwn6QESXraR5YDfQ3+qZuJ9R/NnVq54XD1k3uySBE=;
 b=sHVa17eGBnxU/vNfSzQvaPkOFJx4lSoe95KuAo5vugYfbFCmhg7VYQYXjwzVS6zt+odP
 1LQbudC0DQIEx4UCOpmj9qyC2048+l6CSOqFvTStzMvXcOt37nhe7h2QCRzMNWhiXXER
 DKE2ciadEW7myEXPNmeYx1UPDcp9tb9hvB0G1suZJxV8YN7XCk1AHVd/tfFhUpVXbkuy
 PwMXhBNH21a2UaoROEfh/3dG5FEsprisef4da6fXD7guX/awfyZklY9CdRJzE1lxp1YZ
 ebjyR+rxO2H+DsNr2Gk6Zq+Ux5ItlY54ahn12ZhikufNP2WxW4+qwORSOl5ohpd/lv7s 9g== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 3581mr1888-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 09 Dec 2020 17:12:15 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0B9HBuWU054557;
 Wed, 9 Dec 2020 17:12:15 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 358m50w22w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 09 Dec 2020 17:12:15 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0B9HC90C010234;
 Wed, 9 Dec 2020 17:12:10 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 09 Dec 2020 09:12:09 -0800
To: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v2 0/2] scsi: ufs: Re-enable WB after device reset
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
Message-ID: <yq1blf2rjj6.fsf@ca-mkp.ca.oracle.com>
References: <20201208135635.15326-1-stanley.chu@mediatek.com>
Date: Wed, 09 Dec 2020 12:12:05 -0500
In-Reply-To: <20201208135635.15326-1-stanley.chu@mediatek.com> (Stanley Chu's
 message of "Tue, 8 Dec 2020 21:56:33 +0800")
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9829
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 suspectscore=1
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012090121
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9829
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 mlxlogscore=999
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 impostorscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012090121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_121227_038575_6B07E59C 
X-CRM114-Status: GOOD (  13.34  )
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
Cc: bjorn.andersson@linaro.org, matthias.bgg@gmail.com, cang@codeaurora.org,
 alim.akhtar@samsung.com, beanhuo@micron.com, bvanassche@acm.org,
 linux-scsi@vger.kernel.org, peter.wang@mediatek.com, cc.chou@mediatek.com,
 andy.teng@mediatek.com, jejb@linux.ibm.com, chun-hung.wu@mediatek.com,
 nguyenb@codeaurora.org, avri.altman@wdc.com,
 linux-mediatek@lists.infradead.org, jiajie.hao@mediatek.com,
 chaotian.jing@mediatek.com, linux-arm-kernel@lists.infradead.org,
 martin.petersen@oracle.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, alice.chao@mediatek.com, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


Stanley,

> This series fixes up an issue that WB is not re-enabled after device
> reset.

Applied to 5.11/scsi-staging, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
