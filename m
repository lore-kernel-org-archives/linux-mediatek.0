Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD9E7C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Apr 2022 08:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NXCODqB6wx5czd/Q458Ebw5lGoswJY7Fxkima0obdbM=; b=ha5ei7pwJnDc73
	v14Z0VYfBmGEyWBHzrEXm09Xs25Pd37udYJ1x9TG+V6MkyWTs6XJBcPZf8UAx28a3qDDNWnpkwHzt
	qi6Bkwiz+x4GlTXF2xyaNM8uSf+5uV339Sxj7uU+ckqaxFzkiLRCBZQreyrF0mhP2MADnLjmTt7Fk
	dVXuBayPCgwlQxVGQ7FkwLeFmAMJiILGvGhnAsg/QoLcp44TBmqR/5i4bZNoFSxQmk2YY29X7MM+Q
	0IYO0Q0/0U9Z9sNRodjrqX2FQOrVlf7/d0gbPCdwxnynpuchSs+jz0JwA6XXcBfqQTSa93ZePOKO7
	PqGtvHF/bghxaASvsDDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niuCf-008lLV-E0; Mon, 25 Apr 2022 08:36:17 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niuCR-008lIX-KV
 for linux-mediatek@lists.infradead.org; Mon, 25 Apr 2022 08:36:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1650875763; x=1682411763;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NzxyihzEYNmMUHNnUEM793mn7vYl4ClLEYbM2n7fJXg=;
 b=cVS/iB5jX6zFkqISSF61/lCuRs0bKixOGvOXsdEmeCKqKsSp2i4QnWKX
 foSjrvz+oaJas6wynUIxlGn3E2L9XxFnGuSI3846qYCFGG6JpuwPhdbNf
 NQBRkrjxqnBItLsCTCcsmgy5GYN4JCTdoW0xjmvtx1rBybzjuzbsXTd5B
 xxPqMaX6HYiJdWIef9OdEDCrBv6P9ai421l0VLBwWdTRQvKu+CXYp3y6Q
 0nC3Lt2Kw8ASJAFu84qdnKmp7hVIGjtbtvmSM+GVqtj5431ep61udqhiu
 TuRy+iMrgTL8h+KqDTs1po2Qrn8kfu8ttkiJqt/ByDQ2zbUHfV9OZegfH Q==;
X-IronPort-AV: E=Sophos;i="5.90,287,1643644800"; d="scan'208";a="203606779"
Received: from mail-bn7nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.109])
 by ob1.hgst.iphmx.com with ESMTP; 25 Apr 2022 16:35:57 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g8dNvIL/s6xkiscTC3FXf7CSJF1EoJ/SGBI14K5jcoGQ3Xr+eDQEtnYHeRcXxqUSCDy1oLkwAFuPiiWYqK/y8skrMKMv/3ZXhucUDjgbUa0W4l5a88EFB3vZbvww6hmC5hUf+ONcDCwOpSioSJCrPGN0o0R7u/187ATtHK9NhwncHTh22mLbx3HokrtLop50UKGf1zvBRfWCw/0dntfuaDOUsgnldXjLS3zzHRA9sNUimf/NUe4xLjjNJujijWriedC50D2J9YrIC0BBtfkTEE3TmpF2mO2W7btOWxylUQCrKWzuYNeCOwXxhsvDqPK1HpA5+N21UKoMcwQESnFIPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oe6t7Yk2ysTBgw36eSFCTrnwsbuds21iFiXmkWT362E=;
 b=BJ/CyuMVxNI46LPfPyoNC6j5hCa71qPLMF+45eFiS8p3Z2R6b6JnKxQSibMMbU2113M4bh4eLTSh8fHfhs7XDWSVzTFg+2aS+NS1X7GHrvLrRWHeT8bwHBHlbYyFF9APeZcTteBPkIKoDwae3VCgr4yIo35ygjf0urqWdKj9zIJMjssmSqSv5FrRqDpxGihXN6exxzBxRHTro8oAQIjo1I2MF7vrjaOijx0/9s5kMM9U6Yr3Fz/1OswrgKKzI/Gv6pdjhieHCk/RKPuFqpYEbQ+nPyVIK+dwynYz2kvwIL0L5lBih+Ukq7iRKdvK8ESg0aUl4F4My2pmk9Zb8/Zj/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oe6t7Yk2ysTBgw36eSFCTrnwsbuds21iFiXmkWT362E=;
 b=F0RHn1gx97iXkGQ03CT6kHdJLNLk3z2RIAHm+iItw3CxRpsROLpYPk+nPx8ZbHVUiIEUGqZiBkciSh/JZaAtW08WaIcSEm9+ZH5argubzvhn4wCDsuPIdmoIVcDkRLiqxYzG1bCVyUBk5LJqPWyji+BC2aW1/xR/apNZ94E4FOc=
