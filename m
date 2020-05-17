Return-Path: <SRS0=QdPO=67=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEE33C433DF
	for <linux-mediatek@archiver.kernel.org>; Sun, 17 May 2020 06:12:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD42E206D5
	for <linux-mediatek@archiver.kernel.org>; Sun, 17 May 2020 06:12:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rlxilgqu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="oKJR8uN+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="OOVCxjsx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD42E206D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OHbPM93ErQRx5f1v3PBG8wxtuor4TfT/ue003iEFAEk=; b=rlxilgquDJ+/SN
	LxAgM5knvLl2OLNV8TAMLrFXnUy5x5q9q9RMPDsHSclRaFWHUBy6fKZXxY4oHNXLhBeltVIsn/Dvz
	tUWRJhkThxg4/rQyXiOd7QtFq3FKLDVSMgyfFmjit/gvTfWP1UG1fAdTQ4fx/qaSM5ieYR/DV/9ut
	i8ROD27xcdtpNBdFUYGzFT4qQqlwCXphyyELWW3MR7hnv1dYta1Qxc9RK4L4OH7dlnRvc2RH9smNa
	IxFoJdbb13gs1UakHQOsR+y0BEsQoKhavRJ1lXxI8iGZH3SvhUIZNBxqaRpS+uSD1//o0q0oMV4cj
	YsZH04k+/8jvGYDdsEYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jaCXX-0000UY-8q; Sun, 17 May 2020 06:12:47 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jaCXT-0000TN-7z; Sun, 17 May 2020 06:12:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1589695963; x=1621231963;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dZ7xDRy+NDRy9VrDiWRcAask7gO6JXYBEm3+7xuYEVc=;
 b=oKJR8uN+hWkqiTPJauYmjMZ+u+Ao05o+6k+DIqKRpc0WM+wIIseZmfus
 iSYaV/tYBxf1lVGmYikuZJQtRfCxVxpoO4WjEacVtC82tJYU9jVufXKVL
 HadD0i4Ow+xaUXYqeg4bRzWiHhsJPcZJLmK9EI/Nhi+IAkt1gf0OkFUTg
 UdhNvAe7TF16b2kl75HoJbyr8BYYSCylMKx//Jp6/ha9NTRfbVB/iMpyq
 wNOxovcbKj/B31tavZzOjLBMX22MeV6CSJQCDUd2KTP0tZ8keayLuTRy1
 8y0MX1uQ5udRAzS/GGYzjMkO+iSFqqkA1fkAuuxsuamn2wCgCle3hH3eJ g==;
IronPort-SDR: YPIGDOFbQR4wwZU2/37k7OUjuS7kvB9oQZcuKIYDBkzZYWYmJxivtklO03oPN9XD4zU+Fgfbud
 vhktaLO/UjgrgoM9EbeSPs3gzJRYF2PZ1m+olu9SyOzMu6d/2re+g4lk7m4DTgpf94bCUPfacm
 QGDHue5+R56rfezUbAe9ln0ZHhmQFFHtIB++ZlYsOqKFJ2D+/QaNSkC8ZeiVDR6wwnEpP4/pH+
 FUPp8CLEXhAH04f0mrDiNwLx3LwkN+xMN6H7zlXzSKp4dYAWU6NJKiE12us2qgqY7w3wg8WSDW
 sUQ=
X-IronPort-AV: E=Sophos;i="5.73,402,1583164800"; d="scan'208";a="139303402"
Received: from mail-co1nam11lp2175.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.175])
 by ob1.hgst.iphmx.com with ESMTP; 17 May 2020 14:12:40 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OU+DACGenf8zDVztRNkEBoZqM3w0h9oiirDThHt8Gl9yGbLA1E1VIuCh08CNnHhkiwAbidReF31HPf6PfBHSZoNRNhHKsr6lm2zooQbESVsW1YTqt9dMHxGBu2b97/2nGHQQZybAxyNVRDyjHnZjbYt8bqEQPU1TKQcm5Dk0X9mC+s+LPnPR8D074weT/iIg4gMefL+TUMDT3uyQYNPldCMXlp3oXj9B6nYmxnoFOkLHFqaX+ECQUJ/oH4rcLqWz7+IWqbvlootnHulQw7PpPBfLmDS/h2/FhAKjDcAOmjBn3KXJ302gZ4UbNq8+720EPs+cAOq4qKs/Ym7SiSU9Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZ7xDRy+NDRy9VrDiWRcAask7gO6JXYBEm3+7xuYEVc=;
 b=AmDbA3OmkTrDBtvall6pKBQxU5mjKJrOFVFYVtmjSeRqapgQA3oSXvTnaGOo4ob/bOAEOWE4DyGaLtBt3q7qSjRi1ltlEJv2C3m3dexd/H8mEIW/9r5kIQSXe8qsrEp4BA3afeKrwAmAO74vKeGCMMOW1IthDtp+reNSIwaBoC0i/b69yY7CJsd5REAI6yRr3HPfT+Ux0WHrnov8207ZJMginrgXQGO/V8U6+6H6tYnFqHJ11JQUB/fJ2fS+gR3ptlIOLn254IhP6df1EgQcpf1Mve50Yt/XaLueLwUE5UoA2L1Gtsxi09Krm3ZEl4VQQXCu1eoRpOXHVMpnC3o0xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZ7xDRy+NDRy9VrDiWRcAask7gO6JXYBEm3+7xuYEVc=;
 b=OOVCxjsxRcBwZv8M0iwsywg6RT0uMcsMwhuonJMfsHIuOwTrgHWDHFOLXSX1yc0pqBHyXFGlBN30yjHyWje4WG6vSsWaVB04sSNf6sdFwTw2dOwvwH6ztBmGb/MvBCUf+kBJRtcmewrYwJJGFTXa7dX4XBLraW9y0g/gIOHsD30=
Received: from SN6PR04MB4640.namprd04.prod.outlook.com (2603:10b6:805:a4::19)
 by SN6PR04MB4351.namprd04.prod.outlook.com (2603:10b6:805:3c::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.25; Sun, 17 May
 2020 06:12:37 +0000
Received: from SN6PR04MB4640.namprd04.prod.outlook.com
 ([fe80::9cbe:995f:c25f:d288]) by SN6PR04MB4640.namprd04.prod.outlook.com
 ([fe80::9cbe:995f:c25f:d288%6]) with mapi id 15.20.3000.022; Sun, 17 May 2020
 06:12:37 +0000
From: Avri Altman <Avri.Altman@wdc.com>
To: Stanley Chu <stanley.chu@mediatek.com>, "linux-scsi@vger.kernel.org"
 <linux-scsi@vger.kernel.org>, "martin.petersen@oracle.com"
 <martin.petersen@oracle.com>, "alim.akhtar@samsung.com"
 <alim.akhtar@samsung.com>, "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>
Subject: RE: [PATCH v3 2/5] scsi: ufs: Allow WriteBooster on UFS 2.2 devices
Thread-Topic: [PATCH v3 2/5] scsi: ufs: Allow WriteBooster on UFS 2.2 devices
Thread-Index: AQHWK6nuV0cbBolOlkSPSPwHxTr6fKirzNTA
Date: Sun, 17 May 2020 06:12:37 +0000
Message-ID: <SN6PR04MB464093981353EEF1A5F6E3B1FCBB0@SN6PR04MB4640.namprd04.prod.outlook.com>
References: <20200516174615.15445-1-stanley.chu@mediatek.com>
 <20200516174615.15445-3-stanley.chu@mediatek.com>
In-Reply-To: <20200516174615.15445-3-stanley.chu@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mediatek.com; dkim=none (message not signed)
 header.d=none;mediatek.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [212.25.79.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1b3e97a7-2bc0-4261-a018-08d7fa294c70
x-ms-traffictypediagnostic: SN6PR04MB4351:
x-microsoft-antispam-prvs: <SN6PR04MB4351DDFA4CC02077DE660296FCBB0@SN6PR04MB4351.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 040655413E
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YbDd9VfwYeAW8MvJkNwp5EYWFV+/3QvIiLbzN6p5COKnPRnj+JGOkmWiQi3amcapBaG8Hd1mzf2cX7J2wf/rLMivFhHGnv3vN67aFmShoJBeWdSGFMR84rH4kPwbhFJThDnfYbiR7ysjSO0bJWOpoHqwPvjgBLjW0UsQvVwUGmhd3Yd+XHUISlIfmUldaxeJ/Bqx4YKlshkR1uDL7r3uY0O/QKGN6JM2NZhSe73AfUY29EE/Ji/R5kyj2g+rv2Aom5V7jH0iCUgUc2CDbOLxWhUYJilOzKnBv6+GN9VjJVfjfksnpgphqhwMLB5B/eCaPZJ/k2Lx6rk756qy7NkuPZY0He/TbIvaDgh223M446/6AAQSjXDyFABO6ibGrNa/5adpYCozG1zuWXe5ywABsc+Op2Ug9MiAl3OZWi+NxtIIIjBzk5J3H1bU3/DnyNTt
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR04MB4640.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(39850400004)(366004)(396003)(136003)(346002)(2906002)(6506007)(33656002)(52536014)(55016002)(54906003)(71200400001)(7416002)(9686003)(4326008)(86362001)(7696005)(26005)(110136005)(186003)(4744005)(8676002)(316002)(5660300002)(66946007)(66476007)(478600001)(64756008)(8936002)(66556008)(66446008)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 0OwEKp35sr+eShAE3NeqRq64oSQPQlNOGDll/r6VWK56c8HnxbgHTR19zDP/52NWl6jRP3V37aCuXFuuCROGiwgfeTONgiNRnD9b7ORs3olPAZL2GAeL67w8QbwNdSjONbkhggKSNRsCKjXsi/pZRWg9lrEJtDS5uPpBgBNsbAAOL+tLeBTxXylDo1V2PtXr5U0MDZV7soMJPQQpjb+X0A+ZNpIRxqcGi9+gk8MfECDSdKDf7MJp+/HNxE27of1b2j4Re7Sb4g0kAkawvkczsY2r+1maL8/2SsovR179eTONBqAQqbE04lwKx2hhahrAmeiaS/YsSzOJSofGh6pLN+isVUXv/7g8JkG965tc+7IKEoaA259PQ1ZNG7AYCNc3x2lXyrufkCgf8QRdH9F96y2hzKYfkWNT/AsgUPNDtt1ybp8UE5VidiJ7396vvjKpPJHolfnEj/O4ZK+bcCYNHOssBn989G5m4dVgBnzIEc0=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b3e97a7-2bc0-4261-a018-08d7fa294c70
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2020 06:12:37.7977 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j9zH/svPbWPht0NNHSwCZC4EqfIpbcMRD8tUnDWQsNMJQ2D19xC+6cKRVrsFauekty7m/Hnw5yFYWjTJmiGEdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4351
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200516_231243_378706_8A428C19 
X-CRM114-Status: UNSURE (   9.72  )
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
Cc: "bvanassche@acm.org" <bvanassche@acm.org>,
 "andy.teng@mediatek.com" <andy.teng@mediatek.com>,
 "chun-hung.wu@mediatek.com" <chun-hung.wu@mediatek.com>,
 "kuohong.wang@mediatek.com" <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "cang@codeaurora.org" <cang@codeaurora.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "peter.wang@mediatek.com" <peter.wang@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "beanhuo@micron.com" <beanhuo@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

 
> 
> According to the UFS specification, WriteBooster is officially
> supported by UFS 2.2.
> 
> Since UFS 2.2 specification has been finalized in JEDEC and
> such devices have also showed up in the market, modify the
> checking rule for ufshcd_wb_probe() to allow these devices to enable
> WriteBooster.
> 
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
Reviewed-by: Avri Altman <avri.altman@wdc.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
