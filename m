Return-Path: <SRS0=p2pa=BO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A3FBC433DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 06:11:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 085EF20792
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 06:11:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UN68SkSM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="Y7GhitAF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="rHpqMp2b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 085EF20792
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ajYbW70jyB6JTz2T0NFCzmE56aAz0nxZYiA+yRx3iE0=; b=UN68SkSMW/4+7OaUNsMPJRjzi
	yP5C/EUSPbCGNaff+7e6AsdcITu6nk1y9WUx65xZx3B4Vv/rBkcw3fr5qHv8vxur+gIVTUCvkL3l0
	vZiimPV6NwYewdSX2wLgAWO25ltjb0bmIPgMoE0Ge+w38fmls8Dekq2/zeFYFR6sIepTq3YHeflLE
	oEnIH0nmeQK5gaCjWZTMPinVSOy0LQEHUr/KQ9gjgHrxhkkDzLhSYJXhOULoD+BL8j/BPXDamVfuj
	JGzrj/qHd1E7+VPOUOhpKpSvjgvqjhEx8iLTlsDqayZE8XTqWSknYUBQ+8u3xdnDU5xFO1jxiePLp
	Dr3HyoYMg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2qA0-0007Dl-MN; Tue, 04 Aug 2020 06:10:52 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2q9y-0007D4-DS; Tue, 04 Aug 2020 06:10:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1596521450; x=1628057450;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=G4q1lAOrLUWAkr7qVWAke08zQL6pNzFsAroSVtq4LgY=;
 b=Y7GhitAFIzN+JUhMNrIhgGeHzGb6EXUqB5VhaIO0rlGzzi2ddetKxbwy
 MWkt8WuATSniIOW77NdpNhmZoQN4fhdqupA/xN1hZqYJRxIqUC3m3oQTh
 1wtaXbTWc4KzmwfZthHbnasFvzCB3iB8yWzeeQXkUjNVQmC3abu8joaWq
 VZ/44kAiU+7lI0d1C/HJHcX49fxGR2fsbq0H3YQCbIB/r8XebzoTegaHF
 FkIrWjdD/C6opPxI86YR1isFBYF7nYSneTuLFIa3mv51IaZpM6qjjCnap
 GibjOU4R0CdUwyKw77z/jGcB9rqKP2N49m69DE78y9MPi3CFP8b/lP1la g==;
IronPort-SDR: eMiP1YV0r3ifDHR1UoYuXNSA3p/CoVlPpgC6iMTAN5PJfnRr1CwIKLpS/ObHbtdD691GewuVmj
 +SKxMrtBYTPR/s+IYMfnHeHaYRPCwelGSLBDPCnuEoY04U89zTaTKLH8VAYdWG7sUw5+wH6xiF
 UVzjjmdrQwP9VNXuSKJJhFAnaOxVqHQQSjfEhWZBDZ9UwkRmKvxCGw5sg6MRNNeGhDpIfqEg+U
 KXOyCj3BqBVJXlOq+epPm0d6Tcx5WZKgIUJoGMp76JZObUEXa0L/eRRmJwP59Nr/aiK9lgEwW8
 YO8=
