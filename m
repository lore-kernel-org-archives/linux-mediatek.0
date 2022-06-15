Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01305C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jun 2022 13:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UJ8iaI1pTv/YM131C86Mnpd2Cs7gpkRb4SNOR9/hNuU=; b=RjAwRKSuJpk2x37I+uC5nuCLQl
	NxVFrpXH1WGttwoKbEKTdpX0QL/PMEz3FaBr/9HlkJS7nZuugXtrsUhdC2J4fWgLVjZh1NeM37Ss0
	ZG1Prw+otzKrWDYuvBjH8CD0bguVh1sz/gVfIlwYSD+YmKChOQ19IBHF9hDrJOgmEBignLOZ89nrC
	85Ea4PAlNSfJNs7hTOxHpXXBLYQjyZnXt6RFVfaI+U0LH5GA91y/O72xZNgWbDzF9xIFW+kVvGORj
	5gErXJl/faj0pjisdH32jx+NCaLEZWP5oZJrALiwEywycev+pURA9oZqbjFMaie4kKWbV77igv6g4
	5cGnZNaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1T0I-00EgJI-FO; Wed, 15 Jun 2022 13:24:14 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1T0G-00EgGp-3V
	for linux-mediatek@lists.infradead.org; Wed, 15 Jun 2022 13:24:13 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id v81so20582352ybe.0
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Jun 2022 06:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UJ8iaI1pTv/YM131C86Mnpd2Cs7gpkRb4SNOR9/hNuU=;
        b=WWCVGdRbgpyX4JC60E1knSS/uwhU4ze16f8ZReamCR9o1Dj27V6VmZMuQI0hMSj+0y
         eDBfWai5XlZ5g9HKJQGi9zFmX1Lcf0EnLacnZJ6TWl0+rAOvpYZ5XDVPq9TIYXjNe+gD
         R++DrE91aVAzvH96TpvA5xZsdxzx5ipVAqsl/TlyBQZAkwgGYHerQaBqkkjpNKvGVKmS
         0oKtDdUJrgqGw6Cv5T2Umy7PFz9gFsCxJKLWpKwJ1jwxkYMgK5ScDDRTp0axuRfKkNzh
         ken5dnpzo4+0PznZJYM50eS8aRlVxZZKF00zFbrTkTa+r5LcHNPX9BM8eM2M0I0vZj6I
         gEkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UJ8iaI1pTv/YM131C86Mnpd2Cs7gpkRb4SNOR9/hNuU=;
        b=BCPPM2zVfZ1HPqsFZiZB6vmCqoUC+Qpq0nuqa6k6haBTy0WGgGVQJ65gqFh4qcyjoF
         RJhWdSjiy5Y6ym8fqkk7/Kl4QtlI9FZKJ+ZKOvdPGgsc3l33oIUAIEkhFElhgnaLdDOv
         3fVnapb+39gTzzPfCx3WM2xyCVmz4aX/6Z8kl0gyX1eATBJqM99BnYZwCUZxmlv+MB/i
         qJk2n8Nyyihnd++RT4Xy/J0OEy3M4qjWFBdci410zr2B1O5rjKBg266R1DpP/v25KUu4
         m/y2BPSmshoNkFrIVjoo5Vzp3gqL77mljFITupyBwULpO2dPVggMrfhViw2GZKRsCvlV
         oKvw==
X-Gm-Message-State: AJIora+97YIGXN5LQeUxLqGIDZB1SdLeThZrmJHGRVccheIt2J+9h3vQ
	76koZP8B/tt/4jXzbJi1AGuiTRKmTuZAKlvPl+TJhw==
X-Google-Smtp-Source: AGRyM1t5vbN1VRN0wQ0bZrJ9w/qnK3EiTQYoQv3YAhndL7v5GPOVjr/01mLr9EMdHOiqE1S1jfQPtZw4XGNv/p3Uo5Y=
X-Received: by 2002:a25:8387:0:b0:664:7589:27b9 with SMTP id
 t7-20020a258387000000b00664758927b9mr10564795ybk.291.1655299449036; Wed, 15
 Jun 2022 06:24:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220530123425.689459-1-fparent@baylibre.com>
In-Reply-To: <20220530123425.689459-1-fparent@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 15 Jun 2022 15:23:57 +0200
Message-ID: <CACRpkdYZJUWb4TBJiZVK4SNeA2Njn6341FuDjdYsn-0_yCeRKg@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: mediatek: common: add quirk for broken
 set/clr modes
To: Fabien Parent <fparent@baylibre.com>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_062412_210875_26D8D81D 
X-CRM114-Status: GOOD (  10.73  )
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

On Mon, May 30, 2022 at 2:35 PM Fabien Parent <fparent@baylibre.com> wrote:

> On MT8365, the SET/CLR of the mode is broken and some pin modes won't
> be set correctly. Add a quirk for such SoCs, so that instead of using
> the SET/CLR register use the main R/W register
> to read/update/write the modes.
>
> Signed-off-by: Fabien Parent <fparent@baylibre.com>

What is the state of this patch set? I see changes are requested by
Angelo, are they being addressed?

Yours,
Linus Walleij

