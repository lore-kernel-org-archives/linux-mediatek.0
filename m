Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4292DC982EA
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Sep 2026 08:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hLbf5wdEcfSfArgGglezKU7/4be8aZs+31yfBhWP598=; b=MOpf0H9pT3Qzeu290/5Wx6ea7J
	ZUtS9MlFumXt/Ji/yTcv8oYzqJOohlQq3VH6679VQj2cws61HVH3S6X8wpVeq3OpxmVoKc9oYGj/b
	rHnddy8OBLLOiOFZmkujKjPe0Qzwd5Qt5HvNoAmlS+nrX5ZaiNGT6qS+rt5GId6No/yl5SGAFNIPw
	S6USXscdLyuo1dwG+EVO6atvIj2NQRpfZOU/Q/jIiGJ0MnNWvrqI/LGFhiT7ePy+Aqvo2EBj5za+j
	1LTlnF38ff43rzEF7qLWzaeFlYVV9xntWjsBJCsAgi9gKDZSt27GInrfxVAe5fRcJtCkkWHKldVcH
	u6GBQLsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9IOb-00000007XFP-44aI;
	Wed, 23 Sep 2026 08:32:05 +0000
Received: from mail-qk2-f43.google.com ([74.125.230.235])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9IOZ-00000007XEL-2t98
	for linux-mediatek@lists.infradead.org;
	Wed, 23 Sep 2026 08:32:04 +0000
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-530de452c33so6692471cf.1
        for <linux-mediatek@lists.infradead.org>; Wed, 23 Sep 2026 01:32:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790152321; cv=none;
        d=google.com; s=arc-20260327;
        b=W0pU7475Vp8OigS7uPfS0aP82KooTC8nX3oHqFJUL7nYX8X4m3rHRiqt52Bj4yLSYi
         N8usr/0XQVqImFtv1b4LruGi9r6LuHU+Wcnb+6c3TcTHQv3OlljUXgVLzPea17RhVGbI
         P5ibpnuPWUZIc5iAFqa2/uupe/5AKiMroX3XiW7N0xvv3yo62hK5KRYYOljOmaGjMCaa
         zEwp0f9epAwvMkDfuGd5hxiKWqp9gAYjmo6GU48wM+DH1uftDG4BfX8FAjFr+otO+tlM
         +43yuYQ8cnHr23rSmEINqIatHe7QY+swsZWSqScTH5bV94c1CTeboF35VoGGe/wFe9J+
         3tRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hLbf5wdEcfSfArgGglezKU7/4be8aZs+31yfBhWP598=;
        fh=QvIv9vKBzI9KLtYP0AwSg55TMhcrI2k482/FBFnUYBo=;
        b=Yhfpnaax61ITYvC3ft+F9uTzK0ZqUunXsYKaxqnv94fZVoZU+XEM28xpJ5192I7gDK
         T3UNs8XebxyPPywjL6T49aGmiQXRCBjlIMtx1vo0bB0ePz1vR/VhyuFTApEvT7JvjFM3
         OifGqZOFmsD1MzMjwG4GbvQQ5ub8wR2RxqW6J7kWxUssCUoTX+oPcEuIw0Kb8JB9MG7A
         m2+VRhpSBXuLpUaFq6i8d1kQN8jD5gZRxa4KhEOybMIgqDqZ3/Hjue0JOCaum/vpqLgD
         LOtb7qzlkD/xYEsztz0zYZemQUvi+mpvXjNd6rzqBtTg56taAMVJwzxj9Y6F0FztlP6Y
         CogA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790152321; x=1790757121; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hLbf5wdEcfSfArgGglezKU7/4be8aZs+31yfBhWP598=;
        b=NqWt8RxW06nXG1ZVVVsVdVsi+9wp5z9m5jQ1OAqTTkQQag4pv3B/7Fgppx+xbfm7lX
         IXG4ZXUpfXI0RSXchlcjuFWW4SAlxoLRauSbmnbsqU3p/VrycFn5kAUpDyNfRfUqHZX3
         BE2a5aAKdNrzDcMJroxox1H3XKNsnj8GFSxOYZ5F2o04cSlG3D3CsuypWz4Q4GRVz9Py
         oWXCNrD2ThLeClh/OCaE9Ie5ctQYGBcRDM8OkuHDHr0IC8By0noHFmeslMkBTraCxHhX
         WXeEl3iv0Cc78JuWffqmWs7YmQW5Y9U1pIwU8YkdarqMNRjVzONEDtDp/O/eZdTVP9fV
         Z0xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790152321; x=1790757121;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hLbf5wdEcfSfArgGglezKU7/4be8aZs+31yfBhWP598=;
        b=IU3AecDMVvfqWAs9sS/Tt5u+DmhC5sGtS8qMswAgcjk06NQ5nsnhcMcYP+ipY1RBm9
         BuxyWwUb7Op5LJvPgLfPg7ygXERBwhwBi+8P2lEot3e220Dck5oM93YiT1yff7CUTrc9
         rfDuEWyuB11dHDgyM7CwCn/ItHu4s6Wle44i+CCe2uknEJEhbsa81MHrD00+G//guMY8
         fMLxZvQYk5Hnqc5LDIwK4YTUZ+LblTKd9i2tgWrKbLekz0mux2GJiqbOhLQsh5vd0Wip
         MFgZkqCyfDmgSWU5npUPlRYJnJel39E8CfEqTls3dsWBbE3LcG7nKpxp5ksA1gmzTVzt
         Fnkg==
