Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA0FD25042
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jan 2026 07:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4cxgNENcfo8cXQBg0dw/jO2senp7A8YTAU0sZZxB0f4=; b=fXja2/lcJVVZMVC0XSTqJLVcwm
	yRCH/7FU9i0Uleh/Y0kT7KlN6rgBHuuhwXO9wEAfgGCzGHQqR7Q+XOQ6DC8MVK8EskmqyP39Brmvd
	c5m7Rru1hxsMptMhDrdapOVdy90k2GEIqoCyRuycreeC2seimw+tuH65KVSwqmjqJsOF9HXX92PEi
	OSvYhQt422GmqefR4AYHJpVMNIF7kYH0B6p+au3Co3gsMRmftu3DuF9RErNt0bBm0cmk+nFpaZh0m
	UmVHV2JyNtYHu84Y5ltNHz5LPXablUlg5qX6ZKh80sL3wQSnjRNHhxXatDe4BTDrj2Bwbus9MncdI
	39J/CKWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCbd-00000004vAB-1bxH;
	Mon, 12 Jan 2026 07:44:53 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCba-00000004v97-3WWj
	for linux-mediatek@lists.infradead.org;
	Mon, 12 Jan 2026 07:44:51 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-59b6df3d6b4so5992902e87.0
        for <linux-mediatek@lists.infradead.org>; Sun, 11 Jan 2026 23:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768203889; x=1768808689; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4cxgNENcfo8cXQBg0dw/jO2senp7A8YTAU0sZZxB0f4=;
        b=IEbRQFLf2Nv/INReHoLlGQXfWIvTrB+uZqPExx8wwGTVE+GgODP0xnLbIBRumIbIDL
         sEUKuX7eoe5VyIoxkYUWplH3dsIg30VZJ1m1v9YLf0kFe3ddKI8IJtFBp4gGG9ixxMng
         xu/6qrtDRIbPbio85gevGkSd+lAgeyMe5IgFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768203889; x=1768808689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4cxgNENcfo8cXQBg0dw/jO2senp7A8YTAU0sZZxB0f4=;
        b=f3Wv/eELltNWcuc+qJDf03xsMDg1OqMv+p2z7mE6xeuguETAnxKsPdJPRxlhCSOc/E
         jFU5h3wFoWN8lLenE50pOjj+zQwa+53Jzjp8tdocMB+TIuX0ZK0sp7OuOc2YaWPmZgZG
         eNjfpB3s+xHYbYEly7eqUbWtPbqKALEPUORIMybjgM07rG/T3DYqnt8KzL71RuT//aGp
         oDrSsTvadOkc9yszWkL2fd1rTCnygZRd8K2BYDLuqgH4K0pU16EQ8dGmTHrsB6OuaUR+
         tZzAmHxSRz8K4iA2mhU3b3VQNWMS24GxaKM2i3oFjUKdXZ30JlKDyNvkMnsoYvOdadAO
         LwCg==
X-Gm-Message-State: AOJu0YzFNlkh6s/mXEN6bx7Bp4bWDS2Xf5Hl+4TwWRmdaj+ltULmkgnB
	FfUepjSKmjJW3gKpH+y1zkilnwjj+BqBYradgHAtmUMpf/NeJfQ6WCae8I/P4uZN945ApQJ1kVk
	U8nm6Km5j6POZbyaBBjmUBiLRIKqnrOgS2wwnJa5F
X-Gm-Gg: AY/fxX7muELthFNrYd2uyzrwCmMUD+5FjzVsMglbTE2746wSCMWsGQr3IgSVJKgybe4
	ZaFY46q+aWK53rKL9DToJCRacP9W67gR3mDwoXtrh++XUEYr+B1WQ0wgBC4l1qq0y7QlwzCkZpn
	ykBUJ9tmmyXT4S/GNk7/cmpqyViA010a8FQEu+6YFnEMYegg4P/RslclujdG8xvHesD54WTdROY
	40qiV3vEria5HgfQKPrn1gi0KLX3mh8FpBpGv+H7SKl+siHyl9w/jplDELcZZ3fAIG/4wVX3PoH
	5EJn5nx86GUDRuW7m2O1vhmq
X-Google-Smtp-Source: AGHT+IHw7rJNOI5FOhbZX1z1+loaYEI568M1UN5tIdw0I/h/UzWdRmrgGYuJ1o+tqHTlBgV9Gn7UvOzvsEm5UoDFFCM=
X-Received: by 2002:ac2:4e0c:0:b0:59b:7a80:3b66 with SMTP id
 2adb3069b0e04-59b7a803d15mr3432200e87.35.1768203888672; Sun, 11 Jan 2026
 23:44:48 -0800 (PST)
MIME-Version: 1.0
References: <20260109114747.37189-1-angelogioacchino.delregno@collabora.com> <20260109114747.37189-12-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260109114747.37189-12-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 12 Jan 2026 15:44:36 +0800
X-Gm-Features: AZwV_QhvNS01wOFUK2LxZMHidH88HiYPvQjeQAgpHhkp5P1dAOfPIn4Zb_mnq48
Message-ID: <CAGXv+5GywzbWWMEeAkexntNbRfUzdnahZ8oT72ZMdzLS6JDiUA@mail.gmail.com>
Subject: Re: [PATCH 11/11] arm64: dts: mediatek: mt6795-xperia-m5: Add UHS
 pins for MMC1 and 2
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, sjoerd@collabora.com, 
	hsinyi@chromium.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_234450_882442_CDFFCBF5 
X-CRM114-Status: UNSURE (   9.48  )
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

On Fri, Jan 9, 2026 at 7:48=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add the UHS state pins for the MMC1 and MMC2 controllers and,
> while at it, also add the correct drive strength parameters
> for the default pin states for those two.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Format looks correct, though I don't know anything about the drive strength=
.

Side note, having a pull down on the clk pin seems a bit weird.

