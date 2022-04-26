Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A67AFC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 00:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gKXz+tEALN1k1lf6b6Iii1dKvUsXq+PXFIDpawxF2t0=; b=YmGKfReun1+SZB
	a89l4NnPnqnACvq4QNdIZBsO1Td0NJMozH58wslIu2QDc3pYL2leiixwGZBaLLwHlysK2dCvIrqj+
	OVj7+OTYxdxoYRATUr+GtLWz5fmJvoqDk4ldp2abjQwvPlLEtHbY/rGuueaXMYEPRyAfZZ5zK2Ew0
	KBTL4n4rFWB6RwpLZD/Wn6eNKTj1TxtYteKUL1FDGe9t9xJABU920jZ1QMZUMWUrqodnERDyssokn
	omslX36dAtxFpKnUFzkK5AqtP0FRIkToXwl4MqTIy0aXmUc99RJYt5rRPYKAvy+W0doOr/M+gXv/R
	CzaiWHV6N4BWlyptd9Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nj8pM-00BpOR-25; Tue, 26 Apr 2022 00:13:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nj8ox-00Bp9r-BH; Tue, 26 Apr 2022 00:12:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E20206166E;
 Tue, 26 Apr 2022 00:12:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4552FC385A7;
 Tue, 26 Apr 2022 00:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650931966;
 bh=TC1cdKqN3SuRioLLjZZQcwVv5OWMAgilm0pRHb51HKI=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=FbIrq+bRbYyd2WMFJonUeySdWqcZKMtkdt7BKW6fC/LZ9Mi9lfGDtb8vEwwFZ6PV1
 vgHkzw2JQhRQSalvruCa+9QuIQcZyuqEr0n44gqKyhQ9y9O8idmciHKbQjcIvedU5p
 RdHFk9OW7OxmfC4gg2jxUlCEb2qE2gPfAIsG+iyY+7LaEUZGZ3xAouO36sqjJt+3XA
 1mRSShgO7emx0VVOgftLncH/CiI0ONZhCQocie46pnPq993UHsGR7tZ9kRB3ywiD4W
 R79uoD+rXRULJdYicYoRVCROkqUU6/k42VrYVX8DBUcaAOnDXigvb55XY18c6W6H58
 wMIHcCttgCxLA==
MIME-Version: 1.0
In-Reply-To: <20220409132251.31725-6-chun-jie.chen@mediatek.com>
References: <20220409132251.31725-1-chun-jie.chen@mediatek.com>
 <20220409132251.31725-6-chun-jie.chen@mediatek.com>
Subject: Re: [PATCH v5 05/15] clk: mediatek: Add MT8186 apmixedsys clock
 support
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Date: Mon, 25 Apr 2022 17:12:44 -0700
User-Agent: alot/0.10
Message-Id: <20220426001246.4552FC385A7@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_171247_499367_ACA35F0E 
X-CRM114-Status: UNSURE (   7.71  )
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

Quoting Chun-Jie Chen (2022-04-09 06:22:41)
> Add MT8186 apmixedsys clock controller which provides Plls
> generated from SoC.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
