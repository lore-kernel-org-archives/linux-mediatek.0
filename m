Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C18F5C636CD
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Feb 2023 20:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	In-Reply-To:Content-Transfer-Encoding:Content-Type:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yXtrL4atjeUFa21cgmLp7XL7Bv2BXLFyDd0gYR8OsmI=; b=cvRI5dbEz/f7YaLFW4G70Yu9SA
	vp0mRmXlHU7y+NrYAMmcc78SXPbpFt9nKfq4rXLF3HazlQp9VFDyVhzzPsAiubr7Vw7/kpB3Ec1jN
	0xScrk0d8ujlaCyO8vkSH2HjhFQqPN7qyGyD2UJolccHKZrCqCmhaNNYiakcFksocDTJxaUfStAjp
	ZwJk/2n2K4sX+mNg6aeXFsKrCTV7canpm3a/dNvwxFjbi+/U0aPXEmiBVq1FqlTPbvcmjKz6EA4jR
	BMO1UBbm6+1HZUEsW3GIW4Tw6HMzhDi7mo2S4Je2w6Dcf1JYe7IioalJ4FBged6sBSvEyTmOCvays
	UsxAmgWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOlnC-006oBU-Oi; Sun, 05 Feb 2023 20:39:18 +0000
Received: from mail-db3eur04on0615.outbound.protection.outlook.com ([2a01:111:f400:fe0c::615] helo=EUR04-DB3-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOlnA-006oAV-HZ; Sun, 05 Feb 2023 20:39:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S8n26RR5nA3P+fAUrQQRPWlCzVdLms1j0U2SW60iSwyQoGnLDUJSns9GN5Iu7wpmDSuO9zYlBpabZsv1JJwyTvbu2R+oAxyvpp10yBrJJtxJQkglANlOqlDCksoWUFsB8G7f5p9HG0OrtfCosA2iIqXEcA97TYQUuHQRzDMeQO+2A3/1j12dGHcK8Sc3QVUlAhRjh/0VkY4bdfjA28fQpn/bpTW7LLzvPUSwx6en01s+iz9P/TJZTIa1Ij2gtDWxWQxlsGU5x0jhWFXpSi+mX/fIov2CvDse9dK8jg01xVq6JRKvoORle1AjsS5JRrLkpi3xizRwYV8w0gf/gg/npQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yXtrL4atjeUFa21cgmLp7XL7Bv2BXLFyDd0gYR8OsmI=;
 b=NPV/SFykyyZPhoB8fbFQS0iMihcXiofsrOCRA55OEfwwcwzhncVXFAnmbsKQSXsTjEVLh4HQF2HjJYAfelgSbr1nZRbqlbJJiqjcooLV2mMhdGRVTunjnd/xRnR1uyXPbPMeMst4QH76biYCBYPeEs71IU+MDQQNmN6z00Gj4K/H/c6XpqVUnKjjf2a/7NXPcc8fvTQi/9MqMEaKY8Af/5KSCvQ2Iz3ToarUqQl133ZpIeuM7Rm8CVM4uxh/JF9BAerHjJlCR6NzTqOSiD4zBWPG3siUqgVEB+jRQMOTFdzr1Pirv+RASIBq8oMXOpQPG7uBCtu4GYWJPh9ZioGffQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yXtrL4atjeUFa21cgmLp7XL7Bv2BXLFyDd0gYR8OsmI=;
 b=VBZhitm2gyHQVKzjVynoYm+FZv7TMhuf5orxVgARF90aHb6BwSJemyF4z+uhPdyjd3zgOC6wolkilggAXc2GcGMBpxQhvldIBmTgQTRTs4uqhsA1GauhNnX3bM3BTr8LJt4aepURIb0+QDsudrPmcoqsX+zbiWEVpW2sFq26ZAc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5136.eurprd04.prod.outlook.com (2603:10a6:803:55::19)
 by AM9PR04MB8953.eurprd04.prod.outlook.com (2603:10a6:20b:408::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Sun, 5 Feb
 2023 20:39:11 +0000
Received: from VI1PR04MB5136.eurprd04.prod.outlook.com
 ([fe80::3cfb:3ae7:1686:a68b]) by VI1PR04MB5136.eurprd04.prod.outlook.com
 ([fe80::3cfb:3ae7:1686:a68b%5]) with mapi id 15.20.6064.034; Sun, 5 Feb 2023
 20:39:11 +0000
Date: Sun, 5 Feb 2023 22:39:06 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH net] net: dsa: mt7530: don't change PVC_EG_TAG when CPU
 port becomes VLAN-aware
Message-ID: <20230205203906.i3jci4pxd6mw74in@skbuf>
References: <20230205140713.1609281-1-vladimir.oltean@nxp.com>
 <3649b6f9-a028-8eaf-ac89-c4d0fce412da@arinc9.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3649b6f9-a028-8eaf-ac89-c4d0fce412da@arinc9.com>
X-ClientProxiedBy: BEXP281CA0007.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10::17)
 To VI1PR04MB5136.eurprd04.prod.outlook.com (2603:10a6:803:55::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5136:EE_|AM9PR04MB8953:EE_
X-MS-Office365-Filtering-Correlation-Id: c0f2945d-ee50-4e43-6dd5-08db07b9091c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	bMXk15QU0k6+wGYspg1nqatcKb4AYCcxgwCITQCwxm3DL2kWN0C/FFJ+SQOlvAcL6byaRh7XpLOF745p+dphI40aXI7a5lcDu8hvwwDEhmLfJHnLZYxwD6Zk2ykP6wrfFKe1gFdQdEdSGznUFmAkPPTiZRJnCPnPeKzulm6rmzj1OmIDkKbfzLVd7ST9XXSZUV8riXMixWQNTTLvXtShLiG4QInv5E/h6HUfGN9/a1vEmYPjJU0mpoegAMprVtLozJtH682P5aRrW16+C1sDGeUdRZJTXmcgCfnbsWYs8GdKBH5z5QoRktn3sOKN4UMPvw+QO9cMI4hiq+yDakfpnC7A3Ft4yTnk7/GxHS9p9nl11xeqokXOR6irF2Je6AnRYqC5WhCF8oBfBgT08vq69odZuFVfYkksN0FXErEA5/iCeDON6VbwH9ZrMgPbb/Ms+ceOVtb5+8UkKvIGOiCGXoWLWFRH4UEly/63U9g5CDgB/1waKcn86Lkivzbty+CxYinpZN9bb8W2CFYup4VMkeYWD5saCDXJJD+H8KsENJLUSQ/5AkeSxdQzn8RMMTHDmmRizk9yveQZAXI8wa0/qIWg9b32kV1vxdE8t9/b62ecryJLaor83AG/plQ0/ynpv61Z2J2UO+fAXH045xqmqg==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5136.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(7916004)(376002)(136003)(346002)(366004)(39850400004)(396003)(451199018)(38100700002)(316002)(8676002)(6916009)(4326008)(66556008)(66946007)(66476007)(54906003)(41300700001)(8936002)(86362001)(6666004)(9686003)(6512007)(186003)(26005)(6506007)(1076003)(2906002)(33716001)(44832011)(5660300002)(4744005)(7416002)(478600001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?dmNYYm85dmpWQUxRTy9jemlUODQ4Zkp3SVhUdVJjVXorSGMwT0l3OGhhRy9y?=
 =?utf-8?B?ZW45b1ZiN2pUZlVidnRDV3NCNFh2WTBzU1pBeWhBNmlGSVJHUkZsamFhakdh?=
 =?utf-8?B?Szh0Mytsc0NJdkJDd2JZZFh2TjZza0JWbWxDczNhMEdUOHZ2dXFmQzJqOGNk?=
 =?utf-8?B?RXFNeUp3c0IvT0FTZHZST3hSQzdYSG9sa0NzT1JXRHpZMTN5TDcraCt2WVdV?=
 =?utf-8?B?MnYvZm1aV2F1MmtyMTc0WERSeS9vMlZEY1VuS3ZMUmZ1bmxxU3RMa2Q5NVkw?=
 =?utf-8?B?c1pTUFpzdS9NZkxwTUp5VmFyVWJVWlRWNGNtcjJScnZJbEJsU2RCaUZDVW1P?=
 =?utf-8?B?djU0VjRteFhrcTVHMlNESCs4Rm9pYTZDRHhQM2xzVjVjZlgrTEd2cld2WWFh?=
 =?utf-8?B?WGZMQXpzcmZrK1pvdmc3a0VSNmtVTXZRbHpYMkZGV00zRmpJdlAzVHhBaitK?=
 =?utf-8?B?NDZidzgwOEY3Q0p2Yk9mNlZUbW1RNE5HTnVuRUZuMGZRdDByTlJGaUdUUTNC?=
 =?utf-8?B?N1dQbnpmOXY4QlFmOGtwQWFzWWdGeXdNTmdIbzlva0dGdDVxcjM3aUM0L01p?=
 =?utf-8?B?Y05XRmloQVBFc214TjEwUGFlcitpV2syVlFObVc0dFNob2FMdWxzTHBzRXdy?=
 =?utf-8?B?TW85VllTdmlVTFQzUUZHNHRKOThpRUJ4a0ZYcmoxWDg5b2c1QUhEcmIxSUhs?=
 =?utf-8?B?dGNhQXN6SEhUczBtMmxRb1FpVVR6YlRDZndWZ2tLNldkQTZoMFV1VWFxTUlq?=
 =?utf-8?B?NlhCWnhuQjlERGc4Z28yMWhZWW0zNmxweDdBZVJQaENiVzJ2dmJaTkNSVDJY?=
 =?utf-8?B?NlkxeWxVZEJPTi9RUFliNjZHL0ErVWFDMEE0SDQ4ZTdTYmV3eEF0dmdjSCtn?=
 =?utf-8?B?ZmRPRHpCVGZxdXZpUGVLUlZ1eHBLRCt2enRSWXY0bkk2SzE3NmNvNWx2S2Ir?=
 =?utf-8?B?cXpVN0trRmtUMFZyS3dvZjAwWndTeXdpbExyeXg2cHk4UkRLZ2xSeEdkcm83?=
 =?utf-8?B?WUZZUXpPcEpqTmY1SGhqOEJlMGlTeHZRbkpJQkJXZzhLSnJKLzVLOGJzZFox?=
 =?utf-8?B?eFVQNTRTbjJPb3FIWDgyOHNiWlNERWErYzZoYVJ1QU90QkQ1Y29kd0NsQ1c0?=
 =?utf-8?B?dlZuYVRMMU9CMTBySHZ0RmFJbFgvMzczWldPVCtCd0V0SFc5SUp2YUJVR1ZI?=
 =?utf-8?B?OEwyZlVURnA5bnAyZEZYWVVqeWh2Q0ZLRFFtdy9vdkRxczNKTjRJTHE3Njdv?=
 =?utf-8?B?b0dNZUxsZ3d2ZEVvVEZzWHA0UEM0bnlROU16L0xXZ1lwWElLNjI1cU1tWEpU?=
 =?utf-8?B?Qjhja1pzZUZQTjJ4RlpaOE5NTTlBMDBxWExmbFpNcHgzSzlweGp2UkxPaEU2?=
 =?utf-8?B?NkVSNDMzVksxcktOaDYzbzZaaFpaaEFlMmwyUFFFSGVrTjBydEsxY0pQSENt?=
 =?utf-8?B?eE1Lc3VIOTNsN0VvQjlHeFovdUZrZ3dXL1dQWlBROWQ1M0VVRmhuTlRvV3l1?=
 =?utf-8?B?N1hvZHRLSDhJbElTZDhkbXhla3RYWGRLZU5KRVordVJTcVpsNGY3Z2pIQkwr?=
 =?utf-8?B?eC84cjdOekZkSnlDY0NCVWVzdW9oWFVWTDF0S2N0Tnh3VktoZy9oM09Ba0Uy?=
 =?utf-8?B?NFM5cXRlR05vQ0xGVysvL2xGcjQwSnZ1a3NqOHpEKzlBK2pUT1pqd3NnRzR1?=
 =?utf-8?B?ZWxCTTE1MDMweUp6b1V2YU9nY2E5T3p6ekc0NjMveGM2RjNMNzE1YkZGYWw2?=
 =?utf-8?B?QXo2VlB3RE9nSTl1N01wcWN2aHVqb2gwOUROSFhIaDFMbW9BN0taU3l0a3M1?=
 =?utf-8?B?RTRxZlZybmd5VFBlZTluQ04wY2czOWxWV1VHVG9CeFg1TzlvNHF2VTZwVkZS?=
 =?utf-8?B?Y2ZyZFp5OEQvM3oxMHlKdnRnUVVnTCtCSzZybU81Z0EydXIxODJLLzVuSzRR?=
 =?utf-8?B?ZFVXeUhNcTFnYVlSenNnUHY1cE9zQjRMZ0UvK1FoUlpDclZybWZIMkZVNURi?=
 =?utf-8?B?eFhGNHZjUVpsVjQwNXJwU21wR1JtTG5ncUZ6cmRyN3kxODVqNVFESkZ2aENL?=
 =?utf-8?B?cmxvVkxJSWd0Y3pLOTNRdVBsSkc5ajNINDZMbEZZU21YaE5may9IM0w3V29p?=
 =?utf-8?B?bHhWTWFZaTQ3VnBMN3Z3aERpblVsUlpUb2pVTitxYjhoaHJyWkgzRTFiUXMz?=
 =?utf-8?B?WEE9PQ==?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0f2945d-ee50-4e43-6dd5-08db07b9091c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5136.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2023 20:39:10.9071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ufbXjgal/pyGFKdx6BQjw9IZcqKTMgqhFai2UWeiek2QUuAeg/kudD5+PLlTOg/L2gUPspQ7CBEJ38wd3s9F8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8953
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230205_123916_840854_1DE57913 
X-CRM114-Status: GOOD (  10.26  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>, Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, richard@routerhints.com, DENG Qingfang <dqfext@gmail.com>, Eric Dumazet <edumazet@google.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, erkin.bozoglu@xeront.com, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Arınç,

On Sun, Feb 05, 2023 at 10:25:27PM +0300, Arınç ÜNAL wrote:
> Unrelated to this, as in it existed before this patch, port@0 hasn't been
> working at all on my MT7621AT Unielec U7621-06 board and MT7623NI Bananapi
> BPI-R2.
> 
> Packets are sent out from master eth1 fine, the computer receives them.
> Frames are received on eth1 but nothing shows on the DSA slave interface of
> port@0. Sounds like malformed frames are received on eth1.

I need to ask, how do the packets look like on the RX path of the DSA
master, as seen by tcpdump -i eth1 -e -n -Q in -XX? If they aren't
received, can you post consecutive outputs from ethtool -S eth1 | grep -v ': 0',
to see what (error) counter increments?

