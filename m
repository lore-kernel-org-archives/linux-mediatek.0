Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 537A4C27C79
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jun 2024 10:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yUWHOVjyGyRzoGlr5ghuJKNIOPB/LuWV7z8ChKS8Rrk=; b=K1M5JS3lfovMNOl2/+FxYA9dVw
	tIlq68bku+sAnKzLMykjR+gPZoYGcXcUQeFQXgdIDvWFGfJe3C1ZjgVBXVm4X9DltfAmQSTHcAz53
	1VMktUANdJ/Lyk0Od8MzyBe0+E3Tc6qy+uJSkRk2iUA6Y5fdBANSueSZEjncROulpckjEbigLbJAJ
	ErUiJXKYPE76MUoFl0B1HK6Q9IOY3F7QVdrqz8hR7u1fb9TcdOn4Cj0Q4+fDYGuD9PJ5rKnxXaLAG
	8G8NPclryF3eKW4r/iEd/H1kLSO9t+Bn+TmSPNaY64jRFPD0gX9UTuDHF9CL2WwAwllSOklgAG6ef
	caFfaA7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKEuy-00000004YRN-3y3f;
	Thu, 20 Jun 2024 10:21:24 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKEuv-00000004YQ5-2c4y
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Jun 2024 10:21:23 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2eaea28868dso8719141fa.3
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Jun 2024 03:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718878880; x=1719483680; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yUWHOVjyGyRzoGlr5ghuJKNIOPB/LuWV7z8ChKS8Rrk=;
        b=bctvuUO8zGATRQNVf25h332jhEEImOPXXRfPhCcc7lq8kwD2ghnge8uf0t5E5wn5rV
         UYXkvc2JuxXsXIkb7+7QF+22DGQ3tQDlOzMMXZ8iQb+TYmpWAiGadxJSNy4aPnjXYAOy
         hNzX7CY58T883cYK5s1RQBC1YsjLnxFAsKis0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718878880; x=1719483680;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yUWHOVjyGyRzoGlr5ghuJKNIOPB/LuWV7z8ChKS8Rrk=;
        b=qprAKdm7n6CCjb2mU/Mklkw+ec9s+6b5HNR9Gf7vRzchVYdwuhpIgsE6bYMG1PMkbE
         +ae+37rQTb5TrVxvq4uOQwG6LQF1G82igrLDCm2BYXKaFiInelQDcsP55r+pl766ucOA
         aBgJPrs4OBnMh1jzO+j5MagoY44k9D4adgpSoWqAv+fnacqo+XSnEOHBx7jhEpFJDTD2
         gKGz14xbf0fgH0BuxBby9UM0/85PRhKvrlfq63g/PoRFm8lOmlqbNtHR44bWxHyd5POU
         jATtkJ4oEBqm6jHM/rfPczb014qDEnghA8yRKjBRFqMb/D9teAGMtauQLpJ/JMPoD0B9
         eZLA==
X-Gm-Message-State: AOJu0YzwbgA9ywS1vXqDSeibjMA99tivXY4b9jOKrFF1Q+SwSU91kIGU
	UhHj3yyAgNzWOkU7Xh5AWvjClaXDzxii1mqKglyyV4A+ENcQnTENHZYSf+ACbcQsOgkhTnCOZUo
	tDfHXEr/4stFzRKBjsZdiF5x+ruox73n9P9WJ
X-Google-Smtp-Source: AGHT+IELAWkWRffJk3N4yvr8LW9ShgTVxKf2xLZ6C+NAya7MZHmToAwtMMezgQ2E0CusjXBumZ/vDNsr/BoAYI/GlGo=
X-Received: by 2002:a2e:9e4c:0:b0:2eb:fdc3:c2ed with SMTP id
 38308e7fff4ca-2ec3cea5754mr39550581fa.8.1718878879753; Thu, 20 Jun 2024
 03:21:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240620101656.1096374-1-angelogioacchino.delregno@collabora.com> <20240620101656.1096374-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240620101656.1096374-2-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 20 Jun 2024 18:21:08 +0800
Message-ID: <CAGXv+5F6OMU=GpfecgYur-tZVfeazXuXn-GSiY84rud7mC-yoQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: mediatek: Declare drive-strength numerically
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_032121_673079_E9E47D65 
X-CRM114-Status: UNSURE (   8.94  )
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

On Thu, Jun 20, 2024 at 6:17=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> On some devicetrees, the drive-strength property gets assigned a
> MTK_DRIVE_(x)_mA definition, which matches with (x).
>
> For example, MTK_DRIVE_8mA equals to 8 and MTK_DRIVE_30mA equals
> to 30.
>
> Also keeping in mind that the drive-strength property is, by
> (binding) definition, taking a number in milliamperes unit,
> change all devicetrees to avoid the usage of any MTK_DRIVE_(x)
> definition.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Good riddance!

