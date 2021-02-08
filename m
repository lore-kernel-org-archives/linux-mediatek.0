Return-Path: <SRS0=Odcq=HK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72430C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Feb 2021 19:03:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01CAB64E59
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Feb 2021 19:03:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01CAB64E59
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bYcCKElU1gFW6cGTAeLQBx5XsI2fQmpetbFB11IG94w=; b=RxCd0W1SdSUlIlykuvb70oSha
	C2wVGlMZ+CrO2QV53VzuTy98p4TtMbhw//6ucnS1K/UMCQWt7FaufLd9ZRvp/d/zj5A8eNMdxwFQJ
	zF6IlH/V82Pw+42BV1hWqymixHkZe7pQdNZ48AO0zBYyWjxWifY3FAyIL9au0mqSGXzUTo0sw0syy
	rKbmwPFwp+8AUWIClR3HLRyt2VwTmOTmpvQmqLvXle/g39KVcUkV1RkyHV0O+5Booy8mIpDhir8MU
	oYSXGjeAVWxS31xMYxXV/Y/lX/gLaZOVQw+VNd5sJSmhbduirmifmVSpI3oatdAcXi9ZxsuSE0oFm
	0w7kCbZ2Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9BoV-0002fs-E0; Mon, 08 Feb 2021 19:03:11 +0000
Received: from userp2120.oracle.com ([156.151.31.85])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9BoS-0002ee-CG; Mon, 08 Feb 2021 19:03:09 +0000
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 118Ig3VL139458;
 Mon, 8 Feb 2021 19:02:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=Wf1goJTBSSWI4TQ+CnoSP72sPATBhea/Oy07byYA2aQ=;
 b=YiQ7qbtaQJpNs7E8LDkAGAGWx3f8c0gDQWzg5UuJpL3eX89ErwSg/ruvjtTsX9HtGoTS
 /gm4pdPPC3on+FKKrn5Ku/qjfRpKDcyV5N+8mzpBF3UZ37owN+e8PvDa74ftVH+PKwDN
 LPRSTaIQI6MruzrXQPwx1pIURr3ev9vGmQBrDF7QM+Xgl9zo3agZ3dZOdgbMSMjdbEi7
 yWvCwBN3/jMOZzLubY7N/KmrQybO+Nyqzp/m/IY/seLCkkHy9IsYfkBNJQZsGOevMUCo
 Rt1i0IOsSlmOItkydxdVVcggcUUBdqWLl6VQDXBkDPuiCuHX82iYrOMdWqozzigHPfwv 5w== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 36hkrmvypp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Feb 2021 19:02:58 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 118IfOsS124606;
 Mon, 8 Feb 2021 19:02:56 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 36j5107qst-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 Feb 2021 19:02:56 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 118J2q92015415;
 Mon, 8 Feb 2021 19:02:52 GMT
Received: from kadam (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 08 Feb 2021 11:02:52 -0800
Date: Mon, 8 Feb 2021 22:02:37 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Sascha Hauer <sha@pengutronix.de>
Subject: Re: [PATCH] staging: fix ignoring return value warning
Message-ID: <20210208190237.GN20820@kadam>
References: <1612689808-30985-1-git-send-email-tangyouling@loongson.cn>
 <20210208134517.GG2696@kadam>
 <20210208150618.GI8233@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210208150618.GI8233@pengutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9889
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 spamscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102080114
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9889
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 clxscore=1011
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102080114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_140308_610845_AEAD4485 
X-CRM114-Status: GOOD (  28.33  )
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
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Youling Tang <tangyouling@loongson.cn>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Feb 08, 2021 at 04:06:18PM +0100, Sascha Hauer wrote:
> Hi Dan,
> 
> On Mon, Feb 08, 2021 at 04:45:17PM +0300, Dan Carpenter wrote:
> > On Sun, Feb 07, 2021 at 05:23:28PM +0800, Youling Tang wrote:
> > > Fix the below ignoring return value warning for device_reset.
> > > 
> > > drivers/staging/mt7621-dma/mtk-hsdma.c:685:2: warning: ignoring return value
> > > of function declared with 'warn_unused_result' attribute [-Wunused-result]
> > >         device_reset(&pdev->dev);
> > >         ^~~~~~~~~~~~ ~~~~~~~~~~
> > > drivers/staging/ralink-gdma/ralink-gdma.c:836:2: warning: ignoring return value
> > > of function declared with 'warn_unused_result' attribute [-Wunused-result]
> > >         device_reset(&pdev->dev);
> > >         ^~~~~~~~~~~~ ~~~~~~~~~~
> > > 
> > 
> > We can't really do this sort of fix without the hardware to test it.
> > This could be the correct fix or perhaps switching to device_reset_optional()
> > is the correct fix.  We can't know unless we have the hardware to test.
> 
> When device_reset() is the wrong function then adding a return value
> check will turn this into a runtime error for those who have the
> hardware which will hopefully trigger them to tell us why reset_device
> is wrong for them.
> At least for a staging driver I find this procedure opportune.
> 

That seems like sort of a jerk move...  What's the rush?  Someone will
eventually be able to test this if we just wait around for a bit.
Otherwise if no one has the hardware then eventually the driver will be
deleted.

regards,
dan carpenter


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
