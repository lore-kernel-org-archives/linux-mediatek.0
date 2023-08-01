Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB997C0015E
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Aug 2023 06:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LKCc2rKXf8V4+XCXWPe8OLQkPwapI0w4aGB/FpbSmi4=; b=ivdd5sWyGX2s/+ND5pCSC/sLAq
	mScbcDLWP17CrjgrfIE4akAFiKDR4pFh2kKg0tHNOungEYuJFstiNQ3zbGeOm6vfmruAke8AENf9B
	3LkSCFQunXKhEx5fgYQM2ZbNXJNdU/FCPj2fDQA9WVfsMaqBCmWnlHE+nOH7EXthPPhIm2Brf9Vko
	C6zAP0rHM2Fwc8OEJeusb4lHJjxT6JTXRlyb4mbOlrZUS+1rAOCDRxROcWXDDKrSGaC2r8cM/aIVE
	Wm+68kZeXSZjaU87/JGCtkiTt7fqcpzsshWopu6LEeUNE5bhXgaCjeysrVCN4ufj+gCEYjxm6sE/q
	kcB05dWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQixH-000TC2-2e;
	Tue, 01 Aug 2023 06:34:03 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQixE-000TBK-0a;
	Tue, 01 Aug 2023 06:34:01 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-565db4666d7so3975703eaf.0;
        Mon, 31 Jul 2023 23:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690871638; x=1691476438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LKCc2rKXf8V4+XCXWPe8OLQkPwapI0w4aGB/FpbSmi4=;
        b=qiemk3mohhg+xAOpbLyh75xBQ0XBf+pyKp8+mn3/iwJr7lb/d6K4Jmd2CT/3NhGxpJ
         0ig6IJLsSCSM2hjvFqaaE7KRNu/sRSEGscDbk64GseP1uJjscnZNEwJ8nR7gqCrvYNzp
         IJTtYU/ZnEDQMWEDnHb5vDTYldERmJUQC0kziFDooKMObuBg0P0TIUTM1AHWA2tQ65ME
         YATRzqFKFQHCn7POVF9LZMKIfw1mQYVFRJkNHd6tszZ01Hd5lECAcuXlfjvrNPCa2dt4
         kEjF0YibGo2edUsW373dRNmgFcE5zHwPlEAazqLFOaVbpk2oNq5o4AJ1JVxN4OetErIH
         VcfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690871638; x=1691476438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LKCc2rKXf8V4+XCXWPe8OLQkPwapI0w4aGB/FpbSmi4=;
        b=Q9BH0ZADDhvU4d0vLLH3eH9Y8TG85qOcz0HSH1Jz70922ItodK1JV37uwJfstgUNCD
         HwJZKTbmW+6lX2cFvdRiNH5b7B3/OUKLebrLddqZyo8xBntE5ocd84nvb4MHDu1xbOek
         vKRPrRsvw63texVHLSmqqese8unJKkyysAlual3cq174DCrhQP/jnWcl1iY45dyqfCLF
         rwru/yEx/wnoRbmBQM+ru/gDwtxlBvcHMrVj7vxk08iP0s3G1dsjW5z7+y2ttsh068D6
         fBIHx/obTH06N4CK3wz7PXzEjcSQPTonPRfquC+a4NikClHoEquHkJ7YpS35aKYJcOYT
         fZfw==
X-Gm-Message-State: ABy/qLY05L1Z/MsZ+QHuk72Jh6bgDVea9yMXqt3bjWtngZMlriappYqg
	7SYxNxsSo0T5Bw/Y/WI5dHEg0BCLUUoAigLNmts=
X-Google-Smtp-Source: APBJJlE7oK2nlXq2a2uZW19q6boXQ0GoIFtAt0DViwCQHqSjaq44TkYovJHXpkKu7Yr24VlvKFZwqsDS2UMCA9m0Fsc=
X-Received: by 2002:a4a:9c03:0:b0:565:bbc0:2e36 with SMTP id
 y3-20020a4a9c03000000b00565bbc02e36mr10919110ooj.3.1690871637923; Mon, 31 Jul
 2023 23:33:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230729110449.1357-1-zajec5@gmail.com>
In-Reply-To: <20230729110449.1357-1-zajec5@gmail.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Tue, 1 Aug 2023 08:33:45 +0200
Message-ID: <CAMhs-H9RpyCTcrRjtALg_aqGR7cmrz_ufQdVYm=WSEgUObpxKA@mail.gmail.com>
Subject: Re: [PATCH] mips: dts: ralink: reorder MT7621 clocks in Ethernet block
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_233400_239198_49E38943 
X-CRM114-Status: GOOD (  13.15  )
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

On Sat, Jul 29, 2023 at 1:04=E2=80=AFPM Rafa=C5=82 Mi=C5=82ecki <zajec5@gma=
il.com> wrote:
>
> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>
> Use order as specified in the binding (first "ethif" then "fe").
>
> This fixes:
> arch/mips/boot/dts/ralink/mt7621-tplink-hc220-g5-v1.dtb: ethernet@1e10000=
0: clock-names:0: 'ethif' was expected
>         From schema: Documentation/devicetree/bindings/net/mediatek,net.y=
aml
> arch/mips/boot/dts/ralink/mt7621-tplink-hc220-g5-v1.dtb: ethernet@1e10000=
0: clock-names:1: 'fe' was expected
>         From schema: Documentation/devicetree/bindings/net/mediatek,net.y=
aml
>
> Fixes: 7a6ee0bbab25 ("mips: dts: ralink: add MT7621 SoC")
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> ---
>  arch/mips/boot/dts/ralink/mt7621.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>

Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos

