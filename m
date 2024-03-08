Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA32C54E4A
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Mar 2024 09:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e7wrWKLckR9dwH/ul31j0XrWIjQzUvip9OZaiMJtVGs=; b=zXhk+gToVhcnj+PNwwAcE99Lm2
	GRIjk3yroPKSR19EKAB4B4aGVBDq9hCY8VDPyWWzRxK5JOj7lLHudf+d+i20fm+XoRcf2rfEyHvOT
	rPWcEN5vyV959SG/Z6zhwWssIRT2j6+A5q++4WfBIH+Xen+/J/nJx0kfOb4zgTErFc41Yw5wWuvXd
	KgKAj8V9N7Xu65LLuCRbJHPcDKbNVfcFpIuexBxivVl8fOQy5ClUTgQ9nNS5HPih48sKzAobKyz+4
	adfvNahb9EeKAYDTEgGnZMH5tWXkzukvBmidAnA3c9OmBktHbt/gA2JwTpZ24gb5czkfanJC24jcM
	zJeAEaSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riWac-00000008aEH-1HDE;
	Fri, 08 Mar 2024 09:32:30 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riWaW-00000008aCq-3iTR;
	Fri, 08 Mar 2024 09:32:26 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-221a37a29f5so114811fac.3;
        Fri, 08 Mar 2024 01:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709890343; x=1710495143; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e7wrWKLckR9dwH/ul31j0XrWIjQzUvip9OZaiMJtVGs=;
        b=Af7/BpucGbHuj+2WLMC4tyywO/no5tBbBmd6zJ+2J51i4ZFrIdBWzlxFUvPHbgDGNs
         Dk3mGpNjiBV5w8+/8tZC5rvQ+OoHqnOsFZQ/QGki8llq672gDT42po0B+DB6PA/2csd8
         lyigND36v74YhM0oJ4X03yn383jY79oqI+h+W90FAjE9umSWgYGdd/12dI4Gzmp+B5d1
         I9AioggfmwpedAlXmtpMdBpDtS5C0UPjxBkEDM/kg/ccqMKUD/YdK2yh7gXY7Hl7svQ9
         TbDmupp6eHbz3cNOMbk/K/c+YsSPrOrOMHe5JLQISWn/7xD8CXsn8KDBIhh4sN81vO7u
         Kumw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709890343; x=1710495143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e7wrWKLckR9dwH/ul31j0XrWIjQzUvip9OZaiMJtVGs=;
        b=GMOuEaubM4JSLnHcKTxS8TZZsP012wISFjeEGNY2M8AYaOzFDSddGIRtko/UtERyrt
         DgEZgRVgXDilnv3ETJVwUN69XOjLp/+hLqsx43ITY4DQI2zJVFlw6yv1dChEOpCVb9Cx
         90erQw1d2A9wgV/mHo7QnDydx7nn1HhBAk/1q+BJtw/dkCD3mlozxot+I6BZiyr7NwyQ
         AE1vnjuESPx1SlZvZexeUfh4dB7ZidLPJqqU/VM7x8nQ1ZUwv3lEyfwCf4jNxljp/fga
         i4otv6mTBPJKvhssBl7jXpgT7D+2vbLdtdChhDk94mV3lNaozfCcWXhEKgjRYIjnCm4h
         UOFg==
X-Forwarded-Encrypted: i=1; AJvYcCWO3yn+nrCw+xm4nm2CuRp1wBHwQJ0pIJuo+ZIR1gYJa164RrXlG8CR6UJSFy8yNfcvQjyyBWQwLARvA2Muv3eBIguJI/BBxM1VIf9KX9LdGCftUG5VsFpT+zyG8u+JGwhHL89iQ47O7hnDiMaXMGtAIfpNnpvZZgQ=
X-Gm-Message-State: AOJu0YxI6i+qV0WJwgmD0AUugqCX6VERwblt3qINZJ9lPkcCJ/qapC+g
	JVQqHYWllao3CDI+kEON7ilCYaksrPH/f6XUoXncdb9/qfxr3FXsorHJ9b9GbQbRmUVck8pPd1N
	tAJ5w100b3xJi6dMHZ20DkYuenck=
X-Google-Smtp-Source: AGHT+IGacdulsw0UFb3sV/FTp+egnN/XnS6ykv5Ng+mKb56dZEwnb3aIMac6MUYw3XaqOLGnIGe4ULUlcpk37CqqAVk=
X-Received: by 2002:a05:6870:819e:b0:221:96fb:9ca5 with SMTP id
 k30-20020a056870819e00b0022196fb9ca5mr1765584oae.33.1709890342746; Fri, 08
 Mar 2024 01:32:22 -0800 (PST)
MIME-Version: 1.0
References: <20240307223756.31643-1-justin.swartz@risingedge.co.za>
In-Reply-To: <20240307223756.31643-1-justin.swartz@risingedge.co.za>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Fri, 8 Mar 2024 10:32:10 +0100
Message-ID: <CAMhs-H_W7WL1ss6Htk8zCxuerF4EzsQR95FfVvdBai1rSCthKg@mail.gmail.com>
Subject: Re: [PATCH v2] mips: dts: ralink: mt7621: add cell count properties
 to usb
To: Justin Swartz <justin.swartz@risingedge.co.za>
Cc: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-mips@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_013224_952466_E6CCF638 
X-CRM114-Status: GOOD (  14.37  )
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

On Thu, Mar 7, 2024 at 11:39=E2=80=AFPM Justin Swartz
<justin.swartz@risingedge.co.za> wrote:
>
> Add default #address-cells and #size-cells properties to the
> usb node, which should be suitable for hubs and devices without
> explicitly declared interface nodes, as:
>
>   "#address-cells":
>     description: should be 1 for hub nodes with device nodes,
>       should be 2 for device nodes with interface nodes.
>     enum: [1, 2]
>
>   "#size-cells":
>     const: 0
>
> -- Documentation/devicetree/bindings/usb/usb-device.yaml
>
> This version of the patch places the properties according to
> the order recommended by:
>
>    Documentation/devicetree/bindings/dts-coding-style.rst

Drop these three lines, this explanation would be after --- line as
information about the changes from v1.

>
> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>
> ---
>  arch/mips/boot/dts/ralink/mt7621.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

With the three lines removal addressed:
Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Best regards,
    Sergio Paracuellos

