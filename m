Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C23CD11C2
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Apr 2024 09:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:CC
	:To:Message-Id:Subject:Date:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hTf0upw0HQjpnQ6UQarFtMoCKi8zE4LKkr6HqiuKwo8=; b=3vO3dSf6ZT85SD0zkHjK7sXvWw
	aGR/2wChJ9K45NWLFqotmaJxlGFzEOOm8Ldke/YyyaliV/3JLW62ONsQreruuzIBEvl7HdV4kNUwo
	APlPAzMay4FF4MGjFAxqlomYNszx/urbcMQsZ7QV8o97wz/tyjIedAiJBYDY+mIA7QSn5E1bozhLL
	QyJ00vwxCZsNrCtTYo01SRi61FVxtgeZh6Z2UQhHRqjmpjRTQv6Q386SfQ+6bS/8uAj2puxQrlX9e
	3EM7y40mWW5jGdinhTdMoF+ob2HEzBS9VdMuzKAvKqRxLARjoD5mAFSrf1PT8wj8dWOPQVTuJftCD
	KUhqYYFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsfk0-000000069td-3Fzl;
	Fri, 05 Apr 2024 09:20:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsfjx-000000069qg-40XJ
	for linux-mediatek@lists.infradead.org;
	Fri, 05 Apr 2024 09:20:07 +0000
X-UUID: ab1fd6b6f32d11eeac1957ae9f99f617-20240405
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:CC:To:Message-Id:Subject:Date:From; bh=hTf0upw0HQjpnQ6UQarFtMoCKi8zE4LKkr6HqiuKwo8=;
	b=Sa9ZNWh/rx970elANfro1D7OGj7XHXNSjc73a8fAlWIlAl9fQMIigOESggg7FbO1EswhCusOMgX++5xwigdr54McDQ0AOlM9ddx/+WFD+AVrN91UjRj1Hy4ThTB87O1n7vK+n+6oVrV42/wd/lcgdGsDnnTTi3vmRPZvT0JyOks=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:6c0a7336-12d0-4c9c-8418-14bb80c1d409,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6f543d0,CLOUDID:1fbdd485-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ab1fd6b6f32d11eeac1957ae9f99f617-20240405
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1104024594; Fri, 05 Apr 2024 02:19:56 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 5 Apr 2024 17:19:53 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 5 Apr 2024 17:19:53 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IQrZouLhwXwTOGUqiNnePlyb5Uyf13bHh55/u1qLCu8PuVl36uF+iVf5QA8Pc8wVXJ2q7heXPtKboUaTfYSZhfrzwwKgqWetpllOtLR9HZ4BlC7kSInGMLiRmJWZz1rYwLmEydbDs4wUKTet0n7PTHNJ8M1bTGvaty99YcLuwFb+IWYpsKdAzzOLnZCUp65SNKYrY7FxZvHu/6jnt6ucR1v6QjlExGL2dDQ4bicIqoauZpPUTgPmK8j8W6Nf5Se0GLvkBQzPadS3WN+F7b7SMh10hK2Z4GaUAmvoYuAVGm8wl20c/Xq34Vppb87k5Z70FsmeaTUzjZiHC/4UI1L3Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hTf0upw0HQjpnQ6UQarFtMoCKi8zE4LKkr6HqiuKwo8=;
 b=VTLEUoOVxQ5FtXeaOrOAHuTrp5RzSXS9J9x22fGwVP+eaAHir8T4twqTj18I3/z0S8DGRVuzlULFZeaiSUF7Fgujr3jv3RXeqD1Mi4IAKCsI/uLd/TIq0UKEXXqAXD+PSYUvHWjohTIpvNnFzOqPdJZ9SEIuO8k5gAlooC92ue9YDOe0BKDKdKcUkduZcY06j+RjrsRgK3urTuDtWPp0nt6EWziSpwn/Yzv5H/UH/C/hVfA5AfP14bh0UqxMBkVvz9w5CAF1cPofIUvFqQIda+ImEPTIDfAl8KCavQdF+9exX+VGhMD4OrAMfVU/Ltu49auJM7SRjT152VImDuTmgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hTf0upw0HQjpnQ6UQarFtMoCKi8zE4LKkr6HqiuKwo8=;
 b=kz9OOXXdjVNz9kByk0+HdFulsgjkfEw9b2e/tKSeLe4wwN1H6gAtgcSUB6BVemou3XMzmmr+wYYDNt9h0P1pCms34c4v/u7IYX4ArbR0M0hn6RYaDslivMvXG5CqAa1Foc76xUOsVE4ArMllyN6nnnDfE650koV/KBe8zbJdUVU=
Received: from substrate.office.com (2603:1096:101:183::7) by
 SEZPR03MB8122.apcprd03.prod.outlook.com with HTTP via
 PU1PR06CA0020.APCPRD06.PROD.OUTLOOK.COM; Fri, 5 Apr 2024 09:19:51 +0000
From: Deren Wu =?utf-8?b?KOatpuW+t+S7gSk=?= <Deren.Wu@mediatek.com>
Date: Fri, 05 Apr 2024 09:19:51 +0000
Subject: Recall: Re: [SPAM]Re: [PATCH] [PATCH] Bluetooth: btusb: Add support
 Mediatek MT7920
