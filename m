Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C6B2CA0EC3
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 08:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JTDlvFYbsx79XjnXV/v1eS2oK868sA5+g3OCAFf6938=; b=p20h6B+3qKiGdYCEuCaH35HGgD
	KfL0qCFppFxGt0WPRQjXQz/AZTS99VmGwtOTlB5ENGg/pdQeRhaZQS1l8xWP2e8jsq7K66yrhyq5m
	h3WsQAL4FcfeBgIAcr9whSHclCNUgP+A+PcRRCpEE+SI1rOVziSgektzbiY2FQ7HpupRzYRkGfo3A
	ENbplG9CZ4Eoeao26IHx4d9KIUNs5YoYEl5EIUg4zk8ticmB7ELUld2CF7zwQRkXlJ9G2HC5nXdg5
	VEw8VYtRp7cXx8EFXYKEGjg2Pg/1VuGo9o7TCt0ozx+MgHXa8HuXd1VNesouDKc5/aBjImKJ12Mcl
	gQtfZJLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfygq-002Z0h-1O;
	Tue, 12 Sep 2023 08:24:08 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfygo-002Z04-0p
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Sep 2023 08:24:07 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-59b50b4556eso42188537b3.1
        for <linux-mediatek@lists.infradead.org>; Tue, 12 Sep 2023 01:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694507044; x=1695111844; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JTDlvFYbsx79XjnXV/v1eS2oK868sA5+g3OCAFf6938=;
        b=t3CgMLHgvkwEDBJ3yXxTK8Ijd07ZE4yxA8kGZ8d2j6G9LJ8yNGGklWytxdvQYrTq46
         YRFtFYD1gnWUWl3P9pL+KBm6CucPNY5elEJtsQwspNi5fXzbrkCQEPBAll5PTxH3Trro
         AdXiWXzJIpundSl7QhDcgvTCFB5LYayi56LMxFgmbWYX/sFCBDTcseOlawvG8Dv9z4rp
         w3IYVA1NnTPfWAQtG1Gf2raO0HxVSWhY2S1T/NMeyAHqVNsrb9oFRiOwt7KNFLREsvWe
         zldd80g4ID2/+X3k9xIISA7ZmM+iyPISZLtqNr86jEN7Mys7frJcY1BNh7tDQzyGsBRZ
         3egQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694507044; x=1695111844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JTDlvFYbsx79XjnXV/v1eS2oK868sA5+g3OCAFf6938=;
        b=TNm5/EFsYVJ3G36JAzenESK26asKsbNmhXZ2IL4HrcRC0SIEf3GoOm6o7PbsaeyBnb
         zrbasCKplgCRrGQ4WV4FZ4XDLZ4K6V2elWSkTp+i9BMaCv12SF2vowIxyNAi2yPNkCrL
         mIMZze9wbc6A2r+C+o1vzY5m65vKCaN9BeNROTr0ew6A2XHT1HK1/7/ELJfbGNGyhpmO
         22/1tWp4mLSkTqlpsglrh/KRt+97sZ5S4UMlORn8cvEAzmSx7w5Lc5YUWEkj3UVvEtcT
         k+WBwy3/sDGt2ojCMC0lVjPMy3UjcXbS9FsyjZP16le63eCfcIvlNoo1zfiOV1If05sk
         hyhQ==
X-Gm-Message-State: AOJu0YxuIwxEK+7gV+76q6+7KPl+AOa9fcqrM6NeHDxicyxY9dOI4lYj
	Gd2TEU+ey41Ori24G1WriNz8yxsR8PDknWTByvVrGQ==
X-Google-Smtp-Source: AGHT+IFd+7FzVpzIXwF6eF0XM98eCqwGR8vQyKfh9Y2GKm2qYYnTSN7eR9A+5PvS2Qu/0xw3IHJQEnNJumvhS4CTpxY=
X-Received: by 2002:a25:d4c6:0:b0:d7b:95ff:14f with SMTP id
 m189-20020a25d4c6000000b00d7b95ff014fmr13092370ybf.61.1694507044304; Tue, 12
 Sep 2023 01:24:04 -0700 (PDT)
MIME-Version: 1.0
References: <1694429639-21484-1-git-send-email-quic_mojha@quicinc.com> <1694429639-21484-15-git-send-email-quic_mojha@quicinc.com>
In-Reply-To: <1694429639-21484-15-git-send-email-quic_mojha@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 12 Sep 2023 10:23:53 +0200
Message-ID: <CACRpkdYBH09emydQPaRUgEJuHdV0tk3=xeMXxD9UVP0GH2XZEw@mail.gmail.com>
Subject: Re: [REBASE PATCH v5 14/17] pinctrl: qcom: Use qcom_scm_io_update_field()
To: Mukesh Ojha <quic_mojha@quicinc.com>
Cc: corbet@lwn.net, agross@kernel.org, andersson@kernel.org, 
	konrad.dybcio@linaro.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, keescook@chromium.org, 
	tony.luck@intel.com, gpiccoli@igalia.com, mathieu.poirier@linaro.org, 
	catalin.marinas@arm.com, will@kernel.org, andy.shevchenko@gmail.com, 
	vigneshr@ti.com, nm@ti.com, matthias.bgg@gmail.com, kgene@kernel.org, 
	alim.akhtar@samsung.com, bmasney@redhat.com, quic_tsoni@quicinc.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, kernel@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_012406_298398_FD969A55 
X-CRM114-Status: UNSURE (   7.14  )
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

On Mon, Sep 11, 2023 at 12:56=E2=80=AFPM Mukesh Ojha <quic_mojha@quicinc.co=
m> wrote:

> Use qcom_scm_io_update_field() exported function in
> pinctrl-msm driver.
>
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>

As long as the qcom maintainers agree on the rest of the patches:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

