Return-Path: <SRS0=ZAsA=HL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5199DC433DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Feb 2021 08:07:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 109E864E3B
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Feb 2021 08:07:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 109E864E3B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=w9qSSzZy5dCUrMKH/XQX4pB41qb+XPFzFT1uXp13sHw=; b=vy9YWhv9/B1GBUnZAgIuboxk+
	+sop988V6dMbciFOU+Vjtjc1b1n0SeL4jakj4FuxZoozyi/I5eyCk/zLgyEY720CR735aCCSwnr+C
	leB5ZxuIdw+gPloYC0yLsxScPtQxxoludeBqzgg29v1cNyb+VhhmcIA1iH6DG9+WZ9OUMxzfTeQdr
	FLOTjX1+jfe3jeonCGH6F53UlamVipJ1qI8mbtGk+YufetnNtuFANNIrqKyBRn3Nw07h5HioSE/+J
	t+AQXvmDr3V0R1YZgvPNkHhx86lFHu/CbgQPGL9z7VI2JFqZU88SDiHZQukRAXit90zWsGH0gv/gR
	FT7TG+j7A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9O2y-0007tP-Qs; Tue, 09 Feb 2021 08:06:57 +0000
Received: from aserp2120.oracle.com ([141.146.126.78])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9O2w-0007sq-7d; Tue, 09 Feb 2021 08:06:55 +0000
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1197xF1W185136;
 Tue, 9 Feb 2021 08:06:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=FgbAm48IzN4NjhMcfVudFiqdSoE9vqOSbrnwPBxudIU=;
 b=DtIerUdiuipSsIr9VodYqA4p5BBzwPJ86kX+shahaqZ+CsGdSgchtLz+G/hHX3QYxYIQ
 2Bl57p0VNckurTBjzJUFBLlOGFNPpV21aNF/EaioCoFsgJdRGCbEwSHuYlUyqOrhYpoR
 SDlimMJl8n9WHMIeYgPTEpv1seUzcqmOrKjHcVarpw/TK6txsCSNwmpUzWhzpaTvUAvG
 z2ZMQNI6AyR8SALtap5aV9XHVbKiEgCiPioxhpRyG/Wi0xWsY7p4R3LuEBQxH5BHeuNK
 Gixb6ClXAZNgxb0CF3iQ7Ltfi8EhQsuuft3H1uVrgzxYHXWNs+ffF3tq0vcrmQ1THRxl eA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 36hk2kek7j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 09 Feb 2021 08:06:49 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1197xsuM167532;
 Tue, 9 Feb 2021 08:06:47 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 36j4pncj41-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 09 Feb 2021 08:06:47 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 11986jig021903;
 Tue, 9 Feb 2021 08:06:45 GMT
Received: from kadam (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 09 Feb 2021 00:06:44 -0800
Date: Tue, 9 Feb 2021 11:06:34 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Youling Tang <tangyouling@loongson.cn>
Subject: Re: [PATCH] staging: fix ignoring return value warning
Message-ID: <20210209080633.GO20820@kadam>
References: <1612689808-30985-1-git-send-email-tangyouling@loongson.cn>
 <20210208134517.GG2696@kadam>
 <20210208150618.GI8233@pengutronix.de>
 <20210208190237.GN20820@kadam>
 <13779748-ab8e-c7c3-11e4-5232836f5ae6@loongson.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <13779748-ab8e-c7c3-11e4-5232836f5ae6@loongson.cn>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9889
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102090037
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9889
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 malwarescore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102090037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_030654_472153_09E02F17 
X-CRM114-Status: GOOD (  32.09  )
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
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Sascha Hauer <sha@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Feb 09, 2021 at 09:18:02AM +0800, Youling Tang wrote:
> Hi, Dan
> 
> 
> On 02/09/2021 03:02 AM, Dan Carpenter wrote:
> > On Mon, Feb 08, 2021 at 04:06:18PM +0100, Sascha Hauer wrote:
> > > Hi Dan,
> > > 
> > > On Mon, Feb 08, 2021 at 04:45:17PM +0300, Dan Carpenter wrote:
> > > > On Sun, Feb 07, 2021 at 05:23:28PM +0800, Youling Tang wrote:
> > > > > Fix the below ignoring return value warning for device_reset.
> > > > > 
> > > > > drivers/staging/mt7621-dma/mtk-hsdma.c:685:2: warning: ignoring return value
> > > > > of function declared with 'warn_unused_result' attribute [-Wunused-result]
> > > > >          device_reset(&pdev->dev);
> > > > >          ^~~~~~~~~~~~ ~~~~~~~~~~
> > > > > drivers/staging/ralink-gdma/ralink-gdma.c:836:2: warning: ignoring return value
> > > > > of function declared with 'warn_unused_result' attribute [-Wunused-result]
> > > > >          device_reset(&pdev->dev);
> > > > >          ^~~~~~~~~~~~ ~~~~~~~~~~
> > > > > 
> > > > We can't really do this sort of fix without the hardware to test it.
> > > > This could be the correct fix or perhaps switching to device_reset_optional()
> > > > is the correct fix.  We can't know unless we have the hardware to test.
> > > When device_reset() is the wrong function then adding a return value
> > > check will turn this into a runtime error for those who have the
> > > hardware which will hopefully trigger them to tell us why reset_device
> > > is wrong for them.
> > > At least for a staging driver I find this procedure opportune.
> > > 
> > That seems like sort of a jerk move...  What's the rush?  Someone will
> > eventually be able to test this if we just wait around for a bit.
> > Otherwise if no one has the hardware then eventually the driver will be
> > deleted.
> > 
> > regards,
> > dan carpenter
> We do not have the relevant hardware to test, this is just to solve a
> compile-time warning.

Yeah, I know.  Wait for someone who can test it on this.  Normally we
don't require testing for staging patches.  But in this case, it's
impossible to know which is the proper fix without testing so we should
wait.  It's rude to test by breaking people's systems and hope they
report the bug.

regards,
dan carpenter


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
