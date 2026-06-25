Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4FD4CDE001
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jun 2026 16:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pNQd4fqR4yPOf333T6qEzF/KVzT7oLTJ0Cy9nmeHvrY=; b=Z4SseLs1uiOcEgMOQuxohZvROD
	zruWhCptrSKoxfMwE3c5Oro1sYyRRsr5L6wGe4b4pFnBqh1y84COw9bzS6DP8mj1i/HtFwbHKuura
	KC0MrNYuJh2F73y8KzRfcCeISeqzUh3aK6xFygwIH/IziLk1op81S/LH7E5qhbpAq0qYO2g8CLSr5
	ZI7wnIHqsYD/K/FG/eHbikzxH8+aqNzR90DF4ffuFu4x/V9rGQgIAQ7cBOZ+YPK3qfzItttl0AMYa
	mc01+HAzV5oY+7BucSgIWXZ81sBk1cAv+HI2IIPBc/anO6wwEfxEMqgqMp7He12c5/ZNF8dXRIHJd
	yugcgEPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcnEz-00000009VFr-1Hbf;
	Thu, 25 Jun 2026 16:47:49 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcnEw-00000009VEt-27R7
	for linux-mediatek@lists.infradead.org;
	Thu, 25 Jun 2026 16:47:47 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-69532288224so11562a12.0
        for <linux-mediatek@lists.infradead.org>; Thu, 25 Jun 2026 09:47:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782406064; cv=none;
        d=google.com; s=arc-20260327;
        b=Sp2JXqKWvT55JhqpZ6Nh7x8EuLR6TqGa4GgQfUeCvEylde4SkaPqAmljD2b9aLME47
         iZfTWiU5czTM/ourPUo7DlT1H1yDKHz5QFd0Ht4Bfz8XuBV1FrUuPuKAAbqxHr8fOWo8
         oUyCMizXWVwh286zJ0hL1tqQgEj1dGIF/+Xrl63iO16wCx3WE+15t0wDABMWjDb0LYFt
         FaubURwnF4WQU0aiSNMkLBlCleMkN6q4T2jl7m3oFBkNZOm5YdJqLPdmpRA5G5VUBbvx
         a8WFdsRaz5Drq+qNuSfSbiV4cTRolhPtPnQuFqerb8lVb9qbLgV7tUYPKj5RPrD4AFy4
         W1Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pNQd4fqR4yPOf333T6qEzF/KVzT7oLTJ0Cy9nmeHvrY=;
        fh=bueSTGA6wdTji1bIDynl43fNy8s9OKHjCHv5CnK4fwE=;
        b=fsHBmI8AyMfFKuNloATCVsqeXU6f9mcBsFYoCpio18MKHAoSV3waJC/40rjAJsh9M3
         USyxl8n+OFIIRVmwc6Mm9eXvkWQYmtQAFTD2VREITrd7ZGDXz8GKlWYZMABp4WbGfxvV
         J52+uCghBg+CZZEqU3vy3WETI1DCIqw2DbDza9gPcaP/dcdVEMK6qiKU615rscGCKVTq
         ZjMG/lHSXnHW8cshvzFFeFsNFblokGoP5zzwWKaLywdO1prWggnuFtNFXaBJko5mk2m9
         4EIla5P6oggwYDJ5rYKvvaEqMYxE1yHgMsEpUSbvQpsQtYwvT2/q5YUksrMidYxollDw
         DB3w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782406064; x=1783010864; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pNQd4fqR4yPOf333T6qEzF/KVzT7oLTJ0Cy9nmeHvrY=;
        b=J+vT7gTLO1Z8y0wZODRykutxtX3mpOaCaByjhN5311b+p9zQIJTNVGcM6/DqsG8DRv
         6OAa9iCFQDGHT9uCeqzd0O5VYT4UVHszkSdZbgTYElOSzX2J6fuzkXEp9NWXCbQNCRxq
         5FQBE+wXq5YXJuGe3taeTUIImWWGEf1SesF5YE+pX3PCTiEugV9ebciNGNqs67JZcgyM
         6lByBEUioN988YHDxJWgfKHJHoRaDD0zzhv3si1gsVDi+X83QLf7yakUAk/rlLY4dA0r
         /s9M+lsb4T7sOJvy4tXuPJ40mL7XoLFwQjCPnSiQwGXrATd88TGEygd1OeCclSHgrlFp
         3usg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782406064; x=1783010864;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pNQd4fqR4yPOf333T6qEzF/KVzT7oLTJ0Cy9nmeHvrY=;
        b=lWhhNi6Cxb9mckOhrUjFTNs1yd1b8kszZzTUSkVmbIsHIMstIMRsTC9o2df7GZKEa2
         v/GNN5VbwvYoeOkuiUswX6ajIOboxB7lqOa8xbqLctUkL4KyaWXzqyolgBwHLP4AgkTy
         hXqSXm/5kjhhKqdH0E2NH/PhlrFTXAF++JkzVJ7nctBfgQNv7svIDUQG6X1O3VPqpyIg
         9DOzgnSdnd+SqVzdUVq7T0rWKHJTYBEEpT1JxIGre7nDAIv3GVradGWh3Ddxx8izP5Hv
         Hv5BilXgToWmaDi+Nwq065xGQl45nyF7TWgpgcg5HDbPY71xlXhH38C1wvetNDsjCq53
         eIng==