Received: from DM6PR04MB6575.namprd04.prod.outlook.com (2603:10b6:5:1b7::7) by
 DM6PR04MB6202.namprd04.prod.outlook.com (2603:10b6:5:121::33) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.15; Mon, 25 Apr 2022 08:35:55 +0000
Received: from DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::b049:a979:f614:a5a3]) by DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::b049:a979:f614:a5a3%3]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 08:35:54 +0000
From: Avri Altman <Avri.Altman@wdc.com>
To: "peter.wang@mediatek.com" <peter.wang@mediatek.com>,
 "stanley.chu@mediatek.com" <stanley.chu@mediatek.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>, "jejb@linux.ibm.com"
 <jejb@linux.ibm.com>
CC: "wsd_upstream@mediatek.com" <wsd_upstream@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "chun-hung.wu@mediatek.com" <chun-hung.wu@mediatek.com>,
 "alice.chao@mediatek.com" <alice.chao@mediatek.com>, "cc.chou@mediatek.com"
 <cc.chou@mediatek.com>, "chaotian.jing@mediatek.com"
 <chaotian.jing@mediatek.com>, "jiajie.hao@mediatek.com"
 <jiajie.hao@mediatek.com>, "powen.kao@mediatek.com" <powen.kao@mediatek.com>, 
 "qilin.tan@mediatek.com" <qilin.tan@mediatek.com>, "lin.gui@mediatek.com"
 <lin.gui@mediatek.com>, "mikebi@micron.com" <mikebi@micron.com>,
 "beanhuo@micron.com" <beanhuo@micron.com>
