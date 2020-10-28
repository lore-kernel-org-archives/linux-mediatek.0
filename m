Return-Path: <SRS0=7lD3=ED=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B13FBC4363A
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Oct 2020 06:18:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F090122202
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Oct 2020 06:18:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g7pCbngs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="LpktiY5E";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="G4Jdmdv4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F090122202
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=D6H31d2JIS930BL7FFJccqneCR1tYXIkpT2abSPGaOs=; b=g7pCbngscxeVkcIgq6IHIdfRk
	fj3KS9pwt2X15/bj/El2bNaa21aGgHz4wWGbBvDiZUXRnuEQS70JA95wMGKMzMCJ00OocuRt92Yti
	Y4QZLY/8puaa/E8dwOlDl55WJpwDZj6yV8W+A5fdyQaF79zRnFRp16PHPZCHlthSL8MMErJth2F7y
	SnSRg0qoWkU7HyMy2vvTp3kUfGRD6cS3Flvk+TTfecUjesnwraFEprluGuSKH/3rN/K3U9r7kz/mS
	5A+//+k++6JJLqTJYp6xAksaGZbz44VZy2nJBNCoUGo2bxyqCpmvIuJAlyYQqMOFdKKZK7LL8caWX
	3QwMECK4A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXemC-00031G-Ft; Wed, 28 Oct 2020 06:17:40 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXem7-0002wt-9E; Wed, 28 Oct 2020 06:17:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1603865855; x=1635401855;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=F4Kj22dih+xJ64WFMR0YQ70w86ss6eci4Y+/IQoFkNk=;
 b=LpktiY5ExBYX2/LdnIIFkomBj6lDcvmTIiXqnV41ggUCARWLlmBqIdGl
 Ajtx+K2J2538VwK6ys0jnTqk8mkIwpmG6jvP7mw5eXUKkU+3O64xROuxX
 kuSQ/ePDQfgxz6Oij2gQdcy8yJxvjbt+OuM6sRe7KrOOjQGhyoXHNY6hP
 yNCIkM1wNr/brL3tDjmP5EKYd/5P3kWl9K5OQRmkrkC7x8IEab0MlBzEi
 kf6cybc1cfnAKFsdRf3ThM6/ICUnGLfzN3UIiyaMQM4XNFd5I/wPgQ2ar
 uS1MuOrGL/qNzf12rLRiDO8Z9qxlFCz9uU1ESnEN8Lt2UhCfPPOvrwLY0 g==;
IronPort-SDR: 1Zxrz0iOyKboVhtE7Cxs6roayZBak3I6lcfTt8FAM3LsQ4CFCguQWlymrhw9C3MDBMM4S7ADWf
 hJDpf+qq88ohSueaEk1iZikaBFvVLb/KZvT38MVfhI1PnZ775RYECBeeQjJUaHvNgfSU4q+LaM
 6k4AclbmW2DNvbMGBjd61xc4FxOllD1G9peQAcIc2is0n7x4HtZSvW8DaaqDykSMHUT9kzPVDj
 LlVKLdyyEvk/ceb9N+9VzVYSTDLp/QwQrV8GMyYdyTbImfkOFrGmXfM/M0WU9TZLiey/gRFCDE
 ZVg=
