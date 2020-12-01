Return-Path: <SRS0=+qQs=FF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9732BC64E7B
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Dec 2020 07:00:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9A8E2087C
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Dec 2020 07:00:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qCfR06KU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="RVhR4iSK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="zWP0P3Zc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9A8E2087C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VFNjR4D7gshY+TACZGYzUbG7qutwubWTVmV6evr62LQ=; b=qCfR06KUQwduUh+SWZQ2TTanQ
	crt9nP/pB3ebmBMXpn6tGhCfWRX0bit87SIS+ltrBrOE9+JAwF6KyqJ6IKX8E33wBXTBRQta6cfPJ
	o7LR6MTt1L+zbonF8SNjkDuLkQ2nrLd3rml0kSfvZO1tJ0W3+Qt8PDf+kI7Htih/TH34E93/Vh3pn
	f88l7fWMnGy+0s7WKw2dGaM6IHbf9ardOSSVceSYjez0fDmaqYjvMGFWNtL4dQ0hAwKhe6CQ7MUs9
	0/CUjmHG+4NXsLpeOHoht8/ChDiEDH9TfcfN4qEcj66YLFWN9hoSSehc6S7pFBMJfNWCY+b7ETPCO
	K+/RK9t7A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjzeL-0001Nj-Sh; Tue, 01 Dec 2020 07:00:33 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjzeJ-0001Mx-49; Tue, 01 Dec 2020 07:00:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1606806031; x=1638342031;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nZbMzqbfUa7pEhGe5SPuBQ4yXF0KlBP2btAGb4BI254=;
 b=RVhR4iSK4CrISeZFx11thT3h5eBhrgBN+EdiCTJGlhUqxIdOAlU6jgrB
 mDdSO7+T6IGJzBLvPK+iqAK2qBxsOxONkYvYp9bw+gH8fnu//NNpcwbVt
 Pi5Ix5t5uRqtUW00mudTslLltDcbj7/8ad6bAJvGrzej1KW8j3BTGLhql
 GlH67jk6abbDE7o39ALJqV8qoCSRRyBE6qGYnFFJTYUtmd5xwmN7vQcgP
 OpHySkXWgZu+6w8vaRDoR/rtaR2lc5U62WMyYJzZelcZE4oaRo5Yh/t3R
 As9jZMaX0q2AV1QAEiPBALDS2X5mpMcX0GMxXeY6klimowRUHyF5cK9CW Q==;
IronPort-SDR: EmMqvxxdL7eVbFin/apA86f/wkVDVew46UYFvSxAXUdddLawvcE8HkhPkgPoRt7WW+iUmYyR4I
 unI+oFSaDNEl35+rpARzXDDrVYs5nahfJB08p1SdVNhueI/Wco7WwpXpgbIDwVDWunZ/9GPTDu
 wX/cteE1+kyI9o/LrTRUwXR7PxnrCFsNBMMgVPtX2dsqFBSL94NnNvE5QEClFW+xnLWvKYPNMi
 6JCVZie1qMM83GoCo+xslbf2X/GJQldVm7bU2miANzcP0Uv6FMStQh11VDUCdvYfLeni8WswNX
 LeU=
X-IronPort-AV: E=Sophos;i="5.78,383,1599494400"; d="scan'208";a="153958379"
Received: from mail-dm6nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.104])
 by ob1.hgst.iphmx.com with ESMTP; 01 Dec 2020 15:00:22 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GOZWz4nP827F+ZSjYRco7Arcuwxxuh7W2swrDwGXHYF3MOxqeuhsIN3BJARvlr1yWvOMXHtzvzJRIV7GmEA1C27RLish1FPSt0qzvLixgzv+omspdfwb/BNhszSAYoUmI+jUqeZ/Ibkgscq97uuvF0y7xPqFmMmbfM5i6NnD8NwZwW0SABGDtYnT2EVdTDKJNJDXZ7UGYX9iCruH9qGG1SlAh833ltd7hxo3g03Yk5ginzCYT7DHvtymtI+FZmsle7nXIwYbriUw1YmltecXarcX5GALAGT3kAsBiaYr+YtYrNIfKOeVesVsjudgNrjccNONbX+n+dnLo8wzkdtK3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nZbMzqbfUa7pEhGe5SPuBQ4yXF0KlBP2btAGb4BI254=;
 b=ii0GB4jHTDVk1x8Ofq5ZWbeD7oZ04Y8xGY7dySNVt4D3ZXKGFPphfUtDH1yn7uBLtV4x5bRbLuLYCeK3X3Oe7YgSg9uSINebWOuk2XlBLA2JkYBIcYPbxnwO5U/lqUMIUEG9gtTeNh5yuo+VxoxumjsiHJXPjlKXtE4AKxFudkdUJaYf360obimy0ZxNhZa5ulSk6uPFeBjnuQPVQjuSmrT3pi8JvOBM/FrD44Q+heuHgemf5cj5pr/bhwVi/BMw0vmszPMmnZFMMNFhdYfy9+eCqrSEO2ozbS5uIBIj16cd11sedriwvD9eM/dOJE8Y0kbC36bc5kgLthP3pPxX2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nZbMzqbfUa7pEhGe5SPuBQ4yXF0KlBP2btAGb4BI254=;
 b=zWP0P3Zcyi3V4UEdAIjoHSpRGKW1Alm6tUAXz0tqljNAKMAmLDhrC6O85UY/+aR9lobMnLYl8a1M098GQ9t2T03fXKsTVfFynFl6fH0bWKFcDLuFf6H8Zm9ydDQPxii3mxp4ISCt6avOg/L1fNGOPHF4EOa/lLKvn1fRW962RFg=
