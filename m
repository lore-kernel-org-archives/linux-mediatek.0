Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6222C64EC7
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 03:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZqDsQXq0wgsqsnlCPzEpWrmYSd40mlSm295kuBDRUBs=; b=fPMJqq7rI/4JnjmTgD2HIKcrPE
	3hAvmpgqp3tPUVYdR7OtaBGujPcc/3UO+tNlhJgkItplD2zW0kgazM869UXLpw0gdlq6gbuiTPKSF
	v0zKNgmiVj6ysTBa1Y/2t0bue//m5b2ojRqO+lvwoz9ohaSf/jGMT4VWmcB85ni+iO3r2nr7uBL4g
	u0HzDJwUI3OCSXui+NgmOG2ToH8DhcKJ9S94Xa9/Zu8ckLpO/665TUpCf4UfWjpJIqdxuoKtI/tg2
	0R0pGOdipcC/ZJp/pKYSRM2+WAfdTN5M1wGbA+gqybjggjWTlwHICPTPoBCruSF8vop7I7yojuvex
	4Jz3OhnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUJlu-006Wni-R4; Tue, 21 Feb 2023 03:56:54 +0000
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUJlj-006Wj7-Ju
	for linux-mediatek@lists.infradead.org; Tue, 21 Feb 2023 03:56:44 +0000
Received: by mail-vs1-xe2c.google.com with SMTP id b20so2752546vsu.5
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Feb 2023 19:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1676951802;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZqDsQXq0wgsqsnlCPzEpWrmYSd40mlSm295kuBDRUBs=;
        b=a576ZMtkJ7Wv2NTnDHOI0gLegs2OTwTRw4jOexe5dLNmAaNjOHVJCF6pwYBJdUh9n1
         9nmKmtWLiYerZd0TvGBHPGhtTZYDfvJ7zxaF3ByekVS2R5KmfaU/VQyD5BCLZy+3bWIl
         VPiSIzzUTNFLEz8Y922qFV56bcbGdxdV5iqCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676951802;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZqDsQXq0wgsqsnlCPzEpWrmYSd40mlSm295kuBDRUBs=;
        b=bX4g3dTzouvqQSKJWYbJjoEjNUcrmYrdwiPwIqQMx2jAp55NXm8MBtb5vF2anU7/g8
         FO0qBQP4x/WGEDosUVYw9HnnMYQpwdBazm66FMcZNbVXGCs5QHjRDFCs+qYXpLqgGal8
         5A1r8sqfU082HFmgjZdMCLwgMyx0GMvPuda2FmBD2F8ujUryYbuBkEIEtGxDBoGRknSs
         9JdIEIti4eLuG/q1TYYbWFXaMz4XI+Bi1xmda8H/FG2ksvrOL/wl3JjDb1+7Xk3yIyxE
         PBUPhRF7SLfyw5EczoCdWLGALq1YZwzoyXCeg0vLl+K2H+/CsrALdJlRDwJpE+z/Tj96
         IWTA==
X-Gm-Message-State: AO0yUKW01wPpe3tETSZ9aWcyw5UA/c+iaEjK2GgZns/PjzMp4Ep+n5RV
	iWiUIZbfoC+Uym/gtS1sIckiYGh7jA3X38yoT8QZEQ==
X-Google-Smtp-Source: AK7set+5W/3qgD0aWYJFtRSK5l93LCmMajQHrsK61PYbkZspKKT1iGGlN/4NpN2NHg4rJwn/ADLh9XJz8DmljXjQSmc=
X-Received: by 2002:a67:f6c1:0:b0:411:a14d:6bac with SMTP id
 v1-20020a67f6c1000000b00411a14d6bacmr833727vso.44.1676951802590; Mon, 20 Feb
 2023 19:56:42 -0800 (PST)
MIME-Version: 1.0
References: <20230220150111.77897-1-angelogioacchino.delregno@collabora.com> <20230220150111.77897-51-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230220150111.77897-51-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 21 Feb 2023 11:56:31 +0800
Message-ID: <CAGXv+5Eh0FQOVM1kgDKCTYQvmEXtwCVov8ZjqMn1n1diuvam7w@mail.gmail.com>
Subject: Re: [PATCH v3 50/55] clk: mediatek: mt8135: Move apmixedsys to its
 own file
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
	johnson.wang@mediatek.com, miles.chen@mediatek.com, 
	chun-jie.chen@mediatek.com, daniel@makrotopia.org, fparent@baylibre.com, 
	msp@baylibre.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com, 
	zhaojh329@gmail.com, sam.shih@mediatek.com, edward-jw.yang@mediatek.com, 
	yangyingliang@huawei.com, granquet@baylibre.com, pablo.sun@mediatek.com, 
	sean.wang@mediatek.com, chen.zhong@mediatek.com, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_195643_684068_649F5C0B 
X-CRM114-Status: UNSURE (   6.62  )
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

On Mon, Feb 20, 2023 at 11:02 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> In preparation for migrating mt8135 clocks to the common simple
> probe mechanism, move the apmixedsys clocks to a different file.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

