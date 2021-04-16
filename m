Return-Path: <SRS0=rcQv=JN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52593C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 15:58:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E948611C2
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 15:58:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E948611C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TfBT2CScE0srrmFPupy0erK/JNCwZYkg8oYBIzULPQA=; b=Vxm2RS0V1Yk/s0a0qrYi9ZBlb
	ifx/rRN4i3WAlh1ECTuzU4RUO3tZTvWQUHpHpW11Bi/qsGSNdx2Q2foBroHuuPX1RnG8BLwImUUcx
	3x++oJ+YppXPiWg3S4QMuCbS6hMesMau1qQ9QY6mWZSFf0Rur1ZiIBrCDBGq8zWdkU43UK8+6ovwP
	SN4X8vdaJY082zgtDuGaHbR/ykC3wif/Xc7s9Hi5Jb3AzLb7FvtKUKPq5H7Dazdcnyvvr/kfyGsqK
	gye/dVePOZ3drX0tVUPAU/a3QRwD9Q+UGNwbmZq6RsPzZD9VUI9nMFOYLu3O3eQ3wBPaToN6N+BS3
	IVvNX+shA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXQrf-002iGV-HJ; Fri, 16 Apr 2021 15:58:39 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXQrP-002iF7-Cu; Fri, 16 Apr 2021 15:58:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
 Subject:Sender:Reply-To:Cc:Content-ID:Content-Description;
 bh=mdX10Ys3CENup/n2J4b6wSqE/0yKOn4gC7rqdpd1SyM=; b=4J6rBeBYTJLTNHHvSTkQpFNI3q
 5nPQKqO+Z1zDfyI+eTLyWjyYaDfgeNJovp7KE825+PYmrZObXqWcz3um7hbG5gxAI4q7r5hxDPpd3
 bcvGccwkrRwbSDhogo27qkBI/9g6ye1pwYTjjpduSvqXo4J4SH1L2OuMRVgshpZehqaWL6NoDzjGE
 gAoYCp4uZOq1GjMN4BaGBoEFsCgJFV9we6YxcOyWP4UtUTOWTeBur/IRs/XV+iDk+Eepq37nTOjps
 sGM0y4Nk8cv74kIfyRXb2RazBcqOybC0SAQ7kn+eyEyrCHUPsOvSM2ls/tRWkgf4ibRRDY+JktwOv
 ULAcr7cQ==;
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXQrL-009Wwp-F4; Fri, 16 Apr 2021 15:58:22 +0000
Received: from fraeml706-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4FMLFz435Yz68B1x;
 Fri, 16 Apr 2021 23:48:07 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml706-chm.china.huawei.com (10.206.15.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Fri, 16 Apr 2021 17:58:05 +0200
Received: from [10.47.83.179] (10.47.83.179) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Fri, 16 Apr
 2021 16:58:05 +0100
Subject: Re: [PATCH 5/8] iommu: fix a couple of spelling mistakes
To: Zhen Lei <thunder.leizhen@huawei.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, iommu
 <iommu@lists.linux-foundation.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, Yong Wu <yong.wu@mediatek.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 "David Woodhouse" <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>
References: <20210326062412.1262-1-thunder.leizhen@huawei.com>
 <20210326062412.1262-6-thunder.leizhen@huawei.com>
From: John Garry <john.garry@huawei.com>
Message-ID: <e04d117a-4832-7f95-7adf-dbece21aad8c@huawei.com>
Date: Fri, 16 Apr 2021 16:55:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20210326062412.1262-6-thunder.leizhen@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.47.83.179]
X-ClientProxiedBy: lhreml727-chm.china.huawei.com (10.201.108.78) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_085819_680357_4484F9E1 
X-CRM114-Status: UNSURE (   7.25  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 26/03/2021 06:24, Zhen Lei wrote:
> There are several spelling mistakes, as follows:
> funcions ==> functions
> distiguish ==> distinguish
> detroyed ==> destroyed
> 
> Signed-off-by: Zhen Lei<thunder.leizhen@huawei.com>

I think that there should be a /s/appropriatley/appropriately/ in iommu.c

Thanks,
john

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
