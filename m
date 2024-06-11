Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F4CC25B76
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jun 2024 06:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bwu883SfM/0WsE+oHlOP/+rRWsvAVxgU1/13gdyKygQ=; b=SVQqwHvy27xCGMFLBunHc9V6M1
	nbsXZ2xVs3lXg+/sTxCPU3Y3T6Kjdh6nGz1MB87vG3RjleH8z63BW4J3TrgEM2Law09h6NDAibHli
	ZSOEaHAADXifVWx7mKcaX2Q7V5gdl/WjaebM0s33r/ECH4qQbOBCwbiw6AuPlABfVSTD9BlAO4mtL
	+GRVV3R8ub56mq5tegpONZsD/ydmwh4nR+lWVvwh/xxlX6aQxqKdsZBSgRSYtQr6YGs+cV42Skezj
	v9/JhBhYiDNkZS8poeRkowm/hUXif0npNW1rmFmUKBm7Al1M4ln8rw9rSH0wthWlLbuYgWpBmu0x9
	rmzgkqXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGuvA-00000007fwm-0dNW;
	Tue, 11 Jun 2024 06:23:52 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGuv6-00000007fvb-0Jne;
	Tue, 11 Jun 2024 06:23:49 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-250c0555a63so324058fac.1;
        Mon, 10 Jun 2024 23:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718087025; x=1718691825; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bwu883SfM/0WsE+oHlOP/+rRWsvAVxgU1/13gdyKygQ=;
        b=NcE5zuzWGkyXeOMk6vjdLw66TCvno8MIRkdzJlYE8nM+i2PM9tktyEjM2nf8gf2cZL
         K+x/OuAqWwiESx50qNWa6w3oIUfVSxIYfpu5JkBzSTO5iRCHLNZh+4nRf0sbaOabiCvQ
         ioOA8WPfvn0Z4Ex841KnzliL4ZuxY55QkWZwu5lUlLIVd7+irq8xd1va2pkhpa7Xc/KE
         LbfRyCOBZKzmtUnNcYy1XII7aEUpQi5JlgrJXPCcbg3dvKpk+1Rfj89VnvQGfhgvXLPx
         1znuo6/nS3jVAcbDvdQsTObymoAgnySNlg/vX+oTZM0wWMjBUs3BfA7wbwxA5fvHU8Un
         3bjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718087025; x=1718691825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bwu883SfM/0WsE+oHlOP/+rRWsvAVxgU1/13gdyKygQ=;
        b=Kp4umWLHjK/W13+5SBYNqfFqZBhf0r77HEOBscsd1FJSeE6p5EbVKsU4e0ITBgaBIz
         Sc3d2KbvM/OcoNv6RqFmXz0L/aVg8EZa+H6pGU8rIClHrlBSBYT5xnVC0UDd+ZZ+U96H
         4f66JOhvWv3uXt2GrI31UmXZ1+DhcLu/Szg1asshr69701oxnLRY7x5TkXPCDoGkTM0t
         O9h8AP+IGpXT5Wy7t9geiTK/OxQcvsKdePfKwLUmRPHRiKED/z068sLv+zivGJmjN1Ag
         XFdkBw/N0XEEiaG2b4OpWv25VB76XvI92m5hpRzWa/UftSIubO0ajwhYZ6E5UwIhroGt
         vaAw==
X-Forwarded-Encrypted: i=1; AJvYcCVJ/RCz3FhXAxs/ThhnzIEMG+AsCDQuojzo31t3rn1nsTMwDEJFtyP4+Fp6Ij3KC6zMozmzNPxbpndjLZYxC5ykC1t5K9WWnGkOyHzQoaCUQpjkWJr9n6PGMjZo3s6yWGMjCwQTyx+UBN1uF6FYIH7ks5XnvoPEic4=
X-Gm-Message-State: AOJu0Yz5Th1bCPowLqePxlOj0Eg8Pj9VebZ6uob+0XgXcUAo6r6g+6tP
	esj4MpNhhc2TOWRWY8fhYCPBzu9e91nj/pWbwIKJZBeabvvwH3SeEZBFnlwBS3sj3ZpXw0Q9gHN
	ixkJosnfXzvrLVmexrRnJqX5Icvc=
X-Google-Smtp-Source: AGHT+IG7GKYBdo2VQZhbz/IlnZW6BFSpt7hnt+JU/XtiKDIa2WhrA7tPm5LdNleABOooM/PxMePl1/qMK1HEmDC+JC8=
X-Received: by 2002:a05:6870:1719:b0:254:c512:88c6 with SMTP id
 586e51a60fabf-254c5129526mr5243184fac.51.1718087024789; Mon, 10 Jun 2024
 23:23:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240610-md-drivers-pci-controller-v1-1-b998c242df55@quicinc.com>
In-Reply-To: <20240610-md-drivers-pci-controller-v1-1-b998c242df55@quicinc.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Tue, 11 Jun 2024 08:23:33 +0200
Message-ID: <CAMhs-H--0tbqhQzsA0sEzYKET4uJADZyLPNhRBHUL8BGFvjcSA@mail.gmail.com>
Subject: Re: [PATCH] PCI: controller: add missing MODULE_DESCRIPTION() macros
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Will Deacon <will@kernel.org>, 
	Joyce Ooi <joyce.ooi@intel.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Marc Zyngier <maz@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Jianjun Wang <jianjun.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Nirmal Patel <nirmal.patel@linux.intel.com>, 
	Jonathan Derrick <jonathan.derrick@linux.dev>, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_232348_202293_32BB09D9 
X-CRM114-Status: GOOD (  12.26  )
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

On Tue, Jun 11, 2024 at 3:04=E2=80=AFAM Jeff Johnson <quic_jjohnson@quicinc=
.com> wrote:
>
> When ARCH=3Dx86, make allmodconfig && make W=3D1 C=3D1 reports:

[snip]

> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pci/controller/=
pcie-mt7621.o
>
> Add the missing invocations of the MODULE_DESCRIPTION() macro.
>
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

[snip]

> diff --git a/drivers/pci/controller/pcie-mt7621.c b/drivers/pci/controlle=
r/pcie-mt7621.c
> index d97b956e6e57..9989e5e614b9 100644
> --- a/drivers/pci/controller/pcie-mt7621.c
> +++ b/drivers/pci/controller/pcie-mt7621.c
> @@ -549,4 +549,5 @@ static struct platform_driver mt7621_pcie_driver =3D =
{
>  };
>  builtin_platform_driver(mt7621_pcie_driver);
>
> +MODULE_DESCRIPTION("MediaTek MT7621 PCIe controller");
>  MODULE_LICENSE("GPL v2");
>

Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com> # MT7621

Best regards,
   Sergio Paracuellos

