Return-Path: <SRS0=vHqv=JS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F06EC433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 13:18:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0833161440
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 13:18:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0833161440
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6DfE9rCaNZXKCzh8sSwrrfgUqDz/BnZoCIwDc0yMBAE=; b=GL/Vsx2u8NKaqSRS7Onny5QLv2
	TYetwjNhqVogMH+WYh0TeBb9VlxzdIN/vXbG7dPXbSuh9g+aZ8fCRnyBA4gD3pSSidekeZUfQZzsG
	u4SDGMZ292i2xrU33Bk5INFV7/XUB0mQhTuF1HKvf27fO1Zj2MXX9O/Q+m28O00UQGuEIfHgsw+wa
	LPIuZGjLk9IktO9FMtX+kYjV7ai6A3mlIMPfQijfHHcjBAnhm15McVvc5L4BwS1pEZLg6r9bOMNmD
	xLqxvTd46jMDCIyhixhj4hhqivfCWctaYBV6+ixJ8+I1LUijfM5HHRVOi50fOMxZLaRw4D/OW8ScL
	oq4/i90Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZCjt-00ERio-A9; Wed, 21 Apr 2021 13:17:57 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZCjm-00ERhq-Fw
 for linux-mediatek@desiato.infradead.org; Wed, 21 Apr 2021 13:17:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=meF497oFUEUVOCM41KHiP9Z6G2djfW/D09lrDw/FHh8=; b=jitURhoTrHeJyEMYPA2F4kvBRr
 YIh9xCyfHGRO6DuPQWsz65Z3bTv74DHOwJZkSlYccjPPXYBsv1i7w+twFBv+I39UXbOeQRW8pTEMr
 v7orOAdu3pqC9BCwhHRLQcs2izVVgWR5VIW2lBw81cStS1lX5jQ3S3gfGX1msRjytFWmEC7aa19ID
 wHSsutNNwAwuhdQOm+dlRxR6hEh9ImoDoeFo6n9D0FggYrg6diSknfVWUzYHgAHqMAEsUWiHWRydc
 APFv1IqcZBEUbtTHFX647nb2Yl61yE/ZTXsJBqpsLhnuxl/0wM7+HB1UC7rhKKloSkyZYgnbeC2AY
 VsxTb/yA==;
Received: from aserp2130.oracle.com ([141.146.126.79])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZCjh-00CuMQ-5u
 for linux-mediatek@lists.infradead.org; Wed, 21 Apr 2021 13:17:49 +0000
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13LD9pJ4157315;
 Wed, 21 Apr 2021 13:17:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=meF497oFUEUVOCM41KHiP9Z6G2djfW/D09lrDw/FHh8=;
 b=OEbj3ivKGEHo2xata6oRKs96yxKp/N75VC2ZewBB6DL/Wm0tu0uzr31wlSYZ+KMvD4Ok
 Pjc/VymR/gkAVTOoZGG/mGf1xXISknsiWSZiQMbwogZt8FdPd0+ujGpnQnFRdzGqjVAB
 /Uc7+i5rayIZp9xbX2SyCnKl9Me5Lm4QtLuscpDXxY16tg1rFMiOoI3xrUKh4b5JjcWz
 iSaLgkTWgb/8Y5OZn/ckC7qErO0fOGFYpWDmO6uo6k2IVXG+AWqYsP6xoeC5QDa3TGCS
 dUtfhqOdB3LelMyx3a8ZZOmHv4V72Gl0Q0vudPsXmVmXSmDS1qxLVw+iteef/3vSkX/v bw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 37yn6caake-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Apr 2021 13:17:39 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13LDC5IW144525;
 Wed, 21 Apr 2021 13:17:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by userp3020.oracle.com with ESMTP id 3809eu8twa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Apr 2021 13:17:39 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 13LDE2TJ151465;
 Wed, 21 Apr 2021 13:17:38 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 3809eu8tw1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Apr 2021 13:17:38 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 13LDHb6s017703;
 Wed, 21 Apr 2021 13:17:38 GMT
Received: from mwanda (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 21 Apr 2021 06:17:37 -0700
Date: Wed, 21 Apr 2021 16:17:31 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: ryder.lee@mediatek.com
Cc: linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [bug report] mt76: mt7615: fix TSF configuration
Message-ID: <YIAl62mky03Byme+@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Proofpoint-GUID: RDazDupxIhTdpc8Iq3vzY78uVZucxBhq
X-Proofpoint-ORIG-GUID: RDazDupxIhTdpc8Iq3vzY78uVZucxBhq
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9961
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 priorityscore=1501
 bulkscore=0 suspectscore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 mlxlogscore=774 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104210102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_061745_335732_7942C92A 
X-CRM114-Status: UNSURE (   8.66  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello Ryder Lee,

This is a semi-automatic email about new static checker warnings.

The patch a4a5a430b076: "mt76: mt7615: fix TSF configuration" from 
Feb 23, 2021, leads to the following Smatch complaint:

    drivers/net/wireless/mediatek/mt76/mt7615/usb_sdio.c:74 mt7663_usb_sdio_set_rates()
    warn: variable dereferenced before check 'sta' (see line 70)

drivers/net/wireless/mediatek/mt76/mt7615/usb_sdio.c
    69		u32 w5, w27, addr, val;
    70		u16 idx = sta->vif->mt76.omac_idx;
                          ^^^^^^^^^^^^^^
The patch adds a new dereference

    71	
    72		lockdep_assert_held(&dev->mt76.mutex);
    73	
    74		if (!sta)
                     ^^^
The old code checks for NULL

    75			return -EINVAL;
    76	

regards,
dan carpenter

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
