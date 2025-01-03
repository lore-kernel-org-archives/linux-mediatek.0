Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D99C1E77188
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jan 2025 04:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1TLY1yVc6WLt3Hso+aVTpCqq+oLf99tR9IdiOAqJLOM=; b=WCEyx8BSjLeSgUnfEuyQg05/Z3
	XwEQbiDK5T7xQFOh0d5t33C7sx8DdUY7FsDLz8axFu5ZQPWKu4pSEO8gDzYCLFqA03hkf9fW8K0UB
	Seqx6NiseVqmWMOEP6Rl9goxykSGvOB0nB6VlSrGCT5eZyzsmxJmtEGkUf10FaamNRJA+cnzEsSN0
	BpJ1un2tOHXTxHnXURzSoy9UAFIeRhUllKCPiF06CCTFzlA1G4g3iBB8RdsZsibmz/WbT0RMtGPrX
	RQ2SfHw6lIhE6pOsgoKLo8S+x9PK34drRjiZ7FkUqm/6dUcSUKS1mb14qyyLXwlovkvjBWGeX+Q+3
	BvoZf4iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTZLo-0000000C5Aq-3ngY;
	Fri, 03 Jan 2025 04:31:56 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTZKa-0000000C50v-1qmo;
	Fri, 03 Jan 2025 04:30:41 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-29f9e76802aso6494901fac.1;
        Thu, 02 Jan 2025 20:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735878639; x=1736483439; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1TLY1yVc6WLt3Hso+aVTpCqq+oLf99tR9IdiOAqJLOM=;
        b=C3dxOHvj5WyV1yg74biltKW0xN7I7UH+5Do4A+iuMkpKc2WE2fkidcbWrd6IqPYjPI
         bKDoy/tfgB/ursMKLup0NFFllPZNaCRxKEQhnVOHR3gRk4luiKbyWqHibL6LyVt7jJXJ
         UsSwgT8WgtBQ/1fMj6ggUKvGH6MV81MlRP4tfSlJGXdPnxm+Oz6j5B37FZKRLqx1IPmT
         G3vGR91qqSo+D9yGmHLQ+L5kS20WwjoanvqIU67jqE3U/ORnaiQTPoHIQcLZd2SgSNPq
         SaHkUnx/ZmBDqcTicvqQ2P3inV2eC9+qXv1YgPqU6495MtOJSRKqQGsg/TuDb2V/eMVk
         h2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735878639; x=1736483439;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1TLY1yVc6WLt3Hso+aVTpCqq+oLf99tR9IdiOAqJLOM=;
        b=ihpRj6UPO4uNz1KtMcFEfZ3Bp0C69tYKP5tKWiPVCRwi2MVHpcSeNNbhyAO4aDEdU9
         8f0toudpl3waiEZuQUTKzGLTzOBAMzdsKrKLbhaIpsSaUA5ZXRsEVswcaMijN4AYKI2v
         Qmn7M4QJZJtkZLmGjb0t7gaqEBoP4y6X7ibeQ06/GcxRXPqDlEgvLasljhLAlqt7cC4d
         Nx1a9FPgs/WVEvylmYBrVhSJ5jIg5ATX18afUrXn+zh8eTvn6F0QUZRPLqvdzWsF8wgo
         sSZ23HVGr1dpb0MqIXs0WxcI91hRkdiFLuXEgciO+7WSjOCzZUm1LNJgd3DCisCMughf
         6SQg==
X-Forwarded-Encrypted: i=1; AJvYcCVG8s9G5MvYSd38XmAjNjsM71a9rKYwsIkWbzpZsv7BDCGJude9Wke/J5k2NXV20jGUGDn2dfoJPIN3kb+f0tQO@lists.infradead.org, AJvYcCWi0fr1cbSHK8PyWeIjNz8XM0zY19b3GxoN2nfoyZj8Nd1G2rsKYztXb306/jA1uVTWarO6tuUb3glN6msV1Jk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxT4dWeUULKh+CVJHl+GMI/tdjN20Dj1+q3Ig68L0QM4vODndVq
	IsEoyg6l3UO7uI6YsaA68//sLTDCm0O07AGbQkpOFn7/EjlO8soOKlghM7vejy3QnUCAFk5tsPJ
	1ggltkESgXt41fA73ZiiXdPnJn1o=
X-Gm-Gg: ASbGncu66b+dj4uBRhaK4QrnG27rtP0vMPHlENOJhwvqaKIBve907IVa9ht6RwY07Jc
	c7rhQiUMvmTlmdmoFJRM3kRd2sRgDrLT86iKh/C0=
X-Google-Smtp-Source: AGHT+IHD4HDTmkCQq7enHlSc2zkR/V/x6UpQNChtul2dv09FLkLwf6kP1R8r6OsOYbnl7YhPEKXFIGpy/6P7DXB//mc=
X-Received: by 2002:a05:6871:89:b0:29d:ecd6:cee9 with SMTP id
 586e51a60fabf-2a7fcab93a4mr25354779fac.5.1735878639313; Thu, 02 Jan 2025
 20:30:39 -0800 (PST)
MIME-Version: 1.0
References: <20241230034446.1195728-1-karl.li@mediatek.com> <20241230034446.1195728-4-karl.li@mediatek.com>
In-Reply-To: <20241230034446.1195728-4-karl.li@mediatek.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Thu, 2 Jan 2025 22:30:28 -0600
Message-ID: <CABb+yY2G1C7rvsha9qm7mRSk1e_xBahshzHCs39=DzTCUGrsuQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] mailbox: mediatek: Add mtk-apu-mailbox driver
To: "Karl.Li" <karl.li@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Chungying Lu <chungying.lu@mediatek.com>, 
	Chien-Chih Tseng <Chien-Chih.Tseng@mediatek.com>, Andy Teng <Andy.Teng@mediatek.com>, 
	Chen-Yu Tsai <wenst@chromium.org>, Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_203040_481468_947E2D90 
X-CRM114-Status: GOOD (  11.71  )
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

On Sun, Dec 29, 2024 at 9:46=E2=80=AFPM Karl.Li <karl.li@mediatek.com> wrot=
e:
....
> +
> +static irqreturn_t mtk_apu_mailbox_irq(int irq, void *data)
> +{
> +       struct mbox_chan *chan =3D data;
> +       struct mtk_apu_mailbox *apu_mbox =3D get_mtk_apu_mailbox(chan->mb=
ox);
> +       struct mbox_chan *link =3D &apu_mbox->mbox.chans[0];
> +       u8 data_cnt =3D fls(readl(apu_mbox->regs + MTK_APU_MBOX_OUTBOX_IR=
Q));
> +
> +       memcpy_fromio(apu_mbox->msgs.data, apu_mbox->regs + MTK_APU_MBOX_=
OUTBOX,
> +                     sizeof(*apu_mbox->msgs.data) * data_cnt);
> +
> +       mbox_chan_received_data(link, apu_mbox->msgs.data);
> +
> +       return IRQ_WAKE_THREAD;
> +}
> +
You don't seem to do anything that 'ack' the irq line. So if you merge
this into mtk_apu_mailbox_irq_thread() and do
 devm_request_threaded_irq(dev, irq,   NULL,
mtk_apu_mailbox_irq_thread,  IRQF_ONESHOT,  ...);
you can avoid adding a new api and keep your client code simple.
mbox_chan_received_data() is strictly between the client and
controller driver. If it is not called from an atomic context, feel
free to do memcpy() from it.

Cheers!
Jassi

