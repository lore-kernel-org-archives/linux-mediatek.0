Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF39C5DF82
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2026 11:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pv++npyQsS+0elD7u+7CYZUc6oiH830RRaypT/ZkgY0=; b=xnq/Ps6Dr0H1LwneYzyMjPFivF
	GHNCBmq/b7v3RFA2Krqj59PSI9t6ZJfKgsPuNThz84nA8kecWUVft8M2iuKN67hD6Uzg+NkqAYhQO
	OC3MM7YfsJcuJAerHJLqW2wGWqOXkLLkyAu7ZujWY8O6e5cUv2TuQHsnsta/IFbI5uATHUgXEDWJQ
	wrrr/0FHuOBl7Dg+HBhub07TYhdy2IsZowz/qYmrJKLsm6+QPW/sXec8KPrqXOMwtPKByKIUP6mJG
	fD8iPxMl5PTrpsbkwuO1afl8Os0IR57/M/kzw205n35YHw7qTMRz3YdJHcgV52f2ZjAPiuk89mGAQ
	41hSyBJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx14K-0000000BSxB-2htW;
	Thu, 20 Aug 2026 11:36:24 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx14I-0000000BSw9-0iyF
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Aug 2026 11:36:23 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-84862b0d5f8so1570020b3a.3
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Aug 2026 04:36:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787225781; cv=none;
        d=google.com; s=arc-20260327;
        b=dEGk7cOnYbtl9d9AhAzkOAALD38t0WJYwYgvEu1M6TeaW6bXD2U1EhhGwH76gtQX/Q
         CM1AdRy2s8r7vyJxO4HVrWwXAgXTVKnhcUPnR3RdFSMPVqvRbpeEA7EuhtSjquoVYdt0
         5n2Kal/7QIxL571he1Ojl0GTncPKvD6XA0Sxf6aLtTxo1uFtSDM1UKxy5YCRBnucUrO0
         JUSGaoH7sGaRlffF4hwG0d1mVyxmN6kb942BTHuDSOh9u2MW77Fuoch/WZ+AzSKGuP3l
         pPA8YQk/pbe+jg6eZoUP+fen96/MBioeUfcIv2GLkwG4pUefVnkinCxQXUbjzys7QbAG
         Lrew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Pv++npyQsS+0elD7u+7CYZUc6oiH830RRaypT/ZkgY0=;
        fh=aAkjxFd7wfFIKVYs5+AN0+637NqfyEbZq8o2jjktbxY=;
        b=MFyOru93fE+5le6DhNQE1HcJPiMvNHajGErDJlam6AYcQoYVbYXrKuaPO++l3QiJB/
         6Y39OuDZqA/VXSTa3KSc8iiS72LaJYKTCeIi2WgksRIZaDEk1morX1/X+xj06si63LuI
         3EHqQweCFxaI5l8iv89DGvFYImIP7dKaS76a8vGcu779LDkoczp27ukCljAj7QOLT22a
         A05obz/HmbGAt3cBXstiQOSXtBJo6sJsULVHvAhXl6QpZ1yOxifDFCCGCIdZoupVsyWY
         ueih2d6n9E7aY59lJFfRumS60Z9C3ZtqCTkN9Se9Snl0fEuMk1jcQy3769aZdSZHQKl3
         M4ew==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787225781; x=1787830581; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pv++npyQsS+0elD7u+7CYZUc6oiH830RRaypT/ZkgY0=;
        b=Yph8yWm7/MSpojAxFE0dIpqJGtmArFoTA3clt5JYwrquGTY29lPcaJT+pzHLOZDZct
         OtptxCV/kOi0POibLSkXJKSETK8gLyO//DsflsrMm7tcOKJPl46ssMTaKH82RpuhuZ+1
         gD76jn7eCTHPk+1n3qBG4tvKuC4T/SqPucVzEMTyKkyK2Z65WXHKpXCj40iIURC8hJMN
         W6U/eUGIKCd2h1VjfbjXh/dJBJbJa1tcn2N0ewp+qaBNEyDyc/zAfL8kDPfWXIiJjRI2
         G0GI1VI5Yqgf/W6VImaUaq9TeIIEUdl6gvb7+TSWSmMOZLkMmyRfpZ3+AF8/9MGxBd1b
         ZXCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787225781; x=1787830581;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Pv++npyQsS+0elD7u+7CYZUc6oiH830RRaypT/ZkgY0=;
        b=Zcmr1f5gD6EiTA3PV7mCTr5/4bv/IjDBQvyjHPWOqc3XBGDstMgySJtJvjY1FFGmT0
         dMGz6Xxl8x7kWLifafzmPvqTJWk0MDUP8gO0o1vOH8AXNFe0B+NIzLW8QpSfSrbLKO6r
         GPZPmIf1Ua+DIWssqE0hKv9MczC0O7rKHcqsl/3zOYD5FMHvaH8Ly9pTxfbOtRG4DPQ+
         UNN5UTA0FuAncTt1ufpuZ6zwJkUwFSYAEofLWrlOqyhbFpmzJxsh8TC/3ZIWOi8TNV24
         uQ3Us7MNH6nZseQedcpBwMAiAcy02OCQLgGHmuQ5kr+mGFTlkMhqaJ1dG432qeLJb03w
         jQrQ==
