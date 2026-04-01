Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D4D1076365
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Apr 2026 05:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OqQ601QbL/y+YrmVBidvwxw5csxIEjRfbUIlqPG+O5M=; b=K5JjhVmFCnSOh8/Zr3peRiZ/uZ
	1rAbrwclnzeEyt9O0le2r0+8h7jyFx606n402TKOpMqYw8KnypdFMVQwdu591BGuxfZ9TTD523vd8
	Dc9X9eTvK2xj17Pei7nbcqJWoc9XaBYOIEpCoNExdU0sx6NKdY/HMoKlD94b5tb5t/yJ3yXCkdEJr
	2foPgQnPLIewIpGs2P30KhvhmjEKkmmr7/uJkK44RDOeDAoAAsmF0hFHhHsCSs7nUnztweykqAgRb
	sO8mz+BKxMhrt5dLH3O/jsyPUcrZt/ZMsXmDbgz8T/dZxCtYwd3NbWj37Ydq/RILmBzSopu/RdNDB
	y27921og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7nhJ-0000000DyJo-3bdL;
	Wed, 01 Apr 2026 05:00:57 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7nhI-0000000DyJR-19XV
	for linux-mediatek@lists.infradead.org;
	Wed, 01 Apr 2026 05:00:57 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5a279ce9475so574731e87.1
        for <linux-mediatek@lists.infradead.org>; Tue, 31 Mar 2026 22:00:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775019654; cv=none;
        d=google.com; s=arc-20240605;
        b=famV7FlyikXzH5NrHGgnFB1KC2ZOcuci9VWc1X5koGpKDkfpa5732ziDldweTlgmj/
         HA5htjTfzCYEC33zO9u0LaupC4L9gVbe6K27y1T/et2IEnZz4QvxMbQvwsLS17l0rase
         LAsaPy2rkSI7jKKq2UQ99N6oqlWMiNxBMM0WqD6CwbkGilWa4/Y1n+sBv/WzbuwoKvD1
         M3uyWmO8o9Ilf9I5AXVkaMHVW0lJWQY/8pPOJHmBYNFiKENvSWvwucL0/e1BJ+daQhzS
         7hMwNVbZTepPnRcBBuzl2bNkRNPXvlVtXFFZ0SD864rom9wjkkaiZT8Pzam7HUCntHzZ
         +BgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OqQ601QbL/y+YrmVBidvwxw5csxIEjRfbUIlqPG+O5M=;
        fh=Hjobwk3yVsD+fOQkop4xDRwE9lcG4UBEnFzjPkqA0zk=;
        b=ZCeQSeIjDbxF1FlzFVFBL6qFuN/CwL7nOaqiWIz1yXdxUCOvXt71mbBsVeLaw8fJrj
         FRj/Csd5+0Pn4urCb/dT9L4/myA2kJp2ErIwKryVCbJBvyCnqib2Whiex3fKPLEobIlB
         gX9+9XvLSJh3byzzGyhUHbenNfNooOHIXia3L6vIlL3v4IGXzbNiq/ZcpTIJ6nfsTKz+
         odbGmEZ/t0AgTcPYiabhiPzpRotwwQfRK3iO//klXFfN8K9LrDhqxHHH/uMr/NFwSi4J
         d1Wz3dbQUjahx7csEtonWSjO8aUoth7lez6yhMjuBPQg/YqD2cioLVbEIoCeg3/X+KJu
         /3zA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1775019654; x=1775624454; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OqQ601QbL/y+YrmVBidvwxw5csxIEjRfbUIlqPG+O5M=;
        b=M/ZJaQ2pKLvI07J5Mjwe1jPz4avwU/wVbu6Z8A5yxOFCrc9TgFVnsyG2svDqQgmPxq
         Lwe/oWw0+cOq+iLe4jHvnukuGQZ9u/Fs9tjbxWj6LR42XAPQ+UW5+ej5IiCkuUHKZdHu
         9DXlkdwtFq+DoisJVSM3dr0ZApeQKODs6qYvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775019654; x=1775624454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OqQ601QbL/y+YrmVBidvwxw5csxIEjRfbUIlqPG+O5M=;
        b=SUaUyv8rNC6U8QhcXDF2GF25KbxbggBxWUqPc8F7jRRSaGgGqMkhWoQPqxb1O25ztv
         5PQa8Pocpz2nxAI92p0PV98BZl/gXQSa6z/n+bNgVKhJ1Nndep5hhDhif8L6LYMr0aZY
         cXE2h46gwTWxblRoZhAaYU1ienQ9bHyDAsclM0kRqexJW/1jlOGHqGpQCxW2iHUPU6sb
         Kj8jxFVLvX8ygKcX0ZmrqHFtR4k5Jo7lDqEQJ+iTNnryPUwSzygdoX9eKKjrtuN6ctvI
         x3cAEyuXWFg3HNyGl968hiZPvTbTr799XJKVPxelJS0oAioSR+dcGzG8auKwZT+JclrA
         lAiw==
