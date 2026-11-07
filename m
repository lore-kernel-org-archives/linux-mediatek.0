Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904AB606A32C
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Nov 2026 08:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mTWGVOG9;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f8/Ufdiz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=An1bRoE/6CxmwaSRosrMArcH/TfHD3aBe6vo4ktdg0I=; b=mTWGVOG9WRvIdSrxte7qyHFGVQ
	tLxKDhgna61nZK5CKca8FQEa0Ps0AWl7rf6jgWikaxfFdkL/0aSC83BmFUd8qDdisf4M1KAJy15sS
	4B7+N7B6CkA1Ru1moGBv0eKGM+sAb6eqlPT8qyyQKVqIGhNSPaVIc43pLNLLMMlHSyhuRUSg43jif
	4Zukotz0EVWpZdJZ0fx9zDaJkHGJ9+FZTGTp7hH9C5zebittSc7ofTc4z6uQmT/Kjja+waNrgLYaX
	KKZMBLMIUPSQn4QspdKbpe/MwPf4oS/tFFFckLkj5taGGAp//pMXnWXAEY4kU7Nsz9LyCs1gSDXmF
	DZM7UY8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPbd5-0000000EMuM-0aAw;
	Sat, 07 Nov 2026 08:18:27 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPbd1-0000000EMtL-1ku6
	for linux-mediatek@lists.infradead.org;
	Sat, 07 Nov 2026 08:18:25 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2ed1f1a7695so4744365ad.2
        for <linux-mediatek@lists.infradead.org>; Sat, 07 Nov 2026 00:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794039502; x=1794644302; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=An1bRoE/6CxmwaSRosrMArcH/TfHD3aBe6vo4ktdg0I=;
        b=f8/UfdizIpn/WEFxo2SCLdZ9nmup3J2+/coAH/6386X1+fOxpi3jJ2UObbXqeu6sHi
         cx9ftUo5XxAWJz8ow/hk0TlyoMaRInJncTIqUpU4WhkxzvD150fZYtzwa8ftkuwV0f0P
         eUMXVzlbRsEPfQpTJY44DfFFzaSVe0F90q0PuepuNA5y3Soy6qi6yCrz8T36Oio8yyPA
         FnNpRecx8Z77MCw/0rDO2+x8D3yeRGIQOpih5+IYpZe6n/+aW4EvIhgBhm14s8+9gGbi
         p+vHYUHBvF9zmXquvRcLb0ntbDWokwPJ39QZHT9snGcU6189JntxFrY6hP6m4SDgaC5C
         jDwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794039502; x=1794644302;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=An1bRoE/6CxmwaSRosrMArcH/TfHD3aBe6vo4ktdg0I=;
        b=GglrGU7DK5Fq5BUEtlWsnc1/KEeIguy3UopJE3Ch/XOZFqTbJCIDj3HfB1r0sDEzZ1
         EeFyDzZfBWk27EoYOF7o6dOnCoDmqN0CZqzV9WsajD9CEsZwt9ZvVSr0hI71K+usTr1h
         P6l539Flr/kx1cxmM1nTF4X6Yk6JY+eYZBuGu9bBxUhJ/TqpiPMgKHLIO43BjqjUHzvn
         H3Jr4hUhA7lgwxSEflaaELsyCczCBeOZc0oal3Obu8dHYQv4boelWXGglzFI4NzF4pjU
         IaZGlu76tBp95pZUKMfUnKAwROROHEq13/1z2qfoE639fqhLCy/Ppcdp3GXzZKcxXw+e
         lWfQ==
X-Forwarded-Encrypted: i=1; AL+hErE0JUmFdS+h8KiDM2+0vDbg+44q5wah7E7CWI/ED4kO/AkfRrSWNxQHWRx/+Bddwj0lqkSpmR069ypxHyNJkA==@lists.infradead.org
X-Gm-Message-State: APuU4Z8mJpwfH9sUFhYlBqykPP3hMHJz6XNpIq4jGrwdu1aKOVJq0f9C
	dzMiPYh7AIjJtOgB1cvBXLtDBkQ+wJr9WKhIUkEMvgmgvr6Yydz51asp
