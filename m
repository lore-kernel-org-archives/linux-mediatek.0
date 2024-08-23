Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16044C52D7C
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Aug 2024 16:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LUtJ+oLA4esiCwHxzR1PJ9WRsZLpLW+urZuZZ82HGUY=; b=cZgJEaHPbXsPeEZ3G9fy1H4U9t
	hkTwfJuWbXzha1mAlEG7Qf2NI5WzjuanqjfDwRH5UQGzsvJa/eHqDOTzYSQziPZuLaovrIw6CtJ4I
	jRKJOTJSNc1QkVgtc6xNZYPpX5N5shF1lumhTVycolfWz+4q1Yc9pinED9jOSru8PrKsZHsoghJ+O
	VoekwxUaHewF+LANFiTDTQJ3bo+e83DQY62qR26gkRT0IgLNVWFjKWMCFADvbuMnU82hmMwyg0lnG
	COPvqD6VYiCd1yR1WzJncOOjSx9EAGu3gE2kSoVXlo3vMth0GRu+quiGgi+P5x6aO+4kuzDB5DfaJ
	b9BcTeDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shWu5-0000000HURQ-33cM;
	Fri, 23 Aug 2024 16:12:45 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shWtX-0000000HUDq-1zqx
	for linux-mediatek@lists.infradead.org;
	Fri, 23 Aug 2024 16:12:12 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5334c018913so2002631e87.0
        for <linux-mediatek@lists.infradead.org>; Fri, 23 Aug 2024 09:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724429530; x=1725034330; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LUtJ+oLA4esiCwHxzR1PJ9WRsZLpLW+urZuZZ82HGUY=;
        b=Y+io/K+o62CS/Nmj608q1z9Ck6zzlfM0HrY7wm5tExjo73Vz1zzmFJccpGtd/5Hjrc
         ghaKCES33Z10VZavxlc56+AlyXqg3OH9aBBZOnihydRe0/7YUXe3XE6CQTH4SvtKrR5F
         XOS1Mt1XVCETpYLDl+GPvwl1tM4W008Xcdv77/Am3SsCQkFgSWEO/+PIHL4TcRCFU3CZ
         BQaPz+hRqch4aTRvf2qhZNYuMs32kOoxwpqkX1yXV4lOszKVi/cMpiUhQ51/nWr4os4O
         +NaZ58DUJ5JXV6IFWDin2PMEoINxUjMs/JB9YfDCCz6r6itKp4dnfjG6SOZ5GBPZdDWV
         rU7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724429530; x=1725034330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LUtJ+oLA4esiCwHxzR1PJ9WRsZLpLW+urZuZZ82HGUY=;
        b=QJoiF2QEag7Y6CdwPXoIJARHO/soQa9yr+Q7R2b7l9q1Z4SSMqyI/X2pSs7GoeLpbN
         CyY/AdiQuXXJXYpYoJT5wGA+ZXEijBsnc4n0uUg7dq+TTGsLEmjh8SZJOQMv00ULVMhF
         OIiCbRrDwWDWpUhfExrq/jQoQjxciJmxXTFFu4RrSGoNY+dEpUdN+RW86cuPAw5anBbo
         J9MrYuZCg9qQBPsdfpaygeO7E1iWISQuGhnPCtUBBNm2bzDHUuEqODksKPp2DTNv1XBN
         oq8Rxq4ELalOnO4+zyTveU9uH73RrHaSx8gylhSn4yf7eQv733LafaxdiTfzne7y9szT
         WONg==
X-Forwarded-Encrypted: i=1; AJvYcCUS6Hh2jfczcZOlZ+7X3ZYXBoJZi+StqMp8K6L0YiDMv+Ms3Ts13t4ECXV8mOoBe5RTYKMIbq8/kuaE68uS4g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxwq9YZOPSfFcl4505imK034L2Pneu5tHITfKdfeF0FXCBMD45A
	FAPkEb7pnN2GgKKMVnKtGXwQiMGZAHgK5tfaY60XIz2gadLXc0KMOXWoQdhRpmhejstQwCwsihv
	sP1mIZSskXIAb5XLZPRsbi4ODcY+IaQ6qTQiu8A==
X-Google-Smtp-Source: AGHT+IGGfa4J6/rrOmhK+K2Ol6XZFt8xdTBfsTGvDz88zJF2GE3+F2dUfKvoePIHG1HbHuE9HLf0FWj4ywInoY22pyo=
X-Received: by 2002:a05:6512:234b:b0:530:ae99:c7fa with SMTP id
 2adb3069b0e04-5343882e2e1mr2006824e87.10.1724429529236; Fri, 23 Aug 2024
 09:12:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240811-dt-bindings-serial-peripheral-props-v1-0-1dba258b7492@linaro.org>
 <20240811-dt-bindings-serial-peripheral-props-v1-3-1dba258b7492@linaro.org>
In-Reply-To: <20240811-dt-bindings-serial-peripheral-props-v1-3-1dba258b7492@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 23 Aug 2024 18:11:57 +0200
Message-ID: <CACRpkdYyZRVC-AYfpTG1f6sqrqAg0pCWxzUr7eXYtnM3jacMfA@mail.gmail.com>
Subject: Re: [PATCH 3/6] dt-bindings: bluetooth: move Bluetooth bindings to
 dedicated directory
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
X-CRM114-CacheID: sfid-20240823_091211_534458_BFBE7A9F 
X-CRM114-Status: UNSURE (   9.52  )
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

> Some Bluetooth devices bindings are in net/ and some are in
> net/bluetooth/, so bring some consistency by putting everything in
> net/bluetooth.  Rename few bindings to match preferred naming
> style: "vendor,device".
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Excellent, thanks for cleaning this up.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

