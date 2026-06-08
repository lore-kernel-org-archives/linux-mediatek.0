Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9492ACD8C9D
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jun 2026 14:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MOa88SxjOKsDcxBM1x1qf03zZlmO3uexj6iAoLQ40Ak=; b=0l0eZT1LV0MsT8Z7tv09CyJHRP
	rZVs5IlkRhQzNPQ7bEtwxOM3KAA4jWMmdZ6hIC1RSIdfyeKtgkBP+EjpUSIdzcjGiPX6dvXNHYeA0
	SAxTs3KE6KBWdzm2TMdWT3zcdb0mwvsNiSSb53/uzmKfk+y4pqtO2o213X7+3RT5FnH2yIP5W5+Sw
	rkSE4W4c+tu7CXnkrukHA72P6mlp74pnjCBDKQyq+IqV/1AtpSaritMTCrcbX+2rPnFzzxHcXX+fS
	gOqLjpBADlXLjIWRqZV8r71FfFfZw+4sZux/97TeIEJmA+Tx5jEnWxKRJjPdMV26zIDlEFCndvOCU
	L/I94g9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbHh-00000003rMo-2bet;
	Mon, 08 Jun 2026 14:49:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbHf-00000003rM9-49UP
	for linux-mediatek@lists.infradead.org;
	Mon, 08 Jun 2026 14:49:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 707F9601FC
	for <linux-mediatek@lists.infradead.org>; Mon,  8 Jun 2026 14:48:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25B731F008A0
	for <linux-mediatek@lists.infradead.org>; Mon,  8 Jun 2026 14:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780930139;
	bh=MOa88SxjOKsDcxBM1x1qf03zZlmO3uexj6iAoLQ40Ak=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Cho9weIglofwCTFPqholTctD0YJ5WjWSAIjPHolLggvT8hW8NCwrShNfE8xntZd5X
	 xzhAY2Cv5KAJZSCpTetious5RYbaNa1zVzQYzLULsauY6PwDTNLvic3ngCYMe+UZHk
	 IJvOQ3uqzOzRFbb3hMQ0dFXBABq77VqYnW3GYsRibopj0O8iE+650WQCN8y0QxHMfG
	 sesAYViO3O3+j61OW0lbYvAUABpOuKpARGpMh6lUqhrCN+cG68A9WWlFUXxjMuwhHQ
	 1ZCGDfrRvrY/XJScpL9XTHthV9jomkLcldJAX5zKKvSMbZsKVs6QwspXvAV7eLqq69
	 bPqIrqVGzsdKQ==
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-137ec563a95so5268883c88.0
        for <linux-mediatek@lists.infradead.org>; Mon, 08 Jun 2026 07:48:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8QfgMf0Doc1e5dzgzM0s21F74bwLbDTwHhJE+ZTXBUS7QJtklhe4xjjXXc7VCbNcanJ9QhCVKyaUm9kdxe8w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzBv+bh0S9W12lAd6N2soxdDIysmBziRYqeY9yiWCqhs11NB9IL
	9YtzB6/xk/3AH/HGKehXoL3mbRGYEj2RTgygKVWh32wThntS9pjDB/XUb4E3NiFFnOrdTCy++6p
	jVRpA8mIQnVb4DPQnkf7uFKwNOGej2VuuhpcI+oF1Rw==
X-Received: by 2002:a05:7022:60a0:b0:137:90d5:9530 with SMTP id
 a92af1059eb24-138067241e4mr7386691c88.36.1780930138605; Mon, 08 Jun 2026
 07:48:58 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 07:48:53 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 07:48:53 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260607001654.1439480-3-mikhail.kshevetskiy@iopsys.eu>
MIME-Version: 1.0
References: <20260607001654.1439480-1-mikhail.kshevetskiy@iopsys.eu> <20260607001654.1439480-3-mikhail.kshevetskiy@iopsys.eu>
Date: Mon, 8 Jun 2026 07:48:53 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfZp=X9SgEQ7zVtFVBy+akzmX7G-8d+HbjP6uiJjo2VTw@mail.gmail.com>
X-Gm-Features: AVVi8CcgfBZvM7zQoT-kfXLyQwfvhcRHrvvZ5dE9sWyMbehP1eCvnbJHHVQktnI
Message-ID: <CAMRc=MfZp=X9SgEQ7zVtFVBy+akzmX7G-8d+HbjP6uiJjo2VTw@mail.gmail.com>
Subject: Re: [PATCH 02/18] pinctrl: airoha: an7583: add missed gpio32 pin group
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Linus Walleij <linusw@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Christian Marangi <ansuelsmth@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, 
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>, Markus Gothe <markus.gothe@genexis.eu>
Content-Type: text/plain; charset="UTF-8"
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

On Sun, 7 Jun 2026 02:16:38 +0200, Mikhail Kshevetskiy
<mikhail.kshevetskiy@iopsys.eu> said:
> gpio32 pin group is missed for an7583 SoC. This patch add it.
>
> Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

