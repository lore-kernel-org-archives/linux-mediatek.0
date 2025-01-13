Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4EEEE7719E
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jan 2025 11:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u3hahkWocHwmmkAO+vdyrc0iLuCr5couR8jZqwcdfd0=; b=JAxx/JxuosGFY0k6zIK+/YPngA
	v7NEh/KwnVQIHP2qe1C/2SwjWDl9shgXcQeVuMFmuXpHPJty7XR9e54RruFveSbPFkrFOrwOpH5qq
	Hk0x1f+iR2cmkNA7tWu8jrle5Zn0YFaoc6mSh8sFHXkPzlkpw7NMEdaIbNQXqyRXjaHVf2kb1dQJH
	9exEGWVf5fYpwkwJLE44VrwGp1gIUwWM44BCBLMIjv2+W04iO2m96NqJHz1LX8CL3sCV5q3b/tvYP
	ddt1ILAH+dxvyk1BJG1RUFtplEKKY2i/ltbfefvkTLPi6TINe/yuVZx9pA2DPOAqzPSLLG5+ViQTe
	rqhjKojQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXIce-00000004uOg-0B75;
	Mon, 13 Jan 2025 11:28:44 +0000
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXIaC-00000004tjK-185n
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Jan 2025 11:26:14 +0000
Received: by mail-vk1-xa32.google.com with SMTP id 71dfb90a1353d-5188b485988so1417715e0c.3
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Jan 2025 03:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736767571; x=1737372371; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u3hahkWocHwmmkAO+vdyrc0iLuCr5couR8jZqwcdfd0=;
        b=ZhycG4LHPfM6S7Xb7L+3LZhtfS4msZgtZJBKrf4PIVdjy9V8eDKOaIeHV8pn+LRe2+
         aexJwiNbSCqvgO/FguE7ahS8b97s6PiMiPM0dv2VBh4GbNPq+Ri5di8dwQwgzsfLnZBm
         jo2+3Bim2D18ZG3sq7RlJXdtd2gnY9tS3S1+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736767571; x=1737372371;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u3hahkWocHwmmkAO+vdyrc0iLuCr5couR8jZqwcdfd0=;
        b=H0uVex2Fa1bqXPfKRjwvhXCy1EyvllCvfGntOvJ+qDyHX63pCcWpAXGcZGsTjYhJ6t
         n0bxmq2d38v9gSnsWjTuptSWYjU5xKkNdfsFdZmO2zy4LHUi/Cf+d1EWkeOM+P2U6khq
         7HiaUGpSTIsOPWIVAFWnV0gFuuYhnLj6RA2jJLqVeDTypXcoAU4e4XdZuAKyL0VexDaX
         S75j0p/MgeFvSlQhZSdmZWQ7ZLU+zsNDiyILLO7H3qAjg3WKL9GqQ3lfsJwzUBUrw978
         3jSW46LHU1EQM2t9tRfeRlddcT74fgKgSF/qb/KYzfw/zFsWhkKneDWrH39pBO78sl/U
         8e6w==
X-Forwarded-Encrypted: i=1; AJvYcCXsJRvaKw6HvtkIlJwQaZAZOhU6ijbh54z55lCT2V2JA/qwWLjWW4v4sEN+VUJwYzXV4qCpXRD+DI27/igzew==@lists.infradead.org
X-Gm-Message-State: AOJu0YxvE3ttMgZM1QWU4C39YtTfpx7I/eytjU6/+U68jLoSoCx9VKCY
	D+SOXDILJS16921HzaMQ6Kez/KFy9ilIr7A7S6rJCypqIYA0/Z7wzXbTvF/WHySNhFVy9t8PyUc
	=
