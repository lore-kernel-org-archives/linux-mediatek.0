Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 920F6C46467
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Jan 2023 21:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zNjKwUpl4MAZri6WkLaSE7g3L6zmbqPHmA9ZJ9Bzi1w=; b=uiHakJy2ETCM+cbTZ4sRboBLzY
	2p+ABV2cl1zu1PxClLk4bSAQvXk3EjZ8jBzo5jKgF62VigUHOWD3grUtoqn5Qj0zz5Bz1G4fm3SuA
	kn2wA8JKubac3d5HNL/z5LUEHKO4AJ0WtH0A2gdAmffep26RwCUT6sAiyCNifWc2vYIIe2L2WtUkv
	T+K8hI6kzz5diVNY+BEfwqt0kM+ct8nd6P8at0RflZ+b+W1QDqA1O2yb3OWKeHfmefp37Vbju2ZdL
	sIDCI08mNZkER5b8v7Mnptbtbr5oyJEI/LGjPpSLQtUBZJr2r9sJjY3mGO8COChs8K1IPIpkJpVGr
	tmSHfc5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEH2C-008WPl-Pm; Sat, 07 Jan 2023 21:47:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEH2A-008WOw-R6
	for linux-mediatek@bombadil.infradead.org; Sat, 07 Jan 2023 21:47:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=zNjKwUpl4MAZri6WkLaSE7g3L6zmbqPHmA9ZJ9Bzi1w=; b=nC0UaZObS/Njj7U2DUF6MM79W6
	nYOSXH8BuEf/HCBfL05e34BLAt6LPsRQkvm0umDH9rtCQsYGXwBRJE0yjUAX1zgKt8oIbM9UcHlkO
	TlbdR3Z8cBIvRjmpY6OMuAFtLcQZ9nGcmsbw0OQALSS/8P4PvX92GV70Fc9aJsuFx+FLlpHIMyai/
	SfpgFcySSSS+TaGIjYYg/2R1e35t+CKGkISoOoK7FEyvOf918ufjUhP7l2Qw/uDvUsCjiGFyzkJwD
	uvR2C67mOAJKFgkk4N6e+0vb5lb6kLMdiccYxydT6xZwHdU+cTB1QuiTkZUoUsHvTZzNCvLC6/8sY
	eeeEV8EA==;
Received: from mailrelay5-1.pub.mailoutpod2-cph3.one.com ([46.30.211.180])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pEH20-002Dkz-1n
	for linux-mediatek@lists.infradead.org;
	Sat, 07 Jan 2023 21:47:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa2;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=zNjKwUpl4MAZri6WkLaSE7g3L6zmbqPHmA9ZJ9Bzi1w=;
	b=P4J8i7CuwvpmkbZ5a1nsowUUAbTvKNu9VrELvmrf8z8IsVdysY8xVbHJcPji5OUGYY0mKyPRUJK0L
	 q2eAqJpoU0YYTBa+th94PE+xy0++ga2HdaVh1ETK7UcQU+lelpnPe9vI5PsUX0L1//kAhIyQHinC1y
	 CIpouzk/o+Uu5lUG4zv0OgJ9In2MISZimMN4WtAyzVdlh6I29vgHEk/FEU7v3IXCnCDW0OwDKy07JV
	 bdbQfulVL4QbiZLfT+5Ypo7a2fe2AESQ5FwLqCvfmudujtG5DLxVUmkPjNrfNke8tGVTvbMqgCHaGJ
	 kxnWoTN7fVeIHS+iOkJR9R/v1IL3LEw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed2;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=zNjKwUpl4MAZri6WkLaSE7g3L6zmbqPHmA9ZJ9Bzi1w=;
	b=/5wL/FcJR0pGFXvug0CaJFWWqZOoKGhwrv3hW6ZqandXERIJZ+x5mtwNcs7aE5hZJwKV/R70kMOUB
	 nLj6Px/CA==
X-HalOne-ID: 328201d2-8eca-11ed-857d-7703b0afff57
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
	by mailrelay5 (Halon) with ESMTPSA
	id 328201d2-8eca-11ed-857d-7703b0afff57;
	Sat, 07 Jan 2023 20:31:02 +0000 (UTC)
Date: Sat, 7 Jan 2023 21:31:01 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: xinlei.lee@mediatek.com
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
	daniel@ffwll.ch, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, jitao.shi@mediatek.com,
	thierry.reding@gmail.com, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH 2/2] drm/panel: boe-tv101wum-nl6: Reduce lcm_reset to
 send initial code time
Message-ID: <Y7nWhciY7cru78lQ@ravnborg.org>
References: <1672974321-18947-1-git-send-email-xinlei.lee@mediatek.com>
 <1672974321-18947-3-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1672974321-18947-3-git-send-email-xinlei.lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230107_214712_837441_D6D970FC 
X-CRM114-Status: GOOD (  17.87  )
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

On Fri, Jan 06, 2023 at 11:05:21AM +0800, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Since the panel spec stipulates that the time from lcm_reset to DSI to
> send the initial code should be greater than 6ms and less than 40ms,
> so reduce the delay before sending the initial code and avoid panel
> exceptions.

The changelog says "reduce the delay", but the patch removes the delay.
Are there other delays that make sure the "greater than 6 ms" is OK?

	Sam

> 
> Fixes: a869b9db7adf ("drm/panel: support for boe tv101wum-nl6 wuxga dsi video mode panel")
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> ---
>  drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> index 857a2f0420d7..f0093035f1ff 100644
> --- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> +++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> @@ -780,7 +780,6 @@ static const struct panel_init_cmd inx_hj110iz_init_cmd[] = {
>  };
>  
>  static const struct panel_init_cmd boe_init_cmd[] = {
> -	_INIT_DELAY_CMD(24),
>  	_INIT_DCS_CMD(0xB0, 0x05),
>  	_INIT_DCS_CMD(0xB1, 0xE5),
>  	_INIT_DCS_CMD(0xB3, 0x52),
> -- 
> 2.18.0

