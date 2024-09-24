Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F427CF9C6B
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Sep 2024 09:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+VF4SCo1JxZfWO/f2o983veyQmrwviFACmSU84Ibjxw=; b=2ssgsLXxmoftl25iuc2VI1IHCI
	vFl1QvPsex6j7NMZZxP5YvRiH6bXT8HRGox87Y5Ky3ViNj3Ty5KHuMuHx46lT+7pVSqlQhe8Xx5ke
	GnLvyLZwgFWxlRflzDUGTyESQzPItK5sdxOtY5CJf1eAk+vMlQq8B3MHoXMvSmvYzjvlPzx6DjBsu
	SPzdYPhqJJVtqIWrI9zXHFVhAyS4RVMQPfuchOJKYIXakdY2ZDHlGTHnUUxfFZKe0PYTJxNhpjNdn
	aUwF1Bf/HWD/jGlXG3AK02PaFzggmnF8ATTq6aUblHpuJnyrDP1gi/Dy3YsQXqBZuV3agOcubDiJV
	UJJoBkug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1st1bf-00000001kja-2ehw;
	Tue, 24 Sep 2024 09:13:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1st1ZV-00000001k9n-3cSR;
	Tue, 24 Sep 2024 09:11:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2E2BC5C5B99;
	Tue, 24 Sep 2024 09:10:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C93DC4CEC4;
	Tue, 24 Sep 2024 09:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727169060;
	bh=sXMMD2yX79PYZrB+sJMUAHiomRdmGg07qqsS7xZ1bUI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mzhVeyxGkxWspN6515ahE38RxEshnjolvVTBkPBSXX8/oebyfBm/Vb5Ctut+/pnnk
	 7zqyrqiZSK2+3nPvw7YCkCI1qUhJo7Udah+cT67nZjh7LyyJ5nHzweMu2F9HHnrBBw
	 x8UvM4wUHNcyYNXb45sR+wukmAjgZ/ejBo/ppSLEv9C/PcoNSQG2JmevzVfkz16A8+
	 +Ha6ePPjCAULdJFKfRMyHRxn8sZGZWCHowAk12soo5frE33orKGMxesuXLa+1Of68P
	 SiR8mR3eNoOjUtq0bDHwMyQBoqU+XNOsZqMQzPhznTw4sNKy01CUWRovLQS1+KKs8q
	 Z1uhuiUnJRx4g==
Date: Tue, 24 Sep 2024 11:10:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rohit Agarwal <rohiagar@chromium.org>
Cc: chunkuang.hu@kernel.org, krzk+dt@kernel.org, ck.hu@mediatek.com, 
	robh@kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: display: mediatek: dpi: Add power
 domain for MT8195 DP_INTF
Message-ID: <xtugchpbl6ad73v4cthrgv4brn7ochy5rp2iipmkguhwdjo4d7@aognbiq4wcet>
References: <20240919112152.2829765-1-rohiagar@chromium.org>
 <20240919112152.2829765-3-rohiagar@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240919112152.2829765-3-rohiagar@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_021102_019277_33A06E1E 
X-CRM114-Status: UNSURE (   7.51  )
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

On Thu, Sep 19, 2024 at 11:21:52AM +0000, Rohit Agarwal wrote:
> Add power domain binding for MT8195 DP_INTF that resolves the following
> error and many more similar ones:

Binding is already there. You do not add anything new here. Please
describe what exactly you are doing in terms of hardware? Do you have
power domains or not?

> 
> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: dp-intf@1c113000:
> power-domains: False schema does not allow [[55, 18]]

Best regards,
Krzysztof


