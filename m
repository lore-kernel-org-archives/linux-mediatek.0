Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF8E4106F311
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Mar 2026 09:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7knoakIKaubGmtXGun6YWaShT3Bs+tTtvHK7ZAazb4A=; b=AI00fB6LTwGoBfad/VdztpA40O
	YyKHxmtfB3yD941a3VDmknlB35+9kZYCmfcbvPNiEjTTnPZmFJq+nmnt0AhS1dPi5wzolAwB1HX4C
	q0NzismU/9L5/NwhWH1cDtL0GyPCppbAs0vh6wNHimkGBMbpnD6EPAV+oP4JsLL5PSEeifjLI2ZBD
	AyEYgwr2R90JMUG5lhvgHcXozQsRFKldJEjd7pDhkATb8bNx0HyGKfTKWf7IKu/2J5pLf6jt9EqcJ
	RvYXP/LgV2Y5EcYTR7nm8SMa5SqxH8WmiyyslAu55VX1IOEwxKrwoqohcd9BRsi1YKEEP6m/EsGfk
	Fk6OfoAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5hLB-00000005Bf7-1I8O;
	Thu, 26 Mar 2026 09:49:25 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5hL8-00000005Bdv-0Uh5
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Mar 2026 09:49:23 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-38ad4677830so6203851fa.2
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Mar 2026 02:49:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774518560; cv=none;
        d=google.com; s=arc-20240605;
        b=E8ctIe3EwMycBqt9Y+Z73OI9TI9ja9N6WJg68byr3biijdRzUR0Sag3kvg/jkmOtVH
         iUUHDm1hEEESZhO/uTthDXuEnLi+Un/syeXYKJR05H5vQyzNEl+denWI+QRLFi3v0C7y
         6Zroh+OtdrMW0/lyNszrd0p0i40LjNVJhdhGbBQOAcOyFTPQH1F5X8pjNOXLHvZnqr8U
         YfrJZtGJVg9MSrl9xJttNPNDarycB6ShTpFC4fQWbr+2tiAYG43BvFFXe+VWIiXeIssb
         1JrMgL+KRdFOzCQYTirlaL1VppF3LuKpwY6wWYIf8mrTMcctB1COaF1umpMUGsCu0E/S
         V/Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7knoakIKaubGmtXGun6YWaShT3Bs+tTtvHK7ZAazb4A=;
        fh=lz2u9st2VNXJVRCN5m5kU1hl9dY+q3SAvOQ9RK+UzSE=;
        b=fJZo2Bb4KxyIdi7gZW8EAqNEX3DGd7lVmdhH3VMnBBudJGa9H50z+EUdKixfrzd2yL
         mN1Qh7JGkx+8pkMFdHUSKDLTFsP8/k6gHI+OIBMLIvIVdP7TTKL3g381JkDZb37vICGk
         MIKYjgwpFw31rYMnlSj/QEGwDDKUt1jzzwtaRfKICbwDZagIeiWRINmiHiHG745wd/pD
         Ay0rwAXgyt0Osa+CdfLSaaHUNtL9l6csHTaDXnIelp9tkmFVFidu3cKoIIsvCccV8EhO
         dRWP6Gn5ryq1bQTipgUyA+jxFIb4CNKrHYErfZwBXm+oQU4G4k2CWJ/RBYERnPXO+Dgp
         wM4A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774518560; x=1775123360; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7knoakIKaubGmtXGun6YWaShT3Bs+tTtvHK7ZAazb4A=;
        b=cImS6t8LY2hTfUi/3bXF60Pl1mVjo9JctYL42iFbxQlEKchALHXFBxwv1Q5VMxe1yf
         U2b6LJra3BDG5LX8yCPGIeqzhXiymHK7YrI1Vf8Td9yQrsA6nm1+vIlEN07v33Rxmh37
         cj2bW2yu8Sybrrf46PIptaY3DU74UjtKeA2xM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774518560; x=1775123360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7knoakIKaubGmtXGun6YWaShT3Bs+tTtvHK7ZAazb4A=;
        b=B6CeLRhfaLHreSZqXDfZMybEPJQ7BdA06QobB8DCUmVVJyoyLuFIFVdHpiW4/JsIEH
         +1bBBJoFyFkD4TIKfgwxbvGVaiJ9TTrZGSrzYsvL+0tZosIYd/pD2ySL7OOqg9OH2rYF
         YWg8OeADSx0ClbaaTbupDal2rMXIjtR85DUwbo08Avm2fep2szg5mOSU3gtPuM0N+chQ
         4nlb1v70y8UewxYXR/cqqd7YVLf7GECzxwjOdbn9RVUFtyfgeA3/7NJAXCmAWEVcyYw5
         vYjgyU39b6j8e4SmFEd5prcR9QtZuQaY7VUHRHs9hMU7PEYzRYSlicrbXXXxHtfWw/8Z
         TZkg==
