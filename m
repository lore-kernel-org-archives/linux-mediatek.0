Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C664C5475B
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Mar 2024 07:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UxA3nLt/slK6np8PAwN24d1fWlNcPVJNRrobVCunY/Y=; b=rcpTy1QRF/6woH/yjjdBBMoj6S
	KlIAIgiOv7LhRiWPWwjCrutChswOoSYheZb4c5K/WMcvBRW/8sdveLP6+c9QkhE7xqYvJS+p8jFo3
	xPiePp8WIOxY4Jy8CCg42NgvlHsh/Bu5oBrTa77LQhwx6TKFRreV3HCE1MRh/F4u8KHbqs/gMSubi
	V1qgX954EY1kNMJmTSP/i+gvkVODyxXUAGN0Nl0N58Texy36sOGQtHuB5t92lMyh9lA9OftUjKN9g
	scq4glAwu97rjDlHpKUiC83mLKavtyVycyw/PgChJJIHHY+Jy1t1x1Dy4tJo+8bTKNwmo1/p2kq/a
	kS6rwppA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riUf6-000000088oH-09Di;
	Fri, 08 Mar 2024 07:29:00 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riUf2-000000088nD-0CrU;
	Fri, 08 Mar 2024 07:28:57 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-3c1ea5e54d3so910148b6e.0;
        Thu, 07 Mar 2024 23:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709882934; x=1710487734; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UxA3nLt/slK6np8PAwN24d1fWlNcPVJNRrobVCunY/Y=;
        b=dYqjEL6X1yp+Hc2Qsm3luDjliyZNIIAkYlt8tnz+6kSqPKqLkmI8OH4A7wq/kG7hcV
         6f03Wh1K1DNoi3LTt03kffaBUT6zw2ObqYrR8mronjGAZV9hQFS4xpQa3LOShWhsdjKc
         WAnwjkMFbakZ59kvEYbYBDW9oz59TPFH+rKpAY3wnAoxJupLxyHmpkz2z4Tqd10my2Jj
         /vC9mCm5v74k43ipAuLQ178Kc+gM8PTkxVU1BFMhNCo0+01LU6kg6v2u4KhdzWjsIeNr
         RG1DMiizOjUqPLattRnioTPowoubPwC+HxpzfE3nHv+YvGvlTv4MvBOrdxr7XgypggdM
         tPLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709882934; x=1710487734;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UxA3nLt/slK6np8PAwN24d1fWlNcPVJNRrobVCunY/Y=;
        b=rUGjNK5NDZIiTF8OQPLffMI0gkPK4BvRdK/LzCJC9R4uM8WbksFHPmOTxfrm5AG42e
         Y7iJ612IVOyC/O/bmi/STxWb9kZ2gfvH1JxHfdWqUQa6zQCJP25kyBzCo25Z4jLDJfoS
         menSc1OG0ki6jl1fCA8SOrwRUTYSAxUDjskzFmWNIqyOC3eEqRPukBvCioSc46I2+rJl
         eoN8pC1YDl088beDWSGvEadHcsmxx58xaOsvGPteH9anmKmb11RUzQzZwnBUfu1616dw
         2ztNacUF8JbuXlfOs1xkUmVw2vgDVkD+sizZbZh+8xnCYdU3vpPEEqC8CBtk9VsAUUZ6
         hirg==
X-Forwarded-Encrypted: i=1; AJvYcCXIy5bUoYvHGbSRGpZ7Ia2ryYPXSlsQtnysbloUw2vUEN8o48fQ84efvwG/340s3QHnYvf4P6apdZT5UDlJCjW4bPm/nrcT6Gb7H88SnnxQ3c4FbBtmuXfsHHg6i1bbSXzrzhooUvwZ3wQcxUNxfLCSSoow07YoVN8=
X-Gm-Message-State: AOJu0YwQLGf8LPcE/Lc1ttnmPqWjr5Ro+LJmGNJ2o9J3FCl+4Nwg6ip9
	FmrVscpOOBmQ1/2uiiHC/BaYAFaSBt3MLZd2/wTJpL+InlO/i0xZbOWlhQ74b8qEDX2X5zI1vcW
	XF1EgZukx20xWXDDf+O9+fAHze5w=
X-Google-Smtp-Source: AGHT+IF/CT/cGV7lkH/o5dPPj66u8VzhHm0XCmD8xMiPjei56jMRMTWRgisFzg0z75mEclO+H4kGcFmSDScYl66i91Q=
X-Received: by 2002:a05:6870:9712:b0:221:8915:1cc4 with SMTP id
 n18-20020a056870971200b0022189151cc4mr2507945oaq.12.1709882934739; Thu, 07
 Mar 2024 23:28:54 -0800 (PST)
MIME-Version: 1.0
References: <CAMhs-H_eUKm7C40oCzuKwwEMZAcOJ-g4MghAfkGAmxRM0AXPUw@mail.gmail.com>
 <20240307190408.23443-1-justin.swartz@risingedge.co.za> <20240307190408.23443-3-justin.swartz@risingedge.co.za>
In-Reply-To: <20240307190408.23443-3-justin.swartz@risingedge.co.za>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Fri, 8 Mar 2024 08:28:42 +0100
Message-ID: <CAMhs-H-5Y7iutnqtJX3dfzAj_Dw9DhJPjUKZBZU+1Tqhidx_6g@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mips: dts: ralink: mt7621: add serial1 and serial2 nodes
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
X-CRM114-CacheID: sfid-20240307_232856_324092_D2F2AA29 
X-CRM114-Status: UNSURE (   8.93  )
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

On Thu, Mar 7, 2024 at 8:05=E2=80=AFPM Justin Swartz
<justin.swartz@risingedge.co.za> wrote:
>
> Add serial1 and serial2 nodes to define the existence of
> the MT7621's second and third UARTs.
>
> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>
> ---
>  arch/mips/boot/dts/ralink/mt7621.dtsi | 28 +++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)

Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos

