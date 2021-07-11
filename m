Return-Path: <SRS0=zHGV=MD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06293C07E96
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Jul 2021 08:35:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7F0761249
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Jul 2021 08:35:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7F0761249
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UV7JenfO60I7Sv5MFHQvwux1LGy0MsM64BM1e3DA6Ns=; b=1UvIvc6PtpDDCL
	jDB9viMXiryRZs82/trxwczAAYAzhsRxO3ordFBpI9Pcq48P3vsjdhn6qKmFKfTN5vcAsLlkvDpuY
	kk3JfCPJqUOGG2HfRty9LTzcrHLLrxSCjQSPHHd49TBJhJfj8NzAXuuwHYJrFIf4vL4RPWjGDy8LG
	/L21lq8xun+2aMeieWZDpofvHfcUdLIYam/4Jf32UXamhRyf7y2fy8O/6sHz4lYhMhif/toa1YdYT
	iGAHuyVdBJ01YybvFoX3AxXOZhvwB3ULA6RRBwu0H9Z7dAKqi1YmjOHGn+tQNxFtU1imXwW+6srq5
	GmP0hxS2DX8m8JCOni+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2UvQ-004izr-83; Sun, 11 Jul 2021 08:34:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2UvN-004iym-7C; Sun, 11 Jul 2021 08:34:54 +0000
X-UUID: 328fb2f4e82443bb8b1c4a4d19848890-20210711
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=iEJdw0JyYUyniYoye3JWNvieJPx3fB4KYOOg4DQ+F4M=; 
 b=lOk4xUSh/as6K/L/wz/k/CSbenuIjRq5JLfC0Mx62sMvirx+QqunyMcqx1bQTOwUx5buHTFd3GZIBT0JO9oDjDKvm94B8m+Pwm1ggYXUMNn9GNqbnGr/Az4eBL54PnCRqUUr4UUFtvVKOCoqkvMmcSi1FvU+uTxuyZye1NCxFTk=;
X-UUID: 328fb2f4e82443bb8b1c4a4d19848890-20210711
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 753099135; Sun, 11 Jul 2021 01:34:48 -0700
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 11 Jul 2021 01:24:58 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sun, 11 Jul 2021 16:24:53 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 11 Jul 2021 16:24:52 +0800
Message-ID: <1625991892.22309.10.camel@mhfsdcap03>
Subject: Re: [PATCH 4/9] memory: mtk-smi: Rename smi_gen to smi_type
From: Yong Wu <yong.wu@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, "Joerg
 Roedel" <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy
 <robin.murphy@arm.com>, Tomasz Figa <tfiga@chromium.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux-foundation.org>, <youlin.pei@mediatek.com>,
 <anan.sun@mediatek.com>, <ming-fan.chen@mediatek.com>, <yi.kuo@mediatek.com>, 
 <anthony.huang@mediatek.com>
Date: Sun, 11 Jul 2021 16:24:52 +0800
In-Reply-To: <a3abe400-4172-4f62-1548-b78b9ec4c157@canonical.com>
References: <20210616114346.18812-1-yong.wu@mediatek.com>
 <20210616114346.18812-5-yong.wu@mediatek.com>
 <a3abe400-4172-4f62-1548-b78b9ec4c157@canonical.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: B01E0EC6D5C0AC2DAEDDFBE2800052CB3386659EA74D944E43EC036F416268192000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210711_013453_324310_25660DEE 
X-CRM114-Status: GOOD (  18.05  )
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

On Thu, 2021-07-08 at 11:34 +0200, Krzysztof Kozlowski wrote:
> On 16/06/2021 13:43, Yong Wu wrote:
> > This is a preparing patch for adding smi sub common.
> 
> Don't write "This patch". Use simple imperative:
> "Prepare for adding smi sub common."
> 
> https://elixir.bootlin.com/linux/v5.13/source/Documentation/process/submitting-patches.rst#L89

Thanks very much. I didn't notice this before.

>  
> > About the previou smi_gen, we have gen1/gen2 that stand for the generation
> > number for HW. I plan to add a new type(sub_common), then the "gen" is not
> > prober. this patch only change it to "type", No functional change.
> 
> Same.
> 
> > 
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > ---
> >  drivers/memory/mtk-smi.c | 24 ++++++++++++------------
> >  1 file changed, 12 insertions(+), 12 deletions(-)
> > 
> 
> Best regards,
> Krzysztof
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
