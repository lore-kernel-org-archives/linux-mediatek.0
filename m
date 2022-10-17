Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED54C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Oct 2022 09:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VQ/HSgI2YgnyJT47jhmeTT6yW7UCxZ0jSNWzQkI0FEw=; b=U6XWfIic9hRF5OpyIloqUiKsT1
	po8mYVosvE/uNbxamE6v7ekXRT5ORIIiSY3tSD+w4yyb8E+hp4ya+xmql5mR86EDJ6WDkdsQImga3
	9p5GeqpA/wK2olQTSvzcxlWhsQxV9zo5YMFT+W86VU6c1VqdCnujIwV1HW9mhBswm163/KZ+AyUMQ
	t/dnTTgXHIvUdSa5PT+7yyTY3IYNzGue0iK5/Q32MlX7e/34szhH3xZjm/BNwRVfx9+pHEiWQOMrl
	rkULDYvwYVWyMnCNpewCiYC0JO5JRC/iKxVVS+RLPoI1F/ZzSDwztZDIP8x0hwtnzECtASnoGE8+J
	C71Ee1/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okMdB-009oht-Rv; Mon, 17 Oct 2022 09:41:57 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okMd8-009oVL-Jo
	for linux-mediatek@lists.infradead.org; Mon, 17 Oct 2022 09:41:56 +0000
Received: by mail-ed1-x533.google.com with SMTP id z97so15180337ede.8
        for <linux-mediatek@lists.infradead.org>; Mon, 17 Oct 2022 02:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VQ/HSgI2YgnyJT47jhmeTT6yW7UCxZ0jSNWzQkI0FEw=;
        b=kBn4OiBZ1cWeTnBRzDnVts1O6YM1bzUTlkmnUk6qzbv03LVlaFoqC7VeVSIK+1ayXf
         8spqbtyKS/eFcrq3aFMvy+6AujV5KLTJTcUjgtC2C2LMyKuTdoejQpZXM49XKD2LVU3M
         UHHvwZa3PfzWjUqKut3gBTgwZFmoc2g4mwyhfLJCpEVyux70EJkqElrWfi0+qlbqUlL/
         rEdFsn2lQxqKi12JtQuQsU6ceDTInMEi3VPcUVxR7rKKOZZkE2tkhoPhyNODRCnROj/0
         krEKr1SmKxidWbFJtNDgMMgKc2rbiI1NWRSObYynkKJ/u6tUD8MCVkATz2QuGF7mQ48f
         aY2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VQ/HSgI2YgnyJT47jhmeTT6yW7UCxZ0jSNWzQkI0FEw=;
        b=A7dT3HS3K5QzmXK72ptNmNkR6AjXHgfpMqs0au1/0ugGmWozpQvHRnCfP2FiUE6J0a
         mL/lPWj7r3rQ64cvwWP6DfzF2v5nXEF1SBPszdHJqti06NhjJ7JgTpxEzDbq9R4D8x79
         xeJOsF4/VqiDGyRa5tfEgSzrbzLowD5TiSrakPe5Ay618Ccerx8yGH+WeVPDBBb1qwmy
         x38dpoUA8QfEG6rSTghU82gNHFQXhv0cQLfS6TQqgC6x3PCK0JMUlmK8v2b5drlvFdA+
         oVZvnuwX2e99yZ7nRq+TsWgF0z9ava0VmMv2OKYbAO/9wfwV/n3tFavQ/Y8+DTVMeBge
         AagA==
X-Gm-Message-State: ACrzQf3PBrOegmGj2ymuXz3bxIkUrV9qjNF878EuRDevwMUvQ5q7+bkp
	YbHlGHmrh1Tzohxy6xYMr/6qtnguh9AT2dDOKMZtwg==
X-Google-Smtp-Source: AMsMyM5kbAxE5N7tiaNYd1vvW4ZCnpFPQbl0NhkiqKILYLuft/kSjMMpw2mO7Vm4BCjieaOJetA31dCsdLbgxjE4tCs=
X-Received: by 2002:a05:6402:d0b:b0:458:a244:4e99 with SMTP id
 eb11-20020a0564020d0b00b00458a2444e99mr9489401edb.46.1665999713052; Mon, 17
 Oct 2022 02:41:53 -0700 (PDT)
MIME-Version: 1.0
References: <20221008164807.113590-1-linux@fw-web.de>
In-Reply-To: <20221008164807.113590-1-linux@fw-web.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 17 Oct 2022 11:41:41 +0200
Message-ID: <CACRpkdYNZGJaVN0eRZPmkmWr=it7xZtAPM=qV0EyQWUZgZ68hQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: allow configuring uart rx/tx and
 rts/cts separately
To: Frank Wunderlich <linux@fw-web.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_024154_879962_0656441D 
X-CRM114-Status: UNSURE (   8.39  )
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
Cc: Sam Shih <sam.shih@mediatek.com>, Sean Wang <sean.wang@kernel.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Oct 8, 2022 at 6:48 PM Frank Wunderlich <linux@fw-web.de> wrote:

> From: Sam Shih <sam.shih@mediatek.com>
>
> Some mt7986 boards use uart rts/cts pins as gpio,
> This patch allows to change rts/cts to gpio mode, but keep
> rx/tx as UART function.
>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>

No response from maintainers for a week and patch makes sense
so patch applied for next!

Yours,
Linus Walleij

