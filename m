Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B37F2C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jun 2022 14:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=we5ZALKIcZuWUs35jjg9o55Ctsjy2HnxYxmPXSuiDyg=; b=PxJPolOTcKQMbnUuo9/k+vq8ff
	FTg/ODRXbFV6HCozODWYeEMMwgww+sNDPTqpF2drmoq+UgCJH4tcLw6Rj6wXNQ6HBmL8OIlkFWlFL
	yc2oa5PgJG4S0T07er16sEw6yBDGvPkJHI5tKSd81VWPtEpKsx8449hbLBHJt8l3LDIKsUK8v3qAd
	N9HdKiZtUb9KHY56qkFBW/8Zgjo6V9GgQkRZZme8jNkDgO+0kjRECiMbxsHeFHyUarMDbS2tnw8mY
	AELFFBKYlBqeRhnrCeBxwkFb7uTOOzDPE1amOEvthp3wItJEeQWcTsn4z10cXylk/7FQNV1+MNBzH
	jG7bhZ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6C1F-006fhv-Vh; Tue, 28 Jun 2022 14:16:46 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6C1D-006fgm-DD
	for linux-mediatek@lists.infradead.org; Tue, 28 Jun 2022 14:16:44 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-3177f4ce3e2so118546197b3.5
        for <linux-mediatek@lists.infradead.org>; Tue, 28 Jun 2022 07:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=we5ZALKIcZuWUs35jjg9o55Ctsjy2HnxYxmPXSuiDyg=;
        b=Eyd9FyAYXxniWyCJYJAkq2hVEGZtwL37/io0dfps5oXoGF9tQvN0UI0xhOQzqpcDR+
         81ACSPLs6vR9gNEPPX6mzpEqhfkqcFtcXODLCvSZ052+43VrQ6YhTXiSRbXCyeik8rXe
         0miraYk+TxbuFt4D+8hs+jR/K47yYaYDtR7B1p1kMFpoK5KNd539fnbJRsIpGggfdKlD
         gfcytA/R9tSBaSCamjLMxfwiinGImTqJcKtssfwHZgiPZS/zn95H9omu8G9a/rvnouiW
         9Lt/am7oME2JJgyri8zSnjm3Stqp2jqUtKBN3pK62Q23qVibf0OGiel/85TyZzDwmKwb
         GbfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=we5ZALKIcZuWUs35jjg9o55Ctsjy2HnxYxmPXSuiDyg=;
        b=vrV7fIKRRPvF15CIEcZYYQi/y3c/BzkValo7D/szRXtFJDuf6sU2rlDxeC6FQXURSi
         VbInJsNmdtX5Obq387O1I3C0GuVgmmBbYi7BGGo+KPvWlcL2f6ilglu/1AKmqBLiA6it
         gsSLx8CaEWKD07kwJUnYi5b+FeKZKuTGDCEHWJtbuti+XZqwkqMujLrqDvugYOCCujTH
         rGIWLIwlECHpsSrumr6JqnMU5wgRaJi+cPllOzekviYqT8/svtm0m1BqRuSmsLtCKa9H
         JJxeNii4BeNwLLMNldNQdHejsvycaZDoLNYCwtKLw1vAjII2M+9GGtm+ho6Qk5/3XtT9
         lgGQ==
X-Gm-Message-State: AJIora+G5b1X5FCKazKYFv0c2iJ3mExaa/tLXhHTjgfyv8OdfXhcSvWe
	b0caZOFZfAbOybv+Z1yexHI+Lv65njY21OSWfJUf5Q==
X-Google-Smtp-Source: AGRyM1tUYDLFiLuFmKGH4vxI5KGQ3ut80NYRMBi3vRrXwmdeTwR14llzPy5yY/ZHPhJ3bpF4NVMUrneTqSzU7ULR33w=
X-Received: by 2002:a0d:e20a:0:b0:317:ce36:a3a0 with SMTP id
 l10-20020a0de20a000000b00317ce36a3a0mr22477892ywe.448.1656425799830; Tue, 28
 Jun 2022 07:16:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220627173209.604400-1-nfraprado@collabora.com>
In-Reply-To: <20220627173209.604400-1-nfraprado@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 Jun 2022 16:16:28 +0200
Message-ID: <CACRpkdbqfH5jG7jZdvoGhNGqWPMBB+ntHgBCL-Od1Y9f9tiiHg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: mt8192: Add RSEL values to bias-pull-{up,down}
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: kernel@collabora.com, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_071643_507866_715DD0AC 
X-CRM114-Status: UNSURE (   9.64  )
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

On Mon, Jun 27, 2022 at 7:32 PM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:

> Commit fe44e4984018 ("pinctrl: mediatek: add rsel setting on mt8192")
> added RSEL bias type definition for some pins on mt8192. In order to be
> able to configure the bias on those pins, add the RSEL values in the
> bias-pull-up and bias-pull-down properties in the binding.
>
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>

Patch applied as uncontroversial and you obviously need this.

Yours,
Linus Walleij

