Return-Path: <SRS0=i2Ig=7C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24ADBC433E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2020 12:12:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E36D4207D4
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2020 12:12:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hAn6maS8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="TT0I6I7K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E36D4207D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZJe6ycb6A1AM/um8vOGj0IzbqBHzjJf+abHRVo4JsaI=; b=hAn6maS8/oecJh
	l+1yO4uha9785S73Qeuq0JpMDB2p1AJZsB+55q5sIrXjSdDzCFOLIr28Pb7lNT8X3yNH5dELiYylQ
	I+SyVaRwi1FIr6Ub8zthfijOKuztTqBjmHm/dCgbG9fRP143IPdr0YrVIFmPFauRK+jzxv4wxC2C6
	wbYJSviEyNAeeQHKIDxbw+7ll+XWUlLl1LpAAjZs8Tw3KOtMkB9YTnHSaoucDoJ2KhAMH+i/aNa9z
	TRgbql1Fg0IO+rx0oZTqkdMfAs+2gfZxr/bVZ+VnlgOeVKl2TGOq3OGjrcOqGQiC2CgqtMHE2VVEB
	qK8mrEbWD2Ou1n1zbQ9Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbNZj-0001w8-QR; Wed, 20 May 2020 12:11:55 +0000
Received: from userp2120.oracle.com ([156.151.31.85])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbNZW-0001ii-8I
 for linux-mediatek@lists.infradead.org; Wed, 20 May 2020 12:11:43 +0000
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04KC7VE0191979;
 Wed, 20 May 2020 12:11:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=Sxm3BevQoxnZLIyVzRYA3qn4bXDWkSjkHWdHjyCXzB8=;
 b=TT0I6I7KyYPKgLGKvtqwfnaI5gA8BTO9BkOD9W9F/HJeDdosr+pAPneWm4Arh6im0gry
 2QSu6rNlP9VPhxXQk9sHmRG3FzjmPIEjyKKXtqrLRlUWY5tTV43OLmotpxvfahOk2MMB
 9qmZkm+BdmUQj4T7B2i2OU3JLeDvBXor+/EsJ9wlIjhj6IWhTq0xiH9rQ9G0HjAI6Awo
 ivXRaY9/TKGlNTK1AUdt71f4nJz4wju35xccul+ncmPnlHrQ5BE9QqXTdVXFe53cuvk7
 GiaJDoA+a1+Fxn4QxBaFZp+1NS1nfVeTSqw7WPdbTLZY9T0/Aq/dTNn5k61S0dnE9418 +Q== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 31501r98gr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 20 May 2020 12:11:41 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 04KC9BNF125260;
 Wed, 20 May 2020 12:09:41 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 315020669j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 May 2020 12:09:41 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 04KC9elu007528;
 Wed, 20 May 2020 12:09:40 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 20 May 2020 05:09:39 -0700
Date: Wed, 20 May 2020 15:09:33 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: ryder.lee@mediatek.com
Subject: [bug report] mt76: mt7915: fix possible deadlock in mt7915_stop
Message-ID: <20200520120845.GK172354@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9626
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 mlxlogscore=738
 adultscore=0 bulkscore=0 suspectscore=3 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005200106
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9626
 signatures=668686
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 spamscore=0
 mlxlogscore=759 clxscore=1015 priorityscore=1501 cotscore=-2147483648
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 mlxscore=0 suspectscore=3 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2005200106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200520_051142_424037_EEE2339A 
X-CRM114-Status: UNSURE (   8.75  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-mediatek@lists.infradead.org, Ryder Lee <ryder.lee@mediatek.com>,
 linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello Ryder Lee,

The patch 57b9df6fa5f5: "mt76: mt7915: fix possible deadlock in
mt7915_stop" from May 12, 2020, leads to the following static checker
warning:

    drivers/net/wireless/mediatek/mt76/mt7915/init.c:595 mt7915_register_ext_phy()
    error: we previously assumed 'phy' could be null (see line 592)

    drivers/net/wireless/mediatek/mt76/mt7615/init.c:371 mt7615_register_ext_phy()
    error: we previously assumed 'phy' could be null (see line 368)

drivers/net/wireless/mediatek/mt76/mt7915/init.c
   589          if (test_bit(MT76_STATE_RUNNING, &dev->mphy.state))
   590                  return -EINVAL;
   591  
   592          if (phy)
                    ^^^
   593                  return 0;
   594  
   595          INIT_DELAYED_WORK(&phy->mac_work, mt7915_mac_work);
                                  ^^^^^^^^^^^^^^
This will Oops.

   596          mt7915_cap_dbdc_enable(dev);
   597          mphy = mt76_alloc_phy(&dev->mt76, sizeof(*phy), &mt7915_ops);
   598          if (!mphy)
   599                  return -ENOMEM;
   600  
   601          phy = mphy->priv;
                ^^^^^^^^^^^^^^^^
phy is set here again.

   602          phy->dev = dev;
   603          phy->mt76 = mphy;
   604          phy->chainmask = dev->chainmask & ~dev->phy.chainmask;
   605          mphy->antenna_mask = BIT(hweight8(phy->chainmask)) - 1;
   606          mt7915_init_wiphy(mphy->hw);

See also:
drivers/net/wireless/mediatek/mt76/mt7615/init.c:371 mt7615_register_ext_phy() error: we previously assumed 'phy' could be null (see line 368)

regards,
dan carpenter

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
