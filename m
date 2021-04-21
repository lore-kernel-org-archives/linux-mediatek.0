Return-Path: <SRS0=vHqv=JS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38032C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 10:20:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 955B361427
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 10:20:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 955B361427
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WVyHBR3kSiMwgxITrd2idRIFF1dX8UUav8nE56Z+pm0=; b=KVtB8N39z5Thtk3sOsB7jOLH16
	1ymhqS3bcqLL1WWOMLyIEJ++XDgJsX6Oxk8vkbGGTGdSpTQODmM/+aPEeSSie+WLEouFHj9CunZIp
	JBpbfsM40/MHVcxhgaQJne6TA9RuZYzB9LH6tS3RwSDBvLpD2GMuAJFBPxpCke0HGkcDH08uomkK2
	AGsloczvzv/mLJUL7nORI4/yKJQAi2FezuQVZePiiSISsGks/UdvWD1SbwzGqOQTo94hIiyDKDqhV
	MFEtY9xojcoYQQAHGNwiIP3sLsnoscwgiyxf66HDJfSzTI3NhEpa0s8pEgl/5iOMj8riiW0q94c0e
	7rKunp5w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZ9yG-00EDOd-RI; Wed, 21 Apr 2021 10:20:36 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZ9yD-00EDOE-OM
 for linux-mediatek@desiato.infradead.org; Wed, 21 Apr 2021 10:20:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=aW2XV99ki74xagENX2uKtHc0R0vvRO3bFUoVvlCTYu8=; b=VN2Rx/zLf5BNgbfa36y7ei9Ii9
 cKKWSK/ZHauADd+pXQ18ltQykPhxFyHb8bBGrS7E77DuYdalDZLiCJz+y9OykExsampF+/v0PGZlV
 byKHgfyTD8QkHUz0IkAWjYs7UvdFxcZws8V49sywaLMPfOn8jLpYdnUW0KvqQWHusfQb3uhm0U0lI
 o95jFEcxtsS50L0nThpU0IJlHtidlmas2OdwjqMjPSRCKjgBRaVWUPKtCtYYHWJ1FDRYbZ2GZYUzI
 4GEgWaU+fGMk9RYafZfMhv/P1KjGBL5Ui+oKI1lF5oameMQ1OIZnDCn5IoTEhVdpaS5P5Zcgp5gll
 PwW6CDaA==;
Received: from aserp2120.oracle.com ([141.146.126.78])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZ9y8-00Cnnb-8A
 for linux-mediatek@lists.infradead.org; Wed, 21 Apr 2021 10:20:32 +0000
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13LAJGiM135897;
 Wed, 21 Apr 2021 10:20:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=aW2XV99ki74xagENX2uKtHc0R0vvRO3bFUoVvlCTYu8=;
 b=xHss9sp7t5iGALFvdj6bCiIbKlNueJhBwn99P/AnYUO9fzWeciAg//OzPEzxac8yVGWN
 r4RUgRstc6flGUPvKwEKw5r/DGAdfrItSNTBXCmR6KkLPdC3Kg9z+X54xr/QvwuApLvm
 nM5QiH18d3QHglci07LTuYfZ8HERz5RZNeaZa6Mzh8eYFVkVP/dcztMr7oEddMWGh1ct
 LJnWi8p1exD4cNUTc8oKyBaQzbPc9vU58X0XMKZwaAegGAdUnRMYw2YS1NABlxh3MtxR
 UwmdwW5UTYOG7LeDXGIC9QAZFdt7pnV/fw3XO5X8W6xW7UXtGdod8JbZMSXovYNMni8w zA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 37yqmnhttd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Apr 2021 10:20:19 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13LAAwug050948;
 Wed, 21 Apr 2021 10:20:19 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by aserp3030.oracle.com with ESMTP id 38098rhfrc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Apr 2021 10:20:19 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 13LAKIcA087538;
 Wed, 21 Apr 2021 10:20:18 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 38098rhfqp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Apr 2021 10:20:18 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 13LAKG8t025239;
 Wed, 21 Apr 2021 10:20:16 GMT
Received: from mwanda (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 21 Apr 2021 03:20:15 -0700
Date: Wed, 21 Apr 2021 13:20:10 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: ryder.lee@mediatek.com
Cc: linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [bug report] mt76: mt7615: fix CSA notification for DBDC
Message-ID: <YH/8WvgUZtp51WEP@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Proofpoint-ORIG-GUID: -CnXcfGQpXtifIJymuKOpR6hO9cycBEO
X-Proofpoint-GUID: -CnXcfGQpXtifIJymuKOpR6hO9cycBEO
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9960
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 adultscore=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1011
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=723
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104210079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_032028_402773_3C4201FF 
X-CRM114-Status: UNSURE (   8.40  )
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

The patch 402a695b1ae6: "mt76: mt7615: fix CSA notification for DBDC"
from Feb 27, 2021, leads to the following static checker warning:

	drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:385 mt7615_mcu_rx_csa_notify()
	error: undefined (user controlled) shift '(((1))) << (c->omac_idx)'

drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
   376  static void
   377  mt7615_mcu_rx_csa_notify(struct mt7615_dev *dev, struct sk_buff *skb)
   378  {
   379          struct mt7615_phy *ext_phy = mt7615_ext_phy(dev);
   380          struct mt76_phy *mphy = &dev->mt76.phy;
   381          struct mt7615_mcu_csa_notify *c;
   382  
   383          c = (struct mt7615_mcu_csa_notify *)skb->data;
                ^                                   ^^^^^^^^^
c is random data from the network

   384  
   385          if (ext_phy && ext_phy->omac_mask & BIT_ULL(c->omac_idx))
                                                            ^^^^^^^^^^^
Any value more than 61 will lead to undefined behavior.  (shift wrapping
mostly).

   386                  mphy = dev->mt76.phy2;
   387  
   388          ieee80211_iterate_active_interfaces_atomic(mphy->hw,
   389                          IEEE80211_IFACE_ITER_RESUME_ALL,
   390                          mt7615_mcu_csa_finish, mphy->hw);
   391  }

regards,
dan carpenter

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
