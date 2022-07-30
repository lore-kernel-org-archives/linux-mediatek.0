Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E08FC04A68
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Jul 2022 09:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rrdKDJbtGqa5viWukiN2p7Td+Kx3OFsE5gH0u7qT+jU=; b=nimFnmfo2qvnZO
	b2+a2ZKHQpEq1z+PFP4Wdrg5XN+nKQ+VmfpNmmPsXKt18j1H8Jvey75qYmoNRYheHotEXVAGXUtBH
	evaypw3Peu7MiWvt5rQo/dW42qjO5aiYEt0jwUv+Q6xdvTZTg5yQaBOdnJKTNRNrcGkOMRvSI5fZH
	gfR7tRODFwinu/KW6jr3h3ZX+msGk0M0rcpU093aku6LN326K7sK7Q7xv0B7LeL9yErIEZFVRXzjT
	Zr4iPduiwFy1G6D+xRH3ADQPSN+x4b6SC5XygMwiCWT9lgBv0ByBjLf53+Kz5TjoCOKD/v6R84kbG
	izw7kRR+FtLSt/uFIfoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHio4-00H18L-IS; Sat, 30 Jul 2022 09:30:48 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHint-00H13r-2H; Sat, 30 Jul 2022 09:30:38 +0000
Received: by mail-pg1-x52a.google.com with SMTP id q16so5754992pgq.6;
        Sat, 30 Jul 2022 02:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rrdKDJbtGqa5viWukiN2p7Td+Kx3OFsE5gH0u7qT+jU=;
        b=RRfQHaMAO4mu/wyFZRz7MFqoYB3wwHE2gYR7h9+xQYhNKRKnLDnzRu9hOEhVvrfxpG
         VGG4BPeC8llyWTW9J2yo/ExyFhkJsvTpY9NdtwMwJP13dTYHmQB3MGFTucTYHX4va6Qx
         dhTIN4FhtKJouj2dcSwif8SN9HihuEa6NdIRFyc5Cn0A2tRytz4suhyg6VcvbqMmcLvt
         W+i5A37iV1PLjN8zXmMkGU7rMg4HXRNrPEidZgoCIudr7hHDSkTJq5XrfxosWP09daQI
         /u1TFjRfLOcOxb8WXw5hYLBpMg05Pg7o4cGNRWmX936WpedNdubM/KQYyTFQvIionvIl
         gy0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rrdKDJbtGqa5viWukiN2p7Td+Kx3OFsE5gH0u7qT+jU=;
        b=r289zWWMjzryLEGZJLPEfr/xXQeS69ZEL+BfhCDqe4RzryO4w9E4zqfYUiIhc2AQvx
         MlXufdF5RGrhvRN0nowql8JW7JY8QOFAE8TSGOwGWeLtAJzq3P86nh9xcQwTXgGviIyd
         B+ZqtWG1+uy8lqlW4iteycd2RqtwEBQj17Jnv5ORYFQ3QEMbiMa8IzwR+6vRxfAR4uWn
         nd3ev5xizHO6Q0bi/J8kRWvkPgUQU4ubrCcxXDbNpN4THdR3VSuzht1OihjztgM31Ald
         U3aKDEO7vEVfWUXPC+xlUlMbPWXLnY7O+ZBG0mk/zKILU38PIBOJKeQF5ah177evncBu
         3e+g==
X-Gm-Message-State: AJIora89BbHftSqhgtkPZqpgvOhQzdlDHsYdjJnKgrBRriE8g3I9Jj/z
	1GgktGZPPgA7M75ckKYCBcmRnTdl2IzMsD2a+nI=
X-Google-Smtp-Source: AGRyM1uEHExAwDPMjqjRxs4fCYjmwCx9oX7UsRv4rOEZkJCal6Y3x7tqTVyR4ThmsAcK5LLhRnvu4PQuU70eM2+FnxY=
X-Received: by 2002:a65:4b8c:0:b0:41b:cbd:b9c4 with SMTP id
 t12-20020a654b8c000000b0041b0cbdb9c4mr5938371pgq.128.1659173433579; Sat, 30
 Jul 2022 02:30:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220726122406.31043-1-arinc.unal@arinc9.com> <YuK193gAQ+Rwe26s@makrotopia.org>
 <980c9926-9199-9b6e-aa65-6b5276af5d70@arinc9.com>
In-Reply-To: <980c9926-9199-9b6e-aa65-6b5276af5d70@arinc9.com>
From: DENG Qingfang <dqfext@gmail.com>
Date: Sat, 30 Jul 2022 17:30:23 +0800
Message-ID: <CALW65jYfcfND4QiD=8OhMCgW0LZMSBYmVZK5Ce8u3cMPh+8Rdg@mail.gmail.com>
Subject: Re: [RFC PATCH net-next] dt-bindings: net: dsa: mediatek,mt7530:
 completely rework binding
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220730_023037_148713_7FA807E3 
X-CRM114-Status: UNSURE (   7.54  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Sander Vanheule <sander@svanheule.net>, linux-kernel <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, erkin.bozoglu@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Vivien Didelot <vivien.didelot@gmail.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, Rob Herring <robh+dt@kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Matthias Brugger <matthias.bgg@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, netdev <netdev@vger.kernel.org>, Daniel Golle <daniel@makrotopia.org>, Vladimir Oltean <olteanv@gmail.com>, "David S . Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Jul 30, 2022 at 5:15 PM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc=
9.com> wrote:
> Thanks Daniel. To be precise, this is the case for MT7620AN, MT7620DA,
> MT7620DAN, MT7620NN, MT7628AN, MT7628DAN, MT7628DBN, MT7628KN, MT7628NN,
> MT7688AN and MT7688KN SoCs as all include a 5p FE switch according to
> Russia hosted WikiDevi.

MT76x8 series uses a different switch IP.
>
> I'll update the description accordingly.
>
> Ar=C4=B1n=C3=A7

