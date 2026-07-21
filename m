Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F31EC4452F
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2026 03:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XR3KYJTpiBWw0+V3gZDjHv2XkYH8NffsgkJP+nAma/0=; b=RJjuq4AeGQxTWfcuUGrnbHVmWI
	opcUxsWWwi3NGArliSOYhR+qFiomJeUCY9/aD5ASgoN0eMmxQpqM7kk7b1psUrfAkl40A2kgdvujs
	IDrPLVDPaYOZlc70NcnZcvsfSAdgi4Eo7agtuYvTmQbDa7ReiyRzHiwAP9rvrpGDP3hwhdGfVFTJ8
	1V/8oGMBec7E0L/tfbjKTXJJribx0aOhm8CgL1q4yHzT4FiAoO4OKZVmpQ0yHdqJJwIJsrxyXzfai
	BEfK1E/pRqucnXYsWvjYnuwRG3AhlPz2p0mvsOkW2zW9WjBs6KRgxYPnTfQ2wIav2Z7cR3Md+Cyln
	5z2ZkbAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm0ql-00000008Iej-1Fzf;
	Tue, 21 Jul 2026 03:08:55 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm0qi-00000008Idc-0Vxd
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Jul 2026 03:08:53 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-80e2cfe6918so61909247b3.0
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Jul 2026 20:08:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784603331; cv=none;
        d=google.com; s=arc-20260327;
        b=UtfCTYtnK8M9tNTbp46zd0Cy7eSDjD1NEh456zutNnS5R3kAaJh68hp1Lf+v3ELiGd
         Uor7knso2C3jjPzVYRktiMgFqJvazoUU/BM3co1nS4HIDkhnlJXtW0D5BpbaGgNQ0otv
         C6Z62JgTFm8RDvD1VyxoqLNut+ltIyF89gF+nb8m6sL7Jw+5uZ8t80N0/FoJi5hAlDV9
         Of8eSnWbqm5j14oee5v4Y2pqnt08pRgleP7c5jGYxNZVJeKVdWN1cshBjL+Lwan0C90n
         C9OJW9XPZhtGJRcSK2gGtOqagMYCStnxPv2tFfBwWcZBGUAwnjgsgNDI0V51AHK9l+vu
         lrpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XR3KYJTpiBWw0+V3gZDjHv2XkYH8NffsgkJP+nAma/0=;
        fh=rowIxStfCl4OqJnO3nay6mAiZjo9036zcX5PbM95FYY=;
        b=R4ccgrJUzpd186S0Zuw1I6aZLLYhZX8HxaTphlO9TnEeOKXx1kmk1Dpu3jWBHkvz8S
         w6AuWa79NGIFAiTOFcZ7D4P+SiWiOoqUQi3KDn92Qd8NSwXfCFw/jj0Z6sI7aIIOvcVn
         aQfpOc5knjGDyw/Opn3TYrlcJliFCKCLBZoNTczN3ijniwp39O5boa9BedMvj61ThVXu
         HxbyDThFoIdMh0DNze/lQRl994tbxvAiG9/2W663jxNhGTzQZZiI56bTTc+OGKiaTtki
         EZxRPngTvd5H/TTrxiix/QzqhukqItzcYO8nzf9ah5MAGySu1lLDwl0q+2x1Ax0AZRx3
         tKNA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784603331; x=1785208131; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XR3KYJTpiBWw0+V3gZDjHv2XkYH8NffsgkJP+nAma/0=;
        b=FUXsbkiwPTwJQGQAtMQLeJP9TUTCmEZcaQ30oLPX5IGBV+Y9yFBS4+Kcd+P0sr/JZu
         RC+vqP6uN2ncsSUufWBgIWhfmeb4b5ra81k48Os2LxwNoHXL0m4ir2atqXRNWBOu0QRM
         BgsUdBsgTzM2XMdmzLcPPYhU3gxSZvJWncmUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784603331; x=1785208131;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XR3KYJTpiBWw0+V3gZDjHv2XkYH8NffsgkJP+nAma/0=;
        b=ezv+hOVUoKYyspS5k39mBGdKTl5dB64iRw/urU8O1gIq53bF6b+7guavA/RcJGsJ3C
         lt1IteM/AwPoWPWszwNEm40aAj6F1C0bQKATpY25fxxaLDRvfhNsSKE3DRcrl//QZaR0
         Lem+MR7Ar+bSbQdH5J3n+tr/ezybEtOiYlyAWFZC8M22chkWyg8PNYvnxb+25ZxJ6Pq+
         YE/cE0okZxYjOmTy/sCm2GEljyL+h2XQe67Ge20bj+ptIanrEf+to8PyeJDaF+D4CCoH
         Wv/k97StkLfK/guwRPNKweUNtsr4zpOweny7VuiJ4VYnLrxUJN4lZG79EFLGHu38jxUD
         Mkwg==
