Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E565FEA83B
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Mar 2026 09:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fU4ut9+6hgjR8gcByS1Qfnrw19CdoqBab7lCYCwrhkw=; b=rRleZ/3gAc8GuY
	bOxe6Hwqm5kkaUc6Hv2pdM/FCX0iPaAloSZK02v7ZbAnC5SkFSC0QCyN1m8iluUAe6LKLKtDl6hi+
	jIzEwludboJq4R281SM3GA+1rZyZKedlaRKvIHJroSpBvR5Wx6dTH7opWxXj/BMZaB6zjgcaEelbY
	cp/bAvkijA4a8Ol3A7XWFDMg0KUb0jJgZ8pa860WS+ztylg/CuZR6dLg8eiypDphyIjoMbTWdEmmu
	lPrwBmjLdv6t2kA2S4c+eg8bClUjF7oLPraH1ayZZ6QKQF3UiAfVry489OicV59D501i0RrAPo/Ki
	63TXnYDIehY/u1GJGvvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Kca-000000033xU-3z0Y;
	Wed, 25 Mar 2026 09:33:52 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5KcX-000000033wT-2fxm
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Mar 2026 09:33:51 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5a281b091c2so2562001e87.0
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Mar 2026 02:33:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774431227; cv=none;
        d=google.com; s=arc-20240605;
        b=anKRpic27xR6NTn8l17R2YEaWWAnhG5WSkrWJxrUXt22yLiG0Z0uQrLFY8/+O0XYAp
         mlh5TVB0FSKaykWBJRM4t4XNndAEaohALUmwmuKS8bANi4UQMpsyIRWtEEH/PFdE0Maw
         /kRwG4Z9YSOTA5EPRR/oFKHzRzQ72dMZmTroHdMPcm51A5gaSwiBZdtV2dLQGCQ4zHlR
         UBM43Kk4ENpIZRoeXomOurVBMFc6+C5nfhVNnT/tcrG//5OZUR6aVUUFH80NqDFRoweM
         joYuSk37s3eVQLsGolQslRTgiU8/xI8nZ7scbNWJwT47kIS3WCYN3RAyZjZBbpca/ZpZ
         JkPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fU4ut9+6hgjR8gcByS1Qfnrw19CdoqBab7lCYCwrhkw=;
        fh=ds4KOq2Ugq42pMl8UQn0M6HJvymV3tn/0gV94dBuQ+E=;
        b=Xt42b5sv8b3N3kOwqeXMP1Ifka3WIxpjwZ5+DdRp/vprZIKiY71OYACPkPp4cONtDW
         Nmy2sTGjJSi+YkUiAy4BOZITk142tK1nV5NnDooXkboUU1vo8Fubc/4GqSTepzoQHqQK
         dy4jZ/upgszVxaMAv9ySuSgMux8y8PN6tUu37SyuG+FIPhVM+4FZ6BZElCvvdpeL//en
         rIovj+0EhyNOu2VadL37DJ9+/QXO6IpXZVrgycBPr8a0RX0vZYCQWxMAnM+BBwkClmd7
         eIab8B1A+yec4V4Q4uVgnRuVuPC28Sw1l93RSJ1skssVQjveCMKSH3Wd1jUZUVzMAdC4
         P7VA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774431227; x=1775036027; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fU4ut9+6hgjR8gcByS1Qfnrw19CdoqBab7lCYCwrhkw=;
        b=VMWBpKKLCR19QEqGAlqt8pfB9Mr6GLfve9B/6CFtCZK9Y5/PMw0y3nZMc7HPCybxNi
         b6vEiGfi9itt9uACeSMs1fDrrPUzbBPk9ktwDIbt0sdQKuV93E20cXAoJmbTVK/rI2lO
         3HvikZ+Z0VQhPGbbHWMojPPRR8WojAftL0A+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774431227; x=1775036027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fU4ut9+6hgjR8gcByS1Qfnrw19CdoqBab7lCYCwrhkw=;
        b=MiJz5niOdnE9fQzfo6cze5EyYaj59E5KF28blmYg61n8E1pP1udHWME/NGQQduk37s
         uP57oJZaGLx5eLSYJSCQILM8PmTmcl60dp7UlvZiDLT2mhcUOGAbFI9TpDbUYTygnVRV
         Oat09x1jCKv1LH+6/EDSDAHWUHwG1RxqFHgxP38kMaMndXV6hnSoVdhCFIOOvINjfCOR
         Zw76swF2hj1cAlAabC4G9KmgWuw2tewyh8ipCxVLHjXO8yc+AGonU9el7lDPRmWfFx/1
         x5v7J9MqzRm/+jwNeMAmLp1YnOBTlNxgNaJ+Ai18StAZa+DvIrxhDXUsKbZWvrwKX02c
         iyqw==
