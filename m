Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B02C001DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jul 2023 03:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XBoBM7BHSrM8pQvVLgwGZKSpSbkF4hgWaufVtQXFyg4=; b=c4dPaDYNhusmkmjYZ/fPvMnviO
	vZ14Q/BvjNEsa8Td9wfer5m5yYxvCF7AgiXe1GTzCE9Z0ttTh20B5Sjx8/fnzMnPr9eRulLFJBv0f
	Dqh+Itk5h/y2QQRXW6NwA2g/uDsOPQDbu4MAfhimCToTuAwRDqFAUcGbq2yLSOnsDZm5NKH3qC9TX
	BEStRlIWM3apJlM2xWjKFE6Uav0hDUcupgPDgqg2Fo2PML0i0uMAi5QjS4QWhljtav72BcO5CIzzo
	Ib/JE8RdiZvn+dPfiHSKGRlUaVbdB782eEkQF3enUsR2Ex0/WP+YaYTISkj3DDMRqmUeb+kuyLkfC
	LhGibjAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOrJD-00BzcM-1g;
	Thu, 27 Jul 2023 03:04:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOrJA-00Bzba-1f
	for linux-mediatek@lists.infradead.org;
	Thu, 27 Jul 2023 03:04:58 +0000
X-UUID: 5931c05a2c2a11ee912e1518a6540028-20230726
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=XBoBM7BHSrM8pQvVLgwGZKSpSbkF4hgWaufVtQXFyg4=;
	b=LrmR8einjS9+o44Idzfpsffis7/C015xLMuJvYcefqwSFjIjLYgCXHKGFfuqsVLWbz181ThVUnkt58SLgbf0gbR2fLHIcdAlNf11TD6P1Vx86HukwYGoOwJJAgA0JdTK5LN3US1Uil6Kvknyq6ROTQK3t4b5Z4fGDnx1XbZOJiY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.29,REQID:899e03dd-0093-4345-b46b-5fcebb663278,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:45
X-CID-INFO: VERSION:1.1.29,REQID:899e03dd-0093-4345-b46b-5fcebb663278,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:45
X-CID-META: VersionHash:e7562a7,CLOUDID:c5988042-d291-4e62-b539-43d7d78362ba,B
	ulkID:230727110449N111G2J5,BulkQuantity:0,Recheck:0,SF:19|48|38|29|28|17|1
	02,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:ni
	l,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:PA,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,
	TF_CID_SPAM_ULN
X-UUID: 5931c05a2c2a11ee912e1518a6540028-20230726
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 108889700; Wed, 26 Jul 2023 20:04:49 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 27 Jul 2023 11:04:46 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 27 Jul 2023 11:04:46 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BpPGebeWD/yGABjmihhMA+XtzvXA0JwQO0jvwyqjMu8q0rRnZfMYSOoWzoEPlpji8Mo6JYnMe0EuPezWOau7bz3n05rzuTirEl0LOdQHJxpMzkvQsqYlPPoxRzpbIdUlLNX28u3e1maEXxKpCn4u+mrR0/wg//4F58NmdZCFw23FTzNy/AEeeCz+uoRbvMIIpizm2FmPl1xOLgQoacKJZqwOGo+9bvqoiatVjYo4IlXj2J9z3CGBAJ0IZloLOE1KGb1XZpyUam/B3ufDaT3b5iQovehNmmPP+ep/GZDuvkZieq5qJGwZrGkzki53F08TkZ4DIjqRyMw1jviXlApPFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XBoBM7BHSrM8pQvVLgwGZKSpSbkF4hgWaufVtQXFyg4=;
 b=I4+xvG6Ld3TiNCiDUmtDCvPS80LbuQx4t334EWB1aZHtJEVQpRI+9qn5Mbi7XXBvfzR0lPPQVPhQoqYT95D7UyrNqlBnF79feczjb38fS7ILOR0JNUoVEWb4t8CzCXmMZP2SnVmSEN7xR0V+1ghauK6tf0j1SGOZe74wslqin0MSVjRLXhnJqG/woVwOMdS/bDPApXGjPomZ2q5WthCWubNaSNnTxFqyeWU0uaojq3M5RFSUIc+eSzUIJwBqzoOV85in8UjdwoMD1HiyhEh6CVAxijY3KOvj7TTfVB27N03tFw1ikXNN9iD2ijCX4P2NE1kxIG2TQORNjkp8VtMRJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XBoBM7BHSrM8pQvVLgwGZKSpSbkF4hgWaufVtQXFyg4=;
 b=C5rEzvZ8JBMhWlXiuADCxWW5arH0/6XvAiwRvFfH/ZuLjpe6GQ53tfLkhjGexIac2mA0Hde09fi84fm3olotWCTgxXYDvu2aSueAXsZ1NV0F3oLahE/mfQBD0CN8JcSslYzHJw/o+VmjpI5pau2vKS3a30hUKxPCrDS9FM+F5Nw=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB8361.apcprd03.prod.outlook.com (2603:1096:101:1a5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Thu, 27 Jul
 2023 03:04:44 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::d126:7f34:9e4f:a95]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::d126:7f34:9e4f:a95%4]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 03:04:44 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"greenjustin@chromium.org" <greenjustin@chromium.org>
