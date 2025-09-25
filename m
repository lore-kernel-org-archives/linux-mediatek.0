Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 077BFCAC5AE
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Sep 2025 01:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Date:References:Message-ID:In-Reply-To:From:Subject:Cc:To:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=APsWcl5kcalWORQAPT7YbnalUFOFNU+CnT9jcUG6vH4=; b=H4UTFjorMbvnlCCpVZuS6+dxD0
	EaiJVxIIHnlSN3x4rqSQaCIPe9HZmezEFTc+hb0vpLJG1z6E2vCmbvNMLnyAIUzBXDLT73XgalWJn
	O6LENNaDtRlrfv6vT3dImEYwvzEW+aVeBjp08yOWrDJVTwy/czfhEmLW0wWCl4iqEnCW4jHrLtpi4
	f1LTQvplG/g656JnXXYdiC4QOk8J9odYhWtXrOAawJ9yLxNej7uddJOV68o77D3wVpohBtvEn+8IJ
	DXtbHDemQ29Y2EGF8ee0Oz7qFwYaVfnbpQnpdOjHQpnqPmGW1mwA+2WQ051FdtERXlZYAiSzJ2R69
	cMNCHxnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1axR-00000005CxI-2k2B;
	Thu, 25 Sep 2025 01:39:41 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1axO-00000005Cw1-35U9
	for linux-mediatek@lists.infradead.org;
	Thu, 25 Sep 2025 01:39:41 +0000
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OItsUq007272;
	Thu, 25 Sep 2025 01:39:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=APsWcl5kcalWORQAPT
	7YbnalUFOFNU+CnT9jcUG6vH4=; b=ROndgR3RGB3BDYXxIvO9TGLYg0pOMqiW1b
	KacqACblFURq7O/bXqkcMcAfOGqFjl3sBbm3Q2um1sKw1hMhknq4Xq1cmmjNBnaZ
	dJ3yC9yHuBhIEV4VAyubxsf5Ci4zexnGnsJ1WaDiTNFGcFx8AQfr8SWdWrrX+uwN
	ESbFzhQoW/z64diVUILt1rv8Qxhyb75xJRCPE4C/ZYRE3p68anrdoBAik6xM4Q/3
	YN5S1ljTZlq/eaVShIrvV5bpqQjSvvaxDqpxGioxA6RawyVQcnu/kPpcBbcark7G
	Q1aMxkM3UmAdcn0KqHb1KWoldyL+0IANXcs/fRMSbT5MIpoYO9Fg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 499kvu0xs5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Sep 2025 01:39:30 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 58P09mB0030400;
	Thu, 25 Sep 2025 01:39:29 GMT
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013034.outbound.protection.outlook.com [40.93.196.34])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 499jqakgm6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Sep 2025 01:39:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DHNTo01/g7dfYBt6ilHk/AH/FmamZoGblKq3oEq0LzfMNMzKr/3HPmp+7a2XIwabBny+rY+cdKkScy5jM6EkitjMN1TqcITD76f0FnSt+fCN/nVzECr8wRP4acQWdCmuu+HvuxV4KX6/GozfRXtNdSZcwCDmg1kquKRGIJaz0OLH9m27j4kBTvO30gvJRUQjgZyLDw8SAEuZZFaIB+kV9++wqYEuTZCMXUp4l4vUI6OWbCDpI4ENql2CVsX6XhcMms6qCjNOJ42Nv1FOhSJHVLLUoajEDVgsI585cEwdhGOKNjmIDTHi+Oq0zULbSv4dmkkuqFgOVqILyxKyLUfmMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=APsWcl5kcalWORQAPT7YbnalUFOFNU+CnT9jcUG6vH4=;
 b=nfKrj/YmTVKFK3HEQwvBaRoSej8juZl0Q7LSNKk2KLb81/yZmn+g6N/yxivqqo33nIXzEwNEhtDKgQUj4JPhQMR7Ubj7apxBu/7xY39odpJiMe9MhS+w+QtvwPMX6cv8bAHBWo0rfUGlHTKRpKp3ZOejyBoXvjbShSYvsL7uUO2jxM5v5kr5iBDu4yHJXVeHz4MHHa7gv4pZA61b2+7i0Iero3pO9m6729cxE6WnupNTcHi75J5XH3BrjdV9DguML+U8+h6TzYkwXvKqrsuuzt4cfDFeHRPIEd88adScRt1pq+0Qr8GbwNcHxs+/Wsnv/1pOLe23ey2xA8/Gy6EebA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=APsWcl5kcalWORQAPT7YbnalUFOFNU+CnT9jcUG6vH4=;
 b=Kp0RMtTwQJ5jjkVTFay0le3aY1MV3NIHBmwXZHFE8SZ4QX1gfzFE14tGsKb8Fi3AtvqontGTVaRKt7iQpwMJ9VeudMH2sNibDgp8ozWrNb2XKD1hCYToAqNYmddFtWRcqr3zDZRJTEos+FggMMtzOBXK5egYvBYiFJ0lIv44C1o=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by BL3PR10MB6185.namprd10.prod.outlook.com (2603:10b6:208:3bc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Thu, 25 Sep
 2025 01:39:25 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf%6]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 01:39:25 +0000
