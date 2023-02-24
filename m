Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00BB1C64ED8
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 09:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=af4CYOZxGFEia2jFKISPbK0kpnOWXcsASd/qhVrqOvY=; b=s6TRDZGOLY5RfGBu+yf76j6dak
	uHMaYbq2JnNBLaAsphvCI/L/EdwxmYHH77l2Gx7JYzXPB6wYuvQx3u/BTbyNw8fTWaq2KybcU5yk8
	FH5iaGU7u//MNRn3eVfmhbEqWahwyw0Q9bAjHkCFTNmHwmByD5EP94GaEeEQLVd52QBG0d+FjGYe1
	rjpDAW/bPzlHevxuHMyb5ee9FBsXKjViLxWjb1qKGsvbcqmGL4RvIu1QCPlpVvHU0/MraKE5VVoLx
	HGnttEgGrqe+f/h/T+PQpcA/dQ8obfRPkoix4EPU/yihcc+ksKbqJVK4w67iShGEv8B9r8LTwcmy9
	GoAu36Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVUlz-001lrE-WE; Fri, 24 Feb 2023 09:53:52 +0000
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVUln-001lno-U1
	for linux-mediatek@lists.infradead.org; Fri, 24 Feb 2023 09:53:41 +0000
Received: by mail-vs1-xe33.google.com with SMTP id f13so16596224vsg.6
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Feb 2023 01:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=af4CYOZxGFEia2jFKISPbK0kpnOWXcsASd/qhVrqOvY=;
        b=a/BAa2AE8nY37LlE/Wvo0GMH81qnhvvJ4hkf4UwojYj7HWDi1KSJI7tFXozFbi4bri
         z0/CfyVurxEsbDgYeBDGU7IYtluwW4zbOgzCRdMnWF4RizdiUaEqpbiJm/xtmOr630So
         pOcPJ6MK6D1hkzidJhmEe8VHr/hqOn+dc/y+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=af4CYOZxGFEia2jFKISPbK0kpnOWXcsASd/qhVrqOvY=;
        b=hbRPV/U3nHsRVUQgHwddyU3T4w7KH8ULJOOhT/vN7Og9q0KNnEo+VAUsZ4TWuN6qbJ
         Wr0BLTQleGCWaIcKxslkCKSTPwki0vyfurCxtUONrLUjp/2ed08BomW6JM8Uu/1Pc/mi
         DFiipyFMd/4FhuVTpvsdpepISl+dx6dTuqqWsPoXeOVCHtFZQePfVar0GfnMlEVAKi2B
         vb0STv1m3TP0JlFePT1tGaBbt7FVJessZB/EZI7wM0e1Tray9ngyTCHcO2KCriNiS18I
         AArW3ylYDNHZEVg3mM0Hztn6d1ggzT4NpNLvQEYY2QUoZ2hDTIxW5eltlShuWylFjXwO
         D4JQ==
X-Gm-Message-State: AO0yUKWMnPaJy5QAW1wxOB5KX3pxdJaSpCs/U8LlkVE1Zpq4bseDnIGw
	qBjc2xq9Uc5HTjuW2JQikf0Xg9V77KpJsfjb0iTdMw==
X-Google-Smtp-Source: AK7set+KvF/SzOSrOq2zhkOe2oGFapubF4kOTt85lB+h7aclUTKhE3m2QERgreU6P9Zm6e3LDGw+xzWKT5klfU2qjGs=
X-Received: by 2002:a1f:bf16:0:b0:413:1498:e843 with SMTP id
 p22-20020a1fbf16000000b004131498e843mr1876592vkf.0.1677232418756; Fri, 24 Feb
 2023 01:53:38 -0800 (PST)
MIME-Version: 1.0
References: <20230223134345.82625-1-angelogioacchino.delregno@collabora.com>
 <20230223134345.82625-5-angelogioacchino.delregno@collabora.com> <CAGXv+5Eh62NFNW1T7PYiQe+9KD8qX2WB7M3rwrYD=ca872y3WQ@mail.gmail.com>
In-Reply-To: <CAGXv+5Eh62NFNW1T7PYiQe+9KD8qX2WB7M3rwrYD=ca872y3WQ@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 24 Feb 2023 17:53:27 +0800
Message-ID: <CAGXv+5Ehm0yb+52m+DL8s99KqBqx7skPZ2xfMFMYVJ23CDsfHQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/16] arm64: dts: mt8183-pumpkin: Couple VGPU and
 VSRAM_GPU regulators
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_015340_009530_B9B638BA 
X-CRM114-Status: UNSURE (   9.04  )
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

On Fri, Feb 24, 2023 at 5:51 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> On Thu, Feb 23, 2023 at 9:43 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> >
> > Add coupling for these regulators, as they have a strict voltage output
> > relation to satisfy in order to ensure GPU stable operation.
> >
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Actually, maybe you should override the constraints here as well.

