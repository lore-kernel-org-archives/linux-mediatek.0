Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E66EC32772
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Aug 2022 21:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zG4lS5LjP1/fO4o6pKJ0sidblN+5kQdsJ47iVHa2SMc=; b=MvSkegJprOXE/qT1dM1jLaRQWz
	tQzu5W5/VwxHtZ8DW8E9GYCnx6ouqNJgkom3SqUiD27STOuVq9E3mvLwMaGD5+qiz2tcFRfNzbsBh
	QNNOtY9uLY77UyTZPTz1sxh72C3EHwao/lehd4R1yJqU3NuMbSNhf0debUNJvnfVdRmFgLTgaAKpa
	Fg3CKAFiYgqtvTfn4z7w+XnuO1CkmXCVPQ8LsyffQD2dTUC2t+5AyOvdsO2422CBR8VTQcd3KBtW1
	7U7KHuTteySDc2AJtNtTzpSflK26AUxw5AGEMSoeF4XJNU8p8LKtV46VRSnGagaMysweodQ2kXgBC
	fvQg011A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQbBL-008mFn-UB; Tue, 23 Aug 2022 21:11:31 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQbBB-008mDt-4u; Tue, 23 Aug 2022 21:11:22 +0000
Received: from notapiano (unknown [194.36.25.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B87756601E70;
	Tue, 23 Aug 2022 22:11:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1661289079;
	bh=lLnMaZZflBxCYdoKWtTlOD8pDUrS+qFNIuEnJudAl7I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fKGcXcLUGm9OpaNnHVYXblbNVLHKqpXKQ4HYpuQOYiQhe0zZfuM7yBz78B6kMpuva
	 MEyrhO/RnO3E87SVhpJhHqd5qLt7LTo69EDkRNFLKg6Nb3P3zl5Xu+U0LgradLoWsf
	 sk+6X0Ol+vtT4jnHKjNfAHOWS75Le0aJLNrJrKVYdWljAUKUqH6FPiMywHlTok4HW7
	 0YpUUdD14TaearV9knf09rFY7fqbdO+Zf8zBk4Z+LJZbFaN/i3NictTM7hFyRMZA8s
	 /nfXRBtbj9odaeR+mq4KY1vUvd/dC8uSUDWZXPLHrgwI1VTpLYzy05Pit0aMifhnYU
	 tr5Div+4yA/tg==
Date: Tue, 23 Aug 2022 17:11:11 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Hui Liu <hui.liu@mediatek.com>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, wenst@google.com,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	jianguo.zhang@mediatek.com, zhiyong.tao@mediatek.com,
	sean.wang@mediatek.com, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/2] pinctrl: mediatek: add mt8188 driver
Message-ID: <20220823211111.k2ve5yceie7knyi7@notapiano>
References: <20220818075012.20880-1-hui.liu@mediatek.com>
 <20220818075012.20880-3-hui.liu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220818075012.20880-3-hui.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_141121_352670_750EBEC6 
X-CRM114-Status: UNSURE (   7.39  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Aug 18, 2022 at 03:50:12PM +0800, Hui Liu wrote:
> From: "Hui.Liu" <hui.liu@mediatek.com>
> 
> Add pinctrl driver support for MediaTek SoC mt8188.
> 
> Signed-off-by: Hui.Liu <hui.liu@mediatek.com>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

