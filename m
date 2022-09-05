Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD62ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Sep 2022 17:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FeTX7oI7MbinrbgdMe/j5uW6nQMMHuSJ6IvQbjjgK6g=; b=S962y7ydfQNKQIJ703ElwTiaYa
	seDmypdAJj2Yp7phYOeISZFEbVnO6ckAwCksQDkhLMrkMSsjKegaHtSdUHaJTFHRNRDMQpN7/C+w2
	kcjKkSVR286jzf04a4YxBw4goDi/ntmpI9wwdLxW0g+hgtVdmVWblDi4dpVm/1rOOStnFkYagpbOK
	4Q1ZLG/pDJ2ZVX9z3mmbWSIX5dkgewlNKa1Qfq4kZIj2i424eXen38T0T9pAyPfSD9vgbKxf9UVRB
	MfZg4BtIszhXK9u/2ndmKeTse5l/GwLNwHqIEb3YXL0RlYq80krZBREoUN+LiZ94NMQLdetpvqZy8
	ZXMcZfHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVFvP-007aIy-MH; Mon, 05 Sep 2022 17:30:19 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVDry-005nd6-Df; Mon, 05 Sep 2022 15:18:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id EE473B811F3;
	Mon,  5 Sep 2022 15:18:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD902C433C1;
	Mon,  5 Sep 2022 15:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662391115;
	bh=OYPiTnXo7bb7hJwVSPWes/+Nq+zYOTrTHyss+h6VYo4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SDxfRg7k2JMjGFkMn8+/LTZSQNlWWnzMBv8TiM+aZG8WfpCklOb/zYAqZM4XE+fpY
	 rs2rNTcqypi/Ymx66IECFIq8P0LnEAeumaycw1PLF94hacP8yD68/JeeoptW5Lx5Vl
	 57nufRRk4GhwDzlKg7oQMkrAgFpjFa1ZtYo0fvLh0XnVE5uTfTSh5+kjy7DoDp/wOY
	 xqntjmtzikCy2OmKXCYmmlAohAO13PluvsZ8YxrWTYJey/1rAIgZG58iRjY3eGIGLB
	 1Fwo6+Ls6SieLxlyJ4ygC8DlLJX7pxvZm78wBH1qEClQCJdIiEF/JnguTag1WzkZLm
	 04sga6uQd9+uA==
Date: Mon, 5 Sep 2022 16:18:12 +0100
From: Lee Jones <lee@kernel.org>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: daniel.thompson@linaro.org, jingoohan1@gmail.com, pavel@ucw.cz,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com, sre@kernel.org, jic23@kernel.org,
	lars@metafoo.de, deller@gmx.de, broonie@kernel.org,
	mazziesaccount@gmail.com, andriy.shevchenko@linux.intel.com,
	chiaen_wu@richtek.com, alice_chen@richtek.com, cy_huang@richtek.com,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org, szunichen@gmail.com,
	andy.shevchenko@gmail.com, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v9 04/10] dt-bindings: backlight: Add MediaTek MT6370
 backlight
Message-ID: <YxYSDSlnOELL2mPF@google.com>
References: <20220830034042.9354-2-peterwu.pub@gmail.com>
 <20220830034042.9354-5-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220830034042.9354-5-peterwu.pub@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_081838_860536_590174BD 
X-CRM114-Status: GOOD (  10.45  )
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

On Tue, 30 Aug 2022, ChiaEn Wu wrote:

> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Add MT6370 backlight binding documentation.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> ---
>  .../leds/backlight/mediatek,mt6370-backlight.yaml  | 121 +++++++++++++++++++++
>  1 file changed, 121 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-backlight.yaml

Applied, thanks.

-- 
Lee Jones [李琼斯]

