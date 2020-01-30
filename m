Return-Path: <SRS0=00t5=3T=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_DBL_ABUSE_MALW autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 935A5C2D0DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jan 2020 17:46:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 649BD20661
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jan 2020 17:46:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rF0xvlXW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=micron.com header.i=@micron.com header.b="1yf6UXye"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 649BD20661
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=micron.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VH1Hd67vlEpaWGvl5ktTwhARyeoI0Ha0WYgyETQJv8I=; b=rF0xvlXW2IdfkY
	vjd78s3O/5I/CIAqpRh3RZE3aMH8ofsgbUnQpUI9KLXOnC0EpR32lUPMfYmZ5ZFlZrhsShF2Uc3f4
	IzY1pVg34+xvJMY9YZxrbQfgZnpiMHaQR/QYjiURLon6W4DV3vN5cK5A1hXAfL36AQrhxt+nrlTlB
	QmDs7xjb3xsDvc45ullFLcb1bKXit3ZxKmdrlN//KtqjrYt4Dv8a7t01uKHNvVupgmgVbE43otILd
	dbzlVfr+KpRlBrtY5I7zpF61/lwjzT4AU9MeH0v4egE5iMWxa7/Vj3yjVeyVa/U1bxJdLz78iM8XH
	F/LBOqf8elZSqqsLYyBQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ixDt3-0001lb-95; Thu, 30 Jan 2020 17:45:53 +0000
