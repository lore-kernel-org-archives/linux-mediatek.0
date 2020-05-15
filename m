Return-Path: <SRS0=cOAS=65=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BEE2C433E1
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2020 01:11:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA8E7206D8
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2020 01:11:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="re0TCSVh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gU+howcS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA8E7206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HdcZpYFz8Uzm7K33TAH1BgMe/U864x3R2FEoeZ/D7v8=; b=re0TCSVhbx5qFD
	xu+IsO/Ui+BpXYrv1AbCSQnYCoQq5VYgeOth1yYP30+/ydtPm1jHdwOrcDfcDBYYMq3tzHv3fOTMO
	3cq9kCSXY3DksRwiW8IZ0dJZbXZw/GvqN5IoC8eYI86G1P8t030wBej7KmVVGZgg+Uogm6l8s2CsT
	wUuzcTfNtxE4BrOHgO4X4iP7aSfvmRTws6uZUwIp5U+N/08KVjC1I+mr1QCoFa9uuPtvs97Opo7Zq
	QnwDxLTtQQcLqC1X4JXpbX7ADgrLyVHHcEmhWxHBkzXh9LvGRiWQKfUy8njVtyw7WdurwSkzO5M1S
	uvCBF0GhyCugFxYhf1EQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZOsG-0005UZ-B5; Fri, 15 May 2020 01:10:52 +0000
Received: from userp2120.oracle.com ([156.151.31.85])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZOsD-0005Tp-K7; Fri, 15 May 2020 01:10:51 +0000
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04F13BTV130944;
 Fri, 15 May 2020 01:10:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=uzWUKK8WSe769UBEv6C+kY5NI1d1U8HUxPG8v/sJW80=;
 b=gU+howcSEUQ7AlT/CKnH5zts96yW/9T/6okbxANBpEgaYAy6lETJYL039gJGC+5szh6R
 1iRaFQfzYswZymyfLsB+gONFIPVEhPYCSNenayNga0lWsuOfSjx/WVMDnqQCNzWG8rym
 8ueWDwnsxoWGndqYheBAcuEQqXUQq144hw5LSXB5zNQVpyZZTTtR9bj/3rPz8VwEE0X4
 J4b69sV+R+rWji7GiPfaB5m5BEZHX+Hq8K/phzXi4+ITlA/HmbJDNy1R/BnJnresKZrp
 gkhRTgQdaVxjkvoSdsaqx37uIytL0pfFBxx8kkS7UQHpv9nEaidjhbEVrPBNk1f5JJ3F 0A== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 3100xwxp99-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 15 May 2020 01:10:35 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04F12kqR161267;
 Fri, 15 May 2020 01:10:35 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 3100yqf3x0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 May 2020 01:10:35 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 04F1AWJC017962;
 Fri, 15 May 2020 01:10:33 GMT
Received: from ca-mkp.ca.oracle.com (/10.156.108.201)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 14 May 2020 18:10:32 -0700
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: jejb@linux.ibm.com, matthias.bgg@gmail.com,
 ChenTao <chentao107@huawei.com>, stanley.chu@mediatek.com
Subject: Re: [PATCH -next] scsi: ufs-mediatek: Make ufs_mtk_fixup_dev_quirks
 static
Date: Thu, 14 May 2020 21:10:26 -0400
Message-Id: <158950485295.8169.16456174061063737853.b4-ty@oracle.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200514012655.127202-1-chentao107@huawei.com>
References: <20200514012655.127202-1-chentao107@huawei.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9621
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=941
 adultscore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2005150007
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9621
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 cotscore=-2147483648 bulkscore=0
 phishscore=0 adultscore=0 mlxlogscore=970 lowpriorityscore=0
 impostorscore=0 spamscore=0 malwarescore=0 priorityscore=1501 mlxscore=0
 suspectscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2005150007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200514_181049_791740_90E004EB 
X-CRM114-Status: GOOD (  12.25  )
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
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, avri.altman@wdc.com,
 linux-mediatek@lists.infradead.org, alim.akhtar@samsung.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 14 May 2020 09:26:55 +0800, ChenTao wrote:

> Fix the following warning:
> 
> drivers/scsi/ufs/ufs-mediatek.c:585:6: warning:
> symbol 'ufs_mtk_fixup_dev_quirks' was not declared. Should it be static?

Applied to 5.8/scsi-queue, thanks!

[1/1] scsi: ufs-mediatek: Make ufs_mtk_fixup_dev_quirks static
      https://git.kernel.org/mkp/scsi/c/21d2b76831fd

-- 
Martin K. Petersen	Oracle Linux Engineering

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
