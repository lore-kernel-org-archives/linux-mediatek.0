Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF6FC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Mar 2022 22:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aXVlMF7hjOP4CnPGESEJfgEIHqpLpLS+KzyajdR25K8=; b=2sXxtoMmUkfMEO
	hCIeAz4U5DpveRU+Ppb0KK2HzRVzxv7gv7w7IGQclx0XzHwVFg1HmKK2pnWoqvam+VGa2dwPfRRdr
	7uJ2hDWCV6U7imiIQFlNXTkbDOajiGIt3/hthUV1LYC6nmu1nLGG4sA+b27GbVfkUu052cKV0LUWA
	LxzZ9DwVgiyqeyD+SF3zdZyBHj4YAM4aRI4UWQgW65lL1o3cXxuE4BCFXaevnZMunzP40QQwZc+Ca
	U79YgKnAKKGb0yEPiHec3CnFhRm4cqzzSVVj89tRUooKxfA+tzHV4yV2UKDB4rXwm5aMp61ivgL/M
	JDivD0ZfG7dXjELpr4gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPuPB-00812m-S0; Thu, 03 Mar 2022 22:58:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPuOw-00810p-OS; Thu, 03 Mar 2022 22:58:31 +0000
X-UUID: 417c5ad7ecf3499dab29e650c709c793-20220303
X-UUID: 417c5ad7ecf3499dab29e650c709c793-20220303
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1432614113; Thu, 03 Mar 2022 15:58:22 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Mar 2022 14:58:20 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 4 Mar 2022 06:58:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 4 Mar 2022 06:58:18 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <alice.chao@mediatek.com>
CC: <cc.chou@mediatek.com>, <chaotian.jing@mediatek.com>,
 <chun-hung.wu@mediatek.com>, <jejb@linux.ibm.com>, <jiajie.hao@mediatek.com>, 
 <jonathan.hsu@mediatek.com>, <lin.gui@mediatek.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-scsi@vger.kernel.org>,
 <martin.petersen@oracle.com>, <matthias.bgg@gmail.com>,
 <peter.wang@mediatek.com>, <powen.kao@mediatek.com>,
 <qilin.tan@mediatek.com>, <stanley.chu@mediatek.com>,
 <wsd_upstream@mediatek.com>, <yanxu.wei@mediatek.com>
Subject: Re: [PATCH 1/1] scsi: Fix racing between dev init and dev reset
Date: Fri, 4 Mar 2022 06:58:18 +0800
Message-ID: <20220303225818.12752-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220303075527.25258-2-alice.chao@mediatek.com>
References: <20220303075527.25258-2-alice.chao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_145826_843699_4AD9309D 
X-CRM114-Status: UNSURE (   8.83  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Alice,

> Device reset thread uses kobject_uevent_env() to get kobj.parent
> after scsi_evt_emit(), and it races with device init thread which
> calls device_add() to create kobj.parent before kobject_uevent_env().
> 
> Device reset call trace:
> fill_kobj_path
> kobject_get_path
> kobject_uevent_env
> scsi_evt_emit			<- add wait_event()
> scsi_evt_thread
> 
> Device init call trace:
> fill_kobj_path
> kobject_get_path
> kobject_uevent_env
> device_add				<- create kobj.parent
> scsi_target_add
> scsi_sysfs_add_sdev
> scsi_add_lun
> scsi_probe_and_add_lun
> 
> These two jobs are scheduled asynchronously, we can't guaranteed that
> kobj.parent will be created in device init thread before device reset
> thread calls kobj_get_path().
> 
> To resolve the racing issue between device init thread and device
> reset thread, we use wait_event() in scsi_evt_emit() to wait for
> device_add() to complete the creation of kobj.parent.
> 
> Signed-off-by: Alice Chao <alice.chao@mediatek.com>
> Change-Id: I2848cf054186739d3a125a0635dbed5539557e64

please remove Change-Id here

thanks,
Miles

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
