Return-Path: <SRS0=jwT2=OY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36ECDC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Oct 2021 11:46:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A74E6136F
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Oct 2021 11:46:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0A74E6136F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Date:
	Message-ID:From:References:CC:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=vBwSENQ4yTXrjlcpa5PNzOD5x2UOwWfOzlvdlW4JFbk=; b=P6/7sGDcgDQdiSUe2H3MBl4OXj
	Wc1HkbpBeWCT6bbahUp//nHICcs7LqB7hYgItU9m3qNbhK/e6YGZPMBa7zr62Iw0niITygKGrSxPv
	emdqTJbmO73N1v5SJljM949reyKyQui0w1zUX/Uzhms0OgIbghmnd08yvpEiTKY4C4/x1Pj8KaDK6
	rXZIoDiB/8BVTt8me7zfnQ/ghTa182YRDZIXfWeK/K/12/N+MR7oDBIJZWgBxokaUG2ePiAWuNePW
	JAsBxEJia9aZAfUS+I2IQPeMGKp7JgbPcMkyLQ9X1tuhulEBWVzHUzXegRuFa/GmgkX8aBLiF2O/w
	xljmA+Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXMPm-006GUk-V1; Mon, 04 Oct 2021 11:45:50 +0000
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXMP3-006GGe-Vi
 for linux-mediatek@lists.infradead.org; Mon, 04 Oct 2021 11:45:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1633347900;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6HJhGDSq7Qq3ZxqHEhSaEcPK3AccoB8ZDZ90soSKsV8=;
 b=M5nmCD5/TomJ+YPH2fNwjgKeiLJzVvHMdqOG9mgF1ogT4r6Yy57XHmenHeRYffbmBFq1JM
 156CMw4HX9Z4OlKfDzSqdZ0kEdwic+nn9nm2+OpQBED3/J4Sa7RA0Hk2fdYYe1rOtQzSZx
 2Qd2pRsl6NJhL/FbEfSxnxYZwCbviIU=
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2051.outbound.protection.outlook.com [104.47.5.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-11-DfE0Ghs0NJueObAAdyYh5Q-2; Mon, 04 Oct 2021 13:44:59 +0200
X-MC-Unique: DfE0Ghs0NJueObAAdyYh5Q-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EwvqVFxfyvUzvQc5We9xY1eYLkOVYetZJxLtE6hDkQp8EXzPBFli4/+h8YdC07wU4RLYHMCgxJMF/clFUs5RNGxClbtEOe3U9Kz+FSktQbgtBU3nmHBxwix2lRFCJOh88qZXQYHaij3tVinKSWwhpCyY9j8xHLUPSnhtmXcuF2bPYNR4pntKQnzLHcrJfCXssHh2T68uF627rDaykJsOZo8oKf0VG2lt4BU1iKHzbJShQe7LArcF2u/SNu+7Exf8dQxq4kOLYpMg3508L9WpZX/orG1biUM9izf1Fk58OoBxFIcg1MBnKntD1ohwkUqKcrEc/16AK78LjGzDhxcFOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P5yWjQdy0GDPdICeCJdHGvyoKANhQNDpuJwXdpryihs=;
 b=ngPwPJcH1NoUKq2E/CtUB+LBeBc6AI8W3dJI5xdr/5nRx8SW9s/oZ67/Jr0ea7RQmftxd53Kr6Kq1AQGFkXIb49VAqFUqeW6XXEIdVMsSATl59voxtUUv7eqYHq6qppS50DG6lIcGGgi/DX6lI6GjKoBQ6CjKsBdXVV63VhOVSiKbwPSZ9IpF7C4xUj6mGbPwNa4vZiha7EANLn4Ls3PeYylD/ZX+FgtcjYoNIBm4PcqycYJlSjDmhbOQpFU5l2On0PUIFcMgVMcD79zpQLab4FhQrvITJTPTOBY/JgHkPIyLEGGGro8ZH3nhAtwmVFtQjrP04GH2YdQGto9zvNgVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: realtek.com; dkim=none (message not signed)
 header.d=none;realtek.com; dmarc=none action=none header.from=suse.com;
Received: from DB7PR04MB5050.eurprd04.prod.outlook.com (2603:10a6:10:22::23)
 by DB7PR04MB4537.eurprd04.prod.outlook.com (2603:10a6:5:35::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Mon, 4 Oct
 2021 11:44:56 +0000
Received: from DB7PR04MB5050.eurprd04.prod.outlook.com
 ([fe80::61c5:2592:9e7f:a390]) by DB7PR04MB5050.eurprd04.prod.outlook.com
 ([fe80::61c5:2592:9e7f:a390%5]) with mapi id 15.20.4566.022; Mon, 4 Oct 2021
 11:44:56 +0000
Subject: Re: [PATCH] r8152: stop submitting rx for -EPROTO
To: Alan Stern <stern@rowland.harvard.edu>, Hayes Wang <hayeswang@realtek.com>
CC: Oliver Neukum <oneukum@suse.com>,
 Jason-ch Chen <jason-ch.chen@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "Project_Global_Chrome_Upstream_Group@mediatek.com"
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "hsinyi@google.com" <hsinyi@google.com>, nic_swsd <nic_swsd@realtek.com>
References: <20210929051812.3107-1-jason-ch.chen@mediatek.com>
 <cbd1591fc03f480c9f08cc55585e2e35@realtek.com>
 <4c2ad5e4a9747c59a55d92a8fa0c95df5821188f.camel@mediatek.com>
 <274ec862-86cf-9d83-7ea7-5786e30ca4a7@suse.com>
 <20210930151819.GC464826@rowland.harvard.edu>
 <3694347f29ed431e9f8f2c065b8df0a7@realtek.com>
 <5f56b21575dd4f64a3b46aac21151667@realtek.com>
 <20211001152226.GA505557@rowland.harvard.edu>
From: Oliver Neukum <oneukum@suse.com>
Message-ID: <72573b91-11d7-55a0-0cd8-5afbc289b38c@suse.com>
Date: Mon, 4 Oct 2021 13:44:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20211001152226.GA505557@rowland.harvard.edu>
Content-Language: en-US
X-ClientProxiedBy: AM6PR01CA0064.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::41) To DB7PR04MB5050.eurprd04.prod.outlook.com
 (2603:10a6:10:22::23)
MIME-Version: 1.0
Received: from localhost.localdomain (2001:a61:3b0d:4601:21ab:d1da:15e9:ca07)
 by AM6PR01CA0064.eurprd01.prod.exchangelabs.com (2603:10a6:20b:e0::41) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Mon, 4 Oct 2021 11:44:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03850ac4-310b-413d-2cdb-08d9872c6351
X-MS-TrafficTypeDiagnostic: DB7PR04MB4537:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB7PR04MB4537543E6789CE0D57790F3DC7AE9@DB7PR04MB4537.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SeYP5kUtIEwfTbgaf5+MheY8ud7LZaw01r79BTIj9jjK4hrsnA+R/A+xlPP0n6hFEGj0QfNp/9IPgDNpU9w0jGxUOqaO10FHJ5BIvMGct9f5oSfPSeYmVge/8ASjeKbYhfpGZu8+tOHlCFfeOPbUcPr0Y8G1hPB4vQN40RW2BnE/aft+VNeuWLrmOtwQkb+rymJ73ZqzKr+YkIH32DSSO0QRCAyzZS5mFQI/Db/9JC4C3YtjLt6t8w5h0+HLvz9xQWq1ycHc/KMjW/qj5nqLH/QaPbO1GUA3CsWoWjwv+7qeBwfPKqbu12Cox+wKnE6t84kmcQNum3L6vkPIqSUgOnBsptT1K2gw7mp1c4q2Qo+a5pqFTnj8qDnz16amL9e79Y4I1EzLHnGgrdiYKiqjpj5k0DWYbBwgBas0QC60fjewGZsHLK17N5ZKo0SN669xkftAirg/uAhYaG/68ZImKo/r1bV1dBxUG4LDqRrzMJNu2HmSst1YXFu0qufbxwGY0cEYttOLXkT66cRTOliUsT9zAofo6YboNfrnqXphnpQZSfozCUP71ZlvwOYf7n+DG1fsp/WX8UUCMW5F0ZdZG5RJJ3h6ljz7Dn97Qq9woEGk0GDEhglfFCxi/OiKdQSRuon4OtpGfNNz4S6irYWOnojxOKX2PdLcT+zvyG3RJVyZtCOtcxDHvD83Ww5QpfUqJcmisCSxzQRTMtIJ6peE8Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7PR04MB5050.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(53546011)(6512007)(2906002)(316002)(110136005)(54906003)(6506007)(38100700002)(31686004)(36756003)(186003)(8676002)(83380400001)(6486002)(508600001)(66476007)(31696002)(66556008)(2616005)(7416002)(8936002)(86362001)(4326008)(66946007)(5660300002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uKPzfWzrP0Vnduti6RA2fdraCTibW4wCH9MnwaoZTGuyksHIZ/lIRrEcEfhq?=
 =?us-ascii?Q?WxLHmAhY7thAlI1qHfLFD764CkdTS2swJHBbOBnXjCpHMm3uKBXwu2cCpNgI?=
 =?us-ascii?Q?kgdYmBotWghCmxvMUfFjSjOu1+F80k4q+qDx3IPDsMAWMwN3UEH+BZVq/R8s?=
 =?us-ascii?Q?XXrHWw9zsAkKDJFp4uJJS2SqkFKWOXVan9Zr0GmvM1+UpSLW1NSXrJe3sFEj?=
 =?us-ascii?Q?s7I5+kVJoDfsEIX7UBbF98EQfh3K05eaJ5LeSMKkA+zsIC9IFIFCayEqQMqQ?=
 =?us-ascii?Q?dTOhM65D+YRsKi7WQKnBKxAjLFPII6AB7tq/Egv0bUPfvYpDi+Rdbh+1PZ1R?=
 =?us-ascii?Q?dGLGIPl29aX+mJ9WY9fodlxhnJcmvmRue71PDDzVMVbAXh8L7QqS3PotQC1L?=
 =?us-ascii?Q?gVt+Ahl/bWLm6NVr4H4NlGQbr9IDhbZw82dwdKzw1XVQPIIPh4v5QsB9OjTt?=
 =?us-ascii?Q?CorkvM01LlVuZCKM9Z9ytjTeIU22iojBzhX3Cvt6M8b1a/e6DCWXKq42q2qS?=
 =?us-ascii?Q?+sURLxXSByi0EUhjspiSvo1LXMp2dyEgaMUJTFaUxaMajsWn57KvNUNggJNf?=
 =?us-ascii?Q?66bKPA6DInDZpq9ZqXGLiaY/zzQOSYWJi+K9F+fH6AsAdAYAI1dblW+AK3Xz?=
 =?us-ascii?Q?rXfYqRboQURdByj75vSesytGS78glVm/f+Vbvrm+dlPN9iyD7nVDuDzNFY5C?=
 =?us-ascii?Q?roVYwS39A4kB2K0q8R28f/fW8hvGE6DnkOKvIY1S8dqpY/jKAfxJkAEpQg0U?=
 =?us-ascii?Q?kSIE0ZHCiTqsSqWvY6Q6opUCkZItps3LnRvZVvUrLXof0tXVotrR0NpeAxMF?=
 =?us-ascii?Q?+52HZGg9V6vY4/U+PD5D0NyznKsgbJpulO4wYrAVGP6WV6QxcUZo0TRVXkQq?=
 =?us-ascii?Q?lR4t8L5ANTAqXtHxrI45ntL0a7VVy7Hhk+11VUufTGWHAbs5wPp8fJ92svxQ?=
 =?us-ascii?Q?1xVl9An0RypUzehunBuTflAhY/rKn/wuKD1IJbiB2Mw7gD+9tVRsyNLXbsH2?=
 =?us-ascii?Q?TM01ivee4axvy/2TirdyJXMHd1+IRhjyhMiogT7nl3ild4Y5fvx9B/Rm7kjr?=
 =?us-ascii?Q?L7+RdhCe5AyWGagPGoVNIPTGO2P3t+YQDhXqhIwIHFqlU8iGkqf7ZyS9PVsP?=
 =?us-ascii?Q?c09rxxN6BMywt1an/GzTX1trZZB2CtbFhV8Myg5vDbh6eZU7y3Q//b12JARW?=
 =?us-ascii?Q?WaeO3XMeIjZ4b1hmJwXNh2G5fFNwXimj8BU/jRUjB/qwdm6ulhFGdoF6QF70?=
 =?us-ascii?Q?0kho9fI5mXEujTTGPF3F17MYfMUUSQB2QVyllUtmr6dAGFHJJSyGyq/fO6Fe?=
 =?us-ascii?Q?EPR6QeyD4DkDk3LLLkHgl5Fyt3Avu6j1xynvMRvFKGOy68FehCGog6RgMs35?=
 =?us-ascii?Q?Rw4CZCnnWh9d2ufdMyHqdmrDg4WD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03850ac4-310b-413d-2cdb-08d9872c6351
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5050.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2021 11:44:56.5919 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ogf5DAn4WV6+hRBj3A0WBBPCdi7PAtNaFAO9bDltvYnhpVfop20cyHroNluiwqNpLtCq/UpCjMYNM3VEby5Q9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4537
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_044506_215549_F972D748 
X-CRM114-Status: GOOD (  18.17  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Ck9uIDAxLjEwLjIxIDE3OjIyLCBBbGFuIFN0ZXJuIHdyb3RlOgo+IE9uIEZyaSwgT2N0IDAxLCAy
MDIxIGF0IDAzOjI2OjQ4QU0gKzAwMDAsIEhheWVzIFdhbmcgd3JvdGU6Cj4+PiBBbGFuIFN0ZXJu
IDxzdGVybkByb3dsYW5kLmhhcnZhcmQuZWR1Pgo+Pj4gWy4uLl0KPj4+PiBUaGVyZSBoYXMgYmVl
biBzb21lIGRpc2N1c3Npb24gYWJvdXQgdGhpcyBpbiB0aGUgcGFzdC4KPj4+Pgo+Pj4+IEluIGdl
bmVyYWwsIC1FUFJPVE8gaXMgYWxtb3N0IGFsd2F5cyBhIG5vbi1yZWNvdmVyYWJsZSBlcnJvci4K
Pj4+IEV4Y3VzZSBtZS4gSSBhbSBjb25mdXNlZCBhYm91dCB0aGUgYWJvdmUgZGVzY3JpcHRpb24u
Cj4+PiBJIGdvdCAtRVBST1RPIGJlZm9yZSwgd2hlbiBJIGRlYnVnZ2VkIGFub3RoZXIgaXNzdWUu
Cj4+PiBIb3dldmVyLCB0aGUgYnVsayB0cmFuc2ZlciBzdGlsbCB3b3JrZWQgYWZ0ZXIgSSByZXN1
Ym1pdHRlZAo+Pj4gdGhlIHRyYW5zZmVyLiBJIGRpZG4ndCBkbyBhbnl0aGluZyB0byByZWNvdmVy
IGl0LiBUaGF0IGlzIHdoeQo+Pj4gSSBkbyByZXN1Ym1pc3Npb24gZm9yIC1FUFJPVE8uCj4+IEkg
Y2hlY2sgdGhlIExpbnV4IGRyaXZlciBhbmQgdGhlIHhIQ0kgc3BlYy4KPj4gVGhlIGRyaXZlciBn
ZXRzIC1FUFJPVE8gZm9yIGJ1bGsgdHJhbnNmZXIsIHdoZW4gdGhlIGhvc3QKPj4gcmV0dXJucyBD
T01QX1VTQl9UUkFOU0FDVElPTl9FUlJPUi4KPj4gQWNjb3JkaW5nIHRvIHRoZSBzcGVjIG9mIHhI
Q0ksIFVTQiBUUkFOU0FDVElPTiBFUlJPUgo+PiBtZWFucyB0aGUgaG9zdCBkaWQgbm90IHJlY2Vp
dmUgYSB2YWxpZCByZXNwb25zZSBmcm9tIHRoZQo+PiBkZXZpY2UgKFRpbWVvdXQsIENSQywgQmFk
IFBJRCwgdW5leHBlY3RlZCBOWUVULCBldGMuKS4KPiBUaGF0J3MgcmlnaHQuICBJZiB0aGUgZGV2
aWNlIGFuZCBjYWJsZSBhcmUgd29ya2luZyBwcm9wZXJseSwgdGhpcyAKPiBzaG91bGQgbmV2ZXIg
aGFwcGVuLiAgT3Igb25seSBleHRyZW1lbHkgcmFyZWx5IChmb3IgZXhhbXBsZSwgY2F1c2VkIAo+
IGJ5IGV4dGVybmFsIGVsZWN0cm9tYWduZXRpYyBpbnRlcmZlcmVuY2UpLgpBbmQgdGhlIGRldmlj
ZS4gSSBhbSBhZnJhaWQgdGhlIGNvbmRpdGlvbiBpbiB5b3VyIGNvbmRpdGlvbmFsIHN0YXRlbWVu
dAppcyBub3QgYXMgbGlrZWx5IHRvIGJlIHRydWUgYXMgd291bGQgYmUgZGVzaXJhYmxlIGZvciBx
dWl0ZSBhIGxvdCBzZXR1cHMuCj4KPj4gSXQgc2VlbXMgdG8gYmUgcmVhc29uYWJsZSB3aHkgcmVz
dWJtaXNzaW9uIHNvbWV0aW1lcyB3b3Jrcy4KPiBEaWQgeW91IGV2ZXIgdHJhY2sgZG93biB0aGUg
cmVhc29uIHdoeSB5b3UgZ290IHRoZSAtRVBST1RPIGVycm9yIAo+IHdoaWxlIGRlYnVnZ2luZyB0
aGF0IG90aGVyIGlzc3VlPyAgQ2FuIHlvdSByZXByb2R1Y2UgaXQ/CgpJcyB0aGF0IHJlYWxseSB0
aGUgaXNzdWUgdGhvdWdoPyBXZSBhcmUgc2VlaW5nIHRoaXMgaXNzdWUgd2l0aCBFUFJPVE8uCkJ1
dCB3b3VsZG4ndCB3ZSBzZWUgaXQgd2l0aCBhbnkgcmVjb3ZlcmFibGUgZXJyb3I/CgpBRkFJQ1Qg
d2UgYXJlIHJ1bm5pbmcgaW50byBhIHNpdHVhdGlvbiB3aXRob3V0IHByb2dyZXNzIGJlY2F1c2Ug
ZHJpdmVycwpyZXRyeQoKKiBmb3JldmVyCiogaW1tZWRpYXRlbHkKCklmIHdlIGJyb2tlIGFueSBv
ZiB0aGVzZSBjb25kaXRpb25zIHRoZSBzeXN0ZW0gd291bGQgcHJvY2VlZCBhbmQgdGhlCmhvdHBs
dWcgZXZlbnQgYmUgZXZlbnR1YWxseSBiZSBwcm9jZXNzZWQuIFdlIG1heSBhc2sgd2hldGhlciBk
cml2ZXJzIHNob3VsZApyZXRyeSBmb3JldmVyLCBidXQgSSBkb24ndCBzZWUgdGhhdCB5b3UgY2Fu
IGJsYW1lIGl0IG9uIGVycm9yIGNvZGVzLgoKwqDCoMKgIFJlZ2FyZHMKwqDCoMKgIMKgwqDCoCBP
bGl2ZXIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1l
ZGlhdGVrCg==
