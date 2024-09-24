Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52262CF9C6B
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Sep 2024 09:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tbel8uvGtCqj4KcUrojivaO8C+VEW00V6+EQbi3lJAc=; b=CZ3TCqvhte6lgSw4hXqOAbQEGj
	7QxQZv0jjuEMUDShtaJiQ8q/ZP8EhMeAuS7G8h3EPMrM64yTbYj3WDZz9tKqBmitcbUQW8ti3mEy4
	kDK5srtFv+KW3Fw5mDz1JTccOzfZj4hCVazy5GzA0buxl6jN3GPS23ydgKCJONgkiNq9eXpSeUb2l
	hs5SgxzWwWDQ4JtbamlHCPzK8/qr/4qZf1YFp9M40wE2mEv8kjDpAtT2FMNqRCUTvtg2qVOE/bWEu
	NiLvdxhGB6elMdSv7CzkFptH05xQYwKvog2RFpfUpWa8fQWH+UKGradA9oL2tjMtC7Ucd73gREUSi
	NXtuvjUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1st1co-00000001kz0-1MCm;
	Tue, 24 Sep 2024 09:14:26 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1st1Zw-00000001kJZ-1uza;
	Tue, 24 Sep 2024 09:11:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6DD49A40851;
	Tue, 24 Sep 2024 09:11:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 486F0C4CEC4;
	Tue, 24 Sep 2024 09:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727169087;
	bh=Tbel8uvGtCqj4KcUrojivaO8C+VEW00V6+EQbi3lJAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HfSxoE7MAm8p/dLPymACTis4MfzHpHjwe3QUIUF2CX0sF9Nk3l4HqHp8H85CZfRrl
	 RnCxOEOc/kiZ1R+cp4gtpHU+kbVUTqs2FXE4YR2eIAv9A9IroRjmwFg2wqEcEmmsN6
	 Qs9XA4USysKvDEbTmsOmr6Uu+JelxT+Qd9KQrZMk7mgzUfPGhLlpTrDVI+uRCMPGKe
	 3JnT7CUNuLAVLKUv7UAvKYC7cNsQVzqcL+Yt9JlbrIdhO7YNQFAjMC3cX80pIzahCX
	 P/nXdIRe2VeQVV3sZvh01/E8srVmopGgjmprLTS4aoHFmoiPDMU/SBezeQ3WM2OEZJ
	 9TgjCwL+NREXA==
Date: Tue, 24 Sep 2024 11:11:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rohit Agarwal <rohiagar@chromium.org>
Cc: chunkuang.hu@kernel.org, krzk+dt@kernel.org, ck.hu@mediatek.com, 
	robh@kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: display: mediatek: dpi: Add power
 domain for MT8183
Message-ID: <4djlcabqjkq7thbxadjbbi6oumybnyzv7biwawke46ctjccwye@rmqougrj6pl2>
References: <20240919112152.2829765-1-rohiagar@chromium.org>
 <20240919112152.2829765-2-rohiagar@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240919112152.2829765-2-rohiagar@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_021128_577627_56AB6A04 
X-CRM114-Status: UNSURE (   8.36  )
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

On Thu, Sep 19, 2024 at 11:21:51AM +0000, Rohit Agarwal wrote:
> Add power domain binding to the mediatek DPI controller

That's DPI controller, how can you add here power domain binding?

> for MT8183 that already had the property in DT.

Best regards,
Krzysztof


