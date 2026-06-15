Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8922BCD98C5
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jun 2026 17:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cr21gZwUWq9jfHVaUeu1Ubez84cqLx99H1U3aLVfnCI=; b=xo8+jAyAPNFeS+9lq1tO80lhmt
	lpXJ3daj2jwJ2xHsho1caef7PalZy4kGlkK22bQ30ftOS/LLtKiMq0kPddpa+wk4QJnsdJp+mGmwi
	qn/48yCAQ6ckCESYAQq9xdkaUf6lmhdSH53+BG25s4akkXjVzoD5lToTlVGlKM79gAv7+q1lX0MQw
	Fbrvz8xKD8gN1BA2WEYZWrkvOOFIhSnJ6z9d/TQ4vo2XIqKIC8jeKWFw8sP50o+6ZvAvlDVYMQTQj
	OxsfJ14UedJ/JIZUvUzeHleWFhgLFI+CMsSkyoLGiLnxCDp49qW8xYOKuDcu1bhEgmI0G3kYIePuY
	7qS8sLyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZAou-0000000Ecyn-0jOz;
	Mon, 15 Jun 2026 17:09:56 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZAor-0000000Ecxl-0ZnV
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Jun 2026 17:09:54 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-bec449d0af2so429756766b.2
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Jun 2026 10:09:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781543391; cv=none;
        d=google.com; s=arc-20240605;
        b=aHTkxRlItOhm58SMupaTcRZfUdErI6+010QaqpmTjEBkJldW2TbMoRtH/mpfagmzzM
         Zc7ckZtYnnOZiw6cMa/UaEmm7gZiglWGT4ZO7qjiNlV86AoTaTPH+9v5lSxbEvLaW7/s
         6QSh61k+zv4Mvs01Q511nza6imZ3TCRX3sM1TTG03r8BZo8SVxfE2aN4kPwph7/mPF5w
         Ojxvk2Aed6rbuvQZgKoUUGNfzd9RCcI0NcUJMAP4MxLWw5NY9e57/8FR/r77+Y3VuaUC
         SoCpKdlAOgtnaDckqXITiVzZZ7wu3FC0Ji3s+pOpsrO6GJ+cmpIJ0BI0uNMY5f0gEmP2
         cjIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Cr21gZwUWq9jfHVaUeu1Ubez84cqLx99H1U3aLVfnCI=;
        fh=LABVqMblkPA3hwSStZzJxgAc/1b0cT55f8QxFH0PCOE=;
        b=l2YeT7UaBMH+IkzpniRmD4pHjqTsDIsbmLebgyc2qgFyozBzw5EitVomKYZR7hVtWC
         L3vcW02qYFPVwzzeoX8/YQTPsJGx/jnL/rA7xjzEi44Twavd4qqw/ILxFRAmND7ybQdW
         poLfvfS24du2F2nOb457an+IKqSjTHZNJuEIQ8iHganIYI0XLeSBS2jVXTs3ULwpZvv6
         w/et8DTFtYFB4kM3HSEX5GnceNZ2POgtI0xR78Y0AzAmTxVgQfujs7oUgpJHbH+Wvzt9
         k6qoWWH0F2+aNZRpYdC3EFKa6tR9Q04b161K6E/iN9apQ+c5Rv9BDsKFB3MdUIhW7vQA
         XMrA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781543391; x=1782148191; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Cr21gZwUWq9jfHVaUeu1Ubez84cqLx99H1U3aLVfnCI=;
        b=paS1r+rIS6x7k5XuwuMP6x8OglWqB75bpNhzwdXcU36jhS8rSVyJ7K20fEO9KSI6jT
         p8M7xOaRXLqCxTc1NzkSfpq4M5lLBsKy7qZIalljgTSuxEUynzNwjaFTl+h3yfFzCiHo
         72cbSELTRDFDmFCBG+Zf2mIoWyQQCbygnlyMZNQmJoqnTzxcykX9dK9maX7KZ/ddnGQN
         iUKTHzPsTJpZ8qZ2HbNFh1uScGYawjWPuQ8gRYFnuKbGzLC9ztDFejF4+0TwTAHkqR49
         +TGJ5GkLFeprZloXyl1bvPcK+xuZYa0B5eIKAV24tJaUZI1j9V+zVvyKzfiis1RabHmf
         FcJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781543391; x=1782148191;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cr21gZwUWq9jfHVaUeu1Ubez84cqLx99H1U3aLVfnCI=;
        b=NtCufF5xdNZ6lUGj7y8Wa2nzLWGItaMB7uT0zqvb13jfgweiaeQZ2cEBDVkXmnUkFK
         90T6wxxEw3iSNM/NsDG+DLOiRjSvxZpLmYVxM6g8vg1nNOmcaVZ2Gy9rumRZABIszKa1
         c6SFuD4TWkRH4SA4qEP/zvgBrFmBDjhG+o2cSfsPXlYCPStRuPZzGEpAzcxq1KUT03d5
         UDZLaBVG9lM8Sje3BY9fIv7keKxcw8hJp1bypo2gZ0xoPfhNmTvde3yNf7YFAWuaZ4rS
         GFBzodVx9tB/UGXBzxhJk4RjiTZKo0AeIouquN7TTWFHdBoX28Ds3H75oNsfta0qSRA9
         Ec5A==