X-Forwarded-Encrypted: i=1; AJvYcCXg/rbXq1tHCtOpUGutZgkXWcaHoc0ABhYw3vpE6ExRVz9ck+2I4RTUJQt4ZH9xE8lUuQ4BHrFIh9FuJjIeFQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7s7GFRSNUDYZ4+s2epqdiFL2IHQ81UQmAliuF2v/YL4yhuaAp
	S95jHiFjkSZ+oUiH84HUseOL+nDtftLeSINhVxhO6oVumS7Sq90khTz3MbzpttzNwDf/9deWSn4
	wjYSc2FkpHktLiSYv9jGHqWITsWbNV7IRWPAFCu2C
X-Gm-Gg: ATEYQzxV3Uiab8TJPNrpWR/+ZQK8UOaFOv8g4krVA2O4GlhKQPxnBSV5EUXPpY1C+bp
	33Vo5jJh0CxeSL5kDJd36ew+bdU6d+PxfeU1WNZSY1KkRzyXDuilWSVCsQexUFF+zesY30nGTtX
	Ynmcw7jq/59NUca1ZiNTZwb5+EfdmCDdibBS6/jg46Iuzdbjqb4CZdMfIwVWqROzxoCcPxrNRFf
	BlixuYR2wu8YKwnxRtbN0SQqLsNCHr4O/dROBQ9ETyURxy7wK635cyEfM7+YVJsRe8Bb6gXjCbm
	r6ljpMapPtBg5SqOxUhI0knODTGTSqRJTgtsxA==
X-Received: by 2002:ac2:55bc:0:b0:5a2:8570:299a with SMTP id
 2adb3069b0e04-5a29b995643mr1745645e87.34.1774518559747; Thu, 26 Mar 2026
 02:49:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260318084621.4127757-1-adlavinitha.reddy@mediatek.com> <20260318084621.4127757-2-adlavinitha.reddy@mediatek.com>
In-Reply-To: <20260318084621.4127757-2-adlavinitha.reddy@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 26 Mar 2026 17:49:08 +0800
X-Gm-Features: AQROBzBAalqKzp35Y91nZQL13UXSFnXuvsBfaF-bjpY0zqhQlozBnv2cKghChRQ
Message-ID: <CAGXv+5FYSCG4NYqUcBTBAvG-6=EQNStS5qRnzYV0oGzJ9dJ1bA@mail.gmail.com>
Subject: Re: [v1,PATCH 1/1] i2c: mediatek: add bus regulator control for power saving
To: adlavinitha reddy <adlavinitha.reddy@mediatek.com>
Cc: Qii Wang <qii.wang@mediatek.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_024922_213074_4DF7A2D7 
X-CRM114-Status: GOOD (  10.06  )
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

On Wed, Mar 18, 2026 at 4:46=E2=80=AFPM adlavinitha reddy
<adlavinitha.reddy@mediatek.com> wrote:
>
> Add conditional bus regulator enable/disable in mtk_i2c_transfer()
> to support I2C bus power gating for platforms that require it.
>
> This implementation:
> - Enables bus_regulator before clk_bulk_enable() if vbus-supply is define=
d
> - Disables bus_regulator after clk_bulk_disable()
> - Only activates when vbus-supply is provided in device tree
> - Has no impact on platforms without vbus-supply defined
>
> This approach provides power savinggs for platforms with an extra I2C bus
> regulator, while avoiding runtime PM complexity.
>
> TEST=3D Build and boot on MT8188
>
> Signed-off-by: adlavinitha reddy <adlavinitha.reddy@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

