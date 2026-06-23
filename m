Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3518CDB466
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Jun 2026 02:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b+q7XDPn4WHRjK2ULR+7wzhaQI1VPfhoH+J7E8mDoGk=; b=wTuYXTo2JPVE4qxLAy56+dzv5K
	u0rOnkOmJgQN0pCwU9Xyy6kdB9U/zbg+KAq86pLgPCR19I5AjETqtbHiW7saT8fgMpIHfYJWdcM4s
	EPeiyq7UsQgRS9ViOg4EkXfuGHcZ30o432rC9EDehLqHmY5WAuznzixTgP4w33yefVa7NuAtiuBX+
	M57i/Wj7jwT/eO8avUhgYPanG3JTj1anidm61TzOOzIg0oc2fmrmhYo+pKdQqjiCFCvSMeU5mSC05
	BvD1rNmtdHxv5Ewo4PRimIbfFX+8Q1vqnrg4phuiqKfVcxT62k+sz7+1V5DGDb9OQjCLneEv5MGpt
	moArCKiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbr6i-00000005bNi-38ku;
	Tue, 23 Jun 2026 02:43:24 +0000
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbr6f-00000005bN0-2WkY
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Jun 2026 02:43:23 +0000
Received: by mail-yx1-xb12a.google.com with SMTP id 956f58d0204a3-662b95934dcso5339524d50.3
        for <linux-mediatek@lists.infradead.org>; Mon, 22 Jun 2026 19:43:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782182600; cv=none;
        d=google.com; s=arc-20240605;
        b=Wd7PNiFX1ht4hnRQUbHzIpCRGuFqieLT+ZQ3zWIxn1iYYGIDfFgMj/1fWbuOOnOcx7
         bMu6InrBYZAxF9brCmaUhn+8nnTeM2PZrEWjKRgjFCgChCUNzLgaxYEQFkHLncZXN6ls
         jdJUH3UPAhynD42JWeEOrxn0uLfZ6TjKe1xrJchGLo1miWG7iZhVrAhuu6xfskxNHgqH
         JrqzKvSxg+5pIjA2Hk6vfMufM5iyrHz6sLCB7bIxhpIlOVCEtQ6TC+RIpLaNQroYdPWl
         koFI2R1r1wxFIlbxyDI9Pnvj+eGu5q/wH+32QEJNqUtBfBCpVLPdaJAHJNEvA1eWz5fW
         Y5dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b+q7XDPn4WHRjK2ULR+7wzhaQI1VPfhoH+J7E8mDoGk=;
        fh=KC/UDk2nAfJYuYDY+/xiEBH44N1WzlyzKP4XeQETEIg=;
        b=GVq9ner6m1UtHP/mYuoR+Mut0hmuHGG9SLAzKbK39r1CVSkSUIa2toOFQJIgkTtIP+
         ui2f6P0dW0JavhoOQ3Sv6N2V8WnSw/lVKks66DOrvn7PwuC/tRCQNteeH9cN9/msno6p
         yH9+5juywTqlp25MAfk0p9U0IiZtSAflMDjJGzbPVwNr8FabLXrGGD/Kn1wl66PKWEvy
         Sbp2Mww1R6nHFFqFERXs0ImVSkz389I2z4k1vvNjZ/oGq7dz2oaQ5iNS8ns2UoVQaDCd
         ELTJGJk5dForkZzED+OLSy+Adh1XvdGoOLVz3qg0sYo+TycqrRerKIvkOfYsrYIckcLE
         up9A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782182600; x=1782787400; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b+q7XDPn4WHRjK2ULR+7wzhaQI1VPfhoH+J7E8mDoGk=;
        b=cDaMC14trOztdnYk9VabKmOYaSpDMoGXeG7oOnQK+kk8dxxI5bZJUKvQ48TehgOrM4
         4PgRGDRmJEJM/2IcDezrlgfjXx8U+acBuJtR06mEPLxncyu9WPhlVRqkrKk6HjnS2C88
         LgiuucEokS+HA4fSz8VEACrtvmfrsjEO3jx0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782182600; x=1782787400;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b+q7XDPn4WHRjK2ULR+7wzhaQI1VPfhoH+J7E8mDoGk=;
        b=K5f+M5/yktMLOkiUR2DpJX0lrg9FvNurBRBTzc6t4IE6b20TGNQf5XaJl8EGCCE5tp
         qQ/VhKiJdfUb2lyFwuP9TWMmSemClHxdFxg6Ap9UKRElPKRXB+ML+qq5+9klaPfcnDuL
         x3rl+RTIQuG1oApsmm7UNmwvdawEKqo1oEHk4/O63mcjLgzBvczKi07k0n+I5fzoCRfc
         xkugxRsJEybjF9UJWDR/oKpCCGa7rue23XUFUDK3FpetIsm1YF8WrzTkJMfcvm/6Olbq
         J8YiiZHbNXwOXXb/k0oYzIfwNSDqsm7L8xALb0fihywlZ9ZOtFyg/k1hh54xsVSCMKxb
         WkdA==
