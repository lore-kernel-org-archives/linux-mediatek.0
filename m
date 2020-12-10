Return-Path: <SRS0=Sq/6=FO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,BIGNUM_EMAILS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A347C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 08:42:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF3CD23D6A
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 08:42:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF3CD23D6A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PFb9NiI1hPAHDlxwUTTYyvzMd2OmDJ6ALKby8pyjToE=; b=hr/bhNd+3+aoXjHe1V8LvWAJSW
	Jua5+z+TrpdYx8h0+ok+Eth95tImL4B7kPd5wI4f3xdkjv0HwDYnKzQjqQzPOMRhfSPUA9Sv05nyf
	I9HS4yC8fl4ovcKyfwt/AzueYLmAkM2k0syVMfWIiq1qIPh/ZqVSrFlCBi8RyvT5a4pGM04vgoyrT
	eVan+H5XzljqxhGJDfWbzhuYU+I1JkohbsaWsZrJCsHDsfHSJh1P1Lvs3dP0TyeDUn2XuqZzVx/+t
	hWiYkRKp6d7n9e043YjaOv8tkD9qVXGMeMNnVJGQRSoBBgS/LhQK7kctKDWxZbrXW3ZOkrJ5F/zZ0
	/lWYo6/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knHWL-0006Py-FX; Thu, 10 Dec 2020 08:41:53 +0000
Received: from aserp2130.oracle.com ([141.146.126.79])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knHWJ-0006PW-FM
 for linux-mediatek@lists.infradead.org; Thu, 10 Dec 2020 08:41:52 +0000
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BA8dWQq147783;
 Thu, 10 Dec 2020 08:41:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=QOxeNCnzYdh5L4j4WfRgXXdbcdNAsI5kDl495nBQKPo=;
 b=UXM97v0pKA79cPcTFVe420L8v53KGq4KOH7mtnlQduufFO9YvK+QE/qabhVrZ6CokzQr
 dM9uO9pjp7neS+VqRqv+f6sY/oXWDMvg+G6bwG60I+AlEcLdJsEJgWR4WQXGBC/nkCyR
 AS8PVNVZUdsvnsHJlwPA2tZA0Ifa4jZ2V9H7vXTnrlnq/BL0ukgwoFdltnShHbT6+db1
 /SYefZDthl/5RDnhwrciOX2FeGXWpzFY6vcKZJWQyQV/XkExhesJqerWSsM5/2wY4ZPu
 0g1jt9vfsMmY2B2+FaZ2QOOw7pzOIifM6T0WidRKhqwqu9L9Fm1FH0VB87zxjfVd64Pa Dg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2130.oracle.com with ESMTP id 357yqc47w6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 10 Dec 2020 08:41:48 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BA8eavq056695;
 Thu, 10 Dec 2020 08:41:48 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 358m41dvyk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Dec 2020 08:41:48 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0BA8fl3D025754;
 Thu, 10 Dec 2020 08:41:47 GMT
Received: from mwanda (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 10 Dec 2020 00:41:47 -0800
Date: Thu, 10 Dec 2020 11:41:40 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: nbd@nbd.name
Subject: [bug report] mt76: mt7915: add encap offload for 4-address mode
 stations
Message-ID: <X9HfRCXMxlWtGPIw@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9830
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=3 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012100056
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9830
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=3
 mlxlogscore=999
 clxscore=1011 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012100056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_034151_667211_193EE9E7 
X-CRM114-Status: GOOD (  12.86  )
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
Cc: linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello Felix Fietkau,

The patch e151d71e503d: "mt76: mt7915: add encap offload for
4-address mode stations" from Aug 21, 2020, leads to the following
static checker warning:

	drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:1689 mt7915_mcu_sta_update_hdr_trans()
	error: 'wtbl_hdr' dereferencing possible ERR_PTR()

drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
  1676  int mt7915_mcu_sta_update_hdr_trans(struct mt7915_dev *dev,
  1677                                      struct ieee80211_vif *vif,
  1678                                      struct ieee80211_sta *sta)
  1679  {
  1680          struct mt7915_sta *msta = (struct mt7915_sta *)sta->drv_priv;
  1681          struct wtbl_req_hdr *wtbl_hdr;
  1682          struct sk_buff *skb;
  1683  
  1684          skb = mt76_mcu_msg_alloc(&dev->mt76, NULL, MT7915_WTBL_UPDATE_MAX_SIZE);
  1685          if (!skb)
  1686                  return -ENOMEM;
  1687  
  1688          wtbl_hdr = mt7915_mcu_alloc_wtbl_req(dev, msta, WTBL_SET, NULL, &skb);
  1689          mt7915_mcu_wtbl_hdr_trans_tlv(skb, vif, sta, NULL, wtbl_hdr);
                                                                   ^^^^^^^^

No check for if mt7915_mcu_alloc_wtbl_req() fails.

  1690  
  1691          return mt76_mcu_skb_send_msg(&dev->mt76, skb, MCU_EXT_CMD_WTBL_UPDATE,
  1692                                       true);
  1693  }

regards,
dan carpenter

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
