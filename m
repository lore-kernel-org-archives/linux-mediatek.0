Return-Path: <SRS0=G+wW=HE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13D2EC433DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Feb 2021 06:55:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90AD264EEE
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Feb 2021 06:55:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90AD264EEE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XNe54U44IjmWeCUQXLrAB81axLbjj7nnULuXwO7usFA=; b=yQUeQPyHSn4W9/2guNUFyeoH2
	PLDYJVIzRRYlgfGWIAshQ3mXNX8TW5OctzilGmHUb5wdqc4dCwy2hDOlwpar3IodhEnjry7SEblfO
	e+/UxiZS67DFH80wJ1JD4OqonSiTUrzEgvHPt9CsZBhRZHum5aTe+VpZ4Bme5VmC5arExxABmxKx4
	hMouk0pket2HTbw3IfvN50X8G3tknJ6dYdsrdLKcgNBrIPWLY1e/80zBrQZ1C0bw0Cycf7v4SRoyA
	yjVVFHk54AiE0Jjm9HfMg4WJmEmQIBxaopOf2BEveaBTI029h9C5b0oLogs7RjNGz/StAexVv+Iwk
	/uffyurGg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6pai-0002nN-Sm; Tue, 02 Feb 2021 06:55:12 +0000
Received: from userp2130.oracle.com ([156.151.31.86])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6pag-0002mg-0T
 for linux-mediatek@lists.infradead.org; Tue, 02 Feb 2021 06:55:11 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1126sBVl026565;
 Tue, 2 Feb 2021 06:55:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=9EBf4UsWnrYciOb0VmTesjX4QVUYasu/M1Onu9gj/V4=;
 b=CFhaFsntxwyNgdmFPjfKD7XQtqJJKdU+dOzH8GHiZJzb7SfTEDrkyjok32LKXCBa6YI+
 xCHOxbP+nSRoywd9IJcvrGi8tAFXPbwBTt1HV2C0Ymrj+1EKnTAGmskobR6Fu+irzSfi
 Muc78emWGtJHcT5gjeWCTq0BwKIbtwq4DyL8QAtdyqnyCwRrKETdrIBO0UI9TydSDmCe
 xf9baXJ413PiXIE8Nu7AQgltc6IY+iEC9J7CpWnXdhXQ0F/9j0zzo2VlkO9gElHtQ5YS
 2XCSEAbpk1fLgPP0MoWEFFQN786G28/9dKGftW2ULFt0qYHK/67J7ak60s42W9AvLJW+ pQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 36cxvr15sc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Feb 2021 06:55:02 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1126su0W017991;
 Tue, 2 Feb 2021 06:54:59 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3020.oracle.com with ESMTP id 36dhbxsspc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 02 Feb 2021 06:54:59 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 1126sneD010423;
 Tue, 2 Feb 2021 06:54:49 GMT
Received: from kadam (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 01 Feb 2021 22:54:48 -0800
Date: Tue, 2 Feb 2021 09:54:38 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: Re: [PATCH] staging/mt7621-dma: mtk-hsdma.c->hsdma-mt7621.c
Message-ID: <20210202065438.GO2696@kadam>
References: <20210130034507.2115280-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210130034507.2115280-1-ilya.lipnitskiy@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9882
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 suspectscore=0
 spamscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102020047
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9882
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 mlxscore=0 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1011
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102020047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_015510_228764_BFEB7AD3 
X-CRM114-Status: GOOD (  18.98  )
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
 Masahiro Yamada <masahiroy@kernel.org>, stable@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jan 29, 2021 at 07:45:07PM -0800, Ilya Lipnitskiy wrote:
> Also use KBUILD_MODNAME for module name.
> 
> This driver is only used by RALINK MIPS MT7621 SoCs. Tested by building
> against that target using OpenWrt with Linux 5.10.10.
> 
> Fixes the following error:
> error: the following would cause module name conflict:
>   drivers/dma/mediatek/mtk-hsdma.ko
>   drivers/staging/mt7621-dma/mtk-hsdma.ko
> 

The only part of this commit message that I could understand at all was
the parts which were copy and pasted from the build system...  :/
Please, write it like this:

[PATCH] staging/mt7621-dma: fix build conflict

This driver cannot be built because we have two modules with the same
name and it leads to an error:

  error: the following would cause module name conflict:
    drivers/dma/mediatek/mtk-hsdma.ko
    drivers/staging/mt7621-dma/mtk-hsdma.ko

The fix is to rename mtk-hsdma.c to hsdma-mt7621.c.  Also we can use the
KBUILD_MODNAME where appropriate instead of hard coding the name.

regards,
dan carpenter


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
