Return-Path: <SRS0=dHEP=CZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F3A6C433E2
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2020 14:35:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D85B221E3
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2020 14:35:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nPnfP3LV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mNoEgYBW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D85B221E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yug/oi9uz4gTdLrqkXePlnk3IwADmZBVuWynld35LgY=; b=nPnfP3LVzZCmQIp8X5lAuaVNho
	2er8bSdoucZUiKRi/5lTz+ifm0pqjXOvUlD/+TpA39mksd3+17A1Az+KEZ3+LHy2yECRq/VU/fwPX
	T5UqlNBnlH5JHRGZ/4LcXEgeHs2H/O1tS4phubYDVFLzBM8kRgJOPcU59de2nkPfaLi2igN2ZBqhz
	t0g+Y10O2i4gMxU3SE6tutB3qVW865YKuEm/GwA80dO+hCaalSpoGTUv/8HGVCNRa3D99vttFNQcS
	DMVD9RHkddHiKX9gwGWVsps7ySQ/qw89dDumrteusC67l7m5kO0RAi1zQRfIb/FDvVnmMYXx6y3/b
	gCIGCZlA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIYWj-0005oH-Nh; Wed, 16 Sep 2020 14:35:17 +0000
Received: from aserp2120.oracle.com ([141.146.126.78])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIYWh-0005nu-Bt
 for linux-mediatek@lists.infradead.org; Wed, 16 Sep 2020 14:35:16 +0000
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08GEYq4V164808;
 Wed, 16 Sep 2020 14:35:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=7bdtTKLixiAtMYJR//Iz6J5n9li0B25OfacusHXkDlY=;
 b=mNoEgYBWC6cpA1OO/At/+YUBXV1bKK91rLwCnRhfIakqUdGX0EoT68tSo9yJhfCsp10l
 qG4ToBu40g95G8GIvobCXWIYOnEw/TT0H+aX+Hy5InHd4nmxFfGr26/RQ6R0iOiE6ar9
 soW/feVOlTmLHrTLbhiK2BB7rXnhGTXUvoOSLOF8dizI0w05SCET9NTm5jIf4q7CNf5M
 zQD7LcrP8AfzQH5qmIZn1aFVp1H8NExaHO1HR9YAPhfxl1Cl7ZDIfR2USa2ND5ozAEB+
 jqhzlrg/xaFyhcnKaji8GsbXMUIxJI2nReF25Ca8YoLEVO7fxLmjIuwO2NbnkEP71rS6 LQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 33gp9mbey7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 16 Sep 2020 14:35:14 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08GEU1Wm138936;
 Wed, 16 Sep 2020 14:35:14 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 33khpkh5dc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Sep 2020 14:35:14 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 08GEZCQ0017797;
 Wed, 16 Sep 2020 14:35:12 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 16 Sep 2020 14:35:10 +0000
Date: Wed, 16 Sep 2020 17:35:05 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: landen.chao@mediatek.com
Subject: [bug report] net: dsa: mt7530: Add the support of MT7531 switch
Message-ID: <20200916143505.GA766413@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9746
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=3
 mlxlogscore=999 phishscore=0 mlxscore=0 adultscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009160110
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9746
 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999
 adultscore=0 malwarescore=0 clxscore=1011 lowpriorityscore=0 phishscore=0
 spamscore=0 priorityscore=1501 suspectscore=3 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009160110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200916_103515_508012_20C6E1BC 
X-CRM114-Status: GOOD (  12.78  )
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

Hello Landen Chao,

The patch c288575f7810: "net: dsa: mt7530: Add the support of MT7531
switch" from Sep 11, 2020, leads to the following static checker
warning:

	drivers/net/dsa/mt7530.c:2298 mt7531_cpu_port_config()
	error: uninitialized symbol 'interface'.

drivers/net/dsa/mt7530.c
  2273  static int
  2274  mt7531_cpu_port_config(struct dsa_switch *ds, int port)
  2275  {
  2276          struct mt7530_priv *priv = ds->priv;
  2277          phy_interface_t interface;
  2278          int speed;
  2279  
  2280          switch (port) {
  2281          case 5:
  2282                  if (mt7531_is_rgmii_port(priv, port))
  2283                          interface = PHY_INTERFACE_MODE_RGMII;
  2284                  else
  2285                          interface = PHY_INTERFACE_MODE_2500BASEX;
  2286  
  2287                  priv->p5_interface = interface;
  2288                  break;
  2289          case 6:
  2290                  interface = PHY_INTERFACE_MODE_2500BASEX;
  2291  
  2292                  mt7531_pad_setup(ds, interface);
  2293  
  2294                  priv->p6_interface = interface;
  2295                  break;

Does this need a default case?  Smatch thinks "port" can be 0-6.

  2296          }
  2297  
  2298          if (interface == PHY_INTERFACE_MODE_2500BASEX)
  2299                  speed = SPEED_2500;
  2300          else
  2301                  speed = SPEED_1000;
  2302  
  2303          mt7531_mac_config(ds, port, MLO_AN_FIXED, interface);
  2304          mt7530_write(priv, MT7530_PMCR_P(port),
  2305                       PMCR_CPU_PORT_SETTING(priv->id));
  2306          mt753x_phylink_mac_link_up(ds, port, MLO_AN_FIXED, interface, NULL,
  2307                                     speed, DUPLEX_FULL, true, true);
  2308  
  2309          return 0;
  2310  }

regards,
dan carpenter

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
