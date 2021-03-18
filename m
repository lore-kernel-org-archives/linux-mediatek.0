Return-Path: <SRS0=MDpP=IQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55617C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Mar 2021 06:08:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9ADF64F10
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Mar 2021 06:08:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9ADF64F10
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Efu0dNbK+aEYeU5cEsS7BHI5mop858eVfjf3GvpOaiw=; b=GSkXE+oGeTqdth5iSPtZPLhdU
	4P2LmhA0DN/ep5ND4JRaUaY+J7LEQJU4vRTHZhkg7t9inOPSkw1fI3lfdfgw54QOzEFLj9gg8s4jA
	cx+H+t2sZ/Wm8KAXVs5NqneClHNhRblY4tRCok/sTL3IG3gSH3hqc5ttv75hvGVBRFmA2ViFTS0jT
	LSOR9J7nQH3gXWTpfXYWTjo/vPRmsOGZrAdhhZ3wA621xMWu7wxdbMndAHw/dCF+psc5t++Ac1oUX
	bxzdfpFs2kP6HxIP2APo/wh57atBdKl0oViN2/5ldUSNxpIMcbIoA4gurX7Okzfd73/SQD3kdwWYF
	J+TkoB4Tg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMlp9-004aK9-0r; Thu, 18 Mar 2021 06:07:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMlow-004aGG-5H
 for linux-mediatek@lists.infradead.org; Thu, 18 Mar 2021 06:07:49 +0000
X-UUID: d99c983d4bd84a0da48d9dacca2ffdf3-20210317
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=rftU99Ali67tHD8eVx+XQvfBCfNlwFs+nmcORROhMVA=; 
 b=oVb20Qdeu9HcxIdVG9FyWv8x5Ix4ZrdgGGrQU2ZMEmU6gSHP4wZ4yEulE4jG/yP+6lCPb5yRLLNV1+ECqk55x5tIVFALNTlTiwPQwslAq17rxRrsB1LZ3sR2Hb7EzPqxS7VEexgaXZvJuk7oYRpm6s7hBBVvWXlW3jsblpOu+ps=;
X-UUID: d99c983d4bd84a0da48d9dacca2ffdf3-20210317
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 148703651; Wed, 17 Mar 2021 22:07:42 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 17 Mar 2021 23:07:41 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 18 Mar 2021 14:07:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 18 Mar 2021 14:07:39 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: <tzungbi@google.com>
CC: <bjorn.andersson@linaro.org>, <linux-mediatek@lists.infradead.org>,
 <linux-remoteproc@vger.kernel.org>, <matthias.bgg@gmail.com>,
 <ohad@wizery.com>, <tinghan.shen@mediatek.com>
Subject: Re: [PATCH v2] remoteproc/mediatek: set to DEVAPC domain 3 for MT8192
 SCP
Date: Thu, 18 Mar 2021 14:07:11 +0800
Message-ID: <20210318060711.31740-1-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.15.GIT
In-Reply-To: <20210318012416.2816574-1-tzungbi@google.com>
References: <20210318012416.2816574-1-tzungbi@google.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_060746_962068_29D0D799 
X-CRM114-Status: UNSURE (   7.73  )
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

> DEVAPC (device access permission control) is a MPU (memory protection
> unit) in MT8192.
>
> To restrict SCP accesses to a specific memory range, sets SCP to DEVAPC
> domain 3.  ATF (Arm trusted firmware) should setup memory range for the
> domain.
>
> Co-developed-by: Tinghan Shen <tinghan.shen@mediatek.com>
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>

Hi,

we want to pull this patch back because we have another thought on how to reach our purpose.
thanks for your review.


Best regards,
TingHan
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
