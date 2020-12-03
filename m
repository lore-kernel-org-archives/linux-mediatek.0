Return-Path: <SRS0=jUzJ=FH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3C7BC63777
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 07:32:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4539220B80
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Dec 2020 07:32:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4539220B80
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xu/x8wraVTyxwRnTPiTyVSNN6qdJG1e42v+WRBWHsSE=; b=b8LyhnGkJhOJspjGjkXKJtdE4
	RkmJv/QG2pQzT7I2KCIRgIwZiTZUBy3x3dZH1gYgCoWo61L2sR4Iq1n7K2UeR7e1+14+3g/AF+/T9
	ntCQWnO4fv2zzq1j9fwma5rXV88OtewJBjabhFcvjK/reW2AeOAkIVabM7izIAELcNkdPuncjhtM8
	kHbw7qfqLo/cOCBqb3hCrfbXAq9w8omlILHpZLPqY45DiOXGaTZguTh4b70guxHrUF0B7ILsNyTUB
	an3zHVrtpCM/YqBqQvPh1nFCUsgaQqgLxGF5ji5c8gagyWwxARDzvM5HDYhUNYBF27CcXiG0yC/EZ
	a9VdKfAgg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkj6e-0004qD-8t; Thu, 03 Dec 2020 07:32:48 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkj6c-0004pP-Cb; Thu, 03 Dec 2020 07:32:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1606980766; x=1638516766;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jU7Eu/zg5rGD3h62lZFLmO0BAMOM1TQ+VuowiiJUUuI=;
 b=RMNNugf7LUbjUWjHNexnEgAt/q2DlA01I03rQ9rsVcA5yLYjuFCbIVN6
 1i1dYMuogUal4iXSUn3Td4/v9yHSgYwuYMp9+mBpF3MgEC6JIeYQhiknx
 VS6woBkYjuCnCsn5bSVFTSnefbtIJsW+Yhg6gpv9yOxV78TSB+aMGLB2c
 jjhEpr9crMovKH/nZqwzyyJpiCbO7itsCb4Ni9psHQRccEUsi7KKQd+7d
 5bLS3uobQyy6lsJ8PazCA1O8SFSuu3qBW9rSGP+t3Hp+UGNwnWuY2ymr2
 FO59jC1bJAYWqViEw+YZjlfDQQSYfrQpvDiu8MvyiqeSR+GU7rCmC6vtH w==;
IronPort-SDR: HSUqNm7zBCGczFvxMd+9L5HcZ0CWNf7+thKnHhryg12p6sYsmisCoBXFiM+aBzEDyd5a4ZYaTB
 4njXXXwLjgNv9PY5cwKR53WbER+ZIK8fLZjn9l9gV4d9HutBemKO2x4jVmgJWbCRTfIIFFNnAC
 JXiQ7EgYol+yYnOm2edooNPnPQZo9i24N1uXmPT8uc9a3fUxKWmmPq0lJDCEMo4fDgm1zKCuDz
 EA5+aCuXnO4/YXK/cOH+CKcZxCk6MBOonOaOV37sBi/cBfY0VzJxy2IRk4DkykN1kBn6FOxXob
 XnQ=
X-IronPort-AV: E=Sophos;i="5.78,388,1599494400"; d="scan'208";a="154301987"
Received: from mail-bn8nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.174])
 by ob1.hgst.iphmx.com with ESMTP; 03 Dec 2020 15:32:39 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ToHDyLCSriwhVMVk2pHXAND6tAJ6BLSxpO7yxibca2ntNYD7FZYi8iJglMqR2gvCcVNsEagiSK47o/RyOA5ABHZZwB0ZnN4JhbVnNokI9NQrQJ+7kh5Sfj3EUqicjQd4sqjzY8Ler2ejk3eKuIwF35yWwOGBJ670aPc1Qd0yz+OSNFxnmtmnYHi5uwY7g/KozYMjCMudT6qyVb0mcocYdjFnYwR53hghlfOLimr9hP69WueUXYaUgisIlEXsmEwNf0fAVhVfyYQWW1KES5EjN2kXNjFQ07xvFQAY7JDUFGwFv5CCqkLfZulQbMdj/0SJnLsu7vxHNhYQ9kKmPnL9SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jU7Eu/zg5rGD3h62lZFLmO0BAMOM1TQ+VuowiiJUUuI=;
 b=h800dKTdNCiaaSK3m3qsKKx/B9ntW1WF1+eX9cVpthuJdC9So0PERbSbqUU1hk5+54xeo5WKzFHK/0Qb47xB5lWQObNf9QgjMM3nCvryd58cAuSGnXoUaCTlm7EulJYql/I34KxW6LUpPE9yRSe338NrBkU/Wc7MwtVk3DcS7nVBc+maIh96RSkv5qhJ2MZHjWSmFZgFMPcLWhXVJY2SlPWs4YnCBKDeQbZObFyFlws/ufJO997IBgh0erYuUGrWPZ5CRMqzIiYfH1r2V6HTnp0RS++52Cefqj8gNZcsOK4Xalj212/6oP7H1WV5ZL7hE5SAfNA2qIjouycZ3cco7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jU7Eu/zg5rGD3h62lZFLmO0BAMOM1TQ+VuowiiJUUuI=;
 b=jacM2e/ibwpuxSBN3B8i+PWsxVSguKUZdCDWC2C6PH3SwMNGjJi5ofw9lzUgztRitLhQpgKIIoftuVtK5oCGP2a2RLBnCHdpx4wuEhZIEjX+8e58h2QxOma012gJDq+two85nPD9xzqfu2qdQmedJbYy8bWWIZCdWONXqH+NCT8=
