Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB5CAC678D4
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Mar 2023 15:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qtBLJgimyjUZrCTww2/nWMue86SQPNFkXsRzufY3H1M=; b=0zVcKUk2+SpCZxxD+Blu5/adU7
	/9AiNC8isu8qAnt0+AOHHdWrClIdE6CKnEIJtMJmMUhvjiLu/FZSmp5MHE83enLdv9u+DVRw2i2up
	otc7n65NRnGhPu1jENxPKxbX2g2Hr/biEqHZ9FelfDvW+0XoFWnd01M2KKlzbcU7G0zLYrMtpdtgq
	vleBiPdj4HtssFhD+4vhJ4bWeICDypn8CcVBK4PLp6YpBt4t1IumntDGtlicBo/TYKiuzAZK8EItb
	zmjCzFDpuxcl545cykJeFNUPulpYRjHCMPp0KF5vWrovo7C5wUHwXz7gE7QabKn5uaBMSoSkw4rpx
	vCJWEPeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZCKT-00DV2X-2O; Mon, 06 Mar 2023 15:00:45 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZBEq-00CzXE-H3
	for linux-mediatek@lists.infradead.org; Mon, 06 Mar 2023 13:50:53 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id v13so8169319ybu.0
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Mar 2023 05:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678110651;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qtBLJgimyjUZrCTww2/nWMue86SQPNFkXsRzufY3H1M=;
        b=nc9A9BUpW53D5PqzzSiCD8QKIAcg5XrB2jR86Oy0dZxkV4hhjo5VfvM2uduB61dLDj
         g1SWXSUkXv8D8/jIa0Tafirdeu18wsaUUswPJgyWhU6GsO93pQgfnAnD/rB+IwPzhgeC
         JwkneIEmHW06XTirUjlEhyQrl+SL1XhlkX8/Yhad7MsPn2T9W2bbozKPGCRugTkPUjR3
         84KyRdnWPXCnLw2rTL6UAIKarmZ01/1pruEe3yXmsVmrbUAP468DhAVef1Ie/9PblIiz
         4EepnkIsybOmCNCc8g8kg1hRc6/2uKnlTnZ+aMC0pBc5JnR7kN1LVV1dBWB9jM1FqU58
         txLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678110651;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qtBLJgimyjUZrCTww2/nWMue86SQPNFkXsRzufY3H1M=;
        b=l9pK9nB2Wtk/ySjNL4bzJkq9MTyeAxmpMUu9n6bWaXoPJe1zLN8L6QD94DWCiBkORl
         3/LUF6oUN+i/xUjh0PyexrBlPZ1/A1zQtACmwuC2G+vywtFAt8h+uPpyUoNUJo9ENSBg
         HWUtZCyO4ZNSnkowY/Cpqtw7Wx5KZBNDJo+mcCVmYyjGisGUVZ+9UeQCBVBmVtjy6ToF
         nsS9hPrIhHwMInC35xl23/vDIf8EaLo/JLrtUyJ6ohDmkYp3shd1A8k1jir+velqKB5Y
         rPUOqZnZqE+tVBjZpUT20o0IwqWr1xxVMvij435dZzxFOQN0sbJm+kT/zgRmWdJ9Qj+O
         B3Dw==
X-Gm-Message-State: AO0yUKWqxX7ONMS+tdph/Q1awFa8fm/H5jpeSoAbIWohpb5Kj9ccTfkj
	JDl5qfsXKZQxQYRRARDCu+ved80UXJGzfLy8VR7sbQ==
X-Google-Smtp-Source: AK7set8JTNHF8MypTSPIeonQB8cYtk4+/oxJ7RhvaeapmVYTL7Epb5DAM67FQFkpGywXUdj7a90T61UM6PiJJ3f86BU=
X-Received: by 2002:a5b:384:0:b0:a65:8cd3:fc4 with SMTP id k4-20020a5b0384000000b00a658cd30fc4mr6353160ybp.5.1678110651682;
 Mon, 06 Mar 2023 05:50:51 -0800 (PST)
MIME-Version: 1.0
References: <20230303002850.51858-1-arinc.unal@arinc9.com>
In-Reply-To: <20230303002850.51858-1-arinc.unal@arinc9.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 6 Mar 2023 14:50:40 +0100
Message-ID: <CACRpkdayVLTT0x6hfnwvL-Atafkj8PRw5uwe7Wic3jtn+X-axA@mail.gmail.com>
Subject: Re: [PATCH 00/20] pinctrl: ralink: fix ABI, improve driver, move to
 mediatek, improve dt-bindings
To: arinc9.unal@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_055052_592066_4CC23721 
X-CRM114-Status: UNSURE (   8.38  )
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
Cc: devicetree@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, Sean Wang <sean.wang@mediatek.com>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, Daniel Santos <daniel.santos@pobox.com>, Sean Wang <sean.wang@kernel.org>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, William Dean <williamsukatube@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Mar 3, 2023 at 1:29 AM <arinc9.unal@gmail.com> wrote:

> [PATCH 00/20] pinctrl: ralink: fix ABI, improve driver, move to mediatek, improve dt-bindings
>
> This is an ambitious effort I've been wanting to do for months.

Good with ambitions :)

As long as Sergio is on board and can test the changes and as long
as the DT maintainers do not explicitly disapprove, I'm game to merge
this.

I guess you will respin on top of v6.3-rc1 when the first round of
non-RFC feedback is collected.

Yours,
Linus Walleij

