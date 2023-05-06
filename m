Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D073C77B75
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 May 2023 07:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/C5Irxu618cQxAw5Y8annEE2VyM4j/eWhIdzGU7oEfs=; b=CZs2/FPxQpYL2k3tH6tgXnTMd6
	hjDCUXyEku8Kv3o1YvKDx2mfCEqwmvttIbp0LRO8lxTThjzFdJ3bQe/rGywW695CuhIKp7cUh8PIz
	8/YsD8aUnM3ATgmKwC+8UylsU5SmIfczqJYac2SOLqx7p5j/5LaTAxyT19mIUcq5kWDr5jVorL+8a
	sDy6LffVJUpg/kH2vJyU5wB8E6BJkCHeCxPRSZK5jiKwdcYOUpsWDPX2R+LvH6GKh6N2YmGHsU9Zq
	01lq/lBl9w1S/auHgHcL76mvgURUYuQzPmGS8m+khF9L9yXjgZyhsQ2muxn2KSXI32qLFGUG7iH30
	N93SZUjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvC6V-00CkNp-32;
	Sat, 06 May 2023 07:13:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvC6S-00CkMu-1G
	for linux-mediatek@lists.infradead.org;
	Sat, 06 May 2023 07:13:14 +0000
X-UUID: 73ced016ebdd11ed83ed1395ce914268-20230506
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=/C5Irxu618cQxAw5Y8annEE2VyM4j/eWhIdzGU7oEfs=;
	b=ZjHC1m2zbkU0+K9kqEDOAHtBJzcbsUVS1yB+f6O/+atHlnZELVnxOiZMbDZhT4N2hM5FYo9P1GJFudvJtLQozY3qxZV10q9iWguN25jaoshT7amFoIlqj1h9iwE0Y2DcYGDOw+LyyfJ0ePFY48z4B9Gd3m++noca5GUqHSrp4JU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.23,REQID:46dfe268-8522-4ddc-92b5-a3cc50117ac1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:697ab71,CLOUDID:2e60eb30-6935-4eab-a959-f84f8da15543,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 73ced016ebdd11ed83ed1395ce914268-20230506
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1088883828; Sat, 06 May 2023 00:13:08 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 6 May 2023 15:13:05 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Sat, 6 May 2023 15:13:05 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Crbr65txfrLEzh80zXJnK48enQmjAZLUA1qeISkZUsObDDa4Cx7haDk+JTXBas5wsyLUcXM0gj0Z0UYgzj4hXYTtVePS8eu22gmIGQi0+B3zZAYJb7kbz7j43nQR0559DsYBoAiurqkB3k4atWmGlxaY++B8BdCE0q3u3NWEqOFENZQKnpa/YdbfTy9JTTD4D+6LbjaRKu1CVQYMLcciTrxJdy0pb6vrjY9lvuq0z2fgj2k7CeG35HIKH1SZ7JJeX+u4XqvGfzabaG99xnfZIaxRjipgfcqLJvac9Hdoe7y3ZXwj6TIFljDhEcYroEtsArQIlgPfjpeWrEPg/yoH9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/C5Irxu618cQxAw5Y8annEE2VyM4j/eWhIdzGU7oEfs=;
 b=Vo0riz3g3m/rg1PEtyssWQayhVONHcSjIFHxP43TB4fs2x0VNHFznULvqb/lBp/p67cuFwMPuDjjIYOKUAuzonOLTlEgcm34OpG6pUrleWbmQu7Xe8yy3tNU16eo4rEd0EeGUOBlAT8Cvp4BHo2fxxl4w+8TOo07LzGk2KC79V4LHTdREEUAi6XVGrBLS5jBuwkgNqbmDO6dFHd45tuA9iGQeCloYxMBb4zt1kH/nRDROVcl46qVM+F7Le7YopBKWspkJfQpCCAbNoxzbPEFtCU8eeRqtmeeMBfgLbaSDYQhjNFWCSDFJa1t54b9qSBtGPcPMkqzJUapt3mSivEaVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/C5Irxu618cQxAw5Y8annEE2VyM4j/eWhIdzGU7oEfs=;
 b=GZ6Fj5Hu8OVCLfcXRdquOEUBg3FseEekh0B2oSdzuPfdPJLyMKB7PUxea0vEKHQUze4RtXTQbBMLH2vo9IFaD0/omcyWCi2HnQHrb5lG+Slql/hmgPr2sCnn18mrZHD1G6RnS0iMmuefxGB9J3D3+xOdL2UvHYMakS/Mrt0V2Ic=
