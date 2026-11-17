Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92072606A32A
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 13:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aWIc6dQk;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tW/S6/XF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AaDKJsLWEh7/iLpR8aPgnfDX6Rsn+z2sYbKJVVqDKhM=; b=aWIc6dQkuXNeSulmERTBlZaML+
	T+iHlFzgBnfLdwWfqJlukM+54XIyIsMp1Sun6VqSPCTEcGvpEk8REgRMbhz9Wq1MQw+Edo9vENT58
	RKvYS/w1u/ujf+edgLu/ghughRAdW9zDezDn8kNOP2i90K5TSnqFy6+UaKWIEqGSLHOIIVnM6eQbI
	Q/VQu80xKcJbx4PsEuiFoYeJ934VMrrButJRDAiylgBtcBzw04HLwJY2j7wcm28U2WJ0FLce3Bikg
	HsFj/l7GV8R8dFLaciP+QGOzWr9oWRniP+zYYCtdZZ9a756bbEjHu7fBf4jm/hmvDtTp8SK01PwbN
	vYmewItA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJCy-00000005vSc-1E4h;
	Tue, 17 Nov 2026 13:26:48 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTJCs-00000005vOV-3JEX
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Nov 2026 13:26:47 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-6b87a92c17eso564161a12.3
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Nov 2026 05:26:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794922001; cv=none;
        d=google.com; s=arc-20260327;
        b=QG1mGUsLf5fAwf1jAm66u19bCS07XJLjmzur9T/jsQI6+fqxABPvWVpgUazzzNnHNk
         088dJq/AorleVHEwCvkKTsokuG5VcFFXbSVFA9IF0Y+AX44H58fCAQN8xWRlpL2Z6Meg
         bCLc46LUJcCtc5Q71g2bFznf/7vT5DAptUrgHXcof9D07JQFWU0WC2Uh8GKhjJlMQclK
         Q7Ww2dQeIaLLaurTrZnDLos8JiMhRA2wgtPRfa6QWirOMidmy418sJGfeprsdkNx+pHP
         H8w4m9MrFQbzxMEOWF+Y83f4OFNuRDggBeWEQyicvMqgHyW2SRCf0L2pT8UFZcVp89ao
         oHBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AaDKJsLWEh7/iLpR8aPgnfDX6Rsn+z2sYbKJVVqDKhM=;
        fh=i+a+a+3QcZdt0f6jheEZygfuVp1cz/vW2pjdxa9jxqQ=;
        b=j5vItcAmOPi43tqsZP2M6GgdIy4zrisWQ+qC3n62cEC7+gJYEoAvcUeHd9sBCffV66
         gCTD2iG/9vV/QwpjIBpRnZmCgE/dPT8yJ/4/qqHimCB7fR8FgxIvy0/gzM/+rGpcxctQ
         C1t21pdnJ3OGDm0wnq7PXxwV2vC5wyqPdNJvSKdMncpO6NAXwpD+ma3B9FXJ+raZlWmR
         eUJvxjO+XDaxnn3jeJXzhK6/QmG8G9Kj99It0O1KJi5pks3dF+iyTnlGFjnw48HGK5sG
         eGqxZs/FGd64KbWf+W9w6d5KHM/BzFgSVpNUqfI9zSxThtZxpm9w/I2Q7gqxkSrqkBHN
         Rxfg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794922001; x=1795526801; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AaDKJsLWEh7/iLpR8aPgnfDX6Rsn+z2sYbKJVVqDKhM=;
        b=tW/S6/XFnw8v0ytylPRnXvtFxs8lkP5fnsN5kUim8NPlR8Tvb/StWwTIeDp1Tw3aa5
         vz0OvPrTCHtjJ8D5xp9CrLaKZwgFVJJzlh5MxurpKeclb1nrurtvTMbZHWqPG4xVaKPn
         Jv3BOx18W9GIyMo78tx2cN/Xr0bZ3fTvzIIr0I0LLxguDZlYDCTd/GMWEqLj7Bw0JKS/
         JRgWZMY9w0qG/fvlNHiI/hE0TKhi0P1B55W2O4jtWH2n76kzaa3mkxPU/8gMcDl5vgv4
         gwMsRdmlYUcMMLv4UxcCUwhMUajPMbbaIggwi4nUq+nY1G94HncUz8H6gC7K1so5RLaN
         XMzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794922001; x=1795526801;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AaDKJsLWEh7/iLpR8aPgnfDX6Rsn+z2sYbKJVVqDKhM=;
        b=GQ0+i7MKpx/fxggmihJGp+B5nnqC5N6GHG1DccvNz/2Rv5+N7wLn1U96Fzd4z82RxC
         gWX+m6jAjyTgdgx2TAy2lyFwe5oj5wEoH7cc5sV5nLcPsa7Tqk4mOvz/Pt073eamgi6/
         BY6JQMGoiOhi1QASzDKJsKQpWiemVkTHIbXNHiPZ0LzQFxepuMPNW3xUAzxo2JBFyG8B
         nEy20c99Wli2Kc3bXK8Lx6SFRNQ8Jdo+PaS0DmevmXzQIIFCmqDC20MAwXxLzknnozLn
         84s8i4nN6RJNw2ljrWxXdaXRTuemVPESdjrx58KoQhLSDsCqQCABENORbr5FEmRbBq6W
         UyzQ==
X-Gm-Message-State: APuU4Z/chDDpRFvFSy8OM1Rj2UP+W36ZmaOoj6l8t4j4Tu0DJL5WmK/S
	4L7gr49ezfLlzUEkdrnbxdYNJSEE1gr7m4sWUsTnDG5X6eG19rUMVqquYyY1KUmGHrZifUHD8Pd
	DmMxehBKGCDWmgot4qIyBiwBe0y+D/Vo=
X-Gm-Gg: AYBFou3pRpNxGSGPzYdFSrDgJoJFiBHdORgm77v/PYugQiNbCMd/SWI8l7+6IIwNeQ/
	Yw/GPg015R5JBh4E8M0GHRB/opaN24pwa9PEf3KrGr0R8Egh9QQKBpr9bIqI+BG77mvKwCMqP0b
	0pcDkoaWYQP2XByBpkvhrUHHYrGYjYvmiuOHelx97P33E3alMkroZ1ykloCkn0a8Ctz4wYBGO94
	pEIAdhjB3TKgHXtq9YzpkF6akrCU4exHe7sTOf4PdOxuzYEeyiYhMldYtBZBc4jHc0HcIpZy1Zp
	900jHKiLCmJNVaR/hIf6QHAfAbtvsjf3Z3cW3qz9M7VC2m+/IbqxSvuMzbrbETyivTV7lBRmvT+
	Mcg8VSrhpXzgqMUDoS9i3yYhIGgr487U6lGk=
X-Received: by 2002:a05:6402:4504:b0:6b5:7de8:87cd with SMTP id
 4fb4d7f45d1cf-6b7c0d06f9amr10641554a12.42.1794922000158; Tue, 17 Nov 2026
 05:26:40 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260921113914.779393-1-l.scorcia@gmail.com> <20260921113914.779393-2-l.scorcia@gmail.com>
 <3701981f-cdda-46a7-8079-de5479ae9c27@kernel.org>
In-Reply-To: <3701981f-cdda-46a7-8079-de5479ae9c27@kernel.org>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Tue, 17 Nov 2026 14:26:28 +0100
X-Gm-Features: AclHuK-pAjMxUsyMno9u008purn-se7dqQHzpp18oe2HOK5CuVKhIbMUqhDzQWQ
Message-ID: <CAORyz2+wF=VDTFkRFU7jBu-zNTW7T8mnPrJZAj8ZVD-Yyr2b6A@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: display: mediatek: dpi: Add
 compatible for mt8167
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>, 
	Jitao shi <jitao.shi@mediatek.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_052642_843962_0B2AC589 
X-CRM114-Status: GOOD (  11.04  )
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

> Turns out you bring here undocumented ABI. NAK.

Hi, I'm sorry but I don't see the relation between this commit you
just NAKed and the bigger issue about mediatek-drm alias usage. It's
not like I'm introducing anything new in these DPI specific patches
and the individual display block drivers do not depend on the aliases
(they're used by mediatek-drm for building the pipeline).

I understand why the commit to the dtsi that includes the aliases is
NAKed, and the eventual fix is going to require a change in all of
Mediatek SoCs dtsi. I am fine with the dtsi changes being blocked
until an appropriate solution is found. I just don't understand the
NAKs on the DPI components.

Thank you for your help
--
Luca Leonardo Scorcia
l.scorcia@gmail.com

