Return-Path: <SRS0=z/aX=IX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4966AC433E2
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Mar 2021 07:20:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5D9261A1F
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Mar 2021 07:20:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5D9261A1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gnLrdVXIJjNaofUBxP1rEkRQ1abZlxjkDw/JhUpn0qI=; b=q2t4kQ9+O4+09GbASM+9OXkDW
	A5QSk6dxaC3PP/DLL1q4GwC7JTgwb7gDQX/myo/fjnixnSpRNDT0JoMq09gbpu/1S5rZuZTNh7Tej
	fkxrcO9lVs9TwKq1Eqg68B7K3EpGpalRyb/lpLMgzEl8r+svk2JaDrw/g7A8FxWPbxpoYdfiVlELb
	XjQrRlLfn8Z2wizbiGDYandi/oVSlQwEM0Q3Oo2QU12VHyXFtG/1wXYLF/62JoM2TW5+0bVBlFJwd
	4fs4gl0XKIi/gMtsSG+oc4ra7YYyA9gkYXDQgw3zKBxZVOoAZShoorfA8B7HL7wt6kz+CjcWB1Hqv
	fP5IKH9fA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPKHr-000mCv-M9; Thu, 25 Mar 2021 07:20:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPKHf-000mA6-8n; Thu, 25 Mar 2021 07:20:01 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DD0D561A1A;
 Thu, 25 Mar 2021 07:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616656792;
 bh=g243cFH6HzGVN9Dded6fTHsxRaAv/nLJsBc+qCK+vEE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tLmgKPGT4azqd8RHFMTFdwA0SXDBiGGWim2zVgc7YrjLvWzfyEEkvfsTQ51u/KMvK
 q+LXly0bmWdsbq/l7llE/xQxZSVgbqc5fX6zysFBRjIjm8SDqDFZS1qwLrakZh1E/v
 zt6e2m/n0poTuePcK25wbFUbjQzhwcJkPT/yPDfSwg3fnlJ9rFd3QdqcGuuKuFfrsS
 6ToHZrO3KzqSQDgpJzAtlvcsvI0J3gALkKoY/PZYY77PFuDaXjEUGAgoLMW0xPAbiy
 7VJKXmPQ6VL3FExDuJRLa5lB3UvdAGvYfSFiijUsfIxWFg+oYMN3XgMFbw7zMkj3zn
 oKXjxN3uRYnEA==
Date: Thu, 25 Mar 2021 12:49:48 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Jie Qiu <jie.qiu@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Cawa Cheng <cawa.cheng@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v5 02/13] dt-bindings: phy: mediatek: dsi-phy: modify
 compatible dependence
Message-ID: <YFw5lNeunVShUL9I@vkoul-mobl.Dlink>
References: <20210316092232.9806-1-chunfeng.yun@mediatek.com>
 <20210316092232.9806-2-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210316092232.9806-2-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_071959_675458_23C69C99 
X-CRM114-Status: UNSURE (   6.18  )
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

On 16-03-21, 17:22, Chunfeng Yun wrote:
> mt7623-mipi-tx is compatible to mt2701-mipi-tx, and use
> "mediatek,mt2701-mipi-tx" instead on MT7623, so modify
> the compatible items to make dependence clear.

Applied, thanks

-- 
~Vinod

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
