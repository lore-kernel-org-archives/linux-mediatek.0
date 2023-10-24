Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20DD6C25B67
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Oct 2023 02:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ZaH0MDvvHfzDxjSMv1D/503RQvHmZjhF2jnF7B3KjI=; b=XyHUF/+tXUe6evAt2Ynxh9hhkG
	CpvDTknFT1+7QFsod5+F2lgAKGhwTUsOb2TWq+2MjYgA5EE99sxmalt9JbpAFdlpTLX58HvtBaO+m
	H5mpkrmu/kGhGWjxmcbTkblt8spumBgXM2GfEOXQ5e95T7+4zWKRXoNPq3h3zRsXk/ZJdXfhlUm0/
	ncMxLTbvpbwApjcUyzDxOfsM6l+QXVQmMF7qcW+KEdxRQRjID1rVZgDj0FwKo9yBMvKW3O8SjShYk
	w41+258+qI6S4B4PjcUiPvghIh1ExyDxelOzE6wCVvg1JWn7SIbJtEPvs4Pn9HzsFKF0e/x6aQ84/
	gLLWfDKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qv74h-008eE4-37;
	Tue, 24 Oct 2023 02:23:19 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qv74e-008eDN-2d;
	Tue, 24 Oct 2023 02:23:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id DB9FBB82287;
	Tue, 24 Oct 2023 02:23:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36C46C433C8;
	Tue, 24 Oct 2023 02:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698114194;
	bh=8ZaH0MDvvHfzDxjSMv1D/503RQvHmZjhF2jnF7B3KjI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=jVpLD8HvZfDx1+iX8aQCsGBSyb9G3Z/x2uNggeifEANFy7wqm1wy2ysk7+O/h9LiI
	 LUScVsZRE3tgfL3rNxme1p3qPM3KbNEbb11UeRtAj9M033p/s5QbJFZ+cmTfzW/0zF
	 bn/HcOk9DCywbvssVzUaDk0sZZKfDSZbNT7Tgnu4ygun2yF0prlnwFRlamsfTKOnLP
	 3bDdCRqfoRANjDeiFu1dytmxbhd45/P1e0XeOU3rNIFqPmSwKI3sdQGL59+6i9XYlY
	 Bgih7whKhMFLwyuYZcJ4scsKU8lLHfEucNqDcGTkYA81F2SsUoZeBMDAOdzbrFQNFx
	 oUitgqTxHRdow==
Message-ID: <645abb26a40d4e03e5ec3558f9204083.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230518040729.8789-1-sen.chu@mediatek.com>
References: <20230518040729.8789-1-sen.chu@mediatek.com>
Subject: Re: [PATCH v2] spmi: mediatek: add device id check
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Sen Chu <sen.chu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Matthias Brugger <matthias.bgg@gmail.com>, Sen Chu <sen.chu@mediatek.com>
Date: Mon, 23 Oct 2023 19:23:12 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_192317_046418_5DC007E8 
X-CRM114-Status: UNSURE (   5.72  )
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

Quoting Sen Chu (2023-05-17 21:07:29)
> Add device id check for spmi write API.
>=20
> Signed-off-by: Sen Chu <sen.chu@mediatek.com>
> ---

Applied to spmi-next

