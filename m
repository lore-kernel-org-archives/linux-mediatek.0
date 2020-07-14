Return-Path: <SRS0=0yQJ=AZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06A5EC433E1
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 09:30:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8E2B2075F
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 09:30:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vN/nxSeI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="E/BoODHH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="qhHic998"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8E2B2075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8IsIut2B1u2WafLHsCo5IwtsXZBiPeVG1UBiQyhQAmY=; b=vN/nxSeIDKa57djIqblWRs3nS
	bn3jxXfTeOUTLMjAD62K6e3TOQQZJARHw62NyqO0OtqQIFZNMBb19ct3NW3yYq82Ew7WOMN9zQpe7
	ERO+kT+gIL3MffWZZc9UnTB3EDCUjbEXQhZJD9SQWwLKHtpTh4FUfOHn3DtVpMrbKeN3E2Fozut94
	eIFkDK73NpbgTEKIDKbP7pGjLzthWrmz83YBFAnoRnoIZsEbuaBoPyC14FnubFmieBmfbaUKH+iIq
	fIjdYX3lq6huRDopnwDyxKFrzQ0HKQF7sDL0TO9GTIKFg/hOz6/YWtUYQUC4tH5PLvY3OKVH88r+l
	Qpu/tA4QQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvHGQ-0001hm-CX; Tue, 14 Jul 2020 09:30:14 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvHGA-0001WP-Tr; Tue, 14 Jul 2020 09:30:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1594718998; x=1626254998;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pJBrDXbSNcUoC7nE72rkJlHXG9zg9/kmKAwRfv61Mmo=;
 b=E/BoODHHP++vOMRcB16dNe5ZsGrVb/QIlgX0kAfvvmcFch2Bjt2fsSpH
 wLlBPI6p2jXDon9RNAyJCCcCaz3hSJIbE53BUou5GsuP/8ELfmtebx9v9
 qny9scxe7fo795vuxvizT0OVx+jSQxKihvC/9JPd3kfarTWmyXQwhYesg
 /hVPp5Jctp+nDgDQE9vfqAVYoLU4jLdb2HzNz8a98Hn+hi1cdpqJUs9PL
 Yc3+FqUVWvAFpmMTV4o+Cq0niRfXE/sS0Pf9tuygxgB4kmqi4ixbR++tK
 VdrjB48we2FcXrB4asOHL1e1UjeoB8LJYqwQLs3v7CNXcghxy+W24tnRI w==;
IronPort-SDR: gSf1UdmNubb5ev4k3kdSEd2A/bzX8f2NwBvoB+1vRDtr4u1iIQLGQbJtPps5mAk5Y8ZIoEOqs8
 ynEZOLSF8E9XBUGoi6odvZ4G0rgoDQuMlFlb6vDg/SFQts+ujn6NcRWOe3H34q7Vjte6MYTuH4
 vwN9j8b79fR1bppC+SD4f4ofrwbGP+XJ5CmPiliTw3TEbHE+Q6ZI2Q/pJZPXjbl3TjrMHuSDD5
 f26Ud7vt1mFGAcJkjL/K8CiqfZEBwCwpnZwleWZ0AKM8bPcVzNr/Sw1aw9tD2KUSpEnJHwA4wS
 zJk=
