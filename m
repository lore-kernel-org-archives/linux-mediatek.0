Return-Path: <SRS0=p/XJ=EW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED4E1C63697
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 07:19:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 709BF2224F
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 07:19:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LWixBGre";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="nkKq7KYV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 709BF2224F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jtSxFxis1xRn+J5ut8UYjzEUNlPUOvH2VwkLG9i8fb4=; b=LWixBGreuxfLwlP/R9+wJtDEb
	edwEwI+5zawZhNWSCztuFj90jb8MsHRjhPe1xri0f8It/s0PU5CYAuKM50NI2CYu3DviIlBFzcOM4
	g7luIIAcuS6ek+ceCgTCwxMswyygDw8Q/ogC5MZduDLlgUqD9YqY5Ii0vSPUAbY1jkBN5oxDQZKLP
	uLBg+f5Ma+GdlzWMlOWTd/Q2bxFLFDH6V5+f4Pdcm7UBLsYYpt0kycI+fCkWE8NoZzCsq2mfa5PW/
	HLzOYbE068FT27PGO7j+7MXY6IE2PV+iWG+mvWv9LSjW+wJbX7Sz+RbNhMh0+0CW1tMYGIx5FiQ5p
	OwDt+y2nQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keYnj-0002G5-3U; Mon, 16 Nov 2020 07:19:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keYne-0002EZ-3e; Mon, 16 Nov 2020 07:19:43 +0000
Received: from localhost (unknown [122.171.203.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2E43A22265;
 Mon, 16 Nov 2020 07:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605511180;
 bh=rytT6E17HX9IEiUhV5t496BhQCdrbGSDo55kSLDvdl8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nkKq7KYVb3CoBjpS6MSxTdmXraPwlKNz5jz3UCEK7SYitEBPEJch0zO06r4vpp/5n
 +e+fq8H12gm6BRGhPvQa3j2pCiU3qEgz12ryJLTmzDv0RqrsYm7GSSqSctDSw8zkom
 XFWXjrX3+zZEl+X9Y4sXIArRZFYkqkB1gQNia6kc=
Date: Mon, 16 Nov 2020 12:49:35 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v2 01/17] phy: allwinner: convert to
 devm_platform_ioremap_resource(_byname)
Message-ID: <20201116071935.GE7499@vkoul-mobl>
References: <1604642930-29019-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1604642930-29019-1-git-send-email-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_021942_242899_121F570C 
X-CRM114-Status: UNSURE (   9.12  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Ondrej Jirman <megous@megous.com>, Peter Chen <peter.chen@nxp.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Anil Varughese <aniljoy@cadence.com>,
 Wei Yongjun <weiyongjun1@huawei.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Fabio Estevam <festevam@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Kevin Hilman <khilman@baylibre.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Chen-Yu Tsai <wens@csie.org>, bcm-kernel-feedback-list@broadcom.com,
 NXP Linux Team <linux-imx@nxp.com>, Icenowy Zheng <icenowy@aosc.io>,
 Bharat Gooty <bharat.gooty@broadcom.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Yue Wang <yue.wang@amlogic.com>,
 Lubomir Rintel <lkundrak@v3.sk>, Remi Pommarel <repk@triplefau.lt>,
 linux-mediatek@lists.infradead.org,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>,
 Hanjie Lin <hanjie.lin@amlogic.com>, Ma Feng <mafeng.ma@huawei.com>,
 Scott Branden <sbranden@broadcom.com>, Randy Dunlap <rdunlap@infradead.org>,
 Jyri Sarha <jsarha@ti.com>, linux-kernel@vger.kernel.org,
 Sanket Parmar <sparmar@cadence.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Joe Perches <joe@perches.com>,
 Colin Ian King <colin.king@canonical.com>, Shawn Guo <shawnguo@kernel.org>,
 Li Jun <jun.li@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 06-11-20, 14:08, Chunfeng Yun wrote:
> Use devm_platform_ioremap_resource(_byname) to simplify code

Applied all, thanks

-- 
~Vinod

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
