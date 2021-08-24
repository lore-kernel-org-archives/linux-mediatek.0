Return-Path: <SRS0=VOwE=NP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A78BC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 10:15:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE3EA61212
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 10:15:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DE3EA61212
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V3toUPJ6gSSkoKSKVET6LG15+Q0EhGoLrhTFIvudjWg=; b=i1CnZd1dB5l8z7
	E7aVkYiMbFxz2hAidFu20fwPezaT19iOyO7u0I/t6u1pu5rr9eF/OyHX477++5jmAHXXD+ZWwi+f6
	HhGLB3HZ4ytRao96CkT6RwvxGwZkjqNVvIoan/YHnSPD08HrCZOsIbapK+l4zrF2vEW5c42d3gcPv
	AsAmJmEAAfsGJsGqn+800qSrClzqoIASvGH8m+ce8cNRBCiekPYWnO66wWz7jmhcaduL2DYtMwmlT
	Vzuy4D/BvxYuJxGbI+t+s+emc1OatMZM01xReyaiyH8aYdTruYLvwE0K4ZKUisO0qR6EjEWhldwOR
	b8a7xjTzL9+WYskL24tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mITST-002SaI-E2; Tue, 24 Aug 2021 10:15:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mITSE-002SXt-27; Tue, 24 Aug 2021 10:14:53 +0000
X-UUID: 115b27a4d110487a86b8b8ad23755d50-20210824
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=FxgG9sTrhbQWNIvjCQ8JLjazd/LJnTOmKwvwF0rgCDw=; 
 b=L/GSFa6787bdthwJ9TTZG6PD3t7pm7FGNdHUnrjX8Li9Ke0Q4mhjsWn52i4eWeWo4GS8TNWIynt6iNoIwM+I0ZADlqXmCajKO49kBeUICXmMS6FsSPHKjZmFTOkaUDsNRhLRP1moJO2Ezoxc4XXwEG9eURY5N/7Bfhaa2I8xUlI=;
X-UUID: 115b27a4d110487a86b8b8ad23755d50-20210824
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1074082815; Tue, 24 Aug 2021 03:14:46 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 Aug 2021 03:14:45 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 Aug 2021 18:14:43 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 24 Aug 2021 18:14:43 +0800
Message-ID: <1629800083.22373.4.camel@mtksdaap41>
Subject: Re: [PATCH v5 2/5] dt-bindings: gce: add gce header file for mt8195
From: CK Hu <ck.hu@mediatek.com>
To: jason-jh.lin <jason-jh.lin@mediatek.com>
CC: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, <chunkuang.hu@kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <hsinyi@chromium.org>, <nancy.lin@mediatek.com>, <singo.chang@mediatek.com>
Date: Tue, 24 Aug 2021 18:14:43 +0800
In-Reply-To: <20210818024037.11396-3-jason-jh.lin@mediatek.com>
References: <20210818024037.11396-1-jason-jh.lin@mediatek.com>
 <20210818024037.11396-3-jason-jh.lin@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_031450_162165_17CEF955 
X-CRM114-Status: GOOD (  22.65  )
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

Hi, Jason:

On Wed, 2021-08-18 at 10:40 +0800, jason-jh.lin wrote:
> To define the subsys id and event id, add gce header file for mt8195.
> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
>  include/dt-bindings/gce/mt8195-gce.h | 920 +++++++++++++++++++++++++++
>  1 file changed, 920 insertions(+)
>  create mode 100644 include/dt-bindings/gce/mt8195-gce.h
> 
> diff --git a/include/dt-bindings/gce/mt8195-gce.h b/include/dt-bindings/gce/mt8195-gce.h
> new file mode 100644
> index 000000000000..8c309e59491d
> --- /dev/null
> +++ b/include/dt-bindings/gce/mt8195-gce.h
> @@ -0,0 +1,920 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2018 MediaTek Inc.
> + *
> + */
> +
> +#ifndef _DT_BINDINGS_GCE_MT8195_H
> +#define _DT_BINDINGS_GCE_MT8195_H
> +
> +/* assign timeout 0 also means default */
> +#define CMDQ_NO_TIMEOUT		0xffffffff
> +#define CMDQ_TIMEOUT_DEFAULT	1000
> +
> +/* GCE thread priority */
> +#define CMDQ_THR_PRIO_LOWEST	0
> +#define CMDQ_THR_PRIO_1		1
> +#define CMDQ_THR_PRIO_2		2
> +#define CMDQ_THR_PRIO_3		3
> +#define CMDQ_THR_PRIO_4		4
> +#define CMDQ_THR_PRIO_5		5
> +#define CMDQ_THR_PRIO_6		6
> +#define CMDQ_THR_PRIO_HIGHEST	7
> +
> +/* CPR count in 32bit register */
> +#define GCE_CPR_COUNT		1312
> +
> +/* GCE subsys table */
> +#define SUBSYS_1400XXXX		0
> +#define SUBSYS_1401XXXX		1
> +#define SUBSYS_1402XXXX		2
> +#define SUBSYS_1c00XXXX		3
> +#define SUBSYS_1c01XXXX		4
> +#define SUBSYS_1c02XXXX		5
> +#define SUBSYS_1c10XXXX		6
> +#define SUBSYS_1c11XXXX		7
> +#define SUBSYS_1c12XXXX		8
> +#define SUBSYS_14f0XXXX		9
> +#define SUBSYS_14f1XXXX		10
> +#define SUBSYS_14f2XXXX		11
> +#define SUBSYS_1800XXXX		12
> +#define SUBSYS_1801XXXX		13
> +#define SUBSYS_1802XXXX		14
> +#define SUBSYS_1803XXXX		15
> +#define SUBSYS_1032XXXX		16
> +#define SUBSYS_1033XXXX		17
> +#define SUBSYS_1600XXXX		18
> +#define SUBSYS_1601XXXX		19
> +#define SUBSYS_14e0XXXX		20
> +#define SUBSYS_1c20XXXX		21
> +#define SUBSYS_1c30XXXX		22
> +#define SUBSYS_1c40XXXX		23
> +#define SUBSYS_1c50XXXX		24
> +#define SUBSYS_1c60XXXX		25
> +#define SUBSYS_NO_SUPPORT	99

