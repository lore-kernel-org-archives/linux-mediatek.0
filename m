Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C37B4C25B50
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Jan 2023 09:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5+6RKzh8/Lt7v29Nl9d79EntHpnCiB9/8mqrAnMy3gQ=; b=kJLCZ/7HbYk7PjkJJ/IW0EoOwH
	ov93sh2V1IAFCTO0SvMI12k18WvMl2+YfC1LubRnRphPKtm52I208YzLjMWguk7Ong95Se5hUn4zP
	sJDmf78gWkhc2F5pvkv0vOY6HRDWaZNC+tEAj3chLR7BblN9hPn9yx+lbJlAb4XHAgZqShdsJ4KeN
	AFuqWFrqV0UkySDVM4SMwEK4OZVWgxH5nBoDFABZxTIQriauU5n0KKsJaOLCt79qiAPatJEX22qNT
	vMKvKwHeT6GPvlpTYYJLegvcqIAG5BtN+ZK8KG1JxAxFOqYI6q/iwOqoYyqMrG7mstG2s95dzv4Jx
	CC89EcSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJtHO-00GXub-Ji; Mon, 23 Jan 2023 09:38:18 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJtHK-00GXt9-4g
	for linux-mediatek@lists.infradead.org; Mon, 23 Jan 2023 09:38:17 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id 123so13992462ybv.6
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Jan 2023 01:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5+6RKzh8/Lt7v29Nl9d79EntHpnCiB9/8mqrAnMy3gQ=;
        b=WeH++WcLNYyMKGf2E2zv8fRfVxHuz1bBP6rzSLVY/1sA+qMk5VJv9VqFdFfHmMkHx2
         3TK4on2ONCWbxtooazRn2zlREFQzvisCf1eiU9DfFoS7s1KNn3gLVJSZB+RYQNAJyQ6Z
         25IRNyNFjJp2poy8ZKVK8DiXNeUk7ETBAlJrru3Yk77C3FFx3LSSTX4JSh2HOruHWKFE
         QqJF1GCJsqsO9oK3BF4LekiCTQfo19tlHGwzkA74mlDwM+/x5OS3GK9EV7aTPwNIPS+7
         7YBFDa3F0wBfOA84nLvJAh0siJapfjp8BLjl8jcXfMw9zhyH4NBJ+oriZ8GXZrda4ee7
         77Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5+6RKzh8/Lt7v29Nl9d79EntHpnCiB9/8mqrAnMy3gQ=;
        b=rEFeJuXhpg/oHJfGgRrHr/EKH5WXJPkx/XscUy3Q/hYS47FG8xCG7OV9J4kgXyxbl5
         jiaxOcsKo8zx4Z7g/2I1zag3gL+YBgdGpiwbpUxcllt7D+utrb+hrDoWnUwoPhzSppm6
         c20o5vWl2TK9PE46Phr+Slvk4TklXiG8nVauc2SRr+ivOZYT0Gd7UIus7fbyMz1OceSi
         MzFXpQxea+HT+2ZU18FzNdRB1EaIUaGd751vFPAruf9P+yIOnHF5WqMChPXBuqh8f7Q4
         Upw0c5jqN5TAmsmXrRobpGYkArdNF2fU3tqaktuShxb0dEoy14osn+11mAtWLHypIE6y
         8nWw==
X-Gm-Message-State: AFqh2kpQMpsO2Gz0OvfR5Rna1Uov9sR1+NlKG/ochvEx8IHIWq4ObaK8
	8n2ycmFdwdNy7+hX+qonu7eD37+/xM7r051AvdI5vA==
X-Google-Smtp-Source: AMrXdXuyGc4+CKGV7sHJ9YCNKzHlgrK8Jcq0Xwvkw40LgTEpzAUjXXmlBpQFuOBcJuWIcbR2wsacTUkpk9GeEMJ6a50=
X-Received: by 2002:a5b:4d2:0:b0:707:473f:b763 with SMTP id
 u18-20020a5b04d2000000b00707473fb763mr2791131ybp.158.1674466690342; Mon, 23
 Jan 2023 01:38:10 -0800 (PST)
MIME-Version: 1.0
References: <20230118-mt8365-spi-support-v1-2-842a21e50494@baylibre.com> <20230120082054.610626-1-michael@walle.cc>
In-Reply-To: <20230120082054.610626-1-michael@walle.cc>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 23 Jan 2023 10:37:58 +0100
Message-ID: <CAFGrd9qXL-u4XzG9MLK2zbKoDudhTYpr-gJaZPjbysJ9Fo2gnQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] spi: spidev: add new mediatek support
To: Michael Walle <michael@walle.cc>
Cc: broonie@kernel.org, devicetree@vger.kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-spi@vger.kernel.org, matthias.bgg@gmail.com, robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_013814_417138_051064B2 
X-CRM114-Status: GOOD (  12.85  )
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

Le ven. 20 janv. 2023 =C3=A0 09:20, Michael Walle <michael@walle.cc> a =C3=
=A9crit :
>
> From: Alexandre Mergnat <amergnat@baylibre.com>
>
> > Add the "mediatek,genio" compatible string to support Mediatek
> > SPI controller on the genio boards.
>
> What is the use case of having the spidev? What if I want to
> connect a device with a linux driver to it? It seems like you
> just want to expose the SPI bus on the pin header. There was a
> similar discussion for a mikrobus connector [1].
>

Hi Michael,

Yes I want to expose the SPI on the pin header for two reasons:
- It's an Evaluation Kit board, I believe exposing SPI helps new
customers to try/understand it.
- This board will join the KernelCI soon, this setup will help to do
SPI non regression tests for a fixed default configuration.

AFAII from [1] , you can easily modify the current spidev@0 (If you
don't want to keep userspace interface) or simply add (in the DTS or
overlay) another node foo@1 with a different compatible (and so on)
according to the chip you plug on the header pin.

Regards,
Alex

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/Documentation/devicetree/bindings/spi/spi-controller.yaml

