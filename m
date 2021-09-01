Return-Path: <SRS0=BCEy=NX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8755BC432BE
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 11:01:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50B706056B
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 11:01:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 50B706056B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fF1imWHi/myh9VxT2rWxlIM0QjQ6hy8yGTMyDUk/qiM=; b=3GGyUElqazVquA
	kj8v/wzYXb5xnmhK50bOcP9XRK79k0oQfBjShdgxu6kl6tfxBhz24fPxJxdnbyMCWCaTWe6zOLyWS
	MlpnK6Vo4TpfrgGxpGWATyJvXDsNXRClB2/0dhgLTG074qZ4JJK0DzWv29+FPSh1YPdIkk50WAozt
	P5Hp4yxwQ8TfWCSJZFIg2U0uTNLfX64FCmcWkTaGF9m8OzKyD/ZOwCSGRG+04xNVY+IPPj78ZqvYK
	qv/uVEcu6wDdQYYSYqZZra563/Oqb5ygBJTue3vmJLdMay5NByvgPqHNWisWm6a48vZD3i8dvNc3N
	MG8rIyaSBdEZRmtQAS4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLNzb-005PK7-HL; Wed, 01 Sep 2021 11:01:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLMcf-004upr-64; Wed, 01 Sep 2021 09:33:35 +0000
X-UUID: 02b0c9602f294f8e997af569d52d3e52-20210901
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=qAFr462PAO/0XoeV1XxQaBZ1QKjkdT0RHzO2jPPAGlk=; 
 b=PGQ6b3RaYPZy9CNt7cY9TspreIWRjwuwSdTqmPAcYsix6zhxVhjctjH8BG3tTVtbIeBjjROYyR8cjkejlL+JcA1Crrr+jn6Wb0Bfg7o1h4kcJkNgcXd7rw/1vEkDDXKAAbTNva+6+KbdBlndVU9EHc3DV34EgE3VvCTQ9tS4Eng=;
X-UUID: 02b0c9602f294f8e997af569d52d3e52-20210901
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 281165053; Wed, 01 Sep 2021 02:33:29 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Sep 2021 02:33:27 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Sep 2021 17:33:26 +0800
Received: from [10.17.3.153] (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 1 Sep 2021 17:33:25 +0800
Message-ID: <1630488805.11251.6.camel@mhfsdcap03>
Subject: Re: [PATCH v6 5/7] i2c: mediatek: Add OFFSET_EXT_CONF setting back
From: Qii Wang <qii.wang@mediatek.com>
To: Kewei Xu <kewei.xu@mediatek.com>
CC: <wsa@the-dreams.de>, <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
 <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <leilk.liu@mediatek.com>, <liguo.zhang@mediatek.com>,
 <caiyu.chen@mediatek.com>, <ot_daolong.zhu@mediatek.com>,
 <yuhan.wei@mediatek.com>
Date: Wed, 1 Sep 2021 17:33:25 +0800
In-Reply-To: <1630147859-17031-6-git-send-email-kewei.xu@mediatek.com>
References: <1630147859-17031-1-git-send-email-kewei.xu@mediatek.com>
 <1630147859-17031-6-git-send-email-kewei.xu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_023333_299040_A2CA6EDA 
X-CRM114-Status: GOOD (  10.95  )
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

On Sat, 2021-08-28 at 18:50 +0800, Kewei Xu wrote:
> In the commit be5ce0e97cc7 ("i2c: mediatek: Add i2c ac-timing adjust
> support"), we miss setting OFFSET_EXT_CONF register if
> i2c->dev_comp->timing_adjust is false, now add it back.
> 
> Fixes: be5ce0e97cc7 ("i2c: mediatek: Add i2c ac-timing adjust support")
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
> ---
>  drivers/i2c/busses/i2c-mt65xx.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 

Reviewed-by: Qii Wang <qii.wang@mediatek.com>
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