X-IronPort-AV: E=Sophos;i="5.75,433,1589212800"; d="scan'208";a="148389703"
Received: from mail-dm6nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.169])
 by ob1.hgst.iphmx.com with ESMTP; 04 Aug 2020 14:10:43 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pr1FG74lXyupqxqVz9QHu5AFeQm4UAr9/xKCp5vrInavRtetBJjLNaWpgYwIRsb7+CKt7nqEntMof/3BGAtAeySnrs8nNwnvG75T4wifP4Hb5CWqORABnNNpiwsFkPiWFefFJwdd8x9abcl7SgtBeB+h+WqmUV+0onkhetVKpmLl8nba7Bt22YSO2Ip+Ja/xA+y5FDgjSWAtsLwPi3VcqNjyB3+Q7unxty04OAmJnQdbhraYXoPgrldJNnJrX50navxOeyHC1pwgZ9uGGF0eC2/M8s3S5lYMgH3zHCXHrPusjzKQs9AHp+cn8qdmVuojPCgvn9DI5D9ropdL4Uk0ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G4q1lAOrLUWAkr7qVWAke08zQL6pNzFsAroSVtq4LgY=;
 b=b8/Dyct7p+4RPbRr7MII8FsLF5PglqRiRLEDtYgQ2kX0z8yKPdiqj4Xa1gpUef71t/ybU2jLiNcF2+NTIIY6Hf0Hb2Qx7dPpu3AjIeAvY9f1cytFO7fnaa49cAZ/smFokXL0Qp0n/PNMyEN/PfZTMw+fz+clYs57mJd6OJzPVF/IAtBRbi+ZV+MCfVvg+ms/vYrb4tAYwzU8GX/ZgssesM7CU3I7NvgVlZznyEsivt4wDYGuze/ZQUqsS/QClx2bGdmFXND7XhPn1QFFKV9JjTp9gIha+BhxhzBqVtl+9ZbnIrXqOth5gNfkNJsLQiVNHCi8eJdp9gXhTbWP1rf86w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G4q1lAOrLUWAkr7qVWAke08zQL6pNzFsAroSVtq4LgY=;
 b=rHpqMp2b1AewnWj2jt8pIhY/ocZTaLRG/Ttpk14x3lKG5OdaIjx7Lkw+wzXUBS15BDyRWp+V6QCVVtbf17zEwF3yyNpLRmG1FSTQ03/suNfHGfxztHHP0S/q9oCtmUZPxqtMGEWhPFThtII1ytAVG+Xf88dyprySkXcBwEjQhTI=