X-Forwarded-Encrypted: i=1; AHgh+RpohaZcdLGLYKz4P8xG1BDqs1vckzmNegSsYcHJMilYbz1h9eB8lwi3NQV6UX712BberX0VPwLlxxATwyatHw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyPtJQrLzQ1WSkmXRq+SxBwx9wqQqE+hiFsav8h2ZOk9bpz0hPd
	ErcJ8pRYShxCo1nokiaYZ+jwA/23oFEyYpm9S58ns9O7agiLkNde9sXZ3JtAnGWg4ljXVsCaqq+
	2zQlHZOWv/R6++0xY1zdz/IfPskgByDhLbeq32DTz
X-Gm-Gg: AR+sD13G9D3RVFXz54ab+kB2sXNvULSgYAfvwCZwDYNq0wGGDvWXzgIAxqcem3hbd5H
	o0KOybdESP4odtUZ0H0eKa+oeoCQzBRPmXbDjYIgPNhrIIjnuux+sGEH0z5zKeIS7UwoPHGz1//
	wutD3BK2TWbIrrPfwcY7DOL3CY0jXno5lRG0a9YP0S2nb7uT4q/8u8dze83hXdzVrGaPSSZfCVo
	TtzLiIU0Sw6F//rTXBNMukOoGRmS/4M0xBbtLfhumblGPYPzN0OKYT4s+cPrVpVJISzkEiCBadP
	oMCs6HgD3W2FpVTU
X-Received: by 2002:a05:690c:6e11:b0:80d:78bd:7a37 with SMTP id
 00721157ae682-81ef260c8d6mr52675177b3.49.1784603330663; Mon, 20 Jul 2026
 20:08:50 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1784600387.git.daniel@makrotopia.org> <e7c7944f7ab37332c2afcc808aa8e105e4752a43.1784600387.git.daniel@makrotopia.org>
In-Reply-To: <e7c7944f7ab37332c2afcc808aa8e105e4752a43.1784600387.git.daniel@makrotopia.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 21 Jul 2026 11:08:38 +0800
X-Gm-Features: AUfX_mzmSRPeYPFPJC8VuKfMiw-bdx8XSXW3n2innYVifkRGLxhR_ScL03w_tUM
Message-ID: <CAGXv+5GOhYnziQnKeUYVJVr1Hn3vtE0Jbcqp3FoyT2eJpUEzMQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] drm/bridge: it6505: guard against zero channel
 count in audio infoframe
To: Daniel Golle <daniel@makrotopia.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Allen Chen <allen.chen@ite.com.tw>, Hermes Wu <hermes.wu@ite.com.tw>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_200852_161610_3E508DC3 
X-CRM114-Status: GOOD (  12.98  )
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

On Tue, Jul 21, 2026 at 10:26=E2=80=AFAM Daniel Golle <daniel@makrotopia.or=
g> wrote:
>
> it6505->audio.channel_count is zero from allocation until either DP
> link training has run once (it6505_variable_config()) or a valid
> hw_params call has cached a channel count. it6505_enable_audio() can
> be reached before either of those has happened, e.g. from the
> audio-FIFO-error IRQ, which is unmasked unconditionally at poweron.
> it6505_enable_audio_infoframe() then indexes the 8-entry
> audio_info_ca[] table with channel_count - 1, an out-of-bounds stack
> read when channel_count is still 0.
>
> Bail out of it6505_enable_audio_infoframe() when channel_count is not
> yet known instead of indexing with it.
>
> While here, fix the debug print in it6505_audio_setup_hw_params(): on
> the invalid-channel-count path it logged the previously cached
> channel_count instead of the actually-rejected params->cea.channels.
>
> Fixes: b5c84a9edcd4 ("drm/bridge: add it6505 driver")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

