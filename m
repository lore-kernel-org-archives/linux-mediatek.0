Return-Path: <SRS0=CMHm=JQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8965FC433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 19:20:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA91A61354
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 19:20:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA91A61354
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ulTUb3M3bE8uVb07D0tG3/JkL9Nr/c6og6X4qCrwau0=; b=KQzEkYYuPYbzuwpf/dOuwERqo
	/nKIe9kl+WdAYG+O5Tire4YTRbgMbp9zjoz65BFGYcLGyfJ+Td20CghcJ254GllBWV3LFRmWHKOWd
	SyowVM71SNeQkxWmn+Skns5Ghh8Gqvd1Aex/oxz/6UlDqB5xhus4XoJ4NxL3upi5B7fCuUSrirvBY
	dowDT+H4s05hJgfyhwevTx7NduTwzODPAU+GxUocpwoPhmC6o+GDGfqlarXUkjkQ9JV/HGJxylcfP
	U4sSz8CYePrZs8bzsSSUVi6jEcjP3281cAN+2IF7GhAuF4b0fgtzUHLLHnS0AgUV+91UjaflEOmKF
	0nPdmiO6A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYZRW-00AUBS-P8; Mon, 19 Apr 2021 19:20:22 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYZRT-00AUB2-65; Mon, 19 Apr 2021 19:20:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=ISmqrdj1URDv+uQeVPT8kvwRML6vBgNKgBToVY52o3o=; b=JCFNBO0mZS5HXi1xDhK8+WJHf+
 3IZBpHoX2q3sKIdMLX/Giz7SoLJFQFy3nCfQChdsHr4VnefmJ+VRrQnofsRTH5nyBAds3yY3NVtTk
 9hJPcAoWDqfoEagdPtjQGiKOBy0inYaTQdfYK0fT8AqgSfgktvTSBwQKkspo5QxzPbZQv13XFM2ao
 7S+r64kKqSu4cZ0NHYiSzUFO5DvbmT/YmEnwY5cHh74/IzD/s/99II8SYFzxOSBa/Tur2M1iJ6CU3
 tqJ4ovGWMawehgAFqatJuWeqNUO6aCQx1xsz86qn5Ru9t+vye7Nh+FpEqvfcMV/G1P1cFsx6I15rR
 VbUZl2rg==;