X-Forwarded-Encrypted: i=1; AHgh+RqDxUkh7siuX8etGMqoyyC8nq8sZt/tndqJbB2VbXuy4wZ1A2MVeI1wn6I36RBofNpwUwWbKQkwypmH7PE/GQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3eiEVuPDDaEaZx6WzSIQjDuBvhgn1fy0Livbx+3AwjBFtWCyF
	Z+5a7Jmg9e+4eYQp5MTyjg85ObnEfMihQpN0vgZmdvZvZa2W+wVPGPbKlXfRQY/4YB+Rsy7TN8q
	9uuOX9vpFMFUfoOlGwtsrKLpZeRsc4XQ=
X-Gm-Gg: AR+sD13j3IZn+R8deRoBTPewqVFhXyByJqrYO8zAV1KF7t7+QbzaMFKatvkHlBY/LTg
	PxK3163XFqx5kKCgsEIBLw/Oj87Ocv3HxeNQLk0JO/BoVgGVEhXoOLyDMZzvmP0QsYehXr1Aebg
	yuQf5DSVL1xfQUYMnvoJwCvoYsH7BpKHM5zxYRuckhPyasatUgWiJLDzEgokaHbWnfXmaEGUepn
	WtwRSWzJ0lEad7Fu6fIX7qpPZA4gUMO+zbXQgsoPGqy81ZuwdZMZEIC0sl+DeWgOypZoPKFy7bc
	/PLQTPAIJ4C93zs1j2gsUWWaDDcFbTkCzuDcbUk7Ka2TrO639rKGc+p3t+x6/XH9NClRoK4Z4TT
	SAYfiOd1kLosb8TqKp0iiypzac97nfEMAOUuOjrsX/jMbICaAq17uwl8FTYs7p08+h9C+PVMx2z
	NK5hnd1LWPhSj8eg==
X-Received: by 2002:a05:6a00:2e92:b0:848:2c5e:305e with SMTP id
 d2e1a72fcca58-851d382f3d1mr18117690b3a.6.1787225781272; Thu, 20 Aug 2026
 04:36:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260820111253.97866-1-phucduc.bui@gmail.com>
In-Reply-To: <20260820111253.97866-1-phucduc.bui@gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 20 Aug 2026 18:36:09 +0700
X-Gm-Features: AcwNN1XBwQbXQT6wc4CnwLZAJqiHhO0ddYg-yE6lNaCe8_uhwLKGBMlMjT7-UaY
Message-ID: <CAABR9nErEB6c-nQH+mvP2V+oz-tACQsiH0hY54p17CNovmZraQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] ASoC: mediatek: mt8186: Fix clock error handling
To: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Cezary Rojewski <cezary.rojewski@intel.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_043622_215303_114ECECC 
X-CRM114-Status: GOOD (  12.96  )
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

> The changes therefore assume that the clocks used by the driver are
> required. If these clocks are intended to be optional and
> devm_clk_get_optional() is preferred, the clock users would also need
> to check for missing clocks before calling clock APIs such as
> clk_prepare_enable(), clk_disable_unprepare(), and clk_set_parent().
>
> If that is the preferred approach, I can rework the series accordingly.


I apologize for the confusion. clk_prepare_enable(), clk_disable_unprepare(),
and clk_set_parent() already handle missing clocks and return 0 in that case.

So I only need to confirm whether an optional clock is intended to be used here,
so that I can revise the patch series accordingly.

Best regards,
Phuc

