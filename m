Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D13BECAAA1
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 08:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+VzMpAhkDeuqCaOFZo9E99GwTzm37KqLKnhL2XdlWf8=; b=CEtGzmeFnhehzftRIcCP5cXdpu
	ufiZ0FphzKT5baxYXft4OE1vF/uY7ApmjSf7KqwkD7zgBypW6wqJIelphaQOWMRWNqTXlScXTwQxn
	+FWhq+w+okOVvXuABMkKpH34Jld+LxhzRp7WS8Yjx2TuJcbocw41I0E4KdwUINYM2rWsZXpJnLHE+
	uyD45+9gqyY3vxh+GkJ8F5mdwj8WZ9B3JFHhdBxoYIcvq5uPUikT8bsDraGMK+k2ikebeGD46MI9D
	alU3iFOAy8ByBkS8hIxrootv1v51ROxBOpbqUWpxnHoDuRQLesgTbAzLz7LcxeV62EzEXaLAjax9l
	xImmG8KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYkTo-004DHL-4E; Thu, 15 Sep 2022 08:44:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYkTk-004DFg-1g; Thu, 15 Sep 2022 08:44:14 +0000
X-UUID: 52bbf91b5697419e95a0286e73c26f94-20220915
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=+VzMpAhkDeuqCaOFZo9E99GwTzm37KqLKnhL2XdlWf8=;
	b=GxL0aYkDjZMLA7fhW6vIZnmZ96hSg1AnyFlHFe/cqKbCb8k/VSrAITYg10ZEyRGL8eugIwvCuVeaO452YJwCaVtTNEqo0f8/y5SfyHxqNqEN86nyD7bX5f5/y0axO14ZwNn/ALgEmqvT+qTSyFge8hfAVXgwDLN/v0IrDqiB0V4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:f7c1b791-08a8-4278-ac95-437f64064df5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:2662c05d-5ed4-4e28-8b00-66ed9f042fbd,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 52bbf91b5697419e95a0286e73c26f94-20220915
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1492146883; Thu, 15 Sep 2022 01:44:07 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 15 Sep 2022 16:33:32 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 15 Sep 2022 16:33:32 +0800
Message-ID: <cc8dc51e9b0815843ef11957903f4867274ce63b.camel@mediatek.com>
Subject: Re: [PATCH 4/4] arm64: dts: mediatek: cherry: Add edptx and dptx
 support
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>
CC: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 15 Sep 2022 16:33:32 +0800
In-Reply-To: <9e0bc249-73cf-90d8-02d4-e9bdf8f34056@collabora.com>
References: <20220915075849.1920-1-rex-bc.chen@mediatek.com>
	 <20220915075849.1920-5-rex-bc.chen@mediatek.com>
	 <9e0bc249-73cf-90d8-02d4-e9bdf8f34056@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_014412_139617_67F04F19 
X-CRM114-Status: GOOD (  10.86  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2022-09-15 at 16:13 +0800, AngeloGioacchino Del Regno wrote:
> Il 15/09/22 09:58, Bo-Chen Chen ha scritto:
> > - Add pinctrl for edptx and dptx.
> > - Add port for edptx and dptx.
> > 
> 
> The commit description is not great: explain why this board needs
> eDP/DP
> (so, explain that eDP is connected to internal panel, DP for external
> display)
> 
> Thanks,
> Angelo
> 

Hello Angelo,

OK, I will improve the commit message in next version.

BRs,
Bo-Chen

> > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> 
> 