Received: from DM6PR04MB6575.namprd04.prod.outlook.com (2603:10b6:5:1b7::7) by
 DM6PR04MB6140.namprd04.prod.outlook.com (2603:10b6:5:12c::28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.25; Tue, 1 Dec 2020 07:00:21 +0000
Received: from DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::a564:c676:b866:34f6]) by DM6PR04MB6575.namprd04.prod.outlook.com
 ([fe80::a564:c676:b866:34f6%8]) with mapi id 15.20.3632.017; Tue, 1 Dec 2020
 07:00:21 +0000
From: Avri Altman <Avri.Altman@wdc.com>
To: Stanley Chu <stanley.chu@mediatek.com>, "Asutosh Das (asd)"
 <asutoshd@codeaurora.org>
Subject: RE: [RFC PATCH v1] scsi: ufs: Remove pre-defined initial VCC voltage
 values
Thread-Topic: [RFC PATCH v1] scsi: ufs: Remove pre-defined initial VCC voltage
 values
Thread-Index: AQHWxvl86T293PgVNkSYZJFhGzjYYanhSMmAgAAGaICAAAsZAIAAGVoAgAAcuoCAAD9pAIAAAHEQ
Date: Tue, 1 Dec 2020 07:00:21 +0000
Message-ID: <DM6PR04MB65752A87CA471D9D76BB75EEFCF40@DM6PR04MB6575.namprd04.prod.outlook.com>
References: <20201130091610.2752-1-stanley.chu@mediatek.com>
 <568660cd-80e6-1b8f-d426-4614c9159ff4@codeaurora.org>
 <X8V83T+Tx6teNLOR@builder.lan>
 <4335d590-0506-d920-8e7f-f0f0372780f9@codeaurora.org>
 <1606785904.23925.25.camel@mtkswgap22>
 <d998857a-1744-a8bb-1a3e-77166c171f37@codeaurora.org>
 <1606805690.23925.29.camel@mtkswgap22>
In-Reply-To: <1606805690.23925.29.camel@mtkswgap22>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mediatek.com; dkim=none (message not signed)
 header.d=none;mediatek.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [77.138.4.172]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6b94a626-3274-408c-b637-08d895c6c530
