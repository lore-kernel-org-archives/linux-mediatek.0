Return-Path: <SRS0=6DyL=5M=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A31C7C43331
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Mar 2020 09:24:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7547D20705
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Mar 2020 09:24:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NQe5YX3V";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="AKmIrwlo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="gtilrnv7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7547D20705
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ReSZUNJXDIEIx1MmSuL9tuCH4SxZGEr0FPls36B+0U=; b=NQe5YX3VbI2+Ag
	VltDbOdIyPkz0LaGd453JqLgsemx3H3A3aSn5P5FAJ/a/mdOLV0yvaBCN8RIUN51wYXNqxbHIP32g
	vE0JwmgATpEs+RlYHN+vzgKsiQfZx6IeOOHgv6XvD8HCVtV3F7mvaRfbCKvu6mmrdwpfdngS/o0w2
	p4jJP74aZjH9V2ruvwT5ZQEhCtdJVvz7S7bbrpke+noV+PvkBvyF9WaA80bqyJ4lZin1Mh9ArzKXh
	MastJJK+nUF+OU+r2yy0YjbmgqphZcuWiWnFKORrm/Ebzsxx8hYLeALukNvi59pjeo+JYurhv46/b
	NSMeLafioVBTx/0mV5EQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHlDl-0002OF-QN; Fri, 27 Mar 2020 09:24:09 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHlDj-0002NY-T6; Fri, 27 Mar 2020 09:24:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1585301048; x=1616837048;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lDo/TSlkBXUgR3cgb8CY95Hs7rhKZIA0K1QveVkZAcY=;
 b=AKmIrwlom69+QE4JkW88LS4a4wrz27HLXmlgGRPRQMXoGw+edg0RXB9m
 8Hi2Ms64YHLdVvticRE6jNHYDE+otxMU7mirtm3mJdj4B1z/coGhvXPBw
 EuqHparyeNdLUwjsUtunHoJgq4an0UdEHhPOPtKeYGiACOlxmTn4Tiqdh
 r0a68dv/GL3xytdOCHAhGRlheuG/Fvy4ldzsFFYyH0K3OnXZ1AwzaohSh
 5r0cemcWrDBo5bBmfBvxQnl214sKw7LEqluAwtOxtdAXIGGo2e/XJA4mz
 9ebvV8YBZk+g5zGe4/YBpCl34erOrjTVq5Fsy0Bt7IHRPlLGecdW3FwdK w==;
IronPort-SDR: TZfSMZhkqogl972qsRXk5w2y5PEqUeP/6Ap+7G/P4ovh6W+qFg+8AqjHscwY8NjNxDq3h0uM5P
 Bj3XA9QVc9nPp7KgsFWISKfpJwLJevgqeNxmXBAuYjB6gnRFFU3C/uh46VFsx8trdqsZMpaHIf
 RodDiiAzC/oWOX2kiueTJzQex0dEt8gZ3EUaZLdpTyW65llRDCGqNXSjgG641YoeT+NPYdlpvu
 4w4jLjoji7qQ7QouACsqjPn+rfy1vMTCfouf0P9cb7xlVp6dcgNK6kOyI/r3OrZmsE43Z/XUKP
 Axw=
X-IronPort-AV: E=Sophos;i="5.72,311,1580745600"; d="scan'208";a="138050358"
Received: from mail-cys01nam02lp2053.outbound.protection.outlook.com (HELO
 NAM02-CY1-obe.outbound.protection.outlook.com) ([104.47.37.53])
 by ob1.hgst.iphmx.com with ESMTP; 27 Mar 2020 17:24:04 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YjVqbucOBoFFR3M51SeypvF6HEKTEDyU5Jr26GUSnpF2GjTYZdukDJbLH0ru7oFPwj0s+q1b8sjVj/sVR4ABwupT7Z6FuZnUyTRi6Zj9r2LIq2JMC0JtYQ9JPl/hsSX3v7jhXoww+UXPNcTyBj21nwdT7gMyjBKz2jfAgHcHKXjLjKzerF6qeiHyl4EeTS17o6RkvHZTdhA4+Zva4c29TUy+/1n+KYmM6n0kL0qNxjqH67ZiilbC8pFtqqZ0ig13kKop6iygQ5teMK7Yd5WDDZt80QydlaC8mTZ0O02sOnAr+bU5GTRsnLbFYRPNidn6uF2o3ENjfflfYFiGnEVP4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lDo/TSlkBXUgR3cgb8CY95Hs7rhKZIA0K1QveVkZAcY=;
 b=S+W7Bl2k9nwdNU4FFCrlrlQnF5MapRvyUzU9vKD+68bjD5spvVONfz3RAq3mYZc1+Z0n6/9RogMjcApJzbA1V8ZN+osYRIhq9mxgsZLW819tOLCfh+J2+jUSoIL8pFyqT3Dl0G1vsvRY+NVDZ+gRhQ30ZX5pYDsUQLrFGHvVNgQAIOxe8YAYcQ2Pn2s0vqepHqOVx5/ID2QcpW4ORSUc4Rr1gAN2v/eI4ClXHge0oci6t4J57gKPxK4k0unDm3nQs+3VwTgnIeCJlAa+s7Jx5gJEpp38dkrgSs+jwIfVVLtsc+Y3B7GdnVIYjNOnuE/EUhMn2y8RH58gd2+RvY+Hwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lDo/TSlkBXUgR3cgb8CY95Hs7rhKZIA0K1QveVkZAcY=;
 b=gtilrnv7bgbOXem8Dlc2pbYHtGwn61pXTQtXt6eSSTWo3QKwBwhmBjDLo7g3SUtvvUerqTKfwyrAgh0wZ2MsIaG88hyXdsoGCx6v1j0+nv7YSMDwQqe0bs8BqoplkN3/UESvuFkUjKeZQLQ7hGPmdm4mbMxx+5u0MsjSyCi0Ps4=