Received: from BYAPR04MB4629.namprd04.prod.outlook.com (2603:10b6:a03:14::14)
 by BYAPR04MB3878.namprd04.prod.outlook.com (2603:10b6:a02:b8::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17; Tue, 4 Aug
 2020 06:10:42 +0000
Received: from BYAPR04MB4629.namprd04.prod.outlook.com
 ([fe80::40d:aa59:cf3:2386]) by BYAPR04MB4629.namprd04.prod.outlook.com
 ([fe80::40d:aa59:cf3:2386%7]) with mapi id 15.20.3239.021; Tue, 4 Aug 2020
 06:10:42 +0000
From: Avri Altman <Avri.Altman@wdc.com>
To: Stanley Chu <stanley.chu@mediatek.com>, Can Guo <cang@codeaurora.org>
Subject: RE: [SPAM]Re: [PATCH v2] scsi: ufs: Fix possible infinite loop in
 ufshcd_hold
Thread-Topic: [SPAM]Re: [PATCH v2] scsi: ufs: Fix possible infinite loop in
 ufshcd_hold
Thread-Index: AQHWZVGu3ObiHVQ3qEGOzD92rO+OpakePgSAgAActwCAAAeXAIABYbSAgAexOwCAAAl5UA==
Date: Tue, 4 Aug 2020 06:10:41 +0000
Message-ID: <BYAPR04MB4629D947CAC7E07FF94D55F2FC4A0@BYAPR04MB4629.namprd04.prod.outlook.com>
References: <20200729024037.23105-1-stanley.chu@mediatek.com>
 <bfbb48b06fa3464da0cbd2aee8a32649@codeaurora.org>
 <1596018374.17247.41.camel@mtkswgap22>
 <4cb7403fae7226b70a133d4a7ecee755@codeaurora.org>
 <1596095961.17247.51.camel@mtkswgap22> <1596518850.27829.5.camel@mtkswgap22>
In-Reply-To: <1596518850.27829.5.camel@mtkswgap22>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mediatek.com; dkim=none (message not signed)
 header.d=none;mediatek.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [212.25.79.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a985b5ed-978e-43b3-6928-08d8383d1dfd
x-ms-traffictypediagnostic: BYAPR04MB3878:
x-microsoft-antispam-prvs: <BYAPR04MB38784D3AB442860F9FD6A09FFC4A0@BYAPR04MB3878.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7iCnoPGC1vTtnPOmWf93EW5j5RziUVLbOw8o5TAKfa6U+/3WcUPNMBQn65l29KOVAoZwlK5e/tQGsMtlVlwn1uzPZE2CztJd8yG1omOTjfWcQMpUgx//6sBY8iq+H0UfZu/rJTolmpc2iRvF0BND5UrptQ6fhwkY058RT5oVigV9CiGnkqkbQp3r43DNwXlgp7TJVCWtaXFvcACt8aIo9V+NVLWvfT0f2ewgAEDCDzoi05gUxGconIt5JMqGX9qv1IG/wGZzfiAy2V3AGzKVxbhBbkf/5Cqf99TIxJHtXgTb832TXD2nGOwdXcxKvgWA4PSL3pHY6cAhBkZ6rzt/vsF44QMYzftoBChFr8ueO8BD6JeW4+GOgfQoG1fNJfyo
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR04MB4629.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(346002)(376002)(366004)(396003)(39860400002)(478600001)(9686003)(76116006)(52536014)(55016002)(86362001)(7696005)(83380400001)(6506007)(7416002)(4744005)(26005)(71200400001)(316002)(8936002)(2906002)(186003)(4326008)(8676002)(66946007)(33656002)(5660300002)(66446008)(64756008)(66556008)(66476007)(110136005)(54906003)(217643003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: nS4fmNhfadkGUdT0Zn3ZHxrcXoidhs95sYiVhq0Rk7DDXfJNOpA9HlQS71CwFirMRBFpGSp4/1aNZSjDBqYqB1asHgre5UVNkrpkEPtJ22pPr9BsXVF4OCxKP6wFHrSciI4LaCU5qB+/lEHNtDSDkNwwaewZWdPW3+lkSBpiKhAwTrj1ZRnC6dSBx7ffCRzv22u3WMwSlyPRdoeohaxxhI9iK/Ab9txPQ4m7DoiqjUiZvaFaNs0aQjFlaBCOreYlZxfSbaYmMNK/6Ib7srwzZwuzNpjA4xQJC7C+rmQjujyTV8Q+BEu4SEJWWIehObaOIA6sqU3X10T+N2Yj7dL+HxsENRHG7xosI59N22fxkcXnxNNyhKocrV4DgBE9N2aXtYfRo63bByqC99lppdCjFNeHoSOQ1PB/TZuiqY3W59O+dgrHiDZLDslDrziPgM06z/UFSPC+PqBQjazw6rtCllu68pOIpTqWqARoXxPjhGuZe0cpd/mhUbf1nTD65SITPJ4LnVqY15mrKkqp4q4aD+bbuwQ75DCEhqzbIk9thy2Vb0QroFTYYgOKsZqSAXxvOvI5BCKAn/Wc58ev4Vo60LeMJsDjWG9TkZI85ozOPmC+K3zOBqMoCeacYab9sG1StbbD+nbZ9MnAJ1fr7P1HFA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB4629.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a985b5ed-978e-43b3-6928-08d8383d1dfd
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2020 06:10:41.8383 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LbXFJztdb5dxJdMUJQzQBiFyGS6nUG3yqLNtkVBW1cRHPxxQayr6Q+Czn4Ava3POK5MT5VGltOTqCf/Yb1x7rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB3878
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200804_021050_773497_1029E46A 
X-CRM114-Status: GOOD (  15.06  )
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
Cc: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 =?utf-8?B?QW5keSBUZW5nICjphKflpoLlro8p?= <Andy.Teng@mediatek.com>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 =?utf-8?B?Q2h1bi1IdW5nIFd1ICjlt6vpp7/lro8p?= <Chun-hung.Wu@mediatek.com>,
 =?utf-8?B?S3VvaG9uZyBXYW5nICjnjovlnIvptLsp?= <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?utf-8?B?Q0MgQ2hvdSAo5ZGo5b+X5p2wKQ==?= <cc.chou@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?utf-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>,
 =?utf-8?B?Q2hhb3RpYW4gSmluZyAo5LqV5pyd5aSpKQ==?= <Chaotian.Jing@mediatek.com>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "beanhuo@micron.com" <beanhuo@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

 
> Hi Avri,
> 
> Would you have any suggestions for this patch?
> 
> We need this patch to enable UFSHCD_CAP_HIBERN8_WITH_CLK_GATING in
> MediaTek platform.
> 
> Thanks a lot,
> 
> Stanley Chu
Let's use it for now as a short-term WA.
Please work with Can on a proper fix that will utilize his idea to remove ufshcd_hold/release
From ufshcd_send_uic_cmd, as you are both in agreement that this should work as the long term solution.


> > > >
> > > >>
> > > >> > Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> > > >> > Signed-off-by: Andy Teng <andy.teng@mediatek.com>
Reviewed-by: Avri Altman <avri.altman@wdc.com>
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