X-Gm-Message-State: AOJu0YzOqR9H9tVkNRsq710fKAboW/SV5xkNIU+cdvUVPC59H1+HmDba
	73WAFWsXmfSnDhqLlHRuKgiXe4GZU24v1be1xMaNatvsaUAXYoaZXffn+Efa3ZpEhAFxwZYgfMU
	vZc8dkwoL7ZTFxB2+WsigcouFfkDf6uE=
X-Gm-Gg: Acq92OE1njgC5dmTt8IWDH1UgcFyapSE/XgdCi45emGA27Rv9Jr+3B41e9/G85ZUFnz
	a2O6a9NwzDOnR5axMuEtpisD3MF7rFCMzsf63gwD51PvP1yi4DEUjclCEGyWAHHahBgggNA4Rqc
	p/2E7MkuYFjPNC76LPOcH+shUSB/1OxrJor2ehxS6jD9nX46XPlSrlHi97iGdjOBm7cOoj9nyTn
	j87KdAG1clxMqo1MtFS+L1sOIAxHRoM59fPXmtIKIDDngfXGeNzh8m8SHQg+06NjOZ33e9XzkSW
	5PspxE2UXe21kYqU
X-Received: by 2002:a17:907:3f8d:b0:bed:2a8b:3e73 with SMTP id
 a640c23a62f3a-bff4cddd831mr594131266b.41.1781543390991; Mon, 15 Jun 2026
 10:09:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260612200717.361018-1-l.scorcia@gmail.com> <20260612200717.361018-2-l.scorcia@gmail.com>
 <20260615-palatable-aerobics-3091229b6ada@spud>
In-Reply-To: <20260615-palatable-aerobics-3091229b6ada@spud>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Mon, 15 Jun 2026 19:09:39 +0200
X-Gm-Features: AVVi8CcgapzCFj6cwsB094FQLtSSMmdLrOP26pKMcjV8D9cFGpyiqQvrj10_jjw
Message-ID: <CAORyz2+4EquYcUHEnoq0N_p7vCmDpPONEhVrmAfO1eX_RNMYbQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/7] dt-bindings: mfd: mt6397: Add MT6392 PMIC
To: Conor Dooley <conor@kernel.org>
Cc: linux-mediatek@lists.infradead.org, Fabien Parent <parent.f@gmail.com>, 
	Val Packett <val@packett.cool>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Linus Walleij <linusw@kernel.org>, 
	Julien Massot <julien.massot@collabora.com>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, Akari Tsuyukusa <akkun11.open@gmail.com>, 
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_100953_184023_79A5B3B4 
X-CRM114-Status: GOOD (  10.62  )
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
yes, sorry about that, series v6 has been superseded by v7 (I replied
to the thread and marked it as archived in patchwork, please let me
know if I have to do something else to mark it as obsolete).
Sashiko was correct, the regulators node is required for this device.

Sashiko also has suggestions for v7, a few pre existing issues and a
few nits here and there but some are actual improvements. One bit that
caught my eye is the use of the modeset register in the
mt6392_ldo_get_mode function. I have to double check that with the
data sheet and the android kernel sources. Not sure if I can do that
before next week though.

Is there any way I can trigger a Sashiko review before sending patches
to the ML?

Thank you,
Luca

