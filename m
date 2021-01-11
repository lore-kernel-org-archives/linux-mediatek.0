Return-Path: <SRS0=02OB=GO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE46EC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 12:38:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63A5B223DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 12:38:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63A5B223DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Date:Message-ID:Subject:
	From:References:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=auDJA3PLWci1NuW8y0wmP/cOXCwctSGoDcCqQ/O5ZO0=; b=Cz3X+G6rhTDP+0DdphV4oPbw7
	TPanGTWNMaT/7qBJji0bSZPLky22RuZAfiR80J28frsMhId9rEtnyItO47dbg4/GKxPz2LYO0g2O8
	PL/vCJPeZWxpaf/SGunFxWZlj3hHaaLNyf8xZkrwF9h5M4Q5vDayT2yqJMfFP5Q0Sq2bBxvka1swb
	1kZrTTCZ7EKUJrvzgK6kq+77l87ZOwvPVAWI5Z3ItNVZqJZh50r3USVRixD03W0eLu7ZkwBseea/q
	XPVWF+uqbGyZT+bWUQldDl81osXjQvXPlsze9rUJ5TYs3Z6TQaSFifdbMABLF0szbmamt9DlN8z9y
	f1pAgMSWQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kywSr-0003Up-Mh; Mon, 11 Jan 2021 12:38:29 +0000
Received: from de-smtp-delivery-102.mimecast.com ([62.140.7.102])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kywSo-0003Th-Ud
 for linux-mediatek@lists.infradead.org; Mon, 11 Jan 2021 12:38:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1610368705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=is7cmiol6TRwAoeQk2PjItn3jwos5xZaWT61znh3Qa8=;
 b=nkSgngpo7HylMbAE8BiyYBpgW1j/51AqgEvBnJ6k7CMIM9mg8indiwj+/jvIW/TCu9LXmD
 RX6xPGr8jdiQxWWkSlQEIbsiuk4se8ceY9s1NX+lvV3Nz/bn0xdeMKTYMljBxR4gWpWtYX
 1/nMAVYL8vKy9SWGmyR7AATYAvN+07A=
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2109.outbound.protection.outlook.com [104.47.17.109])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-24-4HYf5GLSNpmYNJ-jqIL89g-1; Mon, 11 Jan 2021 13:38:24 +0100
X-MC-Unique: 4HYf5GLSNpmYNJ-jqIL89g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iwA0GcQDqO/Ks5g/g9O9UbTSlJCWmlOdEB6hzQwzccTOr89f679ZFzm+wUUI8DJkCZuiv4BfVUGA4ALkjpeQEGzFtDBhsEcSq5U6Q9LwPfTW9X4c3fiyV9WFGHf4y/FXfYsJs5kAph7T8EBPMzbO37Vd/UBv283fiKQ8NmlingVPq5nfIEgwruUuGeeMYe2GrcBghSWW0qEi57VHO5Hbiy+bakq5gmreSLROZxKkiZaSWQ8aAxFFzFr5bLCBh9WapDhZYL3wth4ZNGlv6m1Na1Cr+idVr4fzMiZOA48mKCkL+lRWZ1LeF9RbMERZcM7JbeAabhB2t+o8gbtMgRD4AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eNkwbmmw+1Cc7j4G81PW8YvlvJvb5xuVzFnUXsPGPeI=;
 b=eOlSQRSbtZcvu8T3T5E/+eN2IU0PjFPa2gHd9Ot8jOI9ofonxAwQK/1AssoGAiUH2RwFZZrvTBY+/RhQoiuCqspbH3H0Fb2bo+sp0P7CB6E+Nzs+hAsgZHWjGsTfcYqgz+Hu6ZlP6igPH8s9hzWn6322JIG+za9uEpwBSncw/0h4k39SRev3m2R33eue1HLxzcmGiF+xxqyxYf1YOTfZ40HGjk8iYAi9SdepHW/iUV/TeWeqC0nktC34trJcuumRdKKaZaW0D/OdFsG6Ym3PWRd+5vqe1wTZ2sZuRk79VHBmYB3PSZX6yVeAuEP8AcOkz9BXwlAoUz47fCc+SmFsBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=suse.com;
