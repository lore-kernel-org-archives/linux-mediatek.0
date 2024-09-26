Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C5ECCF9E9
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Sep 2024 10:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yX4eW2hLFE+pD/0oU3sBpz42gUQTQtE0boReuMH0kxY=; b=ggsMBdNTMdO2rodCSAGOO3m0V6
	PIjViGjvuisR7mvrxCFXa7jgYErmVRBtyR0cFjXaVtWoifppxHKjnknDN2pUpn6OGPC6yxLRlA9kT
	nJdEA9Tm4BwQxMZgANeknrzUY1cD4abYSLf7em9z4GwBgdKNSruYfjyRCcDzlsgad9KlTOrFP6JmR
	L60u4dI3ICwwNq9zFBUjwEAXLIvcM5+hgFoYmOcK1UDadCKjmg+lKFwenjKQbWhGbIGU6rv2iHSTT
	2l86Rg4uk6NwNqywqrnDOCHyXo1MhFSsxknkb1kWpm3qq7S09FE5azjbNxfDjw8Y3jDxS2uMofJEr
	TScOsfaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stlx0-0000000864m-0qp7;
	Thu, 26 Sep 2024 10:42:22 +0000
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stlwx-0000000863Q-2bqc
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Sep 2024 10:42:21 +0000
Received: by mail-ua1-x92b.google.com with SMTP id a1e0cc1a2514c-84e962c9a99so307267241.2
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Sep 2024 03:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727347338; x=1727952138; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yX4eW2hLFE+pD/0oU3sBpz42gUQTQtE0boReuMH0kxY=;
        b=BA9IMHBlUukFCndsm3TwBBzmzc2ysTQwEsIeJIczPbH14PyuPJhkglI4evvSvhMKOZ
         66cnIGNIpGgA+CGK0LtHQEBPlGLKBCAPUIK6R/SQSNiqVptqHji1WOZ6VcM7rbNnCOki
         r2qEq4eO5Acpn4haYVntRlg7KoLyMRbLX4TOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727347338; x=1727952138;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yX4eW2hLFE+pD/0oU3sBpz42gUQTQtE0boReuMH0kxY=;
        b=r6gyynTkGT9H8z88S+12lFed/4UF45mFfFhx2nRJWy5ZE3KuyvAqe1BqrpVvz4lqOj
         otVPt/yvkWbGxWoy7AW6xEHf/2IsfcvEbGy3VXj3pgF+rmdxmSSAWYUSEUbPlucvuLr4
         bWrMCk8FQfCiVhyk4d9qSQQDPkz+otIyn++Y34fRBlB1q49fJnk83aQMHadChVHo21CQ
         URunjA5qX2axlfuYxOU+5S1uQQ71pLXQK6LBc5hfNesJsUfYvGFKMoGJJmuLaT2RV9wn
         tbq8z6CHfAJOVySUOMOhuHTUZLw033do+XYD9eTFvM1WIIxk3FF0FIEtFhGGnC+fiAs1
         gjfg==
X-Forwarded-Encrypted: i=1; AJvYcCWBWk0FHIt11DemdPetrLfGxS926YmqW+Z0nObpR7rEgGnV1khTDJNOhy0IxZyoTkvFtNkhiEcpjA3mX2Wryg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyT29FPB63cLl/JXU+fbxGgAdhpumBSxd1YeusqKZ3q/9e1EU7T
	3CC1Rkk/d/zHVOTGTkiVUGJZameirSmScIq53awhmJZlnd1NG4BI4S8s+umaAkIEl20COoHXWqV
	/8g==
X-Google-Smtp-Source: AGHT+IGDJ0vEX7LJs4Hy0NAdxKdRWIBJnPY5UZh5a6vSvEIZX1NsQluCZcqvbj/Kfkx6xNd1EtAD0g==
X-Received: by 2002:a05:6102:5122:b0:49b:e7d7:3e1b with SMTP id ada2fe7eead31-4a15dc3867amr6612625137.3.1727347337700;
        Thu, 26 Sep 2024 03:42:17 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-84e73cc4f23sm2734000241.32.2024.09.26.03.42.16
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Sep 2024 03:42:17 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-503f944f174so303233e0c.3
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Sep 2024 03:42:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVR2QVUU8sJDNzTB4Tq4RrhnAQagIVkkO43z7QLQeGgOBIym1lHZErvdJj0OoJpURKIUzzt+P+1Up5CWyP8LQ==@lists.infradead.org
X-Received: by 2002:a05:6122:2a05:b0:4f2:ffa9:78b5 with SMTP id
 71dfb90a1353d-505c20ddd0fmr7058726e0c.11.1727347336501; Thu, 26 Sep 2024
 03:42:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240925110044.3678055-1-fshao@chromium.org> <20240925110044.3678055-4-fshao@chromium.org>
 <fbdbe9ff-586a-429c-a987-b8ec39b485e8@collabora.com>
In-Reply-To: <fbdbe9ff-586a-429c-a987-b8ec39b485e8@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 26 Sep 2024 18:41:39 +0800
X-Gmail-Original-Message-ID: <CAC=S1njehOqkM26o=vfirZ9L8bec0jbtnvH0J2miYR_qEDeSVA@mail.gmail.com>
Message-ID: <CAC=S1njehOqkM26o=vfirZ9L8bec0jbtnvH0J2miYR_qEDeSVA@mail.gmail.com>
Subject: Re: [PATCH 3/6] arm64: dts: mediatek: mt8188: Define CPU big core cluster
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_034219_809839_38A59178 
X-CRM114-Status: GOOD (  12.26  )
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

On Thu, Sep 26, 2024 at 4:33=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 25/09/24 12:57, Fei Shao ha scritto:
> > The MT8188 SoC features two CPU clusters: one with 6 little Cortex-A55
> > cores, and the other with 2 big Cortex-A78 cores.
>
> No, it doesn't. It features only one cluster, so...
>
> >
> > Update the CPU topology to reflect the actual hardware configurations.
>
> ...the actual hardware configuration is already reflected by the currentl=
y
> declared CPU topology, so for this commit: NAK.
>
> This SoC uses the ARM DynamIQ technology and embeds both LITTLE and big
> cores in one single cluster.
> Check the MT8188 datasheet for more information :-)

You are absolutely right. I found that description in the datasheet,
and this patch is completely wrong.
Thanks for pointing it out!

Regards,
Fei

>
> Cheers,
> Angelo