X-Forwarded-Encrypted: i=1; AJvYcCWTHCZ+snaRnBagmQtIt1wAZPTmN3LdrTkxsranDen5iIVAykK9ZoGTuDMGVQC2hJnO+vNdJxQYCQ8imjxzHQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzmoSpbJ6MbyiiZNSvP4b4EJVBmLuj44+9j7uwlLjojAxh4HFn3
	rkMN6nAR/eWn7cSn29oM3E7wVwrCGNGteDd9Q6GzjXbuyXq/sU9P68/xueNM6EitV2a91rz+9MV
	4OuCxWUVLMt0SqNFP71bxHR9+6tommc0Hz2GcmNFV
X-Gm-Gg: ATEYQzz+qGMdOIlN4EYCQelbTqUdBiamuhmXCQSzd5qo99lLKlS7wKO69fJLnR+COBi
	luJ+beOLAFRzOAGQVrovihbuZtZzTo3AXQjDqptv9iFx4QSg4PmcGDnbUPrGeRMF+0l73W48iJ+
	2OjW6XrDk19b6FgJVU6CUBSfOh2OWPN7af3WulDOQr2QW7fol8X40N1o8pC3aVmkFtlimr6BxlY
	rbXmhkuchFnhWQKBpJmZV3mpmkuYuO9vEfxIl5Afcb5FXUFED+67Cq0fz4MCqif6GDrNBHu1Uob
	LxI+NKXCVPsY9DHeg8ke3QOBiem1nnyMq/9P
X-Received: by 2002:a05:6512:3e11:b0:5a1:3864:9306 with SMTP id
 2adb3069b0e04-5a29b99fe3emr1149914e87.43.1774431227426; Wed, 25 Mar 2026
 02:33:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260325082546.1572405-1-zhengxingda@iscas.ac.cn>
In-Reply-To: <20260325082546.1572405-1-zhengxingda@iscas.ac.cn>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 25 Mar 2026 17:33:35 +0800
X-Gm-Features: AQROBzCBmtM1crEyyFCRfioph5HGsVEx0Ru6HUQh1CoBPOQAq272r89mllAysys
Message-ID: <CAGXv+5GwR69W5FVWzFYzdybdXv53ub-o9doDQOwey4O1HE6jCw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: mediatek: add mt8173-hana rev2
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_023349_723646_E4A1FE91 
X-CRM114-Status: GOOD (  15.46  )
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
Cc: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Max Shevchenko <wctrl@proton.me>, Cristian Cozzolino <cristian_ci@protonmail.com>, Icenowy Zheng <uwu@icenowy.me>, Conor Dooley <conor.dooley@microchip.com>, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, Gary Bisson <bisson.gary@gmail.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Mateusz Koza <mateusz.koza@grinn-global.com>, devicetree@vger.kernel.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Mar 25, 2026 at 4:25=E2=80=AFPM Icenowy Zheng <zhengxingda@iscas.ac=
.cn> wrote:
>
> My Lenovo Flex 11 Chromebook contains a board with revision ID 2.
>
> Add rev2 to the compatible list of base hana DTB to allow depthcharge to
> match the DTB.

By consumer electronics standards, this device is ancient.

I couldn't dig up which revisions were commercially available, but
our downstream kernel says that regvisions 0 through 6 are all
compatible.

Acked-by: Chen-Yu Tsai <wenst@chromium.org>

> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Changes in v2:
> - Added Conor's A-b.
> - Changed mailbox to ISCAS one.
>
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Docume=
ntation/devicetree/bindings/arm/mediatek.yaml
> index 382d0eb4d0af6..2894c8a16c78c 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -148,6 +148,7 @@ properties:
>            - const: google,hana-rev5
>            - const: google,hana-rev4
>            - const: google,hana-rev3
> +          - const: google,hana-rev2
>            - const: google,hana
>            - const: mediatek,mt8173
>        - description: Google Hana rev7 (Poin2 Chromebook 11C)
> --
> 2.52.0
>