X-Forwarded-Encrypted: i=1; AJvYcCUCuN2Rwe+NDQh3uJeGDeBNhCCpJ2sRd6WPmhceyjvHnchyBuEMW/WKDaC6C/Gob3tgI/psZQS2FUo9Krf4+A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwwAQZNTYCRV7AuPUavGC0MMk8XYmDeNpXcSHfAegqW6guCjaSu
	629REPtc1EQKCTTSOdk/nlnyxSQfvcO54CUXYlCa963CLLcXlxrMrqd7NiLRj0aHbqZmAwd1nW7
	Wi2iccChiQFDAG14/1Yl4P2QwGqSyacT5dWA1SM3z
X-Gm-Gg: ATEYQzwwDGLOVkg4bBVgr/xsAMepYZZTYe7UBx2kJlZIDocUs1Erl5U1kA5hll3a7vO
	uBGtrPXiiQQzCesuM68nOFhM1djzrOy6INuebFHl9NjvDgtg13CGPqFid6xfk88XaN7ymCl1EgW
	Rf0k3CeZt7uEuq7icmdB6oTRzskB032GKn9Fx3bSle/8neZikaQpykhVgr++nWakD/AA1BM8g8S
	S89mu9TOhvloGTpUarjuxQ9OSUzNGDYBSGwIHxt5xWY3Q5iueohU6TmANtlESOpeHx3qJnbSh4H
	0m50tM4YBCJzj4z+CfuSOhSzn5sIwE6Ew9N+ug==
X-Received: by 2002:a05:6512:3ba1:b0:5a1:4e53:c68b with SMTP id
 2adb3069b0e04-5a2baacc775mr2863990e87.2.1775019653869; Tue, 31 Mar 2026
 22:00:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260401031917.9108-1-jian.yang@mediatek.com>
In-Reply-To: <20260401031917.9108-1-jian.yang@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 1 Apr 2026 13:00:42 +0800
X-Gm-Features: AQROBzCjsi0xnmIJgMsX3J2duHUIVsuutzrB8RxL3Ea321MAwxUsjyebvjmh5A4
Message-ID: <CAGXv+5EJ5rUVdnJZKwLj_NLQVtn+8TE4+gEqt1=LQrD28pA-eQ@mail.gmail.com>
Subject: Re: [PATCH v1] PCI: mediatek-gen3: Align PERST# sequence with PCIe
 CEM specification
To: Jian Yang <jian.yang@mediatek.com>, Manivannan Sadhasivam <mani@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Ryder Lee <ryder.lee@mediatek.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, chuanjia.liu@mediatek.com, 
	yonglong.wu@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_220056_477223_1011DEBA 
X-CRM114-Status: GOOD (  12.11  )
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

On Wed, Apr 1, 2026 at 11:19=E2=80=AFAM Jian Yang <jian.yang@mediatek.com> =
wrote:
>
> Fix the control sequence of PERST# during system bootup/shutdown to
> meet the requirement from PCIe CEM specification. There are two major
> changes in this patch:
>
> 1. Some of MediaTek's chip will stop generating REFCLK if the
> PCIE_PHY_RSTB signal of PCIe controller is asserted. We have to
> adjust the startup sequence as follows to ensure that PERST# will be
> de-asserted after the REFCLK is stable:
> Assert PHY reset and PERST# -> delay 10ms -> De-assert PHY reset ->
> delay 100ms -> De-assert PERST#
>
> 2. Add 'shutdown' callback to control the timing of PERST# and power
> during the system shutdown phase, ensuring that PERST# is active
> before the power on connector is removed.
>
> Signed-off-by: Jian Yang <jian.yang@mediatek.com>

Seems correct to me.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

If possible, I think we would want this merged this cycle together
with the other pwrctrl changes.

