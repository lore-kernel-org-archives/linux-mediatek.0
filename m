Return-Path: <SRS0=x7Es=3R=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_DBL_ABUSE_MALW autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A2FEC33CB3
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jan 2020 15:52:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFAE221739
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jan 2020 15:52:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tahlc/bD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=micron.com header.i=@micron.com header.b="Sx4TkIe7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFAE221739
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=micron.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JP/Y5Cm4QHz2KNR9kAR4be9XvOQRKlBwim9KB+aTXpg=; b=tahlc/bDf0j2fB
	fFo0MeSPYy9DYiNiBvYqYtT1xYjumLPUiArRl7X/LXHMO+cb/Ct8HgARVQK4HKoQnK2GGmK+We7Ly
	+s1JBXNR6WQfz/Y2oHZzavB7KrB/307NgZKPZgOE3q23t4INnNY4DbuLUuZ8snmCHRX2q473CPNyu
	l3ED7x5mPq+b2pcGkF6Jo2g2gomxEZtXDvzQULjeU7hSD5LVCLVkD/InVCWxf6RxU/ip1JMK0aRsM
	t5v4Wx/WQLvhgLTI26hMw1N41gkyTPW1m21BmL4ytPGTfjbtTQwhsDQxGNkTakxaGKOZBlykyg+dF
	ss8NHQMSaE17EYEXqfVA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iwTAT-0003U3-MS; Tue, 28 Jan 2020 15:52:45 +0000
