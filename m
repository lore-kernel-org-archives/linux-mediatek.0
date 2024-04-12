Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 156FEC4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Apr 2024 01:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Date:References:Message-ID:In-Reply-To:From:Subject:Cc:To:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q94u/ZO356jdLVqgxpoqXceWDZTKS5I/T+QjgoxNHpE=; b=2EKM09qX4junMBXbbk1/CAx2Vl
	uoGO+5MQ8zGRrHTQSqdblJfgMnSNLD6RhEHdV7NKZ+McaFoEwJQ0WSreOL7/+ElY50CPpqkr7RK5Y
	Tf6G6FFNFjC6eytdSy8PIOT3cLcjxAHGOmgwGvwuaaS2w2ihL2/WGATZgmJ4ciJLISOTt8Ko4JNLb
	a7XUQi/NyJbIcACgwwxCAyDoFebZERl72HUz/XObcJUx784sP+TOa/Wy9zplHQ0OIeJ299bMYL3vq
	ue5ihXbEExKkkBmVkT74rxK3wslEd/5JFMtI+3cA1n25Y7aOS2THDX4VENbpLD4yC6jWuzvPIANXh
	BmzU+sbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv6Ad-0000000Epm8-02Ap;
	Fri, 12 Apr 2024 01:57:39 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rv6Aa-0000000EplT-16Ah;
	Fri, 12 Apr 2024 01:57:37 +0000
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43C1U0To014810;
	Fri, 12 Apr 2024 01:57:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=to : cc : subject :
 from : in-reply-to : message-id : references : date : content-type :
 mime-version; s=corp-2023-11-20;
 bh=Q94u/ZO356jdLVqgxpoqXceWDZTKS5I/T+QjgoxNHpE=;
 b=faP8ar3bcAvNzY6yMy6Lt65rL1P0oi5HLDKVeL9eyv4HwS2PPy9IJTHFc3S0ho7Wy/t7
 fXP0dGuxPfczqt7J+jb81MSpCuem72GA3BAv+SQu3dQ7GfyxqFOUS+UyXHzojsKEgYIg
 3PZvZXcIbFj4pyW1GgCS/82TipjMfeN0ulf+VMgJndFcTnjooiORqvmo+VmOZFeF2G+k
 0uD7ydwX9ZIzRzpsLw/epyKfhtmpGIvmWIbUutuUY4cJjh+JcCqcPpe/i4ctdzfhS1xK
 XpguCYpCNFviOk8Bnzv2jX80Gn7Aka1CLa4OGNwCZQ0iY4jgDkXo9insbkLy1yPTlz6t Gw== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3xax9baq1c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 Apr 2024 01:57:29 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 43C1d5Ud007848;
	Fri, 12 Apr 2024 01:57:28 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3xavuab7jq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 Apr 2024 01:57:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QGqy1qF8iAAr0A4bfzA5IwmWaRJsj7qUVFE9xg7VPp33OcMnvaY9vZZ3hKA3EydSBk51ZGwvVbxCveMvO3dIKfRpjU8t+kNtwwtVIRZNmVcEAB8rSTB7bswkKBIZBnXK6uzS4AOxap/1I2rU2C0F65EO7JHqVMt+36Ew1dKHvJJ11+/blX1kxVcbCtyXOUkZW+lwwqzrG10EAqFD8lNu7Ebrknr3UA+kJZ4GlxuAVtKuLoRWTaAkOc5OuSSZxYinV0wNSHh4aaozJdZgQvOjtR3C7w5am2gAoZavQKaniyMZ43296i+469qe5aNqj7yb0Fjp9WRmCHKXirr+NSOlnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q94u/ZO356jdLVqgxpoqXceWDZTKS5I/T+QjgoxNHpE=;
 b=I3oz+qPdY7YWqZFl6WSXPhtcipm+11clTnPTXeqm+NqozZg0CPOP4RB/8lIfpLofb9Xm7vtxX9x3qmbclMWs3yCZq9QIsr0n3sgWwDnX7KdaWnCbSwue/uBm+7rLRLfwiiGHgs7AXaR6wLHPwmt/eTcnUPdpQ5TiiUJ1ORYB9W7EHudkj8fKvG+sLdVvWOl/ZPfJ0ZdBnLY37kOI/+AVQoR3IBJGRsEpmo2AG21R1KLE2ugF1bJ0niH3SEU+J5Nsof5CzN7YOPdUwa7pzHSLVgOrBtFAgWq1ntkGnSifkyuyPmyUfuXgSRNX/cIZqc0gDr5jWLtbiIqfCX9O42pInA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q94u/ZO356jdLVqgxpoqXceWDZTKS5I/T+QjgoxNHpE=;
 b=ggfz54H4GX5IK+lDVcSnNS1FCcq7blYwKxEKMwi/m/MQKYLuMJogyeoCCTJjuNKpKHZ6HcFh2wL7KBBpB550FkQh70aW/apxLNu5XrXpwiiFp52Gwi0eSTGnUAzgODyhBN2Dd7NaVRKwzyi4gRTVA3fXV/lfELnGmLi0ccOfCC8=
