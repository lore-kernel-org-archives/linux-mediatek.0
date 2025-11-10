Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 521A4CCF9E3
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Nov 2025 23:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K5qle7VxOWU8iKUzLYgzn6NH9G6XRkWvpzlofstrVjo=; b=btPODmkdswJuO9
	/lEER1Ye/WTx5990QEbocRDzRZ0mBZivlI6IcGf2L+C07gmj9QMoeS7Jj+QRjEj97BPg5fn+iyTCQ
	ddKc6aQoBHB30ERIP6g7ONM7jB698gRMSDlVrXepKlvsNrMkqEGyw7RUxzIrfLoEQtAyiYhynmFii
	fhWNYJabvAo4Gv7+4NViWRDcTkAcN5eH+XWjBDeqnGg7sgegtaZqud5+5dv5qddRYMrMfQA85849H
	+vKw3MbA2ttKWfHvMTLoZ3uF9n3Ym9HdqlnhwqLJ50DGil/8oS5QB8CLv2W1DTKaWMnmbEPq0htID
	bKZc02mos8MKMmazyb4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIauC-00000006EWW-2KSQ;
	Mon, 10 Nov 2025 23:02:36 +0000
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIau9-00000006EVn-2NBS
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Nov 2025 23:02:34 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-63e19642764so3041123d50.1
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Nov 2025 15:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762815752; x=1763420552; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K5qle7VxOWU8iKUzLYgzn6NH9G6XRkWvpzlofstrVjo=;
        b=f7LIjMaW8HAKmtEDuTqfZxnnm6ETeOg6wxiSM/7gGj6gfq6cI0XSyvt8gLDMya5YEV
         QsEdprCZeUGXZhQYn9JiRePk1HTrsgAiBdD7Lz7cO4OR4pSmr37oLeoQ84WPE27/GwcM
         XpGKlqNxe0uuIib9kOKGK4+pL23K8zl1U+MS0PC79J/Hat2ArDwAqqGVfP94MSCk7Eb6
         jPuaZf7ZJuHjX7YaJJKVFs0GxEQmuRycwuXsotPImdXuDPFQyiEyjV35t6J6GUIh9ZJ6
         gnG0HGCQG3vHuvO5sKfgiUXmnHe6/wsaF+oVWUpRiiJcsUc06lI1qTBo60lc0FeyYjk2
         THLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762815752; x=1763420552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K5qle7VxOWU8iKUzLYgzn6NH9G6XRkWvpzlofstrVjo=;
        b=vkqyzi6S4IiAHKcShkWF4cn9XlWVJC9YOyOXC9CAJ3nyy39u+05xozfmUe8U/hKSZb
         lgRLfMP1XhCkvHrYlolVZn8NF4SVJ9U8SLDW/CydQf1AGDQ1sdxT2YMRD8g2wDg6s80m
         J6orsJM8afPwrRf+7mX4wmc+aniCrjAY5gz0ZQ+RNSfAltUcuTJUcwNqxkOBg+bz7BCP
         /4lqXTgilLRZXoOcV7h70qrYPezhJFaRsKu9sNCYZ7N56SoJ6JD/baIdENEhgkPYHOju
         er17rRSAQ7x0reIgnMbSREx9viafstlXwJAAY/p8Hl/QwweJClsivEt5/D7Ypu9RvR/n
         CV4g==
X-Forwarded-Encrypted: i=1; AJvYcCU/KS424behDIw/lS6tG+EwxKIag4AACmA42bfDTNxzuhOsaXJXn90PAwSkemlwFRO0lwIVr6xzeIR7qzW8JQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw93JFS6LM+wGMuueLDw5voWq/ydZB5tsAYVWLjEgpAwcQnfB0D
	Rsna2V45Bsd+TpLIJEM78/kJxIgO+GnFfFT7ByrilNXJl1CNhpT+Xt79/wtx+ySvPtJ9Y11Y/We
	JJSdG24mcJOXuX1OKT3rMC1Dbd47qN88+NfArN8qoJg==
X-Gm-Gg: ASbGnctjiZPeHT4wLxD4rXEh7OpSwwx988KtiCULjnn2bOWFgALDiEbAhnY3S6QC0P6
	cfA4vKm1jSmdYTCLqYazUKL1T25hvXgwdn/k+Oq6TwmzUPClKdwledV+otB+sv9TF0AYzTlTx9S
	6dBjtSHdF2ClU2ziP60PdTdKtFHeqYoBT76+0YFL1T/7mPVUhPaHBQGdQPeKlUGfOKm6+mWl2oB
	pDg8k1563RBJaZ7IbuQnEs13qXSUZD0uZIiQ/dRfQCwlo3fywscjASus6gi
X-Google-Smtp-Source: AGHT+IH6NHwNRdzXaS+QmN+qfk8m2r/FZh8cnCLNpPmojXJfkBdWQ2u20ATg0QrVP2xgMhdnhTJVLjKCqz+f06cVvC8=
X-Received: by 2002:a05:690e:1508:b0:63f:b985:66b1 with SMTP id
 956f58d0204a3-640d443bb2fmr7893340d50.0.1762815752364; Mon, 10 Nov 2025
 15:02:32 -0800 (PST)
MIME-Version: 1.0
References: <20251027132817.212534-1-linux@fw-web.de> <20251027132817.212534-2-linux@fw-web.de>
In-Reply-To: <20251027132817.212534-2-linux@fw-web.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 11 Nov 2025 00:01:40 +0100
X-Gm-Features: AWmQ_bl6gy_kvbbOxsO0c9yQS8V5cJB9oHDprLAgoRQJdA1aIm3YFAnru5uFW8g
Message-ID: <CACRpkdYwh69JsvUGoG=SrYTBtgUCFxTUV4Pxo9aAHuDyMqbBdg@mail.gmail.com>
Subject: Re: [PATCH v1 1/6] dt-bindings: pinctrl: mt7988: allow gpio-hogs
To: Frank Wunderlich <linux@fw-web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_150233_610060_2C3E3FE6 
X-CRM114-Status: UNSURE (   7.37  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Oct 27, 2025 at 2:28=E2=80=AFPM Frank Wunderlich <linux@fw-web.de> =
wrote:

> From: Frank Wunderlich <frank-w@public-files.de>
>
> Allow gpio-hogs in pinctrl node for switching pcie on Bananapi R4 Pro.
>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

This patch applied to the pin control tree!

Yours,
Linus Walleij

