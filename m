Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9247FC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Feb 2022 14:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w+cftkGbyoznjRZ70FXIRBDT9qhUo2QuvfqutAX+5AM=; b=vMDBOQWJDUSifH
	mfg83LJU/BxETcKwS+O13nTG0wJ3k6JmlBBaeZCjEdY6mkr8FCKVUvbhzu53FRYb3Uj9XTjxhjg5u
	eQcFrTF2pw/LcSbKKZ/wQbdSWU/rx6xbLQjb99/tb9UO3amJh73cxd6fPqIaInNR3p20/SF7FvY7n
	ACxZelHqVulBqpYZafhbD25ebJqNgwzmhNDsU3DVSFJg/3I0/tRUgltdLdF3cNqwDtyTTFIITXsRx
	LA5QTpgOT3lM/7fDg+oV0x28iT/60Oqj3Rd+crPfMwxT6k3Ma2S1dXMrka5ieVEHD1KXcuSKjYsSO
	BHMAieeLJjO0g5FixBCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFGcV-00FgoZ-U4; Wed, 02 Feb 2022 14:28:27 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFGbO-00FgJp-C5; Wed, 02 Feb 2022 14:27:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 167AAB83103;
 Wed,  2 Feb 2022 14:27:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28731C340EB;
 Wed,  2 Feb 2022 14:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643812035;
 bh=Py5hbDI7QFg9kVgjWXWbp00X8G2g7PgLmwuqyEPZHcE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y6WNv3ThAYd/x/EDjfwGovlFMA408t9XdMxIed4ZEGXGGpud+xxJI10oeC77BeuxT
 a8D20GPdAXdKobH+GNm/wjm4/k84/hKbkkVpcr/8Ain/mfz3ouSWBV/HxVZpE3aTDh
 8oTVBs/oGBCEGCGFlwtdEbxD2NsOsDGuRcNMDL38Y0IoqkriqecZJrcpI7TO7OCcu0
 BfKet0eHIx60TX4k7cyj770tBbY09hCqcDa1Xh5eeE0wTqxiYyxAjUG++Ios4P0O0f
 PRf6TuUm6Qf5Eq9CHvgVAI4MlGgFRGGs81AWgSF1iDDxccoxLJaxdZw+bBui1IESoC
 76Phn4iNqZyiA==
Date: Wed, 2 Feb 2022 19:57:12 +0530
From: Vinod Koul <vkoul@kernel.org>
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, hsinyi@chromium.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v3 5/7] dt-bindings: phy: Add compatible for Mediatek
 MT8186
Message-ID: <YfqUwO16KxmBE7vP@matsya>
References: <20220128062050.23978-1-allen-kh.cheng@mediatek.com>
 <20220128062050.23978-6-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220128062050.23978-6-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_062718_597318_F11500C5 
X-CRM114-Status: UNSURE (   9.95  )
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

On 28-01-22, 14:20, allen-kh.cheng wrote:
> From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> 
> This commit adds dt-binding documentation of T-Phy for Mediatek MT8186 SoC
> Platform.

Applied, thanks

-- 
~Vinod

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
