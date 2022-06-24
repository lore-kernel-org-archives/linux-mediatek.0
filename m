Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC4DFC43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jun 2022 16:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CQ76PL2xXAQZbzZfyoRLAot45Qj0WVVuwSnDpYxTN7k=; b=V/hdzbUohCkG5p3LqqvoTH3FO2
	d8yTa8dBZF1MzPntHZ3662nnjkoG0GPAhmRukp/6xCjJHcpTsNsLbS7YkswvASmT8y5HUOQ8Sp9Hx
	60fA0TPH8bcxgHFqpzJWpmn/3OrJaybq6OpRRp5NZQnLiPRQql4quGU5Y0RILc8xkoqD6AEODWOy4
	0LODeU/u4a9uoSUD691NGQ6K2Coj4kZV9aGBEDCYbMHRuri4sSET7lGR7X5xK8i6C3JEX3jhX66Mv
	09LL1sRdgyIFb9yUFgMMw2StrkJmR97MNpvUUA0/KyzOVPRP9VmJOAJHZ0Y/FqEF90RNjmxqQ2MXB
	CCbLQndw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4lt0-002yxB-1m; Fri, 24 Jun 2022 16:10:22 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4lsn-002ytA-NU; Fri, 24 Jun 2022 16:10:11 +0000
Received: from notapiano (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9EB4D6601808;
	Fri, 24 Jun 2022 17:10:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656087008;
	bh=v78/bL0UJy6F1Vz08tiEF9fcaRXbAmDnh/8P2xPvWJs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NsVJ/18bFgfDZ+Ulx/LzgvhWJwcSMn/5RHO1wHnSAwg8rmIv+qoNCKhVFDJdut0uk
	 FRgU+ycRb4hblG+VkTxn5GIDwajXZrv8GSKigwh2alo337TZIjq4oVF9pjb1/JF/pz
	 O+SN+Ec7O/Z1dvpwhIgWTEKepbbdeWVAIDO1f77GzChIKMtCybMln+bT+AYRRZ9vA3
	 8JAPKQOz8kJfSnP8D1DuDymO7DRM2nYuxqOJOgEN5vvLhmbCOq/SGQlDetz3T8UiKn
	 5SY7rWcqD2j4fcSVQPP/PapmJIRIlxtYGhag74hSEPiLN9lQl38HtAeQziY2MktYBa
	 LpmFCQwDSas8Q==
Date: Fri, 24 Jun 2022 12:10:03 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Guodong Liu <guodong.liu@mediatek.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2 5/5] pinctrl: mediatek: fix the pinconf definition of
 some GPIO pins
Message-ID: <20220624161003.pzq2ap7frsh5zrbu@notapiano>
References: <20220624133700.15487-1-guodong.liu@mediatek.com>
 <20220624133700.15487-6-guodong.liu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220624133700.15487-6-guodong.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_091009_936744_FD44DDB5 
X-CRM114-Status: UNSURE (   7.17  )
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

On Fri, Jun 24, 2022 at 09:37:00PM +0800, Guodong Liu wrote:
> Remove pin definitions that do not support the R0 & R1 pinconfig property.
> 
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