X-IronPort-AV: E=Sophos;i="5.75,350,1589212800"; d="scan'208";a="251666408"
Received: from mail-dm6nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.101])
 by ob1.hgst.iphmx.com with ESMTP; 14 Jul 2020 17:29:51 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gfPoUAbE9IFZANttFHYotJU2KbZVJuxZOealk2yhBq6OXVkyakx/l/WGlBWz8WUyJtEEpSOQRDIviX6zyO5vC0uBhJQg1G/b4jwGTv4FR3ItwFyJUm7I9l7vWz7TzFNNFTeyqztPgYeE5awHdtZrIlYBzsiYgiW35F0a4LQga+kr0j1/cvJd4NV+vfvc0Eu/mZJE08sQpU9oHaDVVQn3tg2i2WDNaZRtZvhnRYO+S5Y6mZoPo06jQcPV/CyutZ7GRevH5/D4B8ySIpvY+R4HTqWyrLUFtr/V0CbKsidCb3y/Qfq5FT33bOi5NuRPPdHv1EK1Ctn59TzKZi/dZl6bSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pJBrDXbSNcUoC7nE72rkJlHXG9zg9/kmKAwRfv61Mmo=;
 b=ihe/uvGBLrPA2hBGXGlL4XQ36gZbAS0gTH0AMqBkM6CVxoqkPkEeQD2jdDC30E2fIeSOxVwgbxe+2nEckJMobFk3XgWSAGbssv+iLphaT2z/eNTmZ8lzO5RsMxhcl6OwnOO7DYjcdEmrnLhkuMFxSdRdurwMWrYpzi1DFAxtESnDTetSqNHBAjham6AkrJ1zu/P7V7rtKyABnt5qsaEu6bO9PIXpkvvMyHbIaDLPD7mCdkShB92G36AEi7ox9xYXYW0k/d2uDJ2r9+Do4cc3leBwWEv2sWfm+3YWUMxXHzBuO0GYqhYvZmYWRjh8ojqoJ76FMVQM+GtJrA1wl2vs+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pJBrDXbSNcUoC7nE72rkJlHXG9zg9/kmKAwRfv61Mmo=;
 b=qhHic9989jVtEW1EkK/QzimGX0UQpfJJrcSfXU605GkQUfopksUUnBC0ESBe7yRIEKhYnJ8Gty+y8Q+pUbjIkANieRGI5RWAcCuXw3me3d751woNHMDXU9q6nkEcYDTXVSSO7QzupKwwWiKYI1vfaoZIx7sAokcRqdNTTStS0zU=