Received: from mail-mw2nam12on2056.outbound.protection.outlook.com
 ([40.107.244.56] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iwTAQ-0003Th-KV; Tue, 28 Jan 2020 15:52:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BI69atedn0d0YgCA/NXjtuGhBN3ldp69Y3ftPXrX6/McZA87M7TLPve4SlIpAAFFcvoa4bAH2qfaXqhVLuIOs0rxtwP7RoRMjQ8q4YRkjjoF1tHwAWbPL6rTTuthTFxSQta7me8OfmcjvhroX7gpAdzfmo2kllAnv5Dh577qzMt96h0cWno2H3woB5rKeqdA0okPwySfill08AIZSUy0O/BgFNPkvhV8fDdKSAbk4BWk47IpVFwWU+Nm3uGX1ITWioWCC/1CA+NYfTspIMbev6nf2LMVDAl0hlS/mgx2zxhYYAcAcjhUPE+uCTth1IrzH3D/IXilOVYPwa4TqIomxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M6oIABO64peGdUgebzkknXDCPbMwpW8AVZV4jBhVATk=;
 b=QWBWgAAGDGv+L7fjZoxQ7f+Eo3zycAe+roXdSQi5vCNsyRGDL3QlqRXwfVQZwrGS37Obn5IGY1OzeeYaU5UrhylGc38T8Qh0d6XlZ9wQHEuPe4XT518xMP/72T/okmZxwgtgJHcANVruFH1ShygUIO2rc6N8+NbeGyklaSHBa9mvd8a4G4Z/WM8+KfrnPSJJDbtdG2HdETGK0Fx7xIunzocH8HUE1S5DctbFuWg9MfH91/8FYc+tfhH9JA5jxYdANWwvZpY7/CW5VrTQto6V/BNMJFl6LPzTpmu2u08EmFxoFXmIVtc26IBT2v5uQeXyX9jhkN9PsP5KIo1NY4gYqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=micron.com; dmarc=pass action=none header.from=micron.com;
 dkim=pass header.d=micron.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=micron.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M6oIABO64peGdUgebzkknXDCPbMwpW8AVZV4jBhVATk=;
 b=Sx4TkIe7I4G+K6ehXDv/Wyka6bLhCLcxCBSu0Fl9eUoMlQ490H6WNdXX9ddnMi/ahVgJxTVBXS0vvTIE8TP2EIExHvJ4EwpZTx1NkMnC2NESxrHDmGDJvq/V6a8LQh13htt/fY5aM8jSEVNF2PScpCLETVi4wdNcq0UUb52eNgo=
Received: from BN7PR08MB5684.namprd08.prod.outlook.com (20.176.179.87) by
 BN7PR08MB5218.namprd08.prod.outlook.com (20.176.26.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.23; Tue, 28 Jan 2020 15:52:39 +0000
Received: from BN7PR08MB5684.namprd08.prod.outlook.com
 ([fe80::981f:90d7:d45f:fd11]) by BN7PR08MB5684.namprd08.prod.outlook.com
 ([fe80::981f:90d7:d45f:fd11%7]) with mapi id 15.20.2665.026; Tue, 28 Jan 2020
 15:52:39 +0000
From: "Bean Huo (beanhuo)" <beanhuo@micron.com>
To: Stanley Chu <stanley.chu@mediatek.com>, "linux-scsi@vger.kernel.org"
 <linux-scsi@vger.kernel.org>, "martin.petersen@oracle.com"
 <martin.petersen@oracle.com>, "avri.altman@wdc.com" <avri.altman@wdc.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>, "jejb@linux.ibm.com"
 <jejb@linux.ibm.com>
Subject: RE: [EXT] [PATCH v2 4/5] scsi: ufs: fix auto-hibern8 error detection
Thread-Topic: [EXT] [PATCH v2 4/5] scsi: ufs: fix auto-hibern8 error detection
Thread-Index: AQHV0sgOxqR8fX8uLEyPL9wOuGiy7agAPIkQ
Date: Tue, 28 Jan 2020 15:52:38 +0000
Message-ID: <BN7PR08MB56840A622E2170C4F913A5D7DB0A0@BN7PR08MB5684.namprd08.prod.outlook.com>
References: <20200124150743.15110-1-stanley.chu@mediatek.com>
 <20200124150743.15110-5-stanley.chu@mediatek.com>
In-Reply-To: <20200124150743.15110-5-stanley.chu@mediatek.com>
Accept-Language: en-150, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=beanhuo@micron.com; 
x-originating-ip: [165.225.81.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ca9d8711-71f7-49e0-3b46-08d7a40a1a19
x-ms-traffictypediagnostic: BN7PR08MB5218:|BN7PR08MB5218:|BN7PR08MB5218:
x-microsoft-antispam-prvs: <BN7PR08MB52186AA7407FC58AB78AD9A7DB0A0@BN7PR08MB5218.namprd08.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:1417;
x-forefront-prvs: 029651C7A1
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(366004)(376002)(396003)(136003)(189003)(199004)(76116006)(66946007)(66476007)(316002)(66556008)(5660300002)(64756008)(558084003)(52536014)(66446008)(7696005)(478600001)(33656002)(71200400001)(110136005)(4326008)(54906003)(186003)(6506007)(55236004)(86362001)(2906002)(9686003)(55016002)(26005)(8936002)(7416002)(81156014)(81166006)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR08MB5218;
 H:BN7PR08MB5684.namprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: micron.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vW/B94jKzjMvyCV+MJP2jbXxg3gG/kFFxbbiIVPbNJJ1YQsWrTWgdINe0ms69iuObiStS7Lgkis7YvA3AWZ8eg6/qb9HTy7b0+TsZSxZW8aIosrK96n80jvO5j828cG7mofRiLEDX7xv9kq/Y9HCejJc1ZQdpaI7EXrR1gAZDzGyzJ8saaMZCR5I3ryXjpDqRul0wC1vx04g7UUrXglQZ+N+60/4EkP6XU15VWSH1rcI6Chk9T2+QwuT8hTggXYL/EFoDyElY4iNk6ZOjXZDt3g2DUB0PKxfuzvxby5JyvIYeVjI/AGZb//gl/XAMISlDCIy0WZBoXkLLrV1uULgKvJXaXQXo+rBhGA+g5yjvVXeOedsigT4L4DXnU5Nuf4JBCo3ohjuQNwdUg8H9uKxw61wutJaLMyCSYclxpokQ6t92TDX1RYQWLE7eX6Crekb
x-ms-exchange-antispam-messagedata: skuJrxIY3rizmcQnSRTlqIKV0bRIVZKNhrNPCOijYvNUosLJ8nViFa0enp5dLjeMcjn90zlzfEInMP2oanOP5FIKG5J597a5DooVys/IkGmL2FZ/sJxOntfe+WflFnglc+ErKUHYhKKPlwv+dOMzdA==
MIME-Version: 1.0
X-OriginatorOrg: micron.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca9d8711-71f7-49e0-3b46-08d7a40a1a19
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2020 15:52:38.5806 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f38a5ecd-2813-4862-b11b-ac1d563c806f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: whJidjkSz9ICcQ46YlQbyK5taNSuUKn1+3sZvcRPi1xtD5ew9YX4vRHolI/mMk1aCZDC1l7v++X+0TiasKMO2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR08MB5218
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200128_075242_682937_C7F2F9CC 
X-CRM114-Status: UNSURE (   5.24  )
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
Do you think it is necessary to add fixes tag, and combine this patch with previous patch to
single patch?  That will be easier to down port to the older kernel.

> 
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
Reviewed-by: Bean Huo <beanhuo@micron.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