Received: from mail-dm6nam10on2051.outbound.protection.outlook.com
 ([40.107.93.51] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYZRO-00BbyN-6C; Mon, 19 Apr 2021 19:20:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n5+lsChP8yhkSjhasvokymzzF0oEBwBt8/zPbxbdn5xHeo5A2pUgYOcIDq9afYVfaYufzwxPFYDjJVBOM5x5HqhPK6w/IC8HeXvy+dEoJTmJ55U2EWPDA3RiqY9JpIjCVlAmlm6V7U6x+U67mx9xehQiRQU9I2wST4fAaChFStulCPJaXKxkyuHwmX7ZHtuN5N+clAZ0iaFG/mMtjeB7AZDasG//1RP3CKGdcUWFVvCvbp53rxt943YgyngqhkLRVYs+oDhlkku8YQnCRD+q7wZSuh6spctfw7fulGBnZ9+ZGpeOJ2SCsosP1SlyCfDXq3o8xbejIQHmrneWI9xl7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ISmqrdj1URDv+uQeVPT8kvwRML6vBgNKgBToVY52o3o=;
 b=nyGJJSTsQED6MZ2g3KzqEHvJ1QND8IVC2w8G8ZozrZh8h4R2RoGZr9ibuPRG02LZ+f0KOjs8qm4t3leI+9BKqFKimshq7vY4wI92d4SSebE1XCqls/LHFmi26wfBr75CDKHu+4YU9mXOmVTHxcPRYFrnpqqir7O+S6QiioeD/uerX4EmbUO0hrnB7+/RL2LA9qcLrwPk1ilpfdYT3s2q+UZXcMjzEiULrtmpfWI38y5jB7j935xP3P3GZwe7RViiF46/77UeZeRZ+mpUkAoTmV67XU7oBM7vWX9o3kINRbnQ9zVCIQZNU070T4UJAw/mqsglIjDxfhHfrDFmFGNlAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=microsoft.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ISmqrdj1URDv+uQeVPT8kvwRML6vBgNKgBToVY52o3o=;
 b=CtdJ+QWZvwHYScZMLzgt0hosDY6BWxBee980DKfBZT0ExlkV86of2wVie87rc8gTQuD6nZBEPmz6/48prNqG/ci4265IY5At5BAdtp8jOZbG73yCAs7dohPCTg03+C5V0oBJygrcCSs2MQfxhrowQVd7Ww/BQ2bbd37PCQRcPEL/7UAlyFwmqZTo8BL1pxIOnnwHaU+UBYlnnOpcXtwIiBSOhGO0FVWouSbAgdXHN63zCZXo06SQWuxf1hbWCpP8PsPenxuHToosgHubXAXdcD5kIBl33bsnthr/WNs0hLqwVE5uwHKQbCycwHiWS0MawWqKOZzhEjR4bjv3OkOXwA==
Received: from MWHPR13CA0009.namprd13.prod.outlook.com (2603:10b6:300:16::19)
 by MWHPR12MB1408.namprd12.prod.outlook.com (2603:10b6:300:12::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Mon, 19 Apr
 2021 19:20:03 +0000
Received: from CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:16:cafe::77) by MWHPR13CA0009.outlook.office365.com
 (2603:10b6:300:16::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.8 via Frontend
 Transport; Mon, 19 Apr 2021 19:20:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; microsoft.com; dkim=none (message not signed)
 header.d=none;microsoft.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT022.mail.protection.outlook.com (10.13.175.199) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4042.16 via Frontend Transport; Mon, 19 Apr 2021 19:20:03 +0000
Received: from [10.26.49.10] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 19 Apr
 2021 19:19:57 +0000
Subject: Re: [PATCH v3 01/14] PCI: tegra: Convert to MSI domains
To: Marc Zyngier <maz@kernel.org>, Lorenzo Pieralisi
 <lorenzo.pieralisi@arm.com>, Bjorn Helgaas <bhelgaas@google.com>
CC: Frank Wunderlich <frank-w@public-files.de>, Thierry Reding
 <treding@nvidia.com>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring
 <robh@kernel.org>, Will Deacon <will@kernel.org>, "K. Y. Srinivasan"
 <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, "Stephen
 Hemminger" <sthemmin@microsoft.com>, Michael Kelley <mikelley@microsoft.com>, 
 Wei Liu <wei.liu@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Marek Vasut
 <marek.vasut+renesas@gmail.com>, Yoshihiro Shimoda
 <yoshihiro.shimoda.uh@renesas.com>, Michal Simek <michal.simek@xilinx.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Bharat Kumar Gogada
 <bharatku@xilinx.com>, <linux-pci@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-hyperv@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-renesas-soc@vger.kernel.org>,
 <kernel-team@android.com>
References: <20210330151145.997953-1-maz@kernel.org>
 <20210330151145.997953-2-maz@kernel.org>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <316e8be4-fa70-75e8-8483-ae38036306e0@nvidia.com>
Date: Mon, 19 Apr 2021 20:19:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210330151145.997953-2-maz@kernel.org>
Content-Language: en-US
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: afbbfe3d-5971-4f2a-b109-08d903682205
X-MS-TrafficTypeDiagnostic: MWHPR12MB1408:
X-LD-Processed: 43083d15-7273-40c1-b7db-39efd9ccc17a,ExtAddr
X-Microsoft-Antispam-PRVS: <MWHPR12MB1408AC4A25A0E3219E06A516D9499@MWHPR12MB1408.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fa0zNif5H6T2ITVud9jwHXdnIcO3hgXEeE96McLTVm6+eZz5eB7wAxXFzfxB6XMhdpnoORq6ZBTwXI4fH0ph99Gf3iaMCikpk2ssvSXOH8DUL1GFHNiObvInVd2FgVJzz5bBLU9eGCmP0nPhO24XJsNJNNetcA+AbKsRfV9Hpp6qwf+YlPEwheg8V6RFMN9mrVfeaZifG1OY7DK+XapUkdUhnBD0WwmiHANof4mtpaZyKDgjHy6r1l3iBzjAVwg9LGWvdfgsykItvhhRTTv/kFu8ncn89Oioe6KNJ4gUlGZ2K23PKU3udfr7kqHfn90/PZP2s6patel0vl2DQJwnI4PHgn/YTt4G7sKeQB0Q1qkSFJDA8Ih1yY4WJck8f44PYYG1mL+uhVoxVnRVl7yRkG/n0IcoxP1grZM26Gwgcv2iFgVXPO+TEPT+rsba5e5ne12uRKM3aKqUcUkEbrNLPkdz4QoDTXL7rbjiFKghSBYiw76RKjk8Fed+yeqprfqGbX1iMdkAzZynCoGbRlmn/jti2rvQL1pDx5T01ZxtVsjKgFa7DCSOrGWu0Yts282VG6huzGNGPV0vCxG5r4RUwf+kRtzpRR4jUwx+5w4cNdxaFUkqvgLclSxUvNZgN6YAL6SSbl8kJmDDdzsYWcpl6hmo/m7yRVWByEtbXByFvANpjtUzG5QCZ08bS8TzHSs3
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39860400002)(136003)(396003)(46966006)(36840700001)(53546011)(36860700001)(478600001)(36906005)(82310400003)(316002)(86362001)(16576012)(31696002)(336012)(16526019)(47076005)(426003)(110136005)(36756003)(186003)(5660300002)(7636003)(2616005)(70206006)(31686004)(70586007)(356005)(82740400003)(4326008)(2906002)(26005)(8936002)(54906003)(83380400001)(8676002)(7416002)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2021 19:20:03.0886 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afbbfe3d-5971-4f2a-b109-08d903682205
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1408
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_122014_261052_B795504D 
X-CRM114-Status: GOOD (  13.78  )
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

Hi Marc,

On 30/03/2021 16:11, Marc Zyngier wrote:
> In anticipation of the removal of the msi_controller structure, convert
> the Tegra host controller driver to MSI domains.
> 
> We end-up with the usual two domain structure, the top one being a
> generic PCI/MSI domain, the bottom one being Tegra-specific and handling
> the actual HW interrupt allocation.
> 
> While at it, convert the normal interrupt handler to a chained handler,
> handle the controller's MSI IRQ edge triggered, support multiple MSIs
> per device and use the AFI_MSI_EN_VEC* registers to provide MSI masking.
> 
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> [treding@nvidia.com: fix, clean up and address TODOs from Marc's draft]
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>


This change is breaking a suspend test that we are running on Tegra124
Jetson-TK1. The Tegra124 Jetson TK1 uses a PCI based ethernet device ...

$ lspci
00:02.0 PCI bridge: NVIDIA Corporation TegraK1 PCIe x1 Bridge (rev a1)
01:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd.
RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller (rev 0c)

After resuming from suspend, networking is no longer working. The reason
why this breaks our suspend test is because that setup is using NFS for
the rootfs. I am looking into it, but if anyone has any thoughts please
let me know.

Jon

-- 
nvpublic

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
