Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10A7FC021AA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Feb 2025 07:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o0ZVQ1Yg5DGbJ5wB18BjpWZFp5JxkdPvBDEOYEmNAZQ=; b=Lps107HXIw2VdtLlD7TeBGkFuU
	GnI5hSWEv0gsggPix/O0SU7Xf/aowUtpUQvgpo11ibU8KxTR5GulIR7Mh+nE8ziGQnUPFAm2rl39d
	siqwVhI9UMH1fiJzPSnHvOuAqnh3s6Rq+TV/f07kkyKD42jS4K7IHYwgkjG+uXb/U6iLlRlGjKBgn
	BuEdS3LTO3xo5hkKoH3PoALqNlD6POUI+ZB8EZ4ghzABq/e1OAIBmxmrN7w1jrjyrMwFq6EJHYCxD
	pxg1SAf9hNydloAsUF0+nXGqauW8Kt+u3ti27lDLMmgQE7f6bM+w90kF/76FuZlKld3qCWMW1jt9z
	LyD7TVkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkev2-0000000BMAJ-0mrl;
	Wed, 19 Feb 2025 07:54:56 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tketY-0000000BLsQ-1knk
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Feb 2025 07:53:25 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-5452ed5b5b2so4576731e87.0
        for <linux-mediatek@lists.infradead.org>; Tue, 18 Feb 2025 23:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739951602; x=1740556402; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o0ZVQ1Yg5DGbJ5wB18BjpWZFp5JxkdPvBDEOYEmNAZQ=;
        b=aKiCyXZB3boqzet5czld5K7N7Ij+IX3PVD0vciadIB5AKcOUV3R33HHzuliUlJ6pDS
         omrW7na2gpJZKQEtlflVl4d2w4jRAeI2tq7T0Ojz6pgVPtLKcVpwhVyqIlX3Ljlmq6xx
         WqgyGVPKWliOnAT+GGIlHE2bKNOl0NakjZLDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739951602; x=1740556402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o0ZVQ1Yg5DGbJ5wB18BjpWZFp5JxkdPvBDEOYEmNAZQ=;
        b=uaQFtuoE8Lyl6u95PtGs0AdGh8yDtCYVRGc89Cpe4anpCixvu+fxF+u+HjYtCwbbx0
         boTTa+1UkWqdLROyOmkB74rDme+tzbf9R4zkfPq1t/lvvmk3hXD6R/FwYPB/u1Shnh2d
         EEexUUiKX7EVj+eg8vo4hMe2qx5Dh3pNi+ia4+kWSwkX3tnZIu6fqqgxrsN5nKHl1UDt
         OpK4OA2OpubyQUJErzQxyOSQVb+QW7nCgJS1cOP2xntEF/BLpXTTDDN1bWoYveWcxwnZ
         0Uzz+cIplHxbYrm1HiBbjKFQ7hCekE62yB3NTuJbPtA2GDfnHKy7UNgjKZN+IKBGa7bc
         o4yQ==
X-Forwarded-Encrypted: i=1; AJvYcCVamyZWfBgSkS0bN8eePQnQcuAjewKn1UNKe0Rfwwp4zv2mDMJ2/wTd4GoNXJdiXC2IJ+ypSMXvwgxyZWYaeQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YywMayoCAaNn9hTePrPi+PxvG/LKYmNrB3fLxLp/tb1cgNfADh8
	QuhDoClzqxQxiNx5LH3PFx0f7OlNwapM/9K2JJMNNjANjeGy5EyuVAOXEUYBcm1Lz4MyM5bpBrF
	ZZzmwvs6YXtEMZKgxRSX5idq2rt2xzVe905Mz
X-Gm-Gg: ASbGncualucFFlSgCqsGRE3DvIQg1K6iElNgx3TMF9mcDm+Ozr55BCvz+SfQjB5aK9D
	xKX1iCR7XDqzsaiTO7iSma41duRL7P6Ta2ahkS3tbQQ1/3ZD1TMdimERwf7uJy4LRzUspj7WM4c
	IBZGXY9X4iCxJsTlJx/SArOvrc
X-Google-Smtp-Source: AGHT+IGy4VRhutR0vRN13zFXFDojHsEJuy46LrrJBV/lkfpvoUaq2PR47QMvQ2pB0zIzS5cf5qZ8oAPqBxANqsj6Ktk=
X-Received: by 2002:a05:6512:ba6:b0:545:22fe:616f with SMTP id
 2adb3069b0e04-5452fe45d87mr6468841e87.24.1739951602616; Tue, 18 Feb 2025
 23:53:22 -0800 (PST)
MIME-Version: 1.0
References: <20250125025145.14405-1-ot_chhao.chang@mediatek.com> <20250125025145.14405-3-ot_chhao.chang@mediatek.com>
In-Reply-To: <20250125025145.14405-3-ot_chhao.chang@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 19 Feb 2025 15:53:11 +0800
X-Gm-Features: AWEUYZlvGLuYzddD01vTxGm9KhUE8PoFe7dSks8I_T3Q6YOVZu9GJJUxvzhxQB4
Message-ID: <CAGXv+5HLmmNV9WZFjOoJdLQNvEW6-FVdgCDrgv2LCoYUrd2Bsw@mail.gmail.com>
Subject: Re: [RESEND v3 2/2] pinctrl: mediatek: adapt to multi-base design
To: Hao Chang <ot_chhao.chang@mediatek.com>
Cc: Sean Wang <seann.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wenbin Mei <wenbin.mei@mediatek.com>, Axe Yang <axe.yang@mediatek.com>, 
	Qingliang Li <qingliang.li@mediatek.com>, Hanks Chen <hanks.chen@mediatek.com>, 
	Chunhui Li <chunhui.li@mediatek.com>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_235324_473124_D1C87604 
X-CRM114-Status: UNSURE (   7.49  )
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

On Sat, Jan 25, 2025 at 10:55=E2=80=AFAM Hao Chang <ot_chhao.chang@mediatek=
.com> wrote:
>
> The eint num will obtain the operation address through pins.
> Change the traversal method of irq handle from traversing a set of
> registers to traversing one by one.

The change only covers "eint", so please adjust the patch subject prefix
to "pinctrl: mediatek: eint: ...".

> Change-Id: I3962b78042d32501a73153201cddf52c6b62a695

Please remove the Change-Id when posting the patch.

ChenYu