Subject: Re: [PATCH v2] drm/mediatek: Add valid modifier check
Thread-Topic: [PATCH v2] drm/mediatek: Add valid modifier check
Thread-Index: AQHZv/rlLei1qvOJkEKHc1f/UDL6Oq/M7jkA
Date: Thu, 27 Jul 2023 03:04:44 +0000
Message-ID: <47101b2026e0419cff265de25e8a110b19a1e8b8.camel@mediatek.com>
References: <20230726195232.1369289-1-greenjustin@chromium.org>
In-Reply-To: <20230726195232.1369289-1-greenjustin@chromium.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB8361:EE_
x-ms-office365-filtering-correlation-id: 37e44db9-8e23-400c-32fa-08db8e4e3ab5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rxlqSaLPjFgFH5s2yCl/wnHr/7GtZHa6X8jkiWqBWmD2lPm1PTausZzZTbJnJhCqp7cRL92Aeywt59IIK/9eMK4yZepW0VF+1Ez0caLQXGjUwQoAOhTxIVNfxLdLZvwHe9fPjzP0V8j9hgr0tg103EVS5jmpGQ2tXQgJViPQvvnokVQflTacSy8PiJbFpNYgp2p2MbyXUWz/A12HHaZAo0iuq/dyuin0eSXDOd3Yz8UEAaQOlCBzhRX7GbDJmNPa928j3+6BQcoX1KnsgnicJtcMlHEP6Ld03pDcTzVULUwDLO3l7adxc1RwWq95sgLimMEd+AbomuCgOhvgq1rI9RKCIqtwUY1TXf041rsgf0ZbUHZyVfZ+WANeTx0rehZYGlPnSM6yt9V8VA/Q/gcgKnQdgUEHaErEk1UCMDvXhUnZsvy4AA9j+EopYIIMgX9tQ02xd+xPTN+jxw/1V+nTOyu8hIpjTTy+4AB+cXNmSR5PZ8YhQAi2rdH1DezsVCRkGwPQA4kRg/VcNUxnHS72Vibkf8W4tKsevbQxBAvtXJX5VYXolMenPPEaLbEuJKhE61IZKgpkRzW+CXqQ9Mh9aM38tsWZW1ofttvS1MbBma1qTY/EJZkNNbDkp7QCKQ1ue9MjEO4J12xcqxaR9pw5Zrc5iaUm70s+/5Jp1vOW/hc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(39860400002)(346002)(396003)(376002)(451199021)(85182001)(86362001)(36756003)(2906002)(38070700005)(110136005)(83380400001)(186003)(6506007)(26005)(6486002)(6512007)(54906003)(38100700002)(122000001)(76116006)(478600001)(8936002)(64756008)(66556008)(41300700001)(66476007)(71200400001)(66446008)(5660300002)(316002)(66946007)(4326008)(8676002)(2616005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d00reTAzQWhmZElsbktKSkszQU9vRVRYenlNTnBENndRQjlVUXZlWmU2aE9N?=
 =?utf-8?B?Skpka0dkcURDWlBNeTJoODZZWFRQeVNNemZUOGM2RHZEaVBpL2tqck9Tc2dM?=
 =?utf-8?B?VGxoMEpVSXVZb2gwdXQ4ZmF5Vm9WSGVyVWgvK2dSYjZlWUM4RWhUcUZkbytI?=
 =?utf-8?B?bi9KYzAzck5RTCsxQUxFVXN2TUswUzNRenF3SGw2RGdCVkF0TDhPS0dGRnNT?=
 =?utf-8?B?akFnejZzY2xiWDVlRHZKNDNabkl1eGNQM1ZxUlZqUStwakFmZ3NCNGR1UW13?=
 =?utf-8?B?Y3RKQmJGSVNrK3Nkd1kvOHVUdS9YdzJabHhRdjU3Rm11aGx1eUF4Yyt1UjRj?=
 =?utf-8?B?bW5ZMUNUeVlKQnZpdlN6U1NubzZJcVY4V1ExY2dxbEpCWlowL1lVV2hScXRj?=
 =?utf-8?B?OEJrVXBJQ1VGa2NwWm0yMlNLVEpKVkdScmxuS05hMWhQRnNUallKamROK2NX?=
 =?utf-8?B?MTVCRU44NWNGRkxnODlKL3FndExJd2M4b09mTDh1UmVWb2VmWkdXREtkdVlW?=
 =?utf-8?B?OVl5clpWem1lTVEyanp5T2NoQjlESzBqSkUraFJKWWIvYXIybm8yMWpGWWJB?=
 =?utf-8?B?eng4dnl4TmlZVmc4NHdOR2M4dTBPbGdna0h0TFFCUG9rKzZmS080VldzMHR3?=
 =?utf-8?B?WEJVODNmdHRkenhYUnhmOGtIREhQT1E2aGV6WVVNU0cwb294aUZxWFhBY3BK?=
 =?utf-8?B?VFh0R2dONTAwS1VXTWNndUZnVUpYWWxlTnpCOG1xMGVKUlFKR3Ywemw3akhY?=
 =?utf-8?B?RUdwaUtuMzRLcFMzek9tdyt3b1hNL0xjVk1LdEgxbFJOUFB2QTVPRU5VRlZG?=
 =?utf-8?B?Smc4QjdibWptOXl1Y000eitYQ1h0dHowbDh6K2F0NndqTDhzQ2I1YnpCT2Y5?=
 =?utf-8?B?ZEhSOVBNTFFQdmdnUEliM2RTYzJNN0Jvd2pFMzZ4ZmdBSDFFUnJKSktreUxz?=
 =?utf-8?B?UHI1K0JUTGlKQ1JlNmp0QTVNSFc0NzZDMnNpSnFZMGttK21tSzB5dWFGcnBk?=
 =?utf-8?B?YS9ON3Z4ekRTdytydU1SdVFacG9Nb3NQRFNCdUJPdmtNcjhTcUs4Rms5S1M4?=
 =?utf-8?B?QjI3TFJmWktwMWNUcUdQRXMvNE9FNVdsQmZDcFRNTkk3N0NQc1pXbUZkeVhJ?=
 =?utf-8?B?b2w0R0o4Q20zcndRWDZndkVOQzMxempQRkNkY09iZE1ENHhNWGkrNUkvbHdn?=
 =?utf-8?B?NHhRa2MwRzNiTDVkRmdRY0JFb1EwbksvWDFQTDFLNFVCR29IZ0d6eU8zQnRF?=
 =?utf-8?B?eHdGYUJpUkFxZkQ0dUFGZ1hIMWNWdS84cGZJTnpsSXNGQUdzbGpXWjUxQmor?=
 =?utf-8?B?S2NuWnFzN1lwYW1YeXhQWGpNZjI4VlFiUWFTaHhOL1RPMUh3SVYxNi8zTVZz?=
 =?utf-8?B?RlBRNVduUU9YclA5UWxTbDVoZ05IczgrNFNmbURWNi9XUmhHT01jb29lSE50?=
 =?utf-8?B?b2p3UUdKZUpERGpEMUN4OGJoT0llZlNNQjJPZHNvYUtQOUttQVhRU2VuVlFC?=
 =?utf-8?B?d0NHTUZRZXZtQzJWdXU5RE5nTE5pRFU3WWs3bjdvcUIyM2NQd3RVM1U0dklj?=
 =?utf-8?B?M2s4cXlZWnlaQVU1eFVxMUdsSzdzQ2hhamhTdEFVU0RXc1R3WitWWkRQbGFk?=
 =?utf-8?B?ejBsNzBteDBxMTBwNldPU1pQOWZRNGI0c2p3QWs2d3UrdVQyODVrTUJqM3Ns?=
 =?utf-8?B?R0pQNE8yNjZHYTRvTlVUNFEzakFzLzYrbHMrN2ZpV3pPUFNjc2ZzNWttUnJ4?=
 =?utf-8?B?b1pneHZ6WndlYUFyMHlvQUN1NlA2V1FTdithMlpzN3JwMmZ2OHhSQzZodDRL?=
 =?utf-8?B?aEhZZ3RCMDBFWitBSmswNTFqMGs1QWxsUVBLcmFGLzJYZHVsV0xmcVBRRWlM?=
 =?utf-8?B?aFZHcGRqd1V3TmtSVDNpZTdBNS92cWVZNjh1SHdId0VwdkNMY2l5anR0V3Nq?=
 =?utf-8?B?MGtGNG5tTnJkYjkvZ2VwaHZqZTkxdnZlYndTai9wVkJmSElzUnMxV1JnUFpY?=
 =?utf-8?B?Y1AzbnpXOG8wKzN0THlqQlc0eEpQYUFmZVZTeGowY3JXclRmWi9EdEhXZUF3?=
 =?utf-8?B?bmMwS09FQjNQUk5kZi9QaVFPZWtocGFGSTI5UWVyendPaE55QjhmaDFyRW9v?=
 =?utf-8?B?UkVOamJ2Q2Q4SUJGTmlxQmFHWVpSNUVwRkNuQnRhelJHRmJ1dUtudFFkVUhO?=
 =?utf-8?B?d0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3C6A46B07D742A4195BE7D46BD86BBBB@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37e44db9-8e23-400c-32fa-08db8e4e3ab5
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2023 03:04:44.6586
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wuoSDw5tsaFIGcUQSGZkGiUJ7bqB30MqlQMwsufunahlLoZrqBr8sCHPQYhXa8X22xv8fTXlBuIkGYLnSO7gsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB8361
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_200456_698659_23287883 
X-CRM114-Status: GOOD (  18.47  )
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
Cc: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, =?utf-8?B?SnVzdGluIFllaCAo6JGJ6Iux6IyCKQ==?= <Justin.Yeh@mediatek.com>, "wenst@chromium.org" <wenst@chromium.org>, "angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEp1c3RpbjoNCg0KT24gV2VkLCAyMDIzLTA3LTI2IGF0IDE1OjUyIC0wNDAwLCBKdXN0aW4g
R3JlZW4gd3JvdGU6DQo+ICAJIA0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xp
Y2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0
aGUgc2VuZGVyIG9yIHRoZSBjb250ZW50Lg0KPiAgQWRkIGEgY2hlY2sgdG8gbXRrX2RybV9tb2Rl
X2ZiX2NyZWF0ZSgpIHRoYXQgcmVqZWN0cyBhbnkgbW9kaWZpZXINCj4gdGhhdA0KPiBpcyBub3Qg
dGhlIEFGQkMgbW9kZSBzdXBwb3J0ZWQgYnkgTVQ4MTk1J3MgZGlzcGxheSBvdmVybGF5cy4NCj4g
DQo+IFRlc3RlZCBieSBib290aW5nIENocm9tZU9TIGFuZCB2ZXJpZnlpbmcgdGhlIFVJIHdvcmtz
LCBhbmQgYnkgcnVubmluZw0KPiB0aGUgQ2hyb21lT1Mga21zX2FkZGZiX2Jhc2ljIGJpbmFyeSwg
d2hpY2ggaGFzIGEgdGVzdCBjYWxsZWQNCj4gImFkZGZiMjUtYmFkLW1vZGlmaWVyIiB0aGF0IGF0
dGVtcHRzIHRvIGNyZWF0ZSBhIGZyYW1lYnVmZmVyIHdpdGggdGhlDQo+IG1vZGlmaWVyIERSTV9G
T1JNQVRfTU9EX0lOVkFMSUQgYW5kIHZlcmlmaWVzIHRoZSBBRERGQjIgaW9jdGwgcmV0dXJucw0K
PiBFSU5WQUwuDQoNClJldmlld2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPg0KDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBKdXN0aW4gR3JlZW4gPGdyZWVuanVzdGluQGNocm9taXVtLm9y
Zz4NCj4gVGVzdGVkLWJ5OiBGZWkgU2hhbyA8ZnNoYW9AY2hyb21pdW0ub3JnPg0KPiAtLS0NCj4g
djI6DQo+ICAqIFJlcGxhY2UgemVybyBjaGVjayB3aXRoIGNvbXBhcmlzb24gdG8gRFJNX0ZPUk1B
VF9NT0RfTElORUFSLg0KPiANCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Ry
di5jIHwgNyArKysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMNCj4g
Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYw0KPiBpbmRleCBjZDViMThl
Zjc5NTEuLjI3MTlhMWUzMTYzYSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcm1fZHJ2LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cm1fZHJ2LmMNCj4gQEAgLTUxLDYgKzUxLDEzIEBAIG10a19kcm1fbW9kZV9mYl9jcmVhdGUoc3Ry
dWN0IGRybV9kZXZpY2UgKmRldiwNCj4gIAlpZiAoaW5mby0+bnVtX3BsYW5lcyAhPSAxKQ0KPiAg
CQlyZXR1cm4gRVJSX1BUUigtRUlOVkFMKTsNCj4gIA0KPiArCWlmIChjbWQtPm1vZGlmaWVyWzBd
ICE9IERSTV9GT1JNQVRfTU9EX0xJTkVBUiAmJg0KPiArCSAgICBjbWQtPm1vZGlmaWVyWzBdICE9
IERSTV9GT1JNQVRfTU9EX0FSTV9BRkJDKA0KPiArCQkJCQlBRkJDX0ZPUk1BVF9NT0RfQkxPQ0tf
U0laRV8zMng4DQo+IHwNCj4gKwkJCQkJQUZCQ19GT1JNQVRfTU9EX1NQTElUIHwNCj4gKwkJCQkJ
QUZCQ19GT1JNQVRfTU9EX1NQQVJTRSkpDQo+ICsJCXJldHVybiBFUlJfUFRSKC1FSU5WQUwpOw0K
PiArDQo+ICAJcmV0dXJuIGRybV9nZW1fZmJfY3JlYXRlKGRldiwgZmlsZSwgY21kKTsNCj4gIH0N
Cj4gIA0KPiAtLSANCj4gMi40MS4wLjQ4Ny5nNmQ3MmYzZTk5NS1nb29nDQo=