X-Gm-Gg: AYBFou0Vwv+nefv1s4ywdKqKCq/rwf3mz9EQV3v8hOHaqf/9brVsfoXBjaT1AFrtpuq
	eO3cv4K4J1lHOzhaRp3zAMtlF3gz220TWMqOpnLE/FtnuAVgRNXJ/7Owe2vr2tcFrZFAJOjTcF2
	VB135mOljccoTzpp9kNBfXsd+Fr6chtNz1jobVrM5cxhHOcr2iJfptJ0JjCo5RaY1J0rtfLN4WI
	pypUjo51CzY8Df4GTQzwUQHR04dxa4k4HBdXQ3xWfIkE8ek+LNop/ziwSj1CSp/BH1W6aeGInbp
	mimeVD1fpkkx8RmX2KvXKygZDH6pMbHQOY2ZLa+tJ3ahcDf4KPSqWJYt+acgKhNGt8U0Cc5f/jT
	QEq4+gGPAx33DPNijdKh5TmTHTxh2V7WfXl0wPPnEXtMxxnOVGWILr6LeRYhN7fwwA2r/+5XGAM
	BQcMQDZX5qxOiYNQhhrhN6QyaIVATUF4eImUdtYkPue2bICVIqohXUcc0ZgLefwH4NiffFZ0tD+
	HeGGRnSN40+8SOZoIV/GEH7Yutw3amAtxAxQepohWSjfnMQpJHQN3pf4SQEkh2Nfe35NdViM9Fy
	K5VSBconJgUjqA8s5A==
X-Received: by 2002:a17:902:d48d:b0:2e8:1c7b:3b6e with SMTP id d9443c01a7336-2ed40aca726mr55809015ad.26.1794039501791;
        Sat, 07 Nov 2026 00:18:21 -0800 (PST)
Received: from buffalo-ssd ([2a09:bac5:45bc:1e1e::300:1a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47528e5dsm11943395ad.4.2026.11.07.00.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 00:18:21 -0800 (PST)
Date: Sat, 7 Nov 2026 17:18:17 +0900
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Alexander Letuchiy <asalde.le1@gmail.com>
Cc: Roman Vivchar <rva333@protonmail.com>, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] dt-bindings: watchdog: mediatek,mtk-wdt: Add
 compatible for MT6895
Message-ID: <au7UMdlP9O6oo41i@buffalo-ssd>
References: <xUMh3NwVp4cBhFsWWFE2Xng4h8YH95iJM37_I158WAyVmsRCPbirWT1iU8eMFeiSFw8xco0X45o-2NOeB6Jc4_nWAg25pFPgDMwK3mKzm34=@protonmail.com>
 <20261105222435.571449-1-asalde.le1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105222435.571449-1-asalde.le1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_001823_485688_207A3B00 
X-CRM114-Status: GOOD (  16.39  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Alexander,
(Resending with the Cc recipients I missed; sorry for the duplicate.)

On Fri, Nov 06, 2026 at 01:24:34AM +0300, Alexander Letuchiy wrote:
> On Thu, Nov 5, 2026 at 11:50 PM, Roman Vivchar wrote:
> > Does mt6895 actually share the same reset layout as mt6589? Given the
> > generation leap between these, the former is very unlikely to use
> > the same resets.
> 
> The vendor kernel for this SoC binds the watchdog with the same
> compatible list ("mediatek,mt6895-wdt", "mediatek,mt6589-wdt") at the
> same address, and its register definitions are identical to mtk_wdt.c.
> 
> The TOPRGU reset layout is the one thing I can't confirm, as I found no
> reset table for MT6895 there. This series does not use it: the DT has
> no #reset-cells and no consumers. If reset lines are needed later, I
> will add a dedicated mt6895_data to the driver.

The MT6589 wdt driver now also registers a TOPRGU reset controller:
f12d5facded7 ("watchdog: mediatek: Add wdt/toprgu resets for mt6589")

The driver now registers a reset controller with 12 reset lines
for the "mediatek,mt6589-wdt" compatible, regardless of whether the DT
specifies #reset-cells or has any reset consumers.
"mediatek,mt6589-wdt" used to be a watchdog-only fallback,
since it did not register a TOPRGU reset controller.
That is no longer true.

Since the MT6895 reset layout is unconfirmed, it must not claim
compatibility with the MT6589 TOPRGU reset controller by using
"mediatek,mt6589-wdt" as a fallback.
The compatible list is part of the Device Tree ABI and cannot be
changed later.

As I noted in [1], "mediatek,mt6589-wdt" is only a safe fallback where
the reset layout is known to match. Many SoCs do not share MT6589's
reset layout, and MT6895 gives no reason to be treated as an exception.
We should not add yet another MT6589 fallback whose reset layout is not
known to be correct.

Please give MT6895 its own "mediatek,mt6895-wdt" compatible without
"mediatek,mt6589-wdt" fallback. Its TOPRGU reset support can be added
once the actual reset layout has been confirmed.

[1] https://lore.kernel.org/linux-mediatek/xqnpukvhtezpqhwjnxbqeddiaqlro4m5yjukpplv5mjfxodlfp@ijaf2trst7p4/

Best regards,
Akari

