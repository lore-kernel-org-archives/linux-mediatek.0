Return-Path: <SRS0=7tkd=FN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AA57C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 06:49:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3309323B7D
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 06:49:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3309323B7D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4rZLbMZt/E+peu/ku/kmV+RKnpCBB8gHf0ScSPdJFEI=; b=qpmgNu9eViZqDLvyiuD8lp6KY
	AvHtNkPgM1bQzoiBO4nr6+c2gdof3v4dt3oE/iGUutTHyjHaFmQ+y4mvQWFnwkVumcBReQ/JFEnLo
	RpEQZZ9ucGi/PfjqSRAILK5HNUQYp0NZwaKNb34h7K5lg2aHxC8sn1+3C6relHpk5an1LHrPj4zaO
	7wU8CJ7P9qQ/NkBMFYsLjktiv0bWmZj/jD5RlzMPmDJI7LfKEZWb4xcliUr+RQPuF47Ge/YJI5l7Z
	XhjUQAfNh8VD0EN/XoGvWL7n1tn1XeaffSO5/Q34VzrUUT3Wkx8A0y1NkP26cC3uScxNKgBdAjPeH
	VlIr8DkmA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmtHm-00080F-PP; Wed, 09 Dec 2020 06:49:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmtHk-0007zp-45; Wed, 09 Dec 2020 06:49:13 +0000
X-UUID: 3734c4efa7fa4e8b8f16cb17a3449edf-20201208
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=/BNwn7ZnxvpJrjyggPTyczK8/eauiOe9smE73GyHAnA=; 
 b=WfcPMQOlt8JpDtufkVRzQFajY4rMNmVCrYyNiyG9foDwfDQdbOT83mo44VstCUcyCRRkEr/g3iHyVR9TbMHLBS/Vw5sV0I6XfYYUS9bUwWRWvQAgHSw+6C1WbmLRnSiHKZqSSsydB31qZvT3D+sZI/JA+3i0e8Xk8ZRbhO6w1yo=;
X-UUID: 3734c4efa7fa4e8b8f16cb17a3449edf-20201208
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2103360253; Tue, 08 Dec 2020 22:49:07 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Dec 2020 22:49:05 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Dec 2020 14:48:54 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 9 Dec 2020 14:48:58 +0800
Message-ID: <1607496538.3580.31.camel@mtkswgap22>
Subject: Re: [PATCH 1/1] scsi: ufs-mediatek: use correct path to fix
 compiling error
From: Stanley Chu <stanley.chu@mediatek.com>
To: Zhen Lei <thunder.leizhen@huawei.com>
Date: Wed, 9 Dec 2020 14:48:58 +0800
In-Reply-To: <20201209063144.1840-2-thunder.leizhen@huawei.com>
References: <20201209063144.1840-1-thunder.leizhen@huawei.com>
 <20201209063144.1840-2-thunder.leizhen@huawei.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_014912_377023_5D47E72A 
X-CRM114-Status: GOOD (  20.47  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-scsi <linux-scsi@vger.kernel.org>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 "James E . J . Bottomley" <jejb@linux.ibm.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Avri Altman <avri.altman@wdc.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Zhen,

On Wed, 2020-12-09 at 14:31 +0800, Zhen Lei wrote:
> When the kernel is compiled with allmodconfig, the following error is
> reported:
> In file included from drivers/scsi/ufs/ufs-mediatek-trace.h:36:0,
>                  from drivers/scsi/ufs/ufs-mediatek.c:28:
> ./include/trace/define_trace.h:95:42: fatal error: ./ufs-mediatek-trace.h: No such file or directory
>  #include TRACE_INCLUDE(TRACE_INCLUDE_FILE)
> 
> The comment in include/trace/define_trace.h specifies that:
> TRACE_INCLUDE_PATH: Note, the path is relative to define_trace.h, not the
> file including it. Full path names for out of tree modules must be used.
> 
> So without "CFLAGS_ufs-mediatek.o := -I$(src)", the current directory "."
> is "include/trace/", the relative path of ufs-mediatek-trace.h is
> "../../drivers/scsi/ufs/".
> 
> Fixes: ca1bb061d644 ("scsi: ufs-mediatek: Introduce event_notify implementation")
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  drivers/scsi/ufs/ufs-mediatek-trace.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/scsi/ufs/ufs-mediatek-trace.h b/drivers/scsi/ufs/ufs-mediatek-trace.h
> index fd6f84c1b4e2256..895e82ea6ece551 100644
> --- a/drivers/scsi/ufs/ufs-mediatek-trace.h
> +++ b/drivers/scsi/ufs/ufs-mediatek-trace.h
> @@ -31,6 +31,6 @@ TRACE_EVENT(ufs_mtk_event,
>  
>  #undef TRACE_INCLUDE_PATH
>  #undef TRACE_INCLUDE_FILE
> -#define TRACE_INCLUDE_PATH .
> +#define TRACE_INCLUDE_PATH ../../drivers/scsi/ufs/
>  #define TRACE_INCLUDE_FILE ufs-mediatek-trace
>  #include <trace/define_trace.h>

Thanks for this fix.

Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>





_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