Received: from mail-bn7nam10on2069.outbound.protection.outlook.com
 ([40.107.92.69] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ixDt0-0001ky-7T; Thu, 30 Jan 2020 17:45:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hTfTz4Wf/Me47SGJ5Ocy5MMeTonahR8GCX1/vnF/hBecMrXDCRP9TMISSTcWNsqIs0VWMrJa4IeyS8xaa/Ai89G8BKGkRqWfpHZMlLkBEgeIygc5xlB/CzV76dcTJDTm0j1Y1nGZ22ZrPCAz/4VPOagMDjzlGzXk8mJoLAUYiCvhZQn3N9gDzZxvpOyZ7/L19H6fyn5cwNkwWONnTiTRBsOY6lnpFXalCkARiJkmtAHANLlEmxcxXIxbg8/wOQQV9D538FPXlUIMwQQ/6J6BswFXnLEe9mfU30L+ZcSJykSc+QnFAiFpNpOL5bGxsqO6QmB57rsOcLHa2xzvB8SaWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8/JnzXaOOoCJiiMGaih0Wb8tuXqF3Ptj5bX8IwG3mDI=;
 b=Xf8/c9L+Y9sTqVC/BQuq+ac9T0LIByR835eC12YG5WvfifFJllyNGjmkw9zWMyLVNd/kwELWtHTP0MV0Vqe4moH9uEqzDWXpkeLp0DMax/GThu6thzj/kNNmgjLAJBEyeqAbAWB4zeUMVZVHVSUvg75XpjmgSvOjPwz+tx0odMb0JPHRCHv5TKle0CkSMC/Tky6q2JsuJq3mgbAp6Mswd54JdNIgUTwEhN+xsolOFSJx9XnnOzsf5aLHQHx5Rzv7+23gktFqf1WyQowy9NRiv43SqshMZrH5jZ6VC8Upq8bvrrK9gI16/qZ+7AatWSG8B5QIQjwSqe/mutux9J7bcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=micron.com; dmarc=pass action=none header.from=micron.com;
 dkim=pass header.d=micron.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=micron.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8/JnzXaOOoCJiiMGaih0Wb8tuXqF3Ptj5bX8IwG3mDI=;
 b=1yf6UXyeVnEDqGcxxRbRI98qEipPp8DJufjae1mhfZPW0N/Nqusv8I0nZ4nCtCNXdHmFxHu/cDUQCrmm0NoWm/UKnyK8NppUz91zGY+7B2TUXM67GZKmzpVkbuZlcEfmKWiaFhzrFRdE3ELlJZcOLsWnvF2eOHFfi7yEQFMO2V8=
Received: from BN7PR08MB5684.namprd08.prod.outlook.com (20.176.179.87) by
 BN7PR08MB4468.namprd08.prod.outlook.com (52.133.222.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2686.27; Thu, 30 Jan 2020 17:45:43 +0000
Received: from BN7PR08MB5684.namprd08.prod.outlook.com
 ([fe80::981f:90d7:d45f:fd11]) by BN7PR08MB5684.namprd08.prod.outlook.com
 ([fe80::981f:90d7:d45f:fd11%7]) with mapi id 15.20.2686.025; Thu, 30 Jan 2020
 17:45:43 +0000
From: "Bean Huo (beanhuo)" <beanhuo@micron.com>
To: Stanley Chu <stanley.chu@mediatek.com>, "linux-scsi@vger.kernel.org"
 <linux-scsi@vger.kernel.org>, "martin.petersen@oracle.com"
 <martin.petersen@oracle.com>, "avri.altman@wdc.com" <avri.altman@wdc.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>, "jejb@linux.ibm.com"
 <jejb@linux.ibm.com>
Subject: RE: [EXT] [PATCH RESEND v3 1/4] scsi: ufs-mediatek: ensure UniPro is
 not powered down before linkup
Thread-Topic: [EXT] [PATCH RESEND v3 1/4] scsi: ufs-mediatek: ensure UniPro is
 not powered down before linkup
Thread-Index: AQHV1pJHfu2kpVWabEi+eWXlrU2PdqgDfLbA
Date: Thu, 30 Jan 2020 17:45:43 +0000
Message-ID: <BN7PR08MB56845828CE1FEAD6A5CB4E61DB040@BN7PR08MB5684.namprd08.prod.outlook.com>
References: <20200129105251.12466-1-stanley.chu@mediatek.com>
 <20200129105251.12466-2-stanley.chu@mediatek.com>
In-Reply-To: <20200129105251.12466-2-stanley.chu@mediatek.com>
Accept-Language: en-150, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=beanhuo@micron.com; 
x-originating-ip: [165.225.80.131]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 70aee559-bbbc-4e77-a6f7-08d7a5ac3ae9
x-ms-traffictypediagnostic: BN7PR08MB4468:|BN7PR08MB4468:|BN7PR08MB4468:
x-microsoft-antispam-prvs: <BN7PR08MB4468BC2C8AEE22FDF405101BDB040@BN7PR08MB4468.namprd08.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:400;
x-forefront-prvs: 02981BE340
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(376002)(136003)(396003)(39860400002)(189003)(199004)(55236004)(6506007)(8676002)(5660300002)(76116006)(26005)(9686003)(81156014)(81166006)(52536014)(66946007)(66476007)(66556008)(64756008)(66446008)(71200400001)(7416002)(8936002)(186003)(7696005)(55016002)(86362001)(316002)(2906002)(33656002)(558084003)(110136005)(4326008)(54906003)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR08MB4468;
 H:BN7PR08MB5684.namprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: micron.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: X9utKxbvMKmAEFPz5gIfMbt2ouNJjrpEdtHc+VNC0llvECerTrFnMa66r3aJJ7o6ijLLENnynQdn6NqMMnn/9bc/JVBdvzMB8WdQEaw/X5Oxpf+f67CmE1ZrFGpVxlCZ6eoU5Bb5qfPOk5Jdiy/ixtw1GQCMoiyfWFWZekPsCqEYDtP0Xg70mJ80KVhhUgOhE8/YPZvKca9rLKKN8B0ERdyYtlMMXofUah3O5A51IdetTjpf9/jMTndWb+5L5WtEUP6cIBqBDcEmtYAeF1YHIwHil6IAlUf5Gj54lRaWcK/I9Fw5FRC1pX/Fk/pL32yj8dbd2MsSAyZU8s8QFKcE10qUJOFl+yaBWhq8Qtiu2lQZEe5qUGkw2Tp1V/EgQmHGkJfKRCAQ7aNYf6WwbPvcBUywz5hFwlf4s8k455iJXyUImOhdRttxx5FGHXL03XZN
x-ms-exchange-antispam-messagedata: 9/9k4avfESXSpqfopRcl2Fq2n1OLX7Pk7sWWQNOgVTTkytontykB7aV6gFCGW7LDKZ19fGnIwIr6CpH9enbO7OPyBMFjsFXZjiZbyYNq6qmgvPZhd5KLsrnJVTIoDrlBijqPlVn7YB7/OEvUYABl0g==
MIME-Version: 1.0
X-OriginatorOrg: micron.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70aee559-bbbc-4e77-a6f7-08d7a5ac3ae9
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2020 17:45:43.6251 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f38a5ecd-2813-4862-b11b-ac1d563c806f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +lcqulMvbDhiLT9n2SQbjAMO2WyPhwBiOE6ZaBaLVOongPzjZMUeAaNOyJ5krOtcNDZtfq6Ee+RcjTMkTZjR0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR08MB4468
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200130_094550_322670_F0F68626 
X-CRM114-Status: UNSURE (   3.84  )
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

> 
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
Reviewed-by: Bean Huo <beanhuo@micron.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