Received: from DM6PR04MB6575.namprd04.prod.outlook.com (2603:10b6:5:1b7::7) by
 DM6PR04MB4025.namprd04.prod.outlook.com (2603:10b6:5:b0::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.21; Thu, 3 Dec 2020 07:32:38 +0000
Received: from DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::a564:c676:b866:34f6]) by DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::a564:c676:b866:34f6%8]) with mapi id 15.20.3632.019; Thu, 3 Dec 2020
 07:32:38 +0000
From: Avri Altman <Avri.Altman@wdc.com>
To: Stanley Chu <stanley.chu@mediatek.com>, "linux-scsi@vger.kernel.org"
 <linux-scsi@vger.kernel.org>, "martin.petersen@oracle.com"
 <martin.petersen@oracle.com>, "alim.akhtar@samsung.com"
 <alim.akhtar@samsung.com>, "jejb@linux.ibm.com" <jejb@linux.ibm.com>
Subject: RE: [PATCH v2 3/3] scsi: ufs: Introduce event_notify variant function
Thread-Topic: [PATCH v2 3/3] scsi: ufs: Introduce event_notify variant function
Thread-Index: AQHWyUVm8rnWGgoro0qetzZlPwPQ0Knk+f1g
Date: Thu, 3 Dec 2020 07:32:38 +0000
Message-ID: <DM6PR04MB6575600BD1D02C7B447948E3FCF20@DM6PR04MB6575.namprd04.prod.outlook.com>
References: <20201203072443.6663-1-stanley.chu@mediatek.com>
 <20201203072443.6663-4-stanley.chu@mediatek.com>
In-Reply-To: <20201203072443.6663-4-stanley.chu@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mediatek.com; dkim=none (message not signed)
 header.d=none;mediatek.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [212.25.79.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: fb0591c7-bbd1-41cb-4255-08d8975d9c40
x-ms-traffictypediagnostic: DM6PR04MB4025:
x-microsoft-antispam-prvs: <DM6PR04MB4025C1779BB25C14AF57CE68FCF20@DM6PR04MB4025.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:983;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dpWoVYpARZ7lBcZV4n0sUXETnWJbKpNGUtUfjrN6GhDCe/pUGlkVXa16U3zK26lJrsHppzNLuP0KJWMLORU9v7IfAmLbzaWBlvd6DsVXqy0frNOhDhLBysOAONtD6s4oKWZdPr7LQFe9D5aRaYRpuUEFWQo4UuSuTqMzjWnar3KDPpKWsDh3W96PjC/twqnlAp7XjTe7H+FiwaIrJ6CT7rQXcHBo/X0eFOLptYCkhppkTcpp9e9BSrrCHYNi2hU+URvxwbZLHlRBOiv4XHfPN8Dl8uX7Rc1KqmFYBt92U8Y8pFcknWLTkXQti+NKohjY
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB6575.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(396003)(346002)(376002)(39860400002)(66446008)(186003)(26005)(7416002)(7696005)(33656002)(64756008)(5660300002)(6506007)(478600001)(52536014)(54906003)(66476007)(558084003)(9686003)(55016002)(76116006)(66946007)(66556008)(8676002)(83380400001)(110136005)(8936002)(4326008)(71200400001)(2906002)(316002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?mFENUHTqnoCzYL7DHY5J94iX5Ydi1WDKYNBiOIe8tqY4Kus5f2fpib2WbV7v?=
 =?us-ascii?Q?fCaBwtdYIR0pfh5DsuDPUPlmanp+eUUJjmqiF7nkkYuTH8/MEo91y8+EYnj/?=
 =?us-ascii?Q?MmdI/lzyyBJt6HsgRTd8LX9IbYvwgyhUVHXHdvLIqr1kbx2SlLJyoKikq5uU?=
 =?us-ascii?Q?1Mqz/4E51850mZAAbkDN9Y9mfOb3osq+f82fp++SAFh1422DArtYGWVinBID?=
 =?us-ascii?Q?a5NNnqxL5EIvKiq28VplCMk6dJ452py5rW6Wvitn4RUjzUAvRZV9/Oo/jxmz?=
 =?us-ascii?Q?93BOdCqQK1R33xf+ZHHqcbaVPK+KdxWcI4Obm03roF56okqdSqZ+ZPoczAYZ?=
 =?us-ascii?Q?ElzPzWGZWNpPO1nIbTlZZ2ZpvmnM1+az252LQvRUZVsUS67TG8Q2xOpRhvE/?=
 =?us-ascii?Q?PCRTS0RAOTlnozTnQlHEbjZeJPAtc1SQ37W3sz8liOhQztcuwyLX6cP0cWdw?=
 =?us-ascii?Q?9dOMInkxeQZw/aq/JJ/KP81aD7+EBzCl/mirjyDHrhZuQIKvFqK871VhRJ2g?=
 =?us-ascii?Q?NxDLUainF46ESSU9VFUCxsE/QFBxgFf+/gKgAvdEjLWuS36Gdrza0ftDvbOH?=
 =?us-ascii?Q?YSurb9wxnSJpmC8oIag9rRb8+9wnjs1oKDV7htrEj1As7IOLSwiw9y/QloH+?=
 =?us-ascii?Q?AkgSvpoJNjBSRtESioQEMfgvxMDm10TEaSnuK1cZX7L7La0LR8Rpv1CczfFp?=
 =?us-ascii?Q?PV24k62mg9IavVosEMEsjpxNi7PkvIF3wS72q1XSj6B7ygWSfYkRi1Vsp1UE?=
 =?us-ascii?Q?kNyf91UmPB7rdtoKUwXetpsoh/cdkoShL9EAjgb8qd0yo44faiR8581OI/ii?=
 =?us-ascii?Q?pPiaGqFDpduENw1hZ4IzUpTUMTc4QUzkxVN9FDKPZybTP9zxvCV8CFiui/wO?=
 =?us-ascii?Q?h9Nfzy66UVZOuLGGBcTHXA739AnCZdKUvkczrYKX76S3wW9YbNO82aP0Kgcj?=
 =?us-ascii?Q?I8SSgWXusuFZT8jl6CjOor5YVF2dZShPtokUgrU9w98=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6575.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb0591c7-bbd1-41cb-4255-08d8975d9c40
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2020 07:32:38.1647 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t6vQMtJ7eD6hAsP6OtGVRaS4UQe6nw4YHEcMOMdW1Xs0nR/XV+wAvfDTQpJLOnHDGPjb1mjKdM1gbBd0kzy/pQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB4025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_023246_596035_DFF55129 
X-CRM114-Status: GOOD (  10.37  )
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
Cc: "alice.chao@mediatek.com" <alice.chao@mediatek.com>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
 "huadian.liu@mediatek.com" <huadian.liu@mediatek.com>,
 "andy.teng@mediatek.com" <andy.teng@mediatek.com>,
 "cc.chou@mediatek.com" <cc.chou@mediatek.com>,
 "chun-hung.wu@mediatek.com" <chun-hung.wu@mediatek.com>,
 "kuohong.wang@mediatek.com" <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "jiajie.hao@mediatek.com" <jiajie.hao@mediatek.com>,
 "cang@codeaurora.org" <cang@codeaurora.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "peter.wang@mediatek.com" <peter.wang@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "beanhuo@micron.com" <beanhuo@micron.com>,
 "chaotian.jing@mediatek.com" <chaotian.jing@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> 
> Introduce event_notify variant function to allow
> vendor to get notification of important events and connect
> to vendor-specific debugging facilities.
You need to add an implementation of this vop,
otherwise it's just dead code.

Thanks,
Avri

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