X-Gm-Message-State: AOJu0YzJC7skW1y2dM6HVeJfAXL52tSgFpWKQskC9rZ6DlKqre+Y0OR1
	RZ5QRh+BV+VXPp204YdesQ+k+5HMLu9nDJPY04nQHOpi3Wq3I1TNVOALi7Q3DDyujXZTt4VfRzo
	WPajyC4XKAwxv4rZRmyjdxeVuhZ0Y9uM=
X-Gm-Gg: AfdE7cnI1TT/50qlw46r/zFBsPVYqSj4cK8j6FX57I0NvMtT34yNNFLEYMMccA3ylAM
	6NFG/iUXU1EavEH+SUg+moo9l7EZFi3LXkPBmyo8j3b1DIgQrFVMbrzG6CUvCOyVUZtetfWjpl0
	bSYQ5LBjU7o/vE7An3sR5EwFe/ERqPHJIsN4Y7FT+7XkC/aAChRly169eOxUI6ogXsla4jaPwPX
	mWqmGUZLBqGRVIHh5jhYYCrspOp/B8uaG99Wwcfu9P6PHilmt6ILHoGqEfvqAIBUursysN5qGcn
	K5E9PmJq/SBIPBfZvndD5/HLHUkD
X-Received: by 2002:a05:6402:42c2:b0:697:b72e:b909 with SMTP id
 4fb4d7f45d1cf-69810af080fmr119797a12.28.1782406064192; Thu, 25 Jun 2026
 09:47:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260625104742.113803-1-l.scorcia@gmail.com> <20260625104742.113803-2-l.scorcia@gmail.com>
 <20260625-cameo-siamese-cd78c349519c@spud>
In-Reply-To: <20260625-cameo-siamese-cd78c349519c@spud>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Thu, 25 Jun 2026 18:47:32 +0200
X-Gm-Features: AVVi8CdQlZ_mmiW-bTGe4tmL6GeOR-G22Cpv-MM6leLml97_0sYg9x0t3Mjq9gg
Message-ID: <CAORyz2JHj7i6VhKom+tVd8PWBjM=TFhbr8-mOy3GH6eDYu4WPw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] dt-bindings: pinctrl: mt8516/mt8167: Move
 compatibles from mt66xx to mt6795
To: Conor Dooley <conor@kernel.org>
Cc: linux-mediatek@lists.infradead.org, Sean Wang <sean.wang@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_094746_582312_A56138BF 
X-CRM114-Status: GOOD (  17.29  )
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

Hi,

> I've not done a very through analysis, but this seems like a massive ABI
> break.
> The change you're trying to make here will mean that new kernels will
> not work with older devicetrees AFAICT.

Correct, that's the reason I sent it as an RFC (I mentioned this in
the cover letter). I am new to kernel work and I'm not sure how to
deal with this change. On one hand I am almost certain now that the
upstream driver has never been used in actual devices, since the older
code was only partially merged and also, as Sashiko correctly pointed
out in [1], it had serious errors when matched against the data sheet:

Sashiko:
> Does this configuration cause a regression in pin multiplexing across the SoC?
> The legacy driver used a 4-bit shift per pin to pack 5 pins per 32-bit
> register. By passing 3 as the width here, the framework calculates mode
> offsets using 3 bits per pin. This causes pinmux writes to align with
> the wrong bits and can overwrite the configurations of adjacent pins.

Data sheet here clearly shows 3 bits per pin are used to choose the
pin function.

On the other hand I know that breaking the ABI is a big no. But what
would be an appropriate solution? Maybe duplicating the driver with a
different name, something like mediatek,mt8167-pinctrl-v2? Is there
another driver I could have a look at to learn how to approach this
problem?
Sashiko also pointed out some other minor issues with the register
maps I already fixed locally after confirming with the data sheet, but
did not provide clues about how to solve the ABI breakage.

[1] https://sashiko.dev/#/message/20260625111629.6CD701F000E9%40smtp.kernel.org

Thank you for your time!
-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com