Received: from TY0PR03MB6354.apcprd03.prod.outlook.com (2603:1096:400:14a::9)
 by SEYPR03MB6961.apcprd03.prod.outlook.com (2603:1096:101:bf::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.29; Sat, 6 May
 2023 07:13:03 +0000
Received: from TY0PR03MB6354.apcprd03.prod.outlook.com
 ([fe80::d6f0:880d:41c4:8086]) by TY0PR03MB6354.apcprd03.prod.outlook.com
 ([fe80::d6f0:880d:41c4:8086%3]) with mapi id 15.20.6363.029; Sat, 6 May 2023
 07:13:03 +0000
From: Ryder Lee <Ryder.Lee@mediatek.com>
To: "kvalo@kernel.org" <kvalo@kernel.org>
CC: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
	"lorenzo.bianconi@redhat.com" <lorenzo.bianconi@redhat.com>, "nbd@nbd.name"
	<nbd@nbd.name>, =?utf-8?B?U2hheW5lIENoZW4gKOmZs+i7kuS4nik=?=
	<Shayne.Chen@mediatek.com>, =?utf-8?B?RXZlbHluIFRzYWkgKOiUoeePiumIuik=?=
	<Evelyn.Tsai@mediatek.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 1/2] wifi: mt76: mt7996: fix endianness of MT_TXD6_TX_RATE
Thread-Topic: [PATCH 1/2] wifi: mt76: mt7996: fix endianness of
 MT_TXD6_TX_RATE
Thread-Index: AQHZeY7KfLsWESwmtU23Ljrvk97pA69M4UYA
Date: Sat, 6 May 2023 07:13:03 +0000
Message-ID: <7b63b13fec174af472ccfc6e9a3856e6810375bf.camel@mediatek.com>
References: <16fa938373e3b145cb07a2c98d2428fea2abadba.1682285873.git.ryder.lee@mediatek.com>
	 <87r0s4ppih.fsf@kernel.org>