Why define SUBSYS_NO_SUPPORT?

> +
> +/* GCE General Purpose Register (GPR) support
> + * Leave note for scenario usage here
> + */
> +/* GCE: write mask */
> +#define GCE_GPR_R00		0x00
> +#define GCE_GPR_R01		0x01
> +/* MDP: P1: JPEG dest */
> +#define GCE_GPR_R02		0x02
> +#define GCE_GPR_R03		0x03
> +/* MDP: PQ color */
> +#define GCE_GPR_R04		0x04
> +/* MDP: 2D sharpness */
> +#define GCE_GPR_R05		0x05
> +/* DISP: poll esd */
> +#define GCE_GPR_R06		0x06
> +#define GCE_GPR_R07		0x07
> +/* MDP: P4: 2D sharpness dst */
> +#define GCE_GPR_R08		0x08
> +#define GCE_GPR_R09		0x09
> +/* VCU: poll with timeout for GPR timer */
> +#define GCE_GPR_R10		0x0A
> +#define GCE_GPR_R11		0x0B
> +/* CMDQ: debug */
> +#define GCE_GPR_R12		0x0C
> +#define GCE_GPR_R13		0x0D
> +/* CMDQ: P7: debug */
> +#define GCE_GPR_R14		0x0E
> +#define GCE_GPR_R15		0x0F

GPR is general purpose register, so do not limit the usage of each GPR.

> +

[snip]

> +
> +/* end of hw event */
> +#define CMDQ_MAX_HW_EVENT				1019
> +
> +/* sw token should use the unused event id from 0 to 1023 */

SW token usage could be changed by different software design. So do not
define in binding document.

Regards,
CK

