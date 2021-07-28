Return-Path: <SRS0=pZ6D=MU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53555C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jul 2021 08:48:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24AAE60462
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jul 2021 08:48:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 24AAE60462
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l7Y/JIzK0Aes2bV+IrtQVCLVSYF2Rg1jmtC44Y/5n4M=; b=KghJviuouokYdO
	rlJtbLknHzATs1L8tYIsrpnDk3VqcCGM3Y0nq1e+wxzxMvTGkyoy3CxpeM5UOaDeWZeFBDPsvnVt0
	PDhRVq4fMH7gLtGAZi9BycG4f2nvun4Vn/2J9Fd+rljZFaiIO1D5QpOPUEhDsX8CiBBX6GbkYGSKs
	KP4OHmAgpDfSEYdCTX/r/GcJtBVc+urnGmony0ILCql52Cb/rPQTzrc55E9Nc2/r0/M0Ckpd0YgKG
	y4LLdg4RDC3/JYNCYpySHQJOdV/pQwC8taCS18bUbQ1ERZS3UosJwWQiEAzx9mAgB9qCHa3ajfbYJ
	i/T+7kREcEjw0PbQLFHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8fEC-0001Ba-UT; Wed, 28 Jul 2021 08:47:48 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8fDy-00018J-PO; Wed, 28 Jul 2021 08:47:36 +0000
Received: by mail-ot1-x336.google.com with SMTP id
 48-20020a9d0bb30000b02904cd671b911bso1364481oth.1; 
 Wed, 28 Jul 2021 01:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mj+6onJ5YCrGEwa+OUlRe/rsn1CusgezZwhDmz7NI9g=;
 b=QbywKMqDBE2vyLGvddwKLvEEqPYtYiP3KuLnBqSbk/reeT/yJKLmp+2pGPy1CzN2tU
 YosFnFUjFJnJiVu2bZ2PHFo1VbGF+xD7bgcTdyX9tN0iCiy0PDPbMSD5MeqYdz8uTBY9
 zbAGxVhPOAuyXVCN5l2rBNacN9h8QsmrEEo3jf8CXyvKbCuXnMIez7YF/nWdu5i5STdI
 Niy4RYY6GsSIFn5wg8E5h7B3v7lQhY27ggHOwZjd38aaDUY8Jq0Vo+N25s1LPJcGKTC/
 fTodhzcfijSudfAaxvR+CHbWYv55iNEbxOeuSZAkKreFiX6SozBK2M+4NN3dTuHh17NY
 T1pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mj+6onJ5YCrGEwa+OUlRe/rsn1CusgezZwhDmz7NI9g=;
 b=fcYy+Ve7GkWaOgrEBcutZtvNcnuWbodNBAulYDxV3nswG0LjLQjEYcUVkD5y9Ul0kt
 NstXq0FXreFq6iZz8vDi/0KIetGDFKXm+yuCttanZpYpQ8aJLilvrhC+6vVpsMuq8Gf2
 OdYXvJyM4aMll9WY2cl9yu+Cjs9orA8BvJ0Sz+FJyFhdGLwmKBbYnZRHqIEkKpEUogD5
 R+BXZ+upoaOXojMALxiyhqNkcZXpRWNOg8PRr9IiMPKl2Dm69mEPfDA4U0536QaChGP+
 3zXFn2EzJacSXAQKH2eUvZP/GA0QohSeOaOAO4NR/kWQLjZYJaQcG2jzKqRElE7hS0vy
 XT7Q==
X-Gm-Message-State: AOAM533r0LnZqSUKOvesEJd/RGsow3fvP5t4+TT+XeAdnxtoYjkdWJY8
 hnu+QEfZNqhIlBZzpWCHc+Pm6rSDv8LaE5W9/XM=
X-Google-Smtp-Source: ABdhPJyTdb7oER2azfgjeqt4WdAGg6eOms+MJ2WoWxr9GEQkVXuK60ACrXuJ/QqNL6CNBrr6qYi+l1txUCDAqqvnjjQ=
X-Received: by 2002:a9d:27a4:: with SMTP id c33mr18699138otb.281.1627462053217; 
 Wed, 28 Jul 2021 01:47:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com>
 <20210726105719.15793-3-chun-jie.chen@mediatek.com>
 <162740843452.2368309.13157283201271440368@swboyd.mtv.corp.google.com>
In-Reply-To: <162740843452.2368309.13157283201271440368@swboyd.mtv.corp.google.com>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Wed, 28 Jul 2021 10:47:21 +0200
Message-ID: <CAFqH_51D0A_Oht785cxvWjuNFYgLL25-qX1QEpLhWBARtTgVMA@mail.gmail.com>
Subject: Re: [v14 02/21] dt-bindings: ARM: Mediatek: Add mmsys document
 binding for MT8192
To: Stephen Boyd <sboyd@kernel.org>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-clk@vger.kernel.org, devicetree <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210728_014734_871864_4E120976 
X-CRM114-Status: GOOD (  10.57  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Chun-Jie and Stephen,

Missatge de Stephen Boyd <sboyd@kernel.org> del dia dt., 27 de jul.
2021 a les 19:54:
>
> Quoting Chun-Jie Chen (2021-07-26 03:57:00)
> > This patch adds the mmsys document binding for MT8192 SoC.
> >
> > Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> > Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> > Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> > Acked-by: Rob Herring <robh@kernel.org>
> > ---
>
> Applied to clk-next
>

This will conflict in linux-next as the binding was already converted
to yaml. See

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml?id=63e1125e6bb8eae3cd20292f6a10ee421dd574ae

Thanks,
  Enric

> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
