Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3021FC76196
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Mar 2023 13:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OpdRkM3R0JQlVYGauxzADNJOFLfabEXJ53niUWlHTGk=; b=pjpAWs+BG+Q7Ww
	H7ca+UMZetizz1jOYz3Zf8eEDzb60ks15j2lREu+nPfUSwtl2wHPcN89fJIg1SWg7TDaB4kWLaTW0
	kayO7YevlN2yZH4D8OQwZrI8pI8BR6Rfqk8jQzejhNHG5RZCDk3C1jXM30xhQY1kf7lti2jTcpGc8
	ZLCvH7KIt23xp36xrDc4oOyJR/S1Jw0Sm159u9efgueHq8bVn5XlHACERDbwi8lSMmXX7WyDcSYBj
	YT6mcDdMh1buVUbJleHTFtkDcc0UNx/wsuty8pCni47nBTvs86UUoQyIY5QtN6okUqUtPPEz5lvEe
	3PPXL8LOHWQQ/iCSlveg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph92v-00EUke-20;
	Tue, 28 Mar 2023 13:07:29 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph92p-00EUiW-32
	for linux-mediatek@lists.infradead.org;
	Tue, 28 Mar 2023 13:07:28 +0000
Received: by mail-wm1-x32f.google.com with SMTP id l8-20020a05600c1d0800b003ef6708bbf6so5346637wms.5
        for <linux-mediatek@lists.infradead.org>; Tue, 28 Mar 2023 06:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680008842;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OpdRkM3R0JQlVYGauxzADNJOFLfabEXJ53niUWlHTGk=;
        b=rn8cYKKWZlUX64DaNwMePTuIwr6mLJ3k/hyunrzYft7lUDnUW9ReRXtsYa6ndZNT47
         20r7av+3YF0zNRK1UJ3b5ZtJpOdBPLsq8hUldQDhNIqjJGEfRb+XDE9yUP4wROQgpGKG
         nFzUriXQV5to0GarhtS7zKRy/TYCz7ffW7j/wptei4/X0Ln1W5Mi4KE6N3+M0uuYrXIP
         h31phkBc3kTghA16/bG37haFRbufTEbmmukmmoPlnYNtLMc4rCoHTeH5c0NyxPY1EjzF
         1URDfW5djEh6Qwmdu0yLW1gZAlwaXbidH4xGilNQMYHBqJ2TE55pR/QVR4R/0foThzBd
         VNJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680008842;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OpdRkM3R0JQlVYGauxzADNJOFLfabEXJ53niUWlHTGk=;
        b=qEtHt/zQscIHFL0j9u4duMdV0hmp11M00X8EVfubh/s1rehWvTbYFfxypqG/yIAeYe
         hxdpt/eKGxTSjUw2/ldNNA5fZTu968Gx6QAXPuJ4FzCt9wiWpqqt8J7TocnfocydSfjI
         TRcZmZIvb/IjEQ+Pp+bdcevz0ayLRyZ51kdpzWA3hDgnQ/OneYiOdeqa2B/E9Ys8iBBM
         j91TVGCviI7gL0P278bwQml9O4FEFZWTj/9L+4vIaYF4QMyoN4jev19fA7lh4a2hRxej
         1ALO4LrH8Xr0uHteLrE0l4Xe6YDmGHZq5VkDcQe72gxSLbcFejjvC8XWX1rT4R7rZYDs
         xDKQ==
X-Gm-Message-State: AO0yUKV7afqeiZGeh+RuWgwWMLEGiujZ6x9ZcimYJp0YW+9e1RMj+a98
	UFR/nHnS78Urkw7ht9yOuMLswg==
X-Google-Smtp-Source: AK7set+PAOVrphLG3TzOJnmPrwVbTDuKV5by80RyF/I58ryqteQWWMVyEVY/9Qr6DV1yoLlDgB1l7w==
X-Received: by 2002:a1c:7703:0:b0:3ed:3268:5f35 with SMTP id t3-20020a1c7703000000b003ed32685f35mr12171344wmi.18.1680008842420;
        Tue, 28 Mar 2023 06:07:22 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id z6-20020a05600c0a0600b003ee6aa4e6a9sm12733650wmp.5.2023.03.28.06.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 06:07:22 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH 0/2] Cleanup Mediatek pinctrl device tree binding
