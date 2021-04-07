Return-Path: <SRS0=xJt/=JE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3BC5C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Apr 2021 09:06:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E7FC61363
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Apr 2021 09:06:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E7FC61363
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VgJ3OzCYvzPvvmE0T62AgBHRDWMJLz+CgyZRIlQi2I0=; b=oJ25Wgvm35B9MQQRlpBpECeNq
	FVMU6/KLlD9PKub+vYpMAf1ti1smlnZRWheYL6RXuEywJcX1rZaLqtThciCK3Rf4eIT/UGqQjt4Z5
	swbvt0D2xEspFJKniuXr9mfd+lyJqZTOCcm2pZrPOBUUEb06wYHAtcqotbYsRJdbh29cSPZX1y/sI
	nnJ3SQW3dJQOwqYJ9yFyIcSYNN5pKSAZ0osGVQeqEa0hFUtZavJqIETmsFyjjI2jTN3s69JZgR5g9
	HKeqUgwgoWhBYoRac0ziGYFrBPxnPUdGsp7JW658Z8SW73j0lD5fJ7eALyKA4JrvXfcDHiytE7peh
	jBCpAFtOg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lU48Z-004Xw1-Mf; Wed, 07 Apr 2021 09:06:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lU48K-004XuB-70; Wed, 07 Apr 2021 09:05:59 +0000
X-UUID: d0290ac210ee41e684f05c51923542a1-20210407
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=oqD57DlmW9FeiutinF7pItU5KlzzK5pXIF6q2cyJPd0=; 
 b=ZiBg/7RQwuC4IAEFnYWIr32l8UqkknhbEkORIBR7QfEySLL90vjpHAG5R83jEhPrbPB3EvNs40ZTpAGGI4F4kscya2nLMp8IgqracBGFCYu+xb1AFFSoIidFvUpPOyHZ5GYXK1rsEIDeTRWxqjFzKZM7RfHc+qLMISHKtl/czk0=;
X-UUID: d0290ac210ee41e684f05c51923542a1-20210407
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <mason.zhang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1631130033; Wed, 07 Apr 2021 02:05:49 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 7 Apr 2021 01:59:23 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 7 Apr 2021 16:59:17 +0800
Received: from [10.15.20.246] (10.15.20.246) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 7 Apr 2021 16:59:17 +0800
Message-ID: <1617785396.21900.5.camel@mbjsdccf07>
Subject: Re: [PATCH 1/2] arm64: dts: mediatek: add MT6779 spi master dts node
From: Mason Zhang <mason.zhang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
CC: Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <hanks.chen@mediatek.com>,
 <wsd_upstream@mediatek.com>
Date: Wed, 7 Apr 2021 16:49:56 +0800
In-Reply-To: <d3666864-cb46-755c-0d0d-d05ac9af0379@gmail.com>
References: <20210226105918.3057-1-Mason.Zhang@mediatek.com>
 <d3666864-cb46-755c-0d0d-d05ac9af0379@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 685E9AA9F582A0743CC24CDB68AF885E381088F60B605229656993D54DBF98E12000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_100556_823709_C5A70B3C 
X-CRM114-Status: GOOD (  10.57  )
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

On Mon, 2021-03-29 at 17:50 +0200, Matthias Brugger wrote:

> Please also update binding description accordingling and add as another patch. I
> wasn't able to find a 2/2 neither. I foudn v1 2/2 which on a quick look seemed
> the same as this patch.

Dear Matthias:

patch 2/2 in this link and this patch has been merged:
https://patchwork.kernel.org/project/linux-mediatek/patch/20210226110109.30500-1-Mason.Zhang@mediatek.com/

so, Please gentle ping on patch 1/2. Thank you~

Thanks
Mason
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