X-Forwarded-Encrypted: i=1; AHgh+RrhENCPzF8VAad8SSvP8waaYPrb1Ari0XIsTGh1vWMGENwCakobesT8KQ1Yj96bwLz8ssqc6Jugk9fkkaIpAw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2Cyj5vc2s8dZESuFYzM5+be3r0TZUIPPIRz6WoRUVy8JbULcp
	Ul0bQqe3PqxJqJkahe61loD/DwlW2jA5yY1QMyb4N/ambtDMaATdrdPkatdfytVicKxlZvdvc81
	d0nvfZfwQqlPWVFI0N/5bSgu7+Z1GR0CP0+BcCg+T
X-Gm-Gg: AfdE7ckP5FwfEA+snvuXbhHB+NNSi2pIETWQYn0o85HzqY1YXylv3ZYtfb2u4oeYKKA
	TYJprS7XL4i74gVqq3rWuMj7gDdCsCZFNNipOCJrcFUx61ilWOiI+/Nt4iq8OfYLkNqPIB5bTgo
	mYb0Muoh/9kEOgaEEQf5/2gc6scb1qSNLRzf+zM6N6bMm8yGJav+J/o+CD100XeC/FnxY0mf8RX
	Woqpn0MgphCvenzAzcjmEcAwW5sNlRIA2Ab/X7oQk2URo+fn7SiU7I7xN/RwjU37IonhZredJTX
	w510ghtfKPinTHkyangcD2SnN44=
X-Received: by 2002:a05:690e:11c4:b0:662:eb42:dc36 with SMTP id
 956f58d0204a3-6635a0ee70bmr952581d50.53.1782182599767; Mon, 22 Jun 2026
 19:43:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260623020648.112623-1-fffsqian@163.com>
In-Reply-To: <20260623020648.112623-1-fffsqian@163.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 23 Jun 2026 10:43:08 +0800
X-Gm-Features: AVVi8CebahkQKZb2FdRCklbGMPNxHTzKHNXd3WHfoR4Viwxi8rANQUWPZkq4K0k
Message-ID: <CAGXv+5E-QDOH4AT-QTp4+Gq1iNAY3DebG91MigUfasViLBRfRA@mail.gmail.com>
Subject: Re: [PATCH 1/1] PCI: mediatek-gen3: fix unreachable error message in probe
To: fffsqian@163.com
Cc: Ryder Lee <ryder.lee@mediatek.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	kwilczynski@kernel.org, Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Qingshuang Fu <fuqingshuang@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_194321_707481_CCD7A28D 
X-CRM114-Status: GOOD (  18.60  )
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

Hi,

On Tue, Jun 23, 2026 at 10:07=E2=80=AFAM <fffsqian@163.com> wrote:
>
> From: Qingshuang Fu <fuqingshuang@kylinos.cn>
>
> In mtk_pcie_probe(), the error handling for pci_pwrctrl_create_devices()
> has the goto statement before the dev_err_probe() call, making the error
> message completely unreachable. When this function fails, no diagnostic
> message is ever printed.
>
> Reorder so that dev_err_probe() is called before jumping to the cleanup
> label, restoring the intended error reporting.
>
> Fixes: 1a152e21940a ("PCI: mediatek-gen3: Integrate new pwrctrl API")
> Signed-off-by: Qingshuang Fu <fuqingshuang@kylinos.cn>

A fix was supposedly already merged:

https://lore.kernel.org/all/20260512103347.1751080-1-wenst@chromium.org/

ChenYu

> ---
>  drivers/pci/controller/pcie-mediatek-gen3.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/co=
ntroller/pcie-mediatek-gen3.c
> index b0accd828589..5d7cfed44637 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -1222,8 +1222,8 @@ static int mtk_pcie_probe(struct platform_device *p=
dev)
>
>         err =3D pci_pwrctrl_create_devices(pcie->dev);
>         if (err) {
> -               goto err_tear_down_irq;
>                 dev_err_probe(dev, err, "failed to create pwrctrl devices=
\n");
> +               goto err_tear_down_irq;
>         }
>
>         err =3D mtk_pcie_setup(pcie);
>
> base-commit: 4708cac0e22cfd217f48f7cec3c35e5922efcccd
> --
> 2.25.1
>