Subject: RE: [PATCH v1] scsi: ufs: fix rpm racing issue
Thread-Topic: [PATCH v1] scsi: ufs: fix rpm racing issue
Thread-Index: AQHYVY4DmBC2sx1NOkWUjWbGNoYYn60AUzHA
Date: Mon, 25 Apr 2022 08:35:54 +0000
Message-ID: <DM6PR04MB657564C8412643B2D2F5E40DFCF89@DM6PR04MB6575.namprd04.prod.outlook.com>
References: <20220421144152.23888-1-peter.wang@mediatek.com>
In-Reply-To: <20220421144152.23888-1-peter.wang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 08c88c51-6dfb-40b5-989c-08da26969cf9
x-ms-traffictypediagnostic: DM6PR04MB6202:EE_
x-microsoft-antispam-prvs: <DM6PR04MB6202A8D2FA8076A4C094AB46FCF89@DM6PR04MB6202.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 00u/Gk56EcvJT7ZsAspVW5kxJi9WBQ+6OAwQUWoq787ERoaSL+W02wJ42aNcthD2/CkCy7n0qMlXrt6lD9HXqCPNp0/4zkQGeHbH916e8gfOT6OYFfAxgour4uLz+aafOB14k403SKrctB0Ran8AagYPQEBt9cFsMvcZwwr15QkpiYFslvC00CS5nF9OGVwtoMxm5NKmO8CN2p+R64nXwFlOjC8NZ1VVGzy5xq3QNVMJliSg5Nua568iPb2OHQ5P0LvFph0geJydmeWHcAuZ4OK25PMNCQK9BrTLVBvx26ercE38+cLiDdLiGMU68tC/tNfcEPo4q6bFEh5PS7hD5ysMw3wrx0r/WIDPwDk35RK12G+sQxfBogXNNqROEhlHVFJt+xJZ9CX94vYTujGJI3Dfv1tzqHsf4L8y9tjdRk6AM3UUef8U0h9SO3Js9W5rspzRGObeOIx9yKWaSG/FWw8DXsxxXWvDWYB/RToqM5n2FkPDJyDm9eXzbPQSccNUt5gi3qDfz0/wbome1QReL5Fv4MxUfkdaPzB5sXcL9ts2roXCfh1n0cM+jY/IBOJM6rRzUDH3JhhdHFF0aaee8by2GLJQ5jZ++nKy6omJM6NvNbRnC3QPPh9UhBalZ5IwtomX4M9C7dmO//qyY8vr1P1qdsASRiWOV0qswUB83L4zdy9BD12FTmo+J1s6JmubIBERWhJU99TeM3EvlmOa5Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB6575.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38070700005)(2906002)(33656002)(66946007)(122000001)(38100700002)(55016003)(71200400001)(5660300002)(76116006)(316002)(54906003)(110136005)(508600001)(82960400001)(8676002)(26005)(86362001)(83380400001)(9686003)(7696005)(6506007)(8936002)(52536014)(7416002)(66556008)(66446008)(4326008)(66476007)(64756008)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2FBICts0aMBQPFU0zPjKOUgtfPmZKxAzkJAky5sRDhW5epUnZjKyP3v80Qrw?=
 =?us-ascii?Q?elTUJuUO0xP4cYMHHAB2KC3GGNp1prZPTLaM5jo3iGHl+dkTlMy+9Jbn3a/y?=
 =?us-ascii?Q?nulrUQRxLFvlKjGCPOsMN1LP7maJ1x8Ds4wNoLcVLU7ufT0xLTHcmoM5Dm6T?=
 =?us-ascii?Q?hXM9C/S6jgvsLIiV74b5Y8jDLZZLeKkoyauZgmxMYpq+US/Tom8+WxCoI106?=
 =?us-ascii?Q?iUMisAEjUONmkp3lEe8Q4iX0yeLjRyZuzuimUhVSJo+9Foa9Z7sThOT+Uz+4?=
 =?us-ascii?Q?k+iexj+YxQlguh5cxdUM9ZaXA3NLJcuFxJcArSllkPxzcjd5C6+IGLzJWYgK?=
 =?us-ascii?Q?kOAzKUMyQbCdAjxVHzbP8/TeNPNV8sXhil9hV/y9gWfKVbTHc93VkWAgO/xw?=
 =?us-ascii?Q?T9/n/bjAz+Hz5qX/YrJQdyNt18IiVqAOsko7uYMONSYpCFnISu5sqFxfy+9Y?=
 =?us-ascii?Q?tnqim+96WxQCfimcaSk06XF9ICrRc6L80cRUkxm3lO/ka7qRGaYygC5L0nHy?=
 =?us-ascii?Q?rAviy8TvbsR6TR8ng3aqKat7wjCueUYA4JD8rweGUKWnBwZjYiKKoLMtypFF?=
 =?us-ascii?Q?RaSpdMw0OLge5hFWg62GjTvrdvUp2uPPe/hOw1nKDnK5oXisTRZ7lMSfPD9Z?=
 =?us-ascii?Q?6SV/CzUlrceXgPb+vhrDrVYl+nnQ9tPVjIay0c3PL1yNBRzXU2ex5bxQ2zfs?=
 =?us-ascii?Q?KZ359+dcTFq2+w2dOXZmjBIDplfXbcJeoRX5sPDZLYbA8EeWXQGQUFWEe+dM?=
 =?us-ascii?Q?8g8cuRHgxnnRqSK2VJRPCpZwVISEvT+YDhPB75Bx3IOj25B6YaMKKzKfsoeq?=
 =?us-ascii?Q?2zzezLXIg+wDo1BHu84hDtrHG7Y0l3SX25EegcLGEN8C3wOw0LPrBEDzQ1vn?=
 =?us-ascii?Q?VS0+FQDIPzKyo/StKPvnmrcgaTixHI4UNBdxd6rB0BO92l6iNl0JQ0HGLJL5?=
 =?us-ascii?Q?KX4soo+CQKNtln9wtwS5YOs/ZMu/YBptXrUmkBYN0JlDKhLjnSPZszXosmNB?=
 =?us-ascii?Q?/imlU8sm7HN8Z/cOTR3TAsF+bh5D+6Z/+0CTjRcN8/1AEez/ZvBH1VpSZTan?=
 =?us-ascii?Q?VtEsona+g5jD+uXHtRyjn9LTtRUTeV9iCN+CkFQUltWx8EOBQvEdt1/t4Gym?=
 =?us-ascii?Q?xiwiowOwVF7jqXWTGZSn3Z01rRi8y6KKGHdoC1qg6qTn2X2Zl7CRAOJS0WXo?=
 =?us-ascii?Q?OGkyPlPIUL6V8Uew3AuaRDa7Cb12xSw4HzQ8UHKtpiBme11GNynoU+E1oU1t?=
 =?us-ascii?Q?UKuaYnPjdANogXjD08ObAM+YsPZiQpADVf7PoajhP1umEgJ2eHACh9s23duU?=
 =?us-ascii?Q?P7JHn6ZvsZFM5tDI0AoyK+N9sIlyvyPbY0zYQzOAT+J4mdwaIX9ghOeVaogY?=
 =?us-ascii?Q?Z0aer/uVjYYJZMoxYx/dhYkxWXoSG7Em/H0qnS5OzgiZ7LecVpt2HgcZ3Nih?=
 =?us-ascii?Q?9tBGXroz1ezSe3udh3ktt9q05OYjnWayc5F5BUFmSOZa7AnpTQe+PWBEnvPW?=
 =?us-ascii?Q?BGb7gpbH6SMR+9X1YpDDLxMT9Wb9jmGEa3ae22a2PDEEb1ITIcuecb5tKISW?=
 =?us-ascii?Q?aMTT979LzqdoOaSBx8rBMPgS/+/53uD4QOI9KEj0gYJlUz7LFI0HjXF+ypp1?=
 =?us-ascii?Q?OblwmfnD8SvxMXZlpmWk9MTfCL8QEgmAXCIzaQgfy0wuvYnKhgsuoh5Mn7Ol?=
 =?us-ascii?Q?H85pddwdNsFfUoEVf0kFSEbTrSTtB6lrWq8b8LLuFGVNC683qFT+HqC1nJFp?=
 =?us-ascii?Q?tqfisqPROg=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6575.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08c88c51-6dfb-40b5-989c-08da26969cf9
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2022 08:35:54.6743 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q8q94vmQZBnmXtzcnsOS/sjapSTEgnegyHOWexZjX6Rdp5BgGpoS4YeHxz0xcrQ+0To98hzV0VB06aJXgoWjlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_013603_955215_46C53A79 
X-CRM114-Status: GOOD (  19.36  )
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

 
> From: Peter Wang <peter.wang@mediatek.com>
> 
> Device WLun may enter RPM_SUSPENDED and the consumer is RPM_ACTIVE.
> 
> The error state is
> Device Wlun RPM: status:2, usage_count:0
> Consumer: 0:0:0:49476 Link: rpm_active:1, RPM: status:2, usage_count:0
> Consumer: 0:0:0:49456 Link: rpm_active:1, RPM: status:2, usage_count:0
> Consumer: 0:0:0:0 Link: rpm_active:1, RPM: status:2, usage_count:0
> Consumer: 0:0:0:1 Link: rpm_active:1, RPM: status:2, usage_count:0
> Consumer: 0:0:0:2 Link: rpm_active:1, RPM: status:0, usage_count:0
> 
> Because rpm enable before rpm delay set, scsi_autopm_put_device
> invoke by scsi_sysfs_add_sdev may cause consumer enter suspend
> immediately.
> Thas will always set rpm_active to 1.
> If driver_probe_device invoke pm_runtime_get_suppliers just befor
> previous scsi_autopm_put_device, the rpm_active will change to 1
> after pm_runtime_put_suppliers.
> Set this delay to avoid scsi_autopm_put_device enter suspend immediately.
> 
> Signed-off-by: Peter Wang <peter.wang@mediatek.com>
> ---
>  drivers/scsi/ufs/ufshcd.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
> index 3f9caafa91bf..1250792d16be 100644
> --- a/drivers/scsi/ufs/ufshcd.c
> +++ b/drivers/scsi/ufs/ufshcd.c
> @@ -5024,10 +5024,14 @@ static int ufshcd_slave_configure(struct
> scsi_device *sdev)
>          * Block runtime-pm until all consumers are added.
>          * Refer ufshcd_setup_links().
>          */
> -       if (is_device_wlun(sdev))
> +       if (is_device_wlun(sdev)) {
>                 pm_runtime_get_noresume(&sdev->sdev_gendev);
> -       else if (ufshcd_is_rpm_autosuspend_allowed(hba))
> +       } else if (ufshcd_is_rpm_autosuspend_allowed(hba)) {
>                 sdev->rpm_autosuspend = 1;
> +               pm_runtime_set_autosuspend_delay(&sdev->sdev_gendev,
> +                       RPM_AUTOSUSPEND_DELAY_MS);
> +       }
Maybe remove ufshcd_blk_pm_runtime_init from ufshcd_scsi_add_wlus,
And call here ufshcd_blk_pm_runtime_init() ?

Thanks,
Avri

> +
>         /*
>          * Do not print messages during runtime PM to avoid never-ending cycles
>          * of messages written back to storage by user space causing runtime
> --
> 2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
