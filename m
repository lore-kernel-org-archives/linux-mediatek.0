Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49699CA5FFC
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Oct 2026 11:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=csPIWgh2vjj2d+64o9x9jlg+4Kf6s3JJFOXj1yDjO7g=; b=rngysEn/YJRegIhUkBU8CGCYcg
	7gzY0iej8Da/JAgqS8yN9cgaddwnMPmqOMxt1VGDePQNoQ+WxHLSz6YuG71zzHGG2/bWiKH2QZjUx
	Kst/i9gevkcEJOG9WWST1gRj9aghWkq1QCRmORRxbOhSujhFNdMzXXopHuBtNqNR3jatZP7xrK2ms
	MfmFuvB/EIyKgLTj0kJWzVY1TptrGKha5IRrEZQ+OOal13G5EZynLdjU0mQ77EIBHXLqU9P8Mff6D
	75QtRzRiYUe8yC44SeQFMecsmQSrPyupPqJjQ5HsPjIOt7zqp94WJXi/VAmXh1Q7rbugPo8wXXU+P
	Ps+KkxEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPvP-00000002Ks9-1fY9;
	Wed, 07 Oct 2026 11:35:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPvN-00000002Krk-3Et3
	for linux-mediatek@lists.infradead.org;
	Wed, 07 Oct 2026 11:35:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 86E9C440A5
	for <linux-mediatek@lists.infradead.org>; Wed,  7 Oct 2026 11:35:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A2DD1F008A3
	for <linux-mediatek@lists.infradead.org>; Wed,  7 Oct 2026 11:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791372905;
	bh=csPIWgh2vjj2d+64o9x9jlg+4Kf6s3JJFOXj1yDjO7g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=F1w1Uushn0CK2fctUMMwIBX9Q/AryAYvJosGMRW7lT+tJUc+G+RkL2hgCuE4F8xLJ
	 AzkTRul5lzF1AZdpVmSk6RIXiRaseePmVRvnbNbKOazQornNUUGym2LsrYuWbrmQqt
	 Ui/l1ZqWPO/wHMckVv90XMgsxI4/Nvpk9qhd3MlK58CeM9PKiblqEP4MQUvetI+aM+
	 VSSvqp0p0bFH6sXh1ae6H8SQ2sx+b6d1AfFxqs2RRAstrmI5v1Cksf3gHQfaFz/Gc5
	 mJxpSY96KehYo4SzmKUJgM1Q9ODYmy8hlM46gyORv2EymfskrSdaDPw2xwxvmv8dno
	 eLkcCgBAbkcXA==
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-48e9476e26aso548989fac.3
        for <linux-mediatek@lists.infradead.org>; Wed, 07 Oct 2026 04:35:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzdWDwRFYE5jzleOj62j7VIqC1ZEwnix4g1BPzF8iH8dGaccfVgiYi8DGsbTKl8KAGzWs5WE+B6n69xjWM8BA==@lists.infradead.org
X-Gm-Message-State: AFuF++nEdF/mBJBbiXdF1FlWyddrHXlEGggEnUHsIEXOLhc3MQ/HoLTX
	PY7Y8uXvTrtyEffUK4bBaOByIhZ5VEW1+dn6yPXLtY75tlxa1kALE8f0bPTGldDbcWzu6H+GW7f
	QkR8c98lTG08UGTC1RM4mBv0dY8cY1mU=
X-Received: by 2002:a05:6870:15cc:b0:48f:e0e5:a1dc with SMTP id
 586e51a60fabf-4a2598087c4mr1786465fac.49.1791372904792; Wed, 07 Oct 2026
 04:35:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260925-mt6735-pinctrl-v9-v10-5-cc042983c565@protonmail.com>
In-Reply-To: <20260925-mt6735-pinctrl-v9-v10-5-cc042983c565@protonmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Oct 2026 13:34:46 +0200
X-Gmail-Original-Message-ID: <CAD++jLn5gm9iR9cJO5DnLjozhm9MgRpmmdemFZyTcGeL_sz0Uw@mail.gmail.com>
X-Gm-Features: AclHuK8GVwt3n3_Tf9yHLVWOERk-G9rrExeh-m6C4ooGn236qBT253lfkigNGlc
Message-ID: <CAD++jLn5gm9iR9cJO5DnLjozhm9MgRpmmdemFZyTcGeL_sz0Uw@mail.gmail.com>
Subject: Re: [PATCH v10 5/6] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Add bindings for MT6735 pin controller
To: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Sean Wang <sean.wang@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Andy Teng <andy.teng@mediatek.com>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Sep 25, 2026 at 8:53=E2=80=AFPM Yassine Oudjana
<y.oudjana@protonmail.com> wrote:

> Add DT bindings for the MT6735 pin controller.
>
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Patch applied!

Yours,
Linus Walleij

