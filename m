Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 765D9C678D4
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Mar 2023 14:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=voEN8gET+7DiUcyJQtCG0y4HhLJdTYcLogFd10E8rrc=; b=IA1P3QxuZpNWtEcxHRSzV8FS9W
	yXO6JgZdyx5ABKNIBu2glamef87B/Y+B7E/8oKpJz7stT8oU4rMd+pSS8y+F3vlGdZgvfQEMohCEE
	aofG5fz1t19ZiV/8Te/25aKT+fVAIvu1yuwJnwNfX7HiIl5LV9f9WNz47EtHH0zG/ZNfuGfQLA4AB
	QBsSyatOgInijQgsaKTeOvOMk14zZ7HtYIsW0BKL+eJ06DD++28nT1h8nKbdFr+IAJsNvRirDbACX
	/Lu3/27FqpheJZAF7c9td4+8H6nIobKHjBx06k0sMF1n51ZrjpUxsl4f3DQg4q00cRb9Y8XzL1kn+
	RenZjYKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZC7f-00DPAF-TI; Mon, 06 Mar 2023 14:47:31 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZBeo-00DA54-M0; Mon, 06 Mar 2023 14:17:44 +0000
Received: by mail-ot1-x336.google.com with SMTP id f19-20020a9d5f13000000b00693ce5a2f3eso5362608oti.8;
        Mon, 06 Mar 2023 06:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678112258;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=voEN8gET+7DiUcyJQtCG0y4HhLJdTYcLogFd10E8rrc=;
        b=jEq/ashKzXcjAsHUrZsxHmSfodeOrA1neOKOBXbu/ZfnQr+sFhmgIHqbU2o7mV3aSV
         B5B2N9vjVC+20KpC1YCN2bKxqLAqZO2vRgYyMWiyuhObthLY1VZOQD4utxF0r/qP8/9q
         HUTaFD2YwJ5W3Qx6t0+7Aky40oVmhiDjSrgVkHHB53967ja1l8PvRO9sg04KFEbEBeHX
         Y5jX/DiuqK0EVsAc1Z4g3JDnl5K6O05c1KgSpOvhdUn00qpodfnnvdnZemXDIcuu9ghu
         lErNN4+gLVyBuD3QcVQoXZMSSJ15cb7Kf376ogFZSx7Zm3/HY48Mqhgtvr19mEhLB+3a
         nhZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678112258;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=voEN8gET+7DiUcyJQtCG0y4HhLJdTYcLogFd10E8rrc=;
        b=Rw1avjZiniHiCDGKEEY5UE3SmCsbOetsQxAPErfP4HL8fLJSoXOR1g+yLhDxHF8ldK
         DzyiWPNz+wmak1gXB4e9r+dqQX1D1crw8ZdAiPfq0/mZTERN7IZ6bzbPO2eh8OgvHu5U
         XGRDQzHMXqqSyY7vlUDOBfK8LVTWHzdhLNNW6OiTiMHB4eYrNJ1Y85Py6Wk0cUC6XHUn
         Yzmea4qLWab+TDBHlVQ2bo8DbLth22e0Z1QtRHhk9d+/SNORQN+FqwF0lHc5AwylSjYD
         uAej4nWJJopaMIJGNOOLMBjofBxXrthtmypDFdmGS+KVIkjhzIB6jkJSiNwMSTzjJAfK
         vOXg==
X-Gm-Message-State: AO0yUKV29TMAUkbTLWpcsr1M4im2yTR0zKJqIrAlYOJomB9fIk3sA2ts
	nXFsWcCN0M7HiU8RTOgS9beTw2dTrmbTLigzbCg=
X-Google-Smtp-Source: AK7set/d3V10QGAOVH0x9a7k8hdACyp9ie6Qu3VysSW6Jhcs32oGP3s/xpbqNZ6TCg8IkG0+wiyaJ3fxnmczf1DQxVs=
X-Received: by 2002:a05:6830:2464:b0:693:d8a3:1f15 with SMTP id
 x36-20020a056830246400b00693d8a31f15mr3295162otr.6.1678112258230; Mon, 06 Mar
 2023 06:17:38 -0800 (PST)
MIME-Version: 1.0
References: <20230303002850.51858-1-arinc.unal@arinc9.com> <CACRpkdayVLTT0x6hfnwvL-Atafkj8PRw5uwe7Wic3jtn+X-axA@mail.gmail.com>
In-Reply-To: <CACRpkdayVLTT0x6hfnwvL-Atafkj8PRw5uwe7Wic3jtn+X-axA@mail.gmail.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Mon, 6 Mar 2023 15:17:25 +0100
Message-ID: <CAMhs-H91yT_Fvuis6dVRaunMKajEcF+GwXUb2pdrtWyEFbt2wA@mail.gmail.com>
Subject: Re: [PATCH 00/20] pinctrl: ralink: fix ABI, improve driver, move to
 mediatek, improve dt-bindings
To: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_061742_873926_688D64CB 
X-CRM114-Status: GOOD (  17.75  )
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
Cc: devicetree@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, arinc9.unal@gmail.com, Sean Wang <sean.wang@mediatek.com>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, Daniel Santos <daniel.santos@pobox.com>, Sean Wang <sean.wang@kernel.org>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, William Dean <williamsukatube@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Mar 6, 2023 at 2:50 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Fri, Mar 3, 2023 at 1:29 AM <arinc9.unal@gmail.com> wrote:
>
> > [PATCH 00/20] pinctrl: ralink: fix ABI, improve driver, move to mediatek, improve dt-bindings
> >
> > This is an ambitious effort I've been wanting to do for months.
>
> Good with ambitions :)
>
> As long as Sergio is on board and can test the changes and as long
> as the DT maintainers do not explicitly disapprove, I'm game to merge
> this.

For sure I am :-). Changes in code are pretty straightforward. The
real big change is just a split of mt7620 and mt76x8 in two different
files. But the split looks good to me. The other bulk of changes is
just moving files around. If DT maintainers are finally ok with the
changes I will try to make time to test this series in a rt5350 SoC
based board I think I have somewhere and on mt7621 SoC based one. Most
of my ralink boards are based on mt7621 so I don't have more platforms
to test this pinctrl changes :(.

>
> I guess you will respin on top of v6.3-rc1 when the first round of
> non-RFC feedback is collected.
>
> Yours,
> Linus Walleij

Thanks,
    Sergio Paracuellos

