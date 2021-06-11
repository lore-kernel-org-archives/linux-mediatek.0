Return-Path: <SRS0=puoQ=LF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02874C48BD1
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 17:36:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5589613D3
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 17:36:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5589613D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ouEUTH+4C4lq8KU/TcNjIkScC64mjVm6U5dxMvNvdSM=; b=y/yo7exq+5MYUa
	l3kE3Bz7fobTILCALISZyXEmxNjNBn1Zu232kJvq/vkomcOcok+Zy6wpjl+fe5dHkuWoA5j9pxNSd
	2AAXZ9V1wkV14CtZcISK5KzpAJ/KqPpsYbCzr70PDsDReAWk3HWak43ps5x8yUkYXs2vCfb2qoflx
	BwJ9QWW5S4olVJWeKv6KaPDTnMyDWxFBqNnQNezXdVd8XE/cmKgyJ9FdAnpw1wBn/Tmu0aAODrDhe
	1Qiq40QYzSeH2AKcck5+HYYA8kk7khtOB3KTYseYyR5KbQppt4lLh2076jjHV1eEwBA1ZaX92rdkE
	NkWK67P7Su0pfGcG2gjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrl4m-006L9B-G3; Fri, 11 Jun 2021 17:36:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrl4Z-006L7h-FA; Fri, 11 Jun 2021 17:36:00 +0000
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net
 [81.101.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 292F960E0C;
 Fri, 11 Jun 2021 17:35:47 +0000 (UTC)
Date: Fri, 11 Jun 2021 18:37:43 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: trix@redhat.com
Cc: robh+dt@kernel.org, tsbogend@alpha.franken.de, lars@metafoo.de,
 tomas.winkler@intel.com, arnd@arndb.de, gregkh@linuxfoundation.org,
 nbd@nbd.name, lorenzo.bianconi83@gmail.com, ryder.lee@mediatek.com,
 kvalo@codeaurora.org, davem@davemloft.net, kuba@kernel.org,
 matthias.bgg@gmail.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, apw@canonical.com, joe@perches.com,
 dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com, chenhuacai@kernel.org,
 jiaxun.yang@flygoat.com, zhangqing@loongson.cn, jbhayana@google.com,
 sean.wang@mediatek.com, shayne.chen@mediatek.com, Soul.Huang@mediatek.com,
 shorne@gmail.com, gsomlo@gmail.com, pczarnecki@internships.antmicro.com,
 mholenko@antmicro.com, davidgow@google.com, devicetree@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 5/7] iio/scmi: fix spelling of SPDX tag
Message-ID: <20210611183743.6f65100f@jic23-huawei>
In-Reply-To: <20210610214438.3161140-7-trix@redhat.com>
References: <20210610214438.3161140-1-trix@redhat.com>
 <20210610214438.3161140-7-trix@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_103559_560123_C985C89F 
X-CRM114-Status: GOOD (  16.50  )
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

On Thu, 10 Jun 2021 14:44:36 -0700
trix@redhat.com wrote:

> From: Tom Rix <trix@redhat.com>
> 
> checkpatch looks for SPDX-License-Identifier.
> Remove the extra spaces.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>
Applied this one to the togreg branch of iio.git (initially pushed out as testing
to let 0-day have first poke at it).  Thanks,

Jonathan

> ---
>  drivers/iio/common/scmi_sensors/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/common/scmi_sensors/Makefile b/drivers/iio/common/scmi_sensors/Makefile
> index f13140a2575a4..645e0fce1a739 100644
> --- a/drivers/iio/common/scmi_sensors/Makefile
> +++ b/drivers/iio/common/scmi_sensors/Makefile
> @@ -1,4 +1,4 @@
> -# SPDX - License - Identifier : GPL - 2.0 - only
> +# SPDX-License-Identifier: GPL-2.0-only
>  #
>  # Makefile for the IIO over SCMI
>  #


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
