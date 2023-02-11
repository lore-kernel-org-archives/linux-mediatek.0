Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D3DAC61DA4
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Feb 2023 18:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z9oBSi12SyKIIDFSZJqcXeY8q7R1UDf2uERw6a6P3U4=; b=Df2LkmoxGAKh8/0sIDA37JITFl
	cx48wF3QnqxhNfREqf3wrTRz1xDcwl4yPOHqw0LfSt1LEA0nls5g2uWj8Pyn4aeq6JFQCFdmviVVs
	DTdp6/B0HNLTC2f6twcdK+Dd84KwS5lf8FO6IkZn75zzimf5zXOvxhZ5OXXvwCdDCMvl66m04nM8g
	ensdH+U6Zai5YVfOU4aBy0T3abcxb975qSoOr5ra5Gxap2ferGvE/UNSygyUZo1Ainmmy2q9Sq9Hd
	m/KpN71fNTwOEGSviI2uf1BxhdzYPQC3kXISG0674fKDUqGOnFvhuJIkuvb1P6PQdCk4Dfm04+oLk
	jFX8WIng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQufZ-00A572-4S; Sat, 11 Feb 2023 18:32:17 +0000
Received: from mail-db3eur04on062d.outbound.protection.outlook.com ([2a01:111:f400:fe0c::62d] helo=EUR04-DB3-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQufF-00A541-FO; Sat, 11 Feb 2023 18:32:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nt4ZAngDT9MG7hAa3bKfViwEJdEFPgwwZ5SVvFwP/nsbhtmQA7cax4hYk8Y6YHORE1IE58R1kKPBprcEpAFdLTzMnAr+tHmftz3JRuRavVFkVtY/WgGsLlG2uWSbRFrVlctydNFpjZmRkQGdCNNuYupkZxzLbCLvkWxt1C2aErPdpVKe8XjXenLOW9wUzy9Hh4t0bSbZU1Y2j4NbNZ+QRbL2snu5wVkvwRoS7O28YfCySZka6EgXCbJcU2lE0N9+AG+Kr+aNeDlDnDK9oneGZ6PXxWW6eKk2H1bojRTg7Nc3wO96SWI2cQOKYazZ6kRgdHeb+eod5y7q2DQqyYE34w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z9oBSi12SyKIIDFSZJqcXeY8q7R1UDf2uERw6a6P3U4=;
 b=UvkGuS08omSYMfEYZ8MEas3c40TWrzq93VbBAmIAddMeEognnJAvE4UFb1Ca7V9qAbkkDYyM+zDcxCWC9ydiCy7j09jsWwwcLXdVwz/SM7mvYdf9LQX6UhAla4Mt2bo+fbWn4y5SnBDR80PWVcrrHzTTuUlwtW17NivjY0MAV+ml1gkPv+o+aLKbgDONGcC4nxMvcT2DAp0R8CUKkkxcDtBjbEzvj1xHjn5qj0qhjD2cHDT7VIhrksX60rwC8wJkY2IUM+8lji+z3+96OvX4fg1HizmF/fZF9jmTiY8Ui+0OO3HVo18bHmk6w8NaewPoMcS52DAnLisR1Gi4vAYysA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z9oBSi12SyKIIDFSZJqcXeY8q7R1UDf2uERw6a6P3U4=;
 b=gZtOAd7T73FGXr50lOxyy1cIcQZhBxY17H9q8f0NJs/xB8psTHT34qVzg3jUVG0BvugsTwkQfVyKlYT6OIO4SbGEo0Ey4ZRXKBHhtnAGr0wOsQXJ41Iaa2naGAJpsLM6qR3HgetaXs3FP1S1z7vjpRXtYXhmHpUXoMzcGX4N01o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB5136.eurprd04.prod.outlook.com (2603:10a6:803:55::19)
 by AM9PR04MB7697.eurprd04.prod.outlook.com (2603:10a6:20b:2d6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.22; Sat, 11 Feb
 2023 18:31:47 +0000
Received: from VI1PR04MB5136.eurprd04.prod.outlook.com
 ([fe80::3cfb:3ae7:1686:a68b]) by VI1PR04MB5136.eurprd04.prod.outlook.com
 ([fe80::3cfb:3ae7:1686:a68b%4]) with mapi id 15.20.6086.022; Sat, 11 Feb 2023
 18:31:47 +0000
Date: Sat, 11 Feb 2023 20:31:43 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net] net: dsa: mt7530: don't change PVC_EG_TAG when CPU
 port becomes VLAN-aware
Message-ID: <20230211183143.2jb26kljgpwyc2jb@skbuf>
References: <20230205140713.1609281-1-vladimir.oltean@nxp.com>
 <1C64196D-371F-41AC-B357-41100DC66C2D@public-files.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1C64196D-371F-41AC-B357-41100DC66C2D@public-files.de>
X-ClientProxiedBy: VI1PR09CA0113.eurprd09.prod.outlook.com
 (2603:10a6:803:78::36) To VI1PR04MB5136.eurprd04.prod.outlook.com
 (2603:10a6:803:55::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5136:EE_|AM9PR04MB7697:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fa8b46f-cbcd-41c6-97e0-08db0c5e3bc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	GLpZb5uDdakMSfQG6QKvxw6XXVch8qVsl/IbMWd0OFYZPTG0L+j2sT8RouYpX92W+4h0vgOtKq93O5w3Ln1lvFiT5is0Atu9SqsHhhykidzc9EB6Xx3RsAZrlEshI3PXA87hoomQR4tjVfcrI3xbU1EOkdLensGVJZhdi4oV9ZgSBeqt7GvJ/TkFMmUV+RIi95s4ZJ0q76vVw/TNXNlB4OBu+HnVufupLChPJ5F2jW0dRcadgXiTezcovYOyK5X9fisRunjlMAKTjLlmWebEsHDkwvDsW2PIXQEboF+vlXUiMD7Rf6Z5KTndhyyG3X0w+JFSkl1uWKtSUpbD11YjL2IjKP1yAPjnAktzz5p6dZGWlWstnzc+DnEYBqfvrcvqfHIeArZGvlbvpYa99LsGKbHeLul3FqPn/ymltg0y409O7M5xviWCAkRtI3lOV79188ojY1mWoYYmlZ4Lb53sJpFJoFCBkPTX+3eBo4iXkHasWdL3A/IlhLacxc2oPVhONYYOBEjgCqKYlVJLsAf3MFmR0e2yTgylIG7ECA04XsHit9bAXynmvI3v4gN74r+E5/WeGqXlZZ79Lcf+Ie6JyTGEdQL3wqYHreB0Tw3ZSUYCPYb3yI7ty7eZjQd4bsR3kyPL1H7UPS/kjWRIIFZHE3Moz7ukEt2bGLVt9EBsJE0=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5136.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(7916004)(376002)(396003)(136003)(39860400002)(346002)(366004)(451199018)(38100700002)(9686003)(6512007)(6666004)(1076003)(6506007)(26005)(186003)(86362001)(41300700001)(4326008)(6916009)(8676002)(66476007)(66556008)(66946007)(44832011)(4744005)(2906002)(8936002)(5660300002)(7416002)(478600001)(966005)(6486002)(316002)(54906003)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?xTOoT450E2fW1fmixiHrDXcIJkR7AzmLvey9JC7PTq4Kvw2lU2wPCQK6mKLN?=
 =?us-ascii?Q?Y8e5SkHm9hQ91sb+l4n4zopO/HTcMfRSDt3/JFWL7o73OpAbhYMfuKVjy/+H?=
 =?us-ascii?Q?GpKML6nRSf6HuhVcLERfZs3ejVTXo0mLXbA1NfvyQvRNhIn/u8IWqtSGP8BV?=
 =?us-ascii?Q?YfNsIAYxj5ptcakwV0ac6j2pmbBniLC52BW5MfbDmGS1eg9P4Se1GYPwcBnD?=
 =?us-ascii?Q?KGQG9DXV7e3uk7cRuyeQtaRTl0AD08KrA9gF0C5NO6iTqAMFZeKiMUuVICiA?=
 =?us-ascii?Q?5kZ4dH1Ek3qB3pX+jNbUvhPYihdwKexD2lJWEyH4nh4HYxREDzcZhYMoGPbS?=
 =?us-ascii?Q?0tLym2PFbpxzRxqQp6V8PkV2Ypwi11Ye6TBX6iRwQJCXpPJ0Ky2tpSw2cEGO?=
 =?us-ascii?Q?3t4vQg1X3MNE0+4vo4paqtMrzdOgHRlPcO1LMG5qYPDGDCzjiiwH/ofbx/6J?=
 =?us-ascii?Q?TZFxzhBF0n9OMnlQvu7cpD1Ak1cPnwcaG5zbXhnJhBgn77qwNCmHLulAiMRE?=
 =?us-ascii?Q?eUzyDNutDC+spBTzUf00qoTe3pPRSJ3VHPEkh23W2PZX47SpUW3Vv6ID49gk?=
 =?us-ascii?Q?+qq0yZ5/JzU8D8Ot/5b7Go3sM0Hc0y+98kdgtacI6b/4STv01SYU8+ZtR0eE?=
 =?us-ascii?Q?Pk3dkPk32WOQYNYczWhJKZV7ovByOzOOGyxWLsSz5BxM5yh/5d0PniMCtgVd?=
 =?us-ascii?Q?7idcXMlFABKJtV8er8h8Zbr9ED0SioVDBGuGWwjYvDkgttHcPg8+uJQ4TiE0?=
 =?us-ascii?Q?axagb9GVZQG7UAbMfS/diBnqzYkYirj4OKCYTaLw675WlAMbRKyTdGjuyNXP?=
 =?us-ascii?Q?8LVaEe6sJS5YtFOC3LuFtc+oAXwd0qQWQkxEKlv8VxZi16Anc/7D3UP8IVK5?=
 =?us-ascii?Q?hzzmRQMcdOhbltevTR053Vv9pwajWWK04Zh9rdvV99xiKA0PywKFJvgHavjh?=
 =?us-ascii?Q?uw/BzWGmlaRBTVn6LH7f29Hl89oAvRbGTVDM4sxSAmsaxqanuhyhTl8zuued?=
 =?us-ascii?Q?DdgWQbmOEbf37g1AKQX6kRtkhvwgBPWHDBfAxSlPy/61kJquPQPCUm9nIxUu?=
 =?us-ascii?Q?b83SvyJ00mOaGMws+StznNIbn9hdxYnsqiW9vo3mlfaNfwd4gRooqi7r/Vtr?=
 =?us-ascii?Q?p5NvFEM13xS734FDg8/sxXo7B8SWZFBxMRod7aEeb4OVlmeUPhE1JD+PcR7i?=
 =?us-ascii?Q?RKmDy7leLpyvdrKW+pfbTIvxSeYWEztr96NpGAUvAxqgkrGKZ72Oa8H2EGrc?=
 =?us-ascii?Q?L24mdJMPXbDsFOvnVMDW0dImd7pZVrwTb1UOC+lOFeUM92m9Z9elUitRofpc?=
 =?us-ascii?Q?5V7uG+hVCoj4qFFSkNo9h1lSOza3uGoFKH9GEIksPGY41smPUgQGnEPve7H/?=
 =?us-ascii?Q?TDt4ql/PUaDekX9tUxHD09VYlvcW8Zap3IHNaFdfRxkt5u3NGnvy9C6W/AwL?=
 =?us-ascii?Q?P9KF2KTuZgejtkljJS79UuePxIiBJaDVQOxEJQU5OjdGyD9A4V//6lMwcnWj?=
 =?us-ascii?Q?CwWZRES19KJnSnSWie3uFv0/Dwz61FHSHYLsHgExcJvhBmJI8RYgse5J7Dvu?=
 =?us-ascii?Q?a9WXo2UBmo1oAJy2DFEytBKEia49MPUV85rfz8l3xzz6m2WMfvhSXK7D18Zr?=
 =?us-ascii?Q?Gw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fa8b46f-cbcd-41c6-97e0-08db0c5e3bc4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5136.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2023 18:31:47.4130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wFRbP+dYGWCkOMVchBHx094EQ2bogsV/o705s295dRJwSCxYyMPw53kvzziWf8iMKQ5QpPZfCk+Dii2NUWBEGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7697
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230211_103157_795006_3CD9A01D 
X-CRM114-Status: GOOD (  10.18  )
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

On Sat, Feb 11, 2023 at 07:04:14PM +0100, Frank Wunderlich wrote:
> Hi,
> 
> Can this be applied to next too?
> 
> It looks like discussion about different issues in mt7530 driver prevents it picking it up.
> regards Frank

https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/commit/?id=0b6d6425103a676e2b6a81f3fd35d7ea4f9b90ec

