Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E70CA0FED
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Sep 2025 04:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KLKUHPIcRB0O4muuVCBP8C+yFYqPCsP1VfYmF9nYOvI=; b=YBAYzOR7V30h+SAu1K+L2no+q5
	fkLKDDkgCwD4Wf80rvlfEC/zusypmwtOCsfxYzI+Ygj5o13DsFcEMEZTK8XOogjQCiHE3OgGm4Wh+
	yBNIuvHxg7Xw1YMcUHOtjajcQdt1DT3fjBUqmz6VVFF1glPsqMeqwoKu5+w3NCxcngVCaodMxdyof
	GkBsiJ8u/dBx23Snz0cRK7iLJZqHvWCsMmhMsdY2Mhn8yNPeOK/pasM3flRkenet85tZdj+OXevkn
	z9kUiDV9jrhYE37jI6/vIYBUX7w3bwf5MCLeHKMI6TdufC0se0jxr2zba8p5WSsbjA0zx8v7xyfQI
	Vz047gMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuNm5-0000000GeKc-3XsW;
	Fri, 05 Sep 2025 04:10:09 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuNm3-0000000GeJH-1SbU
	for linux-mediatek@lists.infradead.org;
	Fri, 05 Sep 2025 04:10:08 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-55f6f7edf45so1731211e87.2
        for <linux-mediatek@lists.infradead.org>; Thu, 04 Sep 2025 21:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757045405; x=1757650205; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KLKUHPIcRB0O4muuVCBP8C+yFYqPCsP1VfYmF9nYOvI=;
        b=LxbLkjFeGp0kXGm+biVSgQVXYyM5JlrIhgy9Ixcr8NWFhnY3SAi7alKZFtl6Y++GYj
         IGmSbdIHLuSsI9GirVZSYoYN9KP4hMqYt1d0n+4NygL/loAoxDLo+wZHCBZYN3w4BZ/V
         WhpLaZ99bFD9ePzW4hJC2M9LxGvgMJ6BlTAYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757045405; x=1757650205;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KLKUHPIcRB0O4muuVCBP8C+yFYqPCsP1VfYmF9nYOvI=;
        b=jgWkFhJRaECSrgAGy3OTaRdBBxwkRHEEv5VLikOM0VhhON/6+czt12IdueLWkH6Pwh
         wbHexh7Rc3A1fINLRnnUtWWnkvgY2aXsEMHUSW6zwibybkQoq+9GwW9Z0MKq/yKpPo60
         kygEgCx/qY1fzuCAmnf0aUXXpMBOn43WscbGPHYOW89P1Dv6bZiwQzpZqpvcM2AZngoC
         uR5BgpyWFoLGYszZSJhViIZvvQtr1xhlXOoWP/UGfFeDa3+ya4DEl30MRDBOV1CYivy0
         fHGX8nAiyCEhVqutHRYgtMUMjTxTJ4StWysudcryVeqvx+FkVIm7Ijvfu5P21EaOvmxk
         NZkw==
X-Forwarded-Encrypted: i=1; AJvYcCUR0sCEg7++3+MUOMBOTxK8zYYaIhcfQBKKM+YFjonNpyoQkvVtHqv9IPbBnO5U9D9kt8sogtjVkP8Qw9qiHg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyyzu1rvVfuRAkz21DbMDP63/zyNIBz5O/wZ8mDX0wzHdIgR6Gn
	j8Z/BTgZRxQk2dmRS6P+V+5xku/yVaGMHq2x81K716aUFiIVRksWWV63FT2eUvYsIYsVrSjsQAa
	4xUJLwnTqnExnM+HEHaBmC7y5wWSrRlN+VmAX71WR
X-Gm-Gg: ASbGncvSRT6uiJyXZbpSUH+yCsuUjZndh0ke6L9nqtpESRd8U/nACP8GIomWQ3JdvDo
	BOUbepLyBNesXcKNeKsBYa4JADVeoZSfNeD1YQNQMdse97fTCZCJccH5QSwmzsLK+xFbUy9C1Tq
	QnfXLRTe/QNTZGCUdmngduYDlfDrIokYM3YIEiB/vuk/yQuyDNYHS/qy2dpLhnvtSKb4NqrvZLg
	d0yd6pmO2xfjgW2WbLC368ja5eh2wJPyehj4g==
X-Google-Smtp-Source: AGHT+IH7HKhnxC6o9ewQ28R2ZzX9RmDQokY2C+2i+wMjE8WlWqsz+BTU++rL/6Yzgiv59B7OTvBGnUhQzmndeoe72TQ=
X-Received: by 2002:a05:6512:650f:b0:55f:65f9:512e with SMTP id
 2adb3069b0e04-55f708a2a7fmr4251279e87.6.1757045405415; Thu, 04 Sep 2025
 21:10:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250829091913.131528-1-laura.nao@collabora.com> <20250829091913.131528-4-laura.nao@collabora.com>
In-Reply-To: <20250829091913.131528-4-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 5 Sep 2025 12:09:54 +0800
X-Gm-Features: Ac12FXx6pAx7CiAA-H5MAQbshXKRXROm_6MtHlpf5-g4LpJf9Fu8XFakXK69rOQ
Message-ID: <CAGXv+5ELv9vR7i_Xd7XCC7gBciMXPfQfDAD1WyNy89=pJaLC_w@mail.gmail.com>
Subject: Re: [PATCH v5 03/27] clk: mediatek: clk-mux: Add ops for mux gates
 with set/clr/upd and FENC
To: Laura Nao <laura.nao@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, p.zabel@pengutronix.de, 
	richardcochran@gmail.com, guangjie.song@mediatek.com, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	kernel@collabora.com, =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_211007_427276_1FA2FCB4 
X-CRM114-Status: UNSURE (   7.22  )
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

On Fri, Aug 29, 2025 at 5:20=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> MT8196 uses set/clr/upd registers for mux gate enable/disable control,
> along with a FENC bit to check the status. Add new set of mux gate
> clock operations with support for set/clr/upd and FENC status logic.
>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

