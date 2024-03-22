Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB7FC47DD9
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Mar 2024 06:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gT7Bg18sIXZg+EjgY6lBXh74L2mub86VFZv8DtqvGEM=; b=nCszUe7ZMb8pJW4a44ZxN1BNJ1
	DYtCL56lU0Rha0W0kTWIGI68L6PGnfTKtJwCibBJ3KyCf4uvdzhV4SPywPqT+/RAAIkhL3VBbTlLM
	fpVH+VlZ5pRjkQO2jU3prt2d8/gdHIgIZqxkiDNVbkaFA0ntK9+oMw4mfJBySLSikTpZ8hgV6KHfE
	KC0KxN8B54ZwoHER8t9L6fl8br2LU62ZDZ3E5lL0QtwyDt+dnL9fzavh0mayXH/Z+wxCjwrxHLiLA
	8IELibfq7NQrKxiFpAsaX7Ir4x0ry0qADxb8kxwsOxfpwV3XhAMrMmTaJq/9vqnWt+SOxvFfhxL8w
	XEBY2TNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnYCt-00000005yyx-1gPH;
	Fri, 22 Mar 2024 06:16:47 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnYCp-00000005ywD-1vWE;
	Fri, 22 Mar 2024 06:16:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D1036CE16E4;
	Fri, 22 Mar 2024 06:16:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52942C43390;
	Fri, 22 Mar 2024 06:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711088198;
	bh=LrKxP3gm3uo3ToMeUXgziplcc6id5nTLO7X+pOXUayc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oQtSKAmAk0cKGUFhHQ+JW6Wm6UGuBD6ww5PLgK2/IZtltY5+Dki2bf5/Wv9QLWMYN
	 XUikuAIsCQOQWag0bM3/jKybttyCf8q9dURrF8Z887Tp/+LunpV7Y2G0nF2GSgsXD5
	 6zvB3BXFfM2G9N+6SkKR1RZoChB3g3LNqEBOnWyAS5all7n+yD0DDgUwje9oXUavPD
	 kIU7HS3tVvKXVcki/fUEfvpE/QnmOzl4+cQWFoAW8kEa+0kAnUgPKw1VCo5aWZ2471
	 MKj1U4ngpZwjm0CzaetQ0iL4nWzXt/RWMOSRyz+604MyQoeG5p4Tbn7uC7HxYqqbcz
	 Nz3PNcznGYDaw==
Date: Fri, 22 Mar 2024 14:16:34 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mathieu.poirier@linaro.org, andersson@kernel.org,
	matthias.bgg@gmail.com, tinghan.shen@mediatek.com,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, wenst@chromium.org,
	kernel@collabora.com
Subject: Re: [PATCH 1/2] remoteproc: mediatek: Make sure IPI buffer fits in
 L2TCM
Message-ID: <Zf0iQikMyerbWVMG@google.com>
References: <20240321084614.45253-1-angelogioacchino.delregno@collabora.com>
 <20240321084614.45253-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240321084614.45253-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_231643_699304_41AB87A0 
X-CRM114-Status: GOOD (  13.66  )
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

On Thu, Mar 21, 2024 at 09:46:13AM +0100, AngeloGioacchino Del Regno wrote:
> The IPI buffer location is read from the firmware that we load to the
> System Companion Processor, and it's not granted that both the SRAM
> (L2TCM) size that is defined in the devicetree node is large enough
> for that, and while this is especially true for multi-core SCP, it's
> still useful to check on single-core variants as well.
> 
> Failing to perform this check may make this driver perform R/W
> oeprations out of the L2TCM boundary, resulting (at best) in a
> kernel panic.
> 
> To fix that, check that the IPI buffer fits, otherwise return a
> failure and refuse to boot the relevant SCP core (or the SCP at
> all, if this is single core).
> 
> Fixes: 3efa0ea743b7 ("remoteproc/mediatek: read IPI buffer offset from FW")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