X-Gm-Gg: ASbGncshEPer1jUYial5FiUdU61kZKcgXS6m44QcM67gwlIvYpeV2Lv+rqJAgux6mbj
	feoLDQHmRA4VS2EGopIICCR9MXugfnQth7Gc74nUlF9tL484N4JaA7MphXIOeYauOaZb9BuPi34
	bl5DH5GU3y/A2zvDg2yIl0FsUr72se7w2YNqua1atvoO4HATWXIk/0e4niwjgLHS7gj4MJdPoSU
	iq5EK5Tq9FtNoydpD20iYhZd0xEPxjygSY3ZhqnoKnV2DoCFmtX5B/wxQuZLirm46QCVvH4WpvE
	cWAo05lx0EdynFlr
X-Google-Smtp-Source: AGHT+IE+yvj78PoW7aPEsXsZDMDnAEXCBZA8QIdN4zo314a//xliz3pRlS1gk2rFvQYlMdpJipTlKQ==
X-Received: by 2002:a05:6122:d06:b0:518:8753:34aa with SMTP id 71dfb90a1353d-51c6c537722mr15429064e0c.10.1736767570745;
        Mon, 13 Jan 2025 03:26:10 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51c7fbd3bd6sm3482492e0c.19.2025.01.13.03.26.08
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 03:26:08 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-85c5d4f3d58so1027914241.3
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Jan 2025 03:26:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUcAQuVH4yxobJRjDqt9kM54uNVEQb7NvTNS0u+Ew/0IWO6XdzfQafLzLFsPwOmhvXYuPxpcaO+kHJLQEtLkg==@lists.infradead.org
X-Received: by 2002:a05:6102:26d6:b0:4a3:ab95:9637 with SMTP id
 ada2fe7eead31-4b3d0f1a897mr14365630137.12.1736767568272; Mon, 13 Jan 2025
 03:26:08 -0800 (PST)
MIME-Version: 1.0
References: <20250110123835.2719824-1-paul-pl.chen@mediatek.com>
 <20250110123835.2719824-2-paul-pl.chen@mediatek.com> <0499ee04-0fcc-42e1-aab8-3cb8daa88c88@kernel.org>
In-Reply-To: <0499ee04-0fcc-42e1-aab8-3cb8daa88c88@kernel.org>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 13 Jan 2025 19:25:32 +0800
X-Gmail-Original-Message-ID: <CAC=S1nionnQ=g-7Ys=D_iQegPebuPfOH5S9aOx73aVh987DMLA@mail.gmail.com>
X-Gm-Features: AbW1kvai0eVMYu31zp3zyb5u2A5YMsTuoKfeRhXsuHOuCIeklBH2XCKHTQA_efQ
Message-ID: <CAC=S1nionnQ=g-7Ys=D_iQegPebuPfOH5S9aOx73aVh987DMLA@mail.gmail.com>
Subject: Re: [PATCH 01/12] dt-bindings: arm: mediatek: mmsys: add compatible
 for MT8196
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "paul-pl.chen" <paul-pl.chen@mediatek.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, chunkuang.hu@kernel.org, 
	angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, 
	p.zabel@pengutronix.de, jason-jh.lin@mediatek.com, nancy.lin@mediatek.com, 
	singo.chang@mediatek.com, xiandong.wang@mediatek.com, 
	sirius.wang@mediatek.com, sunny.shen@mediatek.com, treapking@chromium.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_032612_298946_758431D5 
X-CRM114-Status: GOOD (  13.33  )
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

On Fri, Jan 10, 2025 at 8:58=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 10/01/2025 13:33, paul-pl.chen wrote:
> > From: "Paul-pl.Chen" <paul-pl.chen@mediatek.com>
> >
> > Add compatible for mmsys yaml of MT8196
> >
> > Signed-off-by: Paul-pl.Chen <paul-pl.chen@mediatek.com>
>
>
> This is a wide pattern now in Mediatek: login name is used as family
> name. Repeating the same comment to every Mediatek employee is a bit
> tedious, so maybe you could fix it internally?
>
> Create some guideline for your colleagues so you won't repeat the same
> things over and over?

Not a guarantee that this will go away once and for all, but I can
ping some MediaTek folks via a separate channel, and hopefully they
can amplify this message internally.

Regards,
Fei

>
> Best regards,
> Krzysztof