To: <peter.wang@mediatek.com>
Cc: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
        <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>,
        <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
        <chun-hung.wu@mediatek.com>, <alice.chao@mediatek.com>,
        <cc.chou@mediatek.com>, <chaotian.jing@mediatek.com>,
        <jiajie.hao@mediatek.com>, <yi-fan.peng@mediatek.com>,
        <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
        <tun-yu.yu@mediatek.com>, <eddie.huang@mediatek.com>,
        <naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>, <bvanassche@acm.org>
Subject: Re: [PATCH v2] ufs: core: Change MCQ interrupt enable flow
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20250924091701.2982410-1-peter.wang@mediatek.com> (peter wang's
	message of "Wed, 24 Sep 2025 17:16:19 +0800")
Organization: Oracle Corporation
Message-ID: <yq1bjmzs447.fsf@ca-mkp.ca.oracle.com>
References: <20250924091701.2982410-1-peter.wang@mediatek.com>
Date: Wed, 24 Sep 2025 21:39:23 -0400
Content-Type: text/plain
X-ClientProxiedBy: YQZPR01CA0045.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:86::17) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|BL3PR10MB6185:EE_
X-MS-Office365-Filtering-Correlation-Id: 41a35a1a-2889-468c-35ed-08ddfbd45c11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?c1KB4I7uMy+zNRR90+NGma4B2El+YNwgl0lEj29MsPVPEtsaFIrenUbZM7Vn?=
 =?us-ascii?Q?63D5CPG0LdfgXhi1e9GOn1FwLtgns9DPHHj6O/Fnm1TqzqA2afErtv56uVw1?=
 =?us-ascii?Q?OMy1b6W9M/AlCMoQUXdB4d75Jc8PweH94lKj5MBvRDYmo9ozUDo+1lLbvXbl?=
 =?us-ascii?Q?IacgMQSjaRJMihFJOF5TyDuZYoKUdF/eGxLlrVoavi2qwx2HMS/UftE6LcUs?=
 =?us-ascii?Q?AXKBTuBtImmDqHlZXhc5nfO6VqLu/aXb2Gsqd1RtUEs/j/OPOJPaIubVNiFD?=
 =?us-ascii?Q?ymkF+xgl5HzjigUaaNjf2kmEBV/vCfJru2Rat7W6mzMTsJL4fz9fzSWPSFO2?=
 =?us-ascii?Q?nTvcvbYPlPUXrVOnfB/kyfEfCgrJHpH7m/LyDcO+KusO8fkIcXYCCDPpd84p?=
 =?us-ascii?Q?1t2yELM5hR0mwhYYUv1D7eBVkL6xwktOJLmlXNqHvRBfytOUnGeFkT+YVo/B?=
 =?us-ascii?Q?onH+xhZNDs/YJa7pkBLJruTDTnit49NknjwBBSnA+YgYv3Xa2dopWySdugR2?=
 =?us-ascii?Q?KUI4t1YJjZOnu0Fgt7AuFsaVTeKggjvffDa9Htf3w+A3ub+LL2+5Eef5MSek?=
 =?us-ascii?Q?v3O/nUbjVPiCH+hOIKYGQK+NezLEqd68WYEnDj0SPokuCWFQLMx6M2M6k8yZ?=
 =?us-ascii?Q?Yo6it+18eA072ABKfybXtWHiHG7+8rkFOY/HMStPAtAhFcJIRnlf0JA4GGvz?=
 =?us-ascii?Q?VCc6MUz8OpXbUIMlf0nq/tq5U2AHuqHOcyGflvUHXEnbR/iBjk/qytjBixtC?=
 =?us-ascii?Q?W39lVmuUm9INqdQT8NEDj7tr3ODZeZ/R70vMffsMlbYew9nmxx9a9On5lies?=
 =?us-ascii?Q?vZ7syY7rOxcNPWy2Ka3MIhE17xfyxuJ4qNvHD0a+GET/VDFVOBvPY9r9EO90?=
 =?us-ascii?Q?KJyI98p4BqFpJ4u5Ey1B9CoQGNJAve38dt53s4J3BKfQk0TCOAKeUa3M0DkS?=
 =?us-ascii?Q?V163nDXmHQepv0t6AV3OD1AOKlAO9QsIQ6EHKg8Gop1P8xD8PRUSQw1//QLI?=
 =?us-ascii?Q?uDKKgPmfrAOzKL3bX2TDsMUwSYHQN8+szEkFhLBi07yU3MdtZOFw+Uoefiaa?=
 =?us-ascii?Q?p/aEQFQ2yFDx7kX0g/E3YwfYr1P2DzEmfPiIXRxdVn15UTlRPeIRQ7MLse4o?=
 =?us-ascii?Q?8WSGcV2ev7C9WysTok2KKsKKqPeo2il13Cj9GtFft38cszoztyP4GAiC+fC5?=
 =?us-ascii?Q?KrRwZe1mxCNAbf3oXALypPAb7XuSRLAqJKRuPnUFKPmRtVIqKZUdDoXAUKrn?=
 =?us-ascii?Q?eIZnShrDSwsfgmujWwSGC9UCOBRoHpGissbYFc0dGFQzWtQbEb1uWU2IcT63?=
 =?us-ascii?Q?cV6vNfweP/eHfsw4eO7YtafbBbZ2SHVgXEoRcALbrhh2iu5tgnyUSHfBNeAw?=
 =?us-ascii?Q?d9Jv3cR7p5w8eT/pgHNwfvzQxEM3fsOGHcmMCQQG4QZoBHd8kA2p9S8H4AAc?=
 =?us-ascii?Q?yJ5aqzkGPjI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5338.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RAKETXHIsXNLjcnUl5ILD/lm7vwdj3cVFpKpLx/li2ovrid4sT3saeWZ/eAI?=
 =?us-ascii?Q?xMdNeYHjfXa4/X3jTH2EJxXD0IJGh5aCtPgTfAAwvDRJoDWdiU8fiEEsGU/g?=
 =?us-ascii?Q?zSAng6CA9cEfmFT2HCMU6vc4vskxc5Y7BZchkNGIpXzWAqh0P4Pk5NY6UMqF?=
 =?us-ascii?Q?CnQAVeAPnwOlkxOXnzPEcfhxbYnyAeokggwcPwjBmjV1jIU419kjRsXK3ECM?=
 =?us-ascii?Q?rGfm2SNfukwnVX4P7kxvS7MST74BwFS7VnMtsjVFM+pmRF580c0sga+fkrue?=
 =?us-ascii?Q?SmZ3JEXlBTwEuW3NJMUCu8Ow/MtjwBypZHSABCPyqALcfI0L4pYp9yTHRXVo?=
 =?us-ascii?Q?hNGm1ycJo5RjkfCb6HXbXZJgi/otfaghDvOVc8xjQWW5d4g4CP3rmBqXn25h?=
 =?us-ascii?Q?jTQLc++pGe12ic86W/zPKTKeT/5zROGTkMB7QfvRfXmmicR5j2wIoLrsnn8y?=
 =?us-ascii?Q?7Kjl3R4f3hCZMVKUWlQ24mPJj+RSjqr8vDo67bof26EssN7D4/Z9Hbr5qefK?=
 =?us-ascii?Q?BCFV42Blq6BoRnSIqx1qWiYz+AHKd+R8aR6flHciiu+lb10C2FkYhGq/M8wK?=
 =?us-ascii?Q?5gQu3ZJFnSVnwJWXgPD4EqCYH4Bio7ceuX6Nt6/Th7xnc5INjMjxVfsFInT3?=
 =?us-ascii?Q?1BYvs3WPQ9QlVuOdUacANW6++qqGz6k0Mo+DfO9QHNcLheudRRdiRc8DuFjw?=
 =?us-ascii?Q?iryno5hiAIMj41Qhn3HScL2QtDaIURKnu4nDW89ucsD3tdqyUD+lbW8zE6cN?=
 =?us-ascii?Q?OSmBjS8euTlmS/fsgF6rcAHaJLzOhZcgnfIpuVneDj4TEiYXxMjhSoRWJ6rE?=
 =?us-ascii?Q?5fkeqNWd70u8/pa2QYAO+EcmcJX2Tk39x3gDxT7IQHQ8EIo+33yFwFYW8Kgw?=
 =?us-ascii?Q?9W+CTx7BPb8W+sbnonDqGnpMMfFGMus2chJZFwYzpQ/CedImG3W1Woj5bR0r?=
 =?us-ascii?Q?+tNjUuzdLNiy2z30/4fXX+oA8qA4pIkn5gS7zhiZ2qXT1MZJQrvfiQokk1Cw?=
 =?us-ascii?Q?m/qqXDIuAWkiOUqxhPuWJeKEAJCBIGYhlnpx6dvILfU0CmZbZTn/79/oM8fd?=
 =?us-ascii?Q?48TAP3k9fKWWSGHE087zOzzHzUU+UCaGf98I/Di7yAe5OcjbDb48FKtGzxB4?=
 =?us-ascii?Q?zjnuRpU9HGxA4b3WTWJ1uuWVvZlyJnJusUSpo0aMFwbI9Ywyu6RklbIYgCln?=
 =?us-ascii?Q?NV9FNxEfeB+4DVAxMVwc/lQ7iClS7uD/Ul2GJX/7DoSr9hUortsJ1tVeGc3+?=
 =?us-ascii?Q?Aaq+21LnWg/0tfKwyz52qD8GCq1wS0gfxptqbaQ0DDSOrg0F06cUEVViE8EL?=
 =?us-ascii?Q?zOtXo6WEEgwaZFmGlK5Gytf9YNkFZUk2u7ZcPw3zB3mY8mwhStLNnWku1bq8?=
 =?us-ascii?Q?1w30JLGwFBFePRcPXUgPxvY9k1TPmra531ZgeQgurgDp1GLgAyDjLUKujKhl?=
 =?us-ascii?Q?fGpp6RT0M/K0nHH6j1K1+x0cAf1HIBAmQz1gfHXmKjhNQ+KkaKdqvNPtvFou?=
 =?us-ascii?Q?Be0LqiTauAZQWaPWvXh9LWxgUvOyalO96vWddkYl2W2yKIV7CnNk45YtdvEc?=
 =?us-ascii?Q?iWaHvX4+uPABFROetx3zhcjJS8mryr2/2/0VNBYLGRvBilteT2qH0x+2crhC?=
 =?us-ascii?Q?2Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: lRyk87QR9DsSHjXtoeSpWYZTtV4Eyy1tuORg6jpnflAJ6/atfXDajdiZcNZue9EdZEdLVr2XJBOf+XnvJ6PWL+oCWXTRPL+kk7xIjyPwzCPZUaVRkihEY5Pm1VK/HuoRfiyrCbc1CQ45ON17Ixx0y14Z/4jmW7xDYD5dHV9WITKEBtCtsSDbuYuhH+L3ujGzMhdoP5ApqDvV0I6gLb4ifD7FEWcxE/On/bTjFI6xXeJuImZrvpX6RDi98ONNgaGKLXV7GXR4ji//KC1NfgSsTEbe6W4kStThKnl3U+pg6VilAKHYQRVVZo/i0dK4z1tqBZr1o0/K/biJS1C8OCpMGe46MXphfKCJhll/UDrENFlwx9jdGvbW98A3cWRmPatGBLj8yroRBtZsYzU1CFHCAIPNEx1IWhR0AZajLvREnFmhbnyHFML4k3H5ZI8ia8Hxkh4AsIlgO/O2lry5oZLCtOBJeFJGjHj1BTEjLOeOZSoTSfAlw6zIr6uB/Mf9WBKjNwYtaO+9YHzhh6Pzqg4tzgNw2EGq955B39X8h7CVSttH6TezIWhiVFGV2CH4/Ez9sYDbuul32EZwyntyPYIRjhykLsO3eSbPxCMK9/H4TEs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41a35a1a-2889-468c-35ed-08ddfbd45c11
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 01:39:25.3761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +A4jNCfOfxGwtGjp/ZLHsBkJEQT8I4q7ySUcffsZ5NJ9L+BBj1QRLj0DU4qQFZMhJ9c9BHPDbxN/NZ35Eq7glDp3kDDWRK8QGCkq3o+4km8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6185
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 mlxlogscore=842 mlxscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509250013
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyNSBTYWx0ZWRfX7vAWLYADUWFT
 IGZ8A19G98BzVMaTaM/o1Zwx/z3E5WLWOyyZL4fYSTsKjkg0H3E2sN8CDOgZ5W72P4Zm4N9bWeV
 Zow+FkYc38bOZPiA+KloFSDW353r41yCLgyKVMZ/r0NV26ylWm/3glbCYiVc+7GwtnHFuaK+fMM
 Otl1iLionbvtcxiEVfnkAKNWUJ4Ct7bTOvy4n3d++47wPu1/yTEylG9MsEZeUVtk93kyHXyLbmY
 P0Mzv46618QGKDdhN0FxMWMGwAW+57DEjlScDk7SImR+jeGBbILDZx8gjOyJnEqmy8Zpfdt3YsQ
 s3DlBPdZ6z5nUZDYn4SYWk94cycEppTqk3Y1MOq8gf9pzWpkoCnQVGXFS6Qki6hDNxJUc+qIInj
 qMJ0zvC8
X-Authority-Analysis: v=2.4 cv=UPPdHDfy c=1 sm=1 tr=0 ts=68d49d52 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=GoEa3M9JfhUA:10 a=CEIZDvEd9kZ5D99qYfAA:9
X-Proofpoint-GUID: tUMWvoGuYQ1-y2fng0VM6P6xve_5b9ho
X-Proofpoint-ORIG-GUID: tUMWvoGuYQ1-y2fng0VM6P6xve_5b9ho
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_183938_898596_B24C48FA 
X-CRM114-Status: UNSURE (   8.91  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


Peter,

> Move the MCQ interrupt enable process to
> ufshcd_mcq_make_queues_operational to ensure that interrupts are set
> correctly when making queues operational, similar to
> ufshcd_make_hba_operational. This change addresses the issue where
> ufshcd_mcq_make_queues_operational was not fully operational due to
> missing interrupt enablement.

Updated description with clarification from Bart.

Applied to 6.18/scsi-staging, thanks!

-- 
Martin K. Petersen