Received: from PH0PR10MB4759.namprd10.prod.outlook.com (2603:10b6:510:3d::12)
 by SA2PR10MB4667.namprd10.prod.outlook.com (2603:10b6:806:111::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Fri, 12 Apr
 2024 01:57:26 +0000
Received: from PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::7856:8db7:c1f6:fc59]) by PH0PR10MB4759.namprd10.prod.outlook.com
 ([fe80::7856:8db7:c1f6:fc59%4]) with mapi id 15.20.7409.042; Fri, 12 Apr 2024
 01:57:26 +0000
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Peter Wang <peter.wang@mediatek.com>, Stanley Jhu
 <chu.stanley@gmail.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,
        linux-scsi@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Will McVicker
 <willmcvicker@google.com>
Subject: Re: [PATCH] scsi: ufs: mediatek: fix module autoloading
From: "Martin K. Petersen" <martin.petersen@oracle.com>
In-Reply-To: <20240409203954.80484-1-krzysztof.kozlowski@linaro.org>
	(Krzysztof Kozlowski's message of "Tue, 9 Apr 2024 22:39:54 +0200")
Organization: Oracle Corporation
Message-ID: <yq1pluvjqbk.fsf@ca-mkp.ca.oracle.com>
References: <20240409203954.80484-1-krzysztof.kozlowski@linaro.org>
Date: Thu, 11 Apr 2024 21:57:24 -0400
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0063.namprd13.prod.outlook.com
 (2603:10b6:208:2b8::8) To PH0PR10MB4759.namprd10.prod.outlook.com
 (2603:10b6:510:3d::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB4759:EE_|SA2PR10MB4667:EE_
X-MS-Office365-Filtering-Correlation-Id: 554f68bf-5586-490c-97a2-08dc5a93e732
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LKf21Nzlw066cVpLdzCbMOMsnGufYVIGZBrLjtMDzyMQs9uQveXM0Q/S1wScE49Qlx9OPE9MWibQ5JVKeQPV4ITJvxOkITBkBkzaKpZL7LppG4MYgYXO3AeX58q84mGyJCmhX9h7kaTs6ruCzNE/Cmf3a0vnU+Zo1pdVVBnxx7jhi4lOJLySLx0dXRxJgQAFK9bLYawUfhRF/UlPrCG+c9KR4kbLR3keXAPY15ZTJJwBA+aMA96kzaPi7FDjfHi/QQ0Q+OSbpGYFAM/3ECJjKDSDeTsbBoCUzKSDsuugqy/XK3LpHdvBzOF69a8eaZL1ek72U16IiqA/scCxzxafTAXGAVE3TUgDNmLDO3S9rc4AE/fIzBi1eatg9CSr5Z9yQEJl6pduMAkSDrXUsFxIiMSSlkK8zi8tc9Qb/F2IfG0jRLUj5H2+/YIBI7DIRvoH20VQGAoPEp2eFna/+7+WLx3ABcO8R5K+qa8nLJp75sLxyErpClqcANWRLISggkwRzil9KSh9VVWKquraX6Ku9ddIGCObzDm/ZH7zL6njL87wCdnT40GTq8OpxySwNg9ae8iKK5qJtRcEnZY/QXsDYpQD34JhrxWCehMP704erQz2bIPLtgpxLYvy+zKwmOMpfOC64AWXmZ+aX6uM0o8z0cehMJ/OMKayF1cE0jIOPNE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4759.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(7416005)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U3GSZeQuVaz7Zugap342zfol74o/DnwXaym1GMvepbGNxkvCiob9BVhPZ/py?=
 =?us-ascii?Q?lV9vGhbuUL3Kzj1bUD8/RjwqrporwwsxUV7UGYSU9BjLns4QNY0iq/pNpfua?=
 =?us-ascii?Q?ghlmUAxE1fvdDt4pNKfqQksKTLwWJaXQy7svt/CKl4zAmqdhR5ZAwqYPvrNQ?=
 =?us-ascii?Q?+e0faFFjfF6EKj/7f2v0S2Ew+Zsc9R4YGIAB5MhXNrxfEaWuE81a13/ccXCl?=
 =?us-ascii?Q?Z8o0CzqsOhZvHETkkaMvkGJiuneXBlQq5rjGLBjkKWsSnuxDyELVn/1iXu5T?=
 =?us-ascii?Q?F4tmN2UzLxzE0zhxGLrnT9da6+lchCwsU7xQupNTnM5memc2tiX4pOxyT6p8?=
 =?us-ascii?Q?pSvMWSCfeawCtfE3kK2G6PngJMmbOCCO05rgwbyye6Nzfe2JsR/46dpny9CE?=
 =?us-ascii?Q?H+PH2IqhfMw6xO1+vOCYY5TYaIc3UqdDeZwa+VVlTzmdT3iA+//ftcpF8Vro?=
 =?us-ascii?Q?neu+h0E8nTCat92iPWIyteiR229kEEBe+z5UgOmT9q7illeuGMB1yOWoGrq7?=
 =?us-ascii?Q?9u+FrZqL5eCPCR9qleP4nAmV3JVR8tBwHwXme9Nvm4PU3lrbUO83F0HSSLSP?=
 =?us-ascii?Q?pGX8WGxC/hJ+TmtS6EUDJbqMGLpbr5UmQLL+KbS4uD5CRKLdF3XyDaCUOQGB?=
 =?us-ascii?Q?hSuzCKyebu1l+0dzD9Zd3ejOajZewh4czQQ8pFwv8+HYIWxaJ8dyqJVcFKhz?=
 =?us-ascii?Q?rr9oVQATN+6Q+3rdvd8mPsmAtqdE4sOCkqeX5VrUne17+l+Wi9471+CsHWFD?=
 =?us-ascii?Q?VdxfsaZc7L7UemS9Rh2CZ8E3fpdUQyy43oBsXJbnOwMrnhxFapy6dDxoBrYk?=
 =?us-ascii?Q?h/Y7dIlj9ot4u3J2ApUnPnjpSI+VkRrtLotkBajT/nAAESlwRYB4wzqgjUec?=
 =?us-ascii?Q?s4ayAoNm90nvnTFNOwpQul2DOESucbXMnK9zP91o9+t9cPuF73Y5pjl43A0Q?=
 =?us-ascii?Q?cMS9xjltzEYvg1PjERZQ74Y0mhaFRlN7dGUhdulrpdyvY2Vpovda7wZMeNPJ?=
 =?us-ascii?Q?u5t+m1NPyq2lYJ9oabThH0DNWsh9Oq2sK4lQz0ugUhmRqk8m3kSX1eKs1P1y?=
 =?us-ascii?Q?/lgc0cPyzEyKNzn+LTJ4g8JXfRc88tMfMWlp0eDbAwe3/O9f8k+jfSGrvKH1?=
 =?us-ascii?Q?ToY1r0DBkCUnfSHBOozx86YxNtz64Qu3hREVvzOjgSr2Ma4ei61EpCuUz12E?=
 =?us-ascii?Q?m4pK36GTF4UxwJrnSJnsIYoRjLvyh7A8PSjA+1i15x4edChmmB2pY28HIEaF?=
 =?us-ascii?Q?udORYI7+ieYR9idUkNzHgXvGaVRvXALoCmhK47DMhdJxSyAW3PHNpsxzje9J?=
 =?us-ascii?Q?c5TOgU1+xiA11OvkqwJFuQQbL7ibWobgou7T/ab3DLxiJqVr1qzmyZ80p5LX?=
 =?us-ascii?Q?0IXvmFH4LsezU0Np5Eswr1bZ+58e5YI2CJF8ytNl2zI1DkskUPEfeUHDbYaM?=
 =?us-ascii?Q?Kogly4aO9JAtEkKE+Y5U8jLhG/EoUAWezWVFMhVTcv2kg+Zodt7VsBQIF6Sk?=
 =?us-ascii?Q?A+k2oDPMQ1dZJMyPt0q88eAZtIJjL/5Qr0N8zTI4BjYWLrhThKp0ZpuY/YFE?=
 =?us-ascii?Q?+A/VFqD6T0Y56e2d/R2SwRt1Q+ETTsNuEzBLY9Ervk4GMw8anZVSqlek8UG7?=
 =?us-ascii?Q?tg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: +Ds95xABJH8jR7xzs823sMgqiO/zfAVLXnEb9AgBn4a+LKB0O1hsrvXrfd+nilytOww5r5eotk7END2uiOm085Rtt6hwJZKTIkQ4IOj2H7+kLlpEMeo4vIcyGKxJ4kTT4OJ6psOFzfPNChDTtDw1kntPAbk2B8+X/cdk7078ufAqhXSpHe3C1Kr74gD2P7SBV4oYE3+qY9XAhQYGj/+Nd7q05sN0Wavi2WpaW0KEZLLo0bYJIXVwjgT/iyVQWfLOS3DFw3i5PLnps+MRxNSS0GtNMmE8bNi9Q85W4ezGBpAkpBoIa/ORYnyfJzUtJjxfLfHdF0wmhiyEAXgTJkRefGzK2xww2sqgy5Zy5aqq3uLlzSckFuPYB0eV4kXKAWWj353rWaHZ2J+w6DjMy/AY+9cBEv+9KRRdsCHyS1Ozbnil0H7fM7PuHznLG6bWdhFHuXV9Vc1jSou2p9f7nW5qEDuLjJcrM4GDa3iBjwn+cjuwiZ9mM9iTg3eE4ffvxOiDY1uSLAWMICJf/HlGDaqaVXhZ7L+Gn0J1p2Nm+okwIZZ6vpzUqOP8YXxyZ9Owl9PsXOXDExCRtNrxbELdGNJnAFM1dxPrkRVguzhQZhBoX9w=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 554f68bf-5586-490c-97a2-08dc5a93e732
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4759.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2024 01:57:26.6202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rsop+TsXbzFQCgjLm6FiG2WU+PUQV5G9MQq52c4yqy+nzbdcheiDubkN0m6BsZ+0UulcFglZKdgb0Vl1KsxVFeEDxxvdbLt7a7iLQjlucvU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4667
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-11_14,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 mlxscore=0 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404120012
X-Proofpoint-GUID: 4eJGC_KodX-MkISa4O37N4yP7F4CxILz
X-Proofpoint-ORIG-GUID: 4eJGC_KodX-MkISa4O37N4yP7F4CxILz
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_185736_331361_0FD532D6 
X-CRM114-Status: GOOD (  10.35  )
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


Krzysztof,

> Add MODULE_DEVICE_TABLE(), so the module could be properly autoloaded
> based on the alias from of_device_id table.

Applied to 6.10/scsi-staging, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering

