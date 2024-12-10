Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8DFFE7717F
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2024 23:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eX3uPAI8VHVz7Q7IUlQ/mQkvSpMTHU0BJdfB3mau7Xw=; b=sBlJzDVlvfrVj3y1Xirwb1KULq
	2c7lsI4tHXoJeEDnLYM5+gnQdQm5fnVJlbXdy3XNVOYTFRxWdZo7QXNGMfqiTq9EhAr1/Cvo83uxD
	4Qq6j+hpyK8y4pEkK6oAkmRtEPLK9IT2TTucizJtkrkqXcFh11aMvybFzekN6JrZWMN/5IV3th67c
	MvC6YO+p0qpGG7PvuU1zkgMdm5oS+cEHshbpXs/OhFwikW7iv3dwlmYSBovVnJT2eIBNDMQJh73hn
	s59Pe3MmzTo5lGVHudXstsKgf6Hxl72V8X7PFdtJK83k8kxhNlEhSQN3id5v9ER/InYbDDIS9IkkL
	5ht9wotQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL9ES-0000000D5XT-1elq;
	Tue, 10 Dec 2024 23:01:32 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL9EP-0000000D5Wo-3Ngd
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Dec 2024 23:01:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9B339A403B8;
	Tue, 10 Dec 2024 22:59:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78966C4CED6;
	Tue, 10 Dec 2024 23:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733871688;
	bh=a54ebm90iRSy8tMv4x7Bs3m33w6WRuSwIQ32x1SCINg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hDSafgkhvXwDzu32v5BPAqsxyoT6unbvxG06jd8yikdsrK9zx0VBumT4s0F9t/mPe
	 dRR+0BBPfGs6ZAI/sXMrYsNv8xNk2+XSz5cIMROUMxsFzc0v+NBs4SObi57NGuOTjC
	 UjXgVTol+z6GbvwV+8x0cEGUZ8sF59P7upAZYZAhkqa5HVuu26YScUMSWMovHvUT4e
	 ULhSciN6MzqB3McOYG2CW13eWJZBvKbGR/0+9xLM3TUvecrbqWGZG25E9XsoW61PEc
	 zXiZAtjEnf91KsEhALQcBa+RWI1H+urFYNi/NkroSUAOaCoXDveTGtzQJ0Yoa0q8F9
	 ykUcmr7leIUKA==
Date: Tue, 10 Dec 2024 17:01:26 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: conor+dt@kernel.org, linux@weissschuh.net, nfraprado@collabora.com,
	linux-mediatek@lists.infradead.org, groeck@chromium.org,
	krzk+dt@kernel.org, matthias.bgg@gmail.com,
	chrome-platform@lists.linux.dev, lee@kernel.org,
	angelogioacchino.delregno@collabora.com, bleung@chromium.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: cros-ec: Remove
 google,cros-kbd-led-backlight
Message-ID: <173387168591.762034.8434485915273819545.robh@kernel.org>
References: <20241206031405.1711996-1-tzungbi@kernel.org>
 <20241206031405.1711996-3-tzungbi@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206031405.1711996-3-tzungbi@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_150129_906088_47FF2D04 
X-CRM114-Status: UNSURE (   7.81  )
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


On Fri, 06 Dec 2024 03:14:05 +0000, Tzung-Bi Shih wrote:
> After applying 4c03a44e2668 ("arm64: dts: mediatek: mt8195-cherry: Remove
> keyboard-backlight node"), there are no users for using the OF match.
> Instead, the device is added via drivers/mfd/cros_ec_dev.c by
> 970c3a6b7aa3 ("mfd: cros_ec: Register keyboard backlight subdevice").
> 
> Remove the DT bindings.
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
>  .../chrome/google,cros-kbd-led-backlight.yaml | 36 -------------------
>  .../bindings/mfd/google,cros-ec.yaml          |  3 --
>  2 files changed, 39 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/chrome/google,cros-kbd-led-backlight.yaml
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


