Return-Path: <SRS0=02OB=GO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 502CFC433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 10:08:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2E512220F
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 10:08:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2E512220F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Date:Message-ID:Subject:
	From:References:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oYuFpRBEakoE/iZtRJZ9C46sqVaT82qIkwuIU4dtghw=; b=wJz2kuAu57vj4RvL5+dhOH/te
	ua8PwLdOfZr9DoNp7doyw7QRm0cFuL1XkkHqO0LFU5V/AZ+dNWjPQt8fgtz2MrHeOu5+h194TUtQp
	0z2PSDGlQsPpxuJFWsKAOUyvh9v4w7xMuRepse6D89arsyA0svZ5bqCyid8nbn1mvdyOeIFH49Za1
	NzjjmWsV+kwD104TQbG7n69BJ4sUTC1WB2NWsvPw9SvV43UPv1cCN8iePIu09MtZbGJu89CXimzjW
	GXPlraJuCoEueZxwkr5ZPrfHNoQenSBTTCT5AnAmkItCUbhIH9IzpHa/+63ENEPRiGAWOGhwsP3N3
	6y/Mz5A4Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyu7f-00078C-1K; Mon, 11 Jan 2021 10:08:27 +0000
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyu7X-00074K-ME
 for linux-mediatek@lists.infradead.org; Mon, 11 Jan 2021 10:08:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1610359696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ARvhkssMQeJo/i/W/g/hz+RapebGQd94lMBJ67CplCE=;
 b=iWtnVoXNDF6ADZTgQcjLdfitvbIaG6aRE0mQHgyQK90ufDY35VAPlfKpjH0Q+f2kdSAlLh
 blxa7FwLq7sldFfSEgkYB9xovvoqxoSxrn+HatL6gWBzn4v+c6vGwA3pSldpsrkP5SZdDS
 eUaDr9Ayy4AAholSLWdKt67mxm3zky4=
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2050.outbound.protection.outlook.com [104.47.4.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-19-dIjTj2uQPSCwi0HoqAf_wg-1; Mon, 11 Jan 2021 11:08:14 +0100
X-MC-Unique: dIjTj2uQPSCwi0HoqAf_wg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MXOusoDc9aU342h4s7v2lAdh7AuoW0ZKfDgyxlcSAWia+LQ8jVEOI10PmS8Ssm6RRapuFSPQ5SY+xuXiFDPVd7ZD94tsVfdT73gttJdGinBiezdqOylARNZiNpLcDYdmPr4/W5B+d2VCk+kAYDJ/K8gt29De3F5kuLnPq0YQKoPC0jny3lf2BtNjAvyTNOAKco8IRFM4+EXsnYpWlcALaj2voqsNc2KrSn5Uwy7H2p+3rSmQWqXxALuzdkJnM4Py/Aqc1arSTmU9mIvPAoidCMJV5Gi3GpklUhclIrYuBT/LENk5Z/X6ptSzwragW4797NnVC+cfvszh5ol/Ky6fxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MBSwokSyeUFuahmDnMu7fyA0nFKh4WTtAZgU17MnzCI=;
 b=UMD5d+X0XQAA9AxYCNqjx7miGUBIo8n8ayGRb7H4e29AW80YsT6KmTCr8Kb/KKBcTkIjT5P61JN9UQs1/GubDoOgWRnEJ+SVIRClhPGsU3NE2iOo7ZqL6GkonLKb/7Dsey6JrkD5BwxW5FjDuP9lZQYjoTv9BtTzGlLV+5oBM6jKraqsSPEmEMgaZjuiONIZwUsmZ4QqWy45enKF/CKhLp3S9DJ365JLTIOhO6gOTdNBebKZPLDP6GEeAonPlAjcp6xIKg5mKDwiQe1EUxSF6fR6iwWNWQBCqVnQcNT0UBoxc+3SpnftUMfXv+JoHVJp+Tm7UlRg/mIN+FvXYUi6lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: fi.rohmeurope.com; dkim=none (message not signed)
 header.d=none; fi.rohmeurope.com; dmarc=none action=none header.from=suse.com; 
Received: from AM6PR04MB5366.eurprd04.prod.outlook.com (2603:10a6:20b:9d::19)
 by AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Mon, 11 Jan
 2021 10:08:13 +0000
Received: from AM6PR04MB5366.eurprd04.prod.outlook.com
 ([fe80::58d1:4050:d882:3ca0]) by AM6PR04MB5366.eurprd04.prod.outlook.com
 ([fe80::58d1:4050:d882:3ca0%7]) with mapi id 15.20.3742.012; Mon, 11 Jan 2021
 10:08:13 +0000
To: =?UTF-8?B?Z2VuZV9jaGVuKOmZs+S/iuWuhyk=?= <gene_chen@richtek.com>,
 "matthias.bgg@kernel.org" <matthias.bgg@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
References: <20210109112612.1221-1-matthias.bgg@kernel.org>
 <b358179732f940f883c12dd1276f855a@richtek.com>
From: Matthias Brugger <mbrugger@suse.com>
Subject: Re: [PATCH v2 1/3] regulator: mt6360: Add OF match table
Message-ID: <8a5b2d7a-cd31-ecbb-bdc2-35c881c9068d@suse.com>
Date: Mon, 11 Jan 2021 11:08:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <b358179732f940f883c12dd1276f855a@richtek.com>
Content-Language: en-US
X-Originating-IP: [213.195.126.134]
X-ClientProxiedBy: AM0PR01CA0164.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::33) To AM6PR04MB5366.eurprd04.prod.outlook.com
 (2603:10a6:20b:9d::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ziggy.stardust (213.195.126.134) by
 AM0PR01CA0164.eurprd01.prod.exchangelabs.com (2603:10a6:208:aa::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Mon, 11 Jan 2021 10:08:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 497418d0-5834-45ff-29c2-08d8b618ce70
X-MS-TrafficTypeDiagnostic: AM7PR04MB7157:
X-Microsoft-Antispam-PRVS: <AM7PR04MB715704111440A5B51E4884F3BAAB0@AM7PR04MB7157.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r+IfZ79WEJIxLu2b89HCU14Ju/Wk4iHV60NqHAUdpQPNK5sVxfMXdSVf3P9uVPAF6Ol1E0r6mw03ld3EjfaMP0rZEEhXrK4UazBsNIVmEbneNGotTfr1vWOsKxiVT9pPd0/6UNEreRVPov9lXyPHR9M8TOEWHN9wa2B/LWYzOliUK+ybBMFBKpUBGsC1KHa+VoOju/Anf/Gby8eloDAjGGxApM+l+CBQvjucPcshmEmE9aHF+77iyTX6TmzSQN3w4J1CMxlowFzp7QAGeTsReBzCQaFfpE2GwVM5RiL6fRAoV4quay5bTDRkUlgi74rMbFHBFH/PnQfzgeoPrI9asc6/iSnMQ0KgC1+5jbHtSZCv5+JjmjFtGBoAkFmvWlT2sHBg5YN+P0O0HDjI9RE77nuQv69HGkCe6kd83e1IbChKjljDhNEBNwBxJOl+acB6OLFjz9MiQdeHm07IP+5gq5V7aK+ilVBDkgjhLF2m8U/mgPnxfl36RmzP3PjH/bOtntyrboMkIISZRsYZu8nljQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB5366.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(366004)(376002)(136003)(39860400002)(396003)(8936002)(110136005)(5009610100001)(8676002)(83380400001)(53546011)(54906003)(6512007)(316002)(7416002)(6486002)(2906002)(52116002)(36756003)(478600001)(956004)(2616005)(966005)(66946007)(5660300002)(66476007)(66556008)(31686004)(16526019)(26005)(186003)(6506007)(86362001)(31696002)(4326008)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?pcszFiznf1jMMp9AipwS6SFvm2l+Tx8QoGzOcaqItV+oa1kwYec81Gxzjus9?=
 =?us-ascii?Q?TPF2NogBURPTzKk9tvZvxaeup5MpsyvF4D5MU+BfSHoiBMxS/HcuUW6urlDP?=
 =?us-ascii?Q?rNF0o/kaZZQ+bGLSIOvRjbxk77yWUwwV/wpDM97/nCvZzObnt2MRoJ/jFa9m?=
 =?us-ascii?Q?EmAYmmkRBQRdRiIdVGLqUiBHGhj9hLA7tKcOPGAh4LyeEv9Bu5R/4SUmwQmG?=
 =?us-ascii?Q?84zER8BGKBJIlnJ0k7jSF1RObhrGsMaXZLwm0JMAkYoXJpQf3lp4lW7iHrrJ?=
 =?us-ascii?Q?XFLHVSpdoAW4m868ICw4bnSGJlHYk4xMLW1Krve8EX/cEcCl17w+VvCCz6et?=
 =?us-ascii?Q?U3I0Kx41qyyfZIYzB/iZvIPXP1UUJK2sHVc2Vy19/RZs8vAohNAkIiv4+xpD?=
 =?us-ascii?Q?/MAKZEgBlDFvnR9kbJ6/MllAUXeLCG3FU+fL2wPDDap1mDp43zBhfkXJo0Kg?=
 =?us-ascii?Q?+iuNvuNs9oqLThur8wS8sDKLL17IJ0Z5yMcSxAHs1UZZflS6YhXfIa/r6Vg+?=
 =?us-ascii?Q?wwCSS1oV05TaPJh+6ZipkEze177cDCcLEvHJ0Lopw9BWRRominROxErkQ4p8?=
 =?us-ascii?Q?GYIS41kYzPSm7Mhc2P7a/YkSkiS6ZxUvZ3fgBzowtpu8f5pts+5Q9EELGqwQ?=
 =?us-ascii?Q?8fLSC2C/v8I659BTE2D+36NuLpGHyratCdShzUxk3aEx4Z+Z4H06Im30IT4c?=
 =?us-ascii?Q?0etX2WpLky8ynoD+/DNnG0bfpPMxkY+sjYKoBuvPNwcVpCSeIocbAQAssW7L?=
 =?us-ascii?Q?Yj8uMoz1v4EqvpSPstIh2ylKCQjs9HEJhqrsnPCreOyj4XOtrDQpflPKR9CP?=
 =?us-ascii?Q?PIwZ79Yvvcu1JNShGLwwUeSNjWHG/4wPxNikRflYJpAoOoSvbwNdZIPYJ+BL?=
 =?us-ascii?Q?iq23jiwxPuCdSqxc1XgfN7C/KJXj2X2aVtzetZTxxkRGVrIRCT9wTkwx5m/a?=
 =?us-ascii?Q?dHtY8oKaUwuj/7Y9bVWCLsGapSQBZAg2GE56a1NWRC1FW30TYgFQ8PpVjRx6?=
 =?us-ascii?Q?JIbR?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2021 10:08:12.9953 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-Network-Message-Id: 497418d0-5834-45ff-29c2-08d8b618ce70
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ab23dZ+KnXlTkdrGdwwZfRvx3goVurE791H9e5/gMCSqNYZ0HJg8hYpWgCEG7EE2xe+4bxjct4r2ACCTsJWd2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_050819_933289_29CFCFB0 
X-CRM114-Status: GOOD (  21.16  )
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
Cc: Axel Lin <axel.lin@ingics.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chen Zhong <chen.zhong@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

CgpPbiAxMS8wMS8yMDIxIDAzOjE4LCBnZW5lX2NoZW4os6+rVKZ0KSB3cm90ZToKPiBbIEludGVy
bmFsIFVzZSAtIEV4dGVybmFsIF0KPiAKClBsZWFzZSBkb24ndCB0b3AtcG9zdCBpbiB0aGUgZnV0
dXJlLgoKPiBIaSBNYXR0aGlhcywKPiAKPiBJIGRpc2N1c3NlZCBPRiBtYXRjaCB0YWJsZSB3aXRo
IE1hcmsgaW4gcHJldmlvdXMgbWFpbCBpbiBvdXIgUEFUQ0ggdjMsCj4gTUZEIHNob3VsZCBqdXN0
IGluc3RhbnRpYXRlIHRoZSBwbGF0Zm9ybSBkZXZpY2UuCgpEaWQgeW91IGV2ZXIgdGVzdCB0aGF0
PyBXaGljaCBNRkQgZHJpdmVyIHNob3VsZCBpbnN0YW50aWF0ZSB0aGUgZGV2aWNlPwpJIGhhZCBh
IGxvb2sgYXQgbXQ2MzYwLWNvcmUuYyAodGhlIG9idmlvdXMgb25lKSBidXQgSSBkb24ndCBzZWUg
YW55IHJlZmVyZW5jZSB0bwp0aGUgcmVndWxhdG9yIFsxXS4gV2hhdCBhbSBJIG1pc3Npbmc/Cgo+
IAo+PiBNYXJrIEJyb3duIDxicm9vbmllQGtlcm5lbC5vcmc+IKnzIDIwMjCmfjik6zIwpOkgtmel
fCCkVaTINzo0NbxnuUShRwo+IAo+Pj4gVGhpcyBkZXZpY2Ugb25seSBleGlzdHMgaW4gdGhlIGNv
bnRleHQgb2YgYSBzaW5nbGUgcGFyZW50IGRldmljZSwgdGhlcmUKPj4+IHNob3VsZCBiZSBubyBu
ZWVkIGZvciBhIGNvbXBhdGlibGUgc3RyaW5nIGhlcmUgLSB0aGlzIGlzIGp1c3QgYSBkZXRhaWwK
Pj4+IG9mIGhvdyBMaW51eCBkb2VzIHRoaW5ncy4gIFRoZSBNRkQgc2hvdWxkIGp1c3QgaW5zdG50
aWF0ZSB0aGUgcGxhdGZvcm0KPj4+IGRldmljZS4KPiAKPj4gVHJ5aW5nIHRvIGF1dG9sb2FkIG1v
ZHVsZSB3aXRob3V0IG9mX2lkX3RhYmxlIHdpbGwgY2F1c2UgcnVuLXRpbWUgZXJyb3I6Cj4+IHVl
dmVudGQ6IExvYWRXaXRoQWxpYXNlcyB3YXMgdW5hYmxlIHRvIGxvYWQKPj4gb2Y6TnJlZ3VsYXRv
clQobnVsbClDbWVkaWF0ZWssbXQ2MzYwLXJlZ3VsYXRvcgo+IAo+IFlvdSBzaG91bGRuJ3QgaGF2
ZSB0aGlzIGRlc2NyaWJlZCBpbiB0aGUgZGV2aWNlIHRyZWUgYXQgYWxsLCBsaWtlIEkgc2F5Cj4g
dGhlIE1GRCBzaG91bGQganVzdCBpbnN0YW50aWF0ZSB0aGUgcGxhdGZvcm0gZGV2aWNlLgo+IAoK
V2VsbCBmcm9tIG15IHVuZGVyc3RhbmRpbmcgdGhlIHJlZ3VsYXRvciBoYXMgYSBkZXZpY2UtdHJl
ZSBlbnRyeSBbMl0sIHNvIGl0Cm5lZWRzIHRvIG1hdGNoIGFnYWluc3QgYSBkZXZpY2UtdHJlZSBu
b2RlLiBNeSB1bmRlcnN0YW5kaW5nIGlzLCB0aGF0IHlvdSBuZWVkIGEKdGhlIGRldmljZXRyZWUg
bm9kZSB0byBkZXNjcmliZSB0aGUgcmVndWxhdG9ycyBwcm92aWRlZCBieSB0aGUgZGV2aWNlLiBU
QkggSSdtIGEKYml0IHB1enpsZWQgYWJvdXQgdGhlIGNvbW1lbnQgZnJvbSBNYXJrIGhlcmUuIEhv
dyBkb2VzIGFub3RoZXIgRFQgbm9kZSBiZSBhYmxlCnRvIHJlZmVyZW5jZSBhIHJlZ3VsYXRvciBp
ZiB0aGlzIGlzIG5vdCBkZXNjcmliZWQgaW4gRFQ/IEkgdGhpbmsgd2UgbmVlZCBhIERUCm5vZGUg
aGVyZSBhbmQgdGhlIG1hdGNoaW5nIGluIHRoZSByZWd1bGF0b3IgYW5kIE1GRCBkcml2ZXIgdG8g
Z2V0IHRoZSByZWd1bGF0b3IKbG9hZGVkIHZpYSB1ZGV2LgoKUmVnYXJkcywKTWF0dGhpYXMKClsx
XSBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC9sYXRlc3Qvc291cmNlL2RyaXZlcnMv
bWZkL210NjM2MC1jb3JlLmMjTDI5NApbMl0KaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGlu
dXgvdjUuMTAuNi9zb3VyY2UvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3JlZ3Vs
YXRvci9tdDYzNjAtcmVndWxhdG9yLnlhbWwKCj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
Cj4+IEZyb206IG1hdHRoaWFzLmJnZ0BrZXJuZWwub3JnIDxtYXR0aGlhcy5iZ2dAa2VybmVsLm9y
Zz4KPj4gU2VudDogU2F0dXJkYXksIEphbnVhcnkgOSwgMjAyMSA3OjI2IFBNCj4+IFRvOiBMaWFt
IEdpcmR3b29kIDxsZ2lyZHdvb2RAZ21haWwuY29tPjsgTWFyayBCcm93bgo+PiA8YnJvb25pZUBr
ZXJuZWwub3JnPgo+PiBDYzogSHNpbi1Ic2l1bmcgV2FuZyA8aHNpbi1oc2l1bmcud2FuZ0BtZWRp
YXRlay5jb20+OyBBeGVsIExpbgo+PiA8YXhlbC5saW5AaW5naWNzLmNvbT47IENoZW4gWmhvbmcg
PGNoZW4uemhvbmdAbWVkaWF0ZWsuY29tPjsKPj4gZ2VuZV9jaGVuKLOvq1SmdCkgPGdlbmVfY2hl
bkByaWNodGVrLmNvbT47IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7Cj4+IGxpbnV4LW1l
ZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFk
ZWFkLm9yZzsKPj4gTWF0dGhpYXMgQnJ1Z2dlciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT47IE1h
dHRpIFZhaXR0aW5lbgo+PiA8bWF0dGkudmFpdHRpbmVuQGZpLnJvaG1ldXJvcGUuY29tPjsgTWF0
dGhpYXMgQnJ1Z2dlcgo+PiA8bWJydWdnZXJAc3VzZS5jb20+Cj4+IFN1YmplY3Q6IFtQQVRDSCB2
MiAxLzNdIHJlZ3VsYXRvcjogbXQ2MzYwOiBBZGQgT0YgbWF0Y2ggdGFibGUKPj4KPj4gRnJvbTog
TWF0dGhpYXMgQnJ1Z2dlciA8bWJydWdnZXJAc3VzZS5jb20+Cj4+Cj4+IEJpbmRpbmcgZG9jdW1l
bnRhdGlvbiBtZW50aW9ucyB0aGF0IGEgY29tcGF0aWJsZSBpcyByZXF1aXJlZCBmb3IgdGhlCj4+
IE1UNjM2MCBkZXZpY2Ugbm9kZSwgYnV0IHRoZSBkcml2ZXIgZG9lc24ndCBwcm92aWRlIGEgT0Yg
bWF0Y2ggdGFibGUuCj4+Cj4+IEZpeGVzOiBkMzIxNTcxZDVlNGMgKCJyZWd1bGF0b3I6IG10NjM2
MDogQWRkIHN1cHBvcnQgZm9yIE1UNjM2MCByZWd1bGF0b3IiKQo+PiBTaWduZWQtb2ZmLWJ5OiBN
YXR0aGlhcyBCcnVnZ2VyIDxtYnJ1Z2dlckBzdXNlLmNvbT4KPj4KPj4gLS0tCj4+Cj4+IENoYW5n
ZXMgaW4gdjI6Cj4+IC0gY2hlY2sgZm9yIENPTkZJR19PRgo+PiAtIGFkZCBGaXhlcyB0YWcKPj4K
Pj4gIGRyaXZlcnMvcmVndWxhdG9yL210NjM2MC1yZWd1bGF0b3IuYyB8IDkgKysrKysrKysrCj4+
ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3JlZ3VsYXRvci9tdDYzNjAtcmVndWxhdG9yLmMKPj4gYi9kcml2ZXJzL3JlZ3VsYXRvci9t
dDYzNjAtcmVndWxhdG9yLmMKPj4gaW5kZXggMTUzMDhlZTI5YzEzLi5mN2IyNTE0ZmVhYmYgMTAw
NjQ0Cj4+IC0tLSBhL2RyaXZlcnMvcmVndWxhdG9yL210NjM2MC1yZWd1bGF0b3IuYwo+PiArKysg
Yi9kcml2ZXJzL3JlZ3VsYXRvci9tdDYzNjAtcmVndWxhdG9yLmMKPj4gQEAgLTQ0NSw5ICs0NDUs
MTggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2VfaWQKPj4gbXQ2MzYwX3Jl
Z3VsYXRvcl9pZF90YWJsZVtdID0geyAgfTsgIE1PRFVMRV9ERVZJQ0VfVEFCTEUocGxhdGZvcm0s
Cj4+IG10NjM2MF9yZWd1bGF0b3JfaWRfdGFibGUpOwo+Pgo+PiArI2lmZGVmIENPTkZJR19PRgo+
PiArc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbXQ2MzYwX29mX21hdGNoW10gPSB7
Cj4+ICt7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10NjM2MC1yZWd1bGF0b3IiLCB9LAo+PiAr
eyAvKiBzZW50aW5lbCAqLyB9LAo+PiArfTsKPj4gK01PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIG10
NjM2MF9vZl9tYXRjaCk7ICNlbmRpZgo+PiArCj4+ICBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2Ry
aXZlciBtdDYzNjBfcmVndWxhdG9yX2RyaXZlciA9IHsKPj4gIC5kcml2ZXIgPSB7Cj4+ICAubmFt
ZSA9ICJtdDYzNjAtcmVndWxhdG9yIiwKPj4gKy5vZl9tYXRjaF90YWJsZSA9IG9mX21hdGNoX3B0
cihtdDYzNjBfb2ZfbWF0Y2gpLAo+PiAgfSwKPj4gIC5wcm9iZSA9IG10NjM2MF9yZWd1bGF0b3Jf
cHJvYmUsCj4+ICAuaWRfdGFibGUgPSBtdDYzNjBfcmVndWxhdG9yX2lkX3RhYmxlLAo+PiAtLQo+
PiAyLjI5LjIKPiAqKioqKioqKioqKioqIEVtYWlsIENvbmZpZGVudGlhbGl0eSBOb3RpY2UgKioq
KioqKioqKioqKioqKioqKioKPiAKPiBUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGluIHRoaXMg
ZS1tYWlsIG1lc3NhZ2UgKGluY2x1ZGluZyBhbnkgYXR0YWNobWVudHMpIG1heSBiZSBjb25maWRl
bnRpYWwsIHByb3ByaWV0YXJ5LCBwcml2aWxlZ2VkLCBvciBvdGhlcndpc2UgZXhlbXB0IGZyb20g
ZGlzY2xvc3VyZSB1bmRlciBhcHBsaWNhYmxlIGxhd3MuIEl0IGlzIGludGVuZGVkIHRvIGJlIGNv
bnZleWVkIG9ubHkgdG8gdGhlIGRlc2lnbmF0ZWQgcmVjaXBpZW50KHMpLiBBbnkgdXNlLCBkaXNz
ZW1pbmF0aW9uLCBkaXN0cmlidXRpb24sIHByaW50aW5nLCByZXRhaW5pbmcgb3IgY29weWluZyBv
ZiB0aGlzIGUtbWFpbCAoaW5jbHVkaW5nIGl0cyBhdHRhY2htZW50cykgYnkgdW5pbnRlbmRlZCBy
ZWNpcGllbnQocykgaXMgc3RyaWN0bHkgcHJvaGliaXRlZCBhbmQgbWF5IGJlIHVubGF3ZnVsLiBJ
ZiB5b3UgYXJlIG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQgb2YgdGhpcyBlLW1haWwsIG9yIGJl
bGlldmUgdGhhdCB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGUtbWFpbCBpbiBlcnJvciwgcGxlYXNl
IG5vdGlmeSB0aGUgc2VuZGVyIGltbWVkaWF0ZWx5IChieSByZXBseWluZyB0byB0aGlzIGUtbWFp
bCksIGRlbGV0ZSBhbnkgYW5kIGFsbCBjb3BpZXMgb2YgdGhpcyBlLW1haWwgKGluY2x1ZGluZyBh
bnkgYXR0YWNobWVudHMpIGZyb20geW91ciBzeXN0ZW0sIGFuZCBkbyBub3QgZGlzY2xvc2UgdGhl
IGNvbnRlbnQgb2YgdGhpcyBlLW1haWwgdG8gYW55IG90aGVyIHBlcnNvbi4gVGhhbmsgeW91IQo+
IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0
ZWsK
