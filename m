Return-Path: <SRS0=6pE3=3C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6C60C33CA8
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jan 2020 09:44:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 778802075B
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jan 2020 09:44:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LPkfLo9F";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=micron.com header.i=@micron.com header.b="er1ahzjB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 778802075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=micron.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+OKzNXX44FoED4h/CWj6iRqFA2MHzG2l88Dbs1q9Xu4=; b=LPkfLo9FGqdX2I
	gw3w6neqKnOy9hrgbONp+ir1FqnyRIiuxxamSfTuIDEZvXzyrL7M3Fr0gStcg7zDSsKN6OvMvFoO+
	WE23zawVfaCqQS2s67Cq4dtPioaAedYJcr6kHM+tdLW36iSdIWGN+mBzQdT/44TzPhIVdXUh9JQHC
	aSKpPdRH3qXsBtwSRa5ry+hmd3yR9IgyqjNe/YiTDa9tVM09AHU3Plc7PScw1pMX2G8wpoNv9659N
	0S2ArFFdwul4wj6cB6OzLF9MTlhuDvhwd30H5zjdxWtzt/ns3BqJV8rc3BWKUPK4MF4BM2AX/zhmp
	B1qPn0LGn9wX+gBp2qnA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iqwH6-0000m2-OF; Mon, 13 Jan 2020 09:44:44 +0000