> +#define CMDQ_SYNC_TOKEN_INVALID				(-1)
> +
> +/* Event for imgsys flow control */
> +#define CMDQ_SYNC_TOKEN_IMGSYS_WPE_EIS			33
> +#define CMDQ_SYNC_TOKEN_IMGSYS_WPE_TNR			34
> +#define CMDQ_SYNC_TOKEN_IMGSYS_TRAW			35
> +#define CMDQ_SYNC_TOKEN_IMGSYS_LTRAW			36
> +#define CMDQ_SYNC_TOKEN_IMGSYS_DIP			37
> +#define CMDQ_SYNC_TOKEN_IMGSYS_PQDIP_A			38
> +#define CMDQ_SYNC_TOKEN_IMGSYS_PQDIP_B			39
> +#define CMDQ_SYNC_TOKEN_IMGSYS_POOL_1			41
> +#define CMDQ_SYNC_TOKEN_IMGSYS_POOL_2			42
> +#define CMDQ_SYNC_TOKEN_IMGSYS_POOL_3			43
> +#define CMDQ_SYNC_TOKEN_IMGSYS_POOL_4			44
> +#define CMDQ_SYNC_TOKEN_IMGSYS_POOL_5			45
> +#define CMDQ_SYNC_TOKEN_IMGSYS_POOL_6			46
> +#define CMDQ_SYNC_TOKEN_IMGSYS_POOL_7			47
> +#define CMDQ_SYNC_TOKEN_IMGSYS_POOL_8			48
> +#define CMDQ_SYNC_TOKEN_IMGSYS_POOL_9			49
> +#define CMDQ_SYNC_TOKEN_IMGSYS_POOL_10			50
> +#define CMDQ_SYNC_TOKEN_IMGSYS_POOL_11			51
> +#define CMDQ_SYNC_TOKEN_IMGSYS_POOL_12			52
> +#define CMDQ_SYNC_TOKEN_IMGSYS_POOL_13			53
> +#define CMDQ_SYNC_TOKEN_IMGSYS_POOL_14			54
> +#define CMDQ_SYNC_TOKEN_IMGSYS_POOL_15			55
> +#define CMDQ_SYNC_TOKEN_IMGSYS_POOL_16			56
> +#define CMDQ_SYNC_TOKEN_IMGSYS_POOL_17			57
> +#define CMDQ_SYNC_TOKEN_IMGSYS_POOL_18			58
> +#define CMDQ_SYNC_TOKEN_IMGSYS_POOL_19			59
> +#define CMDQ_SYNC_TOKEN_IMGSYS_POOL_20			60
> +/* Config thread notify trigger thread */
> +#define CMDQ_SYNC_TOKEN_CONFIG_DIRTY			971
> +/* Trigger thread notify config thread */
> +#define CMDQ_SYNC_TOKEN_STREAM_EOF			972
> +/* Block Trigger thread until the ESD check finishes. */
> +#define CMDQ_SYNC_TOKEN_ESD_EOF				973
> +#define CMDQ_SYNC_TOKEN_STREAM_BLOCK			974
> +/* check CABC setup finish */
> +#define CMDQ_SYNC_TOKEN_CABC_EOF			975
> +/* Pass-2 notifies VENC frame is ready to be encoded */
> +#define CMDQ_SYNC_TOKEN_VENC_INPUT_READY		976
> +/* VENC notifies Pass-2 encode done so next frame may start */
> +#define CMDQ_SYNC_TOKEN_VENC_EOF			977
> +
> +/* Notify normal CMDQ there are some secure task done
> + * MUST NOT CHANGE, this token sync with secure world
> + */
> +#define CMDQ_SYNC_SECURE_THR_EOF			980
> +#define CMDQ_SYNC_SECURE_THR_EOF_DBG			995
> +
> +/* CMDQ use sw token */
> +#define CMDQ_SYNC_TOKEN_USER_0				981
> +#define CMDQ_SYNC_TOKEN_USER_1				982
> +#define CMDQ_SYNC_TOKEN_POLL_MONITOR			983
> +#define CMDQ_SYNC_TOKEN_TPR_LOCK			984
> +
> +/* ISP sw token */
> +#define CMDQ_SYNC_TOKEN_MSS				985
> +#define CMDQ_SYNC_TOKEN_MSF				986
> +
> +/* GPR access tokens (for register backup)
> + * There are 15 32-bit GPR, 3 GPR form a set
> + * (64-bit for address, 32-bit for value)
> + * MUST NOT CHANGE, these tokens sync with MDP
> + */
> +#define CMDQ_SYNC_TOKEN_GPR_SET_0			987
> +#define CMDQ_SYNC_TOKEN_GPR_SET_1			988
> +#define CMDQ_SYNC_TOKEN_GPR_SET_2			989
> +#define CMDQ_SYNC_TOKEN_GPR_SET_3			990
> +#define CMDQ_SYNC_TOKEN_GPR_SET_4			991
> +
> +/* Resource lock event to control resource in GCE thread */
> +#define CMDQ_SYNC_RESOURCE_WROT0			992
> +#define CMDQ_SYNC_RESOURCE_WROT1			993
> +
> +/* Event for gpr timer, used in sleep and poll with timeout */
> +#define CMDQ_TOKEN_GPR_TIMER_R0				996
> +#define CMDQ_TOKEN_GPR_TIMER_R1				997
> +#define CMDQ_TOKEN_GPR_TIMER_R2				998
> +#define CMDQ_TOKEN_GPR_TIMER_R3				999
> +#define CMDQ_TOKEN_GPR_TIMER_R4				1000
> +#define CMDQ_TOKEN_GPR_TIMER_R5				1001
> +#define CMDQ_TOKEN_GPR_TIMER_R6				1002
> +#define CMDQ_TOKEN_GPR_TIMER_R7				1003
> +#define CMDQ_TOKEN_GPR_TIMER_R8				1004
> +#define CMDQ_TOKEN_GPR_TIMER_R9				1005
> +#define CMDQ_TOKEN_GPR_TIMER_R10			1006
> +#define CMDQ_TOKEN_GPR_TIMER_R11			1007
> +#define CMDQ_TOKEN_GPR_TIMER_R12			1008
> +#define CMDQ_TOKEN_GPR_TIMER_R13			1009
> +#define CMDQ_TOKEN_GPR_TIMER_R14			1010
> +#define CMDQ_TOKEN_GPR_TIMER_R15			1011
> +
> +/* defined in mtk-cmdq-mailbox.h */
> +/* #define CMDQ_EVENT_MAX					0x3ff */
> +
> +#endif

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
