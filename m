Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9172BC38142
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 08:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5LVbd7jMGTqPofcbHc2TSxV+zHK32m9KszR9jNPn+f0=; b=vFIXYKk4gfRhN/9Z+GpF51k+Hb
	wRoXJs92QNH/vlNRfIfoi8rCEpT7KoDXYQxVfEaePB9f/NYd8YmI+smB0WR42W/EMeKvnVipIzoWI
	cIlk7psXyWxT0FyOHx+3Nll8JGl15k1cPqro4IDuMT9m2NfZDR1yPktZ4FScObisadqywxMIPonAi
	oUDBNzr0tYuwHzQPrJzw2wlMLVWlVoShQ8fRMrhtN4PWOFzQhfZ5q5yi4BAmwsiWpnKzBtIsSKopz
	rxISHxXFGB9PHhVZUG768WwOOyetVXOlIJIXG+lFsMj82rcaMVQetcPy45mVXSufFX1atAuFhK26V
	wd6SVIMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN8nN-00AsEA-O6; Wed, 01 Feb 2023 08:48:45 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN8nD-00AsAN-VD; Wed, 01 Feb 2023 08:48:37 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id CCDF1126A;
	Wed,  1 Feb 2023 09:48:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1675241308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5LVbd7jMGTqPofcbHc2TSxV+zHK32m9KszR9jNPn+f0=;
	b=IEe4l47u14uRCeFaJXl+EM8cQsUA0cu2Vny9UkvZ+jDGbBPGKzpJ5NOLJa8ellGSkAryB4
	+XF1PYzyYHMc6V19ZfNi4sMaDV9NDoIDDfKLEjgU0nf+yiqkMrF2BKQkX91jXa4B1HH0sh
	TXMwXVB/exdMbD0TEjqC6cNbzU9V1hI4w1y/jd169DsfglVKU7sZDlCY45bxm5eeC6ZteV
	QY9dZEulLjmLZlIHcF3ta/6m7etnjvSvBSusnbWJYBfIIbFrE5ZV7Vb3a9aHRWTOmxV924
	R3rtB9tUIY9RioDFMGqEs+0MKeYXGX9Qh+RE4u46lK4Cd2caU0AKkSRfORKA1Q==
From: Michael Walle <michael@walle.cc>
To: zajec5@gmail.com
Cc: devicetree@vger.kernel.org,
	hayashi.kunihiko@socionext.com,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com,
	mhiramat@kernel.org,
	rafal@milecki.pl,
	robh+dt@kernel.org,
	srinivas.kandagatla@linaro.org,
	Michael Walle <michael@walle.cc>
Subject: Re: [PATCH 3/4] nvmem: mtk-efuse: replace driver with a generic MMIO one
Date: Wed,  1 Feb 2023 09:48:21 +0100
Message-Id: <20230201084821.1719839-1-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230201064717.18410-4-zajec5@gmail.com>
References: <20230201064717.18410-4-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_004836_211351_88255226 
X-CRM114-Status: GOOD (  12.27  )
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

> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Mediatek EFUSE uses a simple MMIO that can be handled with a generic
> driver. Replace this driver to avoid code duplication.

I don't think this is the correct approach. You'll restrict that driver
to being read-only. I admit that right now, it's read only, but it can
be extended to also support efuse writing. With this changes, it's not
possible.

> static const struct of_device_id mmio_nvmem_of_match_table[] = {
> 	{ .compatible = "mmio-nvmem", },
>+	/* Custom bindings that were introduced before the mmio one */
>+	{ .compatible = "mediatek,mt8173-efuse", },
>+	{ .compatible = "mediatek,efuse", },

Why do you assume that all mediatek efuses will be the same? This should
rather be something like (in the dts/binding):

compatible = "mediatek,mt8173-efuse", "mmio-nvmem";

So if there is no driver for the particular efuse, it will fall back to the
generic one.

-michael

