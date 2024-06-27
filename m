Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFBFFC3064D
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jun 2024 19:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zv0KLD3h/W/zhxl0YJJY2YY18xekrKnjE/8fq4KEre0=; b=gHm98NdYIZK2/h4DTDOuutDQ29
	xDSlWv4BRYuUmjH+F6rWFWPXuHHP5xMfr4zTApTDq9EYiaymHM2/29E9aEcai2EglA7vPDIQXXoSV
	9g6Z+f8UvAKF3sLe/G1ukZFK0UkBdYU1JBnNKRa2ClJvjAu9FyiehzHWaPBU7Pp4SvgKLBUZ6+Kb0
	5BhEdjDtOgnPH6VPXX9DvHBSVAlDkYiN4fv7oLQpjq69dcWYxcYUCiUUsdRfEAls9s1KmlLbKvCH0
	rsZnn8RmzwSeubW60QT9YThJWS87yiCv6e5yV2E0AJR+lY9J4d/UFp4WEEvV8S0T8uy60M3lnfmDC
	aoF1PD4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMuP2-0000000BSEP-1AbH;
	Thu, 27 Jun 2024 19:03:28 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMuOt-0000000BSCs-0j9q;
	Thu, 27 Jun 2024 19:03:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7F0E5CE33C5;
	Thu, 27 Jun 2024 19:03:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 594DDC4AF0F;
	Thu, 27 Jun 2024 19:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719514996;
	bh=s4oEpDuEzHamdfCowVPpqqZfwSmm25BkIYA5zE16y/A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=flFAOU3mB4XigsWmmjauBMrKEBDeX1+nlGJuXL/zzNIjrrR8INDJFGHsOlpxGYL6c
	 HkJXVLBdyPfhfYZkeyxZ+ZHDjJ2A3PlidM/rUi02WuqEmqbv3vMi3nSGiTKneEmPG3
	 tvrM3pY8oH5W1GNqYmBHdKOarQGFHcHIOcxl11ZRa/8V3QBWrIoUsbG5TQsL7gZd36
	 w7mxcRkJHayxAQQZZuZdBCEF5L++ry71qHbTO/V/NLmteS1q3CrIi7WkohJ4RYnRq7
	 gHtrPMriQ7oBodIg1RXydoLFmJmtx1D4nH9JZ5KcGSMLGn03FR+wBpRKu7T2bi6YLo
	 RcD5HI1ktx0zQ==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52ccc40e72eso6211733e87.3;
        Thu, 27 Jun 2024 12:03:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXpz2jlNYge2+4/IMEXIsI7fzX59M7t6dDbbQLWXJu4mzxqckKynl6kvo7HYJll5qQksEsZ84Lfv7t10339TF/4jlXzUA99NO1H+9uBSjwK6YxXIedgFrE1o2FKZ2bjun12kND0rie5EmSJadvJ8dOLBIC3Wf0Lwhs=
X-Gm-Message-State: AOJu0Yz43God1LtHB3tRBs/A3vF7GBAUcRTKKzLyjIkIyjWnN37Jw8nB
	cks0cWWHy5dd4YL0bhyHtMmWqK5bcZHa5DVagk+feaX/k/A3JnaFR/pQe0Wc5GhJPsVO0uSCvMz
	nJeZ1M9vAdqyfQiAzfAsmLTyaCQ==
X-Google-Smtp-Source: AGHT+IERpqYkHVSBMBLutpKK8Ckx8P+bb/s9EpxdS6FVvg+rabR/H1UO1yWL4pgy8bPuumt8TnDS170ObiA6rFOR7/k=
X-Received: by 2002:ac2:54a8:0:b0:52c:da18:6187 with SMTP id
 2adb3069b0e04-52ce185d05fmr10828916e87.43.1719514994561; Thu, 27 Jun 2024
 12:03:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240625215442.190557-2-robh@kernel.org> <gr7rgy7cptnpj2rkeufhgqkve4ytqddpts6gdekeszoq7znwf2@ivyjpaiyxruk>
In-Reply-To: <gr7rgy7cptnpj2rkeufhgqkve4ytqddpts6gdekeszoq7znwf2@ivyjpaiyxruk>
From: Rob Herring <robh@kernel.org>
Date: Thu, 27 Jun 2024 13:03:01 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLYHbr=Wqg-S0t_hK3uDATe9KKob9chFGFnoTcyt2ttyg@mail.gmail.com>
Message-ID: <CAL_JsqLYHbr=Wqg-S0t_hK3uDATe9KKob9chFGFnoTcyt2ttyg@mail.gmail.com>
Subject: Re: [PATCH net-next] dt-bindings: net: Define properties at top-level
To: Serge Semin <fancer.lancer@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_120319_592506_EBED2B61 
X-CRM114-Status: GOOD (  17.23  )
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

On Wed, Jun 26, 2024 at 9:05=E2=80=AFAM Serge Semin <fancer.lancer@gmail.co=
m> wrote:
>
> Hi Rob
>
> On Tue, Jun 25, 2024 at 03:54:41PM -0600, Rob Herring (Arm) wrote:
> > Convention is DT schemas should define all properties at the top-level
> > and not inside of if/then schemas. That minimizes the if/then schemas
> > and is more future proof.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> >  .../devicetree/bindings/net/mediatek,net.yaml |  28 +--
>
> >  .../devicetree/bindings/net/snps,dwmac.yaml   | 167 +++++++++---------
>
> For Synopsys DW MACs you can just move the PBL-properties constraints to
> the top-level schema part with no compatible-based conditional
> validation left. It's because the DMA PBL settings are available on all t=
he
> DW MAC IP-cores (DW MAC, DW GMAC, DW QoS Eth, DW XGMAC, DW XLGMAC).
> Moreover the STMMAC driver responsible for the DW MAC device handling
> parses the pbl* properties for all IP-cores irrespective from the
> device compatible string.

That's definitely better. Will still need the TSO flag part though,
really, who cares if someone wants to set that on h/w without TSO...

>
> Alternatively you can just merge in the attached patch, which BTW you
> have already reviewed sometime ago.

Can you send that to the list since it changed from the last version.

Rob