X-Forwarded-Encrypted: i=1; AKwUvBzlJWIvM/GwEMa2cyF/KsDjJ3ukiDXfUjOKQUaV0B8esCruZmxT8IsPaDH9UqBTtByIaiFw4ruDvR35w39+iw==@lists.infradead.org
X-Gm-Message-State: AFuF++kuV4WIxZevh4VeFe4dZugxQX6fFDB/OZH0BsTqQ4PELqI8HXIe
	FJ7HN4nmq2TRNWuL40oahktC8+lprp9ksGDEZ1ICbaVCFmDOuXD2D4B0IEJq+hRNhyeNXoaezh5
	PfImal+zND511p2I2wyWZyqK7lFJg1x8=
X-Gm-Gg: AYBFou1/f37ZybavHqnhBq2GXuJT7advz4w1SC5CL8OKyxsbTCORzrSH36p7yWbYBcl
	+QUHDJv3zPEf2nyR6fWhnaydYOfAGQonubfB2+1Cgf6EwwUu/TUMZB2XmdawDKOgYSlFpZ+iHOD
	Jiqht/tDJuIqacMSyCvoKyB/n6yjiUeqInLs/mj2kYmS4rdchdqkAPFimVwIidAxQ7yjN6M6W78
	LMG+tu6BCi3W9s1fWTunI6ccZQz8BcwM5yyBVhe05sLyfuZ/iEGXC+G93PWPpfWgM9rzgJyD05k
	fXJOpkThpK+atabrhN6jklrkS+AEP4+f+3aJpLEtaM0V4bnPgDX8a2lvr5S/9qb4
X-Received: by 2002:a05:620a:6017:b0:93a:2d15:f84 with SMTP id
 af79cd13be357-93c2511c2b1mr290767285a.33.1790152321118; Wed, 23 Sep 2026
 01:32:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260916235200.20712-1-ansuelsmth@gmail.com> <20260921135933.7e8857ba@kernel.org>
 <CA+_ehUwy9RUKCCHDnqoED3AMVnErgGr9RCrCR4ceg5QONq1wOQ@mail.gmail.com> <20260922172514.7feb6e7c@kernel.org>
In-Reply-To: <20260922172514.7feb6e7c@kernel.org>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Wed, 23 Sep 2026 10:31:49 +0200
X-Gm-Features: AclHuK8jGec2XT5CWPXvYVvV1bFvl8hmA75zakqIakpr84shp0cAZGnoi6_G1Gs
Message-ID: <CA+_ehUyFKZzd0uP4akgZxaLLJTwcvGGKz5ppCYsB++fn92Dn9w@mail.gmail.com>
Subject: Re: [PATCH net-next v16 00/12] net: pcs: Introduce support for fwnode PCS
To: Jakub Kicinski <kuba@kernel.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_013203_736619_4E522B75 
X-CRM114-Status: GOOD (  21.27  )
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

Il giorno mer 23 set 2026 alle ore 02:25 Jakub Kicinski
<kuba@kernel.org> ha scritto:
>
> On Tue, 22 Sep 2026 12:12:56 +0200 Christian Marangi (Ansuel) wrote:
> > The remark on the fwnode patch are invalid. The driver is expected
> > to return those error as probe defer is not supported.
> > (a notifier and late attach/detach is used to align to phylink logic)
> >
> > For the specific Airoha PCS driver it's really speculation from the AI
> > but HW doesn't work as described by AI.
> >
> > The only real comment that is valid is about the alternative way
> > to give supported interface with the .get_capabilites OP.
> >
> > This is currently not supported as there isn't any user and it will
> > be implemented as soon as there will be one. It's really to limit
> > the patch delta of this change and to progress further.
> >
> > Maybe FIXME might be suitable?
>
> FWIW no preference here, I defer to the human reviewer.
> We can treat the AI review as a hint if human reviewer thinks the code
> is fine as is.

Soo should I send v17 to fix AI that failed review?
I think I didn't got this detail.

