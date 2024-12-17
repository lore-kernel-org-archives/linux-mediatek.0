Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1605DE7717F
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Dec 2024 13:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=juPJKcDTKas6DmHfE2eez3lteaa9FffyFh6KyQJpAPM=; b=yIrxsHWozGNvK57bAAScDoYkce
	ZURtb6qEVLB65RdR44LI4RXRZnHaD6bpgrp3g0JswrTusfSWL2C9vMDZIlDHgVAs/sAXKqY3aeEY+
	K79fRMQIrrQWyxIn3ZU5+PyrwW65gguDRCvPUBTQkjLv657zXIp2cvZ1w8Qu36X6aQEhx7lbF62iu
	wuoD7WOP6EHICcBTe3F5su88vdop08BkMmQDuez7KYq9vv4S4gy9UmqGHss282A4FLKvB7UQ1f/3x
	LrX9YXILpXFJbo/eVDKkgLwam32kdyFkQEUI/WvfX09M1fTwQMqxa5kTT9R/HC0XCxqg0CGJczh5q
	VA0/NwVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNXvo-0000000DdWo-0yn7;
	Tue, 17 Dec 2024 13:48:12 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNXtF-0000000Dd7L-0DXJ
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Dec 2024 13:45:35 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-540201cfedbso5364768e87.3
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Dec 2024 05:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734443131; x=1735047931; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=juPJKcDTKas6DmHfE2eez3lteaa9FffyFh6KyQJpAPM=;
        b=upvJOyLG2hLmQ4EVUjbr6NwDcCZ6LV6xCcrjOYNACcXSHF8Lbdk4QLq7n0i5qMXePI
         PY7KH8y1e4ChB/s/dfqYt/muUQKP4IRkkVZ4tgJ7jPny4OjXKo7TWGaiHEMrruDtkTkc
         18OYZi714xpM+s7XavpANf3Vqf1/E8fJWUWGSseSezPhSBXb2TOdAVtPjdvcHP/k9APY
         nW+NQRnRQD14aIg6m3b79/45SamMQezNwioAnt0+WJuAo7Rxx01/8x9EmPgGP4WCauWC
         om40pkWh578knXdulEiV1F8aVz0BfOwGDJybDWTpIG5Iugf9RvKg+21CRr65I06x13J+
         KmKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734443131; x=1735047931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=juPJKcDTKas6DmHfE2eez3lteaa9FffyFh6KyQJpAPM=;
        b=jHrW/8nC6iKvB6UgqoN76sNcTGw1bpFTmepQJFTEAx2cHSDtLQK0XjlTSe5Ve73wtg
         8qlN2dw/yifQqccvBSOFBLhSm0v88JPBRZjIHygE/kcg8/fk9/UA3V485zsCS2aucaXt
         iUsUEbEex+vjHMstc1jY+qLbF2jksaOH0eBPtMM8dttPjG4nen9CNlI301+qT0GnMiIu
         r3mTjyznAgMEZ4gyXdNoOfGmUX+GO/+OpOclnYApeK7BAum4Qu2ECDT3pbbxQwHPibqs
         AOL17FaAhlyYblB+j385yZTbvh/e8aP1SHQpMGzWm6lK/QgIWPH9ie9gwVeq1NNHSJva
         w4vw==
X-Forwarded-Encrypted: i=1; AJvYcCXlwCI+buP+C0+jrdfAtKCdk6X34eLYVP6q1VPeBV9imZen1qqxX0GCMy+PRPIvEdXXG2SIDkysnODoAbneBQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzAe1y9kHucfC6OYMZ598NjWu7GTg215Hx7Ib++Lm3hcZNPzujN
	yOfHiQBzFQMSBU8FtfLZFoDDX8IDpjLb8tLvzLXArjqAkxx66qnhtne/u6OnfG2q2lBQ0z0jh98
	7LxZn50dNkI2X+ITJsdm2oWF7p2zm4WnIylinbg==
X-Gm-Gg: ASbGncu/FPGsOjlg4nQ733jklTljanncehqvlY4dpeNEhQ3iUlJrkCZ0Te9tRkVwLvp
	cBQsIVDubaECMf8m/rwUA5xP58IH9hj1EhhYlmA==
X-Google-Smtp-Source: AGHT+IFR6FlyV7xGudG0pVgEPvwRzGY//Q2aR/ufrejSiOLM3v/BAnZMkPxq7smAseJgipFLo05KDrbMR1c3Zo+kE9k=
X-Received: by 2002:a05:6512:1383:b0:53e:239b:6097 with SMTP id
 2adb3069b0e04-54099b729dcmr5985204e87.50.1734443131096; Tue, 17 Dec 2024
 05:45:31 -0800 (PST)
MIME-Version: 1.0
References: <20241203131302.16022-1-ot_chhao.chang@mediatek.com>
In-Reply-To: <20241203131302.16022-1-ot_chhao.chang@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 17 Dec 2024 14:45:19 +0100
Message-ID: <CACRpkdZy7HgkT-FFJh=ubXhdcBRa-vbaNmHC32E3djZdHnwdYg@mail.gmail.com>
Subject: Re: [PATCH] v1 pinctrl: mtk-eint: add eint new design for mt8196
To: chang hao <ot_chhao.chang@mediatek.com>
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	sean.wang@kernel.org, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_054533_082955_E6D5EC0B 
X-CRM114-Status: UNSURE (   6.99  )
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

Hi Chang,

thanks for your patch!

On Tue, Dec 3, 2024 at 2:13=E2=80=AFPM chang hao <ot_chhao.chang@mediatek.c=
om> wrote:

> From: Chhao Chang <ot_chhao.chang@mediatek.com>
>
> Change 1: change EINT from 1 address to 5 addresses,
> Eint number is stored on each base.
> Change 2: Compatible with 1 address design
>
> Signed-off-by: Chhao Chang <ot_chhao.chang@mediatek.com>

This patch looks good to me, as preparation for mt8196,
but can one of the Mediatek experts please
review it? If nothing happens I will just apply it I guess...

Yours,
Linus Walleij

