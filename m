Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5587AD2503F
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jan 2026 07:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hjNXZzrzNnHd8WwXKi+KrrJ2wsOnxzoEVWlzPqz8Jso=; b=oDErMZgHmdKAteUlt7H1lQa5/+
	ekFsFPb5xEcbNjAq7PNoLDVuDGJslrYqn9jU7YmD9ZOsaW9bqeFoAzFjOOG+O4CX1yhxt1zYVCM5q
	90iH+F+EBvIOsx0VbyosSHJ367TJfcfE+ARyDMcmEwkhM5cyZazOoX1YOeUiVktSRO5VHCgy1u3Dh
	GNgnCtGoYM5UuE+YZb5Hq6L9/ZwmzWfJnfPIkhIFJqVk0wyb/RCP1wPi1g9Ryt2VY4MTX+D6PpGQF
	e+SUeby1Gc9B6lBNgSdOEEVf7ZbzNIOgvZhqQ5yw4h847p4TjxpJwQ57ZXv3zNlGW2DgibM1jz+kQ
	CpaWY2yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCKt-00000004sSh-1Fzv;
	Mon, 12 Jan 2026 07:27:35 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCKr-00000004sRN-1wkM
	for linux-mediatek@lists.infradead.org;
	Mon, 12 Jan 2026 07:27:34 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-59b679cff1fso4833408e87.0
        for <linux-mediatek@lists.infradead.org>; Sun, 11 Jan 2026 23:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768202851; x=1768807651; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hjNXZzrzNnHd8WwXKi+KrrJ2wsOnxzoEVWlzPqz8Jso=;
        b=ILCGU4lk7Z0cBofRfUY+or+ogDz8uP2ip7//vwIZ9z14I14FJg/TZsXk81WKE0VmfD
         lYX5vbX9Bb1Dqvif3DNRKe9u2pe0MPc9w2CE2Rc/hRq6LTDGdacfNleIKXd/2pdSLnHt
         eMtVDOBu49ly3r/kooh4YPy7Mc+M/1qzSPQGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768202851; x=1768807651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hjNXZzrzNnHd8WwXKi+KrrJ2wsOnxzoEVWlzPqz8Jso=;
        b=iQZi0H6rMJP5Qg4af5IWcwIomOMZDWNKQYjFFK39Z3i3CTRzgC0aGF8dqQNQt3bYV5
         jjTDkSrHyMW9ThQiNvtEgoPdEMd9qIPNDzlF2Po0+ibHKSu/ZxCTJDL+ubAhSwLnEp86
         nxGVLiGKD0iza+3+fZpg46QMme/eT3m6HJdKVO3qAtRCL6hSi4c7d0kDgWdHHyzgv5l6
         TFKK5buf9huXPUlztakZ2ml4bgPwibU0kVkk6d27fPoUja2aQvdhBpM+Y3ABECSd+iYX
         LDBXOaiVIBI1S3X/yPCwjalVKJKK/NJL5Gy5OlD9kLywdS6RS5epYqVwMnUd/MktS5IN
         tXEQ==
X-Gm-Message-State: AOJu0YwWr0ta23D3CSI0SXcHD+tVb12F/Hv2EugTBFqbcYkaCRQH2hjX
	ALgKJIJTmyk9ZyeJ02HaPMUKXc7llX105crS8eYUsUkIeovvLChHVS5fjWnnqiiEPhEoAdQZlTo
	ryo0V44/RdfIL6VXnPTGLtvMjK5sXNmr5ez4mdsw9
X-Gm-Gg: AY/fxX4Y5z3aAa2MmKEsMX//M6Lb2CDPCyuMXJsfQKFCHkOoEJlJiUZDzDO/7j2JsQR
	ht5jtlfhEZ5Gk7D+VQP41dOxdIc9+2gEkvzmOmaHj19nZUn3ly19rYJicpV7PSiEOTxUU1tXjSr
	QuRaUmChs3iLiZWTLSavIHul5sZvKQur5MTEPuyywaxd1JyPWADrIjsuPZMpNrwwV+V3wRgGCv0
	rIpkSDRzRO2Dh02ljOYZSD5069IMpNDZPE8fuDk6DxIof8ajM3X9Ib4u9xbh7tGbVHWnubaRcF3
	cG0hV+LSNV4LbM+KYhwcjIgu
X-Google-Smtp-Source: AGHT+IFDiJ4ikKcCwIxZX4SezU35LBnUxDwbkGK9Em2aOhPxq3XtpkeM0bppBuO5WEJf5CT7uQpxTxcD+yOpL8T7LO8=
X-Received: by 2002:a05:6512:3a83:b0:598:ee60:8af1 with SMTP id
 2adb3069b0e04-59b6ef04a41mr5556612e87.15.1768202851300; Sun, 11 Jan 2026
 23:27:31 -0800 (PST)
MIME-Version: 1.0
References: <20260109114747.37189-1-angelogioacchino.delregno@collabora.com> <20260109114747.37189-8-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260109114747.37189-8-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 12 Jan 2026 15:27:19 +0800
X-Gm-Features: AZwV_Qior6rX0_9acmsyDt7cjn3RepUbmW4kOBhOOEjHOmhFq4_xiNmMvJriwDA
Message-ID: <CAGXv+5GxHgdLc=VibTi4+q8uyk+hqBQAqxfyz3NnBtCFbj9urQ@mail.gmail.com>
Subject: Re: [PATCH 07/11] arm64: dts: mediatek: mt8173-elm: Fix bluetooth
 node name and reorder
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, sjoerd@collabora.com, 
	hsinyi@chromium.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_232733_511750_0FC30BB7 
X-CRM114-Status: UNSURE (   9.19  )
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

On Fri, Jan 9, 2026 at 7:48=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Change the node name for Marvell SD8897 SDIO Bluetooth from
> `btmrvl@2` to `bluetooth@2` to fix a dtbs_check warning.
>
> While at it, also change the WiFi one from `mwifiex@1" to a
> generic "wifi@1" and reorder the nodes so that wifi@1 comes
> before bluetooth@2.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