Date: Tue, 28 Mar 2023 15:06:31 +0200
Message-Id: <20230327-cleanup-pinctrl-binding-v1-0-b695e32e4f2e@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFfmImQC/3WOQQ6DIBAAv2I4d4tCS4lfaXoAXHQTuxJQ08T49
 2rvPc5hJrOJgpmwiLbaRMaVCk18QHOpRBgc9wjUHSxUrXSt1QPCiI6XBIk4zHkET9wR92Brc3M
 2Wh+NFYftXUHw2XEYTn9JcjVXDTk0cp4SBfmerTZ3+ad3JlLGSJ/f3PO1718Qh3DorAAAAA==
To: Linus Walleij <linus.walleij@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Zhiyong Tao <zhiyong.tao@mediatek.com>, 
 =?utf-8?q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1142; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=4nMN7tX1HIYk8GXeEmFaDGFsrli+O0c5eDh/c1JgHw0=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkIuaJbgyBcMCGFgwrsQKRqQ5kkKVAFy/3/3tCgver
 P4J7pd+JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZCLmiQAKCRArRkmdfjHURfjuD/
 93rRLDRJBC05EsNk/H1hRUWIUYd7Vg5EhiyaDmZe1DmmA5RLrgiT8Y9mrpBq9a5AMG1ktH/jSwJ2sb
 jvSgdCqqUZtfDhcJP9TFjmwjEvzkKQbVTTToWStTljuTpuEO770Y/wzhKPsowuQyw86zgOWSkBlkkQ
 8gPSL5i62H9iUBbq9eOhI9cr1O2RDuhXLKqEfICVyODg9SrV5yTq+OEZAWOGAQ1t+aKXHo91Fe1pb8
 hClK/e6oOF1qLMjXsyr7ktU5Auq1qWYpT7dKCq0CGpYq25vAeAokPkNt+0RQkaGCeunecn9AyCDoiy
 Nj0hisZBCM1/Y7Kf22WPGugJyIif5VKghvK2i1Hu912PoNRyRn/AtgUpRL8HhJf7GwKt1JcMuNpfZG
 DL+1xOkUbZKlJHRvf/OimdwM2oCxctYQb8JpwxDjGHHYEnlSGHr0ZDfdTIuARbMTYq4Mrnpe3Xu3Tb
 YeUOgDbhmYSZxodPp80gtfCFIUDhVZV6Ug8IS9/gmpjbaD9tNAdBik6KwAnruEy2p7yf4AneuX1Eha
 fUegukwv8n7LZUs0X4ilCLejylrDITaR02S7v6TNBuOhVWy4kW5O7pL01Dszd/ymfVuHMnseiHnh6D
 4BdrJUeJ/hXDYiJB9gdXpVzmhqlJ5Kh9cgdlrpgxV5Ghm39wfdvbBVobshbw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_060723_983472_3F72F73D 
X-CRM114-Status: UNSURE (   8.03  )
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

Deprecate properties which shall not exist, leaked upstream from downstream
kernels, there's no reason to use them. Here the deprecated properties and
the generic properties which will replace them:

- mediatek,drive-strength-adv => drive-strength-microamp
- mediatek,pull-up-adv        => bias-pull-up
- mediatek,pull-down-adv      => bias-pull-down

Thanks AngeloGioacchino Del Regno to reported it. [1]

[1]: https://lore.kernel.org/all/6e08d78f-ef4c-b228-f7d2-d63767ea87b8@collabora.com/

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
Alexandre Mergnat (2):
      dt-bindings: pinctrl: mediatek: deprecate custom drive strength property
      dt-bindings: pinctrl: mediatek: deprecate custom bias pull properties for mt8365

 .../bindings/pinctrl/mediatek,mt8183-pinctrl.yaml  |  8 +++--
 .../bindings/pinctrl/mediatek,mt8365-pinctrl.yaml  | 38 +++++++++++++++++++---
 2 files changed, 39 insertions(+), 7 deletions(-)
---
base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
change-id: 20230327-cleanup-pinctrl-binding-8064a8f8bf68

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>


