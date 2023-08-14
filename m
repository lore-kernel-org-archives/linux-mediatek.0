Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E411EB64DD
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Aug 2023 18:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qrwZWKpcUQ6ywsnRpddsQP2IFiaWoqi0FS5jyHuJPzg=; b=DZtprVvQD0NZdFOM/tV0818bQh
	EH5Fkwq4xIxuWOI+0jKfsGZpTj6XZnU8IsjAKeMpAKjoJmtqtgI/hVW2iI+bvMkMx0LHth0JPhgrP
	hJX8rFwtkJLvU3W5g/zb2DuXcS+qG0LpKRXZkOY/rsePZlHdvi8P73Trq9XBM/u3etlI3/KQh6hah
	86HKkA2MQaxA/qJ4AIqy2RMgU2GZGpLddZm8l18nWMUR8IHAP4lR1YQZpK19hE8YQq3sJKPTjALML
	Nod/NAGCG7Ye+8ySgL4jn2EfHqqjbBY+j5YOQj3vWy+xMBi0hIZeSMTEly7WF51RaEmp5JjGuxmvh
	ZzFz7wJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVcEa-0007F2-31;
	Mon, 14 Aug 2023 18:24:08 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVcEX-0007EG-16
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Aug 2023 18:24:07 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-d63457dd8b8so4536436276.1
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Aug 2023 11:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692037441; x=1692642241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qrwZWKpcUQ6ywsnRpddsQP2IFiaWoqi0FS5jyHuJPzg=;
        b=eZsLL/gfVVE2euiE2X73cpQxmVcDZCJVd4oMJunnNeSdAdx/OrjjTNiuVJ+H03jYo/
         6p4zmdr/adzjBxTyJ3bJR3N95XDZjgYv1ALCxgjx8ZhiO2qTe1uhMLWaAFO/7xhxZnUu
         NYa3cbglMyY8x9WB55YioZS6v9QXm8flKlbi/uvj+6CLfLqIIW7+cNXO1aCmzRZUSuEl
         50ra5BfkErNwxl4lsYUkxhctUZbEpEJ2e7GJv/H8j7GdzWiEAFy4E/1A5iIp7jpOh3vK
         3dDSGbA69VZitmjKyfUCwPWupFkT/PYkSGn1RJ2S8XBLhcmgcMfIPcZ2O2U+3zYEUmQu
         mOuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692037441; x=1692642241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qrwZWKpcUQ6ywsnRpddsQP2IFiaWoqi0FS5jyHuJPzg=;
        b=jV9fwgYjfR2XlhqUKSO14g84n6VN3QZOa5nR4ZkslalKY4U16AYkip3UMQz0jbI06m
         +8Gcarun77lp9SIUShPCQuZ9PlCwQ19YOOVLjwCTDYkWghx0kn82pUeVIKF8g0GfEX7z
         MfZ6yFIEWDUaEQiprc8hKnMbv4M6j/17j7Nlai90Q5FrjEWeEufxa485ZV8NHa2EM1o0
         WFzSpVUyFirK6aeniMmi7opCSpswJx+affeDRpRobNISQdvnBTTN4r8m1JcMuTvohHUb
         bjpN1wXfeUTdhWsYSbipOSTD/HfZP/x39nxZOc+eU+j8U+anrni39HG990LtnrnzAWCE
         U5OQ==
X-Gm-Message-State: AOJu0YwWqML40O4uYlxnenqK8rtAABalXy6x/7RrK8Q7dn2RiRE8l8l1
	d79ar3D28AQwMKNVpFZFmLeiB40EGrG+s8KBroNF7Q==
X-Google-Smtp-Source: AGHT+IERi6eZmI/ElbK4uixepZX9ZgHY63TL7MK4mEhG/I1VHJAIPHCbmJKpXlEusBuAPWNPEZvFWEdC2NzTmbKCAPw=
X-Received: by 2002:a05:6902:565:b0:ce7:919f:38f8 with SMTP id
 a5-20020a056902056500b00ce7919f38f8mr11726256ybt.52.1692037441373; Mon, 14
 Aug 2023 11:24:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230812091708.34665-1-arinc.unal@arinc9.com> <20230812091708.34665-4-arinc.unal@arinc9.com>
In-Reply-To: <20230812091708.34665-4-arinc.unal@arinc9.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 14 Aug 2023 20:23:50 +0200
Message-ID: <CACRpkdYTKLxzFWJP2YwPm-db8HSvpCQTfGwFK3Rh0nGY-0Y_4A@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: net: dsa: realtek: require compatible
 property under mdio node
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com, 
	=?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>, 
	Daniel Golle <daniel@makrotopia.org>, Landen Chao <Landen.Chao@mediatek.com>, 
	DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, mithat.guner@xeront.com, 
	erkin.bozoglu@xeront.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_112405_406934_C20D1665 
X-CRM114-Status: UNSURE (   8.32  )
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

On Sat, Aug 12, 2023 at 11:17=E2=80=AFAM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.u=
nal@arinc9.com> wrote:

> The compatible property must be defined under the mdio node. Enforce it.
>
> Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>

Right.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

