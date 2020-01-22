Return-Path: <SRS0=t7yo=3L=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BE1DC2D0DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jan 2020 08:19:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F7852253D
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jan 2020 08:19:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XFZTF2bU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="m5SR2jNB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F7852253D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QPAsc7ooy2ZiYz8XrAIHGnDxcvvpKqlWKca7izK1T2Y=; b=XFZTF2bUswh1y/
	xSy08Mf0Pg0pFHLZs3C5sEDT9JgXGsLA+OPjRLkLEwXTenF7TLCECQ76AmrXZ91bG2QZUcxkvA8o8
	Lu+y8svynS1gs+M3KK5SOVcfIdvQeJFljXA+mT584DhU91D6tq3tsqTQYRD1s3e2CJinzhjOoXGDp
	2HzD5WbbhSVL6+b+xMqihSV7Ue7XISbEJbu+34QBL76RVVKBORyNlrDH94n4ouq2WUW24qgFiUsOx
	HHdWmP1Z/1dT3wxQdKHeDiGZU4+tD9X16ic8vi/G57NkJMkqksjYdM7wsLUdJ6Hkzb3dNMJomIl97
	kYZsMpengXgam+3PZ7HA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iuBEm-0004PR-Od; Wed, 22 Jan 2020 08:19:44 +0000
Received: from userp2130.oracle.com ([156.151.31.86])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iuBEj-0004P4-JQ; Wed, 22 Jan 2020 08:19:42 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00M8IhCN041195;
 Wed, 22 Jan 2020 08:19:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=uWz8eBHkgeZjITXN+B+A8IBMNj27yjCWOIaSt0VAyxA=;
 b=m5SR2jNBsD7bKa33po2xbgW/FAuQ9XGEBLxEAzCnzmTY0DMFtab76AjgBAH6mkz2FGLq
 2ePvW3XnakSiOxVVsVqJ6wgQYjrjDIU5wMXORM8I5hGT6Ise3MjSwNiQpT2kvhWfGKg1
 Oeud6+cku57pkGh5VJu9tidaUApLO7FlxFPm9Srz2WuyguCsfEIvCl9wdEjDS5La2h6B
 vONIWK+F54NhbRm2/spqIu+WW6tqGFOhUz0KJ+Di2Gg8DyOajTD8vxaLHWz4Zcxd+0e2
 MOn5JAEF+aUb6jFmnpeQpISvcAFHev6DfflEcOn35tPmNodhlt0/hRgbV0n6ZDihf3bV pg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2xkseuj7wk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Jan 2020 08:19:34 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00M8J7pF188324;
 Wed, 22 Jan 2020 08:19:33 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 2xnpfqqvr0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Jan 2020 08:19:33 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 00M8I16Q024075;
 Wed, 22 Jan 2020 08:18:01 GMT
Received: from kadam (/129.205.23.165) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 22 Jan 2020 00:18:00 -0800
Date: Wed, 22 Jan 2020 11:17:53 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Sandesh Kenjana Ashok <sandeshkenjanaashok@gmail.com>
Subject: Re: [PATCH] staging: mt7621-pinctrl: Align code by cleanup long lines
Message-ID: <20200122081753.GE1847@kadam>
References: <20200121195218.GA10666@SandeshPC>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200121195218.GA10666@SandeshPC>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9507
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001220075
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9507
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001220075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200122_001941_725714_74486DB4 
X-CRM114-Status: GOOD (  16.89  )
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
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jan 21, 2020 at 08:52:18PM +0100, Sandesh Kenjana Ashok wrote:
> Cleanup lines over 80 characters in pinctrl-rt2880.c.
> Issue found by checkpatch.pl
> 
> Signed-off-by: Sandesh Kenjana Ashok <sandeshkenjanaashok@gmail.com>
> ---
>  drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c b/drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c
> index d0f06790d38f..254d4eb88f5f 100644
> --- a/drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c
> +++ b/drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c
> @@ -159,8 +159,8 @@ static int rt2880_pmx_group_enable(struct pinctrl_dev *pctrldev,
>  }
>  
>  static int rt2880_pmx_group_gpio_request_enable(struct pinctrl_dev *pctrldev,
> -						struct pinctrl_gpio_range *range,
> -						unsigned int pin)
> +					struct pinctrl_gpio_range *range,
> +					unsigned int pin)
>  {
>  	struct rt2880_priv *p = pinctrl_dev_get_drvdata(pctrldev);

Now it has a new warning.

CHECK: Alignment should match open parenthesis
#162: FILE: drivers/staging/mt7621-pinctrl/pinctrl-rt2880.c:162:
+static int rt2880_pmx_group_gpio_request_enable(struct pinctrl_dev *pctrldev,
+                                       struct pinctrl_gpio_range *range,

Just leave it.  The original is fine.

regards,
dan carpenter


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
