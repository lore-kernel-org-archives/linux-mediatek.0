Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A5BEC4345F
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Apr 2024 16:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=okeAvFfUEaK896RIWOik8lHqxHZXxstaNcHrNypDUOY=; b=D1hQRvVEAG/da3DS7REHbiH9ND
	nnYaZd3DxEDpMzjRhdCH9kO0lVOUmX/Q9gvpPgURHy13WiMS7gOI8ru5lCxz3E+RNUBCqJnLuBU2w
	tXZuweHh80z9JCBkrBloIRRGKsiiaZG9ANpA7nhczw9HeQKR0NnioaC0vcA75T4pL2P/UBNJiuMUy
	7knWR3W3e3Z9WCMK2gtTjO15E8aYT6t5UPZt1VlnYZ9QMtATv7tuobhHm/+XUKtHqToW9nIjlOhO2
	YMpZzfnC1RwhpoPZglJTMZ9TAWQQjthH2E7ifwelqAEAHNFRmMr2PWHNjfd96K4VY4GdwB6Q61Tg2
	aPZhlJkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruxbS-0000000DAlJ-3RNm;
	Thu, 11 Apr 2024 16:48:46 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruxbP-0000000DAj1-14nA;
	Thu, 11 Apr 2024 16:48:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D03FACE013B;
	Thu, 11 Apr 2024 16:48:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11011C072AA;
	Thu, 11 Apr 2024 16:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712854120;
	bh=LWlrTCJGqYKdS9PYJSR2H64H7PQGjxik5FHnH+YFRek=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SRw9gbg3ILr9SlXTXTQ+BUnw1oNfqMDP46YMiFKH2ywD5rU1P0dEI+ifC98brtzT3
	 sK/T8pTySfw5lZUKqDGe0eomeXbvOgcJM/BmFRtMyceO9GX3DEYpYSdTMuatLQPJxf
	 nLplnjGvyUcQBu8NuzBliq2HTBtzk1/Fcj/fZKzNGAXhRQHB2JVF12XTExdynCf9t8
	 iSd6+nVzTg9fkeIUENqsjt2GH2BlY0YH44BpSEAJyqvHQScjw5PfyNprZUfnH0d4xT
	 8scaN3SbJU5zDwE2FhccU4BjirKFtM2vAR5V2+KZcKZ+bIF59FTLnEtNBJBPHycIyy
	 /Ptqgg7AuvOGA==
From: Lee Jones <lee@kernel.org>
To: pavel@ucw.cz, lee@kernel.org, matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, ChiaEn Wu <chiaen_wu@richtek.com>
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 peterwu.pub@gmail.com, cy_huang@richtek.com
In-Reply-To: <28FE6F1712799128000.chiaen_wu@richtek.com>
References: <28FE6F1712799128000.chiaen_wu@richtek.com>
Subject: Re: (subset) [PATCH] leds: mt6360: Fix the second LED can not
 enable torch mode by V4L2
Message-Id: <171285411780.2498946.3824215880975158305.b4-ty@kernel.org>
Date: Thu, 11 Apr 2024 17:48:37 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_094843_582505_E004AA1F 
X-CRM114-Status: UNSURE (   8.59  )
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

On Tue, 09 Apr 2024 18:21:54 +0800, ChiaEn Wu wrote:
> V4L2 will disable strobe mode of the LED device when enable torch mode,
> but this logic will conflict with the "priv->fled_torch_used"
> in "mt6360_strobe_set()". So after enabling torch mode of the first
> LED, the second LED will not be able to enable torch mode correctly.
> 
> Therefore, at the beginning of "mt6360_strobe_set()", check whether the
> state of the upcoming change and the current LED device state are the
> same, so as to avoid the above problem.
> 
> [...]

Applied, thanks!

[1/1] leds: mt6360: Fix the second LED can not enable torch mode by V4L2
      commit: 0dcd0488a7a5b8762256b393a8bd0c21e5e4e0fb

--
Lee Jones [李琼斯]