Message-Id: <A28MT1PXPMU4.9N1TSV0GJ9WQ2@si2pr03mb5515>
To: <regressions@lists.linux.dev>, <mike@fireburn.co.uk>,
	<Peter.Tsao@mediatek.com>
CC: <Aaron.Hou@mediatek.com>, <Chris.Lu@mediatek.com>,
	<johan.hedberg@gmail.com>, <linux-bluetooth@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<luiz.dentz@gmail.com>, <marcel@holtmann.org>, <Sean.Wang@mediatek.com>,
	<steve.lee@mediatek.com>, <regressions@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
X-MS-PublicTrafficType: Email
client-request-id: 8cb3ab86-11f1-4966-5fac-605dad4d4705
request-id: 8cb3ab86-11f1-4966-5fac-605dad4d4705
X-MS-TrafficTypeDiagnostic: SEZPR03MB8122:EE_MessageRecallEmail
X-MS-Exchange-RecallReportGenerated: true
X-MS-Exchange-RecallReportCfmGenerated: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FEt121WSqyxpOEpGptroDvbYRl0/56Z5TbFaHu3RzYHfWNnbJUXK7oYwZ4F0y9EhrZgd9hUe4N+ZNM8PuqBg90rhM9CNoqixcrECAG+7Wh/IJGOLPN64rMg3F7OuwEtVDSLXNfOx5fcsGM3tdzo4HBKq3k4Of++jhX/+vSnO5y2Be2i5YaqokSViuAhewNIWEWATHCrWH/DYoyadf+mcD9C3PpeyeQHNjeNbx6ECsO+J6WVtUPy6Wd/pfed5mp5IMSE6OxJRXf67+kXO0+zc3az1EklXf6K82BECYorifMiC7/DffnWerh5YKM2Y7dgW3vwkdIqtkj+Cvqdqyc4gXprsAGXIVU9hdPTjhaB1Z3TfqZpo4WURtKewYUbntJgk+vo85NsJplUdGkJ7Hqx2ivKNKd3roFprF8K1vSLHLOr3cEZ2NpApEEqGtn61z0uhb+IFf64YGTg04+YdgC7pkP4af9138t/urMtN6GEHT1OlHkEutqEa4Bt7MSX8MgsXwvfExgyZzqltrDhz0YlIzgKu8ExeSwVKdldduPSFSd5XTL7sng6Fj65gfHf5qL5ETEdn2/bIfctK2lXWuYc58mc26nYpK+TvCLdTs/qLGIW4Noo1eOwsPyMBamDJgl2iSlERmYCUuO53Jc57CVS3yKRf5m9jDqL+ufDl0HsuXPHyH9RbcuwSf3syY1jUyIxT/7mzLkoTU534vO/YVP3fNQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(217643003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 085e89RHFP+FdVSOzhCzCtF8QsYJSaEnXsLR1Jw0M9qwXOroNpLUCvUvdyln/3z11HCqOVGqDnGsVZDWFXPQyWFRYbLd9foY6YzgWwDJOTHP4yFHuze1G2t9qBPjk2t3TVEswJwJoBgknFtSTLT/znLd+YxqnYcFn9wt7btMVIUV1wPkDM/GYEUDjzT9wDEtgzRGhAgYoFMYc0k/WAhHy4sdmL0q3FqVLi4H2Z3B1z50Yerr6ofmJbZQQ0JAzld6UpqovpNEzpmh8jsGgkbXBR0UO6GT1mwuLnCH4lXoTX9oahedttJM2j36KhLBFCBaKXjvDh6kp4sJlBsAP6+WzYzoVfzIDbwwJnh8Gz3VCq9KkgEsf7lHTAVuDDAyrxrNSIFJQX6aLHaZrGavY2b97Yf+boIoeFA4ayiEdMKuo/o=
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HttpSubmission-SEZPR03MB8122
X-MS-Exchange-CrossTenant-Id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2024 09:19:51.2982 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: addf9e4c-0fac-4335-990f-08dc55518c45
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8122
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--0.375800-8.000000
X-TMASE-MatchedRID: uX0qRX/JYJSALnLwcLJ8c0+4wmL9kCTxjzwigoyOACTd1Nq3SV2z16PF
	jJEFr+olmP38c3DNiySKpAefy6FsjO2eKH3LGf9LanE1Ybb9x4X3FLeZXNZS4CiM3WUt6LtFJ4R
	unYQZH/UPM0KP7wGGBtF9xxnqBdR/Z+5pUUnZoXcJW8x7nv6dHg4SVUX42+9WP5uMSYbkz+bZZr
	s9ioNnot+cnxLKcBb8lExlQIQeRG0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--0.375800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 87B3475F4BF228255B343FD9A117781AD4643BFAF4B31CB4E05559A659DD8B602000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_022006_026259_4F1704DD 
X-CRM114-Status: UNSURE (   1.09  )
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

Deren.Wu@mediatek.com would like to recall the message, "Re: [SPAM]Re: [PATCH] [PATCH] Bluetooth: btusb: Add support Mediatek MT7920".