Received: from SN6PR04MB4640.namprd04.prod.outlook.com (2603:10b6:805:a4::19)
 by SN6PR04MB4061.namprd04.prod.outlook.com (2603:10b6:805:47::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.22; Fri, 27 Mar
 2020 09:24:03 +0000
Received: from SN6PR04MB4640.namprd04.prod.outlook.com
 ([fe80::3877:5e49:6cdd:c8b]) by SN6PR04MB4640.namprd04.prod.outlook.com
 ([fe80::3877:5e49:6cdd:c8b%5]) with mapi id 15.20.2856.019; Fri, 27 Mar 2020
 09:24:03 +0000
From: Avri Altman <Avri.Altman@wdc.com>
To: Stanley Chu <stanley.chu@mediatek.com>, "linux-scsi@vger.kernel.org"
 <linux-scsi@vger.kernel.org>, "martin.petersen@oracle.com"
 <martin.petersen@oracle.com>, "alim.akhtar@samsung.com"
 <alim.akhtar@samsung.com>, "jejb@linux.ibm.com" <jejb@linux.ibm.com>
Subject: RE: [PATCH v2 1/2] scsi: ufs: export ufshcd_link_recovery for
 vendor's error recovery
Thread-Topic: [PATCH v2 1/2] scsi: ufs: export ufshcd_link_recovery for
 vendor's error recovery
Thread-Index: AQHWA4BerP2CIkNwMUiOubR0qnVvTqhcK6kg
Date: Fri, 27 Mar 2020 09:24:03 +0000
Message-ID: <SN6PR04MB4640DF2D1EA1B3D6AF6C804CFCCC0@SN6PR04MB4640.namprd04.prod.outlook.com>
References: <20200326150747.11426-1-stanley.chu@mediatek.com>
 <20200326150747.11426-2-stanley.chu@mediatek.com>
In-Reply-To: <20200326150747.11426-2-stanley.chu@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Avri.Altman@wdc.com; 
x-originating-ip: [2a00:a040:188:9054:d519:d5ac:475d:740a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f1afb3aa-26f6-423f-27fb-08d7d2309715
x-ms-traffictypediagnostic: SN6PR04MB4061:
x-microsoft-antispam-prvs: <SN6PR04MB40616EB2B8B4221BA8D84555FCCC0@SN6PR04MB4061.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:2000;
x-forefront-prvs: 0355F3A3AE
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR04MB4640.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(4636009)(346002)(366004)(39860400002)(376002)(396003)(136003)(6506007)(66476007)(9686003)(66946007)(66446008)(558084003)(86362001)(110136005)(52536014)(66556008)(186003)(64756008)(7696005)(316002)(5660300002)(76116006)(4326008)(2906002)(54906003)(55016002)(478600001)(8676002)(33656002)(81166006)(71200400001)(8936002)(7416002)(81156014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wmyWZtH0CrmrsJwPIYvOblcQazCjJ1ACTRHmreSRkEZbDdOL8Pq10NRnKrWftlYE90yYyUddGHynhudfOECi9UjauLRcGTR3YvzmKZar7xadmNXOX6INTAJ188+53lO9HGh+lrZlFRz+scwxqmnTUTEiQ6PtjOJdS7/t8VPiKM/OI3YM9PuQ9zYPyRuRc8uW4qzPGtbo3jCbEmNJzx2Z2I0se6noFA97EKiczBKk8C/4fK3f8lipMcFQZXW76/TpHT9WTXHGyn1+C8uHPNNtDl2T1DcZS5yuFe299o/uYhxCjhHjfVjKejvRmbbvi1oNauj1M6InwpE0mznSKIQ2R5jnypOeSKCrWS/0Azb4+Q/TifO4mAb7LAzrHO4m51UpELGbPehwciGTlil/EZ3TN4eZ0hNFcAZoCWDC3yOumP56P4fS5oyEr4N880ya/iwn
x-ms-exchange-antispam-messagedata: A6vVVzeczgErC+z0TsrQbbTXQ85Y2tUlToYOP1pvRogQkwV1jQRMNeXeLM4ohC3u01TnaT5RcaVcFohjzQZlAAIXCrTXR5EBW6XzAh0P563aPjS1n3b4RSykJ5VXvo6siWzDMyT8YjkLVleuYNhin9yxk93j65hGvZFB+01pAqtqt8YDHdXNPcC40MZ7EWNhdk2SmmAo2vHeoiH3t0bn7w==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1afb3aa-26f6-423f-27fb-08d7d2309715
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2020 09:24:03.0384 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ffeGwl3cYM/qg0WVq0HENWD+B309QI3fBqPJqsNOG7pR5qOvKofoCamJ7fEdOwomz3C1qUozTZvOz+yiQsELUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200327_022407_952286_DD309934 
X-CRM114-Status: UNSURE (   8.09  )
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
 "beanhuo@micron.com" <beanhuo@micron.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


> export ufshcd_link_recovery to allow vendors to recover failed link
> in vendor's callbacks.
> 
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
Reviewed-by: Avri Altman <avri.altman@wdc.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
