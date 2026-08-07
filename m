Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54CF6C2A09B
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2026 16:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E/7u7I2Djvix0P2NwMSrq7QV2o+ie3mFI36omFn2Qe4=; b=mOAsaAExojtUPyNxgrQ6QcCa12
	ULmj1UvfEru4FMa4ahLjSqShP5HnV5jajlqa9JUs2kbnmykYqiZAskQ1by3/MunO9Z7CuwTEO8SWu
	QAffKNfFRYDxp7VzjkzViXNjfIi24rmbyipMFyQjIkGWfUfG3a8CiiuVMzpN30ApraZupUKwkPs7K
	CCC8JVdDSt4k4S6RbbmjjTXTVj2deQnWIQGp1lXQHJaeyDW9e3MudLEKilihdOkx31JrmZoKCSc9B
	2lSld9N6jn6YC8/A90EgnY1+0rUfdMWMFsdkMKF84fIg+AuVc+LUWUkZ8EZPnZJDCpOwijRFl3GLi
	BaN5FO+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsN6g-00000008OqW-0Jk3;
	Fri, 07 Aug 2026 16:07:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsN6e-00000008OqQ-17BK
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Aug 2026 16:07:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C351842DC8
	for <linux-mediatek@lists.infradead.org>; Fri,  7 Aug 2026 16:07:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A74891F00A3A
	for <linux-mediatek@lists.infradead.org>; Fri,  7 Aug 2026 16:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786118855;
	bh=E/7u7I2Djvix0P2NwMSrq7QV2o+ie3mFI36omFn2Qe4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dzWoCNiS+1H5cMWyLNwH7NxQLHuWOodEoiiK64vQFPQFdXULN1EalhUa9VrrUrSVH
	 CIDW9ITSPA38BknGjgYfRWGPthYKfnpXrE37Aq+TsO8j5r0Ca/JeNi5yp3la6ckXkg
	 frcAh8cq8JR/NUnrK8cd3ukB2OivPqektPH9e+CV3qpX+4+OIy+tGI3aq9r5DN8Jk2
	 7FcRHw4tVkp1+TJhmeFAiPx9OaR4q7mCyFIXCkJwfAV5IGC5JYtqV5VHcbGslK8vgh
	 OixShL8lcsPBF3PVQmMClfckhhukVKpwegFUn3TMnxsi9cqbRtRQTiWI/Falwx9o/A
	 N7tbdKX0ojl5g==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5aebd52488cso4054281e87.2
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Aug 2026 09:07:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rog7rQxMfmJJAk5DlNv34Pb3W/rcMWd+SV8jkK558QeoeAhV+1NPigD+2+jHqsvrQk9de3mFwivRmA20+HpPw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxYz7NLwjYKHAY+NqE8460wW79JY3uS/UmyMR0f9O/5z6Y0XQQt
	VZvAiQSsskRKc6u18/qVHURdK31sOEUYl5VNqObNEdsXSjM1YmiB6OvD+TSsz+qDouYEEzYSIiH
	dM4Vs1dsYJW7YjsFpTf9UwkgeadPU3+E=
X-Received: by 2002:a05:6512:131d:b0:5b3:419:7c86 with SMTP id
 2adb3069b0e04-5b304197d35mr1526582e87.19.1786118854497; Fri, 07 Aug 2026
 09:07:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260806220615.4078303-1-mikhail.kshevetskiy@iopsys.eu>
In-Reply-To: <20260806220615.4078303-1-mikhail.kshevetskiy@iopsys.eu>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 7 Aug 2026 18:07:21 +0200
X-Gmail-Original-Message-ID: <CAD++jLn8uL7NePnPK6SNcuKRjxm6c_98Piu4Y+urKko5eT-mhA@mail.gmail.com>
X-Gm-Features: AUfX_myE9lBIlT3ccrCM0uiAQGhdWYGeb1eZf7EHX8xjjW8G2nlmXblTO5FBaEs
Message-ID: <CAD++jLn8uL7NePnPK6SNcuKRjxm6c_98Piu4Y+urKko5eT-mhA@mail.gmail.com>
Subject: Re: [PATCH v11 00/37] pinctrl: airoha: split on shared and SoC
 drivers, add more SoCs
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Christian Marangi <ansuelsmth@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, Markus Gothe <markus.gothe@genexis.eu>, 
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>, Daniel Schwierzeck <daniel.schwierzeck@gmail.com>
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

Hi Mikhail,

On Fri, Aug 7, 2026 at 12:06=E2=80=AFAM Mikhail Kshevetskiy
<mikhail.kshevetskiy@iopsys.eu> wrote:

> This patchset
>  * fixes more airoha pinctrl issues
>  * split combined driver on common code and several SoC specific drivers
>  * improves an7583 pinctrl support
>  * adds support of en7523 SoC
>  * adds support of an7563 SoC
>
> The driver split changes are based on Matheus Sampaio Queiroga work.

This patch set began with 11 patches and is now 37 patches.

Is this becayse Sashiko is touting you to just fix more and more issues?

I think at some point we have to draw a line and say "let's fix the rest
later".

On the other hand I appreciate your efforts...

Yours,
Linus Walleij

