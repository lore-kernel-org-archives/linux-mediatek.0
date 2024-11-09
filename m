Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A345DD5E375
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Nov 2024 15:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xl/6Nd33TzAD/3SkRfyJ8EH/YfnNuSgrwFN+Fhe734U=; b=ghQ/O5R6e9/utq+OAdjab1MKCI
	ufwQgV1et03p82d427R3dvaiea6HIeNp2V1uIK838VHbMhpKTeHHyGE4ECTBXiTt9cye+3/Y03QIg
	CPEObAyK6304wVyINj3pdX+TVt6eEHQDX2TuQDpZKlXFclx2i6Ag2pOT9qnoU+Ako7/I3y0/OoyUL
	1YmE3Mwbun5+gFoIVGGzQ0J4ZOPmrsWuaeoYTLV3hdb9xff4+TbgHwRf10gfR9Ey0O0kD93jtiSA7
	DLNFQW+tI/ImuQP0znhCg8Mz3TQYdQ3ngjdw9nc7mSc9L7tj0cCl48G0XqZPmdosOezPJ3K1ppehN
	GpSmkU8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9nNj-0000000DYiJ-3D60;
	Sat, 09 Nov 2024 15:28:11 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9nLy-0000000DYZ2-1ajE;
	Sat, 09 Nov 2024 15:26:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1731165980;
	bh=C2Fu967BHeELtFrqODTzmYpCvZ5v2z8G/kwBzGgDw+4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fNGukyW9cXlI5Me5NYcTub74uTNzYhzKxvGR92Pe0/y7V+RLnTESg08QeiXLF9esi
	 vI5cC09w0mrhryCs7vuCsjJheM9NCHjMjRcdRL4fRduv2RzP6DeDNebvMyp1uTBAmu
	 ZClu81a4fVOQy9t8LaOd7l9ptYQW1oEBexJaafHHC+LhjAjDnkoO0aolxdPXaWp4YI
	 TJxkS7rCscphXs3c+/P8LiqWxZ2t0C8Yq/3giiFj1EIgIMPfotDMzth20mWzSMhBAP
	 wGeXj2JvuWvJSy3wHvIESHMZ6iGRlclA5qO++vWcGiuA+7AeimDAzn6mggMe63PF/A
	 ie3FZQcz9f2Vw==
Received: from notapiano (pool-100-2-116-133.nycmny.fios.verizon.net [100.2.116.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1FFE817E35FA;
	Sat,  9 Nov 2024 16:26:17 +0100 (CET)
Date: Sat, 9 Nov 2024 10:26:15 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Hsin-Te Yuan <yuanhsinte@chromium.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] thermal/drivers/mediatek/lvts_thermal: Switch to
 IMMEDIATE_MODE
Message-ID: <a641e6b8-0078-4910-9826-a088e69b734d@notapiano>
References: <20241108-lvts-v1-1-eee339c6ca20@chromium.org>
 <CAGXv+5EOcg0pQxj=iOn_ff8-t6pyGKwemA9mdn=VCpxg6Uzt+g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5EOcg0pQxj=iOn_ff8-t6pyGKwemA9mdn=VCpxg6Uzt+g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_072622_584543_8B18F949 
X-CRM114-Status: GOOD (  13.55  )
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

On Fri, Nov 08, 2024 at 04:21:07PM +0800, Chen-Yu Tsai wrote:
> On Fri, Nov 8, 2024 at 2:51 PM Hsin-Te Yuan <yuanhsinte@chromium.org> wrote:
> >
> > Currently, MT8192 cannot suspend with FILTERED_MODE. Switch to
> > IMMEDIATE_MODE will fix this.

Do you mean that the whole MT8192 SoC is not able to enter system suspend? I
just tested that on a fairly recent linux-next and it was working without a
problem. We need more context here.

> >
> 
> Probably should have a Fixes tag.
> 
> Also, Nicolas previously reported that the threshold interrupts don't
> work with the immediate mode [1], which is why filtered mode was used
> in the final version.

Indeed. I suppose it would be possible to configure immediate mode only during
suspend if this is really the problem.

Thanks,
Nícolas

