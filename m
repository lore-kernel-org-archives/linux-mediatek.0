Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E898C32771
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Sep 2022 13:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:Subject:CC:To:From:References:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l8S/xByeINJJUtPVqs0wChkgHaGk8OwQabKE2abeLHo=; b=f+sxkio1tU490v7gh3/Qmkctok
	AK5EddmZo7nbQSOvDGm9+w182hS9+1JIHDck+wWAsRcwJeUkR4p16fvUsUj4+OkgcKOhR1ZcfgS86
	YM6pCoXYtigaDY4KNJoAlp6Z1ENZ9SjUUYLmLzWIVGCNC2KK6+H4mWFxL+yHtgfZOG2UfIPUYDvXz
	xCj+2VfzMGVSKepswSk3MgmpTy/oqkOqh/hmVnI1BAVOmnb1/sqQid+Kn+eqkWXMwGcfSRcnyPqHD
	4Avnyuvx7xKH16e4dm0EzN0HPWll+VaT2qJndN47fiedPG5UjL3DuNgwI4WMQ9oxbjj+cy8+iCmS6
	k4fx4qrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oazaW-00BOYq-4w; Wed, 21 Sep 2022 13:16:28 +0000
Received: from mail-bn7nam10on2059.outbound.protection.outlook.com ([40.107.92.59] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oazaU-00BOXw-4M; Wed, 21 Sep 2022 13:16:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m0WV4QtoQgzMQ48GTuPNaqJZSY+ITqySOzoE/DwaLfiOE+st/CXvGmUlPJ16xn/5xWC2whw+ih4k/znbj3Lt/ZOJ6Lvv9RkMu0vFggA8ebMhM883hx4oqXvJyFlKjJldrSnLJVvtpLWWWUyzkBBMXk3mo+oTwcDnCgX+Ld+PScBtqw3X8fCy1NyfHW1SI+Qsu0fcOeRX6tlDkGGIJt3dXCtnNEQ/SvWLP7P0+uNWvJF2m+hu+1egnTO1JuFBjtXu7vZ0/S49R1vS0uA5UnkcZ0c93LUs3hlL7IHtC0KKflD85y1wrGHrbVbCaDRw+duTmNhME+C2ODrpjDGejawUBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l8S/xByeINJJUtPVqs0wChkgHaGk8OwQabKE2abeLHo=;
 b=btJHN00qwF6eP7ba1h7fZm6WDpkr2vt6F84ywtBjjE24PCW0FzcCKq4T2wH6wpqLnEKKAhifPwMuCM6+pP9euRq/qhou6OcMI0wghMVmjkPahDJZtkskAqV6kh8J7KpwCrBBHV6INl6u4juKRmh6ga/1x51UXPai9UlxqsLIQ06DoZXhjws+pS8ExNyZd+sT22ZOB4kOWdaXVAH8oGILBXB4T3MhFd6xGOnI0dtJVFczc+Ghr1eHP4vfUD7vV/0E5Bj/RlN1Rb5dkcvE3cqzb0DZf3OCuq+6rX2ngHoRQC3WvuygThOV70Inlv/VjxmElu5wDls2lopumHnqDogKzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l8S/xByeINJJUtPVqs0wChkgHaGk8OwQabKE2abeLHo=;
 b=DUPRtohCUCVUtG6hOilZQRCF7kYFDjNrZSGmJhetxC3iQFMIjYlfTygCmB6XQEvsCdGMktUw40yndzhPVAUaJvPSB+b4rhhqs+I14vAONOhaHgXIKNzs5H0Xodd6eI2ZUFeH8B97h5mSEq4gRqa7cMXl6AaEcg/0ytYgpVhfkN8hBHTtcAOTctBy4wwE8FjzQ7mkijvpQuCjP23JbkiWhCpONVBUC9U5aEPloiiRIGhbqE+JTRbjLoy+uhA4Zk72dQCqgPc2ECi2O8aHw3/iGmIaXHvVFzeKW6LWQLlGwkm6SzjvSbhYtRAlF3A4tPisNVeOCNCNhZphSV3ue2nEkw==
Received: from DS7PR03CA0100.namprd03.prod.outlook.com (2603:10b6:5:3b7::15)
 by DS7PR12MB6263.namprd12.prod.outlook.com (2603:10b6:8:95::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Wed, 21 Sep
 2022 13:16:22 +0000
Received: from DM6NAM11FT027.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b7:cafe::1d) by DS7PR03CA0100.outlook.office365.com
 (2603:10b6:5:3b7::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.16 via Frontend
 Transport; Wed, 21 Sep 2022 13:16:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DM6NAM11FT027.mail.protection.outlook.com (10.13.172.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.14 via Frontend Transport; Wed, 21 Sep 2022 13:16:22 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Wed, 21 Sep
 2022 06:16:12 -0700
Received: from yaviefel (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Wed, 21 Sep
 2022 06:16:07 -0700
References: <20220921090455.752011-1-cuigaosheng1@huawei.com>
 <20220921090455.752011-2-cuigaosheng1@huawei.com>
User-agent: mu4e 1.6.6; emacs 28.1
From: Petr Machata <petrm@nvidia.com>
To: Gaosheng Cui <cuigaosheng1@huawei.com>
CC: <idosch@nvidia.com>, <petrm@nvidia.com>, <davem@davemloft.net>,
	<edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
	<nbd@nbd.name>, <lorenzo@kernel.org>, <ryder.lee@mediatek.com>,
	<shayne.chen@mediatek.com>, <sean.wang@mediatek.com>, <kvalo@kernel.org>,
	<matthias.bgg@gmail.com>, <amcohen@nvidia.com>, <stephen@networkplumber.org>,
	<netdev@vger.kernel.org>, <linux-wireless@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 1/5] mlxsw: reg: Remove unused inline function
 mlxsw_reg_sftr2_pack()
Date: Wed, 21 Sep 2022 15:15:43 +0200
In-Reply-To: <20220921090455.752011-2-cuigaosheng1@huawei.com>
Message-ID: <875yhgyijv.fsf@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT027:EE_|DS7PR12MB6263:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ef6d7fd-4c35-4d72-764f-08da9bd37aaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	4QqDn2M83GMRBdt/gNhxPEFbm8bOfu+l5ep6vveHx+bNPtevDRt5RNT0VhdRwE/s1hZg8h4dV/MUmvsn2DiaOPPB9q7NzS7NjHo3yqAmL71H93sIaFqK7qbwFVEfAN4nZRjSvODJOjU9MKjwbpC3GxMOe8wYawsRKeTT1WkJ83pPeL9G6HacHP8dBV1MXMf0fHAk3Wh2GVZ2B1BlR87w3tF3RV7prbNzHmmuhyj/2WXiKkujxPhooDoCcwekUNIONRVOJrLAm9NZBTwBnVzXSV6Jxm0mMN0wKBO/ZeOhE5ZYaNK7l1e8vCcodippmUpPRtoEbt0CEe+Xv//vAOsN999vc49D4B2L6YAm6BJ2+XwBm2yxlnFfUy6qSxrxf3JjvA2tAAj4JDlZWrE1ljIH/Gv8e5YcFWBdY/Vdqt0iITlfOBqU3ha2jwJHxREN1MucJz7+EfJ/Ii2Ll/WzaG2ZDZCy+BzTd+GGTfuw2nS2LnrDO8/QRa+EvhnPFkMk9D+3TATeL/APK6sTreORIfgjqE9IBQnVVUf6Ua3ljaollFrVQLyF3vy81Zh2I5mxLbDymbocPkhxca1iTkQNVP/wIRafPXkytEEay2rzFYPxYQMFKS5TiK4Z55jSnopvGxtDjVU9qhqurwONfKkHDmMaKEa9vK71kh054AP+WLOYPY6iHcDDkM8H9HGFRRL1NNQ5kA13PTXSLythOC+rtoGrT4/FucDeg8DJuA1Ig1tUwnWc5ymeEPIGfp2Zn1EpgECukhZtPRlzxk0vY7sZAp3Dmg==
X-Forefront-Antispam-Report: 	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(376002)(136003)(346002)(451199015)(40470700004)(36840700001)(46966006)(426003)(336012)(82310400005)(186003)(7416002)(8676002)(70586007)(5660300002)(26005)(70206006)(2906002)(316002)(82740400003)(36860700001)(2616005)(41300700001)(6916009)(478600001)(36756003)(558084003)(40480700001)(7636003)(356005)(6666004)(86362001)(40460700003)(47076005)(16526019)(54906003)(8936002)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2022 13:16:22.3336
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ef6d7fd-4c35-4d72-764f-08da9bd37aaa
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DM6NAM11FT027.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6263
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_061626_211697_C2D410A7 
X-CRM114-Status: UNSURE (   7.68  )
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


Gaosheng Cui <cuigaosheng1@huawei.com> writes:

> All uses of mlxsw_reg_sftr2_pack() have
> been removed since commit 77b7f83d5c25 ("mlxsw: Enable unified
> bridge model"), so remove it.
>
> Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>

Reviewed-by: Petr Machata <petrm@nvidia.com>