In-Reply-To: <87r0s4ppih.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY0PR03MB6354:EE_|SEYPR03MB6961:EE_
x-ms-office365-filtering-correlation-id: c0f56ff0-0526-47ae-845c-08db4e01551a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZhIPjtYrX+IKDgo8eLHNzgPDR3pOMD8CHzjgTkFmzIesDE8V5KesoyEs1Uj2XVqPDwiqmRFLaICqDRyPWLXuSIXtMlmwectzJWwsRwruo2rPhrCQefR8qj2YKvuAol8SS9N4KDBkS52do2jYbtR5FRzCaedOw0yK5jhQcTUfaFDA+rozZfkrIzlSjkX5xAlkxpwPzcIFgPrOU7EONDaN3l6WUEct0ft8njDH1kNwPxvB3z87vJj6Ae1CzQmfuNLU2xq7QuoS8jgXJ5k3S+CufoF9XPPdqM4dH8dw7HIK51cCpV/rw+tb7NvcjwMHeGj+mNekIw6bIvVwbxg/eVw5h6lvKTsQnqS2j0A369uVsp0N1w/zcwsyEC7p+klIH0wUTU6X5rq6bDDSUPb9t8sMo3e1AW1/DYWrKsaJFwoui9G2ZptNICS+t5w1yCTDAbAQ/inPXu/jQ1wVKsZCjl3iyLKYRWZ+2z5haAE6yRi6G6Nu2P2Jb5r3Y1BmhS8qyhzhTKodFWAFxX4H5UTX2mw5Ukm4ALEiaB1IkvE/VGWkjexcB96weXBKeR/KDxhIsCNsQ59WEHO6mcQCfQJdZ4Sv1x0eF4OPn9AhX4sCQ9DwNhrX2uxpz2hXS+fDFfaNMri/
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY0PR03MB6354.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(346002)(396003)(136003)(366004)(451199021)(71200400001)(6486002)(83380400001)(36756003)(2616005)(186003)(122000001)(38100700002)(86362001)(38070700005)(26005)(6506007)(6512007)(4744005)(2906002)(4326008)(76116006)(66946007)(6916009)(66556008)(66476007)(66446008)(64756008)(54906003)(41300700001)(8676002)(5660300002)(8936002)(316002)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?amloT1ZSZm1ueUk1VDlvU0t1V1FRRUxBSjVGd1drOUQzTVpsZnZTSnZKWlVL?=
 =?utf-8?B?aGcxSjlyQldEYUw5S0hObFVNOUJNVzZNQkxTRTJCS2U1aENtUkFnT0NMQkoy?=
 =?utf-8?B?c1RlL2dRY3k0ekcxV2Nvd1o3cWFFekQrek81VHB3Z3FRUEpQV2F0am1ZWDlL?=
 =?utf-8?B?Mll5bTVrTGFxR0VFTjB3SUdvQWw5ZTJ6eXkxQWhLU0hXWlZjdzdxbFJEUlpp?=
 =?utf-8?B?LzRNOFJFeDhoSUkwMjVGUnVsMmxiQkVWZHcycGhnb3d2NzV2bXYzVmJvQzZ3?=
 =?utf-8?B?UU8zSnd5MWlxL2N3Y29zbjdmUVpxWTVsd1RVSWlxSkFTNmNaeThYU1g0THhm?=
 =?utf-8?B?Nk1KbkRpUGpub0VVTXFLMGZXVy94SVkxQytsTS9meGtESzRsc1RzNmVEa0RW?=
 =?utf-8?B?WnNQdForQVV4eFNsSFJmdmhKNG5PMjRSRkFobXhDWm9MbVUzNzFpcnFnOVU1?=
 =?utf-8?B?dEJOMkw3N1pRMGNqM2p5SkxFMStWQkFTYVQ1STRmSTU5K0ZhVWNiRFJRZGtV?=
 =?utf-8?B?N2s0QTJJcjd5SG15bkg4dFgyc2pmT0xpZk5Ya2JIRG9rVmQ5ekkyOW5jbWMx?=
 =?utf-8?B?YjZIQ2JHRG8wV3FxNU5ZQXpCazJaYmRZOXBPNTFpdXJId2JVT1JGei8xMWRr?=
 =?utf-8?B?MHpINVJiR2FsbXQxZm1Yd0lyNEdIbnR4dHlzY3oxVnVCVkV0OHdhd1lhOFpn?=
 =?utf-8?B?ZFdqemh0MTJtQy9sK1pmaDhoMFM5U0R1RDgycWFZTlpZdHdmdFhJU1JVc2NG?=
 =?utf-8?B?OHhvbkVuSVJoaFllNU1iWFUyNVc3RVY4RVJhNW9GalZmcjNSd0JIVzdRZHVT?=
 =?utf-8?B?M0ZmTS9wc055cHRPZkVXSlp1UzcvVFA0TW9vdm9pZjI5QlBoRW5tclJsNHp2?=
 =?utf-8?B?K0h5bys5NHRuRHNxWWg5dWhwSVRuK2xZSjVBa1VaT3pDeHdldVdYK0ZuQU9B?=
 =?utf-8?B?N2kxQ0N6dm5kQ05wUmpsYTlFVysydndNYndTVkErYVR3b1NNaDdNT0trdGgv?=
 =?utf-8?B?VzJXMUFBVTZ3YW40ZWd3REdNbVpnNGMwdTFGWXI5NkMxYVBzQXhKZTJ0YWlP?=
 =?utf-8?B?NFV5QlUwUkVMcHl2UWY3ZXFNTWxPdVVISHBTQXdKUmR0U0xNamRoRmlpYlpS?=
 =?utf-8?B?VmFMbDA3MmI0d0ZrV09pSGw1bVBQNkZERUM0SkNwQ0VuQm4vcU84UFAraHND?=
 =?utf-8?B?S2lGekwvNk8wVDlMT0VUd3pueTlSOEpDak1HZmtkK2VTY01wdjF2cDRxampq?=
 =?utf-8?B?RVRwVGF5Z1VnV0xVb0hTOGdlakpXeER0aGdVeG5sZytKK2tkME02OENCNHJJ?=
 =?utf-8?B?aU1oQUp3Sy9mNU9oUVFMcjAxdWlCQ1BHOHc2NUw2NGNnSWNZVjdmYjBDSVZo?=
 =?utf-8?B?Y1cyK2ZNbHlKQi9JZk9NVnNwdXdSWEoyUHpHS2dIQ1N0NFV2Q2NndDlXS0NR?=
 =?utf-8?B?WFFmaHUrZTdpbnVnK042VWd5N2JZZC9oMi9McThzSlNhQlpybmF1b2luWkkr?=
 =?utf-8?B?NVdNbFNTVkhJT2lvUVZUUW9hb1M1NW1UYnNSVmQwSzRiaS9naVo4d01CaERs?=
 =?utf-8?B?N1pCTE5pMC8vd3locVhidXFLdTVqMUkvZFZyR2VCdlU1c1FPb3NWUVIza3ph?=
 =?utf-8?B?anpINEVDTDlrYTlFNUgybEx0SzZvYnl2OGliQkNnZVJ6V2YzRXdRZk1jUHEx?=
 =?utf-8?B?bkhuZFViSjBWVmdVVVJMdWJIb1VkczBndW9NT0JzVFJ6VWluR3VZZElqdWZE?=
 =?utf-8?B?NTFialQxV3hpUHc3UVR2UzVtMkpQQmJnZlBMVU9rejlrdDlzK1F6dFZ6SVFP?=
 =?utf-8?B?SzIrQjBNTEt4WFJFYm96aUlnVjBvTkV4YkNHcElNQmp3RU5QdFhRUGdCaS9F?=
 =?utf-8?B?U0J3Rm1XSW9Hd2NjbGNPMEMwSnVNNTBrVGVHakFqNm9ObjhtcmVPYjkyYkp4?=
 =?utf-8?B?ODVvQUpmR2Nha0dha1VnSm91aU5nRVlvR0pESG56WmVZL2hwMEhmck5MbkxT?=
 =?utf-8?B?eStweDJxenV4Ky90bGhSUGFvSGJmbWhCRnJscHVrK2RHcjFJYlhhc1pBVWds?=
 =?utf-8?B?RDhYT2hzU1B2OEJLV1QxN250ak4wUzlUcFlwSHFLWk9NNm4xWTgvVXlQQnVq?=
 =?utf-8?B?VzV6R0dnUDE3Z05zNkVIN3Bna25pQjh6NlU1RkovczNpeFRNRlFXWCsxNitp?=
 =?utf-8?B?VGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BECA73C0DB00EF4D89A7C7772C99BA70@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR03MB6354.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0f56ff0-0526-47ae-845c-08db4e01551a
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2023 07:13:03.2356
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 45Anlo6yVzCsFitoqGtH4l3SupucgfIp78DZDU6LJ3o7BCwuzVqVEf4hWv8IYZDJOdjlPb+XB8N7e8Mp9R7iqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6961
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230506_001312_611957_1A10C4B7 
X-CRM114-Status: GOOD (  10.37  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAyMDIzLTA0LTI4IGF0IDA4OjAzICswMzAwLCBLYWxsZSBWYWxvIHdyb3RlOg0KPiBF
eHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2ht
ZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250ZW50
Lg0KPiANCj4gDQo+IFJ5ZGVyIExlZSA8cnlkZXIubGVlQG1lZGlhdGVrLmNvbT4gd3JpdGVzOg0K
PiANCj4gPiBUbyBhdm9pZCBzcGFyc2Ugd2FybmluZzoNCj4gPiBzcGFyc2U6IHdhcm5pbmc6IGlu
dmFsaWQgYXNzaWdubWVudDogfD0NCj4gPiBzcGFyc2U6ICAgIGxlZnQgc2lkZSBoYXMgdHlwZSBy
ZXN0cmljdGVkIF9fbGUzMg0KPiA+IHNwYXJzZTogICAgcmlnaHQgc2lkZSBoYXMgdHlwZSB1bnNp
Z25lZCBsb24NCj4gPiANCj4gPiBGaXhlczogMTVlZTYyZTczNzA1ICgid2lmaTogbXQ3NjogbXQ3
OTk2OiBlbmFibGUNCj4gPiBCU1NfQ0hBTkdFRF9CQVNJQ19SQVRFUyBzdXBwb3J0IikNCj4gPiBT
aWduZWQtb2ZmLWJ5OiBSeWRlciBMZWUgPHJ5ZGVyLmxlZUBtZWRpYXRlay5jb20+DQo+IA0KPiBJ
IGd1ZXNzIHRoaXMgaXMgdGhlIGZpeCBmb3IgSmFrdWIncyByZXBvcnQ/IEkgc2hvdWxkIHRha2Ug
aXQgdG8NCj4gd2lyZWxlc3MNCj4gdGhlbj8NCg0KWWVzLCB0aGlzIGlzIGZvciB0aGF0IHNwYXJz
ZSBmaXh1cC4gWW91IGNhbiB0YWtlIGl0Lg0KDQpSeWRlcg0KDQo+IFdoYXQgYWJvdXQgcGF0Y2gg
Miwgc2hvdWxkIEkgYWxzbyB0YWtlIGl0IHRvIHdpcmVsZXNzPyBGZWxpeCwgYWNrPw0KPiANCg0K