x-ms-traffictypediagnostic: DM6PR04MB6140:
x-microsoft-antispam-prvs: <DM6PR04MB614065661C36D48879FC74EEFCF40@DM6PR04MB6140.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: V8OSaQLK5BKlep/JmkeGvA0E/arkZVE44IBYIGHLPINOexMhSBTqWwc9ul8vKt4fxQNE0IZFc9Y5vWWNQyd/lOrIFSwx+n6Aiq6/4Sk2TgOTBQLzdeGxqWGyJpuuB3e3pm10fwm1aOGoPGti6BRKJY9XXIBe7BTdBNMyr4mfScR1cQ8QsHQsfqeuPtNzdwAGa5NL0CKuD19KFz0uJkv9m/HD10RFkYjsMKV/C/94Px9EuTI2gV0YwKfWaVNDWMv7tpIP3ShlKMU/Z67nMK7kTVa1ZPwjZ1tDOv/NuvAiaumRWovX5YYsP7lN/2fYHsoSHcHQe7n9ETbM017lZnrX5A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB6575.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(376002)(346002)(396003)(366004)(55016002)(7696005)(4326008)(316002)(9686003)(86362001)(478600001)(54906003)(26005)(7416002)(8936002)(110136005)(8676002)(186003)(66556008)(66446008)(33656002)(6506007)(71200400001)(5660300002)(52536014)(64756008)(83380400001)(2906002)(66946007)(76116006)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?LzRab3dPWDE5azAyMm1aWEswQ0JVUkVwOStRRkhUK2hXMW01bVhRZi9aYnJ1?=
 =?utf-8?B?RGpmeDRIM3ByZ0gzR0VNWnpOTEhQWDNNOFVlQ2xMcm1UYlErbVM5VmtCY05y?=
 =?utf-8?B?VG5vc3pnNXZvejk1ZG5kSENiQ2piVWdQZ2J4R01VY0ZzYWYyQU0wbWFuNkhj?=
 =?utf-8?B?djA1R3dlanRzTUVCV0I2dFAzWGFxcy83YzVUZEZhZDBNMWxSc0lFUHl0ZjdJ?=
 =?utf-8?B?bGxLUjVra21sd0puaGNSSExUQUNaOThlQzdUNk5iSnJ0V3l1MitxY2Zsd253?=
 =?utf-8?B?RW9uajJlaTIvYU5ZcVJ0VmduUi9UazF4aXVjSmJjN0w4M1hMUDRpV2VJajFT?=
 =?utf-8?B?a0VVMlBVdlNzam9SbkRraTlIZ0RPU2pHSlhsVVdJM3lWMERieVZmSytOTkdu?=
 =?utf-8?B?ZTUzcTg4Y2ltTTBtWW45WDdUODZKQk5VWnFmZ2J3NHdXWmlYOENaN2t3a0Ru?=
 =?utf-8?B?MUdsSERjazVnTWx2YXVqaE0rMmpNZ0pwQU9OUnZ3QW10NlBmMUJlckJubWZU?=
 =?utf-8?B?NTF6UnJJYmZNVGdiNStvVG55cFNTTmlHTUJEa01NeFpLUktSRzVRRTFHRVhR?=
 =?utf-8?B?S0IwOTRvL1QyVkxxSjR6V1YwSVZoNEkzUjY0UXBMaTdnMHFUcjZYcVZlc0lH?=
 =?utf-8?B?QUdkaVI0eDNuYU14WllHdjc5N1FJdXdkYlRFRmtwWkNUZGE1M2FsbDl2TU1n?=
 =?utf-8?B?ZVBnakdzaUFBdDhXUVRSUVM5VW42OVlDbU8yR2lCMWdTWUFLR1VoZ1A1d240?=
 =?utf-8?B?S1Rsd0hQSDlPSGdRd0N6VHFpT1NLWVphUUJ4WFlJVWhjVEcrcWpxNVl3Q09Q?=
 =?utf-8?B?ekUvclpPaE4wOThqU2VyZ1JQUXFUQnBZcnIzOUpJRC9YYUxVK3poa3hlckZO?=
 =?utf-8?B?c2FYMGhTZVJKTzFGcXg5dXBDaWM3TFNqN1dwYVF4QllVVU90cU9va1VaMkx2?=
 =?utf-8?B?Z1Y4NUJ3NHpBSVlQZncyV2dzR3kvNjFwR2J4SFJ5VXFiTDZSMjBCRjBhbnQr?=
 =?utf-8?B?cktIdFg5NkljVVUxbGxkdTA0SkNqRHFEV3ZvRHFyNzVpZVEwSGt3OEErM1dh?=
 =?utf-8?B?UVd6bm9PTGpBd3hpb1A1ZW93cTdmdDJPSzh0cFUzOXk4K281NTVtNkIzZVBT?=
 =?utf-8?B?bkdCanNuTWl6K0NuMzQ4M3p5d1BTblZPVnVyWkErS3J6OGV2Y3k2TkovcTNl?=
 =?utf-8?B?T3lxMWN0cW94NjRqR2lFV2s2WUgvS1lTd21QUmVmR1RPSTdRbmtBYUtMNmZM?=
 =?utf-8?B?bFdLTEkrT3hkU1ArbXRCZjFKSkYyRlRrN3JINElLTnVlWSs1aldpMldoZjNX?=
 =?utf-8?Q?NqKTj3nhJAOsU=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6575.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b94a626-3274-408c-b637-08d895c6c530
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2020 07:00:21.6854 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rTcubyxIagWj498nGrusCyJO/7z8NWvgaSX01CO5hrX9wC59kTyVdtDw9r/biqTiMTuBYkDtiEK/epd1tM4Emg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_020031_315052_342F3367 
X-CRM114-Status: GOOD (  37.39  )
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
Cc: "nguyenb@codeaurora.org" <nguyenb@codeaurora.org>,
 "jiajie.hao@mediatek.com" <jiajie.hao@mediatek.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "andy.teng@mediatek.com" <andy.teng@mediatek.com>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 "chun-hung.wu@mediatek.com" <chun-hung.wu@mediatek.com>,
 "kuohong.wang@mediatek.com" <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "cc.chou@mediatek.com" <cc.chou@mediatek.com>,
 "cang@codeaurora.org" <cang@codeaurora.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "peter.wang@mediatek.com" <peter.wang@mediatek.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "alice.chao@mediatek.com" <alice.chao@mediatek.com>,
 "chaotian.jing@mediatek.com" <chaotian.jing@mediatek.com>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "beanhuo@micron.com" <beanhuo@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> > >>>> Hi Stanley