Received: from AM6PR04MB5366.eurprd04.prod.outlook.com (2603:10a6:20b:9d::19)
 by AM6PR04MB4536.eurprd04.prod.outlook.com (2603:10a6:20b:16::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.12; Mon, 11 Jan
 2021 12:38:22 +0000
Received: from AM6PR04MB5366.eurprd04.prod.outlook.com
 ([fe80::58d1:4050:d882:3ca0]) by AM6PR04MB5366.eurprd04.prod.outlook.com
 ([fe80::58d1:4050:d882:3ca0%7]) with mapi id 15.20.3742.012; Mon, 11 Jan 2021
 12:38:22 +0000
To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>,
 "matthias.bgg@kernel.org" <matthias.bgg@kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "gene_chen@richtek.com" <gene_chen@richtek.com>
References: <20210109112612.1221-1-matthias.bgg@kernel.org>
 <b358179732f940f883c12dd1276f855a@richtek.com>
 <8a5b2d7a-cd31-ecbb-bdc2-35c881c9068d@suse.com>
 <ef659bcf62c9bfcf68359f21a9c9cd0093b9b969.camel@fi.rohmeurope.com>
From: Matthias Brugger <mbrugger@suse.com>
Subject: Re: [PATCH v2 1/3] regulator: mt6360: Add OF match table
Message-ID: <b1bfe40a-8d70-4177-8afc-e2c0dfe442a3@suse.com>
Date: Mon, 11 Jan 2021 13:38:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <ef659bcf62c9bfcf68359f21a9c9cd0093b9b969.camel@fi.rohmeurope.com>
Content-Language: en-US
X-Originating-IP: [213.195.126.134]
X-ClientProxiedBy: AM0PR03CA0029.eurprd03.prod.outlook.com
 (2603:10a6:208:14::42) To AM6PR04MB5366.eurprd04.prod.outlook.com
 (2603:10a6:20b:9d::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ziggy.stardust (213.195.126.134) by
 AM0PR03CA0029.eurprd03.prod.outlook.com (2603:10a6:208:14::42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Mon, 11 Jan 2021 12:38:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ad4c6e7-b9f0-4d7f-0d2b-08d8b62dc89b
X-MS-TrafficTypeDiagnostic: AM6PR04MB4536:
X-Microsoft-Antispam-PRVS: <AM6PR04MB453634B1DB5CDF04C19D9029BAAB0@AM6PR04MB4536.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DAhO91dNMfbflffD+QD21+9CURdy8nc+4HG6hCRs75l2Emn2c5ll2anu3eaCQPP0w70CxTi399ydYnt7YaZUp+7XUpDLODqZLUd17wRidJvP88sBb7fFAR4gnXz9bi127U9AtMq/GTsnJ3slvUIs9Ybuz/RMe9gm9kuGFXaIY45vGLiAm7T9HuO3X7Yx+nTxSynv9k7dHqi3pZeP348yqlL9BgGXMbtC2EKIl6joa5VG/Tn6xn4MSvjr/us5tDbia5sH+7xDrCoXr71+lbYd9QTIDNiQhS4RQkhcpCmS79pEHV8mtvv9/4N1ZTQ6TZxniUGzOae7RaNFxf+qOmwCgjXa0yC9W0AvmArzTjVh2R+cfxYKqczn7Bs744dNtspZDVyL5uHD+5DTPp9DZnRr0YiB3pPLvldE3VUZgRS/qeo+Ou5EQ3mwt6CNJnIsx5ormf5MsHv9jO2fv6F/s0zgt2JsB7d94h0cSZzP0b+08iJZt++zatjd1OnrJKdAzQoR/hscKOgkJ9QDBP6h/XlB1w4mUUDUC0FInox7D+FNOAmaKVE/6zOK9bvgFAMaFOoP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB5366.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(346002)(136003)(376002)(366004)(396003)(5660300002)(966005)(53546011)(83380400001)(36756003)(52116002)(6512007)(86362001)(66556008)(478600001)(31686004)(110136005)(54906003)(316002)(66476007)(31696002)(66946007)(8676002)(4326008)(2906002)(26005)(186003)(7416002)(2616005)(956004)(6506007)(8936002)(16526019)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?hwP1Yr5rnCL+ROJ1WjXoYqutnvOPlUJTGnEH8y/Nhu3i6bJTTmojx1BlSxLc?=
 =?us-ascii?Q?dKQ3GIE/3mTnXzxB05BvzCgkwlhVRh1U4eZMgxO390B0OUAm1EI6yylUPtOs?=
 =?us-ascii?Q?tA2xpFyYQ8xvq0hN75eYP21ZKrMgSkcyMmX63Ng45CHQZ00osRsS4Rz+SCoC?=
 =?us-ascii?Q?RNETIwGiUJ5uJP+9QlieXkqEbYrXBUvmOlcsvjS0b9KxhAuo6r83es5PBisY?=
 =?us-ascii?Q?v0dC+aqPSbwjpeOpFgXDsTdrskzPKCrwrCMQ18gusEmOeEnmBaqzr0errydU?=
 =?us-ascii?Q?7is+K+vmNlKeqXdflTkR1+RjniJUrES+MJDBjq+2Ecj+tWFQbUsa5BJva/3R?=
 =?us-ascii?Q?fo53KbR1bx0wmFW52Nb9qGw0CMKaqMuFxBA5o3cimLKHf23D4khAaldnK8Dl?=
 =?us-ascii?Q?ZJICBNnJ/yjVrGRFrmKps9EH8vtrBSF2tbyvPp/VEywElUblpyz6bCOWb0Wp?=
 =?us-ascii?Q?lghGjgI9/gUGeSfDWVijNm0wHhNHqu8uMc3Zh8zywQnaX0q3qMKWmC89JS+O?=
 =?us-ascii?Q?vfC7L8DYY9JfEFLzAZY2EGiDV8E+8WCW4QUazCup41cGG0FeO0mBiXxesxHV?=
 =?us-ascii?Q?O8PnECsZk2A2IWl/9ncGB/oJ42SEk5/GWRldqSNQAl3x3h0m/eflHroz7TX8?=
 =?us-ascii?Q?/d9aXbG+ZzW/WoWR4eQFOM74PobKKgFxEWbd1Nmuy1BlVXMWYt+pLmA6jAsv?=
 =?us-ascii?Q?45wipB3EbiCT+Jst0NLi6CF1ieZzL8kDoiWOP2MO0SyePSA4ize7xP2ULIqQ?=
 =?us-ascii?Q?55QSgcwyuUWRupF40gXezbylKcGABn0uIa8jn4Bdx3AwkcaazlmwY2aeXF71?=
 =?us-ascii?Q?h23bpmukqI5QVOeGo5Z9RZGzB5T9nyDPybsU6ghEBI9XInNt9Kr7YzOo6KAo?=
 =?us-ascii?Q?zhwhKugm04caZmkBFFZ7kruB+3oH6AEsrCYFq9HDD+LFWn/7IDJUqgo3mLiM?=
 =?us-ascii?Q?yXUA0XDiXLSuoS5HJ9kFB/HPmmnsmV7N5XJNS77WOcRSk9qr7F6EjU/u1YEx?=
 =?us-ascii?Q?3uvf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2021 12:38:22.7703 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ad4c6e7-b9f0-4d7f-0d2b-08d8b62dc89b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8MCy/bZ2IPC2LeFJND0rMIjDEzRkFUht4KyZi6pE80V7iGx0TP4qpd45nKC3cRhgQafNb9rIsjnHCarLP5e+Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4536
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_073827_141242_5A16ECCB 
X-CRM114-Status: GOOD (  26.60  )
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
Cc: "axel.lin@ingics.com" <axel.lin@ingics.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "chen.zhong@mediatek.com" <chen.zhong@mediatek.com>,
 "hsin-hsiung.wang@mediatek.com" <hsin-hsiung.wang@mediatek.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgTWF0dGksCgpPbiAxMS8wMS8yMDIxIDExOjMyLCBWYWl0dGluZW4sIE1hdHRpIHdyb3RlOgo+
IAo+IEhlbGxvIE1hdHRoaWFzICYgQWxsLAo+IAo+IE9uIE1vbiwgMjAyMS0wMS0xMSBhdCAxMTow
OCArMDEwMCwgTWF0dGhpYXMgQnJ1Z2dlciB3cm90ZToKPj4KPj4gT24gMTEvMDEvMjAyMSAwMzox
OCwgZ2VuZV9jaGVuKOmZs+S/iuWuhykgd3JvdGU6Cj4+PiBbIEludGVybmFsIFVzZSAtIEV4dGVy
bmFsIF0KPj4+Cj4+Cj4+IFBsZWFzZSBkb24ndCB0b3AtcG9zdCBpbiB0aGUgZnV0dXJlLgo+Pgo+
Pj4gSGkgTWF0dGhpYXMsCj4+Pgo+Pj4gSSBkaXNjdXNzZWQgT0YgbWF0Y2ggdGFibGUgd2l0aCBN
YXJrIGluIHByZXZpb3VzIG1haWwgaW4gb3VyIFBBVENICj4+PiB2MywKPj4+IE1GRCBzaG91bGQg
anVzdCBpbnN0YW50aWF0ZSB0aGUgcGxhdGZvcm0gZGV2aWNlLgo+Pgo+PiBEaWQgeW91IGV2ZXIg
dGVzdCB0aGF0PyBXaGljaCBNRkQgZHJpdmVyIHNob3VsZCBpbnN0YW50aWF0ZSB0aGUKPj4gZGV2
aWNlPwo+PiBJIGhhZCBhIGxvb2sgYXQgbXQ2MzYwLWNvcmUuYyAodGhlIG9idmlvdXMgb25lKSBi
dXQgSSBkb24ndCBzZWUgYW55Cj4+IHJlZmVyZW5jZSB0bwo+PiB0aGUgcmVndWxhdG9yIFsxXS4g
V2hhdCBhbSBJIG1pc3Npbmc/Cj4+Cj4+Pj4gTWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwub3Jn
PiDmlrwgMjAyMOW5tDjmnIgyMOaXpSDpgLHlm5sg5LiL5Y2INzo0NeWvq+mBk++8mgo+Pj4+PiBU
aGlzIGRldmljZSBvbmx5IGV4aXN0cyBpbiB0aGUgY29udGV4dCBvZiBhIHNpbmdsZSBwYXJlbnQK
Pj4+Pj4gZGV2aWNlLCB0aGVyZQo+Pj4+PiBzaG91bGQgYmUgbm8gbmVlZCBmb3IgYSBjb21wYXRp
YmxlIHN0cmluZyBoZXJlIC0gdGhpcyBpcyBqdXN0IGEKPj4+Pj4gZGV0YWlsCj4+Pj4+IG9mIGhv
dyBMaW51eCBkb2VzIHRoaW5ncy4gIFRoZSBNRkQgc2hvdWxkIGp1c3QgaW5zdG50aWF0ZSB0aGUK
Pj4+Pj4gcGxhdGZvcm0KPj4+Pj4gZGV2aWNlLgo+Pj4+IFRyeWluZyB0byBhdXRvbG9hZCBtb2R1
bGUgd2l0aG91dCBvZl9pZF90YWJsZSB3aWxsIGNhdXNlIHJ1bi10aW1lIAo+Pj4+IGVycm9yOgo+
Pj4+IHVldmVudGQ6IExvYWRXaXRoQWxpYXNlcyB3YXMgdW5hYmxlIHRvIGxvYWQKPj4+PiBvZjpO
cmVndWxhdG9yVChudWxsKUNtZWRpYXRlayxtdDYzNjAtcmVndWxhdG9yCj4+Pgo+Pj4gWW91IHNo
b3VsZG4ndCBoYXZlIHRoaXMgZGVzY3JpYmVkIGluIHRoZSBkZXZpY2UgdHJlZSBhdCBhbGwsIGxp
a2UgSQo+Pj4gc2F5Cj4+PiB0aGUgTUZEIHNob3VsZCBqdXN0IGluc3RhbnRpYXRlIHRoZSBwbGF0
Zm9ybSBkZXZpY2UuCj4+Pgo+Pgo+PiBXZWxsIGZyb20gbXkgdW5kZXJzdGFuZGluZyB0aGUgcmVn
dWxhdG9yIGhhcyBhIGRldmljZS10cmVlIGVudHJ5IFsyXSwKPj4gc28gaXQKPj4gbmVlZHMgdG8g
bWF0Y2ggYWdhaW5zdCBhIGRldmljZS10cmVlIG5vZGUuIE15IHVuZGVyc3RhbmRpbmcgaXMsIHRo
YXQKPj4geW91IG5lZWQgYQo+PiB0aGUgZGV2aWNldHJlZSBub2RlIHRvIGRlc2NyaWJlIHRoZSBy
ZWd1bGF0b3JzIHByb3ZpZGVkIGJ5IHRoZQo+PiBkZXZpY2UuIFRCSCBJJ20gYQo+PiBiaXQgcHV6
emxlZCBhYm91dCB0aGUgY29tbWVudCBmcm9tIE1hcmsgaGVyZS4gSG93IGRvZXMgYW5vdGhlciBE
VAo+PiBub2RlIGJlIGFibGUKPj4gdG8gcmVmZXJlbmNlIGEgcmVndWxhdG9yIGlmIHRoaXMgaXMg
bm90IGRlc2NyaWJlZCBpbiBEVD8gSSB0aGluayB3ZQo+PiBuZWVkIGEgRFQKPj4gbm9kZSBoZXJl
IGFuZCB0aGUgbWF0Y2hpbmcgaW4gdGhlIHJlZ3VsYXRvciBhbmQgTUZEIGRyaXZlciB0byBnZXQg
dGhlCj4+IHJlZ3VsYXRvcgo+PiBsb2FkZWQgdmlhIHVkZXYuCj4gCj4gT3RoZXJzIGFyZSBiZXR0
ZXIgdG8gYW5zd2VyIC0gYnV0IGFzIEkgc3BvdHRlZCB0aGlzIGZyb20gbXkgaW5ib3ggSSdsbAo+
IGdpdmUgbXkgMiBjZW50cyA6KSAKPiAKPiBUaGlzIGNhbiBiZSBkb25lIFcvTyByZWd1bGF0b3Jz
IGhhdmluZyBvd24gY29tcGF0aWJsZS4gUGxlYXNlIHNlZQo+IGZvbGxvd2luZzoKPiAKPiBkcml2
ZXJzL21mZC9yb2htLWJkNzE4eDcuYwo+IGRyaXZlcnMvcmVndWxhdG9yL2JkNzE4eDctcmVndWxh
dG9yLmMKPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL3JvaG0sYmQ3MTg0
Ny1wbWljLnlhbWwKPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVndWxhdG9y
L3JvaG0sYmQ3MTg0Ny1yZWd1bGF0b3IueWFtbAo+IAo+IGFzIGV4YW1wbGUuCgpUaGFua3MgZm9y
IHRoZSBsaW5rcy4gWWVzIHRoYXQncycgYSB3YXkgdG8gZ28sIGJ1dC4uLgoKPiAKPiBUaGUgZGV2
aWNlIG1hdGNoaW5nIGNhbiBiZSBkb25lIHZpYSBwbGF0Zm9ybV9kZXZpY2VfaWQgdGFibGUuCj4g
SSB0aGluayB0aGUgTU9EVUxFX0FMSUFTKCkgaXMgbmVlZGVkIGZvciBtb2R1bGUgbWF0Y2hpbmcg
LSBidXQgSSBkb24ndAo+IHJlbWVtYmVyIHdpdGhvdXQgZnVydGhlciBjb2RlIGJyb3dzaW5nLgo+
IAo+IEFueXdheXMsIHRoZSBCRDcxODM3LzQ3LzUwIERUIGVudHJ5IHdpdGhvdXQgY29tcGF0aWJs
ZSBmb3IKPiBjbGsvcmVndWxhdG9ycyBkbyBwcm9iZSBhbmQgbG9hZCB0aGUgc3ViLWRldmljZXMu
Cj4gCj4gQXMgYSAidHJhZGVvZmYiIHN1YmRldmljZXMgbXVzdCByZXRyaWV2ZSB0aGUgRFQgbm9k
ZSBmcm9tIHRoZSBwYXJlbnQKPiBkZXZpY2UuCj4gCj4gRm9yIG15IHVuZWR1Y2F0ZWQgZXllcyB0
aGUgRFQgYmluZGluZyBmb3IgcmVndWxhdG9ycyBzaG91bGQgYmUgY2hhbmdlZC4KPiBDb21wYXRp
YmxlIHNob3VsZCBub3QgYmUgcmVxdWlyZWQgYW5kIHRoZSBleGFtcGxlIG5vZGUgc2hvdWxkIGJl
IG1vdmVkCj4gdG8gTUZEIGJpbmRpbmcgZG9jdW1lbnQgaW4gdGhlIE1GRCBub2RlLiBCdXQgdGhh
dCdzIGp1c3QgbXkgdmlldyBvbgo+IHRoaXMgLSBub3Qgd2lsbGluZyB0byBwdXNoIHRoaXMgdG8g
YW55IGRpcmVjdGlvbiEKPiAKCkdlbmVyYWxseSBzcGVha2luZywgRFQgYmluZGluZ3MgYXJlIHN0
YWJsZSBhbmQgY2FuJ3QgYmUgY2hhbmdlZCBpbiBhCm5vbmUtY29tcGF0aWJsZSB3YXkuIFdlIGNv
dWxkIGFyZ3VlIGlmIHRoZXJlIGlzIGFueSB1c2VyIG9mIHRoZSBjb21wYXRpYmxlIG91dAp0aGVy
ZSAocHJvYmFibHkgdGhlcmUgaXNuJ3QgYW55LCBhcyB0aGUgY29kZSBzZWVtcyB0byBub3QgZXZl
biBiZSB3b3JraW5nKS4KQXBhcnQgZnJvbSB0aGF0IGFsbCBvdGhlciBjZWxscyBpbiB0aGUgTUZE
IGRyaXZlciBhcmUgZGVmaW5lZCBhcyBPRl9NRkRfQ0VMTApbMV0uIEFjdHVhbGx5IEkgc3VzcGVj
dCB0aGF0IG10NjM2MF9sZG8gc2hvdWxkIHJlcHJlc2VudCBtdDYzNjAtcmVndWxhdG9yLgoKUmVn
YXJkcywKTWF0dGhpYXMKClsxXSBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC9sYXRl
c3Qvc291cmNlL2RyaXZlcnMvbWZkL210NjM2MC1jb3JlLmMjTDI5NAoKPiBCZXN0IFJlZ2FyZHMK
PiAJTWF0dGkgVmFpdHRpbmVuCj4gCj4gLS0KPiBNYXR0aSBWYWl0dGluZW4sIExpbnV4IGRldmlj
ZSBkcml2ZXJzCj4gUk9ITSBTZW1pY29uZHVjdG9ycywgRmlubGFuZAo+IFNXREMKPiBLaXZpaGFy
anVubGVua2tpIDFFCj4gOTAyMjAgT1VMVQo+IEZJTkxBTkQKPiAKPiB+fn4gIkkgZG9uJ3QgdGhp
bmsgc28sIiBzYWlkIFJlbmUgRGVzY2FydGVzLiBKdXN0IHRoZW4gaGUgdmFuaXNoZWQgfn5+Cj4g
Cj4gU2ltb24gc2F5cyAtIGluIExhdGluIHBsZWFzZS4KPiAibm9uIGNvZ2l0byBtZSIgZGl4aXQg
UmVuZSBEZXNjYXJ0ZSwgZGVpbmRlIGV2YW5lc2Nhdml0Cj4gCj4gKFRoYW5rcyBmb3IgdGhlIHRy
YW5zbGF0aW9uIFNpbW9uKQo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbWVkaWF0ZWsK
