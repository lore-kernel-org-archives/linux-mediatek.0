Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27745CD1297
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 23:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RCiwuhJlcdVymL9iabF0uqiMDb2CibrCH2dP3vtwOxM=; b=y8dsLdddOkjoiXZBHu4M+ixqU9
	HJNNblQg+oeF+uweQRCQRdYdHbJaem9Y+nuXQbaRvZ4/ngzQW8B6WKEabH524Fj4WKFd2DuRUmIkK
	QElp5JT46ANPSqMxHHhIgm1Kq0X1agdJd7c1O+qCNCnJWYpAsN7H9Ya9tPvwqfghAOGFhS6f5YWk8
	RqZMUQ08MK8O2fkeRaKUd8e6SCvPGngbdI6ai3vFOAKBr4hIPDpmX/FNkNx9AtxenbbSKFv9sAjqQ
	D9j4HUYURSGvdhHy8VCPkQMVb4N1u4cNy/5c9fZJL0KulWSWHkzY+khyNjJD738LarHlrKQa/wRFc
	AOSj58yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruhUM-00000009U8I-1TOS;
	Wed, 10 Apr 2024 23:36:22 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruhUH-00000009U7N-3YAj;
	Wed, 10 Apr 2024 23:36:19 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2a2bcc0c075so1899334a91.0;
        Wed, 10 Apr 2024 16:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712792176; x=1713396976; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RCiwuhJlcdVymL9iabF0uqiMDb2CibrCH2dP3vtwOxM=;
        b=kUPHHyQ2ylz1BhsGYoyKf7UCxe1LZdi/cS4k7Ueo3dTMwVtSlgpa55b5F0Gru03uGu
         6hqhDSSSyrH9aoE6Ms+e/w8Lm0whK9O6DL8B9ZjoOwA4JDbhbwjXV0HLHc89TGGr8d5b
         Gx5puE7Y7bYoUq89h96f3lSy1k5gaO1jLyHzUL+sCFUAMYV51LxA0LCdKw5FWf015vi9
         9XeXl4nylnEmr1WAkYbiONXmQRvtQ3zhNF26bkpJgtG79/4esUHIaVzj+viw6nbVJkR8
         0JT3r7OZOdLOiso1SexZvEkLz6v021zi0vin7OCWQk8uoqVz3OdrIWggCVx8Qa1xWXmm
         qPPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712792176; x=1713396976;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RCiwuhJlcdVymL9iabF0uqiMDb2CibrCH2dP3vtwOxM=;
        b=HrnAF2aqaMgOa5DEFZsKmdOzQr5cYHZ0BH7/KfjwJyQumiUxnNCsaFl0iC03PVw81B
         Msf/JXIn4yTzDpqKOTrphEqZN25wfmNV2IPZBwGhKGRyqI88l/uZPEFSerMChNiBYLsF
         sLaqVasCccxio628m+fyuuWh4b3MbCrTHjFoVUrZuiIzhQzh6IgqtnatajbShUYcFW9d
         yTgNzol6YVThvah1Z3w721M7jsGG2NnyDxETxuFkJ1dN3jco4/LPTpeTtj4syzSozM3c
         Az06L391V1MtvBuATTOoS81us2oKcf+kxjgTYaTuY4v34xC91PSIWHA1mXZnvM+TqfMF
         aPBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDHSo0FnsR5rBzxvwh5ESrQ+/UwC6E8qqRDqBnOUDgOfMEA3vGB3TCIn6OcMBzDMv//q7c0pmL961/RPnTs+q/yRKgJVYJfo7zSbELEQ7oRKI1149OBBUhdro+RO0UyMe6XO2Y07Gj0u2fwxhwA18k8WWsZ1GO1As=
X-Gm-Message-State: AOJu0YwRoPnwbwbFOWozRFsDlYvX7olZSgYiBPHdmGtRamKwhs5ktpyK
	07jPEVYRV63Oqgg8ZX1Fj+49Dkl3bydz8e2Vu608gPkwQ1Qtc/SLr039S0GCpbQFxIHQsdeQYT2
	Wo2EPzKQirmdnuFa+2sjyKf5fQKo=
X-Google-Smtp-Source: AGHT+IHvxfBW1enUR1DnNYuaYxnKs9tO+hdbg0i47Qw9mY6cM7ho7vYbzxgiD/vaxzb1WdMzDzxpTGcfy4AZCrqiLA0=
X-Received: by 2002:a17:90a:4688:b0:2a2:6757:1de0 with SMTP id
 z8-20020a17090a468800b002a267571de0mr4070054pjf.4.1712792176144; Wed, 10 Apr
 2024 16:36:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240410170150.248428-1-krzk@kernel.org> <20240410170150.248428-5-krzk@kernel.org>
In-Reply-To: <20240410170150.248428-5-krzk@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 10 Apr 2024 20:36:04 -0300
Message-ID: <CAOMZO5DFr8uhVRq8X+ZURCCAw4bLM4Ueaerr-gw554sFr+KLKw@mail.gmail.com>
Subject: Re: [PATCH 5/5] pinctrl: realtek: fix module autoloading
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Jacky Bai <ping.bai@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Linus Walleij <linus.walleij@linaro.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	zhanghongchen <zhanghongchen@loongson.cn>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_163617_929847_2E51E045 
X-CRM114-Status: UNSURE (   6.91  )
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

On Wed, Apr 10, 2024 at 2:02=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> Add MODULE_DEVICE_TABLE(), so the module could be properly autoloaded
> based on the alias from of_device_id table.  Pin controllers are
> considered core components, so usually they are built-in, however these

You forgot to complete the sentence.

