Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE752C52D7C
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Aug 2024 16:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v3tl121UFcqjaRW1cQWXFFukEED+sZyQ1Hsg/FKSyTw=; b=S5BDFSgCWO7Irfkp/asI8gZHku
	lUcZ3t3IurDUuo4Kwi9qIPyvUXUTcHtFlL8C7hmm8nxbIQIGFYd+FKpwDeDYOXjGnOjUamJxGHrLg
	44AEQRbpT7a9iYo0zXyH63fWVOblFv/HNuQ0c7FlqXIcGlYyXE9NgxxpPWfynCA0gIZcEssLxBZks
	uMESHNXEt7cRXodUf4K1f7TEsH2j+yKRvcgh+IkebKhdRBYYmdGHmqZgZnc+Ex8VH2TceRKwkGqSS
	6/t2Xq3JvnXr8Eoc1keoxYezFKQNFnHq0hClcOLIYrTexVO+hktL3SQQSH43ZIz0Y6J/afsMlr0iN
	u3BtEmJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shWwM-0000000HVHc-2LlW;
	Fri, 23 Aug 2024 16:15:06 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shWuK-0000000HUXr-404m
	for linux-mediatek@lists.infradead.org;
	Fri, 23 Aug 2024 16:13:02 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-53346132348so2504548e87.2
        for <linux-mediatek@lists.infradead.org>; Fri, 23 Aug 2024 09:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724429579; x=1725034379; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v3tl121UFcqjaRW1cQWXFFukEED+sZyQ1Hsg/FKSyTw=;
        b=poMzYDg0j4Dw6Iuafq2h08NMD76RRKe8kH/xaqt6AQTz3gvsP0g1K8TNY+X6PEEi8i
         2QQ0EGUgMhTfnJx6OonBloBFCuBB0Ukl9ouS2n1FIA4nSDAfPbtMh+3m5c5AI2tmKJQK
         lEMrNmCsoSlDFEvcmXpMh4V1SnQcq8FRkJSJbQXNtJmqG9bE3r7Jpmkr4vhZhghMbBWO
         2yRmjdSeTGiAbYQp2VGxrnRzVJqIu89dz+Uf3tNZb7pHBpzUxWRqiUBRED3R1UKAtzOP
         cTW2ZPfP17egSCT2MdgC/pOqIw6axKhtdU9GOE+e0eGuUgvYOMMyNP5LsnufHE0HRLNs
         m6Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724429579; x=1725034379;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v3tl121UFcqjaRW1cQWXFFukEED+sZyQ1Hsg/FKSyTw=;
        b=NONZEPtDPb7ADapx0QAKHpv1GqKRLiZf7EgJwRQnfVabRb/tU/BKAjVd/MhVVNy+xO
         MFf1JHm8mJP1sEfJN0nNrK8H2INyuajRb8Nt64zCUUPpRGlCcVUtSo9CGvlVWLl01TTD
         I+K92Q084GnYKHN2kxBCpX5kU+DkALz/eASusu40OdbLMv3Ea/EFt2UyhB5E4NWwa43i
         2VLFrAVolY67XRDpCtM6exLgmPDqnTMmp2mxSKcs26TkDlHLlPbD0YpnV4I99DcVurSV
         dTVCCsNePSoZRGvDlkd8hXwF5FvI4w3SeHWYpmlnKh/uQKBUYqs7yTxVXte4n5MEzsF+
         sr9w==
X-Forwarded-Encrypted: i=1; AJvYcCUxKNROnK7p3HzF7sDSHKBnIr+vjtYltkG60ITvx3gSgYTWI8bkHi+0EJL1lrnHDA8+nCnWaz/mwAlVdfej4Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5TdkIh32Vr6jr8IfLsDqGwxIxrgM16XKjVwqUQWMcaNqZ+87p
	YqEkkmxh5lZOu7K6on95dU1xlHBo+s0eNgfni3c+hpUKJsxSdggQ2Ta4eOfZFYOpnoQ6or/yeN1
	e3+b6LZdC5LyW+7kfrl0+z/8KJPSTThWySlrUhw==
X-Google-Smtp-Source: AGHT+IH1hynyymLz1ZuEZUhvfWZZ/Hkkj2g0Tl04dlGTeLjC9tjjJISAp+o+SHgwFRjXGoZ1puRhp7iBRORVJcZyH3Q=
X-Received: by 2002:a05:6512:6cf:b0:52f:c14e:2533 with SMTP id
 2adb3069b0e04-534387be6d8mr1996904e87.48.1724429578471; Fri, 23 Aug 2024
 09:12:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240811-dt-bindings-serial-peripheral-props-v1-0-1dba258b7492@linaro.org>
 <20240811-dt-bindings-serial-peripheral-props-v1-5-1dba258b7492@linaro.org>
In-Reply-To: <20240811-dt-bindings-serial-peripheral-props-v1-5-1dba258b7492@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 23 Aug 2024 18:12:47 +0200
Message-ID: <CACRpkdagjGv79pJy8Ry2+OM8ShCE8sWNafQtzrPM_-2MJYNzLQ@mail.gmail.com>
Subject: Re: [PATCH 5/6] dt-bindings: bluetooth: reference serial-peripheral-props.yaml
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Johan Hovold <johan@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Daniel Kaehn <kaehndan@gmail.com>, linux-serial@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_091301_196308_5994F4FD 
X-CRM114-Status: UNSURE (   8.31  )
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

On Sun, Aug 11, 2024 at 8:17=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Reference common serial properties schema (for children of UART
> controllers) to bring common definition of "current-speed" and
> "max-speed" properties.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

