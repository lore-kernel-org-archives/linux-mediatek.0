Return-Path: <SRS0=T8Q+=OP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30B99C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Sep 2021 19:29:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E05F86109D
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Sep 2021 19:29:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E05F86109D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NfWa4gX+hYFiIKg/w0LiBi2Kd1+uPERxw32Xx670LGo=; b=CsUc4+51O0Oz4J
	zHgvJK8jvQpW/1mzEHBMkBGL1OxD/uDOarfWpkIlN8JvI+zBjMtKDz1Fra45DgHPuu07JmQkEWTIL
	/I77B59jIB5bfAbgGHyDGdAQl8oq7HT+0yvpZMIYy/jbNh25+GFbFNhdIx9IbS6YjkV3gNv31QCc5
	/P70dyI1XSQNfXvNnxdPFkUHuAzGaDekJwYRL0RYACZ9VCFNDR0fsfe6L4+XYL17rOI7iQUna0REM
	SvCs0S7fC30HkxDHANQ/yeKBIRcWO8NI5T+jCObhxewqwRBwwkVoJsKw6xk1dTP4tdirukAvPvq1I
	3Co56Gyi4lJpLBF2xOEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUDMg-00H7jt-A7; Sat, 25 Sep 2021 19:29:38 +0000
Received: from mail-vi1eur05on2067.outbound.protection.outlook.com
 ([40.107.21.67] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUDMd-00H7jI-Ie; Sat, 25 Sep 2021 19:29:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VRx5qgcD6n41Di5exJCk3alyezI/n63FFdpFv4RtnkwcXqo4O/v2UyJMiPuKECRchEddV0siLFsR+2uktqRwGy9eSgC/kZhD4CytWo7VbEAuzAqgn3+ftYG9dapURFNNiFtuuBlyJ0MwX5v81pvZsadYTo9l3RHi/8UrfSUk1+P6Bu0/L8RtbkeHmxobgEcQoAiJex+uxQziAJRzhz0PcsJIlCuw56RiU16lA0wwdPoLrgOXsbBJ2fKvNjGqZemMYw+m/P+cTat35t+xaYyU/4qtQ/FZBVVp79qd2vfTp59jbUBeD3ZGUXF0RfcHYdEF+GO8OqfEbCJxoy7XEyh4AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=9WrFzsfMh7aJLS9V4sQZatmEJlANoU6XeUcb/5ybYD0=;
 b=dx0vKQB7HQZtkbXRnVOGBkXTHry98E+3tQ+yQwGQUwRYY8xmu2slso4vfhenWiUzvByMFV5x1YcqbDV7mzRc5XDVY4c9aNYNY62U+Y5phEh0wwh9fCAPHDCK8VWDW3KpwVcd+PJvQ+7jdFiK7o1bfYcilwvgcUk/07oiv5NxUT00JVedEy4zqA+JnNsxQIN98i0c9RC9pmive3rsIPWgG7MDB91dxSYYguRCq55cQkWEI/r73rX0lnogOlThq/7K7Yq8pxPiyiTyQvjldhtPiBRPM+KWYb3RpPlyKUnV1w7Qgi+Pd/eIQn+Fe7AqLRY/byQ7E5UvhpgM07pko++kqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9WrFzsfMh7aJLS9V4sQZatmEJlANoU6XeUcb/5ybYD0=;
 b=KO5DEoDf6OwcBAk7Yl6FsOJYduP3/7UiYOBCfY52rHblL1/+H1YEixKvd2bpcmy38rslhYb3lrUZiGL952aipg5mnAP7aOmLpr3EIaVB4tKLyblyECAm/BW/wxBcH5/dOrKsbos56h3xmFtl3oyFsfmUmx3P4qHqFIvHQzVNrvs=
Received: from VI1PR04MB5136.eurprd04.prod.outlook.com (2603:10a6:803:55::19)
 by VI1PR0402MB2863.eurprd04.prod.outlook.com (2603:10a6:800:af::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Sat, 25 Sep
 2021 19:29:32 +0000
Received: from VI1PR04MB5136.eurprd04.prod.outlook.com
 ([fe80::e157:3280:7bc3:18c4]) by VI1PR04MB5136.eurprd04.prod.outlook.com
 ([fe80::e157:3280:7bc3:18c4%5]) with mapi id 15.20.4544.020; Sat, 25 Sep 2021
 19:29:32 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Xiaoliang Yang <xiaoliang.yang_1@nxp.com>
CC: "davem@davemloft.net" <davem@davemloft.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "allan.nielsen@microchip.com" <allan.nielsen@microchip.com>,
 "joergen.andreasen@microchip.com" <joergen.andreasen@microchip.com>,
 "UNGLinuxDriver@microchip.com" <UNGLinuxDriver@microchip.com>,
 "vinicius.gomes@intel.com" <vinicius.gomes@intel.com>,
 "michael.chan@broadcom.com" <michael.chan@broadcom.com>, "vishal@chelsio.com"
 <vishal@chelsio.com>, "saeedm@mellanox.com" <saeedm@mellanox.com>,
 "jiri@mellanox.com" <jiri@mellanox.com>, "idosch@mellanox.com"
 <idosch@mellanox.com>, "alexandre.belloni@bootlin.com"
 <alexandre.belloni@bootlin.com>, "kuba@kernel.org" <kuba@kernel.org>, Po Liu
 <po.liu@nxp.com>, Leo Li <leoyang.li@nxp.com>, "f.fainelli@gmail.com"
 <f.fainelli@gmail.com>, "andrew@lunn.ch" <andrew@lunn.ch>,
 "vivien.didelot@gmail.com" <vivien.didelot@gmail.com>, Claudiu Manoil
 <claudiu.manoil@nxp.com>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "horatiu.vultur@microchip.com"
 <horatiu.vultur@microchip.com>
Subject: Re: [PATCH v5 net-next 4/9] net: mscc: ocelot: set vcap IS2 chain to
 goto PSFP chain
Thread-Topic: [PATCH v5 net-next 4/9] net: mscc: ocelot: set vcap IS2 chain to
 goto PSFP chain
Thread-Index: AQHXsSiQXnTBMaBudEWtrkFDiAJ7OKu1JQKA
Date: Sat, 25 Sep 2021 19:29:32 +0000
Message-ID: <20210925192931.rzwzjo5xyeyiwu74@skbuf>
References: <20210924095226.38079-1-xiaoliang.yang_1@nxp.com>
 <20210924095226.38079-5-xiaoliang.yang_1@nxp.com>
In-Reply-To: <20210924095226.38079-5-xiaoliang.yang_1@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 01f791bd-d74e-4997-5af3-08d9805acceb
x-ms-traffictypediagnostic: VI1PR0402MB2863:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR0402MB286343B19A36E34C627ACD51E0A59@VI1PR0402MB2863.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: POwyJIIwZFpcKpqeQWrAhKD7L257rtwtN/IKl6KuTkEbpxHwasLfcyMpOzbfmsV//4L+M9C+3kdLuaIq3M47XfQMnkgWWJQCn8L/lsIQ+JbleXJS3Hkz5NdefaekVI2nXCHzsluTZ5p4SjFi0hp8dh1MRShVRhc6g6q90oyEpFSDSAOt9srnQ7R9L/kOSoN1K9q9hfPNo7dBJTSHDQBGekD8zNAZV77iNaK1g7jL4lxJxw/iEouqY/E/NvnIkrT4IeBE9K4hUsL1ZKJGCyf+20S8KwdqEWhVy7hY9KnDPAHoqn09Yv9nMtjY5pSQka5ZotbXGzMeJiqYxMhfAOLx7jOkxBDrYTNEuTzW0lpoQaN4LuixYlnFNKcrfvTpP2lhgxX2chQZJqJzx8K9PXagnjhjozQyfCtrn6dEemPdgUkbU87n+FKEFv6NljcFUOe7thJR3wqgl4bk755dVO61mxrjR2ov8lRuc4mBn6MbZqxZOC9hy8tePsdfcr8a0RBOnd3wto2Bw5w61i2iP1xq3dcPui3YxpndKsg6YIt8nGfPzcYDtKlbMoAL2FkXI886JROTNO98MPzDmN622z/HWUD84LAPmrenKt+ifNEj+h2ZTG8NkqCsvHX++IO5CIc1W1/tvYYRcPnBvcs9yia4z8ZhkjwAdvsewIjt/UGp9TPiUg19vZtcZGtETAT0ie9GuPqIJFYEXnZHfJY4JVf3yA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5136.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(4636009)(366004)(44832011)(54906003)(186003)(2906002)(38070700005)(6636002)(122000001)(26005)(86362001)(4744005)(38100700002)(7416002)(66476007)(66556008)(64756008)(66446008)(91956017)(76116006)(4326008)(66946007)(71200400001)(5660300002)(8936002)(6512007)(6506007)(8676002)(9686003)(316002)(33716001)(508600001)(6486002)(83380400001)(1076003)(6862004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BxeljJOu9LE/pYJf9rABqNC9RZslZd6v62tkuKgLXMbDVDNOAu84YY5hEM05?=
 =?us-ascii?Q?UtqPxiBv674PM60pBck3ocQSibSnyV4UX9niwmCX9i7N1ErQIOLZRyghA3KS?=
 =?us-ascii?Q?lVENExQs3gkQlCEkJ1zs72iCGN4znK9V6RwT0pB8mU27CymG8D/hKKVcwMFz?=
 =?us-ascii?Q?+57R839noFxop93xuG+G/omCo38PuiXfbfQMj1spwgodgeJNpKuL3RTKj22v?=
 =?us-ascii?Q?snvdCNiwniSeTC8tTJ7YLWnhQAXhY7dBBJ4n0dIbH4HfmUvM71t8KUaDwcVD?=
 =?us-ascii?Q?tT4qjen9vtfY3PDcVmJc6+j/Pn6JO9SxAfBx5RODS/R5had//DeSo7GTQsyA?=
 =?us-ascii?Q?9pzRpIVz/PmuHjke5WcS1L/XqFYlRDkgwwnTSvbYv9E3YfPeS6u/xfBWnz+R?=
 =?us-ascii?Q?yfTFCQDid+woTLFABAk4DWjRwo0FGvUfhREcIkeCXZBChUyjs/3xSYz2L8Jt?=
 =?us-ascii?Q?1METOd3lxmTcaA+dLsCVGtKeQd0ZdC4K5L01/jH3wIoQA2bYv36FgjrLX+tQ?=
 =?us-ascii?Q?QThO7FcUu/8dZSUQQWRQkfYRl0M2YoZFi5XcVW3GCorjxJ7MBtGTPnsTWH07?=
 =?us-ascii?Q?eHt9w+qLiySSdIF50IzyznL5PzqIHEVEfha5MD0lW0OuaQA4W7EEQdF2bOev?=
 =?us-ascii?Q?xhUFg9/M7i6VC+sBVss0IFN+aXMOuxZicyGQEuUAX5+aZGWw7aKCW77MeKf1?=
 =?us-ascii?Q?cfrMeGOfwsGgQuhlIblRToL2Exr25+BreZRVgOn9saJ3AQmdedcvvpKTqez3?=
 =?us-ascii?Q?1airnUJl0EpEakELYxR3VYG19QdsHotpYtDO40Bj4tRRyXWvHE5owMaKG1tw?=
 =?us-ascii?Q?4HHl7ieBOlCHaGMCgU9x3dom4S6of52NBceudeJsrayAW/5yoBXGHS9O3+yp?=
 =?us-ascii?Q?rXL5hZKlMpJa2qPCHouhejtZhARgiaNEDNfJsa8L4it3zSrLKVMBM7UHceHi?=
 =?us-ascii?Q?YP6UuCIOJOtYxLtRR7k0QtCzM0bP+TIsK/eX0B5Ge9o9YqsGz6A8WtKn+TOM?=
 =?us-ascii?Q?OJc4GBw8F/dDaOArlhueeMExlBpe/ND5piGPsSOxguk4xAKzdLqcLMrw1Dih?=
 =?us-ascii?Q?xxkOS2aw8fAS2/Aw2hKoZu3CO036gHcFtw4uac+zyvB/v7GeLD86/BojWNYZ?=
 =?us-ascii?Q?iz11mIplErAM76yvT9r+QcZbNkLVwQ6JOMdNekSvwJgrY5c/F6WiwmsEzmDy?=
 =?us-ascii?Q?SDgjPfW9s3vNKeuJLhDALRtiPswtTuTXTBUhrjGuo/CXr+/QARpaPqtMlYtb?=
 =?us-ascii?Q?42V46WKyxlIjFcKSSvg7nb8so9sr1qbqbtan3FCx28dsX7J2WW0pp2FpNOVE?=
 =?us-ascii?Q?J8oluatzVmte64CCToICDr2i?=
Content-ID: <B06991D7E471694689E63246E56BF602@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5136.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01f791bd-d74e-4997-5af3-08d9805acceb
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2021 19:29:32.2514 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rpra+ZZAsTLab6z6Rl2CJnpcFy7yxfeQnGImbvEJ9dyz2q/XA5U+Gm6jlhi/6fh0ToN7VM98pum6k2g/0aSPxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2863
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210925_122935_644451_33130763 
X-CRM114-Status: UNSURE (   9.86  )
X-CRM114-Notice: Please train this message.
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

On Fri, Sep 24, 2021 at 05:52:21PM +0800, Xiaoliang Yang wrote:
> Some chips in the ocelot series such as VSC9959 support Per-Stream
> Filtering and Policing(PSFP), which is processing after VCAP blocks.
> We set this block on chain 30000 and set vcap IS2 chain to goto PSFP
> chain if hardware support.
> 
> Signed-off-by: Xiaoliang Yang <xiaoliang.yang_1@nxp.com>
> ---

Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