Received: from SN6PR04MB4640.namprd04.prod.outlook.com (2603:10b6:805:a4::19)
 by SN6PR04MB4190.namprd04.prod.outlook.com (2603:10b6:805:32::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Tue, 14 Jul
 2020 09:29:50 +0000
Received: from SN6PR04MB4640.namprd04.prod.outlook.com
 ([fe80::1c80:dad0:4a83:2ef2]) by SN6PR04MB4640.namprd04.prod.outlook.com
 ([fe80::1c80:dad0:4a83:2ef2%4]) with mapi id 15.20.3174.025; Tue, 14 Jul 2020
 09:29:49 +0000
From: Avri Altman <Avri.Altman@wdc.com>
To: Stanley Chu <stanley.chu@mediatek.com>
Subject: RE: [PATCH v3] scsi: ufs: Cleanup completed request without interrupt
 notification
Thread-Topic: [PATCH v3] scsi: ufs: Cleanup completed request without
 interrupt notification
Thread-Index: AQHWU5heDqJFApuOo0yQOIjuO+/O36j+4j7ggARNXQCAAJBVkIADEAuAgAAKm5A=
Date: Tue, 14 Jul 2020 09:29:49 +0000
Message-ID: <SN6PR04MB46404C9EC8C29F75E5D1E45BFC610@SN6PR04MB4640.namprd04.prod.outlook.com>
References: <20200706132113.21096-1-stanley.chu@mediatek.com>
 <SN6PR04MB4640BEAFE18BDC933FC7EC95FC640@SN6PR04MB4640.namprd04.prod.outlook.com>
 <1594517160.10600.33.camel@mtkswgap22>
 <SN6PR04MB4640F34CAA25B3CB58F94CABFC630@SN6PR04MB4640.namprd04.prod.outlook.com>
 <1594716527.22878.28.camel@mtkswgap22>
In-Reply-To: <1594716527.22878.28.camel@mtkswgap22>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mediatek.com; dkim=none (message not signed)
 header.d=none;mediatek.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [212.25.79.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b5d5a98e-0f83-486f-491e-08d827d874cb
x-ms-traffictypediagnostic: SN6PR04MB4190:
x-microsoft-antispam-prvs: <SN6PR04MB419094342B3F06678E7E360BFC610@SN6PR04MB4190.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8hU+qnBVhVf+Fu5r6ODjZkmvn8R0/0VOXGT17R9e68ObhhzHRZ/7bUAEVxIyqlkda3ejXBPNKd76SYGB6a1Ka5JwvTja4r2kWK92lAJwpItqpsn5xSNxvKxf9GYkeMPM+r9/pNE9aazhgh5auwC09uzSgmCxkau8ivVwQq/v6SSBuv1XxtgllMGAyEkTfZKWXE2DLp2jp85frbc1dVCtQ8e1t1+nIXSc6iwudubEeg7nod7RJgf9Ul5lF/9td0ohExhMPorkm7SZR6WgobNV/sgZGBtEODp4oxsI/4IeUpxOUfoLWmX17aoJ8oqeRyCNl101MtTIVxy6eVXh4Xv/5A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR04MB4640.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(136003)(366004)(396003)(346002)(376002)(4744005)(9686003)(55016002)(2906002)(6916009)(8936002)(6506007)(86362001)(8676002)(33656002)(83380400001)(5660300002)(186003)(54906003)(66946007)(316002)(52536014)(7416002)(4326008)(66446008)(478600001)(66476007)(64756008)(76116006)(26005)(71200400001)(7696005)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: EPHmS5BIBL3kXrB0ecbmy4Bv10AyAnA+rFcx5jtW0taWga3SqqatqPvsat3x/+vESifq4kI9W7DNpDR1qvFmoyO+7CEAjiL8ZKxN6VabSYuk+PSJljEDEHDd3NNAL/3PAjb4WZEbeH4AZtvHlOOw/nTg1z4YvhjTkrXJuUKKnE1SoixYLzsnye5w5HYe9Sl4IClfRPj7dxVWipPYCRkRtnUW7aOxAxuEtvdWBV1LvqpOqrlWtA7fz9CqmgxpXNJDc3hZ766D8NtxPlFHAWgSuca2ZwoAWIsIVIX8CA/wzQKTVZD+2+gNuAL3ZXeICFDlOzBTOzILB92FemKDL4cXJKMcL8n/dlGO3JLBFWr/MbKTLj0gS7PT5wURToGYFP02auRcOhbvJ8PzTHfF9bihLEVlgsL5anI3AKanUPgiMQX2IHe5h4cuWhFQY3JXMyJTk6gX6+MBpAQ+ewacUSzL+Atbw/irqokNExP7nBUmHUk=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB4640.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5d5a98e-0f83-486f-491e-08d827d874cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2020 09:29:49.7924 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e9eQGoIJvfGjUNKHniROFEkgANFj6ULcfgeGjfB+aP1+Yo6WS5Aa5/Pa6BkdMWm8HpDHgLR9IUKOHjqVkMbRPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4190
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_052959_204432_023C9CF3 
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
Cc: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "andy.teng@mediatek.com" <andy.teng@mediatek.com>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 "chun-hung.wu@mediatek.com" <chun-hung.wu@mediatek.com>,
 "kuohong.wang@mediatek.com" <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "cc.chou@mediatek.com" <cc.chou@mediatek.com>,
 "cang@codeaurora.org" <cang@codeaurora.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "peter.wang@mediatek.com" <peter.wang@mediatek.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>,
 "chaotian.jing@mediatek.com" <chaotian.jing@mediatek.com>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "beanhuo@micron.com" <beanhuo@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> > > > > +cleanup:
> > > > > +       spin_lock_irqsave(host->host_lock, flags);
> > > > > +       if (!test_bit(tag, &hba->outstanding_reqs)) {
> > Is this needed?  it was already checked in line 6439.
> >
> 
> I am worried about the case that interrupt comes very lately. 
scsi timeout is 30sec - do you expect an interrupt to arrive after that?

Thanks,
Avri

>For
> example, if interrupt finally comes while ufshcd_abort() is handling
> this command, then probably this command may be completed first by
> interrupt handler. In this case, ufshcd_abort() shall not clear this
> command again. In contrast, if ufshcd_abort() clears this command first,
> then interrupt shall not complete it. Thus here checking
> hba->outstanding_req with host lock held is required to prevent above
> racing.
> 
> Thanks,
> Stanley Chu
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
