Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D47D2503F
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jan 2026 07:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mgp98Xl/Ij96yBO8OoKZQJN+mUE2nEt7kKcPNZRNTLE=; b=ti8KawZ9K195yJBvc3WChaZ1IM
	CZYSBVNTElbNPw3tkMGbl13rn7pST/S62rR4oGPA3pFrZ1eCCpCsDqK+lQ16cDOo1NhxZe547Kgn4
	vIBmVzM2d+aVOhDI8S1jfFXgFpEd/+Y1BmdXpToHLufQXlVdBt7AzDAOYoLDCrf+X8iOCQlBouFeT
	Yu34Kzs8NTc9j+q4rWxCWjlbM6BMugM69iRAQyetlHdpQ2fsWtfyQ88cT7bI1sGIvYLzAxanButg7
	X3WRak4//aC8Ug/1o1Omcya65XU9qoLyHT9RtNUz9DN8JE1wGPLLWSG2zrqUBmN0QLQVEZR1Yg/pl
	GopNaF8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCKG-00000004sJ4-3fhW;
	Mon, 12 Jan 2026 07:26:56 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCKD-00000004sIO-23t2
	for linux-mediatek@lists.infradead.org;
	Mon, 12 Jan 2026 07:26:54 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-59b30275e69so7016508e87.1
        for <linux-mediatek@lists.infradead.org>; Sun, 11 Jan 2026 23:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768202811; x=1768807611; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mgp98Xl/Ij96yBO8OoKZQJN+mUE2nEt7kKcPNZRNTLE=;
        b=AJrYy0nlISSrJYCzvyeTcpCxaFRE4Q0R43yeRsr0ylKou+MTIm1zCHTTKjndqSiqFy
         wpZ7MME3KWjFK3tin3bOcH/pemU6Ns/anXx0UUbVjhXHrJV6lJSaGz1Eq+yfdSRPiIOb
         5ZqXPaYHcOWXO8YR7kmV2jGbV4Gt4+5vM3pHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768202811; x=1768807611;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mgp98Xl/Ij96yBO8OoKZQJN+mUE2nEt7kKcPNZRNTLE=;
        b=Otzq7XW8BJEq0lk1JuzQFwDypd5XyJzF0tp2OY0CZipFStjLXDJUpPwE+iHuF2dLJL
         rOpjlO1lVaLMalgo7Vg+7UyS8ENN/CNfP7+fRK5QmiyWjCA/8pO7Gt5nJ6FatsLq/Piu
         0w1oNpFW9PhoPluRk2UDO5BAjDtgxndfBNF19S9su+xgv5PxkY2TTbGQX4pBvqU5ZWO+
         Jiij4ziYG6gEPdVwYOX52A2BXxsB8nhhbtvccdLkt+8vNiXV/BKyecVa3ydbswFQukVq
         1aziSfTHgfZVw/zh3CnYVM27tJjUmQK4AGoLy2X6FVn7LxOPnKF3dsLhlno4gBZxmsFg
         +bHg==
X-Gm-Message-State: AOJu0YytH2T6HVTmU2SgEegLX2L4j74V3o5PEdvBvYcWnxq9lsiuMw69
	CbDvaMT2opUD27MhyfXbHY95vAj8JtPMFOx3BM59cnBX6B+a5uV7lmcY8oQztM8h7Oy3JUSM18g
	QFS5Qvh+E71l3qhyBJxE+Tj68Hk8aZJJcjPvpdjZp
X-Gm-Gg: AY/fxX48rCWzQ7HITFatjOytgSojTD8bDmbCLctkubTdaG+pkHFMlMgjUr0k4EbWeig
	LVW/JATXEhNp+jqf2SAA9bJ9kz38jNUtHFDOWCrjsfnnAOno6i99OGDkpDYpxNJrfKUzrIzv50H
	zV4sZlu0KJNXQOv89Tsvc7QgkCUzaM5dHEd3gD96HTm3d0JKnAyO5EtiNEJ2hqDCDaVfkWmJBTu
	EKhWCt3UjVXJD0ZGhAEy9UtX6paapXDoI5fdvoU3kUcgmYdLnwcF854XNlnpPyxuICHKIOdk9ru
	biIoGzDLjT3Q99lKHvqhr5QQ
X-Google-Smtp-Source: AGHT+IHq6HJyogErRwRuF8uYG0l1rEuOGyuyg1CLZdmDapOhugecy77eR2OV0LOvv0EJZ7znHYv5yg4KCxxMDd1cRnw=
X-Received: by 2002:a05:6512:b17:b0:59b:71f4:3df8 with SMTP id
 2adb3069b0e04-59b71f440d5mr4669766e87.32.1768202811171; Sun, 11 Jan 2026
 23:26:51 -0800 (PST)
MIME-Version: 1.0
References: <20260109114747.37189-1-angelogioacchino.delregno@collabora.com> <20260109114747.37189-5-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260109114747.37189-5-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 12 Jan 2026 15:26:40 +0800
X-Gm-Features: AZwV_QivUko9VD5wl2tpLh_Jtkrw2h5oLTr4Z80Ltaif0J7lb0PaGCnIE1AKRSg
Message-ID: <CAGXv+5FDQ-GeBDQk6MBj+Ddao+6pkr9Xm-n+CLTggzZPTuC+=A@mail.gmail.com>
Subject: Re: [PATCH 04/11] arm64: dts: mediatek: mt7981b-openwrt-one: Remove
 useless cells from flash@0
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, sjoerd@collabora.com, 
	hsinyi@chromium.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_232653_571181_09468A0A 
X-CRM114-Status: UNSURE (   7.08  )
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
> In spi2's flash@0 there is only one `partitions` subnode: this
> alone makes specifying address and size cells useless, but then
> this subnode has no address and no size, which even makes the
> currently declared address/size cells wrong.
>
> Fixes: 869b3bb5ada2 ("arm64: dts: mediatek: mt7981b-openwrt-one: Enable S=
PI NOR")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