X-IronPort-AV: E=Sophos;i="5.77,425,1596470400"; d="scan'208";a="150991861"
Received: from mail-bn8nam12lp2170.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.170])
 by ob1.hgst.iphmx.com with ESMTP; 28 Oct 2020 14:17:30 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RBb/CC6GhWEKozCa1WmAyDpvHbMm5VJgjCArAOsB4war0pijXP+iwub7TOeRqkybIYRlIfCXE9R2at2hXYzYdf1qfYIaEeB0pSfJYXPBf/OnDvqJRhYSEHKvAqLbFfo2/MLdHc3alE7xNygs3qbPEwBRpupTqBeRFXBva/0Ssj+H+WaxI1yaQuBzy8Njl76g3G5NvPyR/CIlj2JKhYvnDlYUQVafdFymZ5uvhOvl9msTWQ7aCh/HIsE9zfG/RktqNEQ+giyCF9NMW+ONxMJowqPZERA/uFPwHqqoQv2ocuhAezy3p8gixQ4yggqDXv0cEsrDTZeSUbXKhft13cIX8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F4Kj22dih+xJ64WFMR0YQ70w86ss6eci4Y+/IQoFkNk=;
 b=GrPeIoQu8qjCuERI7TMLos31qoQRP3WAY+U9QXW9Z+5YSvFyjGZsbih7n5DCFScVunCg+62FL5am50iISmdoLxtGpDSnnbNIKwCXBAS/Q71anl5qnpWVSWEOIKUbAHlSWGocw2j18y4160roRDQPMJyvS3zjLtbQCHsrv69ceHii2uFa9XBVj1NuYDx+xBlmeerCJdHLefZU+QNyq/8awn1LFoe+kxQDEfYqQQnu1WErHnIdoQl5NuE7RKJXlYZFcjA6xek/kLiYnZU3ucY6k66VNHqUnOf//ZvbDa4khh7jRlga28YBGdCzsxhT8J9jp5kqDMphYgurqkLmhovgtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F4Kj22dih+xJ64WFMR0YQ70w86ss6eci4Y+/IQoFkNk=;
 b=G4Jdmdv4gCzSNClcj2JxgSjUyvyiov1+IIVRtFCOx06gwZDO7WIlNKLEHtfuIvIYBklPnV2BRihg5SgxBwZGokkwZz/39xPlQ+5Qzd6il4BMTNBWeeMnGGZwhJMOKDl5aNyvqmjjhDd9lDN0yefw7arUEkmesR18cKQz4A8LBbw=
