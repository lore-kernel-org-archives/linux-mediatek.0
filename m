Return-Path: <SRS0=8MsW=7V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31021C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jun 2020 13:26:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 030A62072F
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jun 2020 13:26:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lp+Z/1Ik";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="L9Q6MgLs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 030A62072F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZYr5GPSvriAqGP+RontVE9u1tjSVrsEfjOq2i2ahUyM=; b=lp+Z/1Ik3zcwYN
	WfvurOwgw4rkNZR5OWcagPRSwIfN/5seLRg5/axC7C+DeiTb71X7zLHsmv1Uhwk54HB1GoU05GMJU
	bGGegQzAOAhHVLX+tucKMwqt+U6eJxYbCgJ5WxSvvleB+KLOHceFy0QV9afV0S5og2qOgP4XwhqoH
	MeXTgz7pWaDG/sVNFPtceGRPRcPniI/eqlhYkf6ye1iXKesHrMgHDGaVbPVSEdU/kyaD/n1h3HYER
	4KBSt46C94CuuQ6sdnnEaWzZBYffjqXJjRqS1SJuULzi0vTaWxR07aI8SBFYWm4Qc7I+ekNRZ8hg4
	OprAbplFAXxNfwlV2hmg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jiHn4-0006C2-BJ; Mon, 08 Jun 2020 13:26:14 +0000
Received: from userp2120.oracle.com ([156.151.31.85])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiHmN-0005Uk-7c; Mon, 08 Jun 2020 13:25:32 +0000
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 058DIVV3009696;
 Mon, 8 Jun 2020 13:25:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=g+1brnPZ5OzPDeNs4PfHGUTw5EjIjHf2rZ33XxmyH2A=;
 b=L9Q6MgLscregteDP1PDsvEBMkIniBDDCn18Lfj3jsgt3+O8Spd5PUHNrWj8GOPOXVi6f
 WeN0CAdSawapqJkObo9Dw0J9oHnwGLTdCGmTTJ80jo44XaTn2oUyyW1XKsI5dJcoUmAM
 uLDW2PTnwbLMNMkba/wtaHtgpBSacNq1Zs3PzpuyiaNX1CPOKCn4nyq/Lr66vCsdt+YO
 8wHlLEvWdK6jwRrUCWBfudWBKbKsTk0vRJhKhh0Qbz6xJtp07ljv4EUBTnB61y25U1D/
 WVonYhsb78B0QGUJOm8sr9fLyhP026j55otjQpOuuBvDGTg0+I5xhOldqg8oznG3q3uL JQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 31g3smpspj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 08 Jun 2020 13:25:21 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 058DNn0V108563;
 Mon, 8 Jun 2020 13:25:20 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 31gmqm7gju-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Jun 2020 13:25:20 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 058DPJkd008134;
 Mon, 8 Jun 2020 13:25:19 GMT
Received: from kadam (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 08 Jun 2020 06:25:18 -0700
Date: Mon, 8 Jun 2020 16:25:07 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [PATCH v8 4/8] PM / EM: add support for other devices than CPUs
 in Energy Model
Message-ID: <20200608132507.GP22511@kadam>
References: <20200608115155.GY30374@kadam>
 <b347fb60-46d3-e59c-59fa-a2b10932fc49@arm.com>
 <20200608125127.GN22511@kadam>
 <da0debe1-73da-33f1-c24e-154c2123c522@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <da0debe1-73da-33f1-c24e-154c2123c522@arm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9645
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006080100
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9645
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 cotscore=-2147483648 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 phishscore=0 mlxscore=0
 mlxlogscore=999 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006080100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200608_062531_463892_2E4D1AEC 
X-CRM114-Status: GOOD (  10.57  )
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
Cc: kbuild-all@lists.01.org, lkp@intel.com, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, kbuild@lists.01.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 cw00.choi@samsung.com, linux-mediatek@lists.infradead.org, linux-imx@nxp.com,
 linux-omap@vger.kernel.org, Dietmar.Eggemann@arm.com,
 linux-arm-kernel@lists.infradead.org, Dan Carpenter <error27@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

It's not really a proper bug report so it doesn't deserve a reported-by.

Thanks, though!

regards,
dan carpenter


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