Received: from mail-dm6nam11on2075.outbound.protection.outlook.com
 ([40.107.223.75] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iqwH2-0000hX-Ia; Mon, 13 Jan 2020 09:44:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VvScej00ZsoW47UGrwSkryP1bOjCZyNXw6sxvIQ3NIdihys4mrbbKjZo7d3rX+aLAZl2OkiF009a+MpMPNN7fRGXTFxfqONrZYl4mh7eYAVZN+5ofu3tKukGtSpaTD9dqdRv2RSGOXk6Fe6xTfigQWD7peqK/NLYJxwVqt7klVGdiPu3r89oO4iwx5MqSDLRn5eRQqYqBnSU8LhhIXvO0/N7Uag9xhKck+lP0XqfTwkRDv372Qmf9KblwjbVJoRwa37wpEIfTfj2t71aal4FkLgyZ5Na6eFmV7NEy7+qF7RnIrugeVMOgassqV3EuA6r7+CwRbv9uiYjskVbMyq1iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vrn2vrA6QdFtV7H0v9twX9CkrTKujOjP92xTsjpqw6U=;
 b=GD5tBedt7vEqRxa0htp8rklm4Ittp8EOxelOz1JqSjwA55PgbI759csYXh/jJvxLLWNt8xdLs3/ipcr3dL50jtij7BhJyzGxAivPbBctu3LLgNUBYL04n9bZvXdXEO6UV7blnP7XvdtUqfNXEPgiZ1Ezv2Y8HltA0WWs9WiMtjYCkwI3i9dkz68XAgi1ykcHW8eDPkmBDXqrhfFFutIs44zbcfKzX0US3gjSR8vPoSfCEaJ9r95kJWowo7HHvzvs4fMEnRrBc2IDS3kbmwh30nXHOE3kLHLB7R2obVoKGszxjOrBtEUERL9Db+3VoM8T+Nifykq0bnUGd++x8rYa6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=micron.com; dmarc=pass action=none header.from=micron.com;
 dkim=pass header.d=micron.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=micron.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vrn2vrA6QdFtV7H0v9twX9CkrTKujOjP92xTsjpqw6U=;
 b=er1ahzjB9BeCXcLMnOLyVcCMb+4j4XjlhIBpHhgEvqR6xjlfJmuGk+kEhAhEBXNXvdE3kxG2eMNHWLn4d8DmObEvAB8Kg4ohMH9ZeKtv8poTe9bPaDy1tsYFscFDEd+ix4oQiJXcHPYqQe4eG1ChT2+nPiDhRIWDR1qX+WICSK0=
Received: from BN7PR08MB5684.namprd08.prod.outlook.com (20.176.179.87) by
 BN7PR08MB5602.namprd08.prod.outlook.com (20.176.28.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.10; Mon, 13 Jan 2020 09:28:49 +0000
Received: from BN7PR08MB5684.namprd08.prod.outlook.com
 ([fe80::981f:90d7:d45f:fd11]) by BN7PR08MB5684.namprd08.prod.outlook.com
 ([fe80::981f:90d7:d45f:fd11%7]) with mapi id 15.20.2623.015; Mon, 13 Jan 2020
 09:28:49 +0000
From: "Bean Huo (beanhuo)" <beanhuo@micron.com>
To: Stanley Chu <stanley.chu@mediatek.com>, "linux-scsi@vger.kernel.org"
 <linux-scsi@vger.kernel.org>, "martin.petersen@oracle.com"
 <martin.petersen@oracle.com>, "avri.altman@wdc.com" <avri.altman@wdc.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>, "jejb@linux.ibm.com"
 <jejb@linux.ibm.com>
Subject: RE: [EXT] [PATCH v1 1/3] scsi: ufs: fix empty check of error history
Thread-Topic: [EXT] [PATCH v1 1/3] scsi: ufs: fix empty check of error history
Thread-Index: AQHVwwrtYdyISOHmvEWfKtFqbPPmzqfoX2LQ
Date: Mon, 13 Jan 2020 09:28:48 +0000
Message-ID: <BN7PR08MB56841F049CEF89CD8F40B4E3DB350@BN7PR08MB5684.namprd08.prod.outlook.com>
References: <1578147968-30938-1-git-send-email-stanley.chu@mediatek.com>
 <1578147968-30938-2-git-send-email-stanley.chu@mediatek.com>
In-Reply-To: <1578147968-30938-2-git-send-email-stanley.chu@mediatek.com>
Accept-Language: en-150, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcYmVhbmh1b1xhcHBkYXRhXHJvYW1pbmdcMDlkODQ5YjYtMzJkMy00YTQwLTg1ZWUtNmI4NGJhMjllMzViXG1zZ3NcbXNnLTE2NGQ2YTRlLTM1ZTctMTFlYS04Yjg4LWRjNzE5NjFmOWRkM1xhbWUtdGVzdFwxNjRkNmE0Zi0zNWU3LTExZWEtOGI4OC1kYzcxOTYxZjlkZDNib2R5LnR4dCIgc3o9IjcyMSIgdD0iMTMyMjMzODEzMjI2NTMwODEyIiBoPSJmZnZXcE9SaG8vbE5UaGdMZU80a2liVkkyTTQ9IiBpZD0iIiBibD0iMCIgYm89IjEiLz48L21ldGE+
x-dg-rorf: true
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=beanhuo@micron.com; 
x-originating-ip: [195.89.176.137]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: de57875e-49f9-416f-f4d8-08d7980aff06
x-ms-traffictypediagnostic: BN7PR08MB5602:|BN7PR08MB5602:|BN7PR08MB5602:
x-microsoft-antispam-prvs: <BN7PR08MB5602ACB9B450085C8A2B44CEDB350@BN7PR08MB5602.namprd08.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 028166BF91
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(396003)(346002)(39860400002)(136003)(199004)(189003)(110136005)(76116006)(54906003)(5660300002)(71200400001)(316002)(55016002)(8936002)(2906002)(4744005)(66476007)(66556008)(66946007)(52536014)(64756008)(66446008)(9686003)(6506007)(26005)(33656002)(7696005)(186003)(4326008)(86362001)(81166006)(81156014)(8676002)(478600001)(7416002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR08MB5602;
 H:BN7PR08MB5684.namprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: micron.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: l3bQM7C/Wey/RyCIbhg+2MGMwXmUci9+lHKnf781iXlLvpOW2Yu+aGXQVWtVGGUBe5lv+RfhPuYMxRmsbXmSzkIoIS9o2afpy0N/dnyXbHlrBjdCfHwrMT/GTOI9xPLjE2dvAED1iFwUlqdR66JfPvEx5WCHvXWHiZqSzB6C5mS/gDDqtBQrZ8fVqbpgxNNGioNLgNYXX6iq2+phh02qyCwbyCuAACdimPtrmVwmXxZVmt0Q71of6UBlXONnSAYhMrp6NwhPSu4dQE7082g2XvmlhoKx1Z1U5TdiD4fwjOEGxF6wR7QxH6pElQHBMNwNLcpWG1xmo8bDNs8cenWwnmcZF6oxmvGgVLQUzbzgaoYMHMPcSOFMMPAidxbtWoadvsrPj9ThW1OZvP8Dd2Uz19YJnvXLg1+EvOdxaocIo9EpQNjF396sjWA+YpxuRJ4i
MIME-Version: 1.0
X-OriginatorOrg: micron.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de57875e-49f9-416f-f4d8-08d7980aff06
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2020 09:28:48.9509 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f38a5ecd-2813-4862-b11b-ac1d563c806f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t+kPiOd+knDwDKxxYxfX3vzXUCuMtWhy8NduW08tBNl1ROqCKQgNcL0uVN7LdVUvnHE7aLk5OwOZrMu3J1AvmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR08MB5602
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200113_014440_654844_33B56E17 
X-CRM114-Status: UNSURE (   6.69  )
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
 "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Stanley

> 
> Currently checking if an error history element is empty or not is by its "value". In
> most cases, value is error code.
> 
> However this checking is not correct because some errors or events do not
> specify any values in error history so values remain as 0, and this will lead to
> incorrect empty checking.
> 
Do you think this is a bug of UFS host controller? According to the UFS host Spec, 
If there had error detected in each layer, at least bit31 in its error code register
Should be set to 1.

Why there was an error happening, but host didn't set this bit31?

Thanks.
//Bean


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
