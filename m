Return-Path: <SRS0=GJVM=24=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6552C33C99
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jan 2020 08:22:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE3A0207E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jan 2020 08:22:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RAA2fvd6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=micron.com header.i=@micron.com header.b="LNc1GFeE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE3A0207E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=micron.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R2my14g/bGt8GID4kYWp/171Evk0rU192HBt9heRPbk=; b=RAA2fvd6pnpMfN
	03+Oo+tI63MtEZLwgFXWPHbNLzLR6MGuLuGfioH7Vtftvs7kGfWGDFXuKakgFFQvUnZNCsag6baV5
	PPVE+Ikinll1uUv5e2CzmXkcjKRciVXDPv1saRR6brflsf1cAgdaMAkf/F9VaJ8kbV/5v3Ocnp7Ch
	iVOV83PHuAdbuqtVCppvkZdHVpUypPFog0zI2el85mS5exly/6smR/yvelDNla+Y2qVaVocb4LYLW
	ch0chP3PoBXFf5UVjzdhlk0mKTDQc8rxrLmnHIzbkJL0r+TVH5mycWLcdiWOry6dGYmy2LyPD+Pvj
	bedXhcQW9xYQ438z803w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iok7i-0007sM-6M; Tue, 07 Jan 2020 08:21:58 +0000
Received: from mail-eopbgr700049.outbound.protection.outlook.com
 ([40.107.70.49] helo=NAM04-SN1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iok7f-0007r0-HC; Tue, 07 Jan 2020 08:21:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MftLr5Q4E6e6FwDy2aMj3A2FAoLzZVLh8yeOU1c43GVBzTPFRvz6amsHu5Bsjn0L0CzVcDY3bGV31CnJ4agz5nbUG2AWj5ayNs4JxSBFFRhiQ1av/fspzmCpzWO80JckIFdorYSSDJSiLzVF/Zoeh+7WXMD9uyx4Y2YqIvbq2IMjvPZAVc36bpwMsDDVaslIP8DJz0y5KGii4q5zurMN6DLm4H/xWU4kshqy6pF6VnWWoQ0rYDssSoZ5zLDyqKN7J/6kArbxkOC0LT2SBf+CL8YMxKtg2pTo51YWcdP2YylYD4hTwGpO/nxrzPzcylgbDPNmr1JeFWuCA52VjFSSmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZTDomqYrN/WvPtLGjg+YTjp+hmq3bXyMaVRmPL8Oag4=;
 b=iwBfjzJEao4UTK9KwkHirGH6Bc0loBVKCDtJyqE+LyVgOi3sMyGtn1660I3E88Y/pecutmsGeQn4vA2Ms+SayfPFnfZCyYILa6bd3LbnENc9RbHJPFGTQdnOBvpBoEiWMYp0+PS/lUuiNIr372qTrBhj2ac5ir2UK5yP3VvoenwjrwgbhM9fckwCIlH9LR3RRbUtj+aBkiv9wt/XhuvirnFzc0jPXqJIC6JbLm3ANhL3l08R+aNwty19w2qcLXPICyskNHsUVNtDXN7DPeX2sAODNANpaRoJCbmAjoRG9ZoB2C5v7wKVzftb7FidwxlQ/RY9OkH+CEmTXqtnEZdPmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=micron.com; dmarc=pass action=none header.from=micron.com;
 dkim=pass header.d=micron.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=micron.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZTDomqYrN/WvPtLGjg+YTjp+hmq3bXyMaVRmPL8Oag4=;
 b=LNc1GFeETufYEfEmwsgnoBqcG+KPFSJiVTXLMz2ETDfN0HVYuEM/7zBlvlsWj9NmLpG7rAgrzYUaQdVqWMc1bnb2pC6iMQxBXMkjnOur2MnTTJav2RMf0Et3bfR4odL6lqpt89H8mmiT8fZ2fXCiLq8YRVaH8ES5B/PeHLzrD+I=
Received: from BN7PR08MB5684.namprd08.prod.outlook.com (20.176.179.87) by
 BN7PR08MB4161.namprd08.prod.outlook.com (52.132.222.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.10; Tue, 7 Jan 2020 08:21:49 +0000
Received: from BN7PR08MB5684.namprd08.prod.outlook.com
 ([fe80::981f:90d7:d45f:fd11]) by BN7PR08MB5684.namprd08.prod.outlook.com
 ([fe80::981f:90d7:d45f:fd11%7]) with mapi id 15.20.2602.016; Tue, 7 Jan 2020
 08:21:49 +0000
From: "Bean Huo (beanhuo)" <beanhuo@micron.com>
To: Stanley Chu <stanley.chu@mediatek.com>, "linux-scsi@vger.kernel.org"
 <linux-scsi@vger.kernel.org>, "martin.petersen@oracle.com"
 <martin.petersen@oracle.com>, "avri.altman@wdc.com" <avri.altman@wdc.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>, "jejb@linux.ibm.com"
 <jejb@linux.ibm.com>
Subject: RE: [EXT] [PATCH v2 1/2] scsi: ufs: pass device information to
 apply_dev_quirks
Thread-Topic: [EXT] [PATCH v2 1/2] scsi: ufs: pass device information to
 apply_dev_quirks
Thread-Index: AQHVxCgTBRnpUOS0L0KUX1EO/93sDKfe3j+g
Date: Tue, 7 Jan 2020 08:21:49 +0000
Message-ID: <BN7PR08MB5684CE7F0A63F42FD75DC956DB3F0@BN7PR08MB5684.namprd08.prod.outlook.com>
References: <1578270431-9873-1-git-send-email-stanley.chu@mediatek.com>
 <1578270431-9873-2-git-send-email-stanley.chu@mediatek.com>
In-Reply-To: <1578270431-9873-2-git-send-email-stanley.chu@mediatek.com>
Accept-Language: en-150, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcYmVhbmh1b1xhcHBkYXRhXHJvYW1pbmdcMDlkODQ5YjYtMzJkMy00YTQwLTg1ZWUtNmI4NGJhMjllMzViXG1zZ3NcbXNnLWJlNzc0NWMzLTMxMjYtMTFlYS04Yjg3LWRjNzE5NjFmOWRkM1xhbWUtdGVzdFxiZTc3NDVjNS0zMTI2LTExZWEtOGI4Ny1kYzcxOTYxZjlkZDNib2R5LnR4dCIgc3o9IjI2MCIgdD0iMTMyMjI4NTg5MDcyNDM2NzIzIiBoPSJIVmdheW94U0l0MFNHNDlOWnhYSXcxNkRtTGM9IiBpZD0iIiBibD0iMCIgYm89IjEiLz48L21ldGE+
x-dg-rorf: true
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=beanhuo@micron.com; 
x-originating-ip: [165.225.81.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b7501044-ed05-4d17-3acc-08d7934aa4e2
x-ms-traffictypediagnostic: BN7PR08MB4161:|BN7PR08MB4161:|BN7PR08MB4161:
x-microsoft-antispam-prvs: <BN7PR08MB4161360B9094B0C45E2F0F2ADB3F0@BN7PR08MB4161.namprd08.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:400;
x-forefront-prvs: 027578BB13
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(376002)(366004)(396003)(346002)(199004)(189003)(5660300002)(2906002)(86362001)(558084003)(8936002)(7696005)(316002)(81166006)(81156014)(52536014)(55016002)(9686003)(66946007)(55236004)(6506007)(33656002)(478600001)(76116006)(66446008)(66556008)(66476007)(64756008)(186003)(54906003)(7416002)(110136005)(71200400001)(4326008)(26005)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR08MB4161;
 H:BN7PR08MB5684.namprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: micron.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T2QJcEwxaXupX997mnRYsQ13prKsRh91oY9abxHX1swmbFvSItYoF3PhlBAzOBzkI5i1AXBpc8y7vpBPjuqa/54MGiLhKtSsworgggrfdyIo38UiRX8EhgHP7ym96aiQZC6XYmKXQzwhOOvdoKz/0uWmAPmF9cG45swrgsUEUmegAJxFbM510O/FGwru9edVAoHSdT3R3FCd/HLLNob7wU6fbzbQYjQfKSoOmOFcg0ljxLxMJIyyXwqyH1rvRByKR5BV4ib8Ld+GPzBrDkHD2Khp8OFa100tOjMBFYzDSoJ3xFK21bfFN0+8icXAe2o/d0wpb35qSBfRMPWTtnLYh4h4E6Sro45iwzsFBC5+ySr23sCjrvomEpQmH5kkoM8yPvMDSUtEuWekQwKmHZnp8kWdfcIVn5WgCMLOO5V1+3UdGhEkSi3J+6w+TP/5G78S
MIME-Version: 1.0
X-OriginatorOrg: micron.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7501044-ed05-4d17-3acc-08d7934aa4e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2020 08:21:49.7470 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f38a5ecd-2813-4862-b11b-ac1d563c806f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ve5N0OXz5W37k6RuGE8caKMq/+NqxzQvYdngIlNp942onjX5G3JXmHHIW7ve8WbceEC6J1MH3HuWiz3h5kiPOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR08MB4161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200107_002155_636956_3537D164 
X-CRM114-Status: UNSURE (   4.21  )
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

> Reviewed-by: Avri Altman <avri.altman@wdc.com>
> Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
Reviewed-by: Bean Huo <beanhuo@micron.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