> > >>>>
> > >>>> Thanks for the patch. Bao (nguyenb) was also working towards
> something
> > >>>> similar.
> > >>>> Would it be possible for you to take into account the scenario in
> which the
> > >>>> same platform supports both 2.x and 3.x UFS devices?
> > >>>>
> > >>>> These've different voltage requirements, 2.4v-3.6v.
> > >>>> I'm not sure if standard dts regulator properties can support this.
> > >>>>
> > >>>
> > >>> What is the actual voltage requirement for these devices and how
> does
> > >>> the software know what voltage to pick in this range?
> > >>>
> > >>> Regards,
> > >>> Bjorn
> > >>>
> > >>>> -asd
> > >>>>
> > >>>>
> > >>>> --
> > >>>> The Qualcomm Innovation Center, Inc. is a member of the Code
> Aurora Forum,
> > >>>> Linux Foundation Collaborative Project
> > >>
> > >> For platforms that support both 2.x (2.7v-3.6v) and 3.x (2.4v-2.7v), the
> > >> voltage requirements (Vcc) are 2.4v-3.6v. The software initializes the
> > >> ufs device at 2.95v & reads the version and if the device is 3.x, it may
> > >> do the following:
> > >> - Set the device power mode to SLEEP
> > >> - Disable the Vcc
> > >> - Enable the Vcc and set it to 2.5v
> > >> - Set the device power mode to ACTIVE
> > >>
> > >> All of the above may be done at HS-G1 & moved to max supported gear
> > >> based on the device version, perhaps?
> > >
> > > Hi Asutosh,
> > >
> > > Thanks for sharing this idea.
> > >
> > > 1. I did not see above flow defined in UFS specifications, please
> > > correct me if I was wrong.
> > >
> > > 2. For above flow, the concern is that I am not sure if all devices
> > > supporting VCC (2.4v - 2.7v) can accept higher voltage, say 2.95v, for
> > > version detection.
> > >
> > > 3. For version detection, another concern is that I am not sure if all
> > > 3.x devices support VCC (2.4v - 2.7v) only, or in other words, I am not
> > > sure if all 2.x devices support VCC (2.7v - 3.6v) only. The above rule
> > > will break any devices not obeying this "conventions".
> > >
> > > For platforms that support both 2.x (2.7v-3.6v) and 3.x (2.4v-2.7v),
> > >
> > > It would be good for UFS drivers detecting the correct voltage if the
> > > protocol is well-defined in specifications. Until that day, any
> > > "non-standard" way may be better implemented in vendor's ops?
> > >
> > > If the vop concept works on your platform, we could still keep struct
> > > ufs_vreg and allow vendors to configure proper min_uV and max_uV to
> make
> > > regulator_set_voltage() works during VCC toggling flow. Without specific
> > > vendor configurations, min_uV and max_uV would be NULL by default
> and
> > > UFS core driver will only enable/disasble VCC regulator only without
> > > adjusting its voltage.
> > >
> >
> > I think this would work. Do you plan to implement this?
> > If not, I can take this up. Please let me know.
> 
> Thanks for the understanding and support.
> 
> I would like to re-post this patch to simply removing the pre-defined
> initial values of all device powers.
> 
> For vop idea supporting the voltage detection way, could you please take
> it up since this would be better to fit what you need for fixing this
> issue?
Again - why vop and not a dts flag?
The platform owner is aware of which device ships on which platform, isn't it?

Thanks,
Avri
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