Received: from BY5PR04MB6705.namprd04.prod.outlook.com (2603:10b6:a03:220::8)
 by BYAPR04MB4855.namprd04.prod.outlook.com (2603:10b6:a03:4f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 28 Oct
 2020 06:17:28 +0000
Received: from BY5PR04MB6705.namprd04.prod.outlook.com
 ([fe80::709c:ec54:b10b:2d90]) by BY5PR04MB6705.namprd04.prod.outlook.com
 ([fe80::709c:ec54:b10b:2d90%9]) with mapi id 15.20.3477.029; Wed, 28 Oct 2020
 06:17:28 +0000
From: Avri Altman <Avri.Altman@wdc.com>
To: Asutosh Das <asutoshd@codeaurora.org>, "cang@codeaurora.org"
 <cang@codeaurora.org>, "martin.petersen@oracle.com"
 <martin.petersen@oracle.com>, "linux-scsi@vger.kernel.org"
 <linux-scsi@vger.kernel.org>
Subject: RE: [PATCH v2 1/2] scsi: ufs: Put hba into LPM during clk gating
Thread-Topic: [PATCH v2 1/2] scsi: ufs: Put hba into LPM during clk gating
Thread-Index: AQHWrJTlfEKccjcPoESRicEUo250QamsiptQ
Date: Wed, 28 Oct 2020 06:17:28 +0000
Message-ID: <BY5PR04MB67051A587A7A0EEB5F26C295FC170@BY5PR04MB6705.namprd04.prod.outlook.com>
References: <52198e70bff750632740d78678a815256d697e43.1603825776.git.asutoshd@codeaurora.org>
In-Reply-To: <52198e70bff750632740d78678a815256d697e43.1603825776.git.asutoshd@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [212.25.79.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f3c6f0fe-e163-4665-79d0-08d87b09256e
x-ms-traffictypediagnostic: BYAPR04MB4855:
x-microsoft-antispam-prvs: <BYAPR04MB4855FCA2CCF1ACFC2313A19DFC170@BYAPR04MB4855.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:364;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nqb0eYpc5k6u/xpbLkO49anhsMQ9gfZY2377bZmoBK64h9jTb/M1fpruoNU7R9AV9BjkgdABBuupiU8W1xYFBgDyJJ5sN8vPA8reLpsFbqobrw4c0tiCmXfgidHupTRLdoAzy5FsjwvXZ/mr6yhknCfFp+L/MD5zOXE4Yt9DPzG0KJcLGlHiA3MzrCXGNM5cbujXywjztYRPKGzJMyGuWUmcFQ49nbRK8IpeUdlDUefgnLK3zm5P+en/pMcGVEh4ZwKsenIhDXE4tRjg+QpU8IE/TatNb/TMt/6S1eBLdY8k5abyhdDlrWzYJ/OCL7tc6lbLwPX1fWGcRYIVFfUkJA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6705.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(346002)(39860400002)(366004)(186003)(26005)(6506007)(71200400001)(2906002)(8936002)(7416002)(9686003)(33656002)(8676002)(4326008)(316002)(110136005)(54906003)(7696005)(64756008)(55016002)(66556008)(66476007)(478600001)(83380400001)(66946007)(66446008)(86362001)(5660300002)(558084003)(76116006)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: XeZ0fnbpuCKxbxvrb5fq+tr6r2k2+cs2E/qtNQ8EVf1ofY0mtdvalnG9EqyyhLx8snkzl2+Nk6YO3LIhgCrbtwbELK20NBFwq1lmPe2C6xrG8EsGD6y8hP6zRovb5GkPuYZEZzT42sca1mwGQtSlUgr6vcb5oLJPznqES+XmyE0eiBWpi65rhcvXDkfS3AlInRVdj3fU5eEmM9Hen3a96JoS7EUpC9/yyVb+MTncgYUF25YpOi98B1wD/BUcnh3ZIbNpmZPXVDg40T+VLSqDP+x5kVI1VV+DxBgKzIScguQ0WMpsrRhThJXuyzhBskayGkxzT2+SUBZpNU3R8bsMH3FOWkaqaNqKOb7u+C/w1T4dl/2gPAfS3SNVCau0dQUMuivE2Ob6uAtv1YBlCpRxgB5Vsv+pyLcc0nf+Kybe58WtzjF85Y8UJ3OwcpElBGjDYfPuHQ+xHt6InRozuWYbSb0J3wxUe2EGXSM6KMnNt9Ucw0JbHH66Ysw0eZNGBEpxe6F1xm/hUoPKjomm5IvkDedznFQUGsn5obmkE1NWN0d+CcsrmSCR+hS6szRM9XBT23sUzXjWKm6ZK8MTRj7GmXzp0SQe4BIjamZWBb8308v7zMFpC6fUYsnVwyKEijseecwhRhcHyusJw92Au49z/g==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6705.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3c6f0fe-e163-4665-79d0-08d87b09256e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2020 06:17:28.4032 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T/Nx4/pHQPcAkIghMJSv/JdMvRMCFXJd9e5ffxLLNPYvnsMdeZ8Qpoqbn3tybRhA+mhNclfOnilvSotu7bnQPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4855
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_021735_636899_20B0150E 
X-CRM114-Status: GOOD (  10.35  )
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
Cc: Bart Van Assche <bvanassche@acm.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 open list <linux-kernel@vger.kernel.org>, Satya Tangirala <satyat@google.com>,
 "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, Bean Huo <beanhuo@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



> 
> 
> From: Can Guo <cang@codeaurora.org>
> 
> During clock gating, after clocks are disabled,
> put hba into LPM to save more power.
> 
> Acked-by: Stanley Chu <stanley.chu@mediatek.com>
> Signed-off-by: Can Guo <cang@codeaurora.org>
> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
Reviewed-by: Avri Altman <avri.altman@wdc.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
